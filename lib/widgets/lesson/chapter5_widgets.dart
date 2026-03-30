import 'package:flutter/material.dart';
import '../../data/chapter5_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter5Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter5Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildWHBasicsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'WH Family के शब्द प्रश्न पूछने के लिए प्रयोग होते हैं। ये 9 मूल शब्द हैं: What, Why, When, Where, How, Who, Which, Whose, Whom।',
          'WH Family words are used primarily for asking questions. Learn all 9 base words.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('💡', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            const Expanded(
                child: Text(
              '"What" के दो अर्थ:\n• प्रश्न में → क्या  (What is this?)\n• Conjunction की तरह → जो  (I know what he wants.)\n\n"When", "Where", "Who", "Which" के भी ऐसे दोहरे अर्थ हैं।',
              style: AppTextStyles.bodyMedium,
            )),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('9 मूल WH शब्द', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whBaseWords.map((w) => _buildWHCard(w)),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('How many vs How much',
                    style:
                        AppTextStyles.labelLarge.copyWith(color: accentColor)),
                const SizedBox(height: 8),
                commonWidgets.ruleRow('How many',
                    '→ गिनने योग्य (Countable): brothers, stars, books'),
                commonWidgets.ruleRow('How much',
                    '→ न गिन सकें (Uncountable): money, sugar, water'),
              ]),
        ),
      ],
    );
  }

  Widget buildHowCombosContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"How" के साथ मिलकर कई उपयोगी शब्द समूह बनते हैं। इन्हें याद कर लें।',
          '"How" combines with many words to form useful question phrases.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('How के संयोजन', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.howCombos.map((w) => _buildWHCard(w)),
        const SizedBox(height: AppSpacing.lg),
        Text('How many / How much — उदाहरण',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.howManyMuchCombos.map((w) => _buildWHPhraseRow(w)),
      ],
    );
  }

  Widget buildWhomWhereContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Whom" Object के रूप में प्रयोग होता है। "Where" और "When" के साथ मिलकर दिशा/समय के phrases बनते हैं।',
          '"Whom" is used as the object form of "Who". Combine Where/When for direction and time phrases.',
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '👤', 'Whom Combinations', 'किसके/किसकी/किससे', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whomCombos.map((w) => _buildWHPhraseRow(w)),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader('📍', 'Where & When Combinations',
            'कहाँ से / कब से / कब तक', AppColors.accent),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whereWhenCombos.map((w) => _buildWHPhraseRow(w)),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader('❓', 'What Combinations',
            'किसलिए / किस तरह / और क्या', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whatCombos.map((w) => _buildWHPhraseRow(w)),
      ],
    );
  }

  Widget buildWhichWhoseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Which" और "Whose" के साथ बहुत से phrases बनते हैं। साथ ही "Whoever", "Whatever", "Whereas" जैसे विस्तृत WH शब्द सीखें।',
          'Learn Which & Whose phrase combinations, plus extended WH words like Whoever, Whatever, Whereas.',
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader('🔍', 'Which & Whose + Nouns',
            'किस ___ से/में/के लिए', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whichWhosCombos.map((w) => _buildWHPhraseRow(w)),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '🔖', 'Which + Possessive', 'कौन सा / कितने', AppColors.accent),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.whichPossessive.map((w) => _buildWHPhraseRow(w)),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader('✨', 'Extended WH Words',
            'Whoever, Whatever, Whereas...', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter5Data.extendedWH.map((w) => _buildWHPhraseRow(w)),
      ],
    );
  }

  Widget buildWHPhrasesContent() {
    final allPhrases = [
      ...Chapter5Data.whBaseWords,
      ...Chapter5Data.howCombos,
      ...Chapter5Data.whomCombos,
      ...Chapter5Data.whereWhenCombos,
      ...Chapter5Data.whatCombos,
      ...Chapter5Data.extendedWH,
      ...Chapter5Data.whichWhosCombos,
      ...Chapter5Data.howManyMuchCombos,
      ...Chapter5Data.whichPossessive,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में सभी WH शब्द और उनके प्रयोग एक साथ दोहराएँ।',
          'Review all WH words and their phrase combinations together.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('सभी WH Phrases — Quick Review',
            style: AppTextStyles.headingMedium),
        Text('(${allPhrases.length} phrases — tap any to hear)',
            style: AppTextStyles.bodyMedium
                .copyWith(color: AppColors.textSecondary, fontSize: 12)),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allPhrases.map((p) {
            final text = p['en']!;
            final hi = p['hi']!;
            return GestureDetector(
              onTap: () => commonWidgets.onSpeak(text),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  border:
                      Border.all(color: accentColor.withOpacity(0.25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(text,
                          style: AppTextStyles.labelLarge.copyWith(
                              color: accentColor, fontSize: 12)),
                      const SizedBox(width: 4),
                      Icon(Icons.volume_up_rounded,
                          color: accentColor.withOpacity(0.5), size: 11),
                    ]),
                    Text(hi,
                        style: AppTextStyles.bodyMedium
                            .copyWith(fontSize: 10)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '❓', 'title': '9 Base WH Words', 'hi': 'What, Why, When, Where, How, Who, Which, Whose, Whom'},
      {'emoji': '🔢', 'title': 'How Combinations', 'hi': 'How many/much/far/long/old/soon/good...'},
      {'emoji': '👤', 'title': 'Whom Combinations', 'hi': 'With/For/About/By/Towards whom'},
      {'emoji': '📍', 'title': 'Where & When Combos', 'hi': 'From where, Until/Since when...'},
      {'emoji': '❔', 'title': 'What Combinations', 'hi': 'For what, What else, Whatever...'},
      {'emoji': '🔍', 'title': 'Which & Whose + Nouns', 'hi': 'From which office, For whose son...'},
      {'emoji': '✨', 'title': 'Extended WH Words', 'hi': 'Whoever, Whereas, Whichever, Why so...'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 5 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                    fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Chapter 5 — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('12', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('60', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('7', 'टॉपिक'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(children: [
                Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t['title']!,
                              style: AppTextStyles.labelLarge),
                          Text(t['hi']!,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(fontSize: 12)),
                        ])),
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 18),
              ]),
            )),
      ],
    );
  }

  // Private helper methods
  Widget _buildWHCard(Map<String, String> w) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.15)),
      ),
      child: Row(children: [
        GestureDetector(
          onTap: () => commonWidgets.onSpeak(w['en']!),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(w['en']!,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13)),
              const SizedBox(width: 4),
              const Icon(Icons.volume_up_rounded,
                  color: Colors.white70, size: 12),
            ]),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(w['pronunciation']!,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.primary, fontSize: 12)),
            Text(w['hi']!,
                style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
            if (w['note']!.isNotEmpty)
              Text(w['note']!,
                  style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textSecondary, fontSize: 10)),
          ],
        )),
      ]),
    );
  }

  Widget _buildWHPhraseRow(Map<String, String> w) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(children: [
        Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () => commonWidgets.onSpeak(w['en']!),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(w['en']!,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: accentColor, fontSize: 13)),
                    Text(w['pronunciation']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.primary, fontSize: 11)),
                  ]),
            )),
        Expanded(
            flex: 2,
            child: Text(w['hi']!,
                style: AppTextStyles.labelLarge.copyWith(fontSize: 12))),
        commonWidgets.ttsButton(w['en']!),
      ]),
    );
  }
}