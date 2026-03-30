import 'package:flutter/material.dart';
import '../../data/chapter20_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter20Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter20Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Concept 1: It vs This
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          "'It' और 'This' दोनों का अर्थ है \"यह\" — पर 'This' सजीव और निर्जीव दोनों के साथ होता है जबकि 'It' केवल निर्जीव के साथ।",
          '"It" & "This" both mean "यह" — but "This" is used for both living & non-living, while "It" is only for non-living.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // It vs This comparison card
        Container(
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.xl), boxShadow: AppShadows.card),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.xl - 2), topRight: Radius.circular(AppRadius.xl - 2))),
                child: Text('It vs This', style: AppTextStyles.headingMedium.copyWith(color: accentColor), textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.3))),
                      child: Column(children: [
                        _verbChip('This', AppColors.primary),
                        const SizedBox(height: 8),
                        Text('सजीव + निर्जीव\n(Living + Non-living)', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.primary), textAlign: TextAlign.center),
                      ]),
                    )),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(child: Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
                      child: Column(children: [
                        _verbChip('It', AppColors.success),
                        const SizedBox(height: 8),
                        Text('केवल निर्जीव\n(Non-living only)', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.success), textAlign: TextAlign.center),
                      ]),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),

        ...Chapter20Data.concept1Examples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ex['hindi']!, style: AppTextStyles.labelLarge),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Text('This: ', style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary)),
                    Expanded(child: Text(ex['this']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                  ]),
                  const SizedBox(height: 2),
                  Row(children: [
                    const Text('It:   ', style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.success)),
                    Expanded(child: Text(ex['it']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                  ]),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                    child: Text(ex['note']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                  ),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: Row(children: [
            const Text('💡', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            const Expanded(child: Text(
              'Modern English Exception: People sometimes say "It\'s my friend, Rahul." — यह modern English में exception है।',
              style: AppTextStyles.bodyMedium,
            )),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Concept 2: It as Subject (Day/Date)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          "किसी भी वाक्य की शुरुआत दिन (Day) से नहीं हो सकती। अगर वाक्य में 'आज', 'कल', 'परसों' आदि हो तो 'It' का प्रयोग Subject की तरह होता है।",
          'No sentence can start with a day (Monday, Yesterday, Today...). Use "It" as the subject when a day or date is mentioned.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule box
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.error.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.error.withOpacity(0.4), width: 2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('❌ Wrong', style: AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
              Text('"Today is Monday." — Sentence starting with day', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              const Divider(height: AppSpacing.md),
              Text('✅ Correct', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
              Text('"It is Monday today." — "It" as subject', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept2Examples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Concept 3: It has/had been (समय हो गया)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'समय हो चुका है/गया है → It has been\nसमय हो चुका था/गया था → It had been\nऐसे वाक्यों में "It" subject की तरह प्रयोग होता है।',
          '"It has been" = time has passed (present).\n"It had been" = time had passed (past).',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Basic examples
        _sectionHeader('Basic Examples', '⏳', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept3BasicExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // With person
        _sectionHeader('किसे लगा? (To whom?)', '👤', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept3WithPersonExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // V+ing vs having+V3 explanation
        _ingVsHavingCard(),

        const SizedBox(height: AppSpacing.lg),

        // Verb examples
        _sectionHeader('क्रिया के साथ (With Verb)', '🔤', accentColor),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept3VerbExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                  Row(children: [
                    Expanded(child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                    commonWidgets.ttsButton(ex['english']!),
                  ]),
                  if (ex.containsKey('note')) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                      child: Text(ex['note']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                    ),
                  ],
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('और उदाहरण (More Examples)', '📚', AppColors.warning),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept3MoreExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Concept 4: It takes (समय लगना)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'अगर वाक्य में Subject नहीं है तो "It" का प्रयोग Subject की तरह करें।\nसमय लगना = It takes (no subject) / I/Ram/We take (with subject)',
          '"It takes" when no subject. "I/Ram take" when subject is present. Add "to + V1" for the activity.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // No subject
        _sectionHeader('Subject नहीं है — It takes', '⏱️', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept4NoSubjectExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // With subject
        _sectionHeader('Subject है — I/Ram/We take', '👤', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept4WithSubjectExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),

        // समय + क्रिया
        _sectionHeader('समय + क्रिया — to + V1', '🔗', accentColor),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('मिलने में = to meet,  आने में = to come\nजाने में = to go,  पहुँचने में = to reach', style: AppTextStyles.bodyMedium.copyWith(color: accentColor)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.concept4WithVerbExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Practice Exercise (100 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए 100 वाक्यों का अनुवाद अंग्रेज़ी में करें। उत्तर देखने के लिए कार्ड पर टैप करें।',
          'Translate all 100 sentences into English. Tap any card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statChip('100', 'वाक्य', '✍️'),
              _statChip('4', 'Concepts', '💡'),
              _statChip('Weather', 'बारिश/ओले', '🌧️'),
              _statChip('Time', 'समय', '⏱️'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Hindi → English', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.practiceExercise.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Test Paper I (Hindi → English, 50 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaper1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Test Paper I — 50 Hindi→English sentences। Tap to reveal answers.',
          '50 sentences covering all 4 "It" concepts.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test I — Q1', 'Translate into English', '✍️', AppColors.primary, '50 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.testPaper1.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 7 — Test Paper II (English → Hindi, 50 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaper2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Test Paper II — 50 English→Hindi sentences। Tap to reveal answers.',
          '50 English sentences to translate into Hindi.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test II — Q1', 'Translate into Hindi', '📖', AppColors.success, '50 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.testPaper2.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['english']!, answer: e.value['hindi']!, accentColor: accentColor, isEnglishFirst: true)),
        const SizedBox(height: AppSpacing.xl),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — Chapter Quiz Intro
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔄', 'title': 'Concept 1 — It vs This', 'hi': 'निर्जीव के लिए It, सजीव के लिए This'},
      {'emoji': '📅', 'title': 'Concept 2 — It as Subject (Day)', 'hi': 'आज/कल के वाक्यों में It subject'},
      {'emoji': '⌛', 'title': 'Concept 3 — समय हो गया है/था', 'hi': 'It has/had been + V+ing / having+V3'},
      {'emoji': '⏱️', 'title': 'Concept 4 — समय लगना', 'hi': 'It takes / I take + to + V1'},
      {'emoji': '✍️', 'title': 'Practice — 100 sentences', 'hi': 'All concepts mixed'},
      {'emoji': '📝', 'title': 'Test I — Hindi → English', 'hi': '50 sentences'},
      {'emoji': '📋', 'title': 'Test II — English → Hindi', 'hi': '50 sentences'},
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
            const Text('अध्याय 20 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('It (इट) — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('50', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('4', 'Concepts'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
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
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Row(children: [
            Text('💡', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Expanded(child: Text(
              '6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
              style: AppTextStyles.bodyMedium,
            )),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _ingVsHavingCard() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.xl), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.xl - 2), topRight: Radius.circular(AppRadius.xl - 2))),
          child: Text('V+ing vs having + V3', style: AppTextStyles.headingMedium.copyWith(color: accentColor), textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _verbChip('V + ing', AppColors.success),
                  const SizedBox(height: 8),
                  Text('Subject अभी भी\nकाम कर रहा है।\n\nे.g. "पढ़ते हुए" = still studying → studying', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  const SizedBox(height: 8),
                  Text('मुझे पढ़ते हुए दो साल हो गये हैं।\n→ ...2 years to me studying.', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.success, fontSize: 11)),
                ]),
              )),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.3))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _verbChip('having + V3', AppColors.primary),
                  const SizedBox(height: 8),
                  Text('Subject काम\nकर चुका है।\n\ne.g. "पढ़े हुए" = already studied → having studied', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  const SizedBox(height: 8),
                  Text('मुझे पढ़े हुए दो साल हो गये हैं।\n→ ...2 years to me having studied.', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary, fontSize: 11)),
                ]),
              )),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _sectionHeader(String title, String emoji, Color color) {
    return Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 20)),
      const SizedBox(width: 8),
      Text(title, style: AppTextStyles.headingMedium.copyWith(color: color)),
    ]);
  }

  Widget _simpleExampleRow(String hindi, String english) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(hindi, style: AppTextStyles.bodyMedium),
          Row(children: [
            Expanded(child: Text(english, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
            commonWidgets.ttsButton(english),
          ]),
        ])),
      ]),
    );
  }

  Widget _verbChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
      child: Text(label, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }

  Widget _statChip(String value, String label, String emoji) {
    return Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 18)),
      const SizedBox(height: 2),
      Text(value, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 12)),
      Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
    ]);
  }

  Widget _testSectionHeader(String title, String subtitle, String emoji, Color color, String badge) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 26)),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 15)),
          Text(subtitle, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
          child: Text(badge, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
        ),
      ]),
    );
  }

  Widget _quotesSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.motivationalQuotes.sublist(0, 2).map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(q['english']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                  commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                ]),
                const SizedBox(height: 4),
                Text(q['hindi']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ]),
    );
  }

  Widget _practiceQuotesSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...Chapter20Data.motivationalQuotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(q['english']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                  commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                ]),
                const SizedBox(height: 4),
                Text(q['hindi']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ]),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
// STATEFUL REVEAL CARD
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
          color: _revealed ? widget.accentColor.withOpacity(0.06) : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: _revealed ? widget.accentColor.withOpacity(0.4) : AppColors.locked, width: _revealed ? 1.5 : 1),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26, height: 26,
              decoration: BoxDecoration(color: widget.accentColor.withOpacity(0.12), shape: BoxShape.circle),
              child: Center(child: Text('${widget.no}', style: TextStyle(fontFamily: 'Nunito', fontSize: 11, fontWeight: FontWeight.w700, color: widget.accentColor))),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(widget.question, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
                if (_revealed) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: widget.accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)),
                    child: Text(widget.answer, style: AppTextStyles.labelLarge.copyWith(color: widget.accentColor, fontSize: 13)),
                  ),
                ] else ...[
                  const SizedBox(height: 4),
                  Text('टैप करें — उत्तर देखें 👆', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textHint, fontSize: 11)),
                ],
              ]),
            ),
            Icon(_revealed ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppColors.textHint, size: 18),
          ],
        ),
      ),
    );
  }
}