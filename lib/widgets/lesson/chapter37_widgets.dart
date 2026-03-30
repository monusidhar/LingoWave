import 'package:flutter/material.dart';
import '../../data/chapter37_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter37Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter37Widgets({required this.commonWidgets, required this.accentColor});

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Exercise I Part A (1–50)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx1AContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस chapter में पिछले सभी chapters के concepts पर based sentences हैं। गलत वाक्य को सही करके correction और rule देखें।',
          'All sentences are based on concepts from previous chapters. Find the error, check correction and rule.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseHeader('Exercise I', 'Part A', '1–50', '📝', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter37Data.exercise1A.map((item) => _correctionCard(item)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Exercise I Part B (51–118)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx1BContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Exercise I जारी — sentences 51 to 118. Prepositions, subject-verb agreement, comparatives और अन्य rules।',
          'Exercise I continued — sentences 51 to 118. Prepositions, agreement, comparatives and more.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseHeader('Exercise I', 'Part B', '51–118', '📝', AppColors.primary),
        const SizedBox(height: AppSpacing.md),
        ...Chapter37Data.exercise1B.map((item) => _correctionCard(item)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Exercise II Part A (1–55)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx2AContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Exercise II — और advanced corrections। Reflexive verbs, articles, pronouns, reported speech और gerunds।',
          'Exercise II — More advanced corrections. Reflexive verbs, articles, pronouns, reported speech and gerunds.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseHeader('Exercise II', 'Part A', '1–55', '📋', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter37Data.exercise2A.map((item) => _correctionCard(item)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Exercise II Part B (56–110)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildEx2BContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Exercise II जारी — Comparatives, "prefer", "since/because", conjunctions और verb forms।',
          'Exercise II continued — Comparatives, "prefer", conjunctions, verb forms and more.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _exerciseHeader('Exercise II', 'Part B', '56–110', '📋', AppColors.success),
        const SizedBox(height: AppSpacing.md),
        ...Chapter37Data.exercise2B.map((item) => _correctionCard(item)),
        const SizedBox(height: AppSpacing.lg),
        _quotesSection(),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📌', 'title': 'Does/Did → V1 (base form)', 'hi': '"does he goes" → "does he go"'},
      {'emoji': '⏳', 'title': 'since vs for', 'hi': '"since two years" → "for two years"'},
      {'emoji': '📖', 'title': 'teacher of [subject]', 'hi': '"my English teacher" → "my teacher of English"'},
      {'emoji': '⚰️', 'title': 'die of (disease)', 'hi': '"died from cancer" → "died of cancer"'},
      {'emoji': '🔢', 'title': 'The + the = 2 persons', 'hi': '"the director and the producer is" → "are"'},
      {'emoji': '🪞', 'title': 'Reflexive verbs', 'hi': '"I am enjoying" → "enjoying myself"'},
      {'emoji': '🔢', 'title': 'either/any (two/three+)', 'hi': '"any of the two" → "either of the two"'},
      {'emoji': '📊', 'title': 'Comparatives & Superlatives', 'hi': '"the best of two" → "better of two"'},
      {'emoji': '🔗', 'title': 'superior/senior to (not than)', 'hi': '"senior than" → "senior to"'},
      {'emoji': '🚫', 'title': 'Double negatives', 'hi': '"unless you don\'t go" → "unless you go"'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]), borderRadius: BorderRadius.circular(AppRadius.xl)),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 37 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Sentence Correction — Final Quiz', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('100', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('228', 'Sentences'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Key Rules Tested', style: AppTextStyles.headingMedium),
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
        const SizedBox(height: AppSpacing.lg),
        Container(padding: const EdgeInsets.all(AppSpacing.md), decoration: BoxDecoration(color: AppColors.warning.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.warning.withOpacity(0.3))), child: const Row(children: [
          Text('💡', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Expanded(child: Text('6/10 सही जवाब देने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!', style: AppTextStyles.bodyMedium)),
        ])),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CORRECTION CARD WIDGET
  // ══════════════════════════════════════════════════════════════════════════
  Widget _correctionCard(Map<String, String> item) {
    final isCorrect = item['correct'] == item['wrong'] ||
        item['rule']!.toUpperCase().contains('CORRECT');
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: isCorrect ? AppColors.success.withOpacity(0.3) : AppColors.error.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number + Incorrect sentence
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, 0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 28, height: 28,
                decoration: BoxDecoration(color: isCorrect ? AppColors.success.withOpacity(0.15) : AppColors.error.withOpacity(0.12), shape: BoxShape.circle),
                child: Center(child: Text(item['no']!, style: TextStyle(fontFamily: 'Nunito', fontSize: 10, fontWeight: FontWeight.w700, color: isCorrect ? AppColors.success : AppColors.error))),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('❌  ${item['wrong']!}', style: AppTextStyles.bodyMedium.copyWith(decoration: isCorrect ? null : TextDecoration.lineThrough, color: isCorrect ? AppColors.textPrimary : AppColors.error, fontSize: 13)),
              ])),
            ]),
          ),
          // Correct sentence
          if (!isCorrect) Padding(
            padding: const EdgeInsets.fromLTRB(48, 6, AppSpacing.md, 0),
            child: Row(children: [
              const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 16),
              const SizedBox(width: 6),
              Expanded(child: Text(item['correct']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 13))),
              commonWidgets.ttsButton(item['correct']!, color: AppColors.success),
            ]),
          ),
          // Rule tag
          Padding(
            padding: const EdgeInsets.fromLTRB(48, 6, AppSpacing.md, AppSpacing.md),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.full)),
              child: Text('💡 ${item['rule']!}', style: AppTextStyles.labelSmall.copyWith(color: accentColor, fontSize: 11)),
            ),
          ),
        ],
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPERS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _exerciseHeader(String title, String part, String range, String emoji, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: color.withOpacity(0.3))),
      child: Row(children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTextStyles.headingMedium.copyWith(color: color)),
          Text('$part — Sentences $range', style: AppTextStyles.bodyMedium.copyWith(color: color, fontSize: 12)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(AppRadius.full)),
          child: Text(range, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
        ),
      ]),
    );
  }

  Widget _quotesSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.accentGold.withOpacity(0.06), borderRadius: BorderRadius.circular(AppRadius.lg), border: Border.all(color: AppColors.accentGold.withOpacity(0.3))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text('महान विचार', style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold)),
        ]),
        const SizedBox(height: AppSpacing.md),
        ...Chapter37Data.motivationalQuotes.map((q) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Expanded(child: Text(q['english']!, style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic))),
                  commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                ]),
                const SizedBox(height: 4),
                Text(q['hindi']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ]),
    );
  }
}