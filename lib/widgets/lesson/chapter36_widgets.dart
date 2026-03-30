import 'package:flutter/material.dart';
import '../../data/chapter36_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter36Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter36Widgets({required this.commonWidgets, required this.accentColor});

  // ─── MCQ card ──────────────────────────────────────────────────────────────
  // Shows a fill-in-the-blank question with options A/B/C/D/E and reveals
  // the correct answer + explanation inline
  Widget _mcqCard(int number, String sentence, List<String> options,
      int correctIdx, String explanation, Color color) {
    // Option labels
    const labels = ['A', 'B', 'C', 'D', 'E'];

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
          // Question header
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.07),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.lg)),
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
                            fontWeight: FontWeight.w800, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(sentence,
                      style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                ),
              ],
            ),
          ),
          // Options
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: options.asMap().entries.map((e) {
                final i = e.key;
                final isCorrect = i == correctIdx;
                return Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? color.withOpacity(0.1)
                        : AppColors.lockedBg,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(
                      color: isCorrect ? color : AppColors.locked,
                      width: isCorrect ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 22, height: 22,
                        decoration: BoxDecoration(
                          color: isCorrect ? color : AppColors.locked,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(labels[i],
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: isCorrect ? Colors.white : AppColors.textSecondary,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(e.value,
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: isCorrect ? color : AppColors.textSecondary,
                                fontWeight: isCorrect ? FontWeight.w700 : FontWeight.w400)),
                      ),
                      if (isCorrect)
                        Icon(Icons.check_circle_rounded, color: color, size: 18),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          // Explanation
          Container(
            margin: const EdgeInsets.fromLTRB(
                AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withOpacity(0.05),
              borderRadius: BorderRadius.circular(AppRadius.sm),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('💡', style: const TextStyle(fontSize: 14)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(explanation,
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionBanner(String emoji, String title, String subtitle,
      Color color, List<String> stats) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, color.withOpacity(0.75)]),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  fontFamily: 'Nunito', color: Colors.white,
                  fontSize: 18, fontWeight: FontWeight.w800)),
          Text(subtitle,
              style: const TextStyle(
                  fontFamily: 'Nunito', color: Colors.white70, fontSize: 12)),
          if (stats.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: stats
                  .map((s) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(s,
                            style: const TextStyle(
                                fontFamily: 'Nunito', color: Colors.white,
                                fontWeight: FontWeight.w700, fontSize: 11)),
                      ))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }

  // ─── Build questions from data ─────────────────────────────────────────────
  Widget _buildFromData(
      List<Map<String, dynamic>> data, Color color, int startNum) {
    return Column(
      children: data.asMap().entries.map((e) {
        final q = e.value;
        return _mcqCard(
          startNum + e.key,
          q['sentence'] as String,
          List<String>.from(q['options'] as List),
          q['correct'] as int,
          q['explanation'] as String,
          color,
        );
      }).toList(),
    );
  }

  // ─── L1: Verbs Part 1 ──────────────────────────────────────────────────────
  Widget buildVerbs1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'रिक्त स्थानों को सही क्रिया या सहायक क्रिया से भरें। सही उत्तर हरे रंग में दिखाया गया है।',
          'Fill in the blanks with appropriate verbs/helping verbs. The correct answer is shown in green.',
        ),
        _sectionBanner('✏️', 'Verbs', 'Q 1–25', accentColor, ['25', 'Questions', 'Verbs']),
        ...Chapter36Data.verbs1Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 1,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              accentColor,
            )),
      ],
    );
  }

  // ─── L2: Verbs Part 2 ──────────────────────────────────────────────────────
  Widget buildVerbs2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Verbs exercise जारी। Q 26–50 में और अधिक challenging sentences हैं।',
          'Verbs exercise continued. Q 26–50 with more challenging sentences.',
        ),
        _sectionBanner('🖊️', 'Verbs', 'Q 26–50', AppColors.primary, ['25', 'Questions', 'Verbs']),
        ...Chapter36Data.verbs2Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 26,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              AppColors.primary,
            )),
        const SizedBox(height: AppSpacing.lg),
        _answerSheetCard(
          'Answer Sheet — Verbs (1–50)',
          _verbsAnswerKey,
          AppColors.primary,
        ),
      ],
    );
  }

  // ─── L3: Articles Part 1 ───────────────────────────────────────────────────
  Widget buildArticles1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'रिक्त स्थानों में सही Article भरें — A, An, The या No Article। Articles के rules याद रखें।',
          'Fill in with correct Article — A, An, The or No Article. Remember the rules.',
        ),
        _sectionBanner('📝', 'Articles', 'Q 1–25', AppColors.success,
            ['25', 'Questions', 'A/An/The']),
        _articleRulesCard(),
        const SizedBox(height: AppSpacing.md),
        ...Chapter36Data.articles1Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 1,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              AppColors.success,
            )),
      ],
    );
  }

  // ─── L4: Articles Part 2 ───────────────────────────────────────────────────
  Widget buildArticles2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Articles exercise जारी। Q 26–50।',
          'Articles exercise continued. Q 26–50.',
        ),
        _sectionBanner('📄', 'Articles', 'Q 26–50', AppColors.warning,
            ['25', 'Questions', 'A/An/The']),
        ...Chapter36Data.articles2Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 26,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              AppColors.warning,
            )),
        const SizedBox(height: AppSpacing.lg),
        _answerSheetCard(
          'Answer Sheet — Articles (1–50)',
          _articlesAnswerKey,
          AppColors.warning,
        ),
      ],
    );
  }

  // ─── L5: Prepositions Part 1 ───────────────────────────────────────────────
  Widget buildPrep1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'रिक्त स्थानों में सही Preposition भरें। Phrasal verbs और fixed expressions का ध्यान रखें।',
          'Fill in with correct Preposition. Pay attention to phrasal verbs and fixed expressions.',
        ),
        _sectionBanner('🔗', 'Prepositions', 'Q 1–38',
            const Color(0xFF7C3AED), ['38', 'Questions', 'Prep']),
        _prepRulesCard(),
        const SizedBox(height: AppSpacing.md),
        ...Chapter36Data.prep1Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 1,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              const Color(0xFF7C3AED),
            )),
      ],
    );
  }

  // ─── L6: Prepositions Part 2 ───────────────────────────────────────────────
  Widget buildPrep2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Prepositions exercise जारी। Q 39–75।',
          'Prepositions exercise continued. Q 39–75.',
        ),
        _sectionBanner('⛓️', 'Prepositions', 'Q 39–75',
            AppColors.error, ['37', 'Questions', 'Prep']),
        ...Chapter36Data.prep2Questions.asMap().entries.map((e) => _mcqCard(
              e.key + 39,
              e.value.questionEn,
              e.value.options,
              e.value.correctIndex,
              e.value.explanation,
              AppColors.error,
            )),
        const SizedBox(height: AppSpacing.lg),
        _answerSheetCard(
          'Answer Sheet — Prepositions (1–75)',
          _prepAnswerKey,
          AppColors.error,
        ),
      ],
    );
  }

  // ─── Quick reference cards ────────────────────────────────────────────────

  Widget _articleRulesCard() {
    final rules = [
      {'rule': 'A', 'when': 'Consonant sound से शुरू', 'ex': 'a book, a university, a union'},
      {'rule': 'An', 'when': 'Vowel sound से शुरू', 'ex': 'an apple, an hour, an honest man'},
      {'rule': 'The', 'when': 'Specific / Superlative / Unique', 'ex': 'the best, the Sun, the PM'},
      {'rule': 'No article', 'when': 'City / Country / Language / Subject', 'ex': 'in Delhi, at home, at night'},
    ];
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.success.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📌 Quick Article Rules',
              style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const SizedBox(height: AppSpacing.sm),
          ...rules.map((r) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 34, height: 22,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: Center(
                        child: Text(r['rule']!,
                            style: const TextStyle(
                                fontFamily: 'Nunito', color: Colors.white,
                                fontWeight: FontWeight.w800, fontSize: 11)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r['when']!,
                              style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                          Text(r['ex']!,
                              style: AppTextStyles.bodyMedium.copyWith(
                                  fontSize: 10, color: AppColors.success,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _prepRulesCard() {
    final pairs = [
      ['in + city/country', 'on + day/date', 'at + time/place'],
      ['for + duration', 'since + point', 'by + deadline'],
      ['of + possession', 'to + direction', 'with + instrument'],
      ['among (3+)', 'between (2)', 'across (other side)'],
      ['tired of', 'addicted to', 'ashamed of'],
      ['inferior/superior to', 'look into', 'take care of'],
    ];
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF7C3AED).withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: const Color(0xFF7C3AED).withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('📌 Quick Preposition Rules',
              style: AppTextStyles.labelLarge
                  .copyWith(color: const Color(0xFF7C3AED))),
          const SizedBox(height: AppSpacing.sm),
          ...pairs.map((row) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  children: row
                      .map((item) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 4),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7C3AED).withOpacity(0.08),
                                borderRadius: BorderRadius.circular(AppRadius.sm),
                              ),
                              child: Text(item,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                      fontSize: 10,
                                      color: const Color(0xFF7C3AED))),
                            ),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }

  Widget _answerSheetCard(
      String title, List<List<String>> rows, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTextStyles.labelLarge.copyWith(color: color)),
          const SizedBox(height: AppSpacing.sm),
          ...rows.map((row) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: row
                      .map((cell) => Expanded(
                            child: Text(cell,
                                style: AppTextStyles.bodyMedium
                                    .copyWith(fontSize: 11, color: color)),
                          ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }

  // ─── Answer key data ──────────────────────────────────────────────────────

  static const List<List<String>> _verbsAnswerKey = [
    ['1.A', '2.B', '3.B', '4.C', '5.B', '6.C', '7.C', '8.B', '9.A', '10.B'],
    ['11.D', '12.C', '13.D', '14.C', '15.D', '16.E', '17.C', '18.B', '19.B', '20.A'],
    ['21.C', '22.C', '23.D', '24.B', '25.C', '26.C', '27.B', '28.A', '29.B', '30.B'],
    ['31.A', '32.D', '33.B', '34.D', '35.B', '36.A', '37.A', '38.D', '39.E', '40.C'],
    ['41.C', '42.C', '43.E', '44.A', '45.C', '46.A', '47.C', '48.D', '49.A', '50.E'],
  ];

  static const List<List<String>> _articlesAnswerKey = [
    ['1.D', '2.D', '3.D', '4.D', '5.A', '6.C', '7.D', '8.B', '9.A', '10.D'],
    ['11.A', '12.A', '13.D', '14.D', '15.A', '16.A', '17.C', '18.A', '19.D', '20.A'],
    ['21.B', '22.D', '23.B', '24.C', '25.B', '26.B', '27.D', '28.B', '29.A', '30.D'],
    ['31.A', '32.B', '33.B', '34.C', '35.D', '36.D', '37.D', '38.A', '39.D', '40.A'],
    ['41.D', '42.A', '43.D', '44.B', '45.A', '46.D', '47.D', '48.A', '49.A', '50.D'],
  ];

  static const List<List<String>> _prepAnswerKey = [
    ['1.D', '2.E', '3.E', '4.C', '5.C', '6.D', '7.C', '8.C', '9.E', '10.B'],
    ['11.A', '12.C', '13.C', '14.B', '15.B', '16.C', '17.D', '18.B', '19.B', '20.B'],
    ['21.A', '22.D', '23.C', '24.D', '25.A', '26.E', '27.C', '28.A', '29.C', '30.C'],
    ['31.D', '32.B', '33.C', '34.A', '35.A', '36.C', '37.B', '38.A', '39.B', '40.D'],
    ['41.D', '42.A', '43.C', '44.E', '45.C', '46.C', '47.B', '48.C', '49.A', '50.B'],
    ['51.E', '52.A', '53.E', '54.E', '55.E', '56.B', '57.C', '58.C', '59.C', '60.C'],
    ['61.C', '62.D', '63.C', '64.C', '65.D', '66.A', '67.A', '68.B', '69.E', '70.B'],
    ['71.C', '72.A', '73.B', '74.D', '75.C'],
  ];

  // ─── L7: Chapter Quiz Intro ────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    const topics = [
      {'emoji': '✏️', 'title': 'Verbs (Q 1–50)', 'hi': 'have/has/do/does/V1/V3/Tense forms'},
      {'emoji': '📝', 'title': 'Articles (Q 1–50)', 'hi': 'A/An/The/No article — rules & exceptions'},
      {'emoji': '🔗', 'title': 'Prepositions (Q 1–75)', 'hi': 'in/on/at/of/to/for/since/with/by...'},
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
              const Text('अध्याय 36 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Objective Exercises — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10', 'प्रश्न'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('100', 'XP'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('175', 'MCQs'),
              ]),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Stats row
        Row(
          children: [
            _statBox('50', 'Verb\nQuestions', accentColor),
            const SizedBox(width: AppSpacing.sm),
            _statBox('50', 'Article\nQuestions', AppColors.success),
            const SizedBox(width: AppSpacing.sm),
            _statBox('75', 'Preposition\nQuestions', const Color(0xFF7C3AED)),
          ],
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
                'अगर किसी विकल्प में गलती हो तो वापस जाकर उस Chapter को दोबारा पढ़ें।\nIf you find difficulty, go back and revise the respective chapter.',
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _statBox(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(
          children: [
            Text(value,
                style: AppTextStyles.displayMedium.copyWith(color: color)),
            Text(label,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}