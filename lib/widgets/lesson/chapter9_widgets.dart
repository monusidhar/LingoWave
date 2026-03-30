import 'package:flutter/material.dart';
import '../../data/chapter9_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter9Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter9Widgets({required this.commonWidgets, required this.accentColor});

  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('विशेषण वो शब्द या शब्दों का समूह होते हैं जो किसी संज्ञा या सर्वनाम की विशेषता बताते हैं।', 'Adjectives are words that show the quality of a noun/pronoun or provide additional information about them.'),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('🎨', style: TextStyle(fontSize: 22)), const SizedBox(width: 8), Text('परिभाषा (Definition)', style: AppTextStyles.labelLarge.copyWith(color: accentColor))]),
          const SizedBox(height: AppSpacing.sm),
          Text('Adjective (विशेषण) — Noun या Pronoun की विशेषता बताने वाले शब्द या शब्द-समूह।', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          Text('Adjectives describe a noun or pronoun.', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: accentColor)),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter9Data.introExamples.map((ex) => Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card, border: Border.all(color: accentColor.withOpacity(0.15))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Container(width: 28, height: 28, decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle), child: Center(child: Text(ex['no']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)))),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(onTap: () => commonWidgets.onSpeak(ex['english']!), child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 14))),
                Text(ex['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              ])),
              commonWidgets.ttsButton(ex['english']!),
            ]),
          ),
          Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.accentGold, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text('Adj: ${ex['adjective']!}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
              const SizedBox(width: 8),
              Flexible(child: Text('→ ${ex['describes']!}', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textSecondary))),
            ]),
            const SizedBox(height: 6),
            Text(ex['note']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, fontStyle: FontStyle.italic)),
          ])),
        ]),
      )),
      const SizedBox(height: AppSpacing.lg),
      Text('वाक्यों में Adjectives', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter9Data.sentenceExamples.map((ex) => Container(
        margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            GestureDetector(onTap: () => commonWidgets.onSpeak(ex['en']!), child: Text(ex['en']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13, color: accentColor))),
            Text(ex['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.15), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(ex['adj']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.accentGold))),
          const SizedBox(width: 6), commonWidgets.ttsButton(ex['en']!),
        ]),
      )),
    ]);
  }

  Widget buildDegreesContent() {
    final colorMap = {'primary': AppColors.primary, 'accent': AppColors.accent, 'success': AppColors.success};
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('प्रायः विशेषणों की तीन degrees होती हैं — Positive, Comparative और Superlative।', 'Generally, adjectives have three degrees of comparison.'),
      const SizedBox(height: AppSpacing.lg),
      ...Chapter9Data.degreesExplanation.map((d) {
        final color = colorMap[d['color']] ?? accentColor;
        return Container(margin: const EdgeInsets.only(bottom: AppSpacing.md), decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3)), boxShadow: AppShadows.card),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [Text(d['emoji']!, style: const TextStyle(fontSize: 26)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(d['degree']!, style: AppTextStyles.headingMedium.copyWith(color: color)), Text(d['degreeHi']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12))]))])),
            Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(d['desc']!, style: AppTextStyles.bodyMedium),
              const SizedBox(height: AppSpacing.sm),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md)),
                child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [GestureDetector(onTap: () => commonWidgets.onSpeak(d['example']!), child: Text(d['example']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))), Text(d['exampleHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))])), commonWidgets.ttsButton(d['example']!, color: color)])),
            ])),
          ]));
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('एक उदाहरण से तीनों Degrees', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(child: Text('Word', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('Positive', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('Comparative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
              Expanded(child: Text('Superlative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white), textAlign: TextAlign.center)),
            ]),
          ),
          ...[['Tall','Tall','Taller','Tallest'],['Strong','Strong','Stronger','Strongest'],['Beautiful','Beautiful','More Beautiful','Most Beautiful'],['Good','Good','Better','Best']].asMap().entries.map((e) {
            final i = e.key; final row = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < 3 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(child: Text(row[0], style: AppTextStyles.labelSmall.copyWith(color: accentColor), textAlign: TextAlign.center)),
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row[1]), child: Text(row[1], style: AppTextStyles.bodyMedium.copyWith(fontSize: 12), textAlign: TextAlign.center))),
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row[2]), child: Text(row[2], style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 12), textAlign: TextAlign.center))),
                Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(row[3]), child: Text(row[3], style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 12), textAlign: TextAlign.center))),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget buildErEstContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('छोटे adjectives में Comparative के लिए "-er" और Superlative के लिए "-est" जोड़ते हैं।', 'For short adjectives, add "-er" for Comparative and "-est" for Superlative.'),
      const SizedBox(height: AppSpacing.md),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 नियम (Rules)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
          const SizedBox(height: 8),
          _ch9Rule('1', 'सामान्यतः + er / est', 'Tall → Taller → Tallest'),
          _ch9Rule('2', 'अंत में -e हो तो r / st', 'Wide → Wider → Widest'),
          _ch9Rule('3', '-y → -i + er / est', 'Heavy → Heavier → Heaviest'),
          _ch9Rule('4', 'Short word — double last consonant', 'Big → Bigger, Hot → Hotter'),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('सभी 41 Adjectives', style: AppTextStyles.headingMedium),
        Text('टैप करके सुनें 🔊', style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
      ]),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(flex: 3, child: Text('Positive', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('Comparative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('Superlative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...Chapter9Data.erEstAdjectives.asMap().entries.map((e) {
            final i = e.key; final adj = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < Chapter9Data.erEstAdjectives.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(adj['positive']!), child: Text(adj['positive']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
                  Text(adj['positiveHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                ])),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(adj['comparative']!), child: Text(adj['comparative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 13)))),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(adj['superlative']!), child: Text(adj['superlative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13)))),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget buildMoreMostContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('लम्बे adjectives में Comparative के लिए "More" और Superlative के लिए "Most" लगाते हैं।', 'For long adjectives (3+ syllables), use "More" for Comparative and "Most" for Superlative.'),
      const SizedBox(height: AppSpacing.md),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.2))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('💡', style: TextStyle(fontSize: 20)), const SizedBox(width: 8),
          const Expanded(child: Text('Rule: More Beautiful (✅) — Beautifuler (❌)\nजिन adjectives में -er/-est नहीं लग सकता, उनके आगे More/Most लगाते हैं。', style: AppTextStyles.bodyMedium)),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('सभी 20 More/Most Adjectives', style: AppTextStyles.headingMedium),
        Text('टैप करके सुनें 🔊', style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
      ]),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(flex: 3, child: Text('Positive', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 4, child: Text('Comparative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 4, child: Text('Superlative', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...Chapter9Data.moreAdjectives.asMap().entries.map((e) {
            final i = e.key; final adj = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < Chapter9Data.moreAdjectives.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(adj['positive']!), child: Text(adj['positive']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
                  Text(adj['positiveHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                ])),
                Expanded(flex: 4, child: GestureDetector(onTap: () => commonWidgets.onSpeak(adj['comparative']!), child: Text(adj['comparative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 12)))),
                Expanded(flex: 4, child: GestureDetector(onTap: () => commonWidgets.onSpeak(adj['superlative']!), child: Text(adj['superlative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 12)))),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget buildIrregularContent() {
    final colors = [AppColors.primary, AppColors.accent, AppColors.success, const Color(0xFF7C3AED)];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('कुछ adjectives की Comparative और Superlative degrees अनियमित (Irregular) होती हैं — पूरा शब्द बदल जाता है।', 'Some adjectives have irregular forms — the whole word changes.'),
      const SizedBox(height: AppSpacing.md),
      Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('⚠️', style: TextStyle(fontSize: 20)), const SizedBox(width: 8), const Expanded(child: Text('इन्हें याद करना ज़रूरी है — ये रोज़मर्रा की बातचीत में बहुत इस्तेमाल होते हैं।', style: AppTextStyles.bodyMedium))])),
      const SizedBox(height: AppSpacing.lg),
      ...Chapter9Data.irregularAdjectives.asMap().entries.map((e) {
        final color = colors[e.key % colors.length]; final adj = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
          child: Column(children: [
            Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: const Text('Positive', style: TextStyle(fontFamily:'Nunito',color:Colors.white,fontWeight:FontWeight.w700,fontSize:11))),
                const SizedBox(width: 10),
                GestureDetector(onTap: () => commonWidgets.onSpeak(adj['positive']!), child: Text(adj['positive']!, style: AppTextStyles.headingMedium.copyWith(color: color))),
                const SizedBox(width: 8),
                Text('(${adj['positiveHi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                const Spacer(),
                commonWidgets.ttsButton(adj['positive']!, color: color),
              ])),
            Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10), child: Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.accent.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.accent.withOpacity(0.3))), child: Text('Comparative', style: AppTextStyles.labelSmall.copyWith(color: AppColors.accent))),
              const SizedBox(width: 10),
              GestureDetector(onTap: () => commonWidgets.onSpeak(adj['comparative']!), child: Text(adj['comparative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 16))),
              const SizedBox(width: 8),
              Text('(${adj['comparativeHi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
              const Spacer(),
              commonWidgets.ttsButton(adj['comparative']!, color: AppColors.accent),
            ])),
            const Divider(height: 1, indent: 16, endIndent: 16),
            Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10), child: Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: AppColors.success.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.success.withOpacity(0.3))), child: Text('Superlative', style: AppTextStyles.labelSmall.copyWith(color: AppColors.success))),
              const SizedBox(width: 10),
              GestureDetector(onTap: () => commonWidgets.onSpeak(adj['superlative']!), child: Text(adj['superlative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 16))),
              const SizedBox(width: 8),
              Text('(${adj['superlativeHi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
              const Spacer(),
              commonWidgets.ttsButton(adj['superlative']!, color: AppColors.success),
            ])),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor.withOpacity(0.1), accentColor.withOpacity(0.05)]), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: accentColor.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('🧠 याद करने का तरीका', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: 8),
          Row(children: [_ch9IrregBox('Good', 'Better', 'Best', AppColors.primary), const SizedBox(width: 8), _ch9IrregBox('Bad', 'Worse', 'Worst', AppColors.error)]),
          const SizedBox(height: 8),
          Row(children: [_ch9IrregBox('Much/Many', 'More', 'Most', AppColors.success), const SizedBox(width: 8), _ch9IrregBox('Little', 'Less', 'Least', AppColors.accent)]),
        ]),
      ),
    ]);
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji':'🎨','title':'What is an Adjective?','hi':'Noun/Pronoun की विशेषता बताने वाला शब्द'},
      {'emoji':'🔍','title':'Adjective Clause','hi':'"who plays with you" — clause as adjective'},
      {'emoji':'📊','title':'3 Degrees','hi':'Positive, Comparative, Superlative'},
      {'emoji':'🔼','title':'-er / -est Pattern','hi':'Tall → Taller → Tallest (41 words)'},
      {'emoji':'⭐','title':'More / Most Pattern','hi':'Beautiful → More Beautiful → Most Beautiful'},
      {'emoji':'🔀','title':'Irregular Adjectives','hi':'Good→Better→Best, Bad→Worse→Worst'},
      {'emoji':'📝','title':'-y → -ier / -iest Rule','hi':'Heavy → Heavier → Heaviest'},
      {'emoji':'✨','title':'Double Consonant Rule','hi':'Big → Bigger, Hot → Hotter'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 9 — फ़ाइनल क्विज़', style: TextStyle(fontFamily:'Nunito',color:Colors.white70,fontSize:14)), const SizedBox(height: 4),
          const Text('Chapter 9 — Final Quiz', style: TextStyle(fontFamily:'Nunito',color:Colors.white,fontSize:22,fontWeight:FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12','प्रश्न'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60','XP'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('8','टॉपिक'),
          ]),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium), const SizedBox(height: AppSpacing.md),
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

  Widget _ch9Rule(String no, String rule, String example) {
    return Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 20, height: 20, decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: Center(child: Text(no, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)))),
      const SizedBox(width: 8),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(rule, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
        Text(example, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 11, color: AppColors.primary)),
      ])),
    ]));
  }

  Widget _ch9IrregBox(String pos, String comp, String sup, Color color) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: color.withOpacity(0.25))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        GestureDetector(onTap: () => commonWidgets.onSpeak(pos), child: Text(pos, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600), textAlign: TextAlign.center)),
        const Icon(Icons.arrow_downward_rounded, size: 14, color: AppColors.textHint),
        GestureDetector(onTap: () => commonWidgets.onSpeak(comp), child: Text(comp, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13), textAlign: TextAlign.center)),
        const Icon(Icons.arrow_downward_rounded, size: 14, color: AppColors.textHint),
        GestureDetector(onTap: () => commonWidgets.onSpeak(sup), child: Text(sup, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13), textAlign: TextAlign.center)),
      ]),
    ));
  }
}