import 'package:flutter/material.dart';
import '../../data/chapter3_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter3Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter3Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'सही उच्चारण के बिना किसी भी भाषा का महत्व कम हो जाता है। गलत उच्चारण से शब्द का अर्थ बदल जाता है।',
          'Without proper pronunciation, a language loses its value. Wrong pronunciation changes the meaning of words.',
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.error.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text('⚠️', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text('उदाहरण — फर्क देखिए',
                    style: AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
              ]),
              const SizedBox(height: AppSpacing.sm),
              _pronunciationDiff(
                  'Cheek', 'चीक', 'गाल', 'Chick', 'चिक', 'मुर्गी का बच्चा'),
              const SizedBox(height: 8),
              _pronunciationDiff(
                  'Sleep', 'स्लीप', 'सोना', 'Slip', 'स्लिप', 'फिसलना'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Row(children: [
            const Text('💡', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('"Pronunciation" का सही उच्चारण:',
                    style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
                const SizedBox(height: 4),
                Row(children: [
                  _pronunciationPill('प्रननसिएशन ✅', AppColors.success),
                  const SizedBox(width: 8),
                  _pronunciationPill('प्रनाउनसिएशन ❌', AppColors.error),
                ]),
              ],
            )),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('A का उच्चारण (Pronunciation of A)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.vowelAGroups.map((g) => _buildVowelSoundCard(g)),
      ],
    );
  }

  Widget buildVowelEIContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'E और I के उच्चारण के कई रूप होते हैं। Pattern पहचानना सीखें।',
          'E and I have multiple pronunciation patterns. Learn to identify them.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('E का उच्चारण', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.vowelEGroups.map((g) => _buildVowelSoundCard(g)),
        const SizedBox(height: AppSpacing.lg),
        Text('I का उच्चारण', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.vowelIGroups.map((g) => _buildVowelSoundCard(g)),
      ],
    );
  }

  Widget buildVowelOUContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'O और U के भी कई उच्चारण हैं — context देखकर सही आवाज़ निकालें।',
          'O and U also have many pronunciations — learn to pick the right one from context.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('O का उच्चारण', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.vowelOGroups.map((g) => _buildVowelSoundCard(g)),
        const SizedBox(height: AppSpacing.lg),
        Text('U का उच्चारण', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.vowelUGroups.map((g) => _buildVowelSoundCard(g)),
      ],
    );
  }

  Widget buildSoundsSHContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'कुछ महत्वपूर्ण व्यंजनों के उच्चारण के नियम सीखें — S, SH, TH, C और G।',
          'Learn pronunciation rules for key consonants — S, SH, TH, C and G.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter3Data.consonantSounds.map((s) => _buildConsonantCard(s)),
        const SizedBox(height: AppSpacing.lg),
        Text('S और SH का अंतर', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.sm),
        Text('ध्यान से पढ़ें — एक अक्षर का फर्क बड़ा बदलाव लाता है!',
            style: AppTextStyles.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.svsSHPairs.map((p) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(p['s']!.split(' ')[0]),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(p['s']!,
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.primary, fontSize: 12)),
                  ),
                )),
                const SizedBox(width: 8),
                const Icon(Icons.compare_arrows_rounded,
                    color: AppColors.textHint, size: 18),
                const SizedBox(width: 8),
                Expanded(
                    child: GestureDetector(
                  onTap: () => commonWidgets.onSpeak(p['sh']!.split(' ')[0]),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Text(p['sh']!,
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: AppColors.success, fontSize: 12)),
                  ),
                )),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Text('विशेष अपवाद (Special Exceptions)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.sm),
        Text('S के बाद H न हो फिर भी "श" की आवाज़:',
            style: AppTextStyles.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.shExceptions.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: AppColors.warning.withOpacity(0.25)),
              ),
              child: Row(children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(e['word']!,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: AppColors.warning)),
                      const SizedBox(width: 8),
                      Text('(${e['pronunciation']!})',
                          style: AppTextStyles.bodyMedium.copyWith(
                              color: accentColor, fontSize: 12)),
                    ]),
                    Text(e['meaning']!,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                    Text(e['note']!,
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.warning)),
                  ],
                )),
                commonWidgets.ttsButton(e['word']!, color: AppColors.warning),
              ]),
            )),
      ],
    );
  }

  Widget buildSoundsJZContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"ज" की तीन अलग-अलग ध्वनियाँ होती हैं और S से शुरू होने वाले शब्दों में "इ" नहीं लगाते।',
          'There are 3 types of "j" sounds, and words starting with S never add "i" before them.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('ज की तीन ध्वनियाँ', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.specialSounds.map((s) => _buildConsonantCard(s)),
        const SizedBox(height: AppSpacing.lg),
        Text('S से शुरू होने वाले शब्द', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.error.withOpacity(0.25)),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('🚫', style: TextStyle(fontSize: 20)),
            const SizedBox(width: 8),
            const Expanded(
                child: Text(
              'S से शुरू होने वाले शब्दों में "इ" या "ई" नहीं लगाते!\nDo NOT add "i/e" before words starting with S.',
              style: AppTextStyles.bodyMedium,
            )),
          ]),
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter3Data.sStartWords.map((w) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(w['word']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.primary)),
                        Text(w['meaning']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 11)),
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Text(w['wrong']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.error,
                            decoration: TextDecoration.lineThrough))),
                Expanded(
                    flex: 2,
                    child: Text(w['right']!,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: AppColors.success))),
                commonWidgets.ttsButton(w['right']!, color: AppColors.success),
              ]),
            )),
      ],
    );
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔊', 'title': 'Why Pronunciation Matters', 'hi': 'उच्चारण का महत्व'},
      {'emoji': 'A', 'title': 'Vowel A Sounds', 'hi': 'A → अ, ए, ऐ, आ, ऑ'},
      {'emoji': 'E', 'title': 'Vowel E Sounds', 'hi': 'E → ई, ए'},
      {'emoji': 'I', 'title': 'Vowel I Sounds', 'hi': 'I → इ, आइ, अ, ई'},
      {'emoji': 'O', 'title': 'Vowel O Sounds', 'hi': 'O → ओ, उ, ऊ, अ, ऑ, आउ, ऑइ'},
      {'emoji': 'U', 'title': 'Vowel U Sounds', 'hi': 'U → उ, अ, यू'},
      {'emoji': '🔤', 'title': 'S / SH / TH Sounds', 'hi': 'स, श, द/थ'},
      {'emoji': '🔡', 'title': 'C / G Rules', 'hi': 'C → स/क, G → ग/ज'},
      {'emoji': '⚡', 'title': 'J / Z / ZH Sounds', 'hi': 'ज, ज़, श़'},
      {'emoji': '🚫', 'title': 'S-start Words', 'hi': 'S से शुरू — "इ" नहीं लगाते'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 3 — फ़ाइनल क्विज़',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Chapter 3 — Final Quiz',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('12', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('60', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('10', 'टॉपिक'),
            ]),
          ]),
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
              child: Row(children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Center(
                      child: Text(t['emoji']!,
                          style: TextStyle(
                            fontSize: t['emoji']!.length == 1 ? 16 : 14,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                            color: accentColor,
                          ))),
                ),
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
                )),
                const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 18),
              ]),
            )),
      ],
    );
  }

  // Private helper methods
  Widget _buildVowelSoundCard(Map<String, dynamic> group) {
    final colorMap = {
      'primary': AppColors.primary,
      'success': AppColors.success,
      'accent': AppColors.accent,
      'warning': AppColors.warning,
    };
    final color = colorMap[group['color'] as String] ?? accentColor;
    final examples = group['examples'] as List<dynamic>;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg),
                topRight: Radius.circular(AppRadius.lg),
              ),
            ),
            child: Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(group['sound'] as String,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 14)),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(group['rule'] as String,
                      style: AppTextStyles.labelLarge
                          .copyWith(color: color, fontSize: 13)),
                  Text(group['ruleEn'] as String,
                      style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 11, fontStyle: FontStyle.italic)),
                ],
              )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: examples.map((ex) {
                final e = ex as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () => commonWidgets.onSpeak(e['word'] as String),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(color: color.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(e['word'] as String,
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: color, fontSize: 13)),
                          const SizedBox(width: 4),
                          Icon(Icons.volume_up_rounded,
                              color: color.withOpacity(0.5), size: 12),
                        ]),
                        Text(e['pronunciation'] as String,
                            style: AppTextStyles.bodyMedium.copyWith(
                                fontSize: 11, color: AppColors.primary)),
                        Text(e['meaning'] as String,
                            style: AppTextStyles.bodyMedium.copyWith(
                                fontSize: 10,
                                color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsonantCard(Map<String, dynamic> s) {
    final colorMap = {
      'primary': AppColors.primary,
      'success': AppColors.success,
      'accent': AppColors.accent,
      'warning': AppColors.warning,
    };
    final color = colorMap[s['color'] as String] ?? accentColor;
    final examples = s['examples'] as List<dynamic>;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg),
                topRight: Radius.circular(AppRadius.lg),
              ),
            ),
            child: Row(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(s['pattern'] as String,
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13)),
              ),
              const SizedBox(width: 8),
              if (s.containsKey('symbols'))
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(s['symbols'] as String,
                      style:
                          AppTextStyles.labelSmall.copyWith(color: color)),
                ),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(s['rule'] as String,
                      style: AppTextStyles.bodyMedium
                          .copyWith(fontSize: 12))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: examples.map((ex) {
                final e = ex as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () =>
                              commonWidgets.onSpeak(e['word'] as String),
                          child: Text(e['word'] as String,
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: color, fontSize: 13)),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text(e['pronunciation'] as String,
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.primary, fontSize: 12))),
                    Expanded(
                        flex: 2,
                        child: Text(e['meaning'] as String,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 11))),
                    commonWidgets.ttsButton(e['word'] as String,
                        color: color),
                  ]),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pronunciationDiff(
      String w1, String p1, String m1, String w2, String p2, String m2) {
    return Row(children: [
      Expanded(
          child: GestureDetector(
        onTap: () => commonWidgets.onSpeak(w1),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(w1,
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.success)),
            Text(p1,
                style: AppTextStyles.bodyMedium
                    .copyWith(fontSize: 11, color: AppColors.primary)),
            Text(m1, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
          ]),
        ),
      )),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.swap_horiz_rounded, color: AppColors.textHint),
      ),
      Expanded(
          child: GestureDetector(
        onTap: () => commonWidgets.onSpeak(w2),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(w2,
                style:
                    AppTextStyles.labelLarge.copyWith(color: AppColors.error)),
            Text(p2,
                style: AppTextStyles.bodyMedium
                    .copyWith(fontSize: 11, color: AppColors.primary)),
            Text(m2, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
          ]),
        ),
      )),
    ]);
  }

  Widget _pronunciationPill(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(text,
          style:
              AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
    );
  }
}