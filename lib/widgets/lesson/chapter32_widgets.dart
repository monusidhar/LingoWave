import 'package:flutter/material.dart';
import '../../data/chapter32_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter32Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter32Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Exercise 1 Part A (groups 1–20)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx1AContent() {
    final groups = Chapter32Data.exercise1.where((g) => (g['group'] as int) <= 20).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'भ्रमित करने वाले शब्द कई तरह के होते हैं — दो शब्दों की स्पेलिंग एक जैसी लगे पर एकाद अक्षर की भिन्नता हो या फिर दो शब्दों का उच्चारण बिल्कुल एक जैसा हो लेकिन अर्थ भिन्न हों।',
          'Confusing similar words: same spelling but different meanings, or different spelling but same pronunciation.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseBanner('Exercise 1', 'शब्द 1–20', '📖', 'Hindi meanings'),
        const SizedBox(height: AppSpacing.lg),
        ...groups.map((g) => _wordGroupCard(g)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter32Data.motivationalQuotes.sublist(0, 4)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Exercise 1 Part B (groups 21–40)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx1BContent() {
    final groups = Chapter32Data.exercise1
        .where((g) => (g['group'] as int) >= 21 && (g['group'] as int) <= 40)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस lesson में और भ्रमित करने वाले शब्द हैं। ध्यान से पढ़ें और अंतर समझें।',
          'More confusing words — read carefully and understand the difference.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseBanner('Exercise 1', 'शब्द 21–40', '📝', 'Hindi meanings'),
        const SizedBox(height: AppSpacing.lg),
        ...groups.map((g) => _wordGroupCard(g)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter32Data.motivationalQuotes.sublist(4, 8)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Exercise 1 Part C (groups 41–45 + remaining)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx1CContent() {
    final groups = Chapter32Data.exercise1
        .where((g) => (g['group'] as int) >= 41)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Exercise 1 के अंतिम शब्द — इनमें कुछ अंग्रेज़ी अर्थ भी दिए गए हैं।',
          'Final words of Exercise 1 — some with English meanings as well.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseBanner('Exercise 1', 'शब्द 41+', '🔤', 'Hindi + English'),
        const SizedBox(height: AppSpacing.lg),
        ...groups.map((g) => _wordGroupCard(g)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter32Data.motivationalQuotes.sublist(8)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Exercise 2 (English-only)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'यह exercise पूरी तरह अंग्रेज़ी में है। अब आपको English को जितना हो सके उपयोग करने की आदत डालनी है।',
          'This exercise is purely in English. Develop a habit of using English as much as possible.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseBanner('Exercise 2', '54 Groups', '🇬🇧', 'English only'),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter32Data.exercise2.map((g) => _wordGroupCardEn(g)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter32Data.motivationalQuotes.sublist(0, 4)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📖', 'title': 'Exercise 1A (1–20)', 'hi': 'Cast/Caste, Story/Storey, Suit/Suite/Sweet…'},
      {'emoji': '📝', 'title': 'Exercise 1B (21–40)', 'hi': 'There/Their, Whether/Weather, Heart/Hurt…'},
      {'emoji': '🔤', 'title': 'Exercise 1C (41+)',   'hi': 'Wile/Vile, Pen/Pan, Sculpture/Sculptor…'},
      {'emoji': '🇬🇧', 'title': 'Exercise 2 (54)',    'hi': 'Elicit/Illicit, Vocation/Vacation, Corpse/Corps…'},
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
            const Text('अध्याय 32 — फ़ाइनल क्विज़',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Confusing Similar Words — Final Quiz',
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
              commonWidgets.quizStatBadge('99+', 'Pairs'),
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

  Widget _exerciseBanner(String ex, String label, String emoji, String sub) {
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
          Text(ex, style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
          Text('$label — $sub',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
        ]),
      ]),
    );
  }

  /// Card for Exercise 1 (Hindi meanings)
  Widget _wordGroupCard(Map<String, dynamic> group) {
    final pairs = (group['pairs'] as List).cast<Map<String, dynamic>>();
    final groupNum = group['group'] as int;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group number header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.07),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.lg - 2),
                  topRight: Radius.circular(AppRadius.lg - 2)),
            ),
            child: Row(children: [
              Container(
                width: 26,
                height: 26,
                decoration:
                    BoxDecoration(color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
                child: Center(
                    child: Text('$groupNum',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: accentColor))),
              ),
              const SizedBox(width: 8),
              Text(pairs.map((p) => p['word']).join(' / '),
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13)),
            ]),
          ),
          // Pairs list
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              children: pairs.map((p) {
                final hasNote = (p['en'] as String).isNotEmpty;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    // Word + pronunciation
                    SizedBox(
                      width: 130,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p['word'] as String,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor, fontSize: 13)),
                        Text(p['pron'] as String,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.textHint, fontSize: 10)),
                      ]),
                    ),
                    const Text('— ', style: TextStyle(color: AppColors.textHint)),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p['hi'] as String,
                            style: AppTextStyles.bodyMedium.copyWith(fontSize: 13)),
                        if (hasNote)
                          Text('(${p['en']})',
                              style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic)),
                      ]),
                    ),
                    commonWidgets.ttsButton(p['word'] as String),
                  ]),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Card for Exercise 2 (English-only)
  Widget _wordGroupCardEn(Map<String, dynamic> group) {
    final pairs = (group['pairs'] as List).cast<Map<String, dynamic>>();
    final groupNum = group['group'] as int;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.07),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.lg - 2),
                  topRight: Radius.circular(AppRadius.lg - 2)),
            ),
            child: Row(children: [
              Container(
                width: 26,
                height: 26,
                decoration:
                    BoxDecoration(color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
                child: Center(
                    child: Text('$groupNum',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: accentColor))),
              ),
              const SizedBox(width: 8),
              Text(pairs.map((p) => p['word']).join(' / '),
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              children: pairs.map((p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Row(children: [
                      SizedBox(
                        width: 140,
                        child: Text(p['word'] as String,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor, fontSize: 13)),
                      ),
                      const Text('— ', style: TextStyle(color: AppColors.textHint)),
                      Expanded(
                          child: Text(p['def'] as String,
                              style: AppTextStyles.bodyMedium.copyWith(fontSize: 13))),
                      commonWidgets.ttsButton(p['word'] as String),
                    ]),
                  )).toList(),
            ),
          ),
        ],
      ),
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
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...quotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: Text(
                        q['author']!.isNotEmpty
                            ? '"${q['english']!}"  — ${q['author']}'
                            : '"${q['english']!}"',
                        style:
                            AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
              ]),
            )),
      ]),
    );
  }
}