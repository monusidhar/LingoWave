import 'package:flutter/material.dart';
import '../../data/chapter42_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter42Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter42Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Passages 1–5
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildPassages1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _introBanner(),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Passages 1–5',
            'Nuclear Family, Boxing, Call Centers, Colors of Life, Criminals'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter42Data.passages
            .sublist(0, 5)
            .map((p) => _passageCard(p)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Passages 6–10
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildPassages2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में 5 और अंग्रेज़ी परिच्छेद हैं — Boy & Guitar, Poverty, Ambition, Childhood और Best Day.',
          'This lesson continues with 5 more English passages for comprehension and vocabulary.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Passages 6–10',
            'Boy & Guitar, Poverty, Ambition, Childhood, Best Day'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter42Data.passages
            .sublist(5, 10)
            .map((p) => _passageCard(p)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '👨‍👩‍👧‍👦', 'title': 'Nuclear vs Joint Family',    'hi': 'एकल बनाम संयुक्त परिवार'},
      {'emoji': '🥊',          'title': 'John Love – A Piece of Iron', 'hi': 'जॉन लव की मुक्केबाज़ी कहानी'},
      {'emoji': '📞',          'title': 'Call Centers & BPO',          'hi': 'Inbound, Outbound, BPO'},
      {'emoji': '🌈',          'title': 'Colors of Life',              'hi': 'जिन्दगी के रंग'},
      {'emoji': '⚖️',          'title': 'Criminals',                   'hi': 'अपराध और शिक्षा'},
      {'emoji': '🎸',          'title': 'Boy & Guitar',                'hi': 'लड़का और बन्दूक की कहानी'},
      {'emoji': '🏚️',          'title': 'Poverty',                     'hi': 'गरीबी और भ्रष्टाचार'},
      {'emoji': '🎯',          'title': 'Ambition',                    'hi': 'महत्वाकांक्षा: static या dynamic?'},
      {'emoji': '🧒',          'title': 'When I was a Kid',            'hi': 'बचपन की शरारतें'},
      {'emoji': '🌟',          'title': 'The Best Day of My Life',     'hi': 'Edison की quote और interview'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [accentColor, accentColor.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 42 — फ़ाइनल क्विज़',
                style: TextStyle(
                    fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Few English Passages — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('60', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('10', 'Passages'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल Passages', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(children: [
                Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['title']!, style: AppTextStyles.labelLarge),
                        Text(t['hi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 12)),
                      ]),
                ),
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 18),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(children: [
            Text('💡', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                '6/10 सही जवाब देने पर अध्याय पूरा होगा।\nScore 6/10 or more to complete the chapter!',
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPERS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _introBanner() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.13),
            accentColor.withOpacity(0.04)
          ],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('📘', style: TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text('Few English Passages',
                style:
                    AppTextStyles.headingMedium.copyWith(color: accentColor)),
          ),
        ]),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'कुछ अंग्रेज़ी परिच्छेद पढ़ें, समझें और शब्दों का अर्थ सीखें।',
          style: AppTextStyles.bodyMedium.copyWith(height: 1.5),
        ),
        const SizedBox(height: 4),
        Text(
          'Read these English passages carefully to improve your comprehension and vocabulary.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            fontStyle: FontStyle.italic,
            height: 1.5,
          ),
        ),
      ]),
    );
  }

  Widget _sectionHeader(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(children: [
        Icon(Icons.menu_book_rounded, color: accentColor, size: 22),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
            Text(subtitle,
                style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary, fontSize: 11),
                overflow: TextOverflow.ellipsis),
          ]),
        ),
      ]),
    );
  }

  Widget _passageCard(Map<String, dynamic> passage) {
    final vocabList = (passage['vocab'] as List).cast<Map<String, String>>();
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.1)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Header
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppRadius.xl - 2),
              topRight: Radius.circular(AppRadius.xl - 2),
            ),
          ),
          child: Row(children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(AppRadius.md)),
              child: Center(
                child: Text('${passage['no']}',
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 15)),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Text(passage['emoji'] as String,
                style: const TextStyle(fontSize: 24)),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(passage['title'] as String,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: accentColor)),
                    Text(passage['titleHi'] as String,
                        style: AppTextStyles.bodyMedium.copyWith(
                            fontSize: 12,
                            color: AppColors.textSecondary)),
                  ]),
            ),
            commonWidgets.ttsButton(passage['text'] as String),
          ]),
        ),
        // Passage text
        Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Text(passage['text'] as String,
              style: AppTextStyles.bodyMedium.copyWith(height: 1.75)),
        ),
        // Vocabulary
        if (vocabList.isNotEmpty) ...[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            height: 1,
            color: AppColors.lockedBg,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Text('📚', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 6),
                    Text('Key Vocabulary',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: accentColor)),
                  ]),
                  const SizedBox(height: AppSpacing.sm),
                  ...vocabList
                      .map((v) => _vocabRow(v['word']!, v['meaning']!)),
                ]),
          ),
        ],
      ]),
    );
  }

  Widget _vocabRow(String word, String meaning) {
    return GestureDetector(
      onTap: () => commonWidgets.onSpeak(word),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: accentColor.withOpacity(0.15)),
        ),
        child: Row(children: [
          Expanded(
            flex: 5,
            child: Row(children: [
              Icon(Icons.volume_up_rounded,
                  size: 13, color: accentColor.withOpacity(0.6)),
              const SizedBox(width: 5),
              Expanded(
                child: Text(word,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: accentColor, fontSize: 13)),
              ),
            ]),
          ),
          const Icon(Icons.arrow_forward_rounded,
              size: 13, color: AppColors.textHint),
          const SizedBox(width: 6),
          Expanded(
            flex: 6,
            child: Text(meaning,
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ),
        ]),
      ),
    );
  }
}