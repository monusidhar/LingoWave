import 'package:flutter/material.dart';
import '../../data/chapter19_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter19Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter19Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Introduction to Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Tense किसी भी वाक्य में क्रिया का वह रूप है जिससे पता चलता है कि कार्य वर्तमान में हो रहा है, भूतकाल में हुआ था या भविष्य में होगा।',
          'Tense is the form of a verb that tells us whether the action is happening now, happened in the past, or will happen in the future.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accent.withOpacity(0.4), width: 2),
          ),
          child: const Row(
            children: [
              Text('⚠️', style: TextStyle(fontSize: 24)),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  'यह एक महत्वपूर्ण टॉपिक है। इस चैप्टर को अच्छी तरह समझे बिना आप अंग्रेज़ी में पकड़ नहीं बना सकते।\n\nThis is a critical chapter — master it to speak fluent English.',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('पहले ये समझें (Prerequisites)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.prerequisites.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: AppShadows.card,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                      child: Center(
                        child: Text(p['no']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['topic']!, style: AppTextStyles.labelLarge),
                          Text(p['en']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: accentColor)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)),
                      child: Text(p['chapter']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.success)),
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Text('Tense के 3 प्रकार', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.tenseTypes.map((t) => _tenseTypeCard(t)),
        const SizedBox(height: AppSpacing.lg),
        Text('प्रत्येक Tense के 4 उप-प्रकार', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: Chapter19Data.tenseSubTypes.map((s) => Column(
              children: [
                Text(s['emoji']!, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 4),
                Text(s['name']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 12)),
                Text(s['nameHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
              ],
            )).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('3 × 4 = ', style: AppTextStyles.headingLarge.copyWith(color: AppColors.textSecondary)),
              Text('12 Tenses', style: AppTextStyles.headingLarge.copyWith(color: accentColor)),
              const SizedBox(width: 8),
              Text('कुल मिलाकर', style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण — वाक्य के भाग', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _sentencePartsTable(),
        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण — वाक्यों के प्रकार', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _sentenceTypesTable(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Present Indefinite: Affirmative
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentIndefiniteAffContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Present Indefinite की पहचान: वाक्य के अंत में ता, ते, ती का प्रयोग होता है।\nजैसे: राम घूमता है, सीता नाचती है, लोग घूमते हैं।',
          'Identification: sentences end with ता/ते/ती.\nRule: Subject + V1 + s/es (3rd Person Singular) + Object.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + Verb 1st form + s/es (only for 3rd Person Singular) + Object', AppColors.success),
        const SizedBox(height: AppSpacing.lg),
        Text('कब s लगाएँ, कब es? (s vs es rules)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.sEsRules.map((r) => _sEsRuleCard(r)),
        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Present Indefinite: Negative & Interrogative
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentIndefiniteNegContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Present Indefinite के Negative, Interrogative और Negative Interrogative वाक्य।',
          'Negative, Interrogative, and Negative Interrogative forms of Present Indefinite Tense.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.error.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.error.withOpacity(0.3))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Does not / Do not', style: AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
              const SizedBox(height: AppSpacing.sm),
              _doesDoRow('3rd Person Singular', "does not / doesn't", AppColors.error),
              const SizedBox(height: 6),
              _doesDoRow('All Others', "do not / don't", AppColors.primary),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Negative Rule', 'Subject + does/do + not + Verb 1st form + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piNegExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + does/do + Subject + Verb 1st form + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.sm),
        Text('प्रश्नवाचक वाक्यों में helping verb (do/does) subject से पहले आ जाती है।', style: AppTextStyles.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + does/do + Subject + not + Verb 1st form + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Present Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Present Continuous की पहचान: वाक्य के अंत में रहा है, रही है, रहे हैं, रहा हूँ का प्रयोग।\nजैसे: राम घूम रहा है, सीता नाच रही है।',
          'Identification: sentences end with रहा है/रही है/रहे हैं/रहा हूँ.\nRule: Subject + is/am/are + Verb + ing + Object.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('is / am / are — कब क्या लगेगा?', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcHelpingVerbRules.map((r) => _helpingVerbRuleCard(r)),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + is/am/are + Verb 1st form + ing + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + is/am/are + not + Verb + ing + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + is/am/are + Subject + Verb + ing + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + is/am/are + Subject + not + Verb + ing + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Present Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentPerfectContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Present Perfect की पहचान: चुका है / चुकी है / चुके हैं / लिया है / दिया है / की है।\nजैसे: राम घूम चुका है, मैंने उसे किताब दी है।',
          'Identification: ends with चुका है/चुकी है/चुके हैं/लिया है/दिया है.\nRule: Subject + has/have + V3 + Object.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _hasHaveRuleCard(),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + has/have + V3 + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + has/have + not + V3 + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + has/have + Subject + V3 + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + has/have + Subject + not + V3 + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Present Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPresentPerfectContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Present Perfect Continuous: Present Continuous जैसा ही है — पर साथ में समय (since/for) भी बताया जाता है।\nजैसे: राम 2 घंटे से घूम रहा है।',
          'Like Present Continuous but with time duration. Rule: Subject + has/have been + V+ing + since/for + time.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sinceForCard(),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + has/have been + V+ing + Object + since/for + time', AppColors.success),
        const SizedBox(height: AppSpacing.sm),
        _hasHaveBeenRuleCard(),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + has/have + not been + V+ing + since/for + time', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + has/have + Subject + been + V+ing + since/for + time?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + has/have + Subject + not + been + V+ing + since/for + time?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 7 — Past Indefinite Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastIndefiniteContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Past Indefinite की पहचान: गया, लिया, दिया, सोया — इसमें है/हैं या था/थे/थी का प्रयोग नहीं होता।\nजैसे: राम घूमने गया, तुमने खाना खाया।',
          'Identification: ends with गया/लिया/दिया — NO है/हैं or था/थे/थी.\nRule: Subject + V2 + Object (Affirmative).',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.4), width: 2)),
          child: Row(
            children: [
              const Text('⚠️', style: TextStyle(fontSize: 22)),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: Text('Subject चाहे Singular हो या Plural — Rules एक जैसे हैं।\nSingular और Plural subject दोनों के साथ same rule.', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + V2 + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piPastAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['comment']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + did not + V1 + Object', AppColors.error),
        const SizedBox(height: AppSpacing.sm),
        _tipCard('💡 Note', 'Negative में V1 (1st form) लगती है — V2 नहीं। did already shows past tense.'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piPastNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + did + Subject + V1 + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piPastInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + did + Subject + not + V1 + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.piPastNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — Past Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Past Continuous की पहचान: रहा था / रही थी / रहे थे।\nजैसे: राम घूम रहा था, सीता नाच रही थी, लोग घूम रहे थे।',
          'Identification: ends with रहा था/रही थी/रहे थे.\nRule: Subject + was/were + V+ing + Object.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _wasWereRuleCard(),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + was/were + V+ing + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcPastAffExamples.map((ex) => _exampleCard(ex['hindi']!, ex['english']!, ex['reason']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + was/were + not + V+ing + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcPastNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + was/were + Subject + V+ing + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcPastInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + was/were + Subject + not + V+ing + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.pcPastNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 9 — Past Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastPerfectContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Past Perfect की पहचान: चुका था / चुकी थी / चुके थे / लिया था / दिया था।\nजैसे: राम घूम चुका था, मैंने उसे देखा था।',
          'Identification: ends with चुका था/चुकी थी/चुके थे/लिया था.\nRule: Subject + had + V3 + Object. (had for ALL subjects)',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.success.withOpacity(0.35))),
          child: Row(
            children: [
              _verbChip('had', AppColors.success),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "had" का प्रयोग होता है।', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + had + V3 + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppPastAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + had + not + V3 + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppPastNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + had + Subject + V3 + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppPastInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + had + Subject + not + V3 + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppPastNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 10 — Past Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPastPerfectContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Past Perfect Continuous: Past Continuous जैसा ही है — पर साथ में समय (since/for) भी बताया जाता है।\nजैसे: राम 2 घंटे से घूम रहा था।',
          'Like Past Continuous but with time duration. Rule: Subject + had been + V+ing + since/for + time.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.success.withOpacity(0.3))),
          child: Row(
            children: [
              _verbChip('had been', AppColors.success),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "had been" का प्रयोग।\nSince/For के लिए वही नियम जो Present Perfect Continuous में पढ़ा था।', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + had been + V+ing + Object + since/for + time', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcPastAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + had not been + V+ing + Object + since/for + time', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcPastNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + had + Subject + been + V+ing + since/for + time?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcPastInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + had + Subject + not + been + V+ing + since/for + time?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.ppcPastNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 11 — Future Indefinite Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildFutureIndefiniteContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Future Indefinite की पहचान: वाक्य के अंत में गा / गे / गी का प्रयोग।\nजैसे: राम घूमने जायेगा, सीता नाचेगी, लोग घूमेंगे।',
          'Identification: ends with गा/गे/गी.\nRule: Subject + will + V1 + Object. (will for ALL subjects)',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.35))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                _verbChip('will', AppColors.warning),
                const SizedBox(width: AppSpacing.md),
                const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "will" का प्रयोग।', style: AppTextStyles.bodyMedium)),
              ]),
              const SizedBox(height: AppSpacing.sm),
              Text('नोट: अब "Shall" का प्रयोग Future Tense में प्रायः नहीं किया जाता। "Will" preferred है।', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.warning, fontSize: 12)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + will + V1 + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fiAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + will not + V1 + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fiNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + will + Subject + V1 + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fiInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + will + Subject + not + V1 + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fiNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 12 — Future Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildFutureContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Future Continuous की पहचान: रहा होगा / रही होगी / रहे होंगे / रहा हूँगा।\nजैसे: राम घूम रहा होगा, सीता नाच रही होगी।',
          'Identification: ends with रहा होगा/रही होगी/रहे होंगे.\nRule: Subject + will be + V+ing + Object. (will be for ALL subjects)',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.primary.withOpacity(0.3))),
          child: Row(
            children: [
              _verbChip('will be', AppColors.primary),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "will be" का प्रयोग।', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + will be + V+ing + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fcAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + will not be + V+ing + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fcNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + will + Subject + be + V+ing + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fcInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + will + Subject + not + be + V+ing + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fcNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 13 — Future Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildFuturePerfectContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Future Perfect की पहचान: चुका होगा / चुकी होगी / चुके होंगे / लिया होगा / दिया होगा।\nजैसे: राम घूम चुका होगा, सीता नाच चुकी होगी।',
          'Identification: ends with चुका होगा/चुकी होगी/चुके होंगे.\nRule: Subject + will have + V3 + Object. (will have for ALL subjects)',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accent.withOpacity(0.3))),
          child: Row(
            children: [
              _verbChip('will have', AppColors.accent),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "will have" का प्रयोग।', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + will have + V3 + Object', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + will not have + V3 + Object', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + will + Subject + have + V3 + Object?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + will + Subject + not + have + V3 + Object?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 14 — Future Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildFuturePerfectContinuousContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Future Perfect Continuous: Future Continuous जैसा ही है — पर साथ में समय (since/for) भी बताया जाता है।\nजैसे: राम 2 घंटे से खेल रहा होगा।',
          'Like Future Continuous but with time duration. Rule: Subject + will have been + V+ing + since/for + time.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.success.withOpacity(0.3))),
          child: Row(
            children: [
              _verbChip('will have been', AppColors.success),
              const SizedBox(width: AppSpacing.md),
              const Expanded(child: Text('Singular और Plural — सभी Subjects के साथ "will have been" का प्रयोग।\nSince/For के नियम वही जो पहले पढ़े थे।', style: AppTextStyles.bodyMedium)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _ruleBox('Affirmative Rule', 'Subject + will have been + V+ing + Object + since/for + time', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpcAffExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Rule', 'Subject + will not have been + V+ing + Object + since/for + time', AppColors.error),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpcNegExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Interrogative Rule', '(WH) + will + Subject + have been + V+ing + since/for + time?', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpcInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
        const SizedBox(height: AppSpacing.xl),
        _ruleBox('Negative Interrogative Rule', '(WH) + will + Subject + not + have been + V+ing + since/for + time?', const Color(0xFF7C3AED)),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.fpcNegInterExamples.map((ex) => _simpleExampleRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 15 — Practice Exercise (190 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए 190 वाक्यों का अनुवाद अंग्रेज़ी में करें। उत्तर देखने के लिए कार्ड पर टैप करें।',
          'Translate all 190 sentences into English. Tap any card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statChip('190', 'वाक्य', '✍️'),
              _statChip('All 12', 'Tenses', '⏱️'),
              _statChip('Mixed', 'Practice', '🎯'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Hindi → English', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.practiceExercise.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 16 — Test Paper I & II
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaper1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Test Paper I — English→Hindi, MCQ और Hindi→English। Test Paper II — Hindi→English (35 sentences)।',
          'Tap each card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test I — Q1', 'Translate into Hindi (20 sentences)', '📖', AppColors.primary, '20 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.testPaper1Q1.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['english']!, answer: e.value['hindi']!, accentColor: accentColor, isEnglishFirst: true)),
        const SizedBox(height: AppSpacing.xl),
        _testSectionHeader('Test I — Q2', 'Choose the correct alternative', '✅', AppColors.success, '10 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.testPaper1Q2.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['question']!, answer: '${e.value['answer']!} — ${e.value['explanation']!}', accentColor: accentColor, isEnglishFirst: true)),
        const SizedBox(height: AppSpacing.xl),
        _testSectionHeader('Test I — Q3', 'Translate into English (10 sentences)', '✍️', const Color(0xFF7C3AED), '10 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.testPaper1Q3.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.xl),
        _testSectionHeader('Test II — Q1', 'Translate into English (35 sentences)', '✍️', AppColors.warning, '35 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.testPaper2Q1.asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.lg),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 17 — Test Paper III & IV
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaper2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Test III — Hindi→English + sentence correction। Test IV — 50 Hindi→English sentences।',
          'Tap each card to check your answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test III — Q2', 'Correct the sentences', '🔧', AppColors.error, '10 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.testPaper3Q2.asMap().entries.map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      _noChip(e.key + 1),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(child: Text(e.value['wrong']!, style: AppTextStyles.bodyMedium.copyWith(decoration: TextDecoration.lineThrough, color: AppColors.error))),
                    ]),
                    const SizedBox(height: 6),
                    Row(children: [
                      const SizedBox(width: 32),
                      const Icon(Icons.arrow_downward_rounded, size: 14, color: AppColors.success),
                      const SizedBox(width: 4),
                      Expanded(child: Text(e.value['correct']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13))),
                      commonWidgets.ttsButton(e.value['correct']!, color: AppColors.success),
                    ]),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                      child: Text(e.value['fix']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.success)),
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(height: AppSpacing.xl),
        _testSectionHeader('Test IV — Q1', 'Translate into English (50 sentences)', '✍️', AppColors.primary, '50 marks'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter19Data.practiceExercise.sublist(0, 50).asMap().entries.map((e) =>
            _RevealCard(no: e.key + 1, question: e.value['hindi']!, answer: e.value['english']!, accentColor: accentColor)),
        const SizedBox(height: AppSpacing.lg),
        _practiceQuotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO — Lesson 18
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '⏱️', 'title': 'Introduction to Tense', 'hi': '12 Tenses, 3 types, 4 sub-types'},
      {'emoji': '✅', 'title': 'Present Indefinite', 'hi': 'ता/ते/ती — s/es rules'},
      {'emoji': '🔄', 'title': 'Present Continuous', 'hi': 'रहा है/रही है — is/am/are'},
      {'emoji': '✔️', 'title': 'Present Perfect', 'hi': 'चुका है/चुकी है — has/have + V3'},
      {'emoji': '⏳', 'title': 'Present Perfect Continuous', 'hi': 'रहा है + time — since/for'},
      {'emoji': '⏮️', 'title': 'Past Indefinite', 'hi': 'गया/लिया — V2'},
      {'emoji': '🔁', 'title': 'Past Continuous', 'hi': 'रहा था/रही थी — was/were'},
      {'emoji': '📌', 'title': 'Past Perfect', 'hi': 'चुका था/लिया था — had + V3'},
      {'emoji': '🕰️', 'title': 'Past Perfect Continuous', 'hi': 'रहा था + time — had been'},
      {'emoji': '🔮', 'title': 'Future Indefinite', 'hi': 'गा/गे/गी — will + V1'},
      {'emoji': '🌀', 'title': 'Future Continuous', 'hi': 'रहा होगा/रही होगी — will be'},
      {'emoji': '🏁', 'title': 'Future Perfect', 'hi': 'चुका होगा/चुकी होगी — will have + V3'},
      {'emoji': '♾️', 'title': 'Future Perfect Continuous', 'hi': 'रहा होगा + time — will have been'},
      {'emoji': '✍️', 'title': 'Practice Exercise', 'hi': '190 sentences — all tenses mixed'},
      {'emoji': '📝', 'title': 'Test Papers I–IV', 'hi': 'Translation, MCQ, sentence correction'},
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
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 19 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Chapter 19 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('15', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('150', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('15', 'टॉपिक'),
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
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(
                children: [
                  Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['title']!, style: AppTextStyles.labelLarge),
                        Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Row(
            children: [
              Text('💡', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '15 में से 9 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 9/15 or more to unlock the next chapter!',
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
  // SHARED HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _tenseTypeCard(Map<String, String> t) {
    final colorMap = {'🟢': AppColors.success, '🔵': AppColors.primary, '🟡': AppColors.warning};
    final color = colorMap[t['emoji']] ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(
        children: [
          Text(t['emoji']!, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t['name']!, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 16)),
                Text(t['nameHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(t['helpingVerbs']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 11, fontStyle: FontStyle.italic)),
          ),
        ],
      ),
    );
  }

  Widget _sentencePartsTable() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
            child: Row(children: ['वाक्य', 'Subject', 'Verb', 'Object'].map((h) => Expanded(child: Text(h, style: AppTextStyles.labelSmall.copyWith(color: accentColor), textAlign: TextAlign.center))).toList()),
          ),
          ...Chapter19Data.sentencePartsExamples.asMap().entries.map((e) {
            final i = e.key; final ex = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(border: i < Chapter19Data.sentencePartsExamples.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(child: Text(ex['sentence']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
                Expanded(child: Text(ex['subject']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary), textAlign: TextAlign.center)),
                Expanded(child: Text(ex['verb']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.success), textAlign: TextAlign.center)),
                Expanded(child: Text(ex['object']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.accent), textAlign: TextAlign.center)),
              ]),
            );
          }),
        ],
      ),
    );
  }

  Widget _sentenceTypesTable() {
    final typeColors = {'Affirmative': AppColors.success, 'Negative': AppColors.error, 'Interrogative': AppColors.primary, 'Negative Interrogative': const Color(0xFF7C3AED)};
    return Column(
      children: Chapter19Data.sentenceTypesTable.map<Widget>((row) {
        final color = typeColors[row['type']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
                decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
                child: Row(children: [
                  Text(row['type']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
                  const SizedBox(width: 8),
                  Text('(${row['typeHi']!})', style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 11)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(children: [
                  _stRow(row['ex1']!), const SizedBox(height: 4),
                  _stRow(row['ex2']!), const SizedBox(height: 4),
                  _stRow(row['ex3']!),
                ]),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _stRow(String text) => Row(children: [
    const Text('→', style: TextStyle(color: AppColors.textHint, fontSize: 12)),
    const SizedBox(width: 6),
    Expanded(child: Text(text, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
  ]);

  Widget _ruleBox(String title, String rule, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.4), width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.labelLarge.copyWith(color: color)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md)),
            child: Text(rule, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13, fontFamily: 'Nunito')),
          ),
        ],
      ),
    );
  }

  Widget _sEsRuleCard(Map<String, String> r) {
    final isSpecial = r['rule']!.contains('Vowel');
    final color = isSpecial ? AppColors.warning : accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: color.withOpacity(0.25))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(r['rule']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
            Text(r['ruleHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
          ])),
          const SizedBox(width: 8),
          Expanded(flex: 2, child: Text(r['examples']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12))),
        ],
      ),
    );
  }

  Widget _exampleCard(String hindi, String english, String reason) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(hindi, style: AppTextStyles.bodyMedium),
            Row(children: [
              Expanded(child: Text(english, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
              commonWidgets.ttsButton(english),
            ]),
          ])),
          const SizedBox(width: 6),
          Expanded(flex: 3, child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
            child: Text(reason, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: accentColor)),
          )),
        ],
      ),
    );
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

  Widget _helpingVerbRuleCard(Map<String, String> r) {
    final colorMap = {'primary': AppColors.primary, 'success': AppColors.success, 'accent': AppColors.accent};
    final color = colorMap[r['color']] ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(r['subject']!, style: AppTextStyles.labelLarge.copyWith(color: color)),
          Text(r['examples']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        ])),
        const Icon(Icons.arrow_forward_rounded, color: AppColors.textHint, size: 18),
        const SizedBox(width: 8),
        _verbChip(r['verb']!, color),
      ]),
    );
  }

  Widget _doesDoRow(String subject, String verb, Color color) {
    return Row(children: [
      Expanded(child: Text(subject, style: AppTextStyles.bodyMedium)),
      _verbChip(verb, color),
    ]);
  }

  Widget _verbChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
      child: Text(label, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }

  Widget _hasHaveRuleCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('has / have — कब क्या लगेगा?', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
        const SizedBox(height: AppSpacing.sm),
        _doesDoRow('3rd Person Singular', 'has', AppColors.primary),
        const SizedBox(height: 6),
        _doesDoRow('All Other Subjects', 'have', AppColors.success),
      ]),
    );
  }

  Widget _hasHaveBeenRuleCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('has been / have been — कब क्या लगेगा?', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
        const SizedBox(height: AppSpacing.sm),
        _doesDoRow('3rd Person Singular', 'has been', AppColors.primary),
        const SizedBox(height: 6),
        _doesDoRow('All Other Subjects', 'have been', AppColors.success),
      ]),
    );
  }

  Widget _wasWereRuleCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('was / were — कब क्या लगेगा?', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
        const SizedBox(height: AppSpacing.sm),
        _doesDoRow('Singular Subject', 'was', AppColors.primary),
        const SizedBox(height: 6),
        _doesDoRow('Plural Subject', 'were', AppColors.success),
      ]),
    );
  }

  Widget _sinceForCard() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.xl), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.xl - 2), topRight: Radius.circular(AppRadius.xl - 2))),
          child: Text('Since vs For', style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _verbChip('Since', AppColors.primary),
                const SizedBox(height: 6),
                Text('निश्चित समय\n(Point of time)', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary, fontSize: 11)),
                const SizedBox(height: 8),
                ...Chapter19Data.sinceExamples.map((e) => Padding(padding: const EdgeInsets.only(bottom: 3), child: Text('• ${e['example']!}', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)))),
              ])),
              const SizedBox(width: AppSpacing.md),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _verbChip('For', AppColors.success),
                const SizedBox(height: 6),
                Text('अनिश्चित समय / अवधि\n(Duration)', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.success, fontSize: 11)),
                const SizedBox(height: 8),
                ...Chapter19Data.forExamples.map((e) => Padding(padding: const EdgeInsets.only(bottom: 3), child: Text('• ${e['example']!}', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)))),
              ])),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _tipCard(String title, String body) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning)),
        const SizedBox(width: 8),
        Expanded(child: Text(body, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
      ]),
    );
  }

  Widget _quotesSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Text('💡', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
          ]),
          const SizedBox(height: AppSpacing.md),
          ...Chapter19Data.motivationalQuotes.map((q) => Padding(
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
        ],
      ),
    );
  }

  Widget _practiceQuotesSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Text('💡', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
          ]),
          const SizedBox(height: AppSpacing.md),
          ...Chapter19Data.practiceMotivationalQuotes.map((q) => Padding(
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
        ],
      ),
    );
  }

  Widget _statChip(String value, String label, String emoji) {
    return Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 20)),
      const SizedBox(height: 2),
      Text(value, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13)),
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

  Widget _noChip(int n) {
    return Container(
      width: 24, height: 24,
      decoration: BoxDecoration(color: accentColor.withOpacity(0.15), shape: BoxShape.circle),
      child: Center(child: Text('$n', style: TextStyle(fontFamily: 'Nunito', fontSize: 10, fontWeight: FontWeight.w800, color: accentColor))),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            Icon(_revealed ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppColors.textHint, size: 18),
          ],
        ),
      ),
    );
  }
}