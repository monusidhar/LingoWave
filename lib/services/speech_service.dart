import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Result of comparing what the user said against the target sentence.
class SpeechScore {
  /// 0–100. Best of word-overlap and character-level similarity.
  final int percent;

  /// One entry per target word: true if the user said it.
  final List<bool> wordMatches;

  const SpeechScore({required this.percent, required this.wordMatches});

  bool get passed => percent >= SpeechService.passPercent;
}

/// Central Speech Service for LingoWave — wraps speech_to_text and owns the
/// pronunciation-similarity scoring plus the free-tier daily session limit.
class SpeechService {
  static final SpeechService _instance = SpeechService._internal();
  factory SpeechService() => _instance;
  SpeechService._internal();

  // ─── SharedPreferences Keys ───────────────────────────────────────────────
  static const String _prefix = 'lw_';
  static const String _sessionDateKey = '${_prefix}speak_date';
  static const String _sessionCountKey = '${_prefix}speak_sessions';

  // ─── Config ───────────────────────────────────────────────────────────────
  /// Minimum similarity to pass a sentence.
  static const int passPercent = 70;

  /// Free users get this many speaking sessions per day; premium is unlimited.
  static const int freeSessionsPerDay = 5;

  // ─── Internal State ───────────────────────────────────────────────────────
  final SpeechToText _stt = SpeechToText();
  bool _initialized = false;
  bool _available = false;
  String? _localeId;
  String _lastError = '';

  bool get isAvailable => _available;
  bool get isListening => _stt.isListening;
  String get lastError => _lastError;

  // ══════════════════════════════════════════════════════════════════════════
  // INITIALISATION
  // ══════════════════════════════════════════════════════════════════════════

  /// Initialise the recognizer (triggers the mic permission prompt the first
  /// time). Safe to call repeatedly. Returns whether STT is usable.
  Future<bool> initialize() async {
    if (kIsWeb) return false;
    if (_initialized) return _available;
    try {
      _available = await _stt.initialize(
        onError: (SpeechRecognitionError e) => _lastError = e.errorMsg,
        onStatus: (_) {},
      );
      _initialized = true;
      if (_available) await _pickEnglishLocale();
    } catch (e) {
      _available = false;
      _lastError = e.toString();
    }
    return _available;
  }

  /// Prefer Indian English, then any English locale, else system default.
  Future<void> _pickEnglishLocale() async {
    try {
      final locales = await _stt.locales();
      final ids = locales.map((l) => l.localeId).toList();
      _localeId = ids.firstWhere(
        (id) => id.replaceAll('-', '_').toLowerCase() == 'en_in',
        orElse: () => ids.firstWhere(
          (id) => id.toLowerCase().startsWith('en'),
          orElse: () => '',
        ),
      );
      if (_localeId!.isEmpty) _localeId = null;
    } catch (_) {
      _localeId = null;
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LISTENING
  // ══════════════════════════════════════════════════════════════════════════

  /// Start listening. [onResult] fires with the running transcription and
  /// whether that result is final. Returns false if STT was not available.
  Future<bool> listen({
    required void Function(String words, bool isFinal) onResult,
  }) async {
    if (!await initialize()) return false;
    await _stt.listen(
      onResult: (SpeechRecognitionResult r) =>
          onResult(r.recognizedWords, r.finalResult),
      localeId: _localeId,
      listenFor: const Duration(seconds: 15),
      pauseFor: const Duration(seconds: 3),
      listenOptions: SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
      ),
    );
    return true;
  }

  Future<void> stop() async => _stt.stop();

  Future<void> cancel() async => _stt.cancel();

  // ══════════════════════════════════════════════════════════════════════════
  // SCORING
  // ══════════════════════════════════════════════════════════════════════════

  /// Compare [spoken] against [target] and return a similarity score.
  static SpeechScore scoreAttempt(String target, String spoken) {
    final targetWords = _normalize(target);
    final spokenWords = _normalize(spoken);

    if (targetWords.isEmpty) {
      return const SpeechScore(percent: 0, wordMatches: []);
    }

    // Word overlap: each target word is matched (exact or near via
    // Levenshtein) against the pool of spoken words, consuming matches so
    // duplicates count correctly.
    final pool = List<String>.from(spokenWords);
    final matches = <bool>[];
    int matched = 0;
    for (final w in targetWords) {
      final idx = pool.indexWhere((s) => _wordsClose(w, s));
      if (idx != -1) {
        pool.removeAt(idx);
        matches.add(true);
        matched++;
      } else {
        matches.add(false);
      }
    }
    final wordScore = matched / targetWords.length;

    // Character-level similarity on the joined strings as a fallback — kind
    // to recognizers that merge or split words ("ice cream" vs "icecream").
    final a = targetWords.join(' ');
    final b = spokenWords.join(' ');
    final maxLen = a.length > b.length ? a.length : b.length;
    final charScore =
        maxLen == 0 ? 0.0 : 1.0 - (_levenshtein(a, b) / maxLen);

    final percent = ((wordScore > charScore ? wordScore : charScore) * 100)
        .round()
        .clamp(0, 100);
    return SpeechScore(percent: percent, wordMatches: matches);
  }

  /// Lowercase, strip punctuation, split into words.
  static List<String> _normalize(String s) => s
      .toLowerCase()
      .replaceAll(RegExp(r"[^a-z0-9\s']"), ' ')
      .replaceAll("'", '')
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .toList();

  /// Words count as matching when identical or within a small edit distance
  /// (accent/recognition slack: 1 edit for short words, 2 for longer ones).
  static bool _wordsClose(String a, String b) {
    if (a == b) return true;
    final tolerance = a.length >= 6 ? 2 : (a.length >= 4 ? 1 : 0);
    if (tolerance == 0) return false;
    if ((a.length - b.length).abs() > tolerance) return false;
    return _levenshtein(a, b) <= tolerance;
  }

  static int _levenshtein(String a, String b) {
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;
    var prev = List<int>.generate(b.length + 1, (i) => i);
    final curr = List<int>.filled(b.length + 1, 0);
    for (var i = 0; i < a.length; i++) {
      curr[0] = i + 1;
      for (var j = 0; j < b.length; j++) {
        final cost = a[i] == b[j] ? 0 : 1;
        curr[j + 1] = [
          curr[j] + 1,
          prev[j + 1] + 1,
          prev[j] + cost,
        ].reduce((x, y) => x < y ? x : y);
      }
      prev = List<int>.from(curr);
    }
    return prev[b.length];
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PER-LESSON PRACTICE COMPLETION
  // ══════════════════════════════════════════════════════════════════════════

  static String _lessonDoneKey(int chapterId, int lessonId) =>
      '${_prefix}speak_done_ch${chapterId}_les$lessonId';

  /// Whether this lesson's speaking practice has been passed at least once.
  Future<bool> isLessonPracticed(int chapterId, int lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_lessonDoneKey(chapterId, lessonId)) ?? false;
  }

  Future<void> markLessonPracticed(int chapterId, int lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_lessonDoneKey(chapterId, lessonId), true);
  }

  /// Rewrite local practiced flags from the backend list (login restore).
  /// Each entry: {chapterId, lessonId, ...}.
  Future<void> restorePracticedFromBackend(List<dynamic> records) async {
    final prefs = await SharedPreferences.getInstance();
    for (final r in records) {
      final chapterId = r['chapterId'];
      final lessonId = r['lessonId'];
      if (chapterId is int && lessonId is int) {
        await prefs.setBool(_lessonDoneKey(chapterId, lessonId), true);
      }
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // DAILY FREE LIMIT
  // ══════════════════════════════════════════════════════════════════════════

  /// Sessions already used today (resets each calendar day).
  Future<int> sessionsUsedToday() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(_sessionDateKey) != _todayStr()) return 0;
    return prefs.getInt(_sessionCountKey) ?? 0;
  }

  /// Record one completed session against today's quota.
  Future<void> recordSession() async {
    final prefs = await SharedPreferences.getInstance();
    final today = _todayStr();
    final count =
        prefs.getString(_sessionDateKey) == today ? (prefs.getInt(_sessionCountKey) ?? 0) : 0;
    await prefs.setString(_sessionDateKey, today);
    await prefs.setInt(_sessionCountKey, count + 1);
  }

  String _todayStr() {
    final d = DateTime.now();
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}
