import 'package:flutter/material.dart';
import '../../data/chapter31_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter31Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter31Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Group A (According to … In the hope of)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildGroupAContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'जिस तरह Phrasal क्रियाओं में किसी न किसी क्रिया का होना ज़रूरी है, उसी तरह Prepositional phrases में किसी न किसी Preposition का होना ज़रूरी है।',
          'Prepositional phrases, just like phrasal verbs, must have at least one preposition in them.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionBanner(),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter31Data.groupAPhrases.map((p) => _phraseCard(p)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Group B (In lieu of … Anything at all)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildGroupBContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस lesson में और महत्त्वपूर्ण Prepositional Phrases हैं जो रोज़मर्रा की बातचीत में बहुत उपयोगी हैं।',
          'More important prepositional phrases used commonly in everyday English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter31Data.groupBPhrases.map((p) => _phraseCard(p)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📖', 'title': 'Group A (8)', 'hi': 'According to, At the risk of, Because of, By all means…'},
      {'emoji': '📝', 'title': 'Group B (6)', 'hi': 'In lieu of, In order to, On behalf of, Not at all…'},
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
            const Text('अध्याय 31 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Prepositional Phrases — Final Quiz',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('80', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('14', 'Phrases'),
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
                    '6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
                    style: AppTextStyles.bodyMedium)),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _sectionBanner() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _statChip('14', 'Phrases', '📋'),
        _statChip('Preposition', 'Must have', '🔑'),
        _statChip('Daily', 'Usage', '💬'),
      ]),
    );
  }

  Widget _phraseCard(Map<String, String> p) {
    final hasEx2 = (p['example2'] ?? '').isNotEmpty;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.07),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.lg - 2),
                  topRight: Radius.circular(AppRadius.lg - 2)),
            ),
            child: Row(children: [
              Expanded(
                child: Text(p['phrase']!,
                    style: AppTextStyles.headingMedium.copyWith(color: accentColor, fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: accentColor, borderRadius: BorderRadius.circular(AppRadius.full)),
                child: Text(p['hindi']!,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 11),
                    maxLines: 2),
              ),
            ]),
          ),
          // Examples
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _exampleTile(p['example1']!, p['ex1Hi']!),
              if (hasEx2) ...[
                const SizedBox(height: 8),
                _exampleTile(p['example2']!, p['ex2Hi']!),
              ],
            ]),
          ),
        ],
      ),
    );
  }

  Widget _exampleTile(String en, String hi) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
              child: Text(en,
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
          commonWidgets.ttsButton(en),
        ]),
        const SizedBox(height: 2),
        Text(hi, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
      ]),
    );
  }

  Widget _statChip(String value, String label, String emoji) {
    return Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 18)),
      const SizedBox(height: 2),
      Text(value, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 12)),
      Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
    ]);
  }

  Widget _quotesSection() {
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
          Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...Chapter31Data.motivationalQuotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(
                      child: Text(
                          q['author']!.isNotEmpty
                              ? '"${q['english']!}"  — ${q['author']}'
                              : '"${q['english']!}"',
                          style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                  commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                ]),
                const SizedBox(height: 4),
                Text(q['hindi']!,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ]),
    );
  }
}