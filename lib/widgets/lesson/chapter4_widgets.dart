import 'package:flutter/material.dart';
import '../../data/chapter4_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter4Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter4Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildEx1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इन शब्दों को उच्चारण के साथ याद करें। रोज़ कम से कम 10 शब्द याद करने की कोशिश करें।',
          'Learn these words with their pronunciations. Try to memorize at least 10 words daily.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('⚠️ ध्यान देने वाले शब्द', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter4Data.trickyPairs.map((p) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.warning.withOpacity(0.25)),
              ),
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                        child: _vocabChip(
                            p['word1']!, p['mean1']!, AppColors.primary)),
                    if (p['word2']!.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      Expanded(
                          child: _vocabChip(
                              p['word2']!, p['mean2']!, AppColors.accent)),
                    ],
                    if (p['word3']!.isNotEmpty) ...[
                      const SizedBox(width: 6),
                      Expanded(
                          child: _vocabChip(
                              p['word3']!, p['mean3']!, AppColors.success)),
                    ],
                  ]),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Text('क्रियाएँ (Verbs)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _buildVocabGrid(Chapter4Data.ex1Verbs),
        const SizedBox(height: AppSpacing.lg),
        Text('संज्ञाएँ (Nouns)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _buildVocabGrid(Chapter4Data.ex1Nouns),
        const SizedBox(height: AppSpacing.lg),
        Text('विशेषण (Adjectives)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _buildVocabGrid(Chapter4Data.ex1Adjectives),
      ],
    );
  }

  Widget buildEx2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये सामान्य शब्द रोज़मर्रा की बातचीत में बहुत काम आते हैं।',
          'These common words are very useful in everyday conversations.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('सामान्य शब्द (Common Words)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter4Data.ex2Words.map((w) => Container(
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
                  flex: 2,
                  child: GestureDetector(
                    onTap: () => commonWidgets.onSpeak(w['en']!),
                    child: Text(w['en']!,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: accentColor, fontSize: 13)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(w['hi']!,
                      style:
                          AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ),
                commonWidgets.ttsButton(w['en']!),
              ]),
            )),
      ],
    );
  }

  Widget buildEx3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये मुहावरे और phrasal verbs अंग्रेज़ी बोलने में बहुत काम आते हैं।',
          'These idioms and phrasal verbs are very useful for speaking English naturally.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter4Data.ex3Idioms.asMap().entries.map((e) {
          final i = e.key + 1;
          final idiom = e.value;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: 10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.lg),
                      topRight: Radius.circular(AppRadius.lg),
                    ),
                  ),
                  child: Row(children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                          color: accentColor, shape: BoxShape.circle),
                      child: Center(
                          child: Text('$i',
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Row(children: [
                      GestureDetector(
                        onTap: () =>
                            commonWidgets.onSpeak(idiom['phrase'] as String),
                        child: Text(idiom['phrase'] as String,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(idiom['hi'] as String,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: accentColor)),
                      ),
                    ])),
                    commonWidgets.ttsButton(idiom['phrase'] as String),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => commonWidgets
                            .onSpeak(idiom['example'] as String),
                        child: Text(idiom['example'] as String,
                            style: AppTextStyles.labelLarge.copyWith(
                                color: AppColors.primary, fontSize: 13)),
                      ),
                      const SizedBox(height: 2),
                      Text(idiom['exHi'] as String,
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget buildEx4Content() {
    final regions = {
      'head': {
        'label': 'सिर (Head)',
        'emoji': '🧠',
        'color': AppColors.primary
      },
      'face': {
        'label': 'चेहरा (Face)',
        'emoji': '😊',
        'color': AppColors.accent
      },
      'upper': {
        'label': 'ऊपरी शरीर (Upper Body)',
        'emoji': '💪',
        'color': AppColors.success
      },
      'body': {
        'label': 'धड़ (Trunk)',
        'emoji': '🫁',
        'color': AppColors.warning
      },
      'lower': {
        'label': 'निचला शरीर (Lower Body)',
        'emoji': '🦵',
        'color': const Color(0xFF7C3AED)
      },
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'शरीर के अंगों के नाम अंग्रेज़ी में सीखें।',
          'Learn the names of body parts in English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...regions.entries.map((regionEntry) {
          final regionKey = regionEntry.key;
          final regionInfo = regionEntry.value;
          final parts = Chapter4Data.bodyParts
              .where((p) => p['region'] == regionKey)
              .toList();
          final color = regionInfo['color'] as Color;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonWidgets.phraseGroupHeader(
                regionInfo['emoji'] as String,
                regionInfo['label'] as String,
                '${parts.length} अंग',
                color,
              ),
              const SizedBox(height: AppSpacing.sm),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.2,
                ),
                itemCount: parts.length,
                itemBuilder: (context, i) {
                  final part = parts[i];
                  return GestureDetector(
                    onTap: () => commonWidgets.onSpeak(part['en']!),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.06),
                        borderRadius:
                            BorderRadius.circular(AppRadius.md),
                        border:
                            Border.all(color: color.withOpacity(0.2)),
                      ),
                      child: Row(children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(part['en']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(
                                        color: color, fontSize: 12)),
                            Text(part['hi']!,
                                style: AppTextStyles.bodyMedium
                                    .copyWith(fontSize: 10)),
                          ],
                        )),
                        Icon(Icons.volume_up_rounded,
                            color: color.withOpacity(0.4), size: 14),
                      ]),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          );
        }),
      ],
    );
  }

  Widget buildEx5Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये उन्नत शब्द आपकी vocabulary को और मज़बूत बनाएंगे।',
          'These advanced words will make your vocabulary much stronger.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('💬 प्रेरणादायक कथन', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter4Data.quotes.map((q) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withOpacity(0.08),
                    accentColor.withOpacity(0.03)
                  ],
                ),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: accentColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => commonWidgets.onSpeak(q['en']!),
                    child: Text('"${q['en']!}"',
                        style: AppTextStyles.labelLarge.copyWith(
                            color: accentColor,
                            fontStyle: FontStyle.italic,
                            fontSize: 13)),
                  ),
                  const SizedBox(height: 4),
                  Text(q['hi']!, style: AppTextStyles.bodyMedium),
                  if (q['by']!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('— ${q['by']!}',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.textSecondary)),
                  ],
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Text('उन्नत शब्दावली (Advanced Words)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _buildVocabGrid(Chapter4Data.ex5Words),
      ],
    );
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📝', 'title': 'Basic Verbs & Words', 'hi': 'बुनियादी क्रियाएँ और शब्द'},
      {'emoji': '⚠️', 'title': 'Tricky Word Pairs', 'hi': 'Loose/Lose, Close/Close, etc.'},
      {'emoji': '📖', 'title': 'Common Words & Phrases', 'hi': 'सामान्य शब्द'},
      {'emoji': '💬', 'title': 'Idioms & Phrasal Verbs', 'hi': 'मुहावरे और phrasal verbs'},
      {'emoji': '🧍', 'title': 'Parts of the Body', 'hi': '39 शरीर के अंग'},
      {'emoji': '🎓', 'title': 'Advanced Vocabulary', 'hi': 'Futile, Credulous, Stammer...'},
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
            const Text('अध्याय 4 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                    fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Chapter 4 — Final Quiz',
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
              commonWidgets.quizStatBadge('6', 'टॉपिक'),
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
                    Text(t['title']!, style: AppTextStyles.labelLarge),
                    Text(t['hi']!,
                        style: AppTextStyles.bodyMedium
                            .copyWith(fontSize: 12)),
                  ],
                )),
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 18),
              ]),
            )),
      ],
    );
  }

  // Private helper methods
  Widget _buildVocabGrid(List<Map<String, String>> words) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: words.length,
      itemBuilder: (context, i) {
        final w = words[i];
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
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text('${i + 1}',
                      style: AppTextStyles.labelSmall
                          .copyWith(color: accentColor, fontSize: 10))),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(w['en']!),
                  child: Text(w['en']!,
                      style: AppTextStyles.labelLarge
                          .copyWith(color: accentColor, fontSize: 13)),
                )),
            if (w.containsKey('pronunciation'))
              Expanded(
                  flex: 2,
                  child: Text(w['pronunciation']!,
                      style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary, fontSize: 11))),
            Expanded(
                flex: 2,
                child: Text(w['hi']!,
                    style:
                        AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
            commonWidgets.ttsButton(w['en']!),
          ]),
        );
      },
    );
  }

  Widget _vocabChip(String word, String meaning, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => commonWidgets.onSpeak(word.split(' ')[0]),
            child: Text(word,
                style: AppTextStyles.labelLarge
                    .copyWith(color: color, fontSize: 12)),
          ),
          Text(meaning,
              style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}