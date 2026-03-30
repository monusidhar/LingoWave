import 'package:flutter/material.dart';
import '../../data/chapter30_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter30Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter30Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Get
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildGetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Phrasal Verbs प्रायः दो शब्दों का समूह होती हैं — एक क्रिया (verb) और एक Preposition। जैसे "Get in" में "Get" क्रिया है और "in" Preposition।',
          'Phrasal Verbs = verb + preposition. Each combination creates a unique meaning.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _verbGroupHeader('Get', '🚀', accentColor),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.getPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Run / Turn
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildRunTurnContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Run और Turn के साथ Prepositions जुड़कर अलग-अलग अर्थ बनाते हैं।',
          '"Run" and "Turn" phrasal verbs — each with distinct meanings.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _verbGroupHeader('Run', '🏃', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.runPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.xl),
        _verbGroupHeader('Turn', '🔄', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.turnPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Put / Go
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPutGoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Put और Go के Phrasal Verbs बहुत common हैं और रोज़मर्रा की बातों में उपयोग होते हैं।',
          '"Put" and "Go" phrasal verbs — very common in everyday English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _verbGroupHeader('Put', '📌', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.putPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.xl),
        _verbGroupHeader('Go', '🚶', AppColors.warning),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.goPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Break / Come / Look
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildBreakComeLookContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Break, Come और Look के साथ अलग-अलग Prepositions जुड़ने से बिल्कुल अलग अर्थ बनते हैं।',
          'Break, Come, and Look phrasal verbs — very versatile with prepositions.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _verbGroupHeader('Break', '💥', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.breakPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.xl),
        _verbGroupHeader('Come', '👣', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.comePhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.xl),
        _verbGroupHeader('Look', '🔍', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.lookPhrasals.map((pv) => _phrasalCard(pv)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Others
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildOthersContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस lesson में 21 और important Phrasal Verbs हैं जो अलग-अलग verbs से बने हैं।',
          '21 more important phrasal verbs — mixed verbs with various prepositions.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _statChip('21', 'Verbs', '📋'),
            _statChip('Take off', 'Abide by…', '✈️'),
            _statChip('Mixed', 'Phrasal', '🔤'),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter30Data.otherPhrasals.asMap().entries.map((e) => _phrasalCard(e.value, index: e.key + 1)),
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
      {'emoji': '🚀', 'title': 'Get (8)', 'hi': 'Get in, Get off, Get away with, Get over, Get through…'},
      {'emoji': '🏃', 'title': 'Run (4)', 'hi': 'Run after, Run away, Run down, Run over'},
      {'emoji': '🔄', 'title': 'Turn (5)', 'hi': 'Turn on, Turn off, Turn around, Turn over, Turn upside down'},
      {'emoji': '📌', 'title': 'Put (5)', 'hi': 'Put out, Put down, Put forward, Put up, Put on'},
      {'emoji': '🚶', 'title': 'Go (8)', 'hi': 'Go away, Go down/up, Go on, Go through, Go ahead…'},
      {'emoji': '💥', 'title': 'Break (6)', 'hi': 'Break in, Break off/up, Break out, Break with, Break down'},
      {'emoji': '👣', 'title': 'Come (6)', 'hi': 'Come across, Come up with, Come to, Come up/down, Come by'},
      {'emoji': '🔍', 'title': 'Look (5)', 'hi': 'Look after, Look up, Look for, Look into, Look down upon'},
      {'emoji': '📋', 'title': 'Others (21)', 'hi': 'Take off, Abide by, Give up, Stand by, Turn out…'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 30 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Phrasal Verbs — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('80', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('50+', 'Phrasals'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(children: [
                Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t['title']!, style: AppTextStyles.labelLarge),
                  Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ])),
                const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))), child: const Row(children: [
          Text('💡', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Expanded(child: Text('6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!', style: AppTextStyles.bodyMedium)),
        ])),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _phrasalCard(Map<String, String> pv, {int? index}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card, border: Border.all(color: accentColor.withOpacity(0.12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
            child: Row(children: [
              if (index != null) ...[
                Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
                  child: Center(child: Text('$index', style: TextStyle(fontFamily: 'Nunito', fontSize: 11, fontWeight: FontWeight.w700, color: accentColor))),
                ),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(pv['phrasal']!, style: AppTextStyles.headingMedium.copyWith(color: accentColor, fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(AppRadius.full)),
                child: Text(pv['hindi']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 11), maxLines: 2),
              ),
            ]),
          ),
          // Meaning + Example
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Icon(Icons.translate_rounded, size: 14, color: AppColors.textHint),
                const SizedBox(width: 6),
                Expanded(child: Text(pv['meaning']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12))),
              ]),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(AppRadius.sm)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(pv['example']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                    commonWidgets.ttsButton(pv['example']!),
                  ]),
                  const SizedBox(height: 2),
                  Text(pv['exHindi']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _verbGroupHeader(String verb, String emoji, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: AppSpacing.md),
        Text(verb, style: AppTextStyles.headingLarge.copyWith(color: color, fontSize: 20)),
        const SizedBox(width: 8),
        Text('Phrasal Verbs', style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 13)),
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
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...Chapter30Data.motivationalQuotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(q['english']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                  commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                ]),
                const SizedBox(height: 4),
                Text(q['hindi']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ]),
    );
  }
}