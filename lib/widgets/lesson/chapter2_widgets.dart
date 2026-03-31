import 'package:flutter/material.dart';
import '../../data/chapter2_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter2Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter2Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Sentence Types
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildSentenceTypesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'शब्दों का वह समूह जिससे सुनने वाले को पूर्ण संदेश का पता चले, वाक्य (Sentence) कहलाता है।',
          'A group of words that communicates a complete message is called a Sentence.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Classification 1 — भाव के आधार पर', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter2Data.sentenceClass1.map((s) => _sentenceTypeCard(s)),
        const SizedBox(height: AppSpacing.xl),
        Text('Classification 2 — नकारात्मक/प्रश्न के आधार पर', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _class2Table(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes.sublist(0, 2)),
      ],
    );
  }

  Widget _sentenceTypeCard(Map<String, String> s) {
    final colors = {
      'Assertive / Declarative': AppColors.primary,
      'Interrogative': AppColors.warning,
      'Imperative': AppColors.success,
      'Exclamatory': AppColors.error,
    };
    final color = colors[s['type']] ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card, border: Border.all(color: color.withOpacity(0.2))),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
          child: Row(children: [
            Text(s['emoji']!, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(s['type']!, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 14)),
              Text(s['hindi']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
            ])),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(s['desc']!, style: AppTextStyles.bodyMedium),
            const SizedBox(height: 4),
            Text(s['descEn']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Row(children: [
                Text('e.g. ', style: AppTextStyles.labelSmall.copyWith(color: color)),
                Expanded(child: Text(s['ex']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
                commonWidgets.ttsButton(s['ex']!, color: color),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _class2Table() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
          child: Row(children: [
            Expanded(child: Text('Type', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
            Expanded(flex: 2, child: Text('English Example', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
            Expanded(flex: 2, child: Text('Hindi', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
          ]),
        ),
        ...Chapter2Data.sentenceClass2.asMap().entries.map((e) {
          final i = e.key; final s = e.value;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: i.isEven ? Colors.transparent : accentColor.withOpacity(0.02),
              border: i < Chapter2Data.sentenceClass2.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(s['type']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 11)),
                Text(s['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
              ])),
              Expanded(flex: 2, child: Text(s['example']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
              Expanded(flex: 2, child: Text(s['hindiEx']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
            ]),
          );
        }),
      ]),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Subject, Verb & Object
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildSVOContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Subject (कर्ता) = जिसके बारे में बात हो या जो काम करे।\nVerb (क्रिया) = Subject का काम या अवस्था।\nObject (कर्म) = जिस पर Subject के कार्य का प्रभाव पड़े।',
          'Subject = who performs. Verb = the action or state. Object = who/what gets affected.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _svoThreeCards(),
        const SizedBox(height: AppSpacing.xl),
        _verbTypesCard(),
        const SizedBox(height: AppSpacing.xl),
        Text('Subject-Verb-Object Examples', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _svoTable(),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes.sublist(0, 2)),
      ],
    );
  }

  Widget _svoThreeCards() {
    final items = [
      {'label': 'S', 'title': 'Subject', 'hindi': 'कर्ता', 'desc': 'जिसके बारे में बात हो या जो काम करे।', 'color': AppColors.primary, 'ex': '"Ram" — Ram is my friend.'},
      {'label': 'V', 'title': 'Verb', 'hindi': 'क्रिया', 'desc': 'Subject का काम (action) या अवस्था (state) बताती है।', 'color': AppColors.success, 'ex': '"sleeping" — Ayansh is sleeping.'},
      {'label': 'O', 'title': 'Object', 'hindi': 'कर्म', 'desc': 'Subject के काम का प्रभाव जिस पर पड़े।', 'color': AppColors.warning, 'ex': '"you" — I miss you.'},
    ];
    return Row(
      children: items.map((item) {
        final color = item['color'] as Color;
        return Expanded(child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
          child: Column(children: [
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(child: Text(item['label'] as String, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18))),
            ),
            const SizedBox(height: 6),
            Text(item['title'] as String, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
            Text(item['hindi'] as String, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: color)),
            const SizedBox(height: 4),
            Text(item['desc'] as String, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10), textAlign: TextAlign.center),
          ]),
        ));
      }).toList(),
    );
  }

  Widget _verbTypesCard() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.xl), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.xl - 2), topRight: Radius.circular(AppRadius.xl - 2))),
          child: Text('Verbs — दो प्रकार की होती हैं', style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _chip('Main Verb', AppColors.success),
                const SizedBox(height: 6),
                const Text('मुख्य क्रिया\nSubject का काम बताती है।\n\ne.g. dance, sing, read, sleep, think', style: AppTextStyles.bodyMedium),
              ]),
            )),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _chip('Helping Verb', AppColors.primary),
                const SizedBox(height: 6),
                const Text('सहायक क्रिया\nSubject की अवस्था बताती है।\n\ne.g. is, am, are, was, were, has, have, do', style: AppTextStyles.bodyMedium),
              ]),
            )),
          ]),
        ),
      ]),
    );
  }

  Widget _svoTable() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
          child: Row(children: [
            Expanded(flex: 3, child: Text('Sentence', style: AppTextStyles.labelSmall.copyWith(color: accentColor))),
            Expanded(child: Text('Subject', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary))),
            Expanded(child: Text('Object', style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning))),
            Expanded(child: Text('Verb', style: AppTextStyles.labelSmall.copyWith(color: AppColors.success))),
          ]),
        ),
        ...Chapter2Data.svoTable.asMap().entries.map((e) {
          final i = e.key; final row = e.value;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(color: i.isEven ? Colors.transparent : accentColor.withOpacity(0.02), border: i < Chapter2Data.svoTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(flex: 3, child: Text(row['sentence']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
              Expanded(child: Text(row['subject']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.primary))),
              Expanded(child: Text(row['object']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.warning))),
              Expanded(child: Text(row['verb']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.success))),
            ]),
          );
        }),
      ]),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Pronouns & This/That
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPronounsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Singular vs Plural subjects। Personal pronouns: I/We, You, He/She/They। This/That/These/Those का प्रयोग।',
          'Singular/Plural, Personal Pronouns, and This/That/These/Those usage.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Personal Pronouns', '👤', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        _pronounsTable(),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
          child: const Text('"You" is always treated as plural. Singular form "Thou" is obsolete.\n"You" के साथ Plural helping verbs लगती हैं: are, have, do.', style: AppTextStyles.bodyMedium),
        ),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('This / That / These / Those', '👆', accentColor),
        const SizedBox(height: AppSpacing.md),
        _thisThatGrid(),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter2Data.thisThosTable.map((row) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(children: [
                Expanded(child: Text(row['hindi']!, style: AppTextStyles.bodyMedium)),
                Expanded(child: Text(row['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                  child: Text(row['rule']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor, fontSize: 9)),
                ),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes.sublist(0, 2)),
      ],
    );
  }

  Widget _pronounsTable() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
          child: Row(children: [
            Expanded(child: Text('Person', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary))),
            Expanded(child: Text('Singular (एकवचन)', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary))),
            Expanded(child: Text('Plural (बहुवचन)', style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary))),
          ]),
        ),
        ...Chapter2Data.pronounsTable.asMap().entries.map((e) {
          final i = e.key; final row = e.value;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: i.isEven ? Colors.transparent : AppColors.primary.withOpacity(0.02), border: i < Chapter2Data.pronounsTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Text(row['person']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
              Expanded(child: Text(row['singular']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 12))),
              Expanded(child: Text(row['plural']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 12))),
            ]),
          );
        }),
      ]),
    );
  }

  Widget _thisThatGrid() {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg - 2), topRight: Radius.circular(AppRadius.lg - 2))),
        ),
        Table(
          border: TableBorder.all(color: AppColors.lockedBg, width: 1),
          children: [
            TableRow(decoration: BoxDecoration(color: accentColor.withOpacity(0.06)), children: [
              _tableCell('', isHeader: true),
              _tableCell('Singular (एकवचन)', isHeader: true),
              _tableCell('Plural (बहुवचन)', isHeader: true),
            ]),
            TableRow(children: [
              _tableCell('Near (पास)', isHeader: true),
              _tableCell('This\n(ये, यह)', highlight: AppColors.primary),
              _tableCell('These\n(ये, यह)', highlight: AppColors.primary),
            ]),
            TableRow(children: [
              _tableCell('Far (दूर)', isHeader: true),
              _tableCell('That\n(वह, वो)', highlight: AppColors.success),
              _tableCell('Those\n(वह, वो, वे)', highlight: AppColors.success),
            ]),
          ],
        ),
        const SizedBox(height: 2),
      ]),
    );
  }

  TableCell _tableCell(String text, {bool isHeader = false, Color? highlight}) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(text, style: TextStyle(fontFamily: 'Nunito', fontSize: 12, fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500, color: highlight ?? (isHeader ? AppColors.textSecondary : AppColors.textPrimary)), textAlign: TextAlign.center),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Apostrophe 's
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildApostropheContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          "'s का प्रयोग possession (स्वामित्व) दर्शाने के लिए होता है।\nRam's pen = Pen of Ram\nPlural ending in 's' → only apostrophe, no extra 's'",
          "Apostrophe 's shows possession. Plural ending in 's' → just apostrophe (girls' not girls's).",
        ),
        const SizedBox(height: AppSpacing.lg),
        _apostropheRuleCard(),
        const SizedBox(height: AppSpacing.lg),
        Text('Examples', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter2Data.apostropheExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                Row(children: [
                  Expanded(child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                  commonWidgets.ttsButton(ex['english']!.split(' /').first),
                ]),
                if (ex.containsKey('note')) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)),
                    child: Text('⚠️ ${ex['note']!}', style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning)),
                  ),
                ],
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes.sublist(2)),
      ],
    );
  }

  Widget _apostropheRuleCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Key Rule', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
        const SizedBox(height: 8),
        _ruleRow("Singular possession", "girl's brother ✅", AppColors.success),
        _ruleRow("Plural (ends in 's') possession", "girls' brother ✅ (NOT girls's)", AppColors.error),
        _ruleRow("Chain possession", "father's friend's daughter ✅", AppColors.primary),
      ]),
    );
  }

  Widget _ruleRow(String rule, String example, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 8, height: 8, margin: const EdgeInsets.only(top: 5, right: 8), decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(rule, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          Text(example, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
        ])),
      ]),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Key Phrases: Both/All + Common
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPhrasesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये छोटे-छोटे शब्द समूह आगे आने वाले chapters में बहुत काम आएंगे। इन्हें अच्छी तरह याद कर लें।',
          'These small phrases will be very useful in coming chapters. Learn them well.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Both / All (दोनों / सब)', '👥', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        _phraseGrid(Chapter2Data.bothAllPhrases),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Common Phrases (आम phrases)', '💬', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        _phraseGrid(Chapter2Data.commonPhrases),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('Preposition Phrases (स्थान)', '📍', AppColors.warning),
        const SizedBox(height: AppSpacing.md),
        _phraseGrid(Chapter2Data.prepPhrases),
        const SizedBox(height: AppSpacing.xl),
        _sectionHeader('With / Without / For / About', '🔗', accentColor),
        const SizedBox(height: AppSpacing.md),
        _phraseGrid(Chapter2Data.withPhrases),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes),
      ],
    );
  }

  Widget _phraseGrid(List<Map<String, String>> phrases) {
    return Column(
      children: phrases.map((p) => Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
            child: Row(children: [
              Expanded(child: Text(p['hindi']!, style: AppTextStyles.bodyMedium)),
              const SizedBox(width: 8),
              Expanded(child: Text(p['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
              commonWidgets.ttsButton(p['english']!.split(' /').first),
            ]),
          )).toList(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Adjectives & States
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildAdjectivesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये adjectives किसी की अवस्था/स्थिति बताते हैं। जैसे — सोया हुआ = Asleep, थका हुआ = Tired।',
          'These adjectives describe states/conditions. Learn them with pronunciation.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _statChip('18', 'States', '🎨'),
            _statChip('V3 form', 'mostly', '✅'),
            _statChip('Pronunciation', 'included', '🔊'),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter2Data.adjectivesStates.map((adj) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(children: [
                Expanded(flex: 2, child: Text(adj['hindi']!, style: AppTextStyles.bodyMedium)),
                Expanded(flex: 2, child: Row(children: [
                  Expanded(child: Text(adj['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13))),
                  commonWidgets.ttsButton(adj['english']!.split(' /').first),
                ])),
                Expanded(flex: 2, child: Text(adj['pronunciation']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 11))),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(Chapter2Data.motivationalQuotes),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📝', 'title': 'Sentence Types', 'hi': 'Assertive, Interrogative, Imperative, Exclamatory'},
      {'emoji': '🔤', 'title': 'Subject, Verb, Object', 'hi': 'Main verb vs Helping verb'},
      {'emoji': '👤', 'title': 'Pronouns & This/That', 'hi': 'I/We, You, He/She/They + This/That/These/Those'},
      {'emoji': "✏️", 'title': "Apostrophe 's", 'hi': "girl's vs girls' — possession rules"},
      {'emoji': '💬', 'title': 'Key Phrases', 'hi': 'Both/All, Common phrases, Prepositions'},
      {'emoji': '🎨', 'title': 'Adjectives/States', 'hi': 'Asleep, Tired, Broken, Hidden... 18 states'},
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
            const Text('अध्याय 2 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Few Basics of English', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('8', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('60', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('6', 'Topics'),
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
        Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))), child: const Row(children: [
          Text('💡', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Expanded(child: Text('5/8 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 5/8 or more to unlock the next chapter!', style: AppTextStyles.bodyMedium)),
        ])),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _sectionHeader(String title, String emoji, Color color) {
    return Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 20)),
      const SizedBox(width: 8),
      Text(title, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 15)),
    ]);
  }

  Widget _chip(String label, Color color) {
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

  Widget _quotesSection(List<Map<String, String>> quotes) {
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
        ...quotes.map((q) => Padding(
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