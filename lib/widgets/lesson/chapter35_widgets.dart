import 'package:flutter/material.dart';
import '../../data/chapter35_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter35Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter35Widgets({required this.commonWidgets, required this.accentColor});

  // ─── Core sentence tile ────────────────────────────────────────────────────
  Widget _sentenceTile(int number, String hindi, String english, Color color) {
    // Strip leading "N. " number prefix if present
    final dot = hindi.indexOf('. ');
    final hindiClean = (dot != -1 && dot < 5) ? hindi.substring(dot + 2) : hindi;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withOpacity(0.15)),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: Text('$number',
                  style: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 10)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindiClean,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary, fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: color, fontSize: 12)),
                    ),
                    commonWidgets.ttsButton(english, color: color),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lessonBanner(String emoji, String title, String sub, Color color,
      List<String> stats) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.75)]),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  fontFamily: 'Nunito', color: Colors.white,
                  fontSize: 18, fontWeight: FontWeight.w800)),
          Text(sub,
              style: const TextStyle(
                  fontFamily: 'Nunito', color: Colors.white70, fontSize: 12)),
          if (stats.isNotEmpty) ...[
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(s,
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12)),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _setCard(String title, String subtitle, Color color,
      List<Map<String, String>> data, int startNum) {
    return commonWidgets.sectionCard(
      title: title,
      subtitle: subtitle,
      color: color,
      child: Column(
        children: data.asMap().entries.map((e) {
          final raw = e.value['hindi']!;
          final dot = raw.indexOf('. ');
          final hindi = (dot != -1 && dot < 5) ? raw.substring(dot + 2) : raw;
          return _sentenceTile(startNum + e.key, hindi, e.value['english']!, color);
        }).toList(),
      ),
    );
  }

  // ─── L1: Polite Expressions ────────────────────────────────────────────────
  Widget buildPoliteContent() {
    final s = Chapter35Data.politeSentences;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये वाक्य रट लें और जब भी मौका मिले प्रयोग करें। विनम्र अभिव्यक्तियाँ आपकी English को बेहतर और प्रभावशाली बनाती हैं।',
          '"Practice makes a man perfect." — Cram these sentences and use them whenever you get an opportunity.',
        ),
        _lessonBanner('🙏', 'Polite Expressions', 'Sentences 1–57', accentColor,
            ['57', 'वाक्य', 'रोज़मर्रा']),
        _setCard('सेट 1', '1–20', accentColor, s.sublist(0, 20), 1),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 2', '21–40', AppColors.primary, s.sublist(20, 40), 21),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 3', '41–57', AppColors.success, s.sublist(40), 41),
      ],
    );
  }

  // ─── L2: Questions 1 (Who, What, How) ─────────────────────────────────────
  Widget buildQuestions1Content() {
    final s = Chapter35Data.questions1Sentences;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'What, Who, How से बनने वाले प्रश्न — ये सबसे आम सवाल हैं जो रोज़मर्रा की बातचीत में आते हैं।',
          'Questions with What, Who, How — the most common questions in daily conversation.',
        ),
        _lessonBanner('❓', 'Questions — What, Who, How',
            'Sentences 58–102', AppColors.accent, ['45', 'वाक्य', 'प्रश्न']),
        _setCard('What Questions', '58–67', AppColors.accent, s.sublist(0, 10), 58),
        const SizedBox(height: AppSpacing.md),
        _setCard('Who Questions', '68–77', const Color(0xFF7C3AED), s.sublist(10, 20), 68),
        const SizedBox(height: AppSpacing.md),
        _setCard('How Questions', '78–92', AppColors.warning, s.sublist(20, 35), 78),
        const SizedBox(height: AppSpacing.md),
        _setCard('When Questions', '93–102', AppColors.success, s.sublist(35), 93),
      ],
    );
  }

  // ─── L3: Questions 2 (When, Where, Why) ───────────────────────────────────
  Widget buildQuestions2Content() {
    final s = Chapter35Data.questions2Sentences;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Why, Where, Shall से बनने वाले प्रश्न — और कुछ सामान्य daily-use questions।',
          'Why, Where, Shall questions — plus common everyday queries.',
        ),
        _lessonBanner('🔍', 'Questions — Why, Where, Shall',
            'Sentences 103–143', AppColors.primary, ['41', 'वाक्य', 'प्रश्न']),
        _setCard('Why Questions', '103–106', AppColors.error, s.sublist(0, 4), 103),
        const SizedBox(height: AppSpacing.md),
        _setCard('Shall / क्या Questions', '107–114', AppColors.primary, s.sublist(4, 12), 107),
        const SizedBox(height: AppSpacing.md),
        _setCard('Who / What inside', '115–130', AppColors.success, s.sublist(12, 28), 115),
        const SizedBox(height: AppSpacing.md),
        _setCard('When / Why / How', '131–143', AppColors.warning, s.sublist(28), 131),
      ],
    );
  }

  // ─── L4: Emotions & Feelings ───────────────────────────────────────────────
  Widget buildEmotionsContent() {
    final s = Chapter35Data.emotionsSentences;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'भावनाओं, रिश्तों और रोज़मर्रा के इस्तेमाल के वाक्य — ये वाक्य आपकी बोलचाल की English को natural बनाते हैं।',
          'Sentences about emotions, relationships, and daily use — these make your spoken English sound natural.',
        ),
        _lessonBanner('💬', 'Emotions & Daily Use',
            'Sentences 144–200', const Color(0xFFFF6B6B),
            ['57', 'वाक्य', 'Emotions']),
        _setCard('सेट 1', '144–165', const Color(0xFFFF6B6B), s.sublist(0, 22), 144),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 2', '166–183', AppColors.primary, s.sublist(22, 40), 166),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 3', '184–200', const Color(0xFF7C3AED), s.sublist(40), 184),
      ],
    );
  }

  // ─── L5: Complex Sentences ─────────────────────────────────────────────────
  Widget buildComplexContent() {
    final s = Chapter35Data.complexSentences;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये जटिल वाक्य हैं जिनमें unless, until, no sooner, even if, provided, the moment जैसे connectors हैं। इन्हें ध्यान से सीखें।',
          'Complex sentences using unless, until, no sooner, even if, provided, the moment — study these carefully.',
        ),
        _lessonBanner('🧠', 'Complex Sentences',
            'Sentences 201–278', AppColors.success,
            ['78', 'वाक्य', 'Complex']),
        _setCard('सेट 1', '201–220', AppColors.success, s.sublist(0, 20), 201),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 2', '221–240', AppColors.accentGold, s.sublist(20, 40), 221),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 3', '241–260', accentColor, s.sublist(40, 60), 241),
        const SizedBox(height: AppSpacing.md),
        _setCard('सेट 4', '261–278', AppColors.primary, s.sublist(60), 261),

        const SizedBox(height: AppSpacing.lg),

        // Quotation card
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.accentGold, AppColors.accentGold.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('💬', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(Chapter35Data.quotation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Nunito', color: Colors.white,
                            fontSize: 14, fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic)),
                  ),
                  commonWidgets.ttsButton(Chapter35Data.quotation,
                      color: Colors.white),
                ],
              ),
              const SizedBox(height: 8),
              Text(Chapter35Data.quotationHindi,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L6: Chapter Quiz Intro ────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    const topics = [
      {'emoji': '🙏', 'title': 'Polite Expressions (1–57)', 'hi': 'As you wish / Feel at home / Beg your pardon'},
      {'emoji': '❓', 'title': 'Questions — What, Who, How (58–102)', 'hi': '45 question sentences'},
      {'emoji': '🔍', 'title': 'Questions — Why, Where, Shall (103–143)', 'hi': '41 more question sentences'},
      {'emoji': '💬', 'title': 'Emotions & Feelings (144–200)', 'hi': 'I am feeling angry / You shouldn\'t have said'},
      {'emoji': '🧠', 'title': 'Complex Sentences (201–278)', 'hi': 'Unless, No sooner, Even if, Provided...'},
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
              const Text('अध्याय 35 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Extensive Translation — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10', 'प्रश्न'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('100', 'XP'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('278', 'वाक्य'),
              ]),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Motivational quote
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Column(
            children: [
              Text('"Practice makes a man perfect."',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.labelLarge
                      .copyWith(color: accentColor, fontStyle: FontStyle.italic)),
              const SizedBox(height: 4),
              Text('"The more you practice, the better you become."',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium
                      .copyWith(fontStyle: FontStyle.italic)),
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
                      ]),
                ),
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 18),
              ]),
            )),

        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(children: [
            Text('💡', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                '6/10 या उससे अधिक अंक लाने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}