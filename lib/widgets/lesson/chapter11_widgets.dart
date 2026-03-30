import 'package:flutter/material.dart';
import '../../data/chapter11_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter11Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter11Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ── L1: What is an Adverb? ─────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'क्रिया विशेषण वो शब्द होते हैं जो क्रिया, विशेषण या किसी दूसरे क्रिया विशेषण की विशेषता बताते हैं।',
        'An Adverb polishes/describes a verb, an adjective, or another adverb.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Definition card
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: accentColor.withOpacity(0.3)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Text('🔍', style: TextStyle(fontSize: 22)),
            const SizedBox(width: 8),
            Text('Adverb modify करता है:', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
          ]),
          const SizedBox(height: AppSpacing.sm),
          _modifiesRow('⚡', 'Verb', 'runs fast → fast modifies run', AppColors.primary),
          const SizedBox(height: 6),
          _modifiesRow('🎨', 'Adjective', 'very good → very modifies good', AppColors.accent),
          const SizedBox(height: 6),
          _modifiesRow('🔍', 'Another Adverb', 'very fast → very modifies fast', AppColors.success),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      ...Chapter11Data.introExamples.map((ex) => Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.card, border: Border.all(color: accentColor.withOpacity(0.15)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg)),
            ),
            child: Row(children: [
              Container(width: 28, height: 28, decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                child: Center(child: Text(ex['no']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)))),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GestureDetector(onTap: () => commonWidgets.onSpeak(ex['en']!),
                  child: Text(ex['en']!, style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 14))),
                Text(ex['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
              ])),
              commonWidgets.ttsButton(ex['en']!),
            ]),
          ),
          Padding(padding: const EdgeInsets.all(AppSpacing.md), child: Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: AppColors.accentGold, borderRadius: BorderRadius.circular(AppRadius.full)),
              child: Text('Adverb: ${ex['adverb']!}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
            ),
            const SizedBox(width: 8),
            Flexible(child: Text('→ modifies ${ex['modifies']!}', style: AppTextStyles.labelSmall.copyWith(color: AppColors.textSecondary))),
          ])),
          if (ex['note']!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
              child: Text(ex['note']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, fontStyle: FontStyle.italic)),
            ),
        ]),
      )),
    ]);
  }

  Widget _modifiesRow(String emoji, String what, String example, Color color) {
    return Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 16)),
      const SizedBox(width: 8),
      Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(what, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 11))),
      const SizedBox(width: 8),
      Flexible(child: Text(example, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, fontStyle: FontStyle.italic))),
    ]);
  }

  // ── L2: Degrees of Adverbs ─────────────────────────────────────────────────
  Widget buildDegreesContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'प्रायः क्रिया विशेषणों की तीन degrees होती हैं — Positive, Comparative और Superlative।\nकुछ Adverbs (जैसे very, quite) की कोई degree नहीं होती।',
        'Adverbs generally have 3 degrees. But some (very, quite) have no degrees.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // No-degree note
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.07), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('📌', style: TextStyle(fontSize: 18)), const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Adverbs without degrees:', style: AppTextStyles.labelLarge.copyWith(color: AppColors.warning)),
            const SizedBox(height: 4),
            Wrap(spacing: 8, runSpacing: 6, children: ['very', 'quite', 'here', 'there', 'now', 'just', 'already'].map((w) =>
              GestureDetector(onTap: () => commonWidgets.onSpeak(w), child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.12), borderRadius: BorderRadius.circular(AppRadius.full), border: Border.all(color: AppColors.warning.withOpacity(0.3))),
                child: Text(w, style: AppTextStyles.labelSmall.copyWith(color: AppColors.warning)),
              ))
            ).toList()),
          ])),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('Degrees Table', style: AppTextStyles.headingMedium),
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
          ...Chapter11Data.degreesTable.asMap().entries.map((e) {
            final i = e.key; final d = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                color: i.isEven ? AppColors.surface : AppColors.bg,
                border: i < Chapter11Data.degreesTable.length - 1 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
              ),
              child: Row(children: [
                Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(d['positive']!), child: Text(d['positive']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
                  Text(d['positiveHi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                ])),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(d['comparative']!), child: Text(d['comparative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.accent, fontSize: 12)))),
                Expanded(flex: 3, child: GestureDetector(onTap: () => commonWidgets.onSpeak(d['superlative']!), child: Text(d['superlative']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 12)))),
              ]),
            );
          }),
        ]),
      ),
    ]);
  }

  // ── Shared: adverb examples list builder ──────────────────────────────────
  Widget _buildAdverbExamplesList(List<Map<String, dynamic>> examples) {
    final wordColors = [AppColors.primary, AppColors.accent, AppColors.success, AppColors.warning, const Color(0xFF7C3AED), AppColors.error, AppColors.primary, AppColors.success];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: examples.asMap().entries.map((entry) {
        final color = wordColors[entry.key % wordColors.length];
        final ex = entry.value;
        final exList = (ex['examples'] as List).cast<Map<String, String>>();
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.lg),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.25)), boxShadow: AppShadows.card),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg))),
              child: Row(children: [
                GestureDetector(onTap: () => commonWidgets.onSpeak(ex['word'] as String),
                  child: Text(ex['word'] as String, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 20))),
                const SizedBox(width: 10),
                Text('(${ex['hindi'] as String})', style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                const Spacer(),
                if ((ex['combo'] as String).isNotEmpty)
                  Flexible(child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(AppRadius.full)),
                    child: Text(ex['combo'] as String, style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10)),
                  )),
                const SizedBox(width: 6),
                commonWidgets.ttsButton(ex['word'] as String, color: color),
              ]),
            ),
            // Examples
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: exList.asMap().entries.map((e) =>
                Container(
                  margin: EdgeInsets.only(bottom: e.key < exList.length - 1 ? 8 : 0),
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(color: color.withOpacity(0.04), borderRadius: BorderRadius.circular(AppRadius.sm)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    GestureDetector(onTap: () => commonWidgets.onSpeak(e.value['en']!),
                      child: Text(e.value['en']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13))),
                    const SizedBox(height: 2),
                    Text(e.value['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                  ]),
                )
              ).toList()),
            ),
          ]),
        );
      }).toList(),
    );
  }

  // ── L3: Adverb Examples Part 1 ────────────────────────────────────────────
  Widget buildExamples1Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'नीचे दिये गये क्रिया विशेषणों के अर्थ और उदाहरण समझिए।',
        'Learn the meaning and usage of each adverb below.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('Afterwards → Enough', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      _buildAdverbExamplesList(Chapter11Data.adverbExamples1),
    ]);
  }

  // ── L4: Adverb Examples Part 2 ────────────────────────────────────────────
  Widget buildExamples2Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'नीचे दिये गये क्रिया विशेषणों के अर्थ और उदाहरण समझिए।',
        'Learn the meaning and usage of each adverb below.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('Ever → Only', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      _buildAdverbExamplesList(Chapter11Data.adverbExamples2),
    ]);
  }

  // ── L5: Adverb Examples Part 3 + LY Rule ──────────────────────────────────
  Widget buildExamples3Content() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'Quite से Very तक के उदाहरण, और "-LY" नियम सीखें।',
        'Learn Quite → Very adverbs, and the "-LY" rule for forming adverbs.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('Quite → Very', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      _buildAdverbExamplesList(Chapter11Data.adverbExamples3),

      const SizedBox(height: AppSpacing.lg),

      // LY Rule section
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: accentColor.withOpacity(0.3)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Text('✨', style: TextStyle(fontSize: 22)), const SizedBox(width: 8),
            Text('-LY नियम', style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
          ]),
          const SizedBox(height: AppSpacing.sm),
          Text('अधिकतर जिन शब्दों के अंत में -LY होता है, वे Adverbs होते हैं।', style: AppTextStyles.bodyMedium),
          const SizedBox(height: 4),
          Text('Mostly, words ending with -LY are Adverbs.', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: accentColor)),
          const SizedBox(height: AppSpacing.md),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(AppRadius.md)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Adjective', style: AppTextStyles.labelSmall.copyWith(color: Colors.white)),
              const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
              Text('Adjective + LY = Adverb', style: AppTextStyles.labelSmall.copyWith(color: Colors.white)),
            ]),
          ),
          const SizedBox(height: AppSpacing.md),

          ...Chapter11Data.lyExamples.map((l) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
            child: Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  GestureDetector(onTap: () => commonWidgets.onSpeak(l['adjective']!),
                    child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(l['adjective']!, style: AppTextStyles.labelSmall.copyWith(color: AppColors.primary)))),
                  const Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.textHint),
                  GestureDetector(onTap: () => commonWidgets.onSpeak(l['adverb']!),
                    child: Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(AppRadius.full)), child: Text(l['adverb']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)))),
                ]),
                const SizedBox(height: 4),
                GestureDetector(onTap: () => commonWidgets.onSpeak(l['exAdj']!), child: Text(l['exAdj']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, color: AppColors.primary))),
                GestureDetector(onTap: () => commonWidgets.onSpeak(l['exAdv']!), child: Text(l['exAdv']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, color: accentColor))),
              ])),
            ]),
          )),
        ]),
      ),

      const SizedBox(height: AppSpacing.lg),

      // Nice vs Nicely comparison
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(color: AppColors.success.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.success.withOpacity(0.3))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('💡 Adjective vs Adverb — याद रखिए', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const SizedBox(height: AppSpacing.sm),
          _comparisonRow('Ram is nice.', 'Nice = Adjective (Ram को describe करता है)', AppColors.primary),
          const SizedBox(height: 8),
          _comparisonRow('He danced nicely.', 'Nicely = Adverb (dance को describe करता है)', AppColors.success),
        ]),
      ),
    ]);
  }

  Widget _comparisonRow(String sentence, String note, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(color: color.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.sm)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        GestureDetector(onTap: () => commonWidgets.onSpeak(sentence),
          child: Text(sentence, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14))),
        const SizedBox(height: 2),
        Text(note, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, fontStyle: FontStyle.italic)),
      ]),
    );
  }

  // ── Chapter Quiz Intro ─────────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔍', 'title': 'What is an Adverb?', 'hi': 'Verb/Adjective/Adverb को modify करता है'},
      {'emoji': '📊', 'title': 'Degrees of Adverbs', 'hi': 'Fast→Faster→Fastest, Far→Farther→Farthest'},
      {'emoji': '📝', 'title': 'Afterwards / Again / Ago', 'hi': 'बाद में / दोबारा / पहले'},
      {'emoji': '📝', 'title': 'Already / Away / Early / Else / Enough', 'hi': 'पहले से ही / दूर / जल्दी / काफी'},
      {'emoji': '📝', 'title': 'Ever / Far / Hardly / Just / Never', 'hi': 'कभी / दूर / मुश्किल से / बस अभी / कभी नहीं'},
      {'emoji': '📝', 'title': 'Often / Once / Only / Quite / Together / Very', 'hi': 'अक्सर / एक बार / केवल / बहुत / साथ'},
      {'emoji': '✨', 'title': '-LY Rule', 'hi': 'Quick→Quickly, Nice→Nicely (Adjective+LY=Adverb)'},
      {'emoji': '💡', 'title': 'Very / Quite — No Degrees', 'hi': '"Very", "quite" की कोई degree नहीं होती'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)), const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 11 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)), const SizedBox(height: 4),
          const Text('Chapter 11 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('12', 'प्रश्न'),
            const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('60', 'XP'),
            const SizedBox(width: AppSpacing.md),
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
}