import 'package:flutter/material.dart';
import '../../data/chapter12_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter12Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter12Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ── L1: What is an Interjection? ──────────────────────────────────────────
  Widget buildIntroContent() {
    final colorMap = {
      'success': AppColors.success,
      'error':   AppColors.error,
      'accent':  AppColors.accent,
      'primary': AppColors.primary,
      'warning': AppColors.warning,
    };

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'Interjections अचानक मन की भावनाओं को व्यक्त करते हैं — खुशी, दुख, चौंकना, सहमति, गलती आदि।',
        'Interjections express sudden feelings — joy, grief, surprise, consent, mistake etc.',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Key rule card
      Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: accentColor.withOpacity(0.3)),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('📌', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('नियम', style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
            const SizedBox(height: 4),
            Text('Interjections के बाद हमेशा Exclamation Mark (!) लगाया जाता है।', style: AppTextStyles.bodyMedium),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => commonWidgets.onSpeak('Hurrah! Wow! Alas! Well done!'),
              child: Text('Hurrah!  Wow!  Alas!  Well done!',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 15)),
            ),
          ])),
        ]),
      ),
      const SizedBox(height: AppSpacing.lg),

      Text('5 प्रकार की भावनाएँ', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),

      ...Chapter12Data.emotionTypes.map((e) {
        final color = colorMap[e['color']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: color.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(e['emoji']!, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
                  child: Text(e['type']!, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                ),
                const SizedBox(width: 8),
                Text('(${e['typeHi']!})', style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
              ]),
              const SizedBox(height: 6),
              Text(e['examples']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic)),
            ])),
          ]),
        );
      }),
    ]);
  }

  // ── L2: Joy & Grief ────────────────────────────────────────────────────────
  Widget buildJoyGriefContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'खुशी (Joy) और दुख (Grief) व्यक्त करने वाले Interjections सीखिए।',
        'Learn interjections that express Joy and Grief.',
      ),
      const SizedBox(height: AppSpacing.lg),
      _buildEmotionSection('😄', 'Joy (खुशी)', AppColors.success, Chapter12Data.joyExamples),
      const SizedBox(height: AppSpacing.lg),
      _buildEmotionSection('😢', 'Grief (दुख)', AppColors.error, Chapter12Data.griefExamples),
    ]);
  }

  // ── L3: Surprise, Consent & Mistake ──────────────────────────────────────
  Widget buildSurpriseConsentContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'चौंकना (Surprise), सहमति (Consent) और गलती (Mistake) वाले Interjections सीखिए।',
        'Learn interjections expressing Surprise, Consent and Mistake.',
      ),
      const SizedBox(height: AppSpacing.lg),
      _buildEmotionSection('😲', 'Surprise (चौंकना)', AppColors.accent, Chapter12Data.surpriseExamples),
      const SizedBox(height: AppSpacing.lg),
      _buildEmotionSection('👍', 'Consent (सहमति)', AppColors.primary, Chapter12Data.consentExamples),
      const SizedBox(height: AppSpacing.lg),
      _buildEmotionSection('😬', 'Mistake (गलती)', AppColors.warning, Chapter12Data.mistakeExamples),
    ]);
  }

  // ── L4: Everyday Interjections ────────────────────────────────────────────
  Widget buildEverydayContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      commonWidgets.buildLessonIntro(
        'रोज़मर्रा की ज़िंदगी में प्रयोग होने वाले Interjections सीखिए।',
        'Learn common everyday interjections used in daily conversation.',
      ),
      const SizedBox(height: AppSpacing.lg),
      Text('रोज़मर्रा के Interjections', style: AppTextStyles.headingMedium),
      const SizedBox(height: AppSpacing.md),
      ...Chapter12Data.everydayPhrases.asMap().entries.map((e) {
        final i = e.key;
        final p = e.value;
        final colors = [
          AppColors.primary, AppColors.accent, AppColors.success,
          AppColors.warning, const Color(0xFF7C3AED), AppColors.error,
          AppColors.primary, AppColors.accent, AppColors.success,
          AppColors.warning, const Color(0xFF7C3AED), AppColors.error,
        ];
        final color = colors[i % colors.length];
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: color.withOpacity(0.2)),
            boxShadow: AppShadows.card,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.07),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg)),
              ),
              child: Row(children: [
                Expanded(child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(p['en']!.split('!')[0] + '!'),
                  child: Text(p['en']!, style: AppTextStyles.headingMedium.copyWith(color: color, fontSize: 16)),
                )),
                commonWidgets.ttsButton(p['en']!.split('!')[0] + '!', color: color),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              child: Row(children: [
                Expanded(child: Text(p['hi']!, style: AppTextStyles.bodyMedium)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)),
                  child: Text(p['pronun']!, style: AppTextStyles.labelSmall.copyWith(color: color)),
                ),
              ]),
            ),
          ]),
        );
      }),
    ]);
  }

  // ── Chapter Quiz Intro ─────────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '😲', 'title': 'What is an Interjection?', 'hi': 'अचानक भावनाएँ व्यक्त करने वाले शब्द (!)'},
      {'emoji': '😄', 'title': 'Joy — Hurrah!, Wow!, Great!', 'hi': 'खुशी व्यक्त करना'},
      {'emoji': '😢', 'title': 'Grief — Alas!, How sad!, Oh no!', 'hi': 'दुख व्यक्त करना'},
      {'emoji': '😮', 'title': 'Surprise — Amazing!, Really!, Is it!', 'hi': 'चौंकते हुए भावना'},
      {'emoji': '👍', 'title': 'Consent — Bravo!, Well done!, Sure!', 'hi': 'सहमति देना / शाबाशी'},
      {'emoji': '😬', 'title': 'Mistake — Oh!, Oops!, No!', 'hi': 'गलती व्यक्त करना'},
      {'emoji': '💬', 'title': 'Congratulations! / Touch wood!', 'hi': 'बधाई हो! / नज़र न लगे!'},
      {'emoji': '🙏', 'title': 'God bless you! / Thank God!', 'hi': 'आशीर्वाद / शुक्र'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        child: Column(children: [
          const Text('🏆', style: TextStyle(fontSize: 56)),
          const SizedBox(height: AppSpacing.md),
          const Text('अध्याय 12 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 4),
          const Text('Chapter 12 — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.md),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            commonWidgets.quizStatBadge('10', 'प्रश्न'),
            const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('50', 'XP'),
            const SizedBox(width: AppSpacing.md),
            commonWidgets.quizStatBadge('5', 'भावनाएँ'),
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
    ]);
  }

  // ── Shared: Emotion Section Builder ───────────────────────────────────────
  Widget _buildEmotionSection(String emoji, String title, Color color, List<Map<String, String>> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: AppShadows.card,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(AppRadius.lg), topRight: Radius.circular(AppRadius.lg)),
          ),
          child: Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 10),
            Text(title, style: AppTextStyles.headingMedium.copyWith(color: color)),
          ]),
        ),
        // Items grid
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Wrap(
            spacing: 8, runSpacing: 8,
            children: items.map((item) => GestureDetector(
              onTap: () => commonWidgets.onSpeak(item['en']!.replaceAll('!', '')),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: color.withOpacity(0.25)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(item['en']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 14)),
                    const SizedBox(width: 4),
                    Icon(Icons.volume_up_rounded, color: color.withOpacity(0.5), size: 12),
                  ]),
                  Text(item['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  Text(item['pronun']!, style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10)),
                ]),
              ),
            )).toList(),
          ),
        ),
      ]),
    );
  }
}