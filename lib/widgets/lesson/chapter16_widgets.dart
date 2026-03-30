import 'package:flutter/material.dart';
import '../../data/chapter16_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter16Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter16Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — What are Simple Sentences?
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'सरल वाक्य उन्हें कहते हैं जिनमें या तो क्रिया होती ही नहीं और अगर होती भी है तो Subject उस क्रिया को नहीं करता।',
          'Simple Sentences are those in which either there is no action (verb) at all, or even if there is, the subject doesn\'t perform that action.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Three types overview
        Text('तीन प्रकार (3 Types)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.tenseSummary.map((t) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Text(t['emoji']!, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['tense']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: accentColor)),
                        Text(t['tenseHi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 12)),
                        const SizedBox(height: 4),
                        Text('पहचान: ${t['ending']!}',
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _verbChip(t['catI']!, AppColors.primary),
                      const SizedBox(height: 4),
                      _verbChip(t['catII']!, AppColors.success),
                    ],
                  ),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.lg),
        Text('समझें — उदाहरण से (Learn with Examples)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),

        // Three key examples with color coding
        ...Chapter16Data.introExamples.asMap().entries.map((e) {
          final i = e.key;
          final ex = e.value;
          final isNotSimple = i == 2;
          final borderColor =
              isNotSimple ? AppColors.error : AppColors.success;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: borderColor.withOpacity(0.4), width: 2),
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
                    color: borderColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.lg - 2),
                      topRight: Radius.circular(AppRadius.lg - 2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isNotSimple ? '❌ Tense Sentence' : '✅ Simple Sentence',
                        style: AppTextStyles.labelLarge
                            .copyWith(color: borderColor),
                      ),
                      commonWidgets.ttsButton(ex['english']!),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ex['sentence']!,
                          style: AppTextStyles.headingMedium
                              .copyWith(fontSize: 16)),
                      Text(ex['english']!,
                          style: AppTextStyles.bodyMedium.copyWith(
                              color: accentColor,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(height: AppSpacing.sm),
                      _infoRow('👤 Subject', ex['subject']!),
                      _infoRow('⚡ Verb', ex['hasVerb']!),
                      _infoRow('💡', ex['explanation']!),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.lg),
        Text('और उदाहरण (More Examples)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.moreExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ex['hindi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: AppColors.textPrimary)),
                        Text(ex['english']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: accentColor,
                                fontStyle: FontStyle.italic,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(ex['verdict']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(fontSize: 13)),
                        Text(ex['reason']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 11),
                            textAlign: TextAlign.right),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Simple Present: Is/Am/Are
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentIsAmAreContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Simple Present के वाक्यों के अंत में है, हैं, हो, हूँ का प्रयोग होता है।',
          'Simple Present sentences end with है / हैं / हो / हूँ. Use Is/Am/Are based on the subject.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rules card
        Text('नियम (Rules)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.isAmAreRules.map((r) => _ruleCard(r)),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.presentIsAmAreExamples.map((ex) =>
            _sentenceRow(ex['hindi']!, ex['english']!, ex['verb']!,
                ex['reason']!)),

        const SizedBox(height: AppSpacing.lg),
        Text('चारों प्रकार के वाक्य (All 4 Sentence Types)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _fourTypesTable(Chapter16Data.isAmAreFourTypes, threeColumns: true),

        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '❓', 'WH Family Sentences', 'प्रश्नवाचक + WH शब्द', accentColor),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.isAmAreWhExamples
            .map((ex) => _whRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.lg),
        _keyRulesCard(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Simple Present: Has/Have
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentHasHaveContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Has/Have वाले वाक्यों में "पास है" या "भाई/बहन/दोस्त हैं" जैसे शब्द होते हैं।',
          'Has/Have sentences contain "पास है" (has something) or mention family/friends. Third Person Singular → Has; Others → Have.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Text('नियम (Rules)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.hasHaveRules.map((r) => _ruleCard(r)),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.presentHasHaveExamples.map((ex) =>
            _sentenceRow(ex['hindi']!, ex['english']!, ex['verb']!,
                ex['reason']!)),

        const SizedBox(height: AppSpacing.lg),
        // Negative rules
        _negativeRuleCard(
          title: 'Negative Rule',
          rule3rdSingular: 'Doesn\'t have',
          ruleOthers: 'Don\'t have',
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('चारों प्रकार के वाक्य', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _fourTypesTable(Chapter16Data.hasHaveFourTypes, threeColumns: false),

        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '❓', 'WH Family Example', 'राम के पास किताब क्यों नहीं है?',
            accentColor),
        const SizedBox(height: AppSpacing.md),
        _whRow('राम के पास किताब क्यों नहीं है?',
            'Why does Ram not have a book?'),
        _whRow('मेरे कितने भाई हैं?', 'How many brothers do I have?'),

        const SizedBox(height: AppSpacing.lg),
        _keyRulesCard(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Simple Past: Was/Were
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastWasWereContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Simple Past के वाक्यों के अंत में था, थे, थी का प्रयोग होता है।',
          'Simple Past sentences end with था / थे / थी. Singular → Was; Plural → Were.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Text('नियम (Rules)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.wasWereRules.map((r) => _ruleCard(r)),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.pastWasWereExamples.map((ex) =>
            _sentenceRow(ex['hindi']!, ex['english']!, ex['verb']!,
                ex['reason']!)),

        const SizedBox(height: AppSpacing.lg),
        Text('चारों प्रकार के वाक्य', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _fourTypesTable(Chapter16Data.wasWereFourTypes, threeColumns: false),

        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '❓', 'WH Family Sentences', 'WH + Helping Verb + Subject',
            accentColor),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.wasWereWhExamples
            .map((ex) => _whRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.lg),
        _keyRulesCard(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Simple Past: Had
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastHadContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Had वाले वाक्यों में "पास था" या "भाई/बहन थे" जैसे शब्द होते हैं।',
          'Had sentences contain "पास था" or family/possession in past. Had is used with ALL subjects (Singular & Plural) in Affirmative.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Special rule highlight
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border:
                Border.all(color: AppColors.warning.withOpacity(0.4), width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('⭐', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Text('विशेष नियम (Special Rule)',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.warning)),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'सकारात्मक वाक्यों में Subject चाहे Singular हो या Plural, हमेशा "Had" का प्रयोग होता है।\nNegative वाक्यों में "Didn\'t have" का प्रयोग होता है।',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  _verbChip('Had (Affirmative)', AppColors.success),
                  const SizedBox(width: 8),
                  _verbChip("Didn't have (Negative)", AppColors.error),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.pastHadExamples.map((ex) {
          final isNeg = ex['type'] == 'Negative';
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(
                color: isNeg
                    ? AppColors.error.withOpacity(0.3)
                    : AppColors.success.withOpacity(0.3),
              ),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      Text(ex['english']!,
                          style: AppTextStyles.labelLarge.copyWith(
                              color: isNeg ? AppColors.error : AppColors.success,
                              fontSize: 13)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: isNeg
                        ? AppColors.error.withOpacity(0.1)
                        : AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(ex['type']!,
                      style: AppTextStyles.labelSmall.copyWith(
                          color: isNeg ? AppColors.error : AppColors.success)),
                ),
                const SizedBox(width: 8),
                commonWidgets.ttsButton(ex['english']!),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.lg),
        Text('चारों प्रकार के वाक्य', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _fourTypesTable(Chapter16Data.hadFourTypes, threeColumns: false),

        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '❓', 'WH Family Examples', 'Did + Subject + not + have',
            accentColor),
        const SizedBox(height: AppSpacing.md),
        _whRow('राम के पास किताब क्यों नहीं थी?',
            'Why did Ram not have a book?'),
        _whRow('मेरे कितने भाई थे?', 'How many brothers did I have?'),

        const SizedBox(height: AppSpacing.lg),
        _keyRulesCard(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Simple Future: Will be / Will have
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildFutureContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Simple Future के वाक्यों के अंत में होगा, होगी, होंगे का प्रयोग होता है।',
          'Simple Future sentences end with होगा / होगी / होंगे. Use "Will be" for being, "Will have" for possession.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Two categories
        _futureRuleCard(
          emoji: '🔮',
          title: 'Category I — Will be',
          titleHi: 'पहचान: होगा / होगी / होंगे',
          rule:
              'Singular और Plural सभी Subjects के साथ "Will be" का प्रयोग होता है।',
          color: AppColors.primary,
        ),
        const SizedBox(height: AppSpacing.md),
        _futureRuleCard(
          emoji: '🤲',
          title: 'Category II — Will have',
          titleHi: 'पहचान: पास होगा / पास होगी',
          rule:
              'Singular और Plural सभी Subjects के साथ "Will have" का प्रयोग होता है।',
          color: AppColors.success,
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.futureExamples.map((ex) {
          final typeColor = _typeColor(ex['type']!);
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      Row(
                        children: [
                          Expanded(
                            child: Text(ex['english']!,
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: accentColor, fontSize: 13)),
                          ),
                          commonWidgets.ttsButton(ex['english']!),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _verbChip(ex['verb']!, accentColor),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: typeColor.withOpacity(0.1),
                        borderRadius:
                            BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(ex['type']!,
                          style: AppTextStyles.labelSmall
                              .copyWith(color: typeColor, fontSize: 10)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.lg),
        _keyRulesCard(),

        const SizedBox(height: AppSpacing.lg),
        // Full summary table
        Text('सारांश (Summary)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _summaryTable(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📖', 'title': 'Simple Sentences', 'hi': 'सरल वाक्य — परिचय'},
      {
        'emoji': '✅',
        'title': 'Is / Am / Are',
        'hi': 'Simple Present — है/हैं/हूँ'
      },
      {
        'emoji': '🤲',
        'title': 'Has / Have',
        'hi': 'Simple Present — पास है'
      },
      {
        'emoji': '⏮️',
        'title': 'Was / Were',
        'hi': 'Simple Past — था/थे/थी'
      },
      {'emoji': '📦', 'title': 'Had', 'hi': 'Simple Past — पास था'},
      {
        'emoji': '🔮',
        'title': 'Will be / Will have',
        'hi': 'Simple Future — होगा/पास होगा'
      },
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
              const Text(
                'अध्याय 16 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito', color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'Chapter 16 — Final Quiz',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('70', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('6', 'टॉपिक'),
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
                  'इस क्विज़ में 6 में से 4 सही जवाब देने पर अध्याय 17 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 17!',
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
  // LESSON 7 — Practice Exercise (100 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए 100 वाक्यों का अनुवाद अंग्रेज़ी में करने की कोशिश करें। उत्तर देखने के लिए कार्ड पर टैप करें।',
          'Try translating all 100 sentences into English. Tap any card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Stats row
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statChip('100', 'वाक्य', '📝'),
              _statChip('Is/Am/Are', 'Present', '✅'),
              _statChip('Was/Were', 'Past', '⏮️'),
              _statChip('Has/Have', 'Possession', '🤲'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('अभ्यास वाक्य (Practice Sentences)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.practiceExercise.asMap().entries.map((e) =>
            _practiceCard(e.key + 1, e.value['hindi']!, e.value['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — Singular & Plural Identification
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildSingularPluralContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Helping Verb सही चुनने के लिए यह जानना ज़रूरी है कि Subject Singular है या Plural।',
          'To pick the right helping verb, you must know whether the subject is Singular or Plural.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Singular list
        commonWidgets.sectionCard(
          title: 'Singular (एकवचन)',
          subtitle: 'Is / Was / Has / Does',
          color: AppColors.primary,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Chapter16Data.singularWords
                .map((w) => _wordChip(w, AppColors.primary))
                .toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),

        // Plural list
        commonWidgets.sectionCard(
          title: 'Plural (बहुवचन)',
          subtitle: 'Are / Were / Have / Do',
          color: AppColors.accent,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Chapter16Data.pluralWords
                .map((w) => _wordChip(w, AppColors.accent))
                .toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        Text('ध्यान देने योग्य शब्द (Tricky Words)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.trickyWords.map((t) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
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
                      color: accentColor.withOpacity(0.08),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppRadius.lg - 2),
                        topRight: Radius.circular(AppRadius.lg - 2),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(t['word']!,
                            style: AppTextStyles.headingMedium
                                .copyWith(color: accentColor, fontSize: 18)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius:
                                BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(t['type']!,
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['reason']!,
                            style: AppTextStyles.bodyMedium),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            Text('Helping Verbs: ',
                                style: AppTextStyles.labelSmall),
                            Expanded(
                              child: Text(t['helpingVerb']!,
                                  style: AppTextStyles.labelLarge.copyWith(
                                      color: AppColors.success,
                                      fontSize: 13)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.lg),
        // Quick reference table
        Text('त्वरित संदर्भ (Quick Reference)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _quickReferenceTable(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 9 — Test Papers
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaperContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'तीन टेस्ट पेपर के सभी वाक्य यहाँ दिए गए हैं। अपनी गति से पढ़ें और उत्तर टैप करके देखें।',
          'All three test paper sentences are here. Practice at your own pace — tap to reveal answers.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Test I
        _testSectionHeader('Test Paper — I', 'Hindi → English', '📋',
            AppColors.primary, '20 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.testI_Q1.asMap().entries.map((e) =>
            _practiceCard(e.key + 1, e.value['hindi']!, e.value['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // Test II Q1
        _testSectionHeader('Test Paper — II (Q1)', 'Hindi → English', '📋',
            AppColors.accent, '28 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.testII_Q1.asMap().entries.map((e) =>
            _practiceCard(e.key + 1, e.value['hindi']!, e.value['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // Test II Q2
        _testSectionHeader('Test Paper — II (Q2)', 'English → Hindi', '🔄',
            const Color(0xFF7C3AED), '20 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.testII_Q2.asMap().entries.map((e) =>
            _practiceCard(e.key + 1, e.value['english']!, e.value['hindi']!,
                isEnglishFirst: true)),

        const SizedBox(height: AppSpacing.xl),

        // Test III Q1
        _testSectionHeader('Test Paper — III (Q1)', 'English → Hindi', '🔄',
            AppColors.success, '44 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.testIII_Q1.asMap().entries.map((e) =>
            _practiceCard(e.key + 1, e.value['english']!, e.value['hindi']!,
                isEnglishFirst: true)),

        const SizedBox(height: AppSpacing.xl),

        // Motivational quotes
        _testSectionHeader('महान विचार', 'Motivational Quotes', '💡',
            AppColors.accentGold, ''),
        const SizedBox(height: AppSpacing.md),
        ...Chapter16Data.motivationalQuotes.map((q) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.accentGold.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                    color: AppColors.accentGold.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(q['english']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                fontStyle: FontStyle.italic,
                                color: AppColors.textPrimary)),
                      ),
                      commonWidgets.ttsButton(q['english']!,
                          color: AppColors.accentGold),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(q['hindi']!,
                      style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary, fontSize: 12)),
                  if (q['author']!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text('— ${q['author']!}',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.accentGold)),
                  ],
                ],
              ),
            )),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SHARED HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _verbChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Nunito',
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(label,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.textSecondary, fontSize: 12)),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _ruleCard(Map<String, String> rule) {
    final colorMap = {
      'primary': AppColors.primary,
      'success': AppColors.success,
      'accent': AppColors.accent,
      'warning': AppColors.warning,
    };
    final color = colorMap[rule['color']] ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rule['subject']!,
                    style: AppTextStyles.labelLarge.copyWith(color: color)),
                Text(rule['examples']!,
                    style:
                        AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_rounded,
              color: AppColors.textHint, size: 18),
          const SizedBox(width: 8),
          _verbChip(rule['verb']!, color),
        ],
      ),
    );
  }

  Widget _sentenceRow(
      String hindi, String english, String verb, String reason) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: accentColor, fontSize: 13)),
                    ),
                    commonWidgets.ttsButton(english),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _verbChip(verb, accentColor),
                const SizedBox(height: 4),
                Text(reason,
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 10),
                    textAlign: TextAlign.right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _fourTypesTable(List<Map<String, String>> data,
      {required bool threeColumns}) {
    return Column(
      children: data.map((row) {
        final typeColors = {
          'Affirmative': AppColors.success,
          'Negative': AppColors.error,
          'Interrogative': AppColors.primary,
          'Negative Interrogative': const Color(0xFF7C3AED),
        };
        final color = typeColors[row['type']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: color.withOpacity(0.25)),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.lg - 2),
                    topRight: Radius.circular(AppRadius.lg - 2),
                  ),
                ),
                child: Row(
                  children: [
                    Text(row['type']!,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: color, fontSize: 13)),
                    const SizedBox(width: 8),
                    Text('(${row['typeHi']!})',
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: color, fontSize: 11)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    _examplePair(row['ex1Hi']!, row['ex1']!),
                    const SizedBox(height: 8),
                    _examplePair(row['ex2Hi']!, row['ex2']!),
                    if (threeColumns && row['ex3'] != null) ...[
                      const SizedBox(height: 8),
                      _examplePair(row['ex3Hi']!, row['ex3']!),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _examplePair(String hindi, String english) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(hindi, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(english,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: accentColor, fontSize: 12)),
              ),
              commonWidgets.ttsButton(english),
            ],
          ),
        ),
      ],
    );
  }

  Widget _whRow(String hindi, String english) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                Text(english,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: accentColor, fontSize: 13)),
              ],
            ),
          ),
          commonWidgets.ttsButton(english),
        ],
      ),
    );
  }

  Widget _keyRulesCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📌', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text('महत्वपूर्ण नियम (Key Rules)',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.warning)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ...Chapter16Data.keyRules.asMap().entries.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.warning.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text('${e.key + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.warning)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(e.value,
                          style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _negativeRuleCard({
    required String title,
    required String rule3rdSingular,
    required String ruleOthers,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: Text('3rd Person Singular:',
                    style: AppTextStyles.bodyMedium),
              ),
              _verbChip(rule3rdSingular, AppColors.error),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text('बाकी Subjects:', style: AppTextStyles.bodyMedium),
              ),
              _verbChip(ruleOthers, AppColors.error),
            ],
          ),
        ],
      ),
    );
  }

  Widget _futureRuleCard({
    required String emoji,
    required String title,
    required String titleHi,
    required String rule,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.labelLarge.copyWith(color: color)),
                Text(titleHi,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: color, fontSize: 12)),
                const SizedBox(height: 6),
                Text(rule, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryTable() {
    return Container(
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
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg - 2),
                topRight: Radius.circular(AppRadius.lg - 2),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 32),
                Expanded(
                    child: Text('Tense',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: accentColor))),
                Expanded(
                    child: Text('Cat I\n(Being)',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.primary))),
                Expanded(
                    child: Text('Cat II\n(Possession)',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.success))),
              ],
            ),
          ),
          ...Chapter16Data.tenseSummary.asMap().entries.map((e) {
            final i = e.key;
            final t = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                border: i < Chapter16Data.tenseSummary.length - 1
                    ? const Border(
                        bottom: BorderSide(color: AppColors.lockedBg))
                    : null,
              ),
              child: Row(
                children: [
                  Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['tense']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(fontSize: 12)),
                        Text(t['ending']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 10)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _verbChip(t['catI']!, AppColors.primary),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _verbChip(t['catII']!, AppColors.success),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _typeColor(String type) {
    switch (type) {
      case 'Affirmative':
        return AppColors.success;
      case 'Negative':
        return AppColors.error;
      case 'Interrogative':
        return AppColors.primary;
      case 'Negative Interrogative':
        return const Color(0xFF7C3AED);
      default:
        return accentColor;
    }
  }

  // ── Practice / Test card (tap to reveal answer) ────────────────────────
  Widget _practiceCard(int no, String question, String answer,
      {bool isEnglishFirst = false}) {
    return _RevealCard(
      no: no,
      question: question,
      answer: answer,
      accentColor: accentColor,
      isEnglishFirst: isEnglishFirst,
    );
  }

  Widget _wordChip(String word, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(word,
          style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
    );
  }

  Widget _statChip(String value, String label, String emoji) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 2),
        Text(value,
            style: AppTextStyles.labelLarge
                .copyWith(color: accentColor, fontSize: 12)),
        Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
      ],
    );
  }

  Widget _testSectionHeader(String title, String subtitle, String emoji,
      Color color, String badge) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.headingMedium.copyWith(color: color)),
                Text(subtitle,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: color, fontSize: 12)),
              ],
            ),
          ),
          if (badge.isNotEmpty)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(badge,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
            ),
        ],
      ),
    );
  }

  Widget _quickReferenceTable() {
    final rows = [
      ['Singular Subject (3rd)', 'Is', 'Was', 'Has', 'Does'],
      ['I (1st Singular)', 'Am', 'Was', 'Have', 'Do'],
      ['You (always plural)', 'Are', 'Were', 'Have', 'Do'],
      ['Plural Subjects', 'Are', 'Were', 'Have', 'Do'],
    ];
    final headers = ['Subject', 'Present', 'Past', 'Has/Have', 'Do/Does'];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg - 2),
                topRight: Radius.circular(AppRadius.lg - 2),
              ),
            ),
            child: Row(
              children: headers
                  .map((h) => Expanded(
                        child: Text(h,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: accentColor, fontSize: 10),
                            textAlign: TextAlign.center),
                      ))
                  .toList(),
            ),
          ),
          // Data rows
          ...rows.asMap().entries.map((e) {
            final i = e.key;
            final row = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                border: i < rows.length - 1
                    ? const Border(
                        bottom: BorderSide(color: AppColors.lockedBg))
                    : null,
              ),
              child: Row(
                children: row.asMap().entries.map((cell) {
                  final isFirst = cell.key == 0;
                  return Expanded(
                    child: Text(
                      cell.value,
                      style: isFirst
                          ? AppTextStyles.bodyMedium.copyWith(fontSize: 11)
                          : AppTextStyles.labelLarge.copyWith(
                              color: accentColor, fontSize: 12),
                      textAlign:
                          isFirst ? TextAlign.left : TextAlign.center,
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
// STATEFUL REVEAL CARD — tap to show/hide answer
// ══════════════════════════════════════════════════════════════════════════
class _RevealCard extends StatefulWidget {
  final int no;
  final String question;
  final String answer;
  final Color accentColor;
  final bool isEnglishFirst;

  const _RevealCard({
    required this.no,
    required this.question,
    required this.answer,
    required this.accentColor,
    this.isEnglishFirst = false,
  });

  @override
  State<_RevealCard> createState() => _RevealCardState();
}

class _RevealCardState extends State<_RevealCard> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _revealed = !_revealed),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: _revealed
              ? widget.accentColor.withOpacity(0.06)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: _revealed
                ? widget.accentColor.withOpacity(0.4)
                : AppColors.locked,
            width: _revealed ? 1.5 : 1,
          ),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: widget.accentColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text('${widget.no}',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: widget.accentColor,
                    )),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.question,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.textPrimary)),
                  if (_revealed) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: Text(
                        widget.answer,
                        style: AppTextStyles.labelLarge.copyWith(
                            color: widget.accentColor, fontSize: 13),
                      ),
                    ),
                  ] else ...[
                    const SizedBox(height: 4),
                    Text('टैप करें — उत्तर देखें 👆',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textHint, fontSize: 11)),
                  ],
                ],
              ),
            ),
            Icon(
              _revealed ? Icons.expand_less_rounded : Icons.expand_more_rounded,
              color: AppColors.textHint,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}