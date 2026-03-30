import 'package:flutter/material.dart';
import '../../data/chapter21_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter21Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter21Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Modals Overview
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildOverviewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Modals ऐसी सहायक क्रियाएँ होती हैं जिनका प्रयोग वाक्य में मुख्य क्रिया के साथ किया जाता है ताकि समर्थता, सम्भावना, निश्चतता, इजाज़त और आवश्यकता व्यक्त की जा सके।"',
          '"Modal Helping Verbs are used with main verbs to express ability, possibility, certainty, permission and necessity."',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('19 Modals — Quick Reference', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _modalsTable(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  Widget _modalsTable() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
            child: Row(children: [
              SizedBox(width: 28, child: Text('#', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
              const SizedBox(width: 8),
              Expanded(flex: 3, child: Text('Modal', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
              Expanded(flex: 2, child: Text('Negative', style: AppTextStyles.labelSmall.copyWith(color: AppColors.error))),
              SizedBox(width: 40, child: Text('Form', style: AppTextStyles.labelSmall.copyWith(color: AppColors.success), textAlign: TextAlign.center)),
            ]),
          ),
          ...Chapter21Data.modalsTable.asMap().entries.map((e) {
            final i = e.key; final row = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
              decoration: BoxDecoration(
                color: i.isEven ? Colors.transparent : accentColor.withOpacity(0.02),
                border: i < Chapter21Data.modalsTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
              ),
              child: Row(children: [
                SizedBox(width: 28, child: Text(row['no']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textHint, fontSize: 10))),
                const SizedBox(width: 8),
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(row['modal']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 12)),
                  Text(row['meaning']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                ])),
                Expanded(flex: 2, child: Text(row['negative']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.error))),
                SizedBox(width: 40, child: Center(child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)),
                  child: Text(row['form']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.success, fontSize: 10)),
                ))),
              ]),
            );
          }),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Can / Could / Could have
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildCanCouldContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Can = सकता है (present ability/possibility)\nCould = सका / पाया (past ability)\nCould have + V3 = सकता था (unfulfilled past possibility)',
          'Can → present. Could → past. Could have + V3 → missed past possibility.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _modalSummaryCard('Can', 'सकता है', 'V1', AppColors.success),
        const SizedBox(height: AppSpacing.sm),
        _modalSummaryCard('Could', 'सका / पाया', 'V1', AppColors.primary),
        const SizedBox(height: AppSpacing.sm),
        _modalSummaryCard('Could have', 'सकता था (missed opportunity)', 'V3', AppColors.accent),
        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.canCouldExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — May / Might / May have
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildMayMightContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'May / Might के 3 प्रयोग:\n1. Possibility (सम्भावना)\n2. Permission (अनुमति) — May only\n3. Wish (इच्छा/आशीर्वाद) — May only',
          'May/Might: 1) Possibility, 2) Permission (May only), 3) Wish/Prayer (May only)',
        ),
        const SizedBox(height: AppSpacing.lg),

        // May vs Might
        _mayMightCompareCard(),
        const SizedBox(height: AppSpacing.lg),

        _sectionHeader('1. Possibility (सम्भावना)', '🤔', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.mayMightPossibilityExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('2. Permission — May only (अनुमति)', '🙏', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.mayPermissionExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('3. Wish / Prayer — May only (इच्छा)', '⭐', AppColors.warning),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.mayWishExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Should / Must / Ought to
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildShouldMustContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Should = चाहिए (advice/mild duty)\nShould have + V3 = चाहिए था (unfulfilled past)\nMust = चाहिए ज़रुर (strong obligation)\nOught to = Should की जगह (rarely used now)',
          'Should = mild advice. Must = strong obligation. Should/Must have + V3 = past unfulfilled.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Row(children: [
          Expanded(child: _modalSummaryCard('Should', 'चाहिए\n(mild)', 'V1', AppColors.primary)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: _modalSummaryCard('Must', 'चाहिए ज़रुर\n(strong)', 'V1', AppColors.error)),
        ]),
        const SizedBox(height: AppSpacing.sm),
        Row(children: [
          Expanded(child: _modalSummaryCard('Should have', 'चाहिए था', 'V3', AppColors.accent)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: _modalSummaryCard('Must have', 'पक्का हुआ होगा', 'V3', const Color(0xFF7C3AED))),
        ]),

        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Should / Should have', '✅', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.shouldExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Ought to (rarely used now)', '📌', AppColors.warning),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Text('"Should" की जगह "Ought to" का प्रयोग भी किया जा सकता है, पर अब "ought to" rarely used है।', style: AppTextStyles.bodyMedium),
        ),
        const SizedBox(height: AppSpacing.md),
        _simpleExampleRow('तुम्हें ऐसा नहीं कहना चाहिए।', 'You ought not to say so.'),
        _simpleExampleRow('लोगों को निकल जाना चाहिए था।', 'People ought to have left.'),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Must / Must have', '⚠️', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.mustExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Has to / Had to / Will have to
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildHasToContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Has to / Have to = करना है / करना पड़ता है (present)\nHad to = करना था / करना पड़ा (past)\nWill have to = करना पड़ेगा (future)',
          'Has to/Have to → present obligation. Had to → past. Will have to → future.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _modalSummaryCard('Has to / Have to', 'करना है / पड़ता है', 'V1', AppColors.primary),
        const SizedBox(height: AppSpacing.sm),
        _modalSummaryCard('Had to', 'करना था / पड़ा', 'V1', AppColors.accent),
        const SizedBox(height: AppSpacing.sm),
        _modalSummaryCard('Will have to', 'करना पड़ेगा', 'V1', AppColors.success),
        const SizedBox(height: AppSpacing.lg),

        _sectionHeader('Has to / Have to', '📌', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.hasToExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Had to', '⏮️', AppColors.accent),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.hadToExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Will have to / Will be able to', '🔮', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.willHaveToExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)),
                  child: Text(ex['modal']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                ),
                const SizedBox(height: 4),
                Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                Row(children: [
                  Expanded(child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                  commonWidgets.ttsButton(ex['english']!),
                ]),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Used to / Would / Would like to
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildUsedToContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Used to = किया करता था / करता था (past habit)\nWould = used to की जगह (in past context)\nIs/Am/Are + used to = आदत होना\nWould like to = चाहूँगा (polite desire)',
          '"Used to" for past habit. "Would" replaces "used to" after first use. "Would like to" for polite desire.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _sectionHeader('Used to (किया करता था)', '🔄', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.usedToExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _importantRuleCard(
          'Important Rule: Used to → Would',
          'एक बार "used to" आ जाये तो दोबारा "used to" की जगह "would" का प्रयोग करें।\nOnce "used to" is used, replace next occurrences with "would".',
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.usedToWouldExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _importantRuleCard(
          'Past Paragraph Rule',
          'अगर पैराग्राफ किसी बीती बात के बारे में बता रहा हो तो हर बार "would" का प्रयोग होता है।',
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.wouldPastParaExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Would — Future in Past (will → would)', '⏪', AppColors.warning),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Text('Past में कही हुई future की बात → will को would में बदल दें।\n"He said he would help us." (वो कहा → would)', style: AppTextStyles.bodyMedium),
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.wouldFutureInPastExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Would — For Request (निवेदन)', '🙏', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.wouldRequestExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Is/Am/Are + Used to (आदत होना)', '💡', AppColors.accent),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.isUsedToExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Would like to (चाहूँगा — polite desire)', '⭐', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.wouldLikeToExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 7 — Need / Dare / Will be able to
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildNeedDareContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Need + Noun = ज़रुरत है (no "to")\nNeed to + Verb = ज़रुरत है / चाहिए\nDare to = हिम्मत करना\nWill be able to = सकेगा / पायेगा',
          'Need + noun (no "to"). Need to + verb. Dare = courage. Will be able to = future ability.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _needRuleCard(),
        const SizedBox(height: AppSpacing.lg),

        _sectionHeader('Need Examples', '📌', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.needExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                  Row(children: [
                    Expanded(child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                    commonWidgets.ttsButton(ex['english']!),
                  ]),
                ])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                  child: Text(ex['note']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor, fontSize: 10)),
                ),
              ]),
            )),

        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Dare Examples (हिम्मत करना)', '💪', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.dareExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — Will → Must / May/Might Rule
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildWillRuleContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Very Important Rule:\nपक्का / ज़रुर → will को must में बदलें\nशायद → will को may / might में बदलें',
          'If "पक्का/ज़रुर" → replace will with must.\nIf "शायद" → replace will with may/might.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule table
        _willRuleTableWidget(),
        const SizedBox(height: AppSpacing.lg),

        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.willRuleExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  Widget _willRuleTableWidget() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
            child: Row(children: [
              Expanded(child: Text('Hindi', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
              Expanded(child: Text('Will (Normal)', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary))),
              Expanded(child: Text('Must (पक्का)', style: AppTextStyles.labelSmall.copyWith(color: AppColors.error))),
              Expanded(child: Text('May/Might (शायद)', style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning))),
            ]),
          ),
          ...Chapter21Data.willRuleTable.asMap().entries.map((e) {
            final i = e.key; final row = e.value;
            return Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(border: i < Chapter21Data.willRuleTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(child: Text(row['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
                Expanded(child: Text(row['will']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary, fontSize: 11))),
                Expanded(child: Text(row['must']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error, fontSize: 11))),
                Expanded(child: Text(row['may']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.warning, fontSize: 11))),
              ]),
            );
          }),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 9 — Practice Exercise (94 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए 94 वाक्यों का अनुवाद अंग्रेज़ी में करें। उत्तर देखने के लिए कार्ड पर टैप करें।',
          'Translate all 94 sentences into English. Tap any card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statChip('94', 'वाक्य', '✍️'),
              _statChip('19', 'Modals', '📋'),
              _statChip('Mixed', 'Practice', '🎯'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Hindi → English', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.practiceExercise.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 10 — Test Paper I (35 Hindi→English)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaper1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Test Paper I — 35 Hindi→English sentences। Tap to reveal answers.',
          '35 sentences covering all Modals.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test I — Q1', 'Translate into English', '✍️', AppColors.primary, '35 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter21Data.testPaper1.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 11 — Test Paper II (50 English→Hindi)
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
        ...Chapter21Data.testPaper2.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['english']!, answer: e.value['hindi']!, accentColor: accentColor, isEnglishFirst: true)),
        const SizedBox(height: AppSpacing.xl),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 12 — Chapter Quiz Intro
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📋', 'title': 'Overview', 'hi': '19 Modals — complete reference table'},
      {'emoji': '💪', 'title': 'Can / Could / Could have', 'hi': 'ability, past, missed opportunity'},
      {'emoji': '🤔', 'title': 'May / Might', 'hi': 'possibility, permission, wish'},
      {'emoji': '✅', 'title': 'Should / Must / Ought to', 'hi': 'advice, obligation, deduction'},
      {'emoji': '📌', 'title': 'Has to / Had to / Will have to', 'hi': 'present/past/future obligation'},
      {'emoji': '🔄', 'title': 'Used to / Would / Would like to', 'hi': 'past habit, polite desire'},
      {'emoji': '⚡', 'title': 'Need / Dare / Will be able to', 'hi': 'necessity, courage, future ability'},
      {'emoji': '💡', 'title': 'Will → Must/May Rule', 'hi': 'पक्का/शायद conversion rule'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 21 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Modals — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('100', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('19', 'Modals'),
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
            Expanded(child: Text('6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!', style: AppTextStyles.bodyMedium)),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _modalSummaryCard(String modal, String meaning, String form, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(modal, style: AppTextStyles.labelLarge.copyWith(color: color)),
          Text(meaning, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
          child: Text(form, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
        ),
      ]),
    );
  }

  Widget _mayMightCompareCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Row(children: [
        Expanded(child: Column(children: [
          _verbChip('May', AppColors.primary),
          const SizedBox(height: 6),
          Text('Higher probability\n(60–70%)', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11), textAlign: TextAlign.center),
        ])),
        Container(width: 1, height: 50, color: AppColors.lockedBg),
        Expanded(child: Column(children: [
          _verbChip('Might', AppColors.accent),
          const SizedBox(height: 6),
          Text('Lower probability\n(30–40%)', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11), textAlign: TextAlign.center),
        ])),
      ]),
    );
  }

  Widget _needRuleCard() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.xl), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.xl - 2), topRight: Radius.circular(AppRadius.xl - 2))),
          child: Text('Need — Rule', style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _verbChip('Need + Noun', AppColors.success),
                const SizedBox(height: 8),
                const Text('No "to"\nNoun = संज्ञा\ne.g. "Ram needs a pen."', style: AppTextStyles.bodyMedium),
              ]),
            )),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _verbChip('Need to + V1', AppColors.primary),
                const SizedBox(height: 8),
                const Text('Use "to"\nVerb = क्रिया\ne.g. "Ram needs to go."', style: AppTextStyles.bodyMedium),
              ]),
            )),
          ]),
        ),
      ]),
    );
  }

  Widget _importantRuleCard(String title, String body) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.4), width: 2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('⚠️', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(title, style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
        ]),
        const SizedBox(height: 6),
        Text(body, style: AppTextStyles.bodyMedium),
      ]),
    );
  }

  Widget _sectionHeader(String title, String emoji, Color color) {
    return Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 20)),
      const SizedBox(width: 8),
      Text(title, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 15)),
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
        ...Chapter21Data.motivationalQuotes.map((q) => Padding(
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

  const _RevealCard({required this.no, required this.question, required this.answer, required this.accentColor, this.isEnglishFirst = false});

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
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 26, height: 26,
            decoration: BoxDecoration(color: widget.accentColor.withOpacity(0.12), shape: BoxShape.circle),
            child: Center(child: Text('${widget.no}', style: TextStyle(fontFamily: 'Nunito', fontSize: 11, fontWeight: FontWeight.w700, color: widget.accentColor))),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          ])),
          Icon(_revealed ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppColors.textHint, size: 18),
        ]),
      ),
    );
  }
}