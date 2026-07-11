import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../theme/app_theme.dart';
import '../services/progress_service.dart';
import '../services/review_service.dart';
import '../services/sound_service.dart';
import '../widgets/ad_widgets.dart';
import '../widgets/common_widgets.dart';
import 'exercise_models.dart';
import 'exercise_generator.dart';
import 'exercise_widgets.dart';

/// 🔁 Practice Your Mistakes (Step 3, v2.2).
///
/// Re-drills up to [_itemsPerSession] previously-missed items using the
/// Step-2 exercise widgets. Answering an item correctly twice (across any
/// sessions) removes it from the pool; a wrong answer resets its progress.
class ReviewSessionScreen extends StatefulWidget {
  const ReviewSessionScreen({super.key});

  @override
  State<ReviewSessionScreen> createState() => _ReviewSessionScreenState();
}

class _ReviewSessionScreenState extends State<ReviewSessionScreen>
    with TickerProviderStateMixin {
  static const int _itemsPerSession = 7;
  static const int _xpPerCorrect = 2;
  static const Color _accent = AppColors.primary;

  final List<MapEntry<MistakeRecord, Exercise>> _items = [];
  bool _loading = true;
  int _index = 0, _correct = 0;
  bool _answered = false;
  bool _done = false;
  bool _rewardsGiven = false;
  int _remainingAfter = 0;
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
    final pending = await ReviewService.getPending()
      ..shuffle();
    final items = <MapEntry<MistakeRecord, Exercise>>[];
    for (final record in pending) {
      if (items.length >= _itemsPerSession) break;
      final exercise = ExerciseGenerator.buildReviewExercise(record);
      if (exercise == null) {
        // Source content no longer exists — drop silently.
        await ReviewService.removeStale(record);
        continue;
      }
      items.add(MapEntry(record, exercise));
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
    ReviewService.recordReviewResult(_items[_index].key, result.correct);
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
      final remaining = await ReviewService.pendingCount();
      if (!mounted) return;
      setState(() {
        _remainingAfter = remaining;
        _done = true;
      });
      if (_correct >= (_items.length / 2).ceil()) _confetti.play();
    }
  }

  Widget _buildExerciseWidget(Exercise e) {
    switch (e.kind) {
      case ExerciseKind.mcq:
        return McqExerciseWidget(
            key: ValueKey('rev$_index'),
            exercise: e as McqExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.listenChoose:
        return ListenChooseWidget(
            key: ValueKey('rev$_index'),
            exercise: e as ListenChooseExercise,
            accent: _accent,
            onResult: _onResult,
            speak: _speak);
      case ExerciseKind.tapToBuild:
        return TapBuildWidget(
            key: ValueKey('rev$_index'),
            exercise: e as TapBuildExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.fillBlank:
        return FillBlankWidget(
            key: ValueKey('rev$_index'),
            exercise: e as FillBlankExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.matchPairs:
        return MatchPairsWidget(
            key: ValueKey('rev$_index'),
            exercise: e as MatchPairsExercise,
            accent: _accent,
            onResult: _onResult);
      case ExerciseKind.speak:
        return SpeakExerciseWidget(
            key: ValueKey('rev$_index'),
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
      // ── Header ──
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
                Text('🔁 गलतियों का अभ्यास',
                    style: AppTextStyles.headingMedium),
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

      // ── Exercise ──
      Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: _buildExerciseWidget(_items[_index].value),
        ),
      ),

      // ── Feedback ──
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
                                  ? 'सही! एक कदम और साफ़! 🎉'
                                  : 'फिर गलत हुआ — ध्यान से देखें:',
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
        Text(great ? '🏆' : '💪', style: const TextStyle(fontSize: 64)),
        const SizedBox(height: AppSpacing.md),
        Text(
          great ? 'बहुत बढ़िया अभ्यास!' : 'अभ्यास जारी रखें!',
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
            Text('सही जवाब', style: AppTextStyles.bodyMedium),
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
                  const Text('🔁', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text('$_remainingAfter',
                      style: AppTextStyles.headingLarge
                          .copyWith(color: _accent)),
                  Text('बाकी गलतियाँ', style: AppTextStyles.labelSmall),
                ]),
              ],
            ),
          ]),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'हर गलती दो बार सही करने पर हमेशा के लिए साफ़ हो जाती है।',
          style: AppTextStyles.labelSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xl),
        if (_remainingAfter > 0)
          PrimaryButton(
            label: 'और अभ्यास करें',
            emoji: '🔁',
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
            const Text('🎉', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            Text('कोई गलती बाकी नहीं!',
                style: AppTextStyles.displayMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'पाठ खेलते रहिए — जो गलत होगा वह यहाँ अभ्यास के लिए आ जाएगा।',
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
