import 'package:flutter/material.dart';
import '../../data/chapter14_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter14Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter14Widgets({required this.commonWidgets, required this.accentColor});

  // ── L1: What is a Preposition? ─────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'Preposition वो शब्द है जो किसी Noun/Pronoun और वाक्य के दूसरे भाग के बीच का सम्बन्ध दर्शाता है। आमतौर पर यह Noun/Pronoun से पहले रखा जाता है।',
        'Preposition is placed before a Noun/Pronoun to show its relation with the rest of the sentence.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Definition card
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 Key Terms', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.sm),
          _keyTermRow('Preposition', 'सम्बन्ध सूचक अव्यय — Noun/Pronoun से पहले रखा जाता है।', AppColors.primary),
          const SizedBox(height: 6),
          _keyTermRow('Object', 'जिस Noun/Pronoun के साथ Preposition का प्रयोग हो — वह उसका Object कहलाता है।', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('उदाहरण से समझिए', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      _exampleCard(
        'I am coming from Delhi.',
        'मैं दिल्ली से आ रहा हूँ।',
        'from', 'Preposition',
        'Delhi', 'Object',
        AppColors.primary,
      ),
      const SizedBox(height: AppSpacing.md),
      _exampleCard(
        'Ram depends on you.',
        'राम तुम पर निर्भर है।',
        'on', 'Preposition',
        'you', 'Object',
        AppColors.accent,
      ),
      const SizedBox(height: AppSpacing.lg),

      // All prepositions overview
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📚 इस Chapter में शामिल Prepositions', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
          const SizedBox(height: AppSpacing.sm),
          Wrap(spacing: 6, runSpacing: 6, children: [
            'From','Off','Since','For','In','Into','Before','After','By','With',
            'At','Through','Beyond','Via','Opposite','Above','Under','Beneath',
            'Below','Down','Between','Among','Amongst','Out of','On','Upon/Onto',
            'Against','About','Of','To','Towards','Over','Within','Than',
            'Throughout','Without','Up','Upwards','Downwards','Ago','Inside',
            'Outside','Next to','Behind','Ahead of','Except','Besides','During',
            'Till/Until','Up to','Around','Along','Alongside','Across',
          ].map((p) => GestureDetector(
            onTap: () => commonWidgets.onSpeak(p.split('/')[0]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: accentColor.withOpacity(0.3))),
              child: Text(p, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
            ),
          )).toList()),
        ]),
      ),
    ]);
  }

  Widget _keyTermRow(String term, String desc, Color color) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(term, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12))),
      const SizedBox(width: 8),
      Expanded(child: Text(desc, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
    ]);
  }

  Widget _exampleCard(String en, String hi, String prep, String prepLabel, String obj, String objLabel, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: GestureDetector(onTap: () => commonWidgets.onSpeak(en), child: Text(en, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14)))),
          commonWidgets.ttsButton(en, color: color),
        ]),
        const SizedBox(height: 4),
        Text(hi, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        const SizedBox(height: AppSpacing.sm),
        Row(children: [
          _labelBadge('$prepLabel: $prep', color),
          const SizedBox(width: 8),
          _labelBadge('$objLabel: $obj', AppColors.success),
        ]),
      ]),
    );
  }

  Widget _labelBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: color.withOpacity(0.3))),
      child: Text(text, style: AppTextStyles.labelSmall.copyWith(color: color)),
    );
  }

  // ── Shared builder for preposition tables ─────────────────────────────────
  Widget _buildPrepositionsTable(List<Map<String, dynamic>> prepositions) {
    final colors = [
      AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning,
      const Color(0xFF7C3AED), AppColors.error, AppColors.primary, AppColors.accent,
      AppColors.success, AppColors.warning, const Color(0xFF7C3AED), AppColors.error,
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...prepositions.asMap().entries.map((entry) {
        final color = colors[entry.key % colors.length];
        final p = entry.value;
        final usages = (p['usages'] as List).cast<Map<String, dynamic>>();

        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.lg),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                GestureDetector(
                  onTap: () => commonWidgets.onSpeak(p['prep'] as String),
                  child: Text(p['prep'] as String, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 22)),
                ),
                const SizedBox(width: 10),
                Text('(${p['hindi'] as String})', style: AppTextStyles.labelLarge.copyWith(fontSize: 14)),
                const Spacer(),
                commonWidgets.ttsButton(p['prep'] as String, color: color),
              ]),
            ),

            // Usages
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: usages.asMap().entries.map((u) {
                final usage = u.value;
                final exList = (usage['examples'] as List).cast<Map<String, String>>();
                final note = usage['note'] as String?;

                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (u.key > 0) const Divider(height: 20),
                  // Rule
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(usage['rule'] as String, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
                      Text(usage['ruleHi'] as String, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, color: AppColors.textSecondary)),
                    ]),
                  ),
                  if (note != null) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                      child: Row(children: [
                        const Text('💡', style: TextStyle(fontSize: 12)), const SizedBox(width: 4),
                        Flexible(child: Text(note, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, color: AppColors.warning))),
                      ]),
                    ),
                  ],
                  const SizedBox(height: 8),
                  // Examples
                  ...exList.map((ex) => Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(color: color.withOpacity(0.04), borderRadius: BorderRadius.circular(AppRadius.sm)),
                    child: Row(children: [
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        GestureDetector(
                          onTap: () => commonWidgets.onSpeak(ex['en']!),
                          child: Text(ex['en']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
                        ),
                        Text(ex['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                      ])),
                      commonWidgets.ttsButton(ex['en']!, color: color),
                    ]),
                  )),
                ]);
              }).toList()),
            ),
          ]),
        );
      }),
    ]);
  }

  // ── L2 ─────────────────────────────────────────────────────────────────────
  Widget buildPart1Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('From, Off, Since, For — इन चारों के प्रयोग सीखिए।', 'Learn the usages of From, Off, Since and For.'),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart1),
    ]);
  }

  // ── L3 ─────────────────────────────────────────────────────────────────────
  Widget buildPart2Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('In, Into, Before, After — इन चारों के प्रयोग सीखिए।', 'Learn the usages of In, Into, Before and After.'),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart2),
    ]);
  }

  // ── L4 ─────────────────────────────────────────────────────────────────────
  Widget buildPart3Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('By, With, At — इन तीनों के अलग-अलग प्रयोग सीखिए।', 'Learn the multiple usages of By, With and At.'),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart3),
    ]);
  }

  // ── L5 ─────────────────────────────────────────────────────────────────────
  Widget buildPart4Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Through, Beyond, Via, Opposite, Above — इन पाँचों के प्रयोग सीखिए।', 'Learn the usages of Through, Beyond, Via, Opposite and Above.'),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart4),
    ]);
  }

  // ── L6 ─────────────────────────────────────────────────────────────────────
  Widget buildPart5Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Under, Beneath, Below, Down, On, Upon/Onto, Between, Among, Amongst, Out of', 'Learn these 10 prepositions of position and place.'),
      const SizedBox(height: AppSpacing.lg),
      // Under vs Beneath comparison box
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚠️ Under vs Beneath — ध्यान से सीखें', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 8),
          _comparisonRow('Under', 'बिना पूरी तरह छुए — पेड़ के नीचे बैठना', AppColors.primary),
          const SizedBox(height: 4),
          _comparisonRow('Beneath/Underneath', 'पूरी तरह छूते हुए — तकिये के नीचे पत्र', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.md),
      // Between vs Among vs Amongst
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('💡 Between / Among / Amongst', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const SizedBox(height: 8),
          _comparisonRow('Between', 'सिर्फ दो के बीच', AppColors.primary),
          const SizedBox(height: 4),
          _comparisonRow('Among', 'दो से अधिक — संख्या बताई गई हो (50 people)', AppColors.accent),
          const SizedBox(height: 4),
          _comparisonRow('Amongst', 'दो से अधिक — संख्या नहीं बताई (the crowd)', AppColors.success),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart5),
    ]);
  }

  // ── L7 ─────────────────────────────────────────────────────────────────────
  Widget buildPart6Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Against, About, Of, To, Towards, Over, Within, Than, Throughout, Without, Up, Upwards, Downwards, Around', 'Learn 14 more important prepositions.'),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart6),
    ]);
  }

  // ── L8 ─────────────────────────────────────────────────────────────────────
  Widget buildPart7Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('Ago, Inside, Outside, Next to, Behind, Ahead of, Except, Besides, During, Till/Until, Up to, Along, Alongside, Across', 'Learn the final set of prepositions.'),
      const SizedBox(height: AppSpacing.lg),
      // Beside vs Besides note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚠️ Beside vs Besides — अलग अर्थ!', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 6),
          _comparisonRow('Beside', 'बगल में (= next to)', AppColors.primary),
          const SizedBox(height: 4),
          _comparisonRow('Besides', 'के अतिरिक्त (= in addition to)', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.md),
      // Ahead of vs In front of note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('💡 Ahead of vs In front of', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
          const SizedBox(height: 6),
          _comparisonRow('Ahead of', 'आगे — जब उसकी पीठ आपकी तरफ (queue में)', AppColors.primary),
          const SizedBox(height: 4),
          _comparisonRow('In front of', 'सामने — जब मुँह सामने हो (आमने-सामने)', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),
      _buildPrepositionsTable(Chapter14Data.prepositionsPart7),
    ]);
  }

  Widget _comparisonRow(String term, String desc, Color color) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(term, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
      const SizedBox(width: 8),
      Flexible(child: Text(desc, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
    ]);
  }

  // ── Chapter Quiz Intro ─────────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔗', 'title': 'What is a Preposition?', 'hi': 'Noun/Pronoun के पहले — Object बताता है'},
      {'emoji': '📌', 'title': 'From / Off / Since / For', 'hi': 'जगह से / सतह से / निश्चित समय से / अवधि से'},
      {'emoji': '📌', 'title': 'In / Into / Before / After', 'hi': 'में (time/place) / गतिशील / पहले / बाद में'},
      {'emoji': '📌', 'title': 'By / With / At', 'hi': 'द्वारा/वाहन/तक | instrument/साथ | time/place/festival'},
      {'emoji': '📌', 'title': 'Through / Beyond / Via / Opposite / Above', 'hi': 'आर-पार / बहुत दूर / रास्ते से / सामने / ऊपर'},
      {'emoji': '📌', 'title': 'Under / Beneath / Below / On / Between / Among', 'hi': 'नीचे के अलग-अलग अर्थ'},
      {'emoji': '📌', 'title': 'Over / Within / Than / Around & more', 'hi': 'बिना छुए ऊपर / अन्दर / तुलना / चारों ओर'},
      {'emoji': '📌', 'title': 'Except / During / Till / Across & more', 'hi': 'छोड़कर / दौरान / तक / के पार'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 14 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 14 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12', 'प्रश्न'),
            const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60', 'XP'),
            const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('40+', 'Preps'),
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
}