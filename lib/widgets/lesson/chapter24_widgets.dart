import 'package:flutter/material.dart';
import '../../data/chapter24_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter24Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter24Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _ruleBox(String text, {String? emoji}) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji ?? '📌', style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String badge) {
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

  Widget _practiceTile(int number, String hindi, String english, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
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

  /// Reversed tile — English on top, Hindi as answer
  Widget _testTile1(int number, String english, String hindi, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
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
                const SizedBox(height: 4),
                Text(hindi, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _practiceSetCard({
    required String title,
    required String subtitle,
    required Color color,
    required List<Map<String, String>> data,
    required int startIndex,
    bool reversed = false,
  }) {
    return commonWidgets.sectionCard(
      title: title,
      subtitle: subtitle,
      color: color,
      child: Column(
        children: data.asMap().entries.map((e) {
          final raw = e.value[reversed ? 'english' : 'hindi']!;
          final dotIdx = raw.indexOf('. ');
          final primary = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
          final secondary = e.value[reversed ? 'hindi' : 'english']!;
          return reversed
              ? _testTile1(startIndex + e.key, primary, secondary, color)
              : _practiceTile(startIndex + e.key, primary, secondary, color);
        }).toList(),
      ),
    );
  }

  // ─── L1: Concept & Rules ──────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इन वाक्यों में Subject काम को करता नहीं बल्कि करने देता है। "करने देना" खुद में एक क्रिया है जिसे "Let" कहते हैं।',
          'In these sentences, the Subject doesn\'t do the work but allows it to be done. "Let" itself is the main verb.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Key concept banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              const Text('🔓', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 6),
              const Text('Let = करने देना',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Text('Let  /  Let  /  Let  (तीनों forms समान)',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13)),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        _ruleBox(
          'नियम (Rule):\n'
          '• "Let" मुख्य क्रिया की तरह प्रयोग होती है।\n'
          '• दूसरी क्रिया (जो काम करने दिया जाता है) Object के बाद आती है।\n'
          '• दूसरी क्रिया हमेशा 1st form (bare infinitive) में होती है।\n\n'
          'Formula: Sub + Let + Object + Verb 1st form',
          emoji: '📌',
        ),

        _sectionHeader('उदाहरण — Present, Past, Future', '4 examples'),
        ...Chapter24Data.conceptExamples.map((e) {
          return Container(
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
                // Tense badge
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(e['tense']!,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 11)),
                    ),
                    const SizedBox(width: 8),
                    Text(e['note']!,
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(e['hindi']!, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(e['english']!,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: accentColor, fontSize: 13)),
                    ),
                    commonWidgets.ttsButton(e['english']!),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text('Subject: ${e['subject']!}',
                      style: AppTextStyles.labelSmall
                          .copyWith(color: AppColors.primary)),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'याद रखें:\n'
          '• "I let you sleep." → मैं तुम्हें सोने देता हूँ।\n'
          '• मुख्य क्रिया = Let (करने देना)\n'
          '• दूसरी क्रिया = Sleep (सोना) → Object के बाद\n'
          '• Subject काम खुद नहीं करता — करने देता है।',
          emoji: '💡',
        ),
      ],
    );
  }

  // ─── L2: All Tenses Table ─────────────────────────────────────────────────
  Widget buildTensesContent() {
    final colors = [
      accentColor,
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      const Color(0xFF7C3AED),
      AppColors.accent,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दी गई तालिका से समझें कि "Let" का प्रयोग सभी Tenses और Modals में कैसे होता है।',
          'The table below shows how "Let" works across all Tenses and Modals.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Formula quick reference
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
              Text('📐 Quick Formula Reference',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: AppSpacing.sm),
              _formulaRow('Present Indefinite', 'Sub + Let/Lets + Obj + V1'),
              _formulaRow('Past Indefinite', 'Sub + Let + Obj + V1'),
              _formulaRow('Present Continuous', 'Sub + is/am/are + letting + Obj + V1'),
              _formulaRow('Future Indefinite', 'Sub + Will + Let + Obj + V1'),
              _formulaRow('Modal (can/should...)', 'Sub + Modal + Let + Obj + V1'),
              _formulaRow('Negative', 'Add "not/never/don\'t/didn\'t/won\'t"'),
              _formulaRow('Interrogative', 'Helping verb/Will/Did at start'),
            ],
          ),
        ),

        _sectionHeader('तालिका — Normal vs Let', '12 pairs'),

        ...Chapter24Data.tensesTable.asMap().entries.map((e) {
          final i = e.key;
          final row = e.value;
          final isLet = row['verb']!.contains('Let');
          final c = isLet ? accentColor : AppColors.textSecondary;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: isLet
                  ? accentColor.withOpacity(0.05)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(
                color: isLet
                    ? accentColor.withOpacity(0.25)
                    : AppColors.locked,
              ),
              boxShadow: isLet ? AppShadows.card : [],
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colors[i % colors.length].withOpacity(isLet ? 1 : 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${i + 1}',
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
                      Text(row['hindi']!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.textPrimary)),
                      Row(
                        children: [
                          Expanded(
                            child: Text(row['english']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: c, fontSize: 12)),
                          ),
                          if (isLet)
                            commonWidgets.ttsButton(row['english']!,
                                color: accentColor),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(row['note']!,
                      style: AppTextStyles.labelSmall
                          .copyWith(color: c, fontSize: 9)),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _formulaRow(String label, String formula) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.textSecondary, fontSize: 11)),
          ),
          Expanded(
            child: Text(formula,
                style: AppTextStyles.labelSmall
                    .copyWith(color: accentColor, fontSize: 11)),
          ),
        ],
      ),
    );
  }

  // ─── L3: Quotations ───────────────────────────────────────────────────────
  Widget buildQuotationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'महान व्यक्तियों द्वारा कही गई प्रेरणादायक बातें — इन्हें पढ़ें, समझें और याद करें।',
          'Inspiring quotations by great personalities — read, understand and remember.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter24Data.quotations.asMap().entries.map((e) {
          final i = e.key;
          final q = e.value;
          final colors = [
            accentColor,
            AppColors.primary,
            AppColors.success,
            AppColors.warning,
            const Color(0xFF7C3AED),
            AppColors.accent,
          ];
          final c = colors[i % colors.length];
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.25)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 13)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(q['english']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: c, fontSize: 13)),
                          ),
                          commonWidgets.ttsButton(q['english']!, color: c),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q['hindi']!, style: AppTextStyles.bodyMedium),
                      if (q.containsKey('author')) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: c.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text('— ${q['author']!}',
                              style:
                                  AppTextStyles.labelSmall.copyWith(color: c)),
                        ),
                      ],
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

  // ─── L4: Practice Exercise ─────────────────────────────────────────────────
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में "Let" (करने देना) के 96 अभ्यास वाक्य हैं।',
          'Practice 96 sentences with "Let" across all tenses.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('96', 'वाक्य'),
              commonWidgets.quizStatBadge('4', 'सेट'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
            title: 'सेट 1', subtitle: 'Q 1–25', color: accentColor,
            data: Chapter24Data.practiceSet1, startIndex: 1),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 2', subtitle: 'Q 26–50', color: AppColors.primary,
            data: Chapter24Data.practiceSet2, startIndex: 26),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 3', subtitle: 'Q 51–75', color: AppColors.success,
            data: Chapter24Data.practiceSet3, startIndex: 51),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 4', subtitle: 'Q 76–96', color: AppColors.warning,
            data: Chapter24Data.practiceSet4, startIndex: 76),
      ],
    );
  }

  // ─── L5: Test Paper I — English → Hindi ──────────────────────────────────
  Widget buildTestPaper1Content() {
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
              const Text('📝', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र I',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper I — English → Hindi',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('30', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('30 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Eng→Hindi', 'दिशा'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: Hindi में अनुवाद करें',
          subtitle: '1–15',
          color: accentColor,
          data: Chapter24Data.testPaper1Sentences.sublist(0, 15),
          startIndex: 1,
          reversed: true,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'Q1: Hindi में अनुवाद करें (जारी)',
          subtitle: '16–30',
          color: AppColors.primary,
          data: Chapter24Data.testPaper1Sentences.sublist(15),
          startIndex: 16,
          reversed: true,
        ),

        const SizedBox(height: AppSpacing.xl),

        // Quotations section
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💬 Quotations (Test I)',
                  style: AppTextStyles.headingMedium
                      .copyWith(color: AppColors.accentGold)),
              const SizedBox(height: AppSpacing.md),
              ...[
                'To succeed in your mission, you must have single-minded devotion to your goal.',
                'To live a creative life, we must lose our fear of being wrong.',
                'When I dare to be powerful — to use my strength in the service of my vision, then it becomes less important whether I am afraid.',
              ].asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.key + 1}. ',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.accentGold)),
                        Expanded(
                          child: Text(e.value,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(fontStyle: FontStyle.italic)),
                        ),
                        commonWidgets.ttsButton(e.value,
                            color: AppColors.accentGold),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L6: Test Paper II — Hindi → English ─────────────────────────────────
  Widget buildTestPaper2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('📋', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र II',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper II — Hindi → English',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('30', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('30 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Hindi→Eng', 'दिशा'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: English में अनुवाद करें',
          subtitle: '1–15',
          color: AppColors.primary,
          data: Chapter24Data.testPaper2Sentences.sublist(0, 15),
          startIndex: 1,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'Q1: English में अनुवाद करें (जारी)',
          subtitle: '16–30',
          color: const Color(0xFF7C3AED),
          data: Chapter24Data.testPaper2Sentences.sublist(15),
          startIndex: 16,
        ),

        const SizedBox(height: AppSpacing.xl),

        // Quotations section
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💬 Quotations (Test II)',
                  style: AppTextStyles.headingMedium
                      .copyWith(color: AppColors.accentGold)),
              const SizedBox(height: AppSpacing.md),
              ...[
                'A man can be as great as he wants to be. If you believe in yourself and have the courage, the determination and dedication, it can be done.',
                'Always have dreams, because there is no achievement without a dream and an action to materialize the dream.',
                'People will always doubt your success but it\'s not about them, it\'s all about you; what you dream, what you plan, what you put in & what you believe.',
              ].asMap().entries.map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.key + 1}. ',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.accentGold)),
                        Expanded(
                          child: Text(e.value,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(fontStyle: FontStyle.italic)),
                        ),
                        commonWidgets.ttsButton(e.value,
                            color: AppColors.accentGold),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L7: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔓', 'title': 'Let — Concept & Meaning', 'hi': 'करने देना — अवधारणा और अर्थ'},
      {'emoji': '📐', 'title': 'Formula: Sub + Let + Obj + V1', 'hi': 'तीनों forms = Let'},
      {'emoji': '📊', 'title': 'All Tenses with Let', 'hi': 'Present / Past / Future / Modal'},
      {'emoji': '❓', 'title': 'Negative & Interrogative', 'hi': 'नहीं देता / क्या देता है?'},
      {'emoji': '💬', 'title': 'Quotations', 'hi': '15 महान वचन'},
      {'emoji': '✍️', 'title': 'Practice — 96 sentences', 'hi': '96 अभ्यास वाक्य'},
      {'emoji': '📝', 'title': 'Test Papers I & II', 'hi': 'Eng↔Hindi 30+30 sentences'},
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
              const Text('अध्याय 24 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Let (करने देना) — Final Quiz',
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
                  commonWidgets.quizStatBadge('7', 'टॉपिक'),
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 25 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 25!',
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