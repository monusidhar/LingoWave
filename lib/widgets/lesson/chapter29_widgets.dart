import 'package:flutter/material.dart';
import '../../data/chapter29_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter29Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter29Widgets({required this.commonWidgets, required this.accentColor});

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _ruleBox(String text, {String emoji = '📌', Color? color}) {
    final c = color ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: c.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }

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

  // ─── Question Tag sentence tile ────────────────────────────────────────────
  Widget _tagTile({
    required int index,
    required String hindi,
    required String english,
    required Color mainColor,
    required Color tagColor,
  }) {
    // Split english into main part and tag part
    final lastComma = english.lastIndexOf(', ');
    final mainPart = lastComma != -1 ? english.substring(0, lastComma) : english;
    final tagPart = lastComma != -1 ? english.substring(lastComma + 2) : '';

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: mainColor.withOpacity(0.15)),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: mainColor, shape: BoxShape.circle),
            child: Center(
              child: Text('$index',
                  style: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 11)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: mainPart,
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: mainColor, fontSize: 12),
                            ),
                            if (tagPart.isNotEmpty) ...[
                              TextSpan(
                                text: ', ',
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.textSecondary, fontSize: 12),
                              ),
                              TextSpan(
                                text: tagPart,
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: tagColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                    backgroundColor: tagColor.withOpacity(0.1)),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    commonWidgets.ttsButton(english, color: mainColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── L1: Intro / Concept ───────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Question Tags वो छोटे-छोटे प्रश्न हैं जो वाक्य के अंत में जोड़े जाते हैं। जैसे: "है ना?", "नहीं क्या?", "है कि नहीं?" — ये सब Question Tags हैं।',
          'Question Tags are short questions added at the end of sentences to seek confirmation. Examples: "isn\'t he?", "don\'t you?", "haven\'t I?"',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Main rules banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('❓', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              const Text('Question Tags — 2 Rules',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              _rulePill(
                '✅ Positive sentence',
                '→  Negative tag',
                AppColors.success,
                '"He is good, isn\'t he?"',
              ),
              const SizedBox(height: AppSpacing.sm),
              _rulePill(
                '❌ Negative sentence',
                '→  Positive tag',
                AppColors.error,
                '"He is not good, is he?"',
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Hindi tag words
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hindi में Question Tags कैसे दिखते हैं?',
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: Chapter29Data.hindiTags
                    .map((tag) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(tag,
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),

        _sectionHeader('Tag Formation — Helping Verbs', badge: '10 pairs'),

        // Tag table
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.08),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppRadius.lg)),
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2,
                        child: Text('Tense / Verb',
                            style: AppTextStyles.labelSmall
                                .copyWith(color: accentColor))),
                    Expanded(flex: 2,
                        child: Text('Negative Tag',
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.error))),
                    Expanded(flex: 2,
                        child: Text('Positive Tag',
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.success))),
                  ],
                ),
              ),
              ...Chapter29Data.tagRules.asMap().entries.map((e) {
                final i = e.key;
                final row = e.value;
                final isLast = i == Chapter29Data.tagRules.length - 1;
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: 10),
                  decoration: BoxDecoration(
                    border: isLast
                        ? null
                        : const Border(
                            bottom: BorderSide(color: AppColors.lockedBg)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(row['verb']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: accentColor, fontSize: 12)),
                            Text(row['tense']!,
                                style: AppTextStyles.bodyMedium
                                    .copyWith(fontSize: 10)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(row['negative_tag']!,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.error, fontSize: 11)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(row['positive_tag']!,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.success, fontSize: 11)),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Special case — "I am":\n'
          '• Positive: I am bad, am I not? OR I am bad, aren\'t I?\n'
          '• Negative: I am not mad, am I?\n\n'
          'दोनों (am I not? और aren\'t I?) acceptable हैं।',
          emoji: '⚠️',
          color: AppColors.warning,
        ),
      ],
    );
  }

  Widget _rulePill(String left, String arrow, Color color, String example) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(left,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(arrow,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(example,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white70,
                  fontStyle: FontStyle.italic,
                  fontSize: 12)),
        ],
      ),
    );
  }

  // ─── L2: Scenario 1 — Positive sentences ──────────────────────────────────
  Widget buildScenario1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Scenario 1: अगर वाक्य सकारात्मक (Positive) है, तो Question Tag नकारात्मक (Negative) होगा।',
          'Scenario 1: If the sentence is POSITIVE → the Question Tag is NEGATIVE.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.success.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Text('✅', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Positive → Negative Tag',
                        style: AppTextStyles.headingMedium
                            .copyWith(color: AppColors.success)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text(
                        '"He is good,  isn\'t he?" ← Tag is negative',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        _sectionHeader('21 Examples — Scenario 1', badge: '21'),
        ...Chapter29Data.scenario1Sentences.asMap().entries.map((e) =>
            _tagTile(
              index: e.key + 1,
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              mainColor: AppColors.success,
              tagColor: AppColors.error,
            )),
      ],
    );
  }

  // ─── L3: Scenario 2 — Negative sentences ──────────────────────────────────
  Widget buildScenario2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Scenario 2: अगर वाक्य नकारात्मक (Negative) है, तो Question Tag सकारात्मक (Positive) होगा।',
          'Scenario 2: If the sentence is NEGATIVE → the Question Tag is POSITIVE.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.error.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Text('❌', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Negative → Positive Tag',
                        style: AppTextStyles.headingMedium
                            .copyWith(color: AppColors.error)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text(
                        '"He is not good,  is he?" ← Tag is positive',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        _sectionHeader('20 Examples — Scenario 2', badge: '20'),
        ...Chapter29Data.scenario2Sentences.asMap().entries.map((e) =>
            _tagTile(
              index: e.key + 1,
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              mainColor: AppColors.error,
              tagColor: AppColors.success,
            )),

        const SizedBox(height: AppSpacing.md),

        // Quick comparison side by side
        _sectionHeader('Quick Comparison', badge: '2 rules'),
        Row(
          children: [
            Expanded(
              child: _comparisonCard(
                emoji: '✅',
                title: 'Positive',
                example1: 'She is playing,',
                example2: 'isn\'t she?',
                mainColor: AppColors.success,
                tagColor: AppColors.error,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _comparisonCard(
                emoji: '❌',
                title: 'Negative',
                example1: 'She is not playing,',
                example2: 'is she?',
                mainColor: AppColors.error,
                tagColor: AppColors.success,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _comparisonCard({
    required String emoji,
    required String title,
    required String example1,
    required String example2,
    required Color mainColor,
    required Color tagColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: mainColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: mainColor.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 6),
            Text(title,
                style: AppTextStyles.labelLarge.copyWith(color: mainColor)),
          ]),
          const SizedBox(height: 8),
          Text(example1,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: mainColor, fontSize: 11)),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: tagColor,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text(example2,
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 12)),
          ),
        ],
      ),
    );
  }

  // ─── L4: Chapter Quiz Intro ────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '❓', 'title': 'What is a Question Tag?', 'hi': 'है ना? नहीं क्या? है कि नहीं?'},
      {'emoji': '✅', 'title': 'Scenario 1 — Positive → Negative tag', 'hi': '21 sentences with isn\'t, don\'t, won\'t...'},
      {'emoji': '❌', 'title': 'Scenario 2 — Negative → Positive tag', 'hi': '20 sentences with is, do, will, can...'},
      {'emoji': '📋', 'title': 'Tag Formation Rules', 'hi': 'is/was/do/did/will/can/should...'},
      {'emoji': '⚠️', 'title': 'Special case: "I am"', 'hi': 'am I not? OR aren\'t I?'},
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
              const Text('अध्याय 29 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Question Tags — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10', 'प्रश्न'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('100', 'XP'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('5', 'टॉपिक'),
              ]),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Two rules summary
        Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.08),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.success.withOpacity(0.3)),
              ),
              child: Column(children: [
                const Text('✅', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 4),
                Text('Positive',
                    style: AppTextStyles.labelLarge
                        .copyWith(color: AppColors.success)),
                const SizedBox(height: 2),
                Text('→ Negative tag',
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                const SizedBox(height: 4),
                Text('isn\'t? don\'t?\nwon\'t? can\'t?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.labelSmall
                        .copyWith(color: AppColors.error, fontSize: 10)),
              ]),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.07),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Column(children: [
                const Text('❌', style: TextStyle(fontSize: 24)),
                const SizedBox(height: 4),
                Text('Negative',
                    style:
                        AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
                const SizedBox(height: 2),
                Text('→ Positive tag',
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                const SizedBox(height: 4),
                Text('is? do?\nwill? can?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.labelSmall
                        .copyWith(color: AppColors.success, fontSize: 10)),
              ]),
            ),
          ),
        ]),

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
                            style:
                                AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
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