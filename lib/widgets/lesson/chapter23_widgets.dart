import 'package:flutter/material.dart';
import '../../data/chapter23_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter23Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter23Widgets({
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
          Text(title, style: AppTextStyles.headingMedium),
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

  /// Single practice tile: number circle + hindi + english + TTS
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

  /// Test paper tile — Eng→Hindi direction
  Widget _testTile2(int number, String english, String hindi, Color color) {
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
              ? _testTile2(startIndex + e.key, primary, secondary, color)
              : _practiceTile(startIndex + e.key, primary, secondary, color);
        }).toList(),
      ),
    );
  }

  // ─── L1: Imperative Sentences — Rules ─────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'आज्ञासूचक वाक्य वो होते हैं जिनकी मदद से हम किसी को आदेश देते हैं, सलाह देते हैं या अनुरोध करते हैं।',
          'Imperative Sentences are those in which we order, advise or request someone.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Definition banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              const Text('📢', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 6),
              const Text('Imperative Sentence',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('आज्ञा सूचक वाक्य',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Text('Subject "You" is always hidden',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
              ),
            ],
          ),
        ),

        _sectionHeader('नियम (Rules)', '5 types'),

        // Rules cards
        ...Chapter23Data.rulesData.map((r) {
          final colors = {
            '👉': AppColors.primary,
            '🙏': AppColors.success,
            '🔁': const Color(0xFF7C3AED),
            '🚫': AppColors.error,
            '❌': AppColors.warning,
          };
          final c = colors[r['emoji']] ?? accentColor;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.3)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: 10),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.lg),
                      topRight: Radius.circular(AppRadius.lg),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(r['emoji']!, style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(r['rule']!,
                                style: AppTextStyles.labelLarge.copyWith(color: c)),
                            Text(r['hindi']!,
                                style: AppTextStyles.bodyMedium
                                    .copyWith(fontSize: 11)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Formula
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: 8),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: c,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(r['formula']!,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                ),
                // Examples
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
                  child: Column(
                    children: [
                      _exampleRow(r['example1hi']!, r['example1en']!, c),
                      const SizedBox(height: 6),
                      _exampleRow(r['example2hi']!, r['example2en']!, c),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          '"Do + Verb" का प्रयोग Imperative में जोर देने के लिए होता है।\n'
          '"Do go" = जरूर जाओ। "Do eat the food" = जरूर खाना खाओ।',
          emoji: '💡',
        ),
      ],
    );
  }

  Widget _exampleRow(String hindi, String english, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textPrimary, fontSize: 12)),
                Text(english,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: color, fontSize: 12)),
              ],
            ),
          ),
          commonWidgets.ttsButton(english, color: color),
        ],
      ),
    );
  }

  // ─── L2: Let / Don't Let ──────────────────────────────────────────────────
  Widget buildLetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Let" का प्रयोग तब होता है जब हम किसी को कुछ करने की अनुमति देते हैं। "Don\'t let" का प्रयोग मना करने के लिए।',
          '"Let" is used to give permission. "Don\'t let" is used to prohibit.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Let formula card
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.success.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Let (करने दो)',
                  style: AppTextStyles.headingMedium
                      .copyWith(color: AppColors.success)),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Text('Let + subject + Verb 1st form + Object',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Don't let formula card
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.error.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Don\'t let (मत करने दो)',
                  style:
                      AppTextStyles.headingMedium.copyWith(color: AppColors.error)),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Text('Don\'t + let + subject + Verb 1st form',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
              ),
              const SizedBox(height: 6),
              const Text('OR',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 12)),
              const SizedBox(height: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.error,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: const Text('Let + subject + not + Verb 1st form',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Subject after "Let" must be:\n'
          '• Noun: Ram, Seeta, Dad, children...\n'
          '• Objective Pronoun: me, him, her, us, them\n\n'
          '❌ Let I go. (wrong)\n'
          '✅ Let me go. (correct)',
          emoji: '⚠️',
        ),

        _sectionHeader('उदाहरण (Examples)', '5 sentences'),
        ...Chapter23Data.letExamples.map((e) {
          final isNeg = e['english']!.startsWith('Don\'t') ||
              e['english']!.contains('not');
          final c = isNeg ? AppColors.error : AppColors.success;
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              boxShadow: AppShadows.card,
              border: Border.all(color: c.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e['hindi']!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.textPrimary)),
                      const SizedBox(height: 4),
                      Text(e['english']!,
                          style:
                              AppTextStyles.labelLarge.copyWith(color: c, fontSize: 13)),
                    ],
                  ),
                ),
                commonWidgets.ttsButton(e['english']!, color: c),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L3: Quotations ───────────────────────────────────────────────────────
  Widget buildQuotationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'महान व्यक्तियों द्वारा कही गई बातें जो Imperative Sentences का बेहतरीन उदाहरण हैं।',
          'Famous quotations by great personalities — excellent examples of Imperative Sentences.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter23Data.quotations.asMap().entries.map((e) {
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
                      decoration:
                          BoxDecoration(color: c, shape: BoxShape.circle),
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
                            borderRadius:
                                BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text('— ${q['author']!}',
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: c)),
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

  // ─── L4: Practice Exercise — 95 sentences ────────────────────────────────
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में अब तक सीखे सभी Imperative Sentences का अभ्यास करें — 95 वाक्य।',
          'Practice all Imperative Sentences — 95 sentences.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Stats banner
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
              commonWidgets.quizStatBadge('95', 'वाक्य'),
              commonWidgets.quizStatBadge('4', 'सेट'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        _practiceSetCard(
          title: 'सेट 1',
          subtitle: 'Q 1–25',
          color: accentColor,
          data: Chapter23Data.practiceSet1,
          startIndex: 1,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 2',
          subtitle: 'Q 26–50',
          color: AppColors.primary,
          data: Chapter23Data.practiceSet2,
          startIndex: 26,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 3',
          subtitle: 'Q 51–75',
          color: AppColors.success,
          data: Chapter23Data.practiceSet3,
          startIndex: 51,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 4',
          subtitle: 'Q 76–95',
          color: AppColors.warning,
          data: Chapter23Data.practiceSet4,
          startIndex: 76,
        ),
      ],
    );
  }

  // ─── L5: Test Paper I — Hindi → English ──────────────────────────────────
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
              const Text('Test Paper I — Hindi → English',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('50', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('50 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: अनुवाद करें',
          subtitle: '1–25',
          color: accentColor,
          data: Chapter23Data.testPaper1Sentences.sublist(0, 25),
          startIndex: 1,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'Q1: अनुवाद करें (जारी)',
          subtitle: '26–50',
          color: AppColors.primary,
          data: Chapter23Data.testPaper1Sentences.sublist(25),
          startIndex: 26,
        ),
      ],
    );
  }

  // ─── L6: Test Paper II — English → Hindi ─────────────────────────────────
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
              const Text('Test Paper II — English → Hindi',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('50', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('50 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Eng→Hindi', 'अनुवाद'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: अनुवाद करें',
          subtitle: '1–25',
          color: AppColors.primary,
          data: Chapter23Data.testPaper2Sentences.sublist(0, 25),
          startIndex: 1,
          reversed: true,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'Q1: अनुवाद करें (जारी)',
          subtitle: '26–50',
          color: const Color(0xFF7C3AED),
          data: Chapter23Data.testPaper2Sentences.sublist(25),
          startIndex: 26,
          reversed: true,
        ),
      ],
    );
  }

  // ─── L7: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📢', 'title': 'Do / Always Do / Please Do', 'hi': 'करो / हमेशा करो / कृपया करो'},
      {'emoji': '🚫', 'title': 'Don\'t / Never Do', 'hi': 'मत करो / कभी मत करो'},
      {'emoji': '🙌', 'title': 'Let / Don\'t Let', 'hi': 'करने दो / मत करने दो'},
      {'emoji': '💪', 'title': 'Do + Verb (Emphasis)', 'hi': 'जरूर करो (जोर देकर)'},
      {'emoji': '💬', 'title': 'Quotations', 'hi': 'महान वचन'},
      {'emoji': '✍️', 'title': 'Practice — 95 sentences', 'hi': '95 अभ्यास वाक्य'},
      {'emoji': '📝', 'title': 'Test Papers I & II', 'hi': 'Hindi↔English अनुवाद'},
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
              const Text('अध्याय 23 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Imperative Sentences — Final Quiz',
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 24 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 24!',
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