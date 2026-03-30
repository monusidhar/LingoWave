import 'package:flutter/material.dart';
import '../../data/chapter7_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter7Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter7Widgets({required this.commonWidgets, required this.accentColor});

  Widget buildNounProperContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'संज्ञा सिर्फ व्यक्ति/जगह/वस्तु का नाम नहीं — किसी भी प्राणी (जानवर भी) का नाम संज्ञा है। 5 प्रकार की संज्ञाएँ होती हैं।',
        'Noun is not just for persons, places or things — any creature`s name is also a noun. There are 5 types.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('5 Types of Nouns', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.sm),
          Wrap(spacing: 8, runSpacing: 6, children: Chapter7Data.nounTypes.map((t) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)),
            child: Text('${t['number']}. ${t['nameEn']} (${t['nameHi']})', style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
          )).toList()),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('इस पाठ में: Proper & Common Noun', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      _buildNounTypeCard(Chapter7Data.nounTypes[0]),
      _buildNounTypeCard(Chapter7Data.nounTypes[1]),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('💡 Proper vs Common — अंतर समझिए', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.md),
          commonWidgets.ruleRow('Nokia / Samsung (specific names)', '→ Proper Noun'),
          commonWidgets.ruleRow('Mobile (उनकी common जाति)', '→ Common Noun'),
          commonWidgets.ruleRow('Ram / Raju (specific names)', '→ Proper Noun'),
          commonWidgets.ruleRow('Boy (उनकी common जाति)', '→ Common Noun'),
          commonWidgets.ruleRow('Usha / Khaitan / Havells (specific)', '→ Proper Noun'),
          commonWidgets.ruleRow('Fan (उनकी common जाति)', '→ Common Noun'),
        ]),
      ),
    ]);
  }

  Widget buildNounCollectiveContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('समूहवाचक, पदार्थवाचक और भाववाचक संज्ञा सीखें।', 'Learn Collective, Material and Abstract Nouns.'),
      const SizedBox(height: AppSpacing.lg),
      _buildNounTypeCard(Chapter7Data.nounTypes[2]),
      const SizedBox(height: AppSpacing.md),
      Text('Collective Noun के उदाहरण', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 2.4),
        itemCount: Chapter7Data.collectiveExamples.length,
        itemBuilder: (_, i) {
          final e = Chapter7Data.collectiveExamples[i];
          return GestureDetector(
            onTap: () => commonWidgets.onSpeak(e['noun']!),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.accent.withOpacity(0.2))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(children: [
                  Text(e['noun']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 13)),
                  const SizedBox(width: 4),
                  Icon(Icons.volume_up_rounded, color: AppColors.accent.withOpacity(0.5), size: 12),
                ]),
                Text('(${e['hi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
                Text(e['group']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 9, color: AppColors.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis),
              ]),
            ),
          );
        },
      ),
      const SizedBox(height: AppSpacing.lg),
      _buildNounTypeCard(Chapter7Data.nounTypes[3]),
      const SizedBox(height: AppSpacing.md),
      _buildNounTypeCard(Chapter7Data.nounTypes[4]),
      const SizedBox(height: AppSpacing.md),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚠️ "Love" — Noun भी, Verb भी', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 8),
          GestureDetector(onTap: () => commonWidgets.onSpeak('Love is life.'), child: commonWidgets.ruleRow('Love is life.', '→ Abstract Noun (Subject)')),
          GestureDetector(onTap: () => commonWidgets.onSpeak('I love you.'), child: commonWidgets.ruleRow('I love you.', '→ Verb (क्रिया)')),
        ]),
      ),
    ]);
  }

  Widget buildNounGerundContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Gerund = Verb + ing जब Subject की तरह प्रयोग हो। Subject हमेशा Noun या Pronoun होता है।', 'Gerund = Verb + ing used as a noun/subject. Subject is always a Noun or Pronoun.'),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.primary.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 महत्वपूर्ण नियम', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text('किसी भी वाक्य में Subject या तो Noun होगा या Pronoun।', style: AppTextStyles.bodyMedium),
          Text('In a sentence, Subject is always a Noun or a Pronoun.', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 12)),
        ]),
      ),
      const SizedBox(height: AppSpacing.md),
      Text('उदाहरण — Subject पहचानिए', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter7Data.subjectExamples.map((e) {
        final color = e['type']!.contains('Pronoun') ? AppColors.success : e['type']!.contains('Gerund') ? AppColors.accent : AppColors.primary;
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
          child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(onTap: () => commonWidgets.onSpeak(e['sentence']!), child: Text(e['sentence']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 13))),
              Text(e['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
            ])),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(e['subject']!, style: AppTextStyles.labelSmall.copyWith(color: color))),
              const SizedBox(height: 2),
              Text(e['type']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textSecondary, fontSize: 10)),
            ]),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('Gerund के उदाहरण (Verb + ing = Noun)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter7Data.gerundExamples.map((e) => Container(
        margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.05), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.accent.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(e['verb']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.accent, fontSize: 11)),
          const SizedBox(height: 2),
          GestureDetector(onTap: () => commonWidgets.onSpeak(e['sentence']!), child: Text(e['sentence']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
          Text(e['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
        ]),
      )),
      const SizedBox(height: AppSpacing.lg),
      Text('Countable vs Uncountable Noun', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      Row(children: [
        Expanded(child: Container(padding: const EdgeInsets.all(AppSpacing.sm), decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md)), child: Column(children: [
          Text('✅ Countable', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13)),
          Text('जिन्हें गिना जा सकता है', style: AppTextStyles.bodyMedium.copyWith(fontSize: 10), textAlign: TextAlign.center),
        ]))),
        const SizedBox(width: 8),
        Expanded(child: Container(padding: const EdgeInsets.all(AppSpacing.sm), decoration: BoxDecoration(color: AppColors.error.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md)), child: Column(children: [
          Text('❌ Uncountable', style: AppTextStyles.labelLarge.copyWith(color: AppColors.error, fontSize: 13)),
          Text('जिन्हें गिना नहीं जा सकता', style: AppTextStyles.bodyMedium.copyWith(fontSize: 10), textAlign: TextAlign.center),
        ]))),
      ]),
      const SizedBox(height: AppSpacing.sm),
      ...Chapter7Data.countableExamples.map((e) {
        final isCountable = e['type'] == 'countable';
        final color = isCountable ? AppColors.success : AppColors.error;
        return Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: color.withOpacity(0.2))),
          child: Row(children: [
            Text(isCountable ? '✅' : '❌', style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(e['word']!), child: Text('${e['word']!} (${e['hi']!})', style: AppTextStyles.labelLarge.copyWith(fontSize: 13)))),
            Text(e['reason']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 11)),
          ]),
        );
      }),
    ]);
  }

  Widget buildNounGenderContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Noun के लिंग (Gender), वचन (Number) और कुछ हमेशा "s" के साथ आने वाले शब्द सीखें।', 'Learn Noun Gender, Singular/Plural Number, and special always-"s" nouns.'),
      const SizedBox(height: AppSpacing.lg),
      Text('लिंग (Gender)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter7Data.genderExamples.map((g) {
        final colorMap = {'Masculine': AppColors.primary, 'Feminine': AppColors.accent, 'Neuter': AppColors.success};
        final color = colorMap[g['gender']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.2))),
          child: Row(children: [
            Text(g['emoji']!, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${g['gender']} Gender', style: AppTextStyles.labelLarge.copyWith(color: color)),
              Text(g['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              const SizedBox(height: 4),
              Text(g['examples']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
            ])),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('वचन (Number)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Row(children: [
            Expanded(child: Text('Singular (एकवचन)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary), textAlign: TextAlign.center)),
            Expanded(child: Text('Plural (बहुवचन)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success), textAlign: TextAlign.center)),
          ]),
          const Divider(),
          ...Chapter7Data.irregularPlurals.map((p) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(children: [
              Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(p['singular']!), child: Text(p['singular']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 13), textAlign: TextAlign.center))),
              const Icon(Icons.arrow_forward_rounded, color: AppColors.textHint, size: 16),
              Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(p['plural']!), child: Text(p['plural']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13), textAlign: TextAlign.center))),
            ]),
          )),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('हमेशा "s" के साथ — पर Plural नहीं!', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.sm),
      Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.25))), child: Text('इन शब्दों में हमेशा "s" रहता है लेकिन ये बहुवचन (Plural) नहीं होते।', style: AppTextStyles.bodyMedium)),
      const SizedBox(height: AppSpacing.md),
      ...Chapter7Data.alwaysSNouns.map((n) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
        child: Row(children: [
          Expanded(flex: 2, child: GestureDetector(onTap: () => commonWidgets.onSpeak(n['noun']!), child: Text(n['noun']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 13)))),
          Expanded(flex: 2, child: Text(n['pronunciation']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary, fontSize: 12))),
          Expanded(flex: 2, child: Text(n['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
          commonWidgets.ttsButton(n['noun']!),
        ]),
      )),
    ]);
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🏷️', 'title': 'Proper Noun', 'hi': 'व्यक्तिवाचक संज्ञा — specific name'},
      {'emoji': '👥', 'title': 'Common Noun', 'hi': 'जातिवाचक संज्ञा — class/type'},
      {'emoji': '🫂', 'title': 'Collective Noun', 'hi': 'समूहवाचक — group'},
      {'emoji': '⚗️', 'title': 'Material Noun', 'hi': 'पदार्थवाचक — Gold, Wood...'},
      {'emoji': '💭', 'title': 'Abstract Noun', 'hi': 'भाववाचक — Love, Honesty...'},
      {'emoji': '🔄', 'title': 'Gerund', 'hi': 'क्रियावाचक — Reading, Running...'},
      {'emoji': '📌', 'title': 'Subject Rule', 'hi': 'Subject = Noun या Pronoun'},
      {'emoji': '🔢', 'title': 'Countable vs Uncountable', 'hi': 'Pen ✓ vs Money ✗'},
      {'emoji': '⚖️', 'title': 'Gender', 'hi': 'Masculine / Feminine / Neuter'},
      {'emoji': '📊', 'title': 'Number + Always-s', 'hi': 'Singular/Plural + Scissors...'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 7 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 7 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12', 'प्रश्न'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60', 'XP'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('10', 'टॉपिक'),
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

  Widget _buildNounTypeCard(Map<String, dynamic> t) {
    final colorMap = {'primary': AppColors.primary, 'success': AppColors.success, 'accent': AppColors.accent, 'warning': AppColors.warning};
    final color = colorMap[t['color'] as String] ?? accentColor;
    final examples = (t['examples'] as List<dynamic>).cast<String>();
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.2)), boxShadow: AppShadows.card),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
          child: Row(children: [
            Container(width: 34, height: 34, decoration: BoxDecoration(color: color, shape: BoxShape.circle), child: Center(child: Text(t['number'] as String, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15)))),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(t['nameEn'] as String, style: AppTextStyles.headingMedium.copyWith(color: color)),
              Text(t['nameHi'] as String, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
            ])),
            Text(t['emoji'] as String, style: const TextStyle(fontSize: 24)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t['defHi'] as String, style: AppTextStyles.bodyMedium),
            const SizedBox(height: 2),
            Text(t['defEn'] as String, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 11, color: AppColors.textSecondary)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Wrap(spacing: 8, runSpacing: 6, children: examples.map((ex) => GestureDetector(
            onTap: () => commonWidgets.onSpeak(ex.split(' ')[0]),
            child: Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: color.withOpacity(0.25))), child: Text(ex, style: AppTextStyles.labelSmall.copyWith(color: color))),
          )).toList()),
        ),
      ]),
    );
  }
}