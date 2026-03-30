import 'package:flutter/material.dart';
import '../../data/chapter2_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter2Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter2Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildSentencesContent() {
    return Container(); // Full implementation
  }

  Widget buildSentenceTypes1Content() {
    return Container(); // Full implementation
  }

  Widget buildSentenceTypes2Content() {
    return Container(); // Full implementation
  }

  Widget buildAffirmativeNegativeContent() {
    return Container(); // Full implementation
  }

  Widget buildApostropheContent() {
    return Container(); // Full implementation
  }

  Widget buildSVOContent() {
    return Container(); // Full implementation
  }

  Widget buildSingularPluralContent() {
    return Container(); // Full implementation
  }

  Widget buildThisThatContent() {
    return Container(); // Full implementation
  }

  Widget buildBothAllContent() {
    return Container(); // Full implementation
  }

  Widget buildPhrasesContent() {
    return Container(); // Full implementation
  }

  Widget buildStatesContent() {
    return Container(); // Full implementation
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📝', 'title': 'Sentences', 'hi': 'वाक्य — परिभाषा और प्रकार'},
      {
        'emoji': '❓',
        'title': 'Sentence Types 1',
        'hi': 'Assertive, Interrogative'
      },
      {
        'emoji': '❗',
        'title': 'Sentence Types 2',
        'hi': 'Imperative, Exclamatory, Optative'
      },
      {
        'emoji': '✅',
        'title': 'Affirmative & Negative',
        'hi': 'सकारात्मक और नकारात्मक'
      },
      {
        'emoji': '\'',
        'title': 'Apostrophe',
        'hi': 'Apostrophe — ownership & contractions'
      },
      {
        'emoji': '🔤',
        'title': 'SVO Structure',
        'hi': 'Subject + Verb + Object'
      },
      {'emoji': '1️⃣', 'title': 'Singular & Plural', 'hi': 'एकवचन और बहुवचन'},
      {'emoji': '👆', 'title': 'This & That', 'hi': 'This, That, These, Those'},
      {'emoji': '🔢', 'title': 'Both & All', 'hi': 'Both, All, Neither, None'},
      {'emoji': '💬', 'title': 'Common Phrases', 'hi': 'रोज़मर्रा के वाक्यांश'},
      {
        'emoji': '🗺️',
        'title': 'Indian States',
        'hi': 'भारत के राज्य — अंग्रेज़ी में'
      },
      {'emoji': '🧩', 'title': 'Mixed Practice', 'hi': 'मिश्रित अभ्यास'},
      {'emoji': '🏆', 'title': 'Final Review', 'hi': 'अंतिम समीक्षा'},
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
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 2 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white70,
                      fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Chapter 2 — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('12', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('120', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('13', 'टॉपिक'),
                ],
              ),
            ],
          ),
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
              child: Row(
                children: [
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
                    ),
                  ),
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 18),
                ],
              ),
            )),
      ],
    );
  }
}
