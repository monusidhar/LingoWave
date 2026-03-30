import 'package:flutter/material.dart';
import '../../data/chapter33_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter33Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter33Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Part A (words 1–30)
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildPartAContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _storyCard(),
        const SizedBox(height: AppSpacing.lg),
        _lessonBanner('Part A', 'शब्द 1–30', '📖'),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter33Data.partAWords.map((w) => _wordCard(w)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter33Data.motivationalQuotes.sublist(0, 3)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Part B (words 31–58)
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildPartBContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस lesson में और एक-शब्द प्रतिस्थापन हैं। ध्यान से पढ़ें और प्रत्येक शब्द का अर्थ याद करें।',
          'More one-word substitutions — read carefully and memorize the meaning of each word.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _lessonBanner('Part B', 'शब्द 31–54', '📝'),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter33Data.partBWords.map((w) => _wordCard(w)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter33Data.motivationalQuotes.sublist(2)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📖', 'title': 'Part A (1–30)', 'hi': 'Invincible, Democracy, Atheist, Omnipotent…'},
      {'emoji': '📝', 'title': 'Part B (31–54)', 'hi': 'Cannibal, Cartography, Autocracy, Calligraphy…'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 33 — फ़ाइनल क्विज़',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('One Word Substitution — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('80', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('54', 'शब्द'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: AppShadows.card),
              child: Row(children: [
                Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t['title']!, style: AppTextStyles.labelLarge),
                  Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ])),
                const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.08),
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Row(children: [
            Text('💡', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Expanded(
                child: Text(
                    '6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to complete the chapter!',
                    style: AppTextStyles.bodyMedium)),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  /// Akbar–Birbal story card shown at top of Part A
  Widget _storyCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accentColor.withOpacity(0.12), accentColor.withOpacity(0.04)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('👑', style: TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.sm),
          Text('अकबर & बीरबल',
              style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
        ]),
        const SizedBox(height: AppSpacing.md),
        Text(Chapter33Data.storyHindi,
            style: AppTextStyles.bodyMedium.copyWith(height: 1.6)),
        const SizedBox(height: AppSpacing.sm),
        Container(height: 1, color: accentColor.withOpacity(0.15)),
        const SizedBox(height: AppSpacing.sm),
        Text(Chapter33Data.storyEnglish,
            style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
                height: 1.6)),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.lightbulb_outline_rounded, color: accentColor, size: 16),
            const SizedBox(width: 6),
            Text('एक शब्द = पूरा वाक्य  |  One word = Whole sentence',
                style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
          ]),
        ),
      ]),
    );
  }

  Widget _lessonBanner(String part, String label, String emoji) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(width: AppSpacing.md),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(part,
              style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
          Text('$label — One Word Substitution',
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textSecondary, fontSize: 12)),
        ]),
      ]),
    );
  }

  /// Individual word card: number | word (TTS) | hindi | definition
  Widget _wordCard(Map<String, String> w) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.08)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header row
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.lg - 2),
              topRight: Radius.circular(AppRadius.lg - 2),
            ),
          ),
          child: Row(children: [
            // Serial number badge
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
              child: Center(
                  child: Text(w['no']!,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: accentColor))),
            ),
            const SizedBox(width: AppSpacing.sm),
            // Word
            Expanded(
              child: Text(w['word']!,
                  style: AppTextStyles.labelLarge.copyWith(
                      color: accentColor, fontSize: 15)),
            ),
            // Hindi meaning badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(w['hindi']!,
                  style: AppTextStyles.labelSmall.copyWith(
                      color: accentColor, fontSize: 12)),
            ),
            const SizedBox(width: AppSpacing.sm),
            commonWidgets.ttsButton(w['word']!),
          ]),
        ),
        // Definition row
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          child: Text(w['def']!,
              style: AppTextStyles.bodyMedium.copyWith(height: 1.5)),
        ),
      ]),
    );
  }

  Widget _quotesSection(List<Map<String, String>> quotes) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.accentGold.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('महान विचार',
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...quotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('❝', style: TextStyle(fontSize: 18, color: AppColors.accentGold)),
                  const SizedBox(width: 6),
                  Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(
                        child: Text(q['english']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontStyle: FontStyle.italic, height: 1.5)),
                      ),
                      commonWidgets.ttsButton(q['english']!,
                          color: AppColors.accentGold),
                    ]),
                    const SizedBox(height: 4),
                    Text(q['hindi']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary, fontSize: 12, height: 1.4)),
                    if (q['author']!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text('— ${q['author']}',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.accentGold)),
                    ],
                  ])),
                ]),
              ]),
            )),
      ]),
    );
  }
}