import 'package:flutter/material.dart';
import '../../data/chapter38_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter38Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter38Widgets({required this.commonWidgets, required this.accentColor});

  // ─── Core translation tile ─────────────────────────────────────────────────
  Widget _translationTile(int number, String hindi, String english,
      String conceptTag, Color color) {
    final dot = hindi.indexOf('. ');
    final hindiClean = (dot != -1 && dot < 5) ? hindi.substring(dot + 2) : hindi;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.15)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hindi question row
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.06),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.lg)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number badge
                Container(
                  width: 28, height: 28,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                  child: Center(
                    child: Text('$number',
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hindiClean,
                          style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                // Concept tag badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    border: Border.all(color: color.withOpacity(0.3)),
                  ),
                  child: Text(conceptTag,
                      style: AppTextStyles.labelSmall
                          .copyWith(color: color, fontSize: 9)),
                ),
              ],
            ),
          ),
          // English answer row
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🇬🇧 ',
                    style: TextStyle(fontSize: 14)),
                Expanded(
                  child: Text(english,
                      style: AppTextStyles.labelLarge
                          .copyWith(color: color, fontSize: 13)),
                ),
                commonWidgets.ttsButton(
                    english.split('/').first.trim(), color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroBanner(String emoji, String title, String subtitle, Color color,
      List<String> stats) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [color, color.withOpacity(0.75)]),
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 6),
          Text(title,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800)),
          Text(subtitle,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white70,
                  fontSize: 12)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: stats
                .map((s) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(s,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  // ─── L1: Set 1 (Q 1–30) ───────────────────────────────────────────────────
  Widget buildSet1Content() {
    final sentences = Chapter38Data.set1Sentences;
    final tags = Chapter38Data.set1ConceptTags;
    final colors = [
      accentColor, AppColors.primary, AppColors.success,
      AppColors.warning, const Color(0xFF7C3AED), AppColors.accent,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'निम्नलिखित हिंदी वाक्यों का अंग्रेज़ी अनुवाद करें। हर वाक्य में एक concept है — पहचानें और याद करें।',
          'Translate the following Hindi sentences into English. Each sentence tests a specific concept.',
        ),
        _heroBanner('🔄', 'Set 1 — Passive & Tenses', 'Q 1–30',
            accentColor, ['30', 'वाक्य', 'Mixed']),
        ...sentences.asMap().entries.map((e) {
          final i = e.key;
          final s = e.value;
          final tag = i < tags.length ? tags[i] : '';
          return _translationTile(
              i + 1,
              s['hindi']!,
              s['english']!,
              tag,
              colors[i % colors.length]);
        }),
      ],
    );
  }

  // ─── L2: Set 2 (Q 31–60) ──────────────────────────────────────────────────
  Widget buildSet2Content() {
    final sentences = Chapter38Data.set2Sentences;
    final tags = Chapter38Data.set2ConceptTags;
    final colors = [
      AppColors.primary, AppColors.success, AppColors.warning,
      const Color(0xFF7C3AED), AppColors.error, AppColors.accentGold,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Set 2 में Conditional, Causative, Comparisons, Reported Speech और Passive के मिश्रित वाक्य हैं।',
          'Set 2 contains mixed sentences covering Conditional, Causative, Comparisons, Reported Speech & Passive.',
        ),
        _heroBanner('🧩', 'Set 2 — Mixed Concepts', 'Q 31–60',
            AppColors.primary, ['30', 'वाक्य', 'Mixed']),
        ...sentences.asMap().entries.map((e) {
          final i = e.key;
          final s = e.value;
          final tag = i < tags.length ? tags[i] : '';
          return _translationTile(
              i + 31,
              s['hindi']!,
              s['english']!,
              tag,
              colors[i % colors.length]);
        }),
      ],
    );
  }

  // ─── L3: Set 3 (Q 61–90) ──────────────────────────────────────────────────
  Widget buildSet3Content() {
    final sentences = Chapter38Data.set3Sentences;
    final tags = Chapter38Data.set3ConceptTags;
    final colors = [
      AppColors.success, const Color(0xFF7C3AED), AppColors.error,
      accentColor, AppColors.warning, AppColors.primary,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Set 3 में advanced sentences हैं — Comparatives, Possessives, "It takes", Modals और special structures।',
          'Set 3 has advanced sentences — Comparatives, Possessives, "It takes", Modals & special structures.',
        ),
        _heroBanner('🎯', 'Set 3 — Advanced', 'Q 61–90',
            AppColors.success, ['30', 'वाक्य', 'Advanced']),
        ...sentences.asMap().entries.map((e) {
          final i = e.key;
          final s = e.value;
          final tag = i < tags.length ? tags[i] : '';
          return _translationTile(
              i + 61,
              s['hindi']!,
              s['english']!,
              tag,
              colors[i % colors.length]);
        }),
      ],
    );
  }

  // ─── L4: Chapter Quiz Intro ────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    // Concept coverage grid
    final concepts = [
      {'emoji': '🔄', 'title': 'Passive Voice', 'hi': 'was/were + V3, being, been', 'color': accentColor},
      {'emoji': '⏰', 'title': 'All Tenses', 'hi': 'used to, has been, had + V3', 'color': AppColors.primary},
      {'emoji': '🤔', 'title': 'Modals', 'hi': 'might have, must have, should be', 'color': AppColors.success},
      {'emoji': '🔒', 'title': 'Let / Causative', 'hi': 'let + V1, don\'t let, let me', 'color': AppColors.warning},
      {'emoji': '📊', 'title': 'Comparisons', 'hi': 'older than, stronger than, eldest among', 'color': const Color(0xFF7C3AED)},
      {'emoji': '📝', 'title': 'Reported Speech', 'hi': 'would, was told, had said', 'color': AppColors.error},
      {'emoji': '🔗', 'title': 'Gerunds', 'hi': 'Watching TV is..., Winning has become...', 'color': AppColors.accentGold},
      {'emoji': '⏱️', 'title': 'It takes / took', 'hi': '10 minutes, 25 years', 'color': AppColors.accent},
      {'emoji': '💭', 'title': 'Conditionals', 'hi': 'If I came, I would...', 'color': accentColor},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 38 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white70,
                      fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Mixed Practice — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10', 'प्रश्न'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('100', 'XP'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('90', 'वाक्य'),
              ]),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // 3-set stat row
        Row(
          children: [
            _miniStatBox('30', 'Set 1\nPassive & Tenses', accentColor),
            const SizedBox(width: AppSpacing.sm),
            _miniStatBox('30', 'Set 2\nMixed', AppColors.primary),
            const SizedBox(width: AppSpacing.sm),
            _miniStatBox('30', 'Set 3\nAdvanced', AppColors.success),
          ],
        ),

        const SizedBox(height: AppSpacing.lg),
        Text('इस अध्याय में Cover किये गये Concepts',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),

        // Concepts grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.1,
          ),
          itemCount: concepts.length,
          itemBuilder: (context, i) {
            final c = concepts[i];
            final color = c['color'] as Color;
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: color.withOpacity(0.25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(c['emoji'] as String,
                      style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 3),
                  Text(c['title'] as String,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.labelLarge
                          .copyWith(color: color, fontSize: 10)),
                  Text(c['hi'] as String,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyMedium
                          .copyWith(fontSize: 9)),
                ],
              ),
            );
          },
        ),

        const SizedBox(height: AppSpacing.lg),

        // Key patterns quick reference
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('📌 Key Passive Patterns',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: AppSpacing.sm),
              _patternRow('Present', 'is/are + being + V3', accentColor),
              _patternRow('Past Simple', 'was/were + V3', AppColors.primary),
              _patternRow('Past Continuous', 'was/were + being + V3', AppColors.success),
              _patternRow('Past Perfect', 'had been + V3', AppColors.warning),
              _patternRow('Future', 'will be + V3', const Color(0xFF7C3AED)),
              _patternRow('Modal', 'can/should + be + V3', AppColors.error),
              _patternRow('Let Passive', 'will be let + V1', AppColors.accentGold),
            ],
          ),
        ),

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
                '6/10 या उससे अधिक अंक लाने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget _miniStatBox(String value, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Column(children: [
          Text(value,
              style: AppTextStyles.displayMedium.copyWith(color: color)),
          Text(label,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
        ]),
      ),
    );
  }

  Widget _patternRow(String label, String pattern, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(label,
                style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: Text(pattern,
                  style: AppTextStyles.labelSmall
                      .copyWith(color: color, fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}