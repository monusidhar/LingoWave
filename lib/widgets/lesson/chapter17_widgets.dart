import 'package:flutter/material.dart';
import '../../data/chapter17_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter17Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter17Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Concept 1: Here / There as location words
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'ये टॉपिक बहुत ही आसान है पर तब जब आप इसके कॉन्सेप्ट को अच्छी तरह समझें।',
          'This topic is pretty easy provided you go through its concept thoroughly.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Here vs There card
        Row(
          children: [
            Expanded(child: _locationCard('Here', 'यहाँ', '📍', AppColors.success)),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: _locationCard('There', 'वहाँ', '🗺️', accentColor)),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // Helping verb rules
        Text('Helping Verb Rules', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _thereRulesTable(),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.concept1Examples.map((ex) => _exampleCard(
              ex['hindi']!,
              ex['english']!,
              ex['tense']!,
            )),

        const SizedBox(height: AppSpacing.lg),
        _tipCard(
          '💡 याद रखें',
          '"There" और "Here" वाले वाक्यों में Subject और Object की position बदल सकती है।\n\n'
          '"वहाँ एक पेड़ है।" = "There is a tree." = "A tree is there." — दोनों सही हैं!',
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Concept 2: There replacing missing Subject/Object
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildConcept2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Simple Sentence में Subject और Object में से कोई एक न हो, तो उसकी जगह "There" का प्रयोग करना होगा।',
          'In a Simple Sentence, if either the Subject or Object is missing, "There" is used in its place.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Visual explanation of the concept
        _conceptExplainerCard(),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.concept2Examples.map((ex) => _concept2ExampleCard(
              ex['hindi']!,
              ex['english']!,
              ex['note']!,
            )),

        const SizedBox(height: AppSpacing.lg),
        Text('चारों प्रकार के वाक्य (All 4 Sentence Types)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _fourTypesSection(),

        const SizedBox(height: AppSpacing.lg),
        commonWidgets.phraseGroupHeader(
            '❓', 'WH + There', 'WH word + is/are/was/were + there', accentColor),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.thereWhExamples.map((ex) => _whRow(ex['hindi']!, ex['english']!)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Practice Exercise (50 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए 50 वाक्यों का अनुवाद अंग्रेज़ी में करें। उत्तर देखने के लिए कार्ड पर टैप करें।',
          'Translate all 50 sentences into English. Tap any card to reveal the answer.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statChip('50', 'वाक्य', '📝'),
              _statChip('There is', 'Singular', '🔵'),
              _statChip('There are', 'Plural', '🟢'),
              _statChip('There was/were', 'Past', '⏮️'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('अभ्यास वाक्य (Practice — Hindi → English)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.practiceExercise.asMap().entries.map((e) =>
            _RevealCard(
              no: e.key + 1,
              question: e.value['hindi']!,
              answer: e.value['english']!,
              accentColor: accentColor,
            )),

        const SizedBox(height: AppSpacing.xl),
        _quotesSection(Chapter17Data.motivationalQuotes.sublist(0, 2)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Test Papers
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaperContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'दो टेस्ट पेपर के सभी वाक्य यहाँ दिए गए हैं। अपनी गति से पढ़ें और उत्तर टैप करके देखें।',
          'Both test paper sentences are here. Practice at your own pace — tap to reveal answers.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Test I
        _testSectionHeader('Test Paper — I', 'English → Hindi', '🔄',
            AppColors.primary, '50 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.testI.asMap().entries.map((e) =>
            _RevealCard(
              no: e.key + 1,
              question: e.value['english']!,
              answer: e.value['hindi']!,
              accentColor: accentColor,
              isEnglishFirst: true,
            )),

        const SizedBox(height: AppSpacing.xl),

        // Test II
        _testSectionHeader('Test Paper — II', 'Hindi → English', '📋',
            AppColors.accent, '45 sentences'),
        const SizedBox(height: AppSpacing.md),
        ...Chapter17Data.testII.asMap().entries.map((e) =>
            _RevealCard(
              no: e.key + 1,
              question: e.value['hindi']!,
              answer: e.value['english']!,
              accentColor: accentColor,
            )),

        const SizedBox(height: AppSpacing.xl),
        _quotesSection(Chapter17Data.motivationalQuotes),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '📍', 'title': 'Concept 1 — Here/There', 'hi': 'यहाँ/वहाँ — location'},
      {'emoji': '🔄', 'title': 'Concept 2 — There replacing Subject/Object', 'hi': 'Subject/Object की जगह There'},
      {'emoji': '✍️', 'title': 'Practice Exercise', 'hi': '50 Hindi → English वाक्य'},
      {'emoji': '📝', 'title': 'Test Papers I & II', 'hi': '50 + 45 = 95 sentences'},
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
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 17 — फ़ाइनल क्विज़',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Chapter 17 — Final Quiz',
                  style: TextStyle(
                    fontFamily: 'Nunito', color: Colors.white,
                    fontSize: 22, fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('50', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('4', 'टॉपिक'),
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
                            style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
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
                  'इस क्विज़ में 6/10 या उससे ज़्यादा सही जवाब देने पर अध्याय 18 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 18!',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════════════════

  Widget _locationCard(String word, String hindi, String emoji, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.35), width: 2),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: AppSpacing.sm),
          Text(word,
              style: AppTextStyles.headingLarge.copyWith(color: color)),
          Text(hindi, style: AppTextStyles.bodyMedium.copyWith(fontSize: 13)),
          const SizedBox(height: 6),
          commonWidgets.ttsButton(word, color: color),
        ],
      ),
    );
  }

  Widget _thereRulesTable() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 8),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppRadius.lg - 2),
                topRight: Radius.circular(AppRadius.lg - 2),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 28),
                Expanded(
                    child: Text('Tense',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: accentColor))),
                Expanded(
                    child: Text('Singular\n(There is/was)',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.primary))),
                Expanded(
                    child: Text('Plural\n(There are/were)',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.success))),
              ],
            ),
          ),
          ...Chapter17Data.thereRules.asMap().entries.map((e) {
            final i = e.key;
            final r = e.value;
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                border: i < Chapter17Data.thereRules.length - 1
                    ? const Border(
                        bottom: BorderSide(color: AppColors.lockedBg))
                    : null,
              ),
              child: Row(
                children: [
                  Text(r['emoji']!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r['tense']!,
                            style: AppTextStyles.labelLarge
                                .copyWith(fontSize: 12)),
                        Text(r['tenseHi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 10)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _verbChip(r['singular']!, AppColors.primary),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _verbChip(r['plural']!, AppColors.success),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _exampleCard(String hindi, String english, String tense) {
    final tenseColor = tense == 'Past'
        ? AppColors.primary
        : tense == 'Future'
            ? AppColors.warning
            : AppColors.success;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: accentColor, fontSize: 13)),
                    ),
                    commonWidgets.ttsButton(english.split('/')[0].trim()),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _verbChip(tense, tenseColor),
        ],
      ),
    );
  }

  Widget _conceptExplainerCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(color: accentColor.withOpacity(0.25), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('उदाहरण: "एक राजा था।"',
              style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.md),
          // Subject row
          _svRow('Subject', 'एक राजा (A King)', AppColors.success, true),
          const SizedBox(height: 6),
          // Object row
          _svRow('Object', 'कुछ नहीं है (Missing ❌)', AppColors.error, false),
          const SizedBox(height: AppSpacing.md),
          const Divider(),
          const SizedBox(height: AppSpacing.sm),
          Text('इसलिए Object की जगह "There" लगेगा:',
              style: AppTextStyles.bodyMedium),
          const SizedBox(height: AppSpacing.sm),
          // Two correct forms
          _correctFormRow('A king was there.', '← Object की जगह There'),
          const SizedBox(height: 6),
          _correctFormRow('There was a king.', '← Subject की जगह There, Subject = Object'),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text('✅ दोनों सही हैं!',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.success, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _svRow(String label, String value, Color color, bool found) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(color: color.withOpacity(0.4)),
          ),
          child: Text(label,
              style: AppTextStyles.labelSmall.copyWith(color: color)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(value,
              style: AppTextStyles.bodyMedium.copyWith(
                  color: found ? AppColors.textPrimary : AppColors.error)),
        ),
        Icon(found ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: color, size: 18),
      ],
    );
  }

  Widget _correctFormRow(String english, String note) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: Text(english,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: accentColor, fontSize: 14)),
              ),
              commonWidgets.ttsButton(english),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(note,
              style: AppTextStyles.bodyMedium
                  .copyWith(fontSize: 11, color: AppColors.textSecondary)),
        ),
      ],
    );
  }

  Widget _concept2ExampleCard(String hindi, String english, String note) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                Row(
                  children: [
                    Expanded(
                      child: Text(english,
                          style: AppTextStyles.labelLarge
                              .copyWith(color: accentColor, fontSize: 12)),
                    ),
                    commonWidgets.ttsButton(english.split('/')[0].trim()),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text(note,
                style: AppTextStyles.labelSmall
                    .copyWith(color: accentColor, fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _fourTypesSection() {
    return Column(
      children: Chapter17Data.thereFourTypes.map((row) {
        final typeColors = {
          'Affirmative': AppColors.success,
          'Negative': AppColors.error,
          'Interrogative': AppColors.primary,
          'Negative Interrogative': const Color(0xFF7C3AED),
        };
        final color = typeColors[row['type']] ?? accentColor;
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: color.withOpacity(0.25)),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: 8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.08),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.lg - 2),
                    topRight: Radius.circular(AppRadius.lg - 2),
                  ),
                ),
                child: Row(
                  children: [
                    Text(row['type']!,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: color, fontSize: 13)),
                    const SizedBox(width: 8),
                    Text('(${row['typeHi']!})',
                        style: AppTextStyles.bodyMedium
                            .copyWith(color: color, fontSize: 11)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  children: [
                    _examplePair(row['ex1Hi']!, row['ex1']!),
                    const SizedBox(height: 8),
                    _examplePair(row['ex2Hi']!, row['ex2']!),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _examplePair(String hindi, String english) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(hindi,
              style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(english,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: accentColor, fontSize: 12)),
              ),
              commonWidgets.ttsButton(english),
            ],
          ),
        ),
      ],
    );
  }

  Widget _whRow(String hindi, String english) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium),
                Text(english,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: accentColor, fontSize: 13)),
              ],
            ),
          ),
          commonWidgets.ttsButton(english),
        ],
      ),
    );
  }

  Widget _verbChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(label,
          style: const TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12)),
    );
  }

  Widget _tipCard(String title, String body) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.warning.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.warning)),
          const SizedBox(height: AppSpacing.sm),
          Text(body, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  Widget _statChip(String value, String label, String emoji) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 2),
        Text(value,
            style: AppTextStyles.labelLarge
                .copyWith(color: accentColor, fontSize: 12)),
        Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 10)),
      ],
    );
  }

  Widget _testSectionHeader(
      String title, String subtitle, String emoji, Color color, String badge) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppTextStyles.headingMedium.copyWith(color: color)),
                Text(subtitle,
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: color, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text(badge,
                style: const TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  Widget _quotesSection(List<Map<String, String>> quotes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Text('💡', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Text('महान विचार',
                    style: AppTextStyles.labelLarge
                        .copyWith(color: AppColors.accentGold)),
              ]),
              const SizedBox(height: AppSpacing.md),
              ...quotes.map((q) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Expanded(
                            child: Text(q['english']!,
                                style: AppTextStyles.bodyMedium.copyWith(
                                    fontStyle: FontStyle.italic)),
                          ),
                          commonWidgets.ttsButton(q['english']!,
                              color: AppColors.accentGold),
                        ]),
                        const SizedBox(height: 4),
                        Text(q['hindi']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary, fontSize: 12)),
                        if (q['author']!.isNotEmpty)
                          Text('— ${q['author']!}',
                              style: AppTextStyles.labelSmall
                                  .copyWith(color: AppColors.accentGold)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
// STATEFUL REVEAL CARD — tap to show/hide answer
// ══════════════════════════════════════════════════════════════════════════
class _RevealCard extends StatefulWidget {
  final int no;
  final String question;
  final String answer;
  final Color accentColor;
  final bool isEnglishFirst;

  const _RevealCard({
    required this.no,
    required this.question,
    required this.answer,
    required this.accentColor,
    this.isEnglishFirst = false,
  });

  @override
  State<_RevealCard> createState() => _RevealCardState();
}

class _RevealCardState extends State<_RevealCard> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _revealed = !_revealed),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: _revealed
              ? widget.accentColor.withOpacity(0.06)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: _revealed
                ? widget.accentColor.withOpacity(0.4)
                : AppColors.locked,
            width: _revealed ? 1.5 : 1,
          ),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: widget.accentColor.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text('${widget.no}',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: widget.accentColor)),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.question,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.textPrimary)),
                  if (_revealed) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                      ),
                      child: Text(widget.answer,
                          style: AppTextStyles.labelLarge.copyWith(
                              color: widget.accentColor, fontSize: 13)),
                    ),
                  ] else ...[
                    const SizedBox(height: 4),
                    Text('टैप करें — उत्तर देखें 👆',
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.textHint, fontSize: 11)),
                  ],
                ],
              ),
            ),
            Icon(
              _revealed
                  ? Icons.expand_less_rounded
                  : Icons.expand_more_rounded,
              color: AppColors.textHint,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}