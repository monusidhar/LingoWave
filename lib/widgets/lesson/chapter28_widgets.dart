import 'package:flutter/material.dart';
import '../../data/chapter28_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter28Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter28Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _ruleBox(String text, {String? emoji, Color? color}) {
    final c = color ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: c.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji ?? '📌', style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, {String badge = ''}) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: AppTextStyles.headingMedium)),
          if (badge.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(badge,
                  style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
            ),
        ],
      ),
    );
  }

  // ─── L1: What are Fillers? ─────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Definition banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('💬', style: TextStyle(fontSize: 44)),
              const SizedBox(height: AppSpacing.sm),
              const Text('Fillers',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900)),
              const SizedBox(height: 4),
              const Text('अटकाव के शब्द',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text(
                  '"um", "like", "you know", "it\'s like",\n"I mean", "actually", "basically", "well" etc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Hindi explanation
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('हिंदी में समझें',
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Fillers ऐसे शब्द या शब्दों के समूह होते हैं जो ऐसे वक्त में प्रयोग किये जाते हैं जब अंग्रेजी में बात करते हुए हम अचानक बीच में कहीं अटक जाते हैं। इनसे हमें थोड़ा वक्त मिल जाता है और दूसरे व्यक्ति को ऐसा भी महसूस नहीं होता कि हम अटक गये थे।',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // English explanation
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('English में समझें',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Fillers are nothing but a few words that help us to take some time before uttering the next word/sentence. While speaking, sometimes the accurate word doesn\'t strike immediately and then it becomes useful to use fillers so that the fluency is not broken.',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Do / Don't cards
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.success.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    const Text('✅', style: TextStyle(fontSize: 28)),
                    const SizedBox(height: 6),
                    Text('कब ठीक है',
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
                    const SizedBox(height: 4),
                    Text('Casual /\nInformal\nbatceet',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.error.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    const Text('❌', style: TextStyle(fontSize: 28)),
                    const SizedBox(height: 6),
                    Text('कब avoid करें',
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
                    const SizedBox(height: 4),
                    Text('Interview /\nProfessional /\nFormal',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.lg),

        // Ram example block
        _sectionHeader('उदाहरण — "Ram is illiterate" के साथ', badge: '7 fillers'),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Text(
                  'अचानक "illiterate" शब्द याद नहीं आया...',
                  style: AppTextStyles.bodyMedium.copyWith(color: accentColor),
                ),
              ),
              ...[
                'Ram is um….. illiterate.',
                'Ram is like….. illiterate.',
                'Ram is you know….. illiterate.',
                'Ram is I mean….. illiterate.',
                'Ram is actually….. illiterate.',
                'Ram is basically….. illiterate.',
              ].map((s) {
                // Extract filler (between "is " and "…..")
                final parts = s.split('…');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_right_rounded,
                          color: AppColors.textHint, size: 18),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            style: AppTextStyles.bodyMedium,
                            children: [
                              const TextSpan(text: 'Ram is '),
                              TextSpan(
                                text: s
                                    .replaceAll('Ram is ', '')
                                    .replaceAll('….. illiterate.', ''),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(text: '….. illiterate.'),
                            ],
                          ),
                        ),
                      ),
                      commonWidgets.ttsButton(s, color: accentColor),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L2: Common Fillers ────────────────────────────────────────────────────
  Widget buildCommonFillersContent() {
    final colors = [
      accentColor,
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      const Color(0xFF7C3AED),
      AppColors.accent,
      AppColors.error,
      AppColors.accentGold,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये हैं सबसे ज़्यादा प्रयोग होने वाले Fillers — इन्हें पहचानें, समझें और सुनें।',
          'These are the most commonly used Fillers — recognize, understand and listen to them.',
        ),
        const SizedBox(height: AppSpacing.lg),

        ...Chapter28Data.fillersData.asMap().entries.map((e) {
          final i = e.key;
          final f = e.value;
          final c = colors[i % colors.length];
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.3)),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Emoji circle
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(f['emoji']!,
                        style: const TextStyle(fontSize: 22)),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: c,
                              borderRadius: BorderRadius.circular(AppRadius.full),
                            ),
                            child: Text(f['filler']!,
                                style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13)),
                          ),
                          const SizedBox(width: 8),
                          Text('= ${f['hindi']!}',
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: AppColors.textPrimary, fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(f['use']!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                ),
                commonWidgets.ttsButton(f['filler']!, color: c),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'याद रखो — Fillers का प्रयोग पूरी तरह गलत नहीं है!\n'
          'हर बार बात करते वक्त एकदम सही शब्द दिमाग में आये ऐसा जरूरी नहीं।\n'
          'पर Interview या formal conversation में इन्हें avoid करें।',
          emoji: '💡',
          color: AppColors.warning,
        ),
      ],
    );
  }

  // ─── L3: Fillers in Sentences ─────────────────────────────────────────────
  Widget buildInSentencesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'देखें कि Fillers वाक्यों में कहाँ और कैसे आते हैं। Filler underline किया गया है।',
          'See where and how Fillers appear in sentences. The filler is underlined.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Placement guide
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filler कहाँ लगता है?',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: AppSpacing.sm),
              _placementRow('🔵', 'वाक्य के शुरू में', '"Ummm, I think..."'),
              const SizedBox(height: 4),
              _placementRow('🟢', 'वाक्य के बीच में', '"She is, you know, not good."'),
              const SizedBox(height: 4),
              _placementRow('🟡', 'Subject और Verb के बीच',
                  '"Ram is um..... illiterate."'),
            ],
          ),
        ),

        _sectionHeader('उदाहरण (Examples)', badge: '13'),

        ...Chapter28Data.examplesData.asMap().entries.map((e) {
          final i = e.key;
          final ex = e.value;
          final colors = [
            accentColor, AppColors.primary, AppColors.success,
            AppColors.warning, const Color(0xFF7C3AED), AppColors.accent,
            AppColors.error, AppColors.accentGold,
          ];
          final c = colors[i % colors.length];
          final sentence = ex['sentence']!;
          final filler = ex['filler']!;

          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: c.withOpacity(0.2)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Number + filler badge
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: c.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text('Filler: $filler',
                          style: AppTextStyles.labelSmall.copyWith(color: c)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // English with underlined filler
                Row(
                  children: [
                    Expanded(
                      child: _buildSentenceWithFiller(sentence, filler, c),
                    ),
                    commonWidgets.ttsButton(sentence, color: c),
                  ],
                ),
                // Hindi
                const SizedBox(height: 4),
                Text(ex['hindi']!,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildSentenceWithFiller(String sentence, String filler, Color color) {
    final idx = sentence.toLowerCase().indexOf(filler.toLowerCase());
    if (idx == -1) {
      return Text(sentence, style: AppTextStyles.labelLarge.copyWith(fontSize: 13));
    }
    return Text.rich(
      TextSpan(
        style: AppTextStyles.labelLarge.copyWith(fontSize: 13),
        children: [
          TextSpan(text: sentence.substring(0, idx)),
          TextSpan(
            text: sentence.substring(idx, idx + filler.length),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(text: sentence.substring(idx + filler.length)),
        ],
      ),
    );
  }

  Widget _placementRow(String emoji, String label, String example) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodyMedium,
              children: [
                TextSpan(
                    text: '$label — ',
                    style: const TextStyle(fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary)),
                TextSpan(
                    text: example,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─── L4: Quotations ───────────────────────────────────────────────────────
  Widget buildQuotationsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'महान व्यक्तियों द्वारा कही गई प्रेरणादायक बातें।',
          'Inspiring quotations by great personalities.',
        ),
        const SizedBox(height: AppSpacing.lg),

        ...Chapter28Data.quotations.asMap().entries.map((e) {
          final i = e.key;
          final q = e.value;
          final colors = [
            accentColor, AppColors.primary, AppColors.success,
            AppColors.warning, const Color(0xFF7C3AED), AppColors.accent,
          ];
          final c = colors[i % colors.length];

          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.25)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30, height: 30,
                      decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 13)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(q['english']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: c, fontSize: 13)),
                          ),
                          commonWidgets.ttsButton(q['english']!, color: c),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(q['hindi']!, style: AppTextStyles.bodyMedium),
                      if (q.containsKey('author')) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: c.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text('— ${q['author']!}',
                              style: AppTextStyles.labelSmall.copyWith(color: c)),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L5: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '💬', 'title': 'What are Fillers?', 'hi': 'परिभाषा, उद्देश्य और नियम'},
      {'emoji': '🗣️', 'title': 'Common Fillers (8)', 'hi': 'Um, Like, You know, I mean, Actually, Basically, Well, It\'s like'},
      {'emoji': '📝', 'title': 'Fillers in Sentences', 'hi': 'वाक्यों में filler की position'},
      {'emoji': '✅', 'title': 'When to use / avoid', 'hi': 'Informal ✅ / Formal ❌'},
      {'emoji': '✨', 'title': 'Quotations (6)', 'hi': 'Gandhi, Einstein, Mandela & more'},
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
              const Text('अध्याय 28 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Fillers — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('100', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('5', 'टॉपिक'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
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
              child: Row(
                children: [
                  Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['title']!, style: AppTextStyles.labelLarge),
                        Text(t['hi']!,
                            style:
                                AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle_rounded,
                      color: AppColors.success, size: 18),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(
            children: [
              Text('💡', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 29 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 29!',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}