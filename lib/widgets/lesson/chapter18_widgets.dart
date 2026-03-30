import 'package:flutter/material.dart';
import '../../data/chapter18_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter18Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter18Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Position Words
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildPositionWordsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'स्थिति और दिशा बताने के लिए इन शब्दों का प्रयोग करें।',
          'Use these words to describe position and direction in English.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Position words grid
        Text('स्थिति के शब्द (Position Words)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter18Data.positionWords.map((w) => _positionWordCard(w)),

        const SizedBox(height: AppSpacing.lg),

        // Directions
        Text('दिशाएँ (Directions)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _directionsCard(),

        const SizedBox(height: AppSpacing.lg),

        // Classroom visual
        Text('क्लास लेआउट से समझें', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Teacher का चेहरा बच्चों की तरफ है। नीचे दिए layout से position words समझें।',
          style: AppTextStyles.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.md),
        _classroomLayout(Chapter18Data.classLayoutLesson, 'Teacher 👩‍🏫'),

        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter18Data.lessonExamples.map((ex) => _exampleRow(
              ex['hindi']!,
              ex['english']!,
            )),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Ahead vs In Front Of
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildAheadVsFrontContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'लोग अकसर confuse रहते हैं कि "in front of" और "ahead of" का प्रयोग कहाँ करना है।',
          'People often get confused between "in front of" and "ahead of". Let\'s clarify.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Comparison card
        _comparisonCard(),

        const SizedBox(height: AppSpacing.lg),

        // Before — dual meaning
        _beforeDualMeaningCard(),

        const SizedBox(height: AppSpacing.lg),

        // Immediate right vs just right
        Text('Right vs Immediate Right', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        _immediateRightCard(),

        const SizedBox(height: AppSpacing.lg),

        // Visual classroom for right/immediate right
        Text('Layout से देखें:', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.sm),
        _classroomLayout(Chapter18Data.classLayoutLesson, 'Teacher 👩‍🏫'),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _layoutExample(
                  'Right to Divya →', 'Rashmi, Masood, Junaid, Sandeep', AppColors.accent),
              const SizedBox(height: 6),
              _layoutExample(
                  'Immediate right to Divya →', 'Rashmi only', AppColors.success),
            ],
          ),
        ),
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
              _statChip('Ahead/Behind', 'आगे/पीछे', '↕️'),
              _statChip('Left/Right', 'दाँयी/बाँयी', '↔️'),
              _statChip('North/South', 'उत्तर/दक्षिण', '🧭'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('अभ्यास वाक्य (Hindi → English)',
            style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter18Data.practiceExercise.asMap().entries.map((e) =>
            _RevealCard(
              no: e.key + 1,
              question: e.value['hindi']!,
              answer: e.value['english']!,
              accentColor: accentColor,
            )),
        const SizedBox(height: AppSpacing.xl),
        _quotesSection(Chapter18Data.motivationalQuotes.sublist(0, 2)),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Test Paper with class layout
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildTestPaperContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'नीचे दिए class layout को देखकर 20 questions के जवाब दें। उत्तर टैप करके देखें।',
          'Answer 20 questions based on the class layout below. Tap to reveal answers.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Teacher label
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: const Text('Pooja Madam 👩‍🏫 (Teacher)',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _classroomLayout(Chapter18Data.classLayoutTest, 'Pooja Madam 👩‍🏫'),

        const SizedBox(height: AppSpacing.lg),
        _testSectionHeader('Test Paper — I', 'Answer the Questions', '📋',
            AppColors.primary, '20 questions'),
        const SizedBox(height: AppSpacing.md),

        ...Chapter18Data.testPaperQA.asMap().entries.map((e) =>
            _RevealCard(
              no: e.key + 1,
              question: e.value['q']!,
              answer: e.value['a']!,
              accentColor: accentColor,
              isEnglishFirst: true,
            )),

        const SizedBox(height: AppSpacing.xl),
        _quotesSection(Chapter18Data.motivationalQuotes),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER QUIZ INTRO
  // ══════════════════════════════════════════════════════════════════════════
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🧭', 'title': 'Position Words', 'hi': 'next to, ahead of, behind, in front of...'},
      {'emoji': '🔄', 'title': 'Ahead vs In Front Of', 'hi': 'आगे बनाम सामने का अंतर'},
      {'emoji': '↔️', 'title': 'Immediate Right/Left', 'hi': 'बगल में दाँयी/बाँयी ओर'},
      {'emoji': '🗺️', 'title': 'Directions', 'hi': 'North, South, East, West'},
      {'emoji': '✍️', 'title': 'Practice — 50 sentences', 'hi': 'Hindi → English'},
      {'emoji': '📝', 'title': 'Test Paper', 'hi': 'Class layout — 20 questions'},
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
              const Text('अध्याय 18 — फ़ाइनल क्विज़',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Chapter 18 — Final Quiz',
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
                  commonWidgets.quizStatBadge('6', 'टॉपिक'),
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
                  'इस क्विज़ में 6/10 या उससे ज़्यादा सही जवाब देने पर अध्याय 19 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 19!',
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

  Widget _positionWordCard(Map<String, String> w) {
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
          Text(w['emoji']!, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(w['hindi']!,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: AppColors.textPrimary)),
                Text(w['pronunciation']!,
                    style: AppTextStyles.bodyMedium
                        .copyWith(fontSize: 11, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Text(w['english']!,
                      style: AppTextStyles.labelLarge
                          .copyWith(color: accentColor, fontSize: 13)),
                ),
                commonWidgets.ttsButton(w['english']!.split('/')[0].trim()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _directionsCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          // North
          _dirRow(Chapter18Data.directions[0]),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // West                    East
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _dirChip(Chapter18Data.directions[3]), // West
              const Text('🧭', style: TextStyle(fontSize: 32)),
              _dirChip(Chapter18Data.directions[2]), // East
            ],
          ),
          const SizedBox(height: 4),
          _dirRow(Chapter18Data.directions[1]), // South
        ],
      ),
    );
  }

  Widget _dirRow(Map<String, String> d) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(d['emoji']!, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 6),
          Text(d['hindi']!,
              style: AppTextStyles.labelLarge.copyWith(fontSize: 14)),
          const SizedBox(width: 6),
          Text('= ${d['english']!}',
              style: AppTextStyles.bodyMedium.copyWith(color: accentColor)),
          const SizedBox(width: 6),
          commonWidgets.ttsButton(d['english']!),
        ],
      ),
    );
  }

  Widget _dirChip(Map<String, String> d) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(d['hindi']!,
            style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
        const SizedBox(width: 4),
        Text('= ${d['english']!}',
            style: AppTextStyles.bodyMedium.copyWith(color: accentColor)),
      ],
    );
  }

  Widget _classroomLayout(List<List<String>> rows, String teacher) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          // Teacher
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.full),
              border:
                  Border.all(color: AppColors.primary.withOpacity(0.4)),
            ),
            child: Text(teacher,
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.primary, fontSize: 12)),
          ),
          const SizedBox(height: AppSpacing.md),
          const Text('↑ Teacher facing students ↑',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 10,
                  color: AppColors.textHint)),
          const SizedBox(height: AppSpacing.md),
          // Rows
          ...rows.asMap().entries.map((rowEntry) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: rowEntry.value.asMap().entries.map((colEntry) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.08),
                          borderRadius:
                              BorderRadius.circular(AppRadius.sm),
                          border: Border.all(
                              color: accentColor.withOpacity(0.25)),
                        ),
                        child: Text(
                          colEntry.value,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: accentColor,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('← Left (बाँयी)',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: AppColors.textHint, fontSize: 10)),
              Text('Right (दाँयी) →',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: AppColors.textHint, fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _comparisonCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
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
            child: Text('Ahead of vs In front of',
                style: AppTextStyles.headingMedium.copyWith(color: accentColor),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Ahead of
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(
                          color: AppColors.warning.withOpacity(0.35)),
                    ),
                    child: Column(
                      children: [
                        const Text('⬆️', style: TextStyle(fontSize: 28)),
                        const SizedBox(height: 6),
                        Text('Ahead of',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.warning)),
                        Text('आगे\n(पीठ तुम्हारी तरफ)',
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 11),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        Text('Like in a queue.\nTheir back faces you.',
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 10,
                                    fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // In front of
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(
                          color: AppColors.primary.withOpacity(0.35)),
                    ),
                    child: Column(
                      children: [
                        const Text('👁️', style: TextStyle(fontSize: 28)),
                        const SizedBox(height: 6),
                        Text('In front of',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.primary)),
                        Text('सामने\n(आमने-सामने)',
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 11),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        Text('Face to face.\nThey are facing you.',
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontSize: 10,
                                    fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Examples
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
            child: Column(
              children: [
                _compExRow('मसूद तरुण के आगे बैठा है।',
                    'Masood is sitting ahead of Tarun.', AppColors.warning),
                const SizedBox(height: 6),
                _compExRow('टीचर बच्चों के सामने बैठे हैं।',
                    'Teacher is sitting in front of the students.',
                    AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _compExRow(String hindi, String english, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(hindi, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                Text(english,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: color, fontSize: 12)),
              ],
            ),
          ),
          commonWidgets.ttsButton(english, color: color),
        ],
      ),
    );
  }

  Widget _beforeDualMeaningCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: const Color(0xFF7C3AED).withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: const Color(0xFF7C3AED).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('📌', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text('"Before" के दो अर्थ',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: const Color(0xFF7C3AED))),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _meaningRow('1. पहले (Time)', 'e.g. Before Monday', AppColors.primary),
          const SizedBox(height: 6),
          _meaningRow('2. सामने (Position)', 'e.g. Standing before the judge',
              const Color(0xFF7C3AED)),
        ],
      ),
    );
  }

  Widget _meaningRow(String meaning, String example, Color color) {
    return Row(
      children: [
        _verbChip(meaning, color),
        const SizedBox(width: 8),
        Text(example,
            style: AppTextStyles.bodyMedium
                .copyWith(fontStyle: FontStyle.italic, fontSize: 12)),
      ],
    );
  }

  Widget _immediateRightCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.success.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('दाँयी ओर vs बगल में दाँयी ओर',
              style:
                  AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'अगर पूछा जाये "Divya के दाँयी ओर कौन है?" तो सभी 4 लोगों का नाम लेना होगा।\n'
            'अगर पूछा जाये "Divya के बगल में दाँयी ओर कौन है?" तो सिर्फ Rashmi।',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Column(
                    children: [
                      Text('Right to Divya',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.accent)),
                      Text('Rashmi, Masood,\nJunaid, Sandeep',
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 11),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Column(
                    children: [
                      Text('Immediate right to Divya',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.success, fontSize: 10)),
                      Text('Rashmi only',
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 11),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _layoutExample(String label, String value, Color color) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(label,
              style: AppTextStyles.bodyMedium.copyWith(color: color)),
        ),
        Expanded(
          flex: 2,
          child: Text(value,
              style:
                  AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
        ),
      ],
    );
  }

  Widget _exampleRow(String hindi, String english) {
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
    return Container(
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
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontStyle: FontStyle.italic)),
                      ),
                      commonWidgets.ttsButton(q['english']!,
                          color: AppColors.accentGold),
                    ]),
                    const SizedBox(height: 4),
                    Text(q['hindi']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary, fontSize: 12)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
// STATEFUL REVEAL CARD
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