import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../theme/app_theme.dart';
import '../models/lesson_model.dart';
import '../services/hearts_service.dart';
import '../services/review_service.dart';
import '../services/sound_service.dart';
import '../services/srs_service.dart';
import '../services/subscription_service.dart';
import '../widgets/common_widgets.dart';
import '../home/score_screen.dart';
import 'exercise_models.dart';
import 'exercise_generator.dart';
import 'exercise_widgets.dart';

/// Interactive exercise session (v2.1) — replaces the MCQ-only QuizScreen.
/// A regular lesson runs a mixed session (MCQ, match pairs, listen, tap-to-
/// build, fill-blank, speak); a chapter final quiz runs its authored MCQs
/// unchanged, so chapter gating (≥60%) keeps its exact semantics.
class ExerciseSessionScreen extends StatefulWidget {
  final ChapterModel chapter;
  final LessonModel lesson;
  final Color accentColor;
  final bool isChapterQuiz;

  const ExerciseSessionScreen({
    super.key,
    required this.chapter,
    required this.lesson,
    required this.accentColor,
    required this.isChapterQuiz,
  });

  @override
  State<ExerciseSessionScreen> createState() => _ExerciseSessionScreenState();
}

class _ExerciseSessionScreenState extends State<ExerciseSessionScreen>
    with TickerProviderStateMixin {
  late final List<Exercise> _exercises;
  int _index = 0, _score = 0;
  bool _answered = false;
  ExerciseResult? _result;

  /// ❤️ Hearts (Step 5). Premium shows ∞ and never loses hearts.
  int _hearts = HeartsService.maxHearts;
  bool get _unlimitedHearts => SubscriptionService().isPremium;

  final FlutterTts _tts = FlutterTts();
  late ConfettiController _confetti;
  late AnimationController _slideAnim, _feedbackAnim;
  late Animation<Offset> _slide;
  late Animation<double> _fade, _feedbackScale;

  static const _kindLabels = {
    ExerciseKind.mcq: '📝 सही उत्तर चुनें',
    ExerciseKind.listenChoose: '🎧 सुनकर चुनें',
    ExerciseKind.tapToBuild: '🧩 वाक्य बनाएं',
    ExerciseKind.fillBlank: '✏️ खाली जगह भरें',
    ExerciseKind.matchPairs: '🔗 जोड़ी मिलाएं',
    ExerciseKind.speak: '🎤 बोलकर देखें',
  };

  String _labelFor(Exercise e) {
    if (e is TapBuildExercise && e.isSpelling) return '🔤 शब्द बनाएं';
    return _kindLabels[e.kind] ?? '';
  }

  @override
  void initState() {
    super.initState();
    _exercises = widget.isChapterQuiz
        ? ExerciseGenerator.buildChapterQuiz(widget.lesson.type)
        : ExerciseGenerator.buildLessonSession(
            chapterId: widget.chapter.id, lesson: widget.lesson);

    _initTts();
    _confetti =
        ConfettiController(duration: const Duration(milliseconds: 800));
    _slideAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    _slide = Tween<Offset>(begin: const Offset(0.15, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _slideAnim, curve: Curves.easeOut));
    _fade = CurvedAnimation(parent: _slideAnim, curve: Curves.easeOut);
    _feedbackAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _feedbackScale = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _feedbackAnim, curve: Curves.elasticOut));
    _slideAnim.forward();
    HeartsService.current().then((h) {
      if (mounted) setState(() => _hearts = h);
    });
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-IN');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
  }

  Future<void> _speak(String text) async {
    await _tts.stop();
    await _tts.speak(text);
  }

  @override
  void dispose() {
    _tts.stop();
    _confetti.dispose();
    _slideAnim.dispose();
    _feedbackAnim.dispose();
    super.dispose();
  }

  void _onResult(ExerciseResult result) {
    if (_answered) return;
    setState(() {
      _answered = true;
      _result = result;
      if (result.correct) {
        _score++;
        _confetti.play();
      }
    });
    _feedbackAnim.forward();

    // Step 5: sounds + hearts.
    if (result.correct) {
      SoundService().playCorrect();
    } else {
      SoundService().playWrong();
      if (!_unlimitedHearts) {
        HeartsService.loseHeart().then((h) {
          if (mounted) setState(() => _hearts = h);
        });
      }
    }

    // Step 3: collect wrong answers for "Practice Your Mistakes".
    if (!result.correct) {
      final record = ExerciseGenerator.mistakeRecordFor(
          _exercises[_index], widget.chapter.id, widget.lesson.id);
      if (record != null) {
        ReviewService.recordMistake(
          chapterId: record.chapterId,
          lessonId: record.lessonId,
          kind: record.kind,
          key: record.key,
        );
      }
    }
  }

  Future<void> _next() async {
    await _tts.stop();
    if (_index < _exercises.length - 1) {
      setState(() {
        _index++;
        _answered = false;
        _result = null;
      });
      _feedbackAnim.reset();
      _slideAnim.reset();
      _slideAnim.forward();
    } else {
      // Step 4: what was studied in this lesson enters the SRS deck so it
      // resurfaces for review on a spaced schedule.
      if (!widget.isChapterQuiz) {
        SrsService.seedFromLesson(widget.chapter.id, widget.lesson.id);
      }
      final xp = _score * (widget.lesson.totalXP ~/ _exercises.length);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => ScoreScreen(
            score: _score,
            total: _exercises.length,
            chapter: widget.chapter,
            lesson: widget.lesson,
            accentColor: widget.accentColor,
            xpEarned: xp,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    }
  }

  Widget _buildExerciseWidget(Exercise e) {
    switch (e.kind) {
      case ExerciseKind.mcq:
        return McqExerciseWidget(
            key: ValueKey('ex$_index'),
            exercise: e as McqExercise,
            accent: widget.accentColor,
            onResult: _onResult);
      case ExerciseKind.listenChoose:
        return ListenChooseWidget(
            key: ValueKey('ex$_index'),
            exercise: e as ListenChooseExercise,
            accent: widget.accentColor,
            onResult: _onResult,
            speak: _speak);
      case ExerciseKind.tapToBuild:
        return TapBuildWidget(
            key: ValueKey('ex$_index'),
            exercise: e as TapBuildExercise,
            accent: widget.accentColor,
            onResult: _onResult);
      case ExerciseKind.fillBlank:
        return FillBlankWidget(
            key: ValueKey('ex$_index'),
            exercise: e as FillBlankExercise,
            accent: widget.accentColor,
            onResult: _onResult);
      case ExerciseKind.matchPairs:
        return MatchPairsWidget(
            key: ValueKey('ex$_index'),
            exercise: e as MatchPairsExercise,
            accent: widget.accentColor,
            onResult: _onResult);
      case ExerciseKind.speak:
        return SpeakExerciseWidget(
            key: ValueKey('ex$_index'),
            exercise: e as SpeakExercise,
            accent: widget.accentColor,
            onResult: _onResult,
            speak: _speak);
    }
  }

  @override
  Widget build(BuildContext context) {
    final exercise = _exercises[_index];
    final isCorrect = _result?.correct ?? false;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(children: [
        SafeArea(
          child: Column(children: [
            // ── Header: close, progress bar, score badge ──
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              child: Row(children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        boxShadow: AppShadows.card),
                    child: const Icon(Icons.close_rounded,
                        color: AppColors.textSecondary, size: 20),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    child: LinearProgressIndicator(
                        value: (_index + 1) / _exercises.length,
                        minHeight: 8,
                        backgroundColor: AppColors.primaryLight,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            widget.accentColor)),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                // ❤️ Hearts (Step 5) — ∞ for premium.
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      border: Border.all(
                          color: AppColors.accent.withOpacity(0.3))),
                  child: Row(children: [
                    const Text('❤️', style: TextStyle(fontSize: 12)),
                    const SizedBox(width: 3),
                    Text(_unlimitedHearts ? '∞' : '$_hearts',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700)),
                  ]),
                ),
                const SizedBox(width: AppSpacing.sm),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.accentGold.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      border: Border.all(
                          color: AppColors.accentGold.withOpacity(0.3))),
                  child: Row(children: [
                    const Text('⚡', style: TextStyle(fontSize: 12)),
                    const SizedBox(width: 3),
                    Text('$_score/${_exercises.length}',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.accentGold,
                            fontWeight: FontWeight.w700)),
                  ]),
                ),
              ]),
            ),

            // ── Exercise type label + dots ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _labelFor(exercise),
                    style: AppTextStyles.bodyMedium.copyWith(
                        color: widget.accentColor,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: List.generate(
                      _exercises.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: i == _index ? 18 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: i < _index
                                ? AppColors.success
                                : i == _index
                                    ? widget.accentColor
                                    : AppColors.locked,
                            borderRadius:
                                BorderRadius.circular(AppRadius.full)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // ── Current exercise ──
            Expanded(
              child: FadeTransition(
                opacity: _fade,
                child: SlideTransition(
                  position: _slide,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg),
                    child: _buildExerciseWidget(exercise),
                  ),
                ),
              ),
            ),

            // ── Feedback panel ──
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: _answered && _result != null
                  ? ScaleTransition(
                      scale: _feedbackScale,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        decoration: BoxDecoration(
                            color: isCorrect
                                ? AppColors.success.withOpacity(0.08)
                                : AppColors.error.withOpacity(0.06),
                            border: Border(
                                top: BorderSide(
                                    color: isCorrect
                                        ? AppColors.success.withOpacity(0.3)
                                        : AppColors.error
                                            .withOpacity(0.3)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(isCorrect ? '✅' : '❌',
                                  style: const TextStyle(fontSize: 20)),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                    isCorrect
                                        ? 'सही जवाब! शाबाश! 🎉'
                                        : 'गलत! सही उत्तर देखें:',
                                    style: AppTextStyles.headingMedium
                                        .copyWith(
                                            color: isCorrect
                                                ? AppColors.success
                                                : AppColors.error)),
                              ),
                            ]),
                            const SizedBox(height: AppSpacing.sm),
                            Text(_result!.feedback,
                                style: AppTextStyles.bodyMedium),
                            const SizedBox(height: AppSpacing.md),
                            PrimaryButton(
                                label: _index < _exercises.length - 1
                                    ? 'अगला अभ्यास'
                                    : 'परिणाम देखें',
                                onTap: _next,
                                color: isCorrect
                                    ? AppColors.success
                                    : widget.accentColor,
                                emoji: _index < _exercises.length - 1
                                    ? '→'
                                    : '🏆'),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ]),
        ),

        // ── Confetti ──
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
              confettiController: _confetti,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 18,
              maxBlastForce: 20,
              minBlastForce: 8,
              emissionFrequency: 0.3,
              colors: const [
                AppColors.accent,
                AppColors.accentGold,
                AppColors.success,
                AppColors.primary,
                Colors.pink,
              ]),
        ),
      ]),
    );
  }
}
