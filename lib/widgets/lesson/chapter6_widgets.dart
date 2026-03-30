import 'package:flutter/material.dart';
import '../../data/chapter6_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter6Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter6Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildPOS1Content() {
    final parts = Chapter6Data.partsOfSpeech.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'वाक्य में प्रयोग किये गये सभी शब्दों को 8 वर्गों में बाँटा गया है जिन्हें शब्द भेद (Parts of Speech) कहते हैं।',
          'Every word in a sentence belongs to one of 8 categories called Parts of Speech.',
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('8 Parts of Speech',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: Chapter6Data.partsOfSpeech
                    .map((p) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(
                              '${p['number']}. ${p['nameEn']} (${p['nameHi']})',
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: accentColor)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('पहले 3 शब्द भेद', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...parts.map((p) => _buildPOSCard(p)),
      ],
    );
  }

  Widget buildPOS2Content() {
    final parts = Chapter6Data.partsOfSpeech.skip(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'बाकी 5 शब्द भेद सीखें — Adjective, Adverb, Preposition, Conjunction और Interjection।',
          'Learn the remaining 5 Parts of Speech.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('बाकी 5 शब्द भेद', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...parts.map((p) => _buildPOSCard(p)),
      ],
    );
  }

  Widget buildPOS3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Articles और Determiners को Adjective का एक प्रकार माना जाता है।',
          'Articles and Determiners are classified as a type of Adjective.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('महत्वपूर्ण तथ्य', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter6Data.importantFacts.map((fact) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: accentColor.withOpacity(0.2)),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(fact['emoji']!,
                        style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fact['title']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor)),
                        Text(fact['titleHi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 12)),
                      ],
                    )),
                  ]),
                  const SizedBox(height: AppSpacing.sm),
                  Container(height: 1, color: AppColors.lockedBg),
                  const SizedBox(height: AppSpacing.sm),
                  Text(fact['detail']!, style: AppTextStyles.bodyMedium),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.success.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('📋 याद रखें',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.success)),
              const SizedBox(height: 8),
              commonWidgets.ruleRow(
                  'Articles (A, An, The)', '→ Adjective का प्रकार'),
              commonWidgets.ruleRow(
                  'Determiners (1, 2, 50...)', '→ Adjective का प्रकार'),
              commonWidgets.ruleRow(
                  'दोनों Noun को modify करते हैं', '→ इसलिए Adjective'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🏷️', 'title': 'Noun (संज्ञा)', 'hi': 'प्राणी / जगह / वस्तु का नाम'},
      {'emoji': '👤', 'title': 'Pronoun (सर्वनाम)', 'hi': 'Noun की जगह प्रयोग'},
      {'emoji': '⚡', 'title': 'Verb (क्रिया)', 'hi': 'Subject का कार्य या अवस्था'},
      {'emoji': '🎨', 'title': 'Adjective (विशेषण)', 'hi': 'Noun/Pronoun की विशेषता'},
      {'emoji': '🔄', 'title': 'Adverb (क्रिया विशेषण)', 'hi': 'Verb/Adjective/Adverb की विशेषता'},
      {'emoji': '🔗', 'title': 'Preposition (पूर्वसर्ग)', 'hi': 'Noun और वाक्य के दूसरे भाग का सम्बन्ध'},
      {'emoji': '🔀', 'title': 'Conjunction (संयोजक)', 'hi': 'दो शब्दों/वाक्यों को जोड़ना'},
      {'emoji': '😲', 'title': 'Interjection (विस्मयादिबोधक)', 'hi': 'भावना की अभिव्यक्ति'},
      {'emoji': '📌', 'title': 'Articles → Adjective', 'hi': 'A, An, The'},
      {'emoji': '🔢', 'title': 'Determiners → Adjective', 'hi': '1, 2, 50 (मात्रा बताने वाले)'},
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
            const Text('अध्याय 6 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                    fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Chapter 6 — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('40', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('10', 'टॉपिक'),
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

  // Private helper method
  Widget _buildPOSCard(Map<String, dynamic> p) {
    final colorMap = {
      'primary': AppColors.primary,
      'success': AppColors.success,
      'accent': AppColors.accent,
      'warning': AppColors.warning,
    };
    final color = colorMap[p['color'] as String] ?? accentColor;
    final examples = p['examples'] as List<dynamic>;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg),
                topRight: Radius.circular(AppRadius.lg),
              ),
            ),
            child: Row(children: [
              Container(
                width: 36,
                height: 36,
                decoration:
                    BoxDecoration(color: color, shape: BoxShape.circle),
                child: Center(
                    child: Text(p['number'] as String,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 16))),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['nameEn'] as String,
                            style: AppTextStyles.headingMedium
                                .copyWith(color: color)),
                        Text(p['nameHi'] as String,
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: color, fontSize: 12)),
                      ])),
              Text(p['emoji'] as String,
                  style: const TextStyle(fontSize: 26)),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p['defHi'] as String,
                      style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 2),
                  Text(p['defEn'] as String,
                      style: AppTextStyles.bodyMedium.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: AppColors.textSecondary)),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: examples
                  .map((ex) => GestureDetector(
                        onTap: () => commonWidgets
                            .onSpeak(ex.toString().split(' ')[0]),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.08),
                            borderRadius:
                                BorderRadius.circular(AppRadius.full),
                            border: Border.all(
                                color: color.withOpacity(0.25)),
                          ),
                          child: Text(ex.toString(),
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: color)),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}