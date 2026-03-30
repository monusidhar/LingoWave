import 'package:flutter/material.dart';
import '../../data/chapter8_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter8Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter8Widgets({required this.commonWidgets, required this.accentColor});

  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('सर्वनाम का प्रयोग संज्ञा की जगह पर किया जाता है।', '"Pronoun is usually a substitute for a noun."'),
      const SizedBox(height: AppSpacing.lg),
      Text('समझिए — Pronoun क्यों ज़रूरी है?', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter8Data.introExamples.map((ex) {
        final isGood = ex['color'] == 'success';
        final color = isGood ? AppColors.success : AppColors.error;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(ex['label']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)))]),
            const SizedBox(height: AppSpacing.sm),
            GestureDetector(onTap: () => commonWidgets.onSpeak(ex['english']!), child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
            const SizedBox(height: 4),
            Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
            const SizedBox(height: 6),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)), child: Text(ex['note']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12, fontStyle: FontStyle.italic))),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('4 प्रकार के Pronouns', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter8Data.pronounTypes.map((t) {
        final colorMap = {'primary': AppColors.primary, 'accent': AppColors.accent, 'success': AppColors.success, 'warning': AppColors.warning};
        final color = colorMap[t['color']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t['emoji']!, style: const TextStyle(fontSize: 26)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t['type']!, style: AppTextStyles.labelLarge.copyWith(color: color)),
              Text(t['typeHi']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
              const SizedBox(height: 4),
              Text(t['desc']!, style: AppTextStyles.bodyMedium),
              const SizedBox(height: 4),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)), child: Text(t['words']!, style: AppTextStyles.labelSmall.copyWith(color: color))),
            ])),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('💡', style: TextStyle(fontSize: 20)), const SizedBox(width: 8),
          const Expanded(child: Text('इस चैप्टर की ऑडियो लेक्चर ज़रूर सुनिए ताकि सभी कॉन्सेन्ट व उदाहरण बेहतर तरीके से समझ पाएं।\n\nListen to the audio lecture for this chapter to understand all concepts and examples better.', style: AppTextStyles.bodyMedium)),
        ]),
      ),
    ]);
  }

  Widget buildSubjObjContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Subjective Pronoun — Subject की जगह प्रयोग होते हैं। Objective Pronoun — Object की जगह प्रयोग होते हैं।', 'Subjective = used as Subject. Objective = used as Object.'),
      const SizedBox(height: AppSpacing.lg),
      commonWidgets.phraseGroupHeader('👤', 'Subjective Pronouns', 'Subject की जगह', AppColors.primary),
      const SizedBox(height: AppSpacing.sm),
      _buildPronounRow('I', 'He', 'She', 'You', 'They', 'We', AppColors.primary),
      const SizedBox(height: AppSpacing.md),
      Text('उदाहरण (Examples)', style: AppTextStyles.labelLarge),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter8Data.subjectiveExamples.map((ex) => _buildPronounExample(ex['hi']!, ex['en']!, ex['pronoun']!, AppColors.primary)),
      const SizedBox(height: AppSpacing.lg),
      commonWidgets.phraseGroupHeader('📦', 'Objective Pronouns', 'Object की जगह', AppColors.accent),
      const SizedBox(height: AppSpacing.sm),
      _buildPronounRow('Me', 'Him', 'Her', 'You', 'Them', 'Us', AppColors.accent),
      const SizedBox(height: AppSpacing.md),
      Text('उदाहरण (Examples)', style: AppTextStyles.labelLarge),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter8Data.objectiveExamples.map((ex) => _buildPronounExample(ex['hi']!, ex['en']!, ex['pronoun']!, AppColors.accent)),
      const SizedBox(height: AppSpacing.lg),
      Text('Subjective ↔ Objective जोड़े', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(child: Text('Subjective', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('Objective', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('हिंदी', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
            ]),
          ),
          ...Chapter8Data.pronounTable.asMap().entries.map((e) {
            final i = e.key; final row = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < Chapter8Data.pronounTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row['subjective']!), child: Text(row['subjective']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 14), textAlign: TextAlign.center))),
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row['objective']!), child: Text(row['objective']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 14), textAlign: TextAlign.center))),
                Expanded(child: Text(row['subjectiveHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11), textAlign: TextAlign.center)),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget buildPossessiveContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Possessive Pronoun — किसी चीज़ का मालिकाना हक़ बताने के लिए प्रयोग होता है। दो रूप होते हैं: Noun के साथ और अकेला।', 'Possessive Pronouns show ownership. Two forms: with a noun and alone.'),
      const SizedBox(height: AppSpacing.lg),
      Text('दो रूप — Noun के साथ vs अकेला', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: AppColors.success, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(child: Text('Noun के साथ', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('हिंदी', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('अकेला', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('हिंदी', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
            ]),
          ),
          ...Chapter8Data.possessiveDifference.asMap().entries.map((e) {
            final i = e.key; final row = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < Chapter8Data.possessiveDifference.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row['withNoun']!), child: Text(row['withNoun']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 15), textAlign: TextAlign.center))),
                Expanded(child: Text(row['withNounHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11), textAlign: TextAlign.center)),
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row['alone']!), child: Text(row['alone']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 15), textAlign: TextAlign.center))),
                Expanded(child: Text(row['aloneHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11), textAlign: TextAlign.center)),
              ]),
            );
          }),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      commonWidgets.phraseGroupHeader('🔤', 'Noun के साथ — उदाहरण', 'My/Your/His/Her/Our/Their + Noun', AppColors.success),
      const SizedBox(height: AppSpacing.sm),
      Wrap(
        spacing: 8, runSpacing: 8,
        children: Chapter8Data.possessiveWithNounExamples.map((p) => GestureDetector(
          onTap: () => commonWidgets.onSpeak(p['phrase']!),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.success.withOpacity(0.3))),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Text(p['phrase']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13)),
                const SizedBox(width: 4),
                Icon(Icons.volume_up_rounded, color: AppColors.success.withOpacity(0.5), size: 12),
              ]),
              Text(p['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
            ]),
          ),
        )).toList(),
      ),
      const SizedBox(height: AppSpacing.lg),
      commonWidgets.phraseGroupHeader('📝', 'अकेला — उदाहरण', 'Mine/Yours/His/Hers/Ours/Theirs', AppColors.primary),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter8Data.possessiveAloneExamples.map((p) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
        child: Row(children: [
          Expanded(child: Text(p['hi']!, style: AppTextStyles.bodyMedium)),
          Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(p['phrase']!), child: Text(p['phrase']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 13)))),
          commonWidgets.ttsButton(p['phrase']!, color: AppColors.primary),
        ]),
      )),
      const SizedBox(height: AppSpacing.lg),
      Text('वाक्यों में उदाहरण', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter8Data.possessiveExamples.map((ex) => _buildPronounExample(ex['hi']!, ex['en']!, ex['pronoun']!, AppColors.success)),
    ]);
  }

  Widget buildReflexiveContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Reflexive Pronoun — तब प्रयोग होता है जब Subject खुद के बारे में बताता हो या खुद ही वो काम करे।', 'Reflexive Pronouns are used when the Subject performs an action on/for itself.'),
      const SizedBox(height: AppSpacing.lg),
      commonWidgets.phraseGroupHeader('🪞', 'Reflexive Pronouns', 'खुद के लिए', AppColors.warning),
      const SizedBox(height: AppSpacing.md),
      GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 2.4),
        itemCount: Chapter8Data.pronounTable.length,
        itemBuilder: (_, i) {
          final row = Chapter8Data.pronounTable[i];
          return GestureDetector(
            onTap: () => commonWidgets.onSpeak(row['reflexive']!),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.25))),
              child: Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(row['subjective']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary, fontSize: 11)),
                  Text(row['reflexive']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning, fontSize: 13)),
                  Text(row['reflexiveHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
                ])),
                Icon(Icons.volume_up_rounded, color: AppColors.warning.withOpacity(0.4), size: 14),
              ]),
            ),
          );
        },
      ),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 नियम — कब Reflexive Pronoun आता है?', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 8),
          const Text('जब वाक्य का Subject और Object एक ही हो — यानी Subject खुद ही काम करे या खुद को ही affect करे।\n\nWhen the Subject and Object refer to the same person — i.e., the subject acts upon itself.', style: AppTextStyles.bodyMedium),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter8Data.reflexiveExamples.map((ex) => _buildPronounExample(ex['hi']!, ex['en']!, ex['pronoun']!, AppColors.warning)),
    ]);
  }

  Widget buildMyMineContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('"My" और "Mine" दोनों का मतलब "मेरा" है — पर प्रयोग अलग-अलग होता है।', '"My" and "Mine" both mean "मेरा" but are used differently.'),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 नियम (Rule)', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.sm),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(padding: const EdgeInsets.all(AppSpacing.sm), decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.md)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('My (Noun के साथ)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13)),
              const Text('जब "मेरा" के साथ कोई Noun जुड़ा हो:\nMy + book, My + brother', style: AppTextStyles.bodyMedium),
            ]))),
            const SizedBox(width: 8),
            Expanded(child: Container(padding: const EdgeInsets.all(AppSpacing.sm), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.md)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Mine (अकेला)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 13)),
              const Text('जब "मेरा" अकेले आए — कोई Noun न जुड़ा हो।', style: AppTextStyles.bodyMedium),
            ]))),
          ]),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('My vs Mine — उदाहरण', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter8Data.myMineData.map((item) {
        final usesMine = item['usesMine'] as bool;
        final color = usesMine ? AppColors.primary : AppColors.success;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card, border: Border.all(color: color.withOpacity(0.2))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text('Uses: ${item['uses']}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
            const SizedBox(height: AppSpacing.sm),
            Text(item['hindi'] as String, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            GestureDetector(onTap: () => commonWidgets.onSpeak(item['english'] as String), child: Text(item['english'] as String, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
            const SizedBox(height: 6),
            Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)), child: Text(item['reason'] as String, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: color, fontSize: 12))),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚡ यही नियम Your/Yours पर भी लागू होता है', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const SizedBox(height: 8),
          _buildMyMineRow('यह तुम्हारी किताब है।', 'This is your book.', 'Your (noun के साथ)', AppColors.success),
          const SizedBox(height: 4),
          _buildMyMineRow('ये किताब तुम्हारी है।', 'This book is yours.', 'Yours (अकेला)', AppColors.primary),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('सम्पूर्ण तालिका — Quick Reference', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      _buildFullPronounTable(),
    ]);
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '👤', 'title': 'What is a Pronoun?', 'hi': 'Noun की जगह प्रयोग होने वाला शब्द'},
      {'emoji': '🔄', 'title': 'Subjective Pronouns', 'hi': 'I, He, She, You, They, We'},
      {'emoji': '📦', 'title': 'Objective Pronouns', 'hi': 'Me, Him, Her, You, Them, Us'},
      {'emoji': '🔑', 'title': 'Possessive — Noun के साथ', 'hi': 'My, His, Her, Your, Their, Our'},
      {'emoji': '💎', 'title': 'Possessive — अकेला', 'hi': 'Mine, His, Hers, Yours, Theirs, Ours'},
      {'emoji': '🪞', 'title': 'Reflexive Pronouns', 'hi': 'Myself, Himself, Herself, Ourselves...'},
      {'emoji': '💡', 'title': 'My vs Mine Rule', 'hi': 'Noun के साथ → My | अकेला → Mine'},
      {'emoji': '🔢', 'title': 'Subjective ↔ Objective Pairs', 'hi': 'I↔Me, He↔Him, She↔Her...'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 8 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 8 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12', 'प्रश्न'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60', 'XP'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('8', 'टॉपिक'),
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
          Text(t['emoji']!, style: const TextStyle(fontSize: 20)), const SizedBox(width: AppSpacing.md),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t['title']!, style: AppTextStyles.labelLarge),
            Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ])),
          const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
        ]),
      )),
    ]);
  }

  Widget _buildPronounRow(String w1, String w2, String w3, String w4, String w5, String w6, Color color) {
    return Wrap(spacing: 8, runSpacing: 8, children: [w1, w2, w3, w4, w5, w6].map((w) => GestureDetector(
      onTap: () => commonWidgets.onSpeak(w),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(w, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(width: 4),
          const Icon(Icons.volume_up_rounded, color: Colors.white70, size: 12),
        ]),
      ),
    )).toList());
  }

  Widget _buildPronounExample(String hi, String en, String pronoun, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(hi, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          GestureDetector(onTap: () => commonWidgets.onSpeak(en), child: Text(en, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
        ])),
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(pronoun, style: AppTextStyles.labelSmall.copyWith(color: color))),
        const SizedBox(width: 6),
        commonWidgets.ttsButton(en, color: color),
      ]),
    );
  }

  Widget _buildMyMineRow(String hi, String en, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(hi, style: AppTextStyles.bodyMedium),
          Text(en, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
        ])),
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(label, style: AppTextStyles.labelSmall.copyWith(color: color))),
        const SizedBox(width: 6),
        commonWidgets.ttsButton(en, color: color),
      ]),
    );
  }

  Widget _buildFullPronounTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          border: TableBorder.all(color: AppColors.lockedBg, borderRadius: BorderRadius.circular(AppRadius.lg)),
          children: [
            TableRow(
              decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              children: ['Subj.', 'Obj.', 'Poss.+N', 'Poss.Alone', 'Reflexive'].map((h) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(h, style: AppTextStyles.labelSmall.copyWith(color: Colors.white, fontSize: 11), textAlign: TextAlign.center),
              )).toList(),
            ),
            ...Chapter8Data.pronounTable.asMap().entries.map((e) {
              final i = e.key; final row = e.value;
              return TableRow(
                decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg),
                children: [
                  _buildTableCell(row['subjective']!, AppColors.primary),
                  _buildTableCell(row['objective']!, AppColors.accent),
                  _buildTableCell(row['possessiveAdj']!, AppColors.success),
                  _buildTableCell(row['possessivePron']!, AppColors.success),
                  _buildTableCell(row['reflexive']!, AppColors.warning),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, Color color) {
    return GestureDetector(
      onTap: () => commonWidgets.onSpeak(text.split('/')[0].trim()),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), child: Text(text, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12), textAlign: TextAlign.center)),
    );
  }
}