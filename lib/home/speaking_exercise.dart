import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';
import '../models/lesson_model.dart';
import '../data/speaking_data.dart';
import '../exercises/exercise_generator.dart';
import '../services/speech_service.dart';
import '../services/ad_service.dart';
import '../services/api_service.dart';
import '../services/progress_service.dart';
import '../widgets/common_widgets.dart';
import '../widgets/ad_widgets.dart';

/// 🎤 Speaking Practice — v2.0
///
/// One session = [_sentencesPerSession] sentences for the chapter. For each:
/// listen (TTS) → tap the mic and say it → live transcription → similarity
/// score with pass/retry. XP + coins are awarded at the end of the session.
class SpeakingExerciseScreen extends StatefulWidget {
  final ChapterModel chapter;
  final Color accentColor;

  /// When set, this is a per-lesson practice: sentences come from the
  /// lesson's own bank and passing marks the lesson's practice as complete.
  final LessonModel? lesson;

  const SpeakingExerciseScreen({
    super.key,
    required this.chapter,
    required this.accentColor,
    this.lesson,
  });

  @override
  State<SpeakingExerciseScreen> createState() => _SpeakingExerciseScreenState();
}

/// What the user is doing with the current sentence.
enum _Phase { idle, listening, scored }

class _SpeakingExerciseScreenState extends State<SpeakingExerciseScreen>
    with TickerProviderStateMixin {
  static const int _sentencesPerSession = 5;
  static const int _xpPerPassedSentence = 2;

  List<SpeakingSentence> _sentences = [];

  /// Pass threshold scales with the chapter's level (55/60/70/75%).
  late final int _passPercent =
      ExerciseGenerator.passPercentForChapter(widget.chapter.id);
  int _index = 0;
  _Phase _phase = _Phase.idle;
  String _transcript = '';
  SpeechScore? _score;
  int _passedCount = 0;
  bool _sessionDone = false;
  bool _rewardsGiven = false;
  int _xpAwarded = 0;
  bool _coinsAwarded = false;
  bool _lessonPracticeDone = false;

  // Gate state — resolved once in initState.
  bool _checkingGate = true;
  bool _limitReached = false;
  int _sessionsUsed = 0;

  // Speech-to-text failure (unsupported device / permission denied).
  bool _sttFailed = false;

  final FlutterTts _tts = FlutterTts();
  bool _speaking = false;

  late final AnimationController _pulse;
  late final ConfettiController _confetti;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) _pulse.reverse();
        if (s == AnimationStatus.dismissed && _phase == _Phase.listening) {
          _pulse.forward();
        }
      });
    _confetti = ConfettiController(duration: const Duration(seconds: 2));
    _initTts();
    _initSession();
  }

  Future<void> _initSession() async {
    await _prepareSentences();
    await _checkDailyLimit();
  }

  /// Pick this session's sentences: shuffle the chapter bank but serve the
  /// sentences NOT used last session first, so two back-to-back sessions
  /// never show the same set. Last session's picks persist in prefs.
  /// Word-level chapters practice words/phrases; later chapters sentences.
  bool get _wordMode =>
      widget.chapter.id <= SpeakingData.lastWordLevelChapter;

  Future<void> _prepareSentences() async {
    final lesson = widget.lesson;
    final pool = lesson != null
        ? SpeakingData.practiceItemsForLesson(widget.chapter.id, lesson.id)
        : SpeakingData.practiceItemsForChapter(
            widget.chapter.id,
            widget.chapter.lessons
                .where((l) => l.title != 'Chapter Quiz')
                .map((l) => l.id)
                .toList(),
          );
    final prefs = await SharedPreferences.getInstance();
    final key = lesson != null
        ? 'lw_speak_last_ch${widget.chapter.id}_les${lesson.id}'
        : 'lw_speak_last_ch${widget.chapter.id}';
    final lastUsed = (prefs.getStringList(key) ?? const [])
        .map(int.tryParse)
        .whereType<int>()
        .toSet();

    final fresh = <int>[];
    final seen = <int>[];
    for (var i = 0; i < pool.length; i++) {
      (lastUsed.contains(i) ? seen : fresh).add(i);
    }
    fresh.shuffle();
    seen.shuffle();
    final picked =
        [...fresh, ...seen].take(_sentencesPerSession).toList();
    await prefs.setStringList(
        key, picked.map((i) => i.toString()).toList());
    _sentences = picked.map((i) => pool[i]).toList();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-IN');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _speaking = false);
    });
  }

  /// Premium users are unlimited; free users get
  /// [SpeechService.freeSessionsPerDay] sessions per day.
  /// Debug builds skip the limit so device testing is never blocked.
  Future<void> _checkDailyLimit() async {
    final used = await SpeechService().sessionsUsedToday();
    if (!mounted) return;
    setState(() {
      _sessionsUsed = used;
      _limitReached = !kDebugMode &&
          !AdService().isPremium &&
          used >= SpeechService.freeSessionsPerDay;
      _checkingGate = false;
    });
  }

  @override
  void dispose() {
    _tts.stop();
    SpeechService().cancel();
    _pulse.dispose();
    _confetti.dispose();
    super.dispose();
  }

  SpeakingSentence get _current => _sentences[_index];

  // ─── TTS ────────────────────────────────────────────────────────────────

  Future<void> _speakTarget() async {
    if (_phase == _Phase.listening) return; // never talk over the mic
    await _tts.stop();
    setState(() => _speaking = true);
    await _tts.speak(_current.en);
  }

  // ─── Mic ────────────────────────────────────────────────────────────────

  Future<void> _startListening() async {
    await _tts.stop();
    _speaking = false;

    final ok = await SpeechService().listen(onResult: (words, isFinal) {
      if (!mounted) return;
      setState(() => _transcript = words);
      if (isFinal) _finishAttempt(words);
    });

    if (!mounted) return;
    if (!ok) {
      setState(() => _sttFailed = true);
      return;
    }
    setState(() {
      _phase = _Phase.listening;
      _transcript = '';
      _score = null;
    });
    _pulse.forward();
  }

  Future<void> _stopListening() async {
    await SpeechService().stop();
    // A final result usually follows stop(); if recognition produced nothing,
    // score whatever partial transcript we have so the user isn't stuck.
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted && _phase == _Phase.listening) _finishAttempt(_transcript);
    });
  }

  void _finishAttempt(String words) {
    if (_phase != _Phase.listening) return;
    _pulse.stop();
    _pulse.value = 0;
    final score = SpeechService.scoreAttempt(_current.en, words);
    setState(() {
      _transcript = words;
      _score = score;
      _phase = _Phase.scored;
    });
    if (score.percent >= _passPercent) {
      _passedCount++;
      _confetti.play();
    }
  }

  // ─── Session progression ────────────────────────────────────────────────

  void _retry() => setState(() {
        _phase = _Phase.idle;
        _transcript = '';
        _score = null;
      });

  Future<void> _next() async {
    if (_index < _sentences.length - 1) {
      setState(() {
        _index++;
        _phase = _Phase.idle;
        _transcript = '';
        _score = null;
      });
      return;
    }
    await _finishSession();
  }

  Future<void> _finishSession() async {
    if (!_rewardsGiven) {
      _rewardsGiven = true;
      await SpeechService().recordSession();
      _xpAwarded = _passedCount * _xpPerPassedSentence;
      if (_xpAwarded > 0) {
        await ProgressService.addBonusXP(_xpAwarded);
      }
      // Same dual-write pattern as the quiz coin award.
      if (_passedCount >= 3) {
        await AdService().awardQuizCoins();
        try {
          await ApiService.addCoins(AdService.coinsPerQuiz);
        } catch (_) {}
        _coinsAwarded = true;
        // Per-lesson practice counts as completed once the session is passed.
        if (widget.lesson != null) {
          await SpeechService()
              .markLessonPracticed(widget.chapter.id, widget.lesson!.id);
          _lessonPracticeDone = true;
          // Fire-and-forget backend sync so the ✓ survives logout/reinstall.
          try {
            await ApiService.completeSpeaking(
              chapterId: widget.chapter.id,
              lessonId: widget.lesson!.id,
              score: (_passedCount * 100 ~/ _sentences.length),
            );
          } catch (_) {}
        }
      }
    }
    if (!mounted) return;
    setState(() => _sessionDone = true);
    if (_passedCount >= 3) _confetti.play();
  }

  // ─── UI ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      bottomNavigationBar: const LingoBannerAd(),
      body: Stack(children: [
        SafeArea(
          child: Column(children: [
            _buildHeader(),
            Expanded(
              child: _checkingGate
                  ? const Center(child: CircularProgressIndicator())
                  : _limitReached
                      ? _buildLimitReached()
                      : _sttFailed
                          ? _buildSttUnavailable()
                          : _sessionDone
                              ? _buildSummary()
                              : _buildExercise(),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confetti,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 20,
            maxBlastForce: 25,
            minBlastForce: 8,
            emissionFrequency: 0.1,
            gravity: 0.3,
            colors: const [
              AppColors.accent,
              AppColors.accentGold,
              AppColors.success,
              AppColors.primary,
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.sm, AppSpacing.sm, AppSpacing.lg, AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.accentColor, widget.accentColor.withOpacity(0.8)],
        ),
        borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppRadius.lg)),
      ),
      child: Column(children: [
        Row(children: [
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🎤 बोलने का अभ्यास',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    )),
                Text(
                  widget.lesson != null
                      ? 'पाठ ${widget.lesson!.id}: ${widget.lesson!.titleHindi}'
                      : 'अध्याय ${widget.chapter.id}: ${widget.chapter.titleHindi}',
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (!_checkingGate && !_limitReached && !_sessionDone)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(
                '${_index + 1}/${_sentences.length}',
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
        ]),
        if (!_checkingGate && !_limitReached && !_sessionDone) ...[
          const SizedBox(height: AppSpacing.sm),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.sm),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.full),
              child: LinearProgressIndicator(
                value: (_index + (_phase == _Phase.scored ? 1 : 0)) /
                    _sentences.length,
                minHeight: 6,
                backgroundColor: Colors.white.withOpacity(0.25),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ]),
    );
  }

  // ─── Main exercise body ─────────────────────────────────────────────────

  Widget _buildExercise() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(children: [
        // ── Target sentence card ──
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.accentColor,
                widget.accentColor.withOpacity(0.75)
              ],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
            boxShadow: [
              BoxShadow(
                color: widget.accentColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(children: [
            Text(_wordMode ? 'इसे बोलिए 👇' : 'यह वाक्य बोलिए 👇',
                style: AppTextStyles.labelSmall
                    .copyWith(color: Colors.white70)),
            const SizedBox(height: AppSpacing.md),
            _phase == _Phase.scored && _score != null
                ? _buildWordChips()
                : Text(
                    _current.en,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayMedium
                        .copyWith(color: Colors.white),
                  ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _current.hi,
              textAlign: TextAlign.center,
              style:
                  AppTextStyles.bodyMedium.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: AppSpacing.md),
            // Listen button
            GestureDetector(
              onTap: _speaking
                  ? () {
                      _tts.stop();
                      setState(() => _speaking = false);
                    }
                  : _speakTarget,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  border:
                      Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    _speaking
                        ? Icons.stop_rounded
                        : Icons.volume_up_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(_speaking ? 'रोकें' : 'सुनें',
                      style: AppTextStyles.labelSmall
                          .copyWith(color: Colors.white)),
                ]),
              ),
            ),
          ]),
        ),

        const SizedBox(height: AppSpacing.lg),

        // ── Transcription / feedback area ──
        if (_phase == _Phase.listening || _transcript.isNotEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(
                color: _phase == _Phase.listening
                    ? widget.accentColor.withOpacity(0.4)
                    : AppColors.locked,
              ),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _phase == _Phase.listening
                      ? '🎙️ सुन रहे हैं... बोलिए!'
                      : 'आपने कहा:',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 6),
                Text(
                  _transcript.isEmpty ? '...' : _transcript,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),

        if (_phase == _Phase.scored && _score != null) ...[
          const SizedBox(height: AppSpacing.md),
          _buildScoreCard(),
        ],

        const SizedBox(height: AppSpacing.xl),

        // ── Mic button ──
        if (_phase != _Phase.scored) _buildMicButton(),

        // ── Post-score actions ──
        if (_phase == _Phase.scored && _score != null) ...[
          PrimaryButton(
            label: _index < _sentences.length - 1
                ? 'अगला वाक्य'
                : 'परिणाम देखें',
            emoji: _index < _sentences.length - 1 ? '➡️' : '🏆',
            color: _score!.percent >= _passPercent
                ? AppColors.success
                : widget.accentColor,
            onTap: _next,
          ),
          const SizedBox(height: AppSpacing.md),
          GestureDetector(
            onTap: _retry,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(color: AppColors.locked, width: 2),
              ),
              child: Text(
                '🔁 फिर से बोलें',
                textAlign: TextAlign.center,
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.textSecondary),
              ),
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
      ]),
    );
  }

  /// Target sentence rendered word-by-word: green = heard, red = missed.
  Widget _buildWordChips() {
    final words = _current.en
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    final matches = _score!.wordMatches;
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 6,
      runSpacing: 6,
      children: List.generate(words.length, (i) {
        final ok = i < matches.length && matches[i];
        return Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: ok
                ? Colors.white.withOpacity(0.25)
                : AppColors.error.withOpacity(0.75),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(
            words[i],
            style: AppTextStyles.labelLarge.copyWith(
              color: Colors.white,
              fontSize: 16,
              decoration: ok ? null : TextDecoration.underline,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildScoreCard() {
    final s = _score!;
    final passed = s.percent >= _passPercent;
    final color = passed ? AppColors.success : AppColors.warning;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(children: [
        Text(passed ? '🌟' : '💪', style: const TextStyle(fontSize: 32)),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                passed ? 'शाबाश! बहुत अच्छा बोला!' : 'कोशिश अच्छी थी!',
                style: AppTextStyles.labelLarge.copyWith(color: color),
              ),
              Text(
                passed
                    ? 'आपका उच्चारण ${s.percent}% सही रहा।'
                    : '${s.percent}% मिला — $_passPercent% चाहिए। लाल शब्द फिर से सुनकर बोलें।',
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        Text(
          '${s.percent}%',
          style: AppTextStyles.displayMedium.copyWith(color: color),
        ),
      ]),
    );
  }

  Widget _buildMicButton() {
    final listening = _phase == _Phase.listening;
    return Column(children: [
      GestureDetector(
        onTap: listening ? _stopListening : _startListening,
        child: AnimatedBuilder(
          animation: _pulse,
          builder: (context, child) {
            final scale = listening ? 1.0 + _pulse.value * 0.12 : 1.0;
            return Transform.scale(scale: scale, child: child);
          },
          child: Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: listening
                    ? [AppColors.error, const Color(0xFFFF8E53)]
                    : [widget.accentColor, widget.accentColor.withOpacity(0.7)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (listening ? AppColors.error : widget.accentColor)
                      .withOpacity(0.4),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              listening ? Icons.stop_rounded : Icons.mic_rounded,
              color: Colors.white,
              size: 42,
            ),
          ),
        ),
      ),
      const SizedBox(height: AppSpacing.md),
      Text(
        listening ? 'बोलना पूरा होने पर रुकें' : 'माइक दबाकर बोलिए',
        style: AppTextStyles.bodyMedium
            .copyWith(color: AppColors.textSecondary),
      ),
    ]);
  }

  // ─── Session summary ────────────────────────────────────────────────────

  Widget _buildSummary() {
    final great = _passedCount >= 3;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(children: [
        const SizedBox(height: AppSpacing.xl),
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: great
                  ? [AppColors.accentGold, const Color(0xFFFF8E53)]
                  : [widget.accentColor, widget.accentColor.withOpacity(0.7)],
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (great ? AppColors.accentGold : widget.accentColor)
                    .withOpacity(0.4),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Center(
            child: Text(great ? '🏆' : '🎤',
                style: const TextStyle(fontSize: 52)),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          great ? 'कमाल की बोली! 🎉' : 'अच्छा अभ्यास! 💪',
          style: AppTextStyles.displayLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.xl),
            boxShadow: AppShadows.card,
          ),
          child: Column(children: [
            Text(
              '$_passedCount/${_sentences.length}',
              style: AppTextStyles.displayLarge.copyWith(
                fontSize: 56,
                color: great ? AppColors.success : widget.accentColor,
              ),
            ),
            Text('वाक्य सही बोले', style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppSpacing.md),
            const Divider(),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat('⚡', '+$_xpAwarded', 'XP कमाए', AppColors.accentGold),
                _stat('✅', '$_passedCount', 'सही', AppColors.success),
                if (_coinsAwarded)
                  _stat('🪙', '+${AdService.coinsPerQuiz}', 'सिक्के',
                      AppColors.accentGold),
              ],
            ),
          ]),
        ),
        // ── Per-lesson completion banner ──
        if (_lessonPracticeDone && widget.lesson != null) ...[
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.06),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border:
                  Border.all(color: AppColors.success.withOpacity(0.3)),
            ),
            child: Row(children: [
              const Text('✅', style: TextStyle(fontSize: 24)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('इस पाठ का बोलने का अभ्यास पूरा!',
                        style: AppTextStyles.labelLarge
                            .copyWith(color: AppColors.success)),
                    Text('पाठ ${widget.lesson!.id}: ${widget.lesson!.title}',
                        style: AppTextStyles.bodyMedium
                            .copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ]),
          ),
        ],
        if (!AdService().isPremium) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            'आज ${(_sessionsUsed + 1).clamp(0, SpeechService.freeSessionsPerDay)}/${SpeechService.freeSessionsPerDay} मुफ़्त अभ्यास हो गए • Premium में असीमित',
            style: AppTextStyles.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: AppSpacing.xl),
        PrimaryButton(
          label: 'वापस जाएं',
          emoji: '📚',
          color: AppColors.success,
          onTap: () => Navigator.pop(context),
        ),
        const SizedBox(height: AppSpacing.lg),
      ]),
    );
  }

  Widget _stat(String e, String v, String l, Color c) => Column(children: [
        Text(e, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 4),
        Text(v, style: AppTextStyles.headingLarge.copyWith(color: c)),
        Text(l, style: AppTextStyles.labelSmall),
      ]);

  // ─── Gates / fallbacks ──────────────────────────────────────────────────

  Widget _buildLimitReached() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎤', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            Text('आज का मुफ़्त अभ्यास पूरा!',
                style: AppTextStyles.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'मुफ़्त में रोज़ ${SpeechService.freeSessionsPerDay} बोलने के अभ्यास मिलते हैं। कल फिर आइए, या Premium लेकर असीमित अभ्यास करें!',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'ठीक है',
              emoji: '👍',
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSttUnavailable() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🎙️', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            Text('माइक उपलब्ध नहीं है',
                style: AppTextStyles.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'बोलने के अभ्यास के लिए माइक की अनुमति ज़रूरी है। Settings → Apps → LingoWave → Permissions में जाकर Microphone चालू करें, फिर दोबारा कोशिश करें।',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            PrimaryButton(
              label: 'फिर से कोशिश करें',
              emoji: '🔄',
              onTap: () {
                setState(() => _sttFailed = false);
                _startListening();
              },
            ),
            const SizedBox(height: AppSpacing.md),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text('वापस जाएं',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.textSecondary)),
            ),
          ],
        ),
      ),
    );
  }
}
