import 'package:flutter/material.dart';
import '../../data/chapter15_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter15Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter15Widgets({required this.commonWidgets, required this.accentColor});

  // ── L1: What are Determiners? ─────────────────────────────────────────────
  Widget buildIntroContent() {
    final colorMap = {'primary': AppColors.primary, 'accent': AppColors.accent, 'success': AppColors.success, 'warning': AppColors.warning};
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'Determiner एक ऐसा शब्द है जो किसी Noun से तुरंत पहले रखा जाता है और उस Noun के बारे में अतिरिक्त सूचना देता है।',
        'A Determiner is placed just before a noun to give additional information about that noun.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Classification
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('💡', style: TextStyle(fontSize: 18)), const SizedBox(width: 8), Text('Determiners = Adjectives भी कहलाते हैं', style: AppTextStyles.labelLarge.copyWith(color: accentColor))]),
          const SizedBox(height: 6),
          Text('क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं — जैसे Adjectives करते हैं।', style: AppTextStyles.bodyMedium),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      // Intro example
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📖 उदाहरण से समझिए', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 8),
          Text('"यह लड़का राम है।" — "यह (This)" एक Determiner है।', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          Text('"यह" से तय होता है — इस लड़के की बात हो रही है या उस लड़के की।', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic)),
          const SizedBox(height: AppSpacing.sm),
          Wrap(spacing: 6, runSpacing: 4, children: ['A boy', 'The boy', 'All the boys', '5 boys', 'This boy'].map((ex) =>
            GestureDetector(
              onTap: () => commonWidgets.onSpeak(ex),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.12), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
                child: Text(ex, style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning)),
              ),
            )
          ).toList()),
          const SizedBox(height: 6),
          Text('A, The, All, 5, This — ये सभी Determiners हैं।', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.warning, fontWeight: FontWeight.w600)),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('Determiners के 4 प्रकार', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      ...Chapter15Data.determinerTypes.map((d) {
        final color = colorMap[d['color']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: 32, height: 32, decoration: BoxDecoration(color: color, shape: BoxShape.circle), child: Center(child: Text(d['no']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 14)))),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(d['emoji']!, style: const TextStyle(fontSize: 18)), const SizedBox(width: 6),
                Text(d['type']!, style: AppTextStyles.labelLarge.copyWith(color: color)),
                const SizedBox(width: 6),
                Text('(${d['typeHi']!})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: color)),
              ]),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () => commonWidgets.onSpeak(d['words']!.replaceAll(',', '')),
                child: Text(d['words']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: AppColors.textSecondary)),
              ),
            ])),
          ]),
        );
      }),
    ]);
  }

  // ── L2: Demonstratives ────────────────────────────────────────────────────
  Widget buildDemonstrativesContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'This, That, These, Those — ये चारों Demonstratives कहलाते हैं। ये Pronoun की तरह या Determiner की तरह प्रयोग हो सकते हैं।',
        'This, That, These, Those are Demonstratives — used as Pronouns or Determiners.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Four demonstratives table
      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(flex: 2, child: Text('Word', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 2, child: Text('उच्चारण', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 2, child: Text('अर्थ', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('Number', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...Chapter15Data.demonstratives.asMap().entries.map((e) {
            final i = e.key; final d = e.value;
            final isPlural = d['number']!.contains('Plural');
            final color = isPlural ? AppColors.success : AppColors.primary;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                color: i.isEven ? AppColors.surface : AppColors.bg,
                border: i < 3 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
              ),
              child: Row(children: [
                Expanded(flex: 2, child: GestureDetector(onTap: () => commonWidgets.onSpeak(d['word']!), child: Text(d['word']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 15)))),
                Expanded(flex: 2, child: Text(d['pronun']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                Expanded(flex: 2, child: Text(d['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                Expanded(flex: 3, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)),
                  child: Text(d['number']!, style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10)),
                )),
              ]),
            );
          }),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      // Pronoun vs Determiner rule
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor.withOpacity(0.1), accentColor.withOpacity(0.05)]), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 Pronoun vs Determiner — नियम', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.sm),
          _ruleRow('Determiner', 'Demonstrative + Noun → Determiner', '"This book is mine." (book = noun)', AppColors.primary),
          const SizedBox(height: 8),
          _ruleRow('Pronoun', 'Demonstrative + No Noun → Pronoun', '"This is a book." (no noun after this)', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      ...Chapter15Data.demonstrativeExamples.map((ex) {
        final isDeterminer = ex['type'] == 'Determiner';
        final color = isDeterminer ? AppColors.primary : AppColors.accent;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: color.withOpacity(0.2)), boxShadow: AppShadows.card),
          child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(onTap: () => commonWidgets.onSpeak(ex['sentence']!), child: Text(ex['sentence']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
              Text(ex['hindi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
              const SizedBox(height: 4),
              Text(ex['reason']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.textSecondary, fontStyle: FontStyle.italic)),
            ])),
            const SizedBox(width: 8),
            Column(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(ex['type']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 10))),
              const SizedBox(height: 4),
              commonWidgets.ttsButton(ex['sentence']!, color: color),
            ]),
          ]),
        );
      }),
    ]);
  }

  Widget _ruleRow(String type, String rule, String example, Color color) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(type, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
      const SizedBox(width: 8),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(rule, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, fontWeight: FontWeight.w600)),
        Text(example, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, fontStyle: FontStyle.italic, color: color)),
      ])),
    ]);
  }

  // ── L3: Possessives ───────────────────────────────────────────────────────
  Widget buildPossessivesContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'His, Her, My, Our, Their, Your, Its — ये सभी Possessive Determiners हैं। इनके तुरंत बाद हमेशा एक Noun होता है।',
        'His, Her, My, Our, Their, Your, Its are Possessive Determiners — always followed by a noun.',
      ),
      const SizedBox(height: AppSpacing.lg),

      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.25))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('📌', style: TextStyle(fontSize: 18)), const SizedBox(width: 8),
          const Expanded(child: Text('Possessive Determiners के तुरंत बाद ALWAYS एक Noun होता है। ये Noun की "ownership" (स्वामित्व) बताते हैं।', style: AppTextStyles.bodyMedium)),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('सभी Possessive Determiners', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      ...Chapter15Data.possessives.asMap().entries.map((e) {
        final colors = [AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning, const Color(0xFF7C3AED), AppColors.error, AppColors.primary];
        final color = colors[e.key % colors.length];
        final p = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.2)), boxShadow: AppShadows.card),
          child: Row(children: [
            Container(width: 48, height: 48, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.md)), child: Center(child: GestureDetector(onTap: () => commonWidgets.onSpeak(p['word']!), child: Text(p['word']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 16))))),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p['hindi']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14)),
              const SizedBox(height: 4),
              GestureDetector(onTap: () => commonWidgets.onSpeak(p['example']!), child: Text(p['example']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 12))),
            ])),
            commonWidgets.ttsButton(p['example']!, color: color),
          ]),
        );
      }),
    ]);
  }

  // ── L4: Quantifiers Part 1 (1–9) ─────────────────────────────────────────
  Widget buildQuantifiers1Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'Quantifiers वो Determiners हैं जो Noun की मात्रा (amount/quantity) बताते हैं।',
        'Quantifiers indicate the amount or quantity of a noun.',
      ),
      const SizedBox(height: AppSpacing.md),

      // Countable vs Uncountable note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.primary.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📌 Countable vs Uncountable', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
          const SizedBox(height: 6),
          _countRow('Countable', 'जिन्हें गिना जा सकता है', 'boys, books, people, friends', AppColors.primary),
          const SizedBox(height: 4),
          _countRow('Uncountable', 'जिन्हें गिना नहीं जा सकता', 'water, milk, petrol, money, time', AppColors.accent),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      // Some vs Any note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚠️ Some vs Any — ध्यान से सीखें', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 6),
          _countRow('Some', 'Positive sentences में', 'I have some money.', AppColors.success),
          const SizedBox(height: 4),
          _countRow('Any', 'Negative sentences में', 'I don\'t have any money.', AppColors.error),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('Quantifiers — भाग 1 (1 से 9)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      _buildQuantifiersList(Chapter15Data.quantifiers.sublist(0, 9)),
    ]);
  }

  // ── L5: Quantifiers Part 2 (10–18) ────────────────────────────────────────
  Widget buildQuantifiers2Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro('भाग 2 में और Quantifiers सीखिए — Both, Enough, Half, Quarter, Whole, More, Less, Many, Much और Numbers।', 'Part 2: Both, Enough, Half, Quarter, Whole, More, Less, Many, Much and Numbers.'),
      const SizedBox(height: AppSpacing.md),

      // Many vs Much vs More note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: accentColor.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: accentColor.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('💡 Many / Much / More — याद रखें', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          const SizedBox(height: 6),
          _countRow('Many', 'Countable के साथ', 'Many boys, Many books', AppColors.primary),
          const SizedBox(height: 4),
          _countRow('Much', 'Uncountable के साथ', 'Much water, Much time', AppColors.accent),
          const SizedBox(height: 4),
          _countRow('More', 'दोनों के साथ', 'More boys, More water', AppColors.success),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('Quantifiers — भाग 2 (10 से 18)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      _buildQuantifiersList(Chapter15Data.quantifiers.sublist(9)),
    ]);
  }

  Widget _countRow(String term, String rule, String example, Color color) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(term, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
      const SizedBox(width: 8),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(rule, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        GestureDetector(onTap: () => commonWidgets.onSpeak(example), child: Text(example, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, fontStyle: FontStyle.italic, color: color))),
      ])),
    ]);
  }

  Widget _buildQuantifiersList(List<Map<String, dynamic>> list) {
    final colors = [AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning, const Color(0xFF7C3AED), AppColors.error, AppColors.primary, AppColors.accent, AppColors.success];
    return Column(children: list.asMap().entries.map((e) {
      final color = colors[e.key % colors.length];
      final q = e.value;
      return Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.2)), boxShadow: AppShadows.card),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 28, height: 28, decoration: BoxDecoration(color: color, shape: BoxShape.circle), child: Center(child: Text(q['emoji'] as String, style: const TextStyle(fontSize: 14)))),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              GestureDetector(onTap: () => commonWidgets.onSpeak((q['word'] as String).split('/')[0].trim()), child: Text(q['word'] as String, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
              const SizedBox(width: 8),
              Text('(${q['hindi'] as String})', style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
            ]),
            const SizedBox(height: 4),
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(q['use'] as String, style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10))),
              const SizedBox(width: 8),
              GestureDetector(onTap: () => commonWidgets.onSpeak((q['example'] as String).split(',')[0].trim()), child: Text(q['example'] as String, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 11, color: AppColors.textSecondary))),
            ]),
          ])),
          commonWidgets.ttsButton((q['word'] as String).split('/')[0].trim(), color: color),
        ]),
      );
    }).toList());
  }

  // ── Chapter Quiz Intro ─────────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔑', 'title': 'What is a Determiner?', 'hi': 'Noun से पहले → Adjective की तरह'},
      {'emoji': '📰', 'title': '1. Articles — A, An, The', 'hi': 'Definite + Indefinite Articles'},
      {'emoji': '👆', 'title': '2. Demonstratives', 'hi': 'This/That (singular) | These/Those (plural)'},
      {'emoji': '🎯', 'title': 'Determiner vs Pronoun', 'hi': 'Noun के पहले → Determiner | अकेला → Pronoun'},
      {'emoji': '🤝', 'title': '3. Possessives', 'hi': 'My/Your/His/Her/Its/Our/Their'},
      {'emoji': '🔢', 'title': '4. Quantifiers — Few/Some/Any', 'hi': 'Few=Countable | Little=Uncountable | Some/Any=Both'},
      {'emoji': '📊', 'title': 'Many / Much / More', 'hi': 'Many=Count | Much=Uncount | More=Both'},
      {'emoji': '⚖️', 'title': 'Half / Quarter / Whole / Both', 'hi': 'आधा / चौथाई / पूरा / दोनों'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 15 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 15 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12', 'प्रश्न'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60', 'XP'), const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('4', 'Types'),
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