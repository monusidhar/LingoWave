import 'package:flutter/material.dart';
import '../../data/chapter43_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter43Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter43Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

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

  /// Idiom card — number circle + idiom pill + hindi meaning + example with TTS
  Widget _idiomCard(Map<String, String> item, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: number + idiom + hindi badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number circle
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Center(
                  child: Text(item['n']!,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 10)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    // Idiom pill
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(item['idiom']!,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 13)),
                    ),
                    // Hindi meaning badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(item['hindi']!,
                          style: AppTextStyles.labelSmall
                              .copyWith(color: color, fontSize: 11)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Example sentence
          if (item['example']!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.04),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(
                children: [
                  Text('💬 ', style: const TextStyle(fontSize: 13)),
                  Expanded(
                    child: Text(item['example']!,
                        style: AppTextStyles.bodyMedium
                            .copyWith(fontStyle: FontStyle.italic, fontSize: 12)),
                  ),
                  commonWidgets.ttsButton(item['example']!, color: color),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Proverb card — English + Hindi equivalent
  Widget _proverbCard(Map<String, String> item, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: Text(item['n']!,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 10)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(item['english']!,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: color, fontSize: 13)),
                    ),
                    commonWidgets.ttsButton(item['english']!, color: color),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('🇮🇳 ', style: TextStyle(fontSize: 12)),
                    Expanded(
                      child: Text(item['hindi']!,
                          style: AppTextStyles.bodyMedium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── L1: Introduction ──────────────────────────────────────────────────────
  Widget buildIntroContent() {
    final colors = [
      accentColor, AppColors.primary, AppColors.success, AppColors.warning,
      const Color(0xFF7C3AED), AppColors.accent, AppColors.error,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero banner
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
              const Text('📚', style: TextStyle(fontSize: 44)),
              const SizedBox(height: AppSpacing.sm),
              const Text('Idioms & Proverbs',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900)),
              const Text('मुहावरे और कहावतें',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('59', 'Idioms'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('25', 'Proverbs'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('7', 'Categories'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: const Text(
            'Just a few Idioms, Proverbs & Quotations are given here. Cram them to enhance your English speaking skills.\n\n'
            'यहाँ कुछ Idioms और Proverbs दिए गए हैं। इन्हें रट लें और जब–जब मौका मिले, इनका प्रयोग करें।',
            style: AppTextStyles.bodyMedium,
          ),
        ),

        _sectionHeader('Categories — Idioms by Topic', badge: '7 groups'),

        ...Chapter43Data.categories.asMap().entries.map((e) {
          final i = e.key;
          final cat = e.value;
          final c = colors[i % colors.length];
          final idiomList = (cat['idioms'] as List).cast<String>();
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: c.withOpacity(0.05),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(cat['emoji'] as String,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cat['label'] as String,
                              style: AppTextStyles.labelLarge.copyWith(color: c)),
                          Text(cat['labelHindi'] as String,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(fontSize: 11)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: idiomList.map((idiom) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: c.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(idiom,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: c, fontSize: 10)),
                      )).toList(),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L2: Idioms Part A (1–20) ──────────────────────────────────────────────
  Widget buildIdiomsAContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'पहले 20 मुहावरे — इन्हें पढ़ें, समझें और उदाहरण वाक्यों को ध्यान से सुनें।',
          'First 20 idioms — read, understand and listen to example sentences carefully.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('1–20', 'Idioms'),
              commonWidgets.quizStatBadge('💬', 'Example'),
              commonWidgets.quizStatBadge('🔊', 'TTS'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter43Data.idiomsPartA.asMap().entries.map((e) =>
            _idiomCard(e.value, accentColor)),
      ],
    );
  }

  // ─── L3: Idioms Part B (21–40) ─────────────────────────────────────────────
  Widget buildIdiomsBContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'मुहावरे 21–40 — इनमें से कई रोज़मर्रा की बातचीत में बहुत काम आते हैं।',
          'Idioms 21–40 — many of these are extremely useful in daily conversation.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('21–40', 'Idioms'),
              commonWidgets.quizStatBadge('💬', 'Example'),
              commonWidgets.quizStatBadge('🔊', 'TTS'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter43Data.idiomsPartB.asMap().entries.map((e) =>
            _idiomCard(e.value, AppColors.primary)),
      ],
    );
  }

  // ─── L4: Idioms Part C (41–59) ─────────────────────────────────────────────
  Widget buildIdiomsCContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'मुहावरे 41–59 — अंतिम 19 मुहावरे। इन्हें याद करके आपकी English बहुत प्रभावशाली बनेगी।',
          'Idioms 41–59 — the final 19. Memorising these will make your English very impressive.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.success, AppColors.success.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('41–59', 'Idioms'),
              commonWidgets.quizStatBadge('💬', 'Example'),
              commonWidgets.quizStatBadge('🔊', 'TTS'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter43Data.idiomsPartC.asMap().entries.map((e) =>
            _idiomCard(e.value, AppColors.success)),
      ],
    );
  }

  // ─── L5: Proverbs ──────────────────────────────────────────────────────────
  Widget buildProverbsContent() {
    final colors = [
      AppColors.warning, AppColors.accentGold, const Color(0xFF7C3AED),
      AppColors.accent, AppColors.primary, accentColor, AppColors.success,
      AppColors.error, AppColors.warning, AppColors.accentGold,
      const Color(0xFF7C3AED), AppColors.accent, AppColors.primary,
      accentColor, AppColors.success, AppColors.error, AppColors.warning,
      AppColors.accentGold, const Color(0xFF7C3AED), AppColors.accent,
      AppColors.primary, accentColor, AppColors.success, AppColors.error,
      AppColors.warning,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '25 कहावतें (Proverbs) — इन्हें याद करें और अपनी बातचीत में इस्तेमाल करें।',
          '25 Proverbs — memorise them and use in your daily conversations.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.warning, AppColors.warning.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('25', 'Proverbs'),
              commonWidgets.quizStatBadge('🇮🇳', 'Hindi'),
              commonWidgets.quizStatBadge('🔊', 'TTS'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter43Data.proverbs.asMap().entries.map((e) =>
            _proverbCard(e.value, colors[e.key % colors.length])),
      ],
    );
  }

  // ─── L6: Chapter Quiz Intro ────────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '💡', 'title': 'Introduction & Categories',  'hi': '7 topic categories'},
      {'emoji': '📖', 'title': 'Idioms Part A (1–20)',       'hi': 'Abide by → Break the ice'},
      {'emoji': '📗', 'title': 'Idioms Part B (21–40)',      'hi': 'Cut no ice → Nook and corner'},
      {'emoji': '📘', 'title': 'Idioms Part C (41–59)',      'hi': 'Once for all → Look down upon'},
      {'emoji': '🌿', 'title': 'Proverbs (1–25)',            'hi': '25 English–Hindi कहावतें'},
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
              const Text('अध्याय 43 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Idioms & Proverbs',
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
                  commonWidgets.quizStatBadge('84', 'Total items'),
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
                  '6/10 या उससे अधिक अंक लाने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
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