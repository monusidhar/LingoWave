import 'package:flutter/material.dart';
import '../../data/chapter25_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter25Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter25Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _ruleBox(String text, {String? emoji}) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.25)),
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

  Widget _practiceTile(int number, String hindi, String english, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
                Text(hindi, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: color, fontSize: 12)),
                    ),
                    commonWidgets.ttsButton(english, color: color),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _testTile(int number, String english, String hindi, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
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
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: color, fontSize: 12)),
                    ),
                    commonWidgets.ttsButton(english, color: color),
                  ],
                ),
                const SizedBox(height: 4),
                Text(hindi, style: AppTextStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _practiceSetCard({
    required String title,
    required String subtitle,
    required Color color,
    required List<Map<String, String>> data,
    required int startIndex,
    bool reversed = false,
  }) {
    return commonWidgets.sectionCard(
      title: title,
      subtitle: subtitle,
      color: color,
      child: Column(
        children: data.asMap().entries.map((e) {
          final raw = e.value[reversed ? 'english' : 'hindi']!;
          final dotIdx = raw.indexOf('. ');
          final primary = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
          final secondary = e.value[reversed ? 'hindi' : 'english']!;
          return reversed
              ? _testTile(startIndex + e.key, primary, secondary, color)
              : _practiceTile(startIndex + e.key, primary, secondary, color);
        }).toList(),
      ),
    );
  }

  // ─── L1: Concept & Intro ─────────────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'जब Subject काम खुद नहीं करता बल्कि किसी तीसरे व्यक्ति के माध्यम से करवाता है — ऐसे वाक्यों में Causative Verbs (Get या Make) का प्रयोग होता है।',
          'Causative Verbs are used when the subject gets work done through a third person — not by himself.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Hero banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('⚙️', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              const Text('Causative Verbs',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _causativeBadge('📦', 'GET', 'Non-living\nनिर्जीव', AppColors.success),
                  Container(width: 1, height: 50, color: Colors.white30),
                  _causativeBadge('👤', 'MAKE', 'Living\nसजीव', AppColors.accentGold),
                ],
              ),
            ],
          ),
        ),

        _sectionHeader('Normal vs Causative', badge: '7 pairs'),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: [
              _tableHeader(),
              ...Chapter25Data.normalVsCausative.asMap().entries.map((e) {
                return _tableRow(
                    e.key,
                    e.value['normal']!,
                    e.value['causative']!,
                    e.key == Chapter25Data.normalVsCausative.length - 1);
              }),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        _ruleBox(
          'याद रखें:\n'
          '• GET = निर्जीव चीज़ों के साथ (letter, car, hair, work...)\n'
          '• MAKE = सजीव के साथ (me, you, him, Ram, children...)\n'
          '• GET के बाद दूसरी verb की 3rd form\n'
          '• MAKE के बाद दूसरी verb की 1st form',
          emoji: '💡',
        ),
      ],
    );
  }

  Widget _causativeBadge(String emoji, String label, String sub, Color color) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                fontFamily: 'Nunito',
                color: color,
                fontWeight: FontWeight.w900,
                fontSize: 18)),
        Text(sub,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'Nunito', color: Colors.white70, fontSize: 11)),
      ],
    );
  }

  Widget _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.08),
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text('साधारण (Normal)',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.textSecondary, fontSize: 12))),
          Expanded(
              child: Text('Causative',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: accentColor, fontSize: 12))),
        ],
      ),
    );
  }

  Widget _tableRow(int i, String normal, String causative, bool isLast) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: AppColors.lockedBg)),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(normal,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.textSecondary))),
          Expanded(
              child: Text(causative,
                  style: AppTextStyles.labelLarge
                      .copyWith(color: accentColor, fontSize: 13))),
        ],
      ),
    );
  }

  // ─── L2: GET ──────────────────────────────────────────────────────────────
  Widget buildGetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Get" का प्रयोग निर्जीव चीज़ों (non-living) के साथ होता है। दूसरी Main Verb की 3rd form (past participle) लगती है।',
          '"Get" is used with non-living things. The second verb takes its 3rd form (past participle).',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule card
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.success.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('📦', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  Text('GET — Formula',
                      style: AppTextStyles.headingMedium
                          .copyWith(color: AppColors.success)),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.success,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text(
                  'Sub + Get/Gets/Got/Getting + Object (non-living) + V3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Example: Ram gets the letter written.\n(पत्र = non-living → Get, written = V3)',
                style:
                    AppTextStyles.bodyMedium.copyWith(color: AppColors.success),
              ),
            ],
          ),
        ),

        _sectionHeader('सभी Tenses में GET', badge: '10 examples'),
        ...Chapter25Data.getExamples.asMap().entries.map((e) {
          final i = e.key;
          final ex = e.value;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.success.withOpacity(0.2)),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.success, shape: BoxShape.circle),
                  child: Center(
                    child: Text('${i + 1}',
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(ex['tense']!,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.success)),
                      ),
                      const SizedBox(height: 4),
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(ex['english']!,
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.success, fontSize: 12)),
                          ),
                          commonWidgets.ttsButton(ex['english']!,
                              color: AppColors.success),
                        ],
                      ),
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

  // ─── L3: MAKE ─────────────────────────────────────────────────────────────
  Widget buildMakeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Make" का प्रयोग सजीव (living beings) के साथ होता है। दूसरी Main Verb की 1st form (bare infinitive) लगती है।',
          '"Make" is used with living beings. The second verb takes its 1st form (bare infinitive).',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Rule card
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('👤', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  Text('MAKE — Formula',
                      style: AppTextStyles.headingMedium
                          .copyWith(color: AppColors.accentGold)),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.accentGold,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text(
                  'Sub + Make/Makes/Made/Making + Object (living) + V1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Example: Ram makes me write.\n(मैं = living → Make, write = V1)',
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.accentGold),
              ),
            ],
          ),
        ),

        _sectionHeader('Examples — Make', badge: '8 examples'),
        ...Chapter25Data.makeExamples.asMap().entries.map((e) {
          final i = e.key;
          final ex = e.value;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.accentGold.withOpacity(0.2)),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppColors.accentGold, shape: BoxShape.circle),
                  child: Center(
                    child: Text('${i + 1}',
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(ex['note']!,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.accentGold)),
                      ),
                      const SizedBox(height: 4),
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(ex['english']!,
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.accentGold,
                                    fontSize: 12)),
                          ),
                          commonWidgets.ttsButton(ex['english']!,
                              color: AppColors.accentGold),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Beat vs Be Beaten:\n'
          '• किसी को पीटना = beat (V1)\n'
          '• किसी से पिटना = be beaten\n\n'
          'मैं राम को तुमसे पिटवाऊँगा → I will make you beat Ram.\n'
          'मैं तुम्हें पिटवाऊँगा → I will make you be beaten.',
          emoji: '⚠️',
        ),

        _sectionHeader('Get + Make — दोनों संभव', badge: '5 examples'),
        ...Chapter25Data.getBothExamples.asMap().entries.map((e) {
          final ex = e.value;
          final isBoth = ex['type'] == 'Both possible';
          final c = isBoth ? AppColors.primary : accentColor;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: isBoth ? AppColors.primary.withOpacity(0.06) : AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: c.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 3),
                      Text(ex['english']!,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: c, fontSize: 12)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(ex['type']!,
                      style:
                          AppTextStyles.labelSmall.copyWith(color: c, fontSize: 9)),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L4: Special Make Words ───────────────────────────────────────────────
  Widget buildSpecialContent() {
    final specialWords = [
      'smile', 'laugh', 'cry', 'weep', 'understand', 'happy', 'sad',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'कुछ खास शब्दों के साथ हमेशा "Make" का ही प्रयोग होता है — चाहे subject कुछ भी हो।',
          'Certain special words always use "Make" — regardless of who the subject is.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Special words banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0xFFFF6B6B), const Color(0xFFFF8E53)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              const Text('😊',
                  style: TextStyle(fontSize: 36)),
              const SizedBox(height: 8),
              const Text('Always use "MAKE" with:',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: specialWords
                    .map((w) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(w,
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),

        _sectionHeader('Examples', badge: '5 sentences'),
        ...Chapter25Data.specialMakeWords.asMap().entries.map((e) {
          final i = e.key;
          final ex = e.value;
          final colors = [
            const Color(0xFFFF6B6B),
            AppColors.accentGold,
            AppColors.primary,
            AppColors.success,
            const Color(0xFF7C3AED),
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
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                  child: Center(
                    child: Text('${i + 1}',
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
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: c.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.full),
                            ),
                            child: Text('make + ${ex['word']!}',
                                style: AppTextStyles.labelSmall
                                    .copyWith(color: c)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(ex['english']!,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: c, fontSize: 12)),
                          ),
                          commonWidgets.ttsButton(ex['english']!, color: c),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Quick comparison:\n'
          '• "Make" always for emotions and states.\n'
          '• Make someone happy / sad / angry / understand / laugh / cry / smile / weep.\n\n'
          '✗ Get you happy (wrong)\n'
          '✓ Make you happy (correct)',
          emoji: '📌',
        ),
      ],
    );
  }

  // ─── L5: Practice Exercise ────────────────────────────────────────────────
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में Causative Verbs Get & Make के 85 अभ्यास वाक्य हैं।',
          'Practice 85 sentences using Causative Verbs — Get & Make.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('85', 'वाक्य'),
              commonWidgets.quizStatBadge('4', 'सेट'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
            title: 'सेट 1', subtitle: 'Q 1–25', color: accentColor,
            data: Chapter25Data.practiceSet1, startIndex: 1),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 2', subtitle: 'Q 26–50', color: AppColors.primary,
            data: Chapter25Data.practiceSet2, startIndex: 26),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 3', subtitle: 'Q 51–75', color: AppColors.success,
            data: Chapter25Data.practiceSet3, startIndex: 51),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
            title: 'सेट 4', subtitle: 'Q 76–85', color: AppColors.warning,
            data: Chapter25Data.practiceSet4, startIndex: 76),
      ],
    );
  }

  // ─── L6: Test Paper I ─────────────────────────────────────────────────────
  Widget buildTestPaper1Content() {
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
              const Text('📝', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र I',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper I — English → Hindi',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('50', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('50 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Eng→Hindi', 'दिशा'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: Hindi में अनुवाद करें',
          subtitle: '1–25',
          color: accentColor,
          data: Chapter25Data.testPaper1Sentences.sublist(0, 25),
          startIndex: 1,
          reversed: true,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'Q1: Hindi में अनुवाद करें (जारी)',
          subtitle: '26–50',
          color: AppColors.primary,
          data: Chapter25Data.testPaper1Sentences.sublist(25),
          startIndex: 26,
          reversed: true,
        ),
      ],
    );
  }

  // ─── L7: Test Paper II ────────────────────────────────────────────────────
  Widget buildTestPaper2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('📋', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र II',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper II — English → Hindi',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('30', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('30 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Eng→Hindi', 'दिशा'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'Q1: Hindi में अनुवाद करें',
          subtitle: '1–30',
          color: AppColors.primary,
          data: Chapter25Data.testPaper2Sentences,
          startIndex: 1,
          reversed: true,
        ),
      ],
    );
  }

  // ─── L8: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '⚙️', 'title': 'Causative Verbs — Concept', 'hi': 'करवाना — Get और Make'},
      {'emoji': '📐', 'title': 'GET Rule: Non-living + V3', 'hi': 'निर्जीव + 3rd form'},
      {'emoji': '👤', 'title': 'MAKE Rule: Living + V1', 'hi': 'सजीव + 1st form'},
      {'emoji': '😊', 'title': 'Special Make Words', 'hi': 'smile, cry, happy, understand...'},
      {'emoji': '⚔️', 'title': 'Beat vs Be Beaten', 'hi': 'पीटना बनाम पिटना'},
      {'emoji': '✍️', 'title': 'Practice — 85 sentences', 'hi': '85 अभ्यास वाक्य'},
      {'emoji': '📝', 'title': 'Test Papers I & II', 'hi': 'Eng→Hindi 50+30 sentences'},
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
              const Text('अध्याय 25 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Causative Verbs — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('100', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('7', 'टॉपिक'),
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
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 12)),
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 26 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 26!',
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