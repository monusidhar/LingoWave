import 'package:flutter/material.dart';
import '../../data/chapter10_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter10Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter10Widgets({required this.commonWidgets, required this.accentColor});

  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('क्रिया वो है जिसके माध्यम से Subject के कार्य या अवस्था (स्थिति) की जानकारी मिलती है।', 'Verb is the one which describes the action or the state of the subject.'),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('💭', style: TextStyle(fontSize: 22)), const SizedBox(width: 8), Text('सोचिए...', style: AppTextStyles.labelLarge.copyWith(color: accentColor))]),
          const SizedBox(height: 8),
          const Text('आप बिस्तर पर लेटे किसी को "miss" कर रहे हैं। हाथ-पैर स्थिर हैं, लेकिन दिमाग तो काम कर रहा है — इसलिए "miss" यानि "याद करना" भी एक क्रिया (verb) है!', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          Text('Action = Physical work OR Mental work — दोनों Verb हैं।', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: accentColor)),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('Verb के उदाहरण', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter10Data.verbExamples.map((ex) {
        final isAction = ex['type'] == 'action';
        final color = isAction ? AppColors.primary : AppColors.accent;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card, border: Border.all(color: color.withOpacity(0.2))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(ex['en']!), child: Text(ex['en']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
                  Text(ex['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ])),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(isAction ? 'Action' : 'State', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
                const SizedBox(width: 6),
                commonWidgets.ttsButton(ex['en']!, color: color),
              ]),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10), child: Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text('Verb: ${ex['verb']!}', style: AppTextStyles.labelSmall.copyWith(color: color))),
              const SizedBox(width: 10),
              Flexible(child: Text(ex['note']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
            ])),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('दो प्रकार की Verbs', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.primary.withOpacity(0.3)), boxShadow: AppShadows.card),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('⚡', style: TextStyle(fontSize: 22)), const SizedBox(width: 8), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Main Verb (मुख्य क्रिया)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
            Text('Subject के कार्य की जानकारी देती है।', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ])]),
          const SizedBox(height: 8),
          const Text('नाचना, गाना, सोचना, पढ़ना, लिखना, याद करना...', style: AppTextStyles.bodyMedium),
          const Text('To dance, to sing, to think, to read, to write, to miss...', style: AppTextStyles.bodyMedium),
        ]),
      ),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.success.withOpacity(0.3)), boxShadow: AppShadows.card),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('🤝', style: TextStyle(fontSize: 22)), const SizedBox(width: 8), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Helping Verb (सहायक क्रिया)', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
            Text('Subject की अवस्था के बारे में बताती है।', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ])]),
          const SizedBox(height: AppSpacing.sm),
          Wrap(spacing: 6, runSpacing: 6, children: Chapter10Data.helpingVerbs.map((hv) => GestureDetector(
            onTap: () => commonWidgets.onSpeak(hv['verb']!),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(color: AppColors.success.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.success.withOpacity(0.3))),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(hv['verb']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13)),
                const SizedBox(width: 4),
                Text('(${hv['hindi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
              ]),
            ),
          )).toList()),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('📌', style: TextStyle(fontSize: 18)), const SizedBox(width: 8),
          const Expanded(child: Text('Main Verbs की तीन Forms (1st, 2nd, 3rd) होती हैं जो आगे के पाठों में सीखेंगे।\nHelping Verbs वाक्य में tense और state बताती हैं।', style: AppTextStyles.bodyMedium)),
        ]),
      ),
    ]);
  }

  Widget buildForms1Content() => _buildVerbFormsTable(title: '3 Forms — भाग 1', subtitle: 'Go → Bring (42 verbs)', verbs: Chapter10Data.verbForms1);
  Widget buildForms2Content() => _buildVerbFormsTable(title: '3 Forms — भाग 2', subtitle: 'Comb → Marry (42 verbs)', verbs: Chapter10Data.verbForms2);
  Widget buildForms3Content() => _buildVerbFormsTable(title: '3 Forms — भाग 3', subtitle: 'Peep → Bear (17 verbs)', verbs: Chapter10Data.verbForms3);

  Widget buildSpecialContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('"Lay" और "Lie" — ये दोनों बहुत confusing हैं। इनके अर्थ और forms अलग-अलग हैं।', '"Lay" and "Lie" are confusing verbs — they have different meanings and different forms.'),
      const SizedBox(height: AppSpacing.lg),
      Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('⚠️', style: TextStyle(fontSize: 20)), const SizedBox(width: 8), const Expanded(child: Text('बहुत ज़रूरी: "Lie" के दो अलग-अलग अर्थ हैं और दोनों की forms अलग हैं!\nVery Important: "Lie" has TWO different meanings with different forms!', style: AppTextStyles.bodyMedium))])),
      const SizedBox(height: AppSpacing.lg),
      Text('Special Verbs — 3 Forms', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter10Data.specialVerbs.asMap().entries.map((e) {
        final v = e.value;
        final colors = [AppColors.primary, AppColors.error, AppColors.accent];
        final color = colors[e.key];
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3)), boxShadow: AppShadows.card),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                GestureDetector(onTap: () => commonWidgets.onSpeak(v['v1']!), child: Text(v['v1']!, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 22))),
                const SizedBox(width: 10),
                Text('(${v['hindi']!})', style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                const Spacer(),
                Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(v['note']!, style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10))),
                const SizedBox(width: 6),
                commonWidgets.ttsButton(v['v1']!, color: color),
              ]),
            ),
            Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _specialVerbRow('1st', v['v1']!, AppColors.textSecondary),
                const SizedBox(height: 6),
                _specialVerbRow('2nd', v['v2']!, AppColors.accent),
                const SizedBox(height: 6),
                _specialVerbRow('3rd', v['v3']!, AppColors.success),
              ])),
            ])),
          ]),
        );
      }),
      const SizedBox(height: AppSpacing.lg),
      Text('Memory Trick', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor.withOpacity(0.1), accentColor.withOpacity(0.05)]), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('🧠 आसान तरीका याद करने का', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: 10),
          _ch10MemRow('Lay (रखना)', 'Laid', 'Laid', AppColors.primary),
          const Divider(),
          _ch10MemRow('Lie (झूठ बोलना)', 'Lied', 'Lied', AppColors.error),
          const Divider(),
          _ch10MemRow('Lie (लेटना)', 'Lay ← 2nd form!', 'Lain', AppColors.accent),
          const SizedBox(height: 10),
          Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.sm)), child: const Text('💡 "Lie (लेटना)" की 2nd form "Lay" है — यानी जब "Lay" अकेला मिले तो यह "Lie (लेटना)" की 2nd form भी हो सकता है।', style: AppTextStyles.bodyMedium)),
        ]),
      ),
    ]);
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '⚡', 'title': 'What is a Verb?', 'hi': 'Subject का कार्य या अवस्था बताता है'},
      {'emoji': '🤝', 'title': 'Helping Verbs', 'hi': 'is, am, are, was, were, has, have, had...'},
      {'emoji': '📋', 'title': '3 Forms — Part 1', 'hi': 'Go/Went/Gone, Write/Wrote/Written...'},
      {'emoji': '📋', 'title': '3 Forms — Part 2', 'hi': 'Take/Took/Taken, Sing/Sang/Sung...'},
      {'emoji': '📋', 'title': '3 Forms — Part 3', 'hi': 'Throw/Threw/Thrown, Fly/Flew/Flown...'},
      {'emoji': '🔀', 'title': 'Special: Lay / Lie', 'hi': 'Lay=Laid/Laid, Lie(लेटना)=Lay/Lain'},
      {'emoji': '🔁', 'title': 'Same 3 Forms', 'hi': 'Cut/Cut/Cut, Put/Put/Put, Hurt/Hurt/Hurt'},
      {'emoji': '📖', 'title': 'Read (special)', 'hi': 'Read/Read(रैड)/Read(रैड)'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 10 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 10 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
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

  Widget _buildVerbFormsTable({required String title, required String subtitle, required List<Map<String, String>> verbs}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Main Verbs की तीन forms होती हैं — 1st form (base), 2nd form (past), 3rd form (past participle)।', 'Main Verbs have three forms: 1st (base), 2nd (simple past), 3rd (past participle).'),
      const SizedBox(height: AppSpacing.md),
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.2))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _verbFormBadge('1st Form', 'Base form', AppColors.primary),
          const Text('→', style: TextStyle(fontSize: 20, color: AppColors.textHint)),
          _verbFormBadge('2nd Form', 'Simple Past', AppColors.accent),
          const Text('→', style: TextStyle(fontSize: 20, color: AppColors.textHint)),
          _verbFormBadge('3rd Form', 'Past Participle', AppColors.success),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: AppTextStyles.headingMedium),
        Text('टैप करके सुनें 🔊', style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
      ]),
      const SizedBox(height: 4),
      Text(subtitle, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
      const SizedBox(height: AppSpacing.md),
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              const SizedBox(width: 4),
              Expanded(flex: 3, child: Text('1st Form', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('2nd Form', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('3rd Form', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...verbs.asMap().entries.map((e) {
            final i = e.key; final v = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 10),
              decoration: BoxDecoration(color: i.isEven ? AppColors.surface : AppColors.bg, border: i < verbs.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null),
              child: Row(children: [
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(v['v1']!.split(' ')[0]), child: Text(v['v1']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13, color: AppColors.textPrimary))),
                  Text(v['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                ])),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(v['v2']!.split(' ')[0]), child: Text(v['v2']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 12)))),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(v['v3']!.split(' ')[0]), child: Text(v['v3']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 12)))),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget _verbFormBadge(String label, String sub, Color color) {
    return Column(children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(label, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
      const SizedBox(height: 2),
      Text(sub, style: AppTextStyles.bodyMedium.copyWith(fontSize: 9, color: color)),
    ]);
  }

  Widget _specialVerbRow(String form, String verb, Color color) {
    return Row(children: [
      Container(width: 32, padding: const EdgeInsets.symmetric(vertical: 2), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)), child: Text(form, style: AppTextStyles.labelSmall.copyWith(color: color), textAlign: TextAlign.center)),
      const SizedBox(width: 10),
      GestureDetector(onTap: () => commonWidgets.onSpeak(verb.split(' ')[0]), child: Text(verb, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
      const SizedBox(width: 6),
      commonWidgets.ttsButton(verb.split(' ')[0], color: color),
    ]);
  }

  Widget _ch10MemRow(String v1, String v2, String v3, Color color) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(children: [
      Expanded(flex: 3, child: Text(v1, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12))),
      Expanded(flex: 2, child: Text(v2, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
      Expanded(flex: 2, child: Text(v3, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
    ]));
  }
}