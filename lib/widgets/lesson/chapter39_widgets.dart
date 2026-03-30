import 'package:flutter/material.dart';
import '../../data/chapter39_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter39Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter39Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Mixed Test I
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildTest1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _progressBanner(),
        const SizedBox(height: AppSpacing.lg),
        // Q1 — Translation
        _sectionHeader('Q1', 'Hindi → English Translation', '30 वाक्य', Icons.translate_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test1Translations.asMap().entries.map(
          (e) => _translationCard(e.key + 1, e.value['hi']!, e.value['en']!),
        ),
        const SizedBox(height: AppSpacing.xl),
        // Q2 — Correction
        _sectionHeader('Q2', 'Sentence Correction', '20 वाक्य', Icons.spellcheck_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test1Corrections.asMap().entries.map(
          (e) => _correctionCard(e.key + 1, e.value),
        ),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter39Data.motivationalQuotes.sublist(0, 3)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Mixed Test II
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildTest2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस टेस्ट में सही वर्तनी, वाक्य सुधार और अनुवाद का अभ्यास है।',
          'This test covers correct spelling, sentence checking and translation.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Q1 — Spelling
        _sectionHeader('Q1', 'Correct Spelling', '5 शब्द', Icons.abc_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test2Spellings.asMap().entries.map(
          (e) => _spellingCard(e.key + 1, e.value),
        ),
        const SizedBox(height: AppSpacing.xl),
        // Q2 — Correct/Incorrect
        _sectionHeader('Q2', 'Correct or Incorrect?', '15 वाक्य', Icons.check_circle_outline_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test2SentenceCheck.asMap().entries.map(
          (e) => _correctionCard(e.key + 1, e.value),
        ),
        const SizedBox(height: AppSpacing.xl),
        // Q3 — Translation En→Hi
        _sectionHeader('Q3', 'English → Hindi Translation', '15 वाक्य', Icons.swap_horiz_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test2Translations.asMap().entries.map(
          (e) => _translationCard(e.key + 1, e.value['en']!, e.value['hi']!, enToHi: true),
        ),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter39Data.motivationalQuotes.sublist(3, 6)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Mixed Test III
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildTest3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस टेस्ट में Tense सुधार, अनुवाद और क्रिया के तीन रूपों का अभ्यास है।',
          'This test covers Tense corrections, Hindi-to-English translation, and verb forms.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Q1 — Tense Corrections
        _sectionHeader('Q1', 'Tense Corrections', '10 वाक्य', Icons.access_time_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test3Corrections.asMap().entries.map(
          (e) => _tenseCorrectCard(e.key + 1, e.value),
        ),
        const SizedBox(height: AppSpacing.xl),
        // Q2 — Translation
        _sectionHeader('Q2', 'Hindi → English', '10 वाक्य', Icons.translate_rounded),
        const SizedBox(height: AppSpacing.md),
        ...Chapter39Data.test3Translations.asMap().entries.map(
          (e) => _translationCard(e.key + 1, e.value['hi']!, e.value['en']!),
        ),
        const SizedBox(height: AppSpacing.xl),
        // Q3 & Q4 — Verb Forms
        _sectionHeader('Q3 & Q4', 'Three Forms of Verbs', '10 क्रियाएँ', Icons.format_list_numbered_rounded),
        const SizedBox(height: AppSpacing.md),
        _verbFormsTable(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter39Data.motivationalQuotes.sublist(4)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Mixed Test IV
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildTest4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस टेस्ट में अनुवाद और शब्दों के अर्थ का अभ्यास है।',
          'This test covers Hindi-to-English translation (with marks) and word meanings.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Q1 — Translations with marks
        _sectionHeader('Q1', 'Hindi → English', '30 वाक्य (1–3 marks)', Icons.translate_rounded),
        const SizedBox(height: AppSpacing.md),
        // 1-mark section
        _marksSubHeader('1 mark each', AppColors.success),
        const SizedBox(height: AppSpacing.sm),
        ...Chapter39Data.test4Translations
            .where((t) => t['marks'] == 1)
            .toList()
            .asMap()
            .entries
            .map((e) => _translationCard(e.key + 1, e.value['hi'] as String, e.value['en'] as String, marks: 1)),
        const SizedBox(height: AppSpacing.lg),
        _marksSubHeader('2 marks each', AppColors.warning),
        const SizedBox(height: AppSpacing.sm),
        ...Chapter39Data.test4Translations
            .where((t) => t['marks'] == 2)
            .toList()
            .asMap()
            .entries
            .map((e) => _translationCard(e.key + 11, e.value['hi'] as String, e.value['en'] as String, marks: 2)),
        const SizedBox(height: AppSpacing.lg),
        _marksSubHeader('3 marks each', accentColor),
        const SizedBox(height: AppSpacing.sm),
        ...Chapter39Data.test4Translations
            .where((t) => t['marks'] == 3)
            .toList()
            .asMap()
            .entries
            .map((e) => _translationCard(e.key + 21, e.value['hi'] as String, e.value['en'] as String, marks: 3)),
        const SizedBox(height: AppSpacing.xl),
        // Q2 — Vocabulary
        _sectionHeader('Q2', 'Word Meanings', '40 शब्द', Icons.menu_book_rounded),
        const SizedBox(height: AppSpacing.md),
        _vocabularyGrid(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter39Data.motivationalQuotes),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📝', 'title': 'Mixed Test I',   'hi': 'Translation (30) + Sentence Correction (20)'},
      {'emoji': '🔤', 'title': 'Mixed Test II',  'hi': 'Spelling (5) + Correct/Incorrect (15) + Translation (15)'},
      {'emoji': '⏱️', 'title': 'Mixed Test III', 'hi': 'Tense Correction (10) + Translation (10) + Verb Forms (10)'},
      {'emoji': '📖', 'title': 'Mixed Test IV',  'hi': 'Translation (30) + Word Meanings (40)'},
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
            const Text('अध्याय 39 — फ़ाइनल क्विज़',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Mixed Test Papers — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('100', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('4', 'टेस्ट'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        // Score info
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Row(children: [
            Text('📊', style: const TextStyle(fontSize: 22)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('80% से कम = वापस जाएं और दोहराएं',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: 2),
              Text('Score below 80%? Go back and revise the lessons.',
                  style: AppTextStyles.bodyMedium),
            ])),
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
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Expanded(child: Text(
              '8/10 सही जवाब देने पर अध्याय पूरा होगा।\nScore 8/10 or more to complete the chapter!',
              style: AppTextStyles.bodyMedium)),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _progressBanner() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accentColor.withOpacity(0.12), accentColor.withOpacity(0.04)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('📊', style: TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text('अपनी Progress जाँचें',
              style: AppTextStyles.headingMedium.copyWith(color: accentColor))),
        ]),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'इन mixed test papers में 80% से ज़्यादा score करें। अगर नहीं, तो पिछले lessons दोहराएं।',
          style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Score more than 80% in these tests. If not, go back and revise the lessons.',
          style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary, fontStyle: FontStyle.italic, height: 1.5),
        ),
      ]),
    );
  }

  Widget _sectionHeader(String qNo, String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: accentColor, borderRadius: BorderRadius.circular(AppRadius.full)),
          child: Text(qNo,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 13)),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          Text(subtitle,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
        ])),
        Icon(icon, color: accentColor.withOpacity(0.5), size: 22),
      ]),
    );
  }

  Widget _marksSubHeader(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(label,
          style: AppTextStyles.labelSmall.copyWith(color: color, fontWeight: FontWeight.w700)),
    );
  }

  /// Translation card: Hindi on top, English answer revealed below (tap to reveal)
  Widget _translationCard(int num, String from, String to,
      {bool enToHi = false, int marks = 0}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.08)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.lg - 2),
              topRight: Radius.circular(AppRadius.lg - 2),
            ),
          ),
          child: Row(children: [
            Container(
              width: 28, height: 28,
              decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
              child: Center(child: Text('$num',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: accentColor))),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(from,
                style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600, height: 1.4))),
            if (marks > 0) ...[
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: marks == 1
                      ? AppColors.success.withOpacity(0.15)
                      : marks == 2
                          ? AppColors.warning.withOpacity(0.15)
                          : accentColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text('$marks mk',
                    style: AppTextStyles.labelSmall.copyWith(
                        color: marks == 1
                            ? AppColors.success
                            : marks == 2
                                ? AppColors.warning
                                : accentColor,
                        fontSize: 10)),
              ),
            ],
            commonWidgets.ttsButton(from),
          ]),
        ),
        // Answer
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('✅ ', style: TextStyle(fontSize: 14)),
            Expanded(child: Text(to,
                style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.success, fontWeight: FontWeight.w600, height: 1.4))),
            commonWidgets.ttsButton(to),
          ]),
        ),
      ]),
    );
  }

  /// Correction card: shows original + correct/incorrect badge + corrected sentence + rule
  Widget _correctionCard(int num, Map<String, dynamic> item) {
    final isCorrect = item['correct'] as bool;
    final correctedText = item['corrected'] as String;
    final rule = item['rule'] as String;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(
            color: isCorrect
                ? AppColors.success.withOpacity(0.3)
                : AppColors.error.withOpacity(0.3)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header with original sentence
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          decoration: BoxDecoration(
            color: isCorrect
                ? AppColors.success.withOpacity(0.06)
                : AppColors.error.withOpacity(0.05),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.lg - 2),
              topRight: Radius.circular(AppRadius.lg - 2),
            ),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 26, height: 26,
              decoration: BoxDecoration(
                  color: isCorrect ? AppColors.success : AppColors.error,
                  shape: BoxShape.circle),
              child: Center(child: Text('$num',
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 11))),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(item['original'] as String,
                style: AppTextStyles.bodyMedium.copyWith(height: 1.4))),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isCorrect ? AppColors.success : AppColors.error,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(isCorrect ? '✓ Correct' : '✗ Wrong',
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 11)),
            ),
          ]),
        ),
        // Corrected sentence (only if wrong)
        if (!isCorrect) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.success),
              const SizedBox(width: 6),
              Expanded(child: Text(correctedText,
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w600,
                      height: 1.4))),
              commonWidgets.ttsButton(correctedText),
            ]),
          ),
        ],
        // Grammar rule
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Row(children: [
              const Text('📌 ', style: TextStyle(fontSize: 12)),
              Expanded(child: Text(rule,
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, height: 1.4))),
            ]),
          ),
        ),
      ]),
    );
  }

  /// Same as correctionCard but uses a simpler tense-focused layout
  Widget _tenseCorrectCard(int num, Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: AppColors.error.withOpacity(0.2)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.04),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.lg - 2),
              topRight: Radius.circular(AppRadius.lg - 2),
            ),
          ),
          child: Row(children: [
            Container(
              width: 26, height: 26,
              decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
              child: Center(child: Text('$num',
                  style: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w700, fontSize: 11))),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(item['original'] as String,
                style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.error, height: 1.4))),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
          child: Row(children: [
            Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.success),
            const SizedBox(width: 6),
            Expanded(child: Text(item['corrected'] as String,
                style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.success, fontWeight: FontWeight.w600))),
            commonWidgets.ttsButton(item['corrected'] as String),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppRadius.sm)),
            child: Text('📌  ${item['rule']}',
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, height: 1.4)),
          ),
        ),
      ]),
    );
  }

  /// Spelling card: shows all 4 options, highlights correct one
  Widget _spellingCard(int num, Map<String, dynamic> item) {
    final options = (item['options'] as List).cast<String>();
    final correctIdx = item['correctIndex'] as int;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 26, height: 26,
            decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
            child: Center(child: Text('$num',
                style: const TextStyle(
                    fontFamily: 'Nunito', color: Colors.white,
                    fontWeight: FontWeight.w700, fontSize: 11))),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('Choose the correct spelling:',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary)),
        ]),
        const SizedBox(height: AppSpacing.sm),
        Wrap(spacing: 8, runSpacing: 8,
          children: options.asMap().entries.map((e) {
            final isRight = e.key == correctIdx;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isRight ? AppColors.success.withOpacity(0.1) : AppColors.lockedBg,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(
                    color: isRight ? AppColors.success : AppColors.locked,
                    width: isRight ? 2 : 1),
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                if (isRight) ...[
                  const Icon(Icons.check_rounded, size: 14, color: AppColors.success),
                  const SizedBox(width: 4),
                ],
                Text(e.value,
                    style: AppTextStyles.labelLarge.copyWith(
                        color: isRight ? AppColors.success : AppColors.textSecondary,
                        fontSize: 13)),
              ]),
            );
          }).toList(),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(children: [
          Text('✅ Correct: ', style: AppTextStyles.labelSmall.copyWith(color: AppColors.success)),
          Text(item['word'] as String,
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const Spacer(),
          commonWidgets.ttsButton(item['word'] as String),
        ]),
      ]),
    );
  }

  /// Verb forms table
  Widget _verbFormsTable() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(children: [
        // Table header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.lg - 2),
              topRight: Radius.circular(AppRadius.lg - 2),
            ),
          ),
          child: Row(children: [
            Expanded(flex: 3, child: Text('Hindi', style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
            Expanded(flex: 2, child: Text('V1', style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
            Expanded(flex: 2, child: Text('V2', style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
            Expanded(flex: 2, child: Text('V3', style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
            const SizedBox(width: 32),
          ]),
        ),
        ...Chapter39Data.test3VerbForms.asMap().entries.map((e) {
          final v = e.value;
          final isLast = e.key == Chapter39Data.test3VerbForms.length - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
            decoration: BoxDecoration(
              border: isLast ? null : const Border(
                  bottom: BorderSide(color: AppColors.lockedBg)),
            ),
            child: Row(children: [
              Expanded(flex: 3, child: Text(v['hindi']!,
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12))),
              Expanded(flex: 2, child: Text(v['v1']!,
                  style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
              Expanded(flex: 2, child: Text(v['v2']!,
                  style: AppTextStyles.bodyMedium.copyWith(color: accentColor, fontSize: 13))),
              Expanded(flex: 2, child: Text(v['v3']!,
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.success, fontSize: 13))),
              commonWidgets.ttsButton(v['v1']!),
            ]),
          );
        }),
      ]),
    );
  }

  /// Vocabulary grid — 2 columns
  Widget _vocabularyGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2.2,
      ),
      itemCount: Chapter39Data.test4Vocabulary.length,
      itemBuilder: (context, i) {
        final v = Chapter39Data.test4Vocabulary[i];
        return GestureDetector(
          onTap: () => commonWidgets.onSpeak(v['word']!),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: accentColor.withOpacity(0.15)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(child: Text(v['word']!,
                      style: AppTextStyles.labelLarge.copyWith(
                          color: accentColor, fontSize: 12),
                      overflow: TextOverflow.ellipsis)),
                  Icon(Icons.volume_up_rounded,
                      size: 14, color: accentColor.withOpacity(0.5)),
                ]),
                const SizedBox(height: 2),
                Text(v['hindi']!,
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 11),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _quotesSection(List<String> quotes) {
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
          Text('Motivational Quotes',
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...quotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('❝ ', style: TextStyle(fontSize: 16, color: AppColors.accentGold)),
                Expanded(child: Text(q,
                    style: AppTextStyles.bodyMedium.copyWith(
                        fontStyle: FontStyle.italic, height: 1.5))),
                commonWidgets.ttsButton(q, color: AppColors.accentGold),
              ]),
            )),
      ]),
    );
  }
}