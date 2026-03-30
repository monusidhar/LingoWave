import 'package:flutter/material.dart';
import '../../data/chapter34_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter34Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter34Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _sectionHeader(String title, {String badge = ''}) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: AppTextStyles.headingMedium)),
          if (badge.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(badge,
                  style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
            ),
        ],
      ),
    );
  }

  Widget _sentenceTile(
      int number, String hindi, String english, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: Text('$number',
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 11)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: color, fontSize: 12)),
                    ),
                    commonWidgets.ttsButton(
                        english.split('/').first.trim(), color: color),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSetContent({
    required List<Map<String, String>> data,
    required Color color,
    required String setTitle,
    required String setSubtitle,
    required String emoji,
  }) {
    return commonWidgets.sectionCard(
      title: setTitle,
      subtitle: setSubtitle,
      color: color,
      child: Column(
        children: data.map((item) {
          return _sentenceTile(
            int.parse(item['n']!),
            item['hindi']!,
            item['english']!,
            color,
          );
        }).toList(),
      ),
    );
  }

  // ─── L1: Intro ─────────────────────────────────────────────────────────────
  Widget buildIntroContent() {
    final highlights = [
      {'emoji': '🎯', 'en': 'She is very talkative.', 'hi': 'वो बहुत बातूनी है।'},
      {'emoji': '🤝', 'en': 'You are my namesake.', 'hi': 'तुम मेरे हमनाम हो।'},
      {'emoji': '💰', 'en': 'I am a spendthrift.', 'hi': 'मैं बहुत खर्च करता हूँ।'},
      {'emoji': '🌩️', 'en': 'Come what may, I will go.', 'hi': 'चाहे जो हो, मैं जाऊँगा।'},
      {'emoji': '😴', 'en': 'He is having a sound sleep.', 'hi': 'वो बहुत गहरी नींद में है।'},
      {'emoji': '🔥', 'en': "It's a blistering heat today.", 'hi': 'आज तपतपाती गर्मी है।'},
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
                colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('💡', style: TextStyle(fontSize: 44)),
              const SizedBox(height: AppSpacing.sm),
              const Text('Special & Complex Sentences',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('विशेष और जटिल वाक्य',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('266', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('5', 'सेट'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Daily', 'Use'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Hindi advice
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('📚 क्यों सीखें?',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.primary)),
              const SizedBox(height: 6),
              const Text(
                'किसी भी भाषा पर अच्छी पकड़ तभी बनाई जा सकती है जब आपके शब्दकोश में ऐसे शब्द हों जो आपके वाक्यों को छोटा लेकिन प्रभावी बना दें। इन वाक्यों को रट लें और जब–जब मौका मिले, इनका प्रयोग करें।',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💬 English में समझें',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: 6),
              const Text(
                "If you want to have a good command over a language, you must have certain special words in your dictionary, which can make your sentences short but effective. Cram these sentences and use them whenever you get an opportunity.",
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),

        _sectionHeader('झलकियाँ — कुछ examples', badge: '6'),

        ...highlights.map((h) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: accentColor.withOpacity(0.2)),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Text(h['emoji']!, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(h['hi']!, style: AppTextStyles.bodyMedium),
                        Text(h['en']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor, fontSize: 13)),
                      ],
                    ),
                  ),
                  commonWidgets.ttsButton(h['en']!, color: accentColor),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(
            children: [
              Text('⭐', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'अगले 5 Lessons में सभी 266 वाक्य हैं। हर सेट को ध्यान से पढ़ें और TTS बटन से pronunciation सुनें।',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L2: Set 1 (1–55) ─────────────────────────────────────────────────────
  Widget buildSet1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'पहले 55 वाक्य — रोजमर्रा की बातचीत में सबसे उपयोगी।',
          'First 55 sentences — most useful in everyday conversation.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildSetContent(
          data: Chapter34Data.set1,
          color: accentColor,
          setTitle: 'वाक्य 1–55',
          setSubtitle: '55 sentences',
          emoji: '📖',
        ),
      ],
    );
  }

  // ─── L3: Set 2 (56–113) ───────────────────────────────────────────────────
  Widget buildSet2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'वाक्य 56–113 — ये वाक्य expressions और phrases सीखने के लिए बेहतरीन हैं।',
          'Sentences 56–113 — great for learning useful expressions and phrases.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildSetContent(
          data: Chapter34Data.set2,
          color: AppColors.primary,
          setTitle: 'वाक्य 56–113',
          setSubtitle: '58 sentences',
          emoji: '📗',
        ),
      ],
    );
  }

  // ─── L4: Set 3 (114–175) ──────────────────────────────────────────────────
  Widget buildSet3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'वाक्य 114–175 — advanced vocabulary और complex expressions।',
          'Sentences 114–175 — advanced vocabulary and complex expressions.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildSetContent(
          data: Chapter34Data.set3,
          color: AppColors.success,
          setTitle: 'वाक्य 114–175',
          setSubtitle: '62 sentences',
          emoji: '📘',
        ),
      ],
    );
  }

  // ─── L5: Set 4 (176–220) ──────────────────────────────────────────────────
  Widget buildSet4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'वाक्य 176–220 — phrasal verbs, emotions और social expressions।',
          'Sentences 176–220 — phrasal verbs, emotions and social expressions.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildSetContent(
          data: Chapter34Data.set4,
          color: AppColors.warning,
          setTitle: 'वाक्य 176–220',
          setSubtitle: '45 sentences',
          emoji: '📙',
        ),
      ],
    );
  }

  // ─── L6: Set 5 (221–266) ──────────────────────────────────────────────────
  Widget buildSet5Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'वाक्य 221–266 — अंतिम और सबसे विविध वाक्य। इन्हें याद करके आपकी English बहुत effective होगी।',
          'Sentences 221–266 — final and most varied sentences. Memorising these will make your English very effective.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildSetContent(
          data: Chapter34Data.set5,
          color: const Color(0xFF7C3AED),
          setTitle: 'वाक्य 221–266',
          setSubtitle: '46 sentences',
          emoji: '📕',
        ),
      ],
    );
  }

  // ─── L7: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '💡', 'title': 'Concept & Introduction', 'hi': 'क्यों और कैसे सीखें'},
      {'emoji': '📖', 'title': 'Sentences 1–55', 'hi': 'Daily use basics'},
      {'emoji': '📗', 'title': 'Sentences 56–113', 'hi': 'Expressions & phrases'},
      {'emoji': '📘', 'title': 'Sentences 114–175', 'hi': 'Advanced vocabulary'},
      {'emoji': '📙', 'title': 'Sentences 176–220', 'hi': 'Phrasal verbs & emotions'},
      {'emoji': '📕', 'title': 'Sentences 221–266', 'hi': 'Complex & social expressions'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 34 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Special & Complex Sentences',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('100', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('266', 'वाक्य'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('इस अध्याय में क्या सीखा', style: AppTextStyles.headingMedium),
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
                  '6/10 या उससे अधिक अंक लाने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}