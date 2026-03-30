import 'package:flutter/material.dart';
import '../../data/chapter13_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter13Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter13Widgets({required this.commonWidgets, required this.accentColor});

  // ── L1: What are Articles? ─────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'A, An और The — ये तीनों Articles कहलाते हैं। ये Adjectives हैं क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं।',
        'A, An and The are called Articles. They are also Adjectives as they modify nouns.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Article type cards
      ...Chapter13Data.articleTypes.map((a) {
        final isDefinite = a['type']!.contains('Definite') && !a['type']!.contains('In');
        final color = isDefinite ? AppColors.primary : AppColors.accent;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3)), boxShadow: AppShadows.card),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                Text(a['emoji']!, style: const TextStyle(fontSize: 26)),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(a['type']!, style: AppTextStyles.headingMedium.copyWith(color: color)),
                  Text(a['typeHi']!, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
                ])),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
                  child: Text(a['articles']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18)),
                ),
              ]),
            ),
            Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(a['use']!, style: AppTextStyles.bodyMedium),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.sm)),
                child: Row(children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    GestureDetector(onTap: () => commonWidgets.onSpeak(a['example']!), child: Text(a['example']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
                    Text(a['exampleHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                  ])),
                  commonWidgets.ttsButton(a['example']!, color: color),
                ]),
              ),
            ])),
          ]),
        );
      }),

      const SizedBox(height: AppSpacing.lg),

      // Story comparison
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('📖 उदाहरण से समझिए', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: AppSpacing.sm),
          Text('जब पापा को उस लड़के के बारे में नहीं पता था:', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          GestureDetector(onTap: () => commonWidgets.onSpeak('Dad, a boy is at the door.'),
            child: Text('"Dad, a boy is at the door."', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 13))),
          const SizedBox(height: 10),
          Text('जब पापा को उस लड़के के बारे में पहले से पता था:', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          GestureDetector(onTap: () => commonWidgets.onSpeak('Dad, the boy is at the door.'),
            child: Text('"Dad, the boy is at the door."', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 13))),
          const SizedBox(height: 10),
          Row(children: [
            _pillBadge('A/An = एक/कोई', AppColors.accent),
            const SizedBox(width: 8),
            _pillBadge('The = वो/विशेष', AppColors.primary),
          ]),
        ]),
      ),
    ]);
  }

  // ── L2: A vs An — The Sound Rule ──────────────────────────────────────────
  Widget buildAvsAnContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'A या An का प्रयोग अगले शब्द की SPELLING पर नहीं, बल्कि उसकी SOUND (ध्वनि) पर निर्भर करता है।',
        'A or An depends on the SOUND of the next word, NOT its spelling.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // The key rule
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]),
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        child: Column(children: [
          Row(children: [
            const Expanded(child: Column(children: [
              Text('AN', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32)),
              Text('स्वर ध्वनि से शुरू', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
              Text('Vowel Sound', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 11), textAlign: TextAlign.center),
            ])),
            Container(width: 1, height: 60, color: Colors.white30),
            const Expanded(child: Column(children: [
              Text('A', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32)),
              Text('व्यंजन ध्वनि से शुरू', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
              Text('Consonant Sound', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 11), textAlign: TextAlign.center),
            ])),
          ]),
        ]),
      ),
      const SizedBox(height: AppSpacing.md),

      // Tricky rule highlight
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('⚠️ ध्यान रखें — Tricky cases:', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
          const SizedBox(height: 8),
          _trickyRow('An hour', '"h" silent → आवर (स्वर ध्वनि)', true),
          _trickyRow('A university', '"u" → यूनिवर्सिटी (व्यंजन ध्वनि)', false),
          _trickyRow('An MLA', '"M" → एम (स्वर ध्वनि)', true),
          _trickyRow('An honest', '"h" silent → ऑनैस्ट (स्वर ध्वनि)', true),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('सभी उदाहरण', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(flex: 3, child: Text('Word', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 3, child: Text('ध्वनि / Sound', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 2, child: Text('Article', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...Chapter13Data.aVsAnExamples.asMap().entries.map((e) {
            final i = e.key; final ex = e.value;
            final isAn = ex['article'] == 'An';
            final color = isAn ? AppColors.success : AppColors.accent;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: i.isEven ? AppColors.surface : AppColors.bg,
                border: i < Chapter13Data.aVsAnExamples.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
              ),
              child: Row(children: [
                Expanded(flex: 3, child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(ex['word']!),
                  child: Text(ex['word']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                )),
                Expanded(flex: 3, child: Text(ex['sound']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                Expanded(flex: 2, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
                  child: Text(ex['article']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14), textAlign: TextAlign.center),
                )),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  Widget _trickyRow(String word, String reason, bool isAn) {
    final color = isAn ? AppColors.success : AppColors.accent;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(children: [
        Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(isAn ? 'An' : 'A', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
        const SizedBox(width: 8),
        GestureDetector(onTap: () => commonWidgets.onSpeak(word), child: Text(word, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
        const SizedBox(width: 8),
        Flexible(child: Text('— $reason', style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
      ]),
    );
  }

  // ── L3: The pronunciation ──────────────────────────────────────────────────
  Widget buildThePronunContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        '"The" को दो तरह से बोला जाता है — "द" और "दी" — अगले शब्द की ध्वनि के अनुसार।',
        '"The" is pronounced two ways — "the" (द) or "thee" (दी) — based on the sound of the next word.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Rule card
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]), borderRadius: BorderRadius.circular(AppRadius.lg)),
        child: Column(children: [
          Row(children: [
            Expanded(child: Column(children: [
              const Text('दी (thee)', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)),
              const SizedBox(height: 4),
              Text('स्वर ध्वनि (Vowel sound) से पहले', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
            ])),
            Container(width: 1, height: 60, color: Colors.white30),
            Expanded(child: Column(children: [
              const Text('द (the)', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 26)),
              const SizedBox(height: 4),
              Text('व्यंजन ध्वनि (Consonant sound) से पहले', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
            ])),
          ]),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      Container(
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), boxShadow: AppShadows.card),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Expanded(flex: 3, child: Text('Phrase', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 2, child: Text('ध्वनि', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
              Expanded(flex: 2, child: Text('Pronunciation', style: AppTextStyles.labelSmall.copyWith(color: Colors.white))),
            ]),
          ),
          ...Chapter13Data.thePronunExamples.asMap().entries.map((e) {
            final i = e.key; final ex = e.value;
            final isDee = ex['pronun'] == 'दी';
            final color = isDee ? AppColors.success : AppColors.accent;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: i.isEven ? AppColors.surface : AppColors.bg,
                border: i < Chapter13Data.thePronunExamples.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
              ),
              child: Row(children: [
                Expanded(flex: 3, child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(ex['word']!),
                  child: Text(ex['word']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 12)),
                )),
                Expanded(flex: 2, child: Text(ex['sound']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
                Expanded(flex: 2, child: Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
                    child: Text(ex['example']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11)),
                  ),
                  const SizedBox(width: 4),
                  commonWidgets.ttsButton(ex['word']!, color: color),
                ])),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  // ── L4: Where to use The ──────────────────────────────────────────────────
  Widget buildTheUseContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        '"The" का प्रयोग विशेष, पहले से ज्ञात, या unique वस्तुओं के लिए होता है।',
        '"The" is used for specific, already known, or unique people/things.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('"The" कहाँ लगाएँ — Rules', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter13Data.theUseRules.asMap().entries.map((e) {
        final colors = [AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning, const Color(0xFF7C3AED), AppColors.error, AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning, const Color(0xFF7C3AED)];
        final color = colors[e.key % colors.length];
        final r = e.value;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(r['emoji']!, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(r['rule']!, style: AppTextStyles.labelLarge.copyWith(color: color)),
              Text(r['ruleHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.sm)),
                child: Text(r['examples']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, fontSize: 12, color: color)),
              ),
            ])),
          ]),
        );
      }),
    ]);
  }

  // ── L5: Where NOT to use The ──────────────────────────────────────────────
  Widget buildTheNotUseContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        '"The" का प्रयोग बीमारियों, देशों, भाषाओं, खाने के नामों और व्यक्तिवाचक संज्ञा से पहले नहीं होता।',
        '"The" is NOT used before disease names, country names, languages, meal names, and proper nouns.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('"The" कहाँ नहीं लगाएँ — Rules', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter13Data.theNotUseRules.map((r) => Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.error.withOpacity(0.25)), boxShadow: AppShadows.card),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(color: AppColors.error.withOpacity(0.07), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
            child: Row(children: [
              Text(r['emoji']!, style: const TextStyle(fontSize: 24)), const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(r['rule']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
                Text(r['ruleHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              ])),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: AppColors.error, borderRadius: BorderRadius.circular(AppRadius.full)), child: const Text('The ❌', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
            ]),
          ),
          Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _wrongCorrectRow('❌', r['wrong']!, AppColors.error),
            const SizedBox(height: 6),
            _wrongCorrectRow('✅', r['correct']!, AppColors.success),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: AppColors.error.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.sm)),
              child: Text(r['note']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.error)),
            ),
          ])),
        ]),
      )),
    ]);
  }

  Widget _wrongCorrectRow(String icon, String text, Color color) {
    return Row(children: [
      Text(icon, style: const TextStyle(fontSize: 16)),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () => commonWidgets.onSpeak(text),
        child: Text(text, style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 13)),
      ),
      const SizedBox(width: 6),
      if (color == AppColors.success) commonWidgets.ttsButton(text, color: color),
    ]);
  }

  // ── Chapter Quiz Intro ─────────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📰', 'title': 'What are Articles?', 'hi': 'A, An, The — 3 Articles = Adjectives'},
      {'emoji': '❓', 'title': 'Indefinite: A / An', 'hi': 'पहली बार / अनजान person/thing'},
      {'emoji': '👆', 'title': 'Definite: The', 'hi': 'विशेष / पहले से ज्ञात person/thing'},
      {'emoji': '🔤', 'title': 'A vs An — Sound Rule', 'hi': 'An hour ✅, A university ✅ — ध्वनि देखें'},
      {'emoji': '🔊', 'title': 'The → "द" vs "दी"', 'hi': 'Vowel sound → दी | Consonant sound → द'},
      {'emoji': '✅', 'title': 'Where to use The', 'hi': 'Sun, Taj Mahal, Superlatives, Rivers...'},
      {'emoji': '❌', 'title': 'Where NOT to use The', 'hi': 'Diseases, Countries, Languages, Meals...'},
      {'emoji': '📚', 'title': 'Whole / All + The', 'hi': 'The whole book | All the books'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 13 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 13 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
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

  Widget _pillBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
      child: Text(text, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}