import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/speaking_data.dart';
import '../data/vocab_data.dart';

/// One item in the spaced-repetition deck. Same content identity scheme as
/// MistakeRecord so review exercises can be regenerated the same way:
/// kind 'vocab' → word in the lesson's vocab bank; 'sentence' → sentence in
/// the speaking bank.
class SrsItem {
  final int chapterId;
  final int lessonId;
  final String kind;
  final String key;

  /// Leitner box index into [SrsService.intervals].
  final int box;

  /// Due date as 'yyyy-MM-dd' — ISO strings compare lexicographically.
  final String due;

  const SrsItem({
    required this.chapterId,
    required this.lessonId,
    required this.kind,
    required this.key,
    this.box = 0,
    required this.due,
  });

  String get id => 'ch${chapterId}_les${lessonId}_${kind}_$key';

  Map<String, dynamic> toJson() =>
      {'c': chapterId, 'l': lessonId, 'k': kind, 'q': key, 'b': box, 'd': due};

  static SrsItem? fromJson(dynamic j) {
    if (j is! Map) return null;
    final c = j['c'], l = j['l'], k = j['k'], q = j['q'], d = j['d'];
    if (c is! int || l is! int || k is! String || q is! String || d is! String) {
      return null;
    }
    return SrsItem(
      chapterId: c,
      lessonId: l,
      kind: k,
      key: q,
      box: j['b'] is int ? j['b'] as int : 0,
      due: d,
    );
  }

  SrsItem copyWith({int? box, String? due}) => SrsItem(
        chapterId: chapterId,
        lessonId: lessonId,
        kind: kind,
        key: key,
        box: box ?? this.box,
        due: due ?? this.due,
      );
}

/// Spaced repetition (Step 4, v2.3) — a lightweight Leitner scheduler over
/// the words/sentences the learner has actually studied. Local-first
/// (SharedPreferences JSON, `lw_` prefix so logout clears it), same pattern
/// as ReviewService. Every method takes an optional [now] so tests (and a
/// future debug screen) can fast-forward time.
class SrsService {
  static const String _storeKey = 'lw_srs';

  /// Review intervals in days per Leitner box. Correct → next box; wrong →
  /// back to box 0.
  static const List<int> intervals = [1, 3, 7, 14, 30, 60];

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static String _duePlusDays(DateTime now, int days) =>
      _dateStr(DateTime(now.year, now.month, now.day + days));

  static Future<List<SrsItem>> getAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storeKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return [];
      return list.map(SrsItem.fromJson).whereType<SrsItem>().toList();
    } catch (_) {
      return [];
    }
  }

  /// Add a completed lesson's items to the deck (first review: tomorrow).
  /// Idempotent — items already in the deck keep their schedule.
  static Future<int> seedFromLesson(int chapterId, int lessonId,
      {DateTime? now}) async {
    now ??= DateTime.now();
    final vocab = chapterId <= SpeakingData.lastWordLevelChapter
        ? VocabData.forLesson(chapterId, lessonId)
        : null;
    final source = vocab ?? SpeakingData.forLesson(chapterId, lessonId);
    final kind = vocab != null ? 'vocab' : 'sentence';

    final deck = await getAll();
    final known = deck.map((i) => i.id).toSet();
    var added = 0;
    for (final s in source) {
      final item = SrsItem(
        chapterId: chapterId,
        lessonId: lessonId,
        kind: kind,
        key: s.en,
        box: 0,
        due: _duePlusDays(now, intervals[0]),
      );
      if (known.contains(item.id)) continue;
      deck.add(item);
      added++;
    }
    if (added > 0) await _save(deck);
    return added;
  }

  /// Items due on or before [now], soonest-due first.
  static Future<List<SrsItem>> dueItems({DateTime? now}) async {
    now ??= DateTime.now();
    final today = _dateStr(now);
    final due = (await getAll()).where((i) => i.due.compareTo(today) <= 0).toList()
      ..sort((a, b) => a.due.compareTo(b.due));
    return due;
  }

  static Future<int> dueCount({DateTime? now}) async =>
      (await dueItems(now: now)).length;

  /// Apply a review answer: correct climbs a box (longer interval), wrong
  /// falls back to box 0 (due again tomorrow).
  static Future<void> applyResult(SrsItem item, bool correct,
      {DateTime? now}) async {
    now ??= DateTime.now();
    final deck = await getAll();
    final idx = deck.indexWhere((i) => i.id == item.id);
    if (idx == -1) return;
    final newBox = correct
        ? (deck[idx].box + 1).clamp(0, intervals.length - 1)
        : 0;
    deck[idx] = deck[idx]
        .copyWith(box: newBox, due: _duePlusDays(now, intervals[newBox]));
    await _save(deck);
  }

  /// Drop an item whose source content no longer exists.
  static Future<void> removeStale(SrsItem item) async {
    final deck = await getAll();
    deck.removeWhere((i) => i.id == item.id);
    await _save(deck);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storeKey);
  }

  static Future<void> _save(List<SrsItem> deck) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _storeKey, jsonEncode(deck.map((i) => i.toJson()).toList()));
  }
}
