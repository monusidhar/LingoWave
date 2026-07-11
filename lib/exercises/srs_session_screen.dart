import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../theme/app_theme.dart';
import '../services/progress_service.dart';
import '../services/review_service.dart';
import '../services/sound_service.dart';
import '../services/srs_service.dart';
import '../widgets/ad_widgets.dart';
import '../widgets/common_widgets.dart';
import 'exercise_models.dart';
import 'exercise_generator.dart';
import 'exercise_widgets.dart';

/// 📆 Daily spaced-repetition review (Step 4, v2.3).
///
/// Drills the items due today. A correct answer pushes the item to a longer
/// interval (1→3→7→14→30→60 days); a wrong answer sends it back to day 1.
class SrsSessionScreen extends StatefulWidget {
  const SrsSessionScreen({super.key});

  @override
  State<SrsSessionScreen> createState() => _SrsSessionScreenState();
}

class _SrsSessionScreenState extends State<SrsSessionScreen>
    with TickerProviderStateMixin {
  static const int _itemsPerSession = 10;
  static const int _xpPerCorrect = 2;
  static const Color _accent = AppColors.primary;

  final List<MapEntry<SrsItem, Exercise>> _items = [];
  bool _loading = true;
  int _index = 0, _correct = 0;
  bool _answered = false;
  bool _done = false;
  bool _rewardsGiven = false;
  int _dueAfter = 0;
  ExerciseResult? _result;

  final FlutterTts _tts = FlutterTts();
  late ConfettiController _confetti;
  late AnimationController _feedbackAnim;
  late Animation<double> _feedbackScale;

  @override
  void initState() {
    super.initState();
    _confetti =
        ConfettiController(duration: const Duration(milliseconds: 800));
    _feedbackAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _feedbackScale = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _feedbackAnim, curve: Curves.elasticOut));
    _initTts();
    _loadSession();
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

  Future<void> _loadSession() async {
    final due = await SrsService.dueItems();
    final items = <MapEntry<SrsItem, Exercise>>[];
    for (final item in due) {
      if (items.length >= _itemsPerSession) break;
      // Reuse the mistake-review generator — same content identity scheme.
      final exercise = ExerciseGenerator.buildReviewExercise(MistakeRecord(
        chapterId: item.chapterId,
        lessonId: item.lessonId,
        kind: item.kind,
        key: item.key,
        timestamp: 0,
      ));
      if (exercise == null) {
        await SrsService.removeStale(item);
        continue;
      }
      items.add(MapEntry(item, exercise));
    }
    if (!mounted) return;
    setState(() {
      _items.addAll(items);
      _loading = false;
    });
  }

  @override
  void dispose() {
    _tts.stop();
    _confetti.dispose();
    _feedbackAnim.dispose();
    super.dispose();
  }

  void _onResult(ExerciseResult result) {
    if (_answered) return;
    setState(() {
      _answered = true;
      _result = result;
      if (result.correct) {
        _correct++;
        _confetti.play();
      }
    });
    _feedbackAnim.forward();
    result.correct
        ? SoundService().playCorrect()
        : SoundService().playWrong();
    SrsService.applyResult(_items[_index].key, result.correct);
  }

  Future<void> _next() async {
    await _tts.stop();
    if (_index < _items.length - 1) {
      setState(() {
        _index++;
        _answered = false;
        _result = null;
      });
      _feedbackAnim.reset();
    } else {
      if (!_rewardsGiven) {
        _rewardsGiven = true;
        if (_correct > 0) {
          await ProgressService.addBonusXP(_correct * _xpPerCorrect);
        }
      }
      final due = await SrsService.dueCount();
      if (!mounted) return;
      setState(() {
        _dueAfter = due;
        _done = true;
      });
      if (_correct >= (_items.length / 2).ceil()) _confetti.play();
    }
  }

  Widget _buildExerciseWidget(Exercise e) {
    switch (e.kind) {
      case ExerciseKind.mcq:
        return McqExerciseWidget(
            key: ValueKey('srs$_index'),
            exercise: e as McqExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.listenChoose:
        return ListenChooseWidget(
            key: ValueKey('srs$_index'),
            exercise: e as ListenChooseExercise,
            accent: _accent,
            onResult: _onResult,
            speak: _speak);
      case ExerciseKind.tapToBuild:
        return TapBuildWidget(
            key: ValueKey('srs$_index'),
            exercise: e as TapBuildExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.fillBlank:
        return FillBlankWidget(
            key: ValueKey('srs$_index'),
            exercise: e as FillBlankExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.matchPairs:
        return MatchPairsWidget(
            key: ValueKey('srs$_index'),
            exercise: e as MatchPairsExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.speak:
        return SpeakExerciseWidget(
            key: ValueKey('srs$_index'),
            exercise: e as SpeakExercise,
            accent: _accent,
            onResult: _onResult,
            speak: _speak);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      bottomNavigationBar: const LingoBannerAd(),
      body: Stack(children: [
        SafeArea(
          child: _loading
              ? const Center(child: CircularProgressIndicator())
              : _items.isEmpty
                  ? _buildEmpty()
                  : _done
                      ? _buildSummary()
                      : _buildSession(),
        ),
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
              ]),
        ),
      ]),
    );
  }

  Widget _buildSession() {
    final isCorrect = _result?.correct ?? false;
    return Column(children: [
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('📆 आज का रिव्यू', style: AppTextStyles.headingMedium),
                Text('${_index + 1}/${_items.length}',
                    style: AppTextStyles.labelSmall),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.12),
                borderRadius: BorderRadius.circular(AppRadius.full),
                border:
                    Border.all(color: AppColors.success.withOpacity(0.3))),
            child: Text('✅ $_correct',
                style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.success, fontWeight: FontWeight.w700)),
          ),
        ]),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.full),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: LinearProgressIndicator(
              value: (_index + 1) / _items.length,
              minHeight: 8,
              backgroundColor: AppColors.primaryLight,
              valueColor: const AlwaysStoppedAnimation<Color>(_accent)),
        ),
      ),
      const SizedBox(height: AppSpacing.md),
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: _buildExerciseWidget(_items[_index].value),
        ),
      ),
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
                                  : AppColors.error.withOpacity(0.3)))),
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
                                  ? 'याद है! अगली बार और देर से पूछेंगे 🎉'
                                  : 'भूल गए — कल फिर पूछेंगे:',
                              style: AppTextStyles.headingMedium.copyWith(
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
                          label: _index < _items.length - 1
                              ? 'अगला'
                              : 'परिणाम देखें',
                          onTap: _next,
                          color: isCorrect ? AppColors.success : _accent,
                          emoji: _index < _items.length - 1 ? '→' : '🏆'),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    ]);
  }

  Widget _buildSummary() {
    final great = _correct >= (_items.length / 2).ceil();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(children: [
        const SizedBox(height: AppSpacing.xl),
        Text(great ? '🧠' : '💪', style: const TextStyle(fontSize: 64)),
        const SizedBox(height: AppSpacing.md),
        Text(
          great ? 'याददाश्त मज़बूत हो रही है!' : 'रिव्यू पूरा!',
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
            Text('$_correct/${_items.length}',
                style: AppTextStyles.displayLarge.copyWith(
                    fontSize: 56,
                    color: great ? AppColors.success : _accent)),
            Text('याद रहे', style: AppTextStyles.bodyMedium),
            const SizedBox(height: AppSpacing.md),
            const Divider(),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  const Text('⚡', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text('+${_correct * _xpPerCorrect}',
                      style: AppTextStyles.headingLarge
                          .copyWith(color: AppColors.accentGold)),
                  Text('XP कमाए', style: AppTextStyles.labelSmall),
                ]),
                Column(children: [
                  const Text('📆', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text('$_dueAfter',
                      style: AppTextStyles.headingLarge
                          .copyWith(color: _accent)),
                  Text('आज बाकी', style: AppTextStyles.labelSmall),
                ]),
              ],
            ),
          ]),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'सही जवाब देने पर चीज़ें और देर से पूछी जाती हैं — यही याद रखने का विज्ञान है।',
          style: AppTextStyles.labelSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        if (_dueAfter > 0)
          PrimaryButton(
            label: 'रिव्यू जारी रखें',
            emoji: '📆',
            onTap: () {
              setState(() {
                _items.clear();
                _index = 0;
                _correct = 0;
                _answered = false;
                _done = false;
                _rewardsGiven = false;
                _result = null;
                _loading = true;
              });
              _feedbackAnim.reset();
              _loadSession();
            },
          ),
        const SizedBox(height: AppSpacing.md),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.full),
              border: Border.all(color: AppColors.locked, width: 2),
            ),
            child: Text('होम पर जाएं',
                textAlign: TextAlign.center,
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.textSecondary)),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ]),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('📆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            Text('आज का रिव्यू पूरा!',
                style: AppTextStyles.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'नए पाठ पूरे करते रहिए — सीखी हुई चीज़ें सही समय पर रिव्यू के लिए आती रहेंगी।',
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
}
