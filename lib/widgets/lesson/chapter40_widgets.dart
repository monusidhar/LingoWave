// chapter40_widgets.dart - Fixed syntax errors

import 'package:flutter/material.dart';
import '../../data/chapter40_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter40Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter40Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — English → Hindi (Passages 1–5)
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildEnToHi1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _introBanner(),
        const SizedBox(height: AppSpacing.lg),
        _moreMoreSection(),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('English → Hindi', 'Passages 1–5', Icons.translate_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter40Data.enToHiPassages
            .sublist(0, 5)
            .map((p) => _passageCard(p)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — English → Hindi (Passages 6–10) + Hindi → English (1–20)
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildEnToHi2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'यहाँ अंग्रेज़ी से हिंदी (Passage 6–10) और हिंदी से अंग्रेज़ी (20 परिच्छेद) अभ्यास है।',
          'This lesson covers English→Hindi (Passages 6–10) and Hindi→English translation exercises (20 passages).',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('English → Hindi', 'Passages 6–10', Icons.translate_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter40Data.enToHiPassages
            .sublist(5, 10)
            .map((p) => _passageCard(p)),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Hindi → English', '20 Passages', Icons.swap_horiz_rounded),
        const SizedBox(height: AppSpacing.sm),
        _hiToEnNote(),
        const SizedBox(height: AppSpacing.md),
        ...Chapter40Data.hiToEnPassages.map((p) => _hiToEnPassageCard(p)),
      ],
    );
  }
  // Add these methods to Chapter40Widgets class

Widget buildHiToEn1Content() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonWidgets.buildLessonIntro(
        'यहाँ हिंदी से अंग्रेज़ी (परिच्छेद 1–10) का अनुवाद अभ्यास है।',
        'Practice Hindi to English translation with passages 1–10.',
      ),
      const SizedBox(height: AppSpacing.lg),
      _moreMoreSection(),
      const SizedBox(height: AppSpacing.xl),
      _sectionHeader('Hindi → English', 'Passages 1–10', Icons.swap_horiz_rounded),
      const SizedBox(height: AppSpacing.md),
      ...Chapter40Data.hiToEnPassages
          .sublist(0, 10)
          .map((p) => _hiToEnPassageCard(p)),
    ],
  );
}

Widget buildHiToEn2Content() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonWidgets.buildLessonIntro(
        'यहाँ हिंदी से अंग्रेज़ी (परिच्छेद 11–20) का अनुवाद अभ्यास है।',
        'Practice Hindi to English translation with passages 11–20.',
      ),
      const SizedBox(height: AppSpacing.lg),
      _sectionHeader('Hindi → English', 'Passages 11–20', Icons.swap_horiz_rounded),
      const SizedBox(height: AppSpacing.md),
      ...Chapter40Data.hiToEnPassages
          .sublist(10, 20)
          .map((p) => _hiToEnPassageCard(p)),
    ],
  );
}

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildChapterQuizIntro() {
    final topics = [
      {
        'emoji': '📖',
        'title': 'English → Hindi (1–5)',
        'hi': 'Story, Ambition, Interview, Colors of Life, Criminals',
      },
      {
        'emoji': '📝',
        'title': 'English → Hindi (6–10)',
        'hi': 'Diwali, Childhood, Delhi Incidents, Poverty, Uncertainty',
      },
      {
        'emoji': '🔄',
        'title': 'Hindi → English (20 Passages)',
        'hi': 'Conversations on illness, books, market, movies, food, rain, birthday, books, daily routine, rest & more',
      },
      {
        'emoji': '💡',
        'title': '"The more…the more" Pattern',
        'hi': 'जितना ज्यादा…उतना ही बेहतर',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accentColor, accentColor.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🎓', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text(
                'अध्याय 40 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito', color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'Translation Exercises — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('60', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('30', 'Passages'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        // Completion message
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Text('🏅', style: TextStyle(fontSize: 28)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'बधाई हो! आप अंत तक पहुँचे!',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.accentGold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'You\'ve completed all 40 chapters of this English course!',
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ),
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
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(
            children: [
              Text('💡', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '6/10 सही जवाब देने पर अध्याय पूरा होगा।\nScore 6/10 or more to complete the chapter!',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _introBanner() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accentColor.withOpacity(0.14), accentColor.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📘', style: TextStyle(fontSize: 28)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  'अनुवाद अभ्यास (Translation Exercises)',
                  style: AppTextStyles.headingMedium.copyWith(color: accentColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Let\'s practice a few translation exercises; Hindi to English & English to Hindi.',
            style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'The more you practice, the better you become.',
            style: AppTextStyles.bodyMedium.copyWith(
              color: accentColor,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '"Practice & Practice & Practice, keep doing it. Success is for sure."',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.accentGold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _moreMoreSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.accentGold.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('💡', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                '"The more…the more" Pattern',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.accentGold),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...Chapter40Data.moreMorePatterns.map((m) => Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            m['en']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor, fontSize: 13),
                          ),
                        ),
                        commonWidgets.ttsButton(m['en']!),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      m['hi']!,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.textSecondary, height: 1.4),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Icon(icon, color: accentColor, size: 22),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
                Text(subtitle,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hiToEnNote() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📌', style: TextStyle(fontSize: 16)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'The following paragraphs are mixed up with several conversations in between. '
              'Don\'t worry about the flow — just focus on translation, not on sequence.\n\n'
              'ये परिच्छेद आपस में मिले-जुले हैं। अनुक्रम की चिंता न करें — सिर्फ अनुवाद पर ध्यान दें।',
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Full passage card with En text, Hindi translation, and vocab
  Widget _passageCard(Map<String, dynamic> passage) {
    final vocabList = (passage['vocab'] as List).cast<Map<String, String>>();
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.xl - 2),
                topRight: Radius.circular(AppRadius.xl - 2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: accentColor, borderRadius: BorderRadius.circular(AppRadius.md)),
                  child: Center(
                    child: Text(
                      '${passage['no']}',
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text(passage['emoji'] as String,
                    style: const TextStyle(fontSize: 22)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(passage['title'] as String,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: accentColor)),
                      Text(passage['titleHi'] as String,
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                commonWidgets.ttsButton(passage['en'] as String),
              ],
            ),
          ),
          // English text
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text('EN',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11)),
                    ),
                    const SizedBox(width: 8),
                    Text('English', style: AppTextStyles.labelSmall),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  passage['en'] as String,
                  style: AppTextStyles.bodyMedium.copyWith(height: 1.6),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Hindi translation
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text('HI',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11)),
                    ),
                    const SizedBox(width: 8),
                    Text('हिंदी अनुवाद', style: AppTextStyles.labelSmall),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  passage['hi'] as String,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.success, height: 1.6),
                ),
              ],
            ),
          ),
          // Vocabulary
          if (vocabList.isNotEmpty) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('📚', style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 6),
                      Text('Key Vocabulary',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: accentColor)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: vocabList.map((v) => GestureDetector(
                          onTap: () => commonWidgets.onSpeak(v['word']!),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.06),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.full),
                              border: Border.all(
                                  color: accentColor.withOpacity(0.25)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(v['word']!,
                                    style: AppTextStyles.labelSmall
                                        .copyWith(color: accentColor)),
                                const Text(' → ',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.textHint)),
                                Text(v['meaning']!,
                                    style: AppTextStyles.bodyMedium
                                        .copyWith(fontSize: 11)),
                              ],
                            ),
                          ),
                        )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Hindi → English passage card (simpler — two columns)
  Widget _hiToEnPassageCard(Map<String, String> passage) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.success.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.07),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.xl - 2),
                topRight: Radius.circular(AppRadius.xl - 2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: BorderRadius.circular(AppRadius.md)),
                  child: Center(
                    child: Text(
                      passage['no']!,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Text(passage['emoji']!, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(passage['titleHi']!,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: AppColors.success)),
                      Text(passage['titleEn']!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                commonWidgets.ttsButton(passage['en']!),
              ],
            ),
          ),
          // Hindi source
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _langBadge('HI', 'हिंदी', AppColors.warning),
                const SizedBox(height: AppSpacing.sm),
                Text(passage['hi']!,
                    style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary, height: 1.6)),
              ],
            ),
          ),
          const Divider(height: 1),
          // English answer
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _langBadge('EN', 'English', AppColors.success),
                const SizedBox(height: AppSpacing.sm),
                Text(passage['en']!,
                    style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.success, height: 1.6)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _langBadge(String code, String label, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(code,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 11)),
        ),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }
}