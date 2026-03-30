import 'package:flutter/material.dart';
import '../../data/chapter26_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter26Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter26Widgets({
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

  Widget _voiceBadge(String voice) {
    final isActive = voice == 'Active';
    final color = isActive ? AppColors.success : AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Text(voice,
          style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10)),
    );
  }

  Widget _exampleTile({
    required String hindi,
    required String english,
    required String label,
    required Color color,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: Text('$index',
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
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(label,
                      style: AppTextStyles.labelSmall.copyWith(color: color)),
                ),
                const SizedBox(height: 4),
                Text(hindi, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 4),
                Row(children: [
                  Expanded(
                    child: Text(english,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: color, fontSize: 12)),
                  ),
                  commonWidgets.ttsButton(english, color: color),
                ]),
              ],
            ),
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
            width: 28,
            height: 28,
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
                Row(children: [
                  Expanded(
                    child: Text(english,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: color, fontSize: 12)),
                  ),
                  commonWidgets.ttsButton(english, color: color),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hindi2engTile(int number, String hindi, String english, Color color) {
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
            width: 28,
            height: 28,
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
                Row(children: [
                  Expanded(
                    child: Text(english,
                        style: AppTextStyles.labelLarge
                            .copyWith(color: color, fontSize: 12)),
                  ),
                  commonWidgets.ttsButton(english, color: color),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── L1: Intro / Concept ─────────────────────────────────────────────────
  Widget buildIntroContent() {
    final avExamples = [
      {'hindi': 'मैं जा रहा हूँ।', 'english': 'I am going.', 'note': 'Subject "मैं" दिया है'},
      {'hindi': 'बच्चों ने पत्थर फेंके।', 'english': 'Children threw the stones.', 'note': 'Subject "बच्चों ने" दिया है'},
      {'hindi': 'मैंने खाना खा लिया है।', 'english': 'I have eaten food.', 'note': 'Subject "मैं" दिया है'},
      {'hindi': 'मैंने सोचा था।', 'english': 'I had thought.', 'note': 'Subject "मैंने" दिया है'},
    ];
    final pvExamples = [
      {'hindi': 'मुझे भेजा जा रहा है।', 'english': 'I am being sent.', 'note': 'कौन भेज रहा है — नहीं पता'},
      {'hindi': 'हमें बताया गया था।', 'english': 'We had been told.', 'note': 'कौन बता रहा था — नहीं पता'},
      {'hindi': 'राम को पीटा जायेगा।', 'english': 'Ram will be beaten.', 'note': 'कौन पीटेगा — नहीं पता'},
      {'hindi': 'उसे पूछा गया।', 'english': 'He was asked.', 'note': 'किसने पूछा — नहीं पता'},
      {'hindi': 'मुझे राम के द्वारा भेजा जा रहा है।', 'english': 'I am being sent by Ram.', 'note': 'Subject "राम" "द्वारा" के साथ'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Active Voice में Subject दिया होता है और वो खुद क्रिया करता है। '
          'Passive Voice में Subject या तो नहीं दिया होता या "द्वारा" के साथ आता है। '
          'Passive में हमेशा Verb की 3rd form लगती है।',
          'In Active Voice, subject performs the action. In Passive Voice, subject is absent or follows "द्वारा" (by). '
          'Passive Voice always uses the 3rd form of the verb.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.success.withOpacity(0.4)),
                ),
                child: Column(
                  children: [
                    const Text('🟢', style: TextStyle(fontSize: 28)),
                    const SizedBox(height: 6),
                    Text('Active Voice',
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
                    const SizedBox(height: 4),
                    Text('Subject करता है',
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
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(color: AppColors.primary.withOpacity(0.4)),
                ),
                child: Column(
                  children: [
                    const Text('🔵', style: TextStyle(fontSize: 28)),
                    const SizedBox(height: 6),
                    Text('Passive Voice',
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 4),
                    Text('Subject नहीं / "द्वारा" के साथ',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                  ],
                ),
              ),
            ),
          ],
        ),

        _sectionHeader('Active Voice — उदाहरण', badge: '4'),
        ...avExamples.asMap().entries.map((e) => _exampleTile(
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              label: e.value['note']!,
              color: AppColors.success,
              index: e.key + 1,
            )),

        _sectionHeader('Passive Voice — उदाहरण', badge: '5'),
        ...pvExamples.asMap().entries.map((e) => _exampleTile(
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              label: e.value['note']!,
              color: AppColors.primary,
              index: e.key + 1,
            )),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Key Rules:\n'
          '• Passive Voice में हमेशा Verb की 3rd form।\n'
          '• Active → Tense chapter के rules follow करो।\n'
          '• Passive → नीचे दी गई Helping Verb table follow करो।',
          emoji: '💡',
          color: accentColor,
        ),
      ],
    );
  }

  // ─── L2: Passive of Tenses ────────────────────────────────────────────────
  Widget buildPassiveTensesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'हर Tense का Active Voice अलग Helping Verb से और Passive Voice अलग Helping Verb से बनता है। '
          'नीचे दी गई टेबल को ध्यान से पढ़ें।',
          'Each tense uses different helping verbs in Active and Passive Voice. Study the table carefully.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Tenses table
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
                ),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Text('Tense', style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 11))),
                    Expanded(flex: 2, child: Text('Active HV', style: AppTextStyles.labelLarge.copyWith(color: AppColors.success, fontSize: 11))),
                    Expanded(flex: 3, child: Text('Passive HV + V3', style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 11))),
                  ],
                ),
              ),
              ...Chapter26Data.tensesPassiveTable.asMap().entries.map((e) {
                final i = e.key;
                final row = e.value;
                final isLast = i == Chapter26Data.tensesPassiveTable.length - 1;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
                  decoration: BoxDecoration(
                    color: i.isEven ? AppColors.surface : AppColors.lockedBg.withOpacity(0.3),
                    border: isLast ? null : const Border(bottom: BorderSide(color: AppColors.lockedBg)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(row['tense']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 11)),
                            Text(row['hindiHint']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 10, color: accentColor)),
                          ],
                        ),
                      ),
                      Expanded(flex: 2, child: Text(row['activeHV']!, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.success, fontSize: 11))),
                      Expanded(flex: 3, child: Text(row['passiveHV']!, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 11))),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),

        _sectionHeader('Passive नहीं होता — 4 Tenses', badge: '❌ 4'),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.error.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.error.withOpacity(0.25)),
          ),
          child: Column(
            children: Chapter26Data.noPassiveTenses.asMap().entries.map((e) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 22, height: 22,
                        decoration: BoxDecoration(color: AppColors.error, shape: BoxShape.circle),
                        child: Center(child: Text('${e.key + 1}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 10))),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.value['name']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 12)),
                            Text(e.value['hint']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11, color: AppColors.error)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )).toList(),
          ),
        ),

        _sectionHeader('Examples — Tenses Passive', badge: '16'),
        ...Chapter26Data.tensesExamples.asMap().entries.map((e) {
          final ex = e.value;
          final isActive = ex['voice'] == 'Active';
          final color = isActive ? AppColors.success : AppColors.primary;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: color.withOpacity(0.2)),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 26, height: 26,
                  decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                  child: Center(child: Text('${e.key + 1}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 10))),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _voiceBadge(ex['voice']!),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(color: accentColor.withOpacity(0.08), borderRadius: BorderRadius.circular(AppRadius.full)),
                            child: Text(ex['tense']!, style: AppTextStyles.labelSmall.copyWith(fontSize: 9)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(ex['hindi']!, style: AppTextStyles.bodyMedium),
                      const SizedBox(height: 3),
                      Row(children: [
                        Expanded(child: Text(ex['english']!, style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12))),
                        commonWidgets.ttsButton(ex['english']!, color: color),
                      ]),
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

  // ─── L3: Passive of Modals ────────────────────────────────────────────────
  Widget buildPassiveModalsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Modals के Passive में एक simple नियम है:\n'
          '• जिन Modals के साथ 1st form लगती है → Passive में "be" जोड़ो।\n'
          '• जिन Modals के साथ 3rd form लगती है → Passive में "been" जोड़ो।\n'
          'और Passive में हमेशा Verb की 3rd form।',
          'For modals using 1st form: add "be" in passive. '
          'For modals using 3rd form: add "been" in passive. Always use V3.',
        ),
        const SizedBox(height: AppSpacing.lg),

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
              Text('✅ 1st Form Modals → + be + V3', style: AppTextStyles.headingMedium.copyWith(color: AppColors.success)),
              const SizedBox(height: 6),
              const Text('Can, Could, Should, Must, May, Might,\nHas to, Have to, Had to, Will have to', style: AppTextStyles.bodyMedium),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: AppColors.success, borderRadius: BorderRadius.circular(AppRadius.md)),
                child: const Text('Modal + be + V3', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
              ),
              const SizedBox(height: 4),
              Text('e.g. can → I can be sent.', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: AppColors.success)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
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
              Text('⚡ 3rd Form Modals → + been + V3', style: AppTextStyles.headingMedium.copyWith(color: AppColors.accentGold)),
              const SizedBox(height: 6),
              const Text('Could have, Should have, Must have,\nMay have, Might have', style: AppTextStyles.bodyMedium),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: AppColors.accentGold, borderRadius: BorderRadius.circular(AppRadius.md)),
                child: const Text('Modal + been + V3', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
              ),
              const SizedBox(height: 4),
              Text('e.g. could have → He could have been taught.', style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: AppColors.accentGold)),
            ],
          ),
        ),

        _sectionHeader('Examples — Modals Passive', badge: '12'),
        ...Chapter26Data.modalsExamples.asMap().entries.map((e) {
          final ex = e.value;
          final isHave = ex['modal']!.contains('have') || ex['modal']!.contains('Have');
          final color = isHave ? AppColors.accentGold : AppColors.success;
          return _exampleTile(hindi: ex['hindi']!, english: ex['english']!, label: ex['modal']!, color: color, index: e.key + 1);
        }),
      ],
    );
  }

  // ─── L4: Passive of Let ───────────────────────────────────────────────────
  Widget buildPassiveLetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Let" एक क्रिया है। इसका Passive Voice ठीक वैसे ही बनता है जैसे Tenses का। '
          '"Let" की तीनों forms एक जैसी हैं: Let / Let / Let।',
          '"Let" is a verb. Its Passive is formed exactly like Passive of Tenses. '
          'All three forms of "Let" are the same: Let / Let / Let.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              const Text('🔓', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              const Text('LET — All Forms Same', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['Let\n(1st)', 'Let\n(2nd)', 'Let\n(3rd)'].map((s) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(AppRadius.md)),
                      child: Text(s, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15)),
                    )).toList(),
              ),
            ],
          ),
        ),

        _sectionHeader('Formula — Passive of Let'),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              _formulaRow('Present Indefinite', 'Is/Am/Are + let + V1'),
              _formulaRow('Past Indefinite', 'Was/Were + let + V1'),
              _formulaRow('Present Continuous', 'Is/Am/Are + being + let + V1'),
              _formulaRow('Past Continuous', 'Was/Were + being + let + V1'),
              _formulaRow('Present Perfect', 'Has/Have + been + let + V1'),
              _formulaRow('Future Indefinite', 'Will + be + let + V1', isLast: true),
            ],
          ),
        ),

        _sectionHeader('Examples — Passive of Let', badge: '4'),
        ...Chapter26Data.letExamples.asMap().entries.map((e) =>
            _exampleTile(hindi: e.value['hindi']!, english: e.value['english']!, label: e.value['tense']!, color: accentColor, index: e.key + 1)),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'याद रखो:\n'
          '• Passive of Let में helping verb वही जो Passive of Tenses में होती है।\n'
          '• "Let" की 3rd form "Let" ही है।\n'
          '• Let के बाद आने वाली verb की 1st form लगती है।\n'
          '• Formula: HV + (being/been) + let + V1',
          emoji: '📌',
        ),
      ],
    );
  }

  Widget _formulaRow(String tense, String formula, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: AppColors.lockedBg)),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(tense, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11))),
          Expanded(flex: 3, child: Text(formula, style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 11))),
        ],
      ),
    );
  }

  // ─── L5: Practice Exercise — 90 sentences in 3 sets ─────────────────────
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Active & Passive Voice के 90 अभ्यास वाक्य — Hindi to English।',
          'Practice 90 sentences of Active & Passive Voice — Hindi to English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('90', 'वाक्य'),
              commonWidgets.quizStatBadge('3', 'सेट'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: 'सेट 1', subtitle: 'Q 1–30', color: accentColor,
          child: Column(
            children: Chapter26Data.practiceSet1.asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dotIdx = raw.indexOf('. ');
              final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
              return _practiceTile(e.key + 1, hindi, e.value['english']!, accentColor);
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'सेट 2', subtitle: 'Q 31–60', color: AppColors.primary,
          child: Column(
            children: Chapter26Data.practiceSet2.asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dotIdx = raw.indexOf('. ');
              final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
              return _practiceTile(e.key + 31, hindi, e.value['english']!, AppColors.primary);
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'सेट 3', subtitle: 'Q 61–90', color: AppColors.success,
          child: Column(
            children: Chapter26Data.practiceSet3.asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dotIdx = raw.indexOf('. ');
              final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
              return _practiceTile(e.key + 61, hindi, e.value['english']!, AppColors.success);
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── L6: Test Paper I — MCQ ───────────────────────────────────────────────
  Widget buildTestPaper1Content() {
    final optionLabels = ['a', 'b', 'c', 'd'];
    final optionColors = [accentColor, AppColors.primary, AppColors.success, AppColors.warning];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('📝', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र I', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper I — MCQ (सही विकल्प चुनें)', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('16', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('4', 'विकल्प'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Hint', 'हर सवाल में'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        ...Chapter26Data.testPaper1MCQ.asMap().entries.map((entry) {
          final i = entry.key;
          final q = entry.value;
          final options = q['options'] as List<String>;
          final answerIdx = q['answer'] as int;
          final hint = q['hint'] as String;

          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                      child: Center(child: Text('${i + 1}', style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12))),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: Text(q['hindi'] as String, style: AppTextStyles.labelLarge)),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),

                // Options
                ...options.asMap().entries.map((opt) {
                  final isAnswer = opt.key == answerIdx;
                  final optColor = isAnswer ? AppColors.success : AppColors.textSecondary;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: isAnswer ? AppColors.success.withOpacity(0.08) : AppColors.lockedBg,
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      border: Border.all(color: isAnswer ? AppColors.success.withOpacity(0.4) : Colors.transparent),
                    ),
                    child: Row(
                      children: [
                        Text('${optionLabels[opt.key]}) ',
                            style: TextStyle(fontFamily: 'Nunito', color: optColor, fontWeight: FontWeight.w700, fontSize: 12)),
                        Expanded(child: Text(opt.value, style: TextStyle(fontFamily: 'Nunito', color: optColor, fontSize: 12))),
                        if (isAnswer) ...[
                          commonWidgets.ttsButton(opt.value, color: AppColors.success),
                          const SizedBox(width: 4),
                          const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 16),
                        ],
                      ],
                    ),
                  );
                }),

                // Hint
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text('💡 $hint', style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L7: Test Paper II — Hindi → English (50) ────────────────────────────
  Widget buildTestPaper2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.primary, AppColors.primary.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('📋', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र II', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Paper II — Hindi → English', style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('50', 'वाक्य'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('50 × 1', 'marks'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('Hindi→Eng', 'दिशा'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: 'Q1: English में अनुवाद करें', subtitle: '1–25', color: AppColors.primary,
          child: Column(
            children: Chapter26Data.testPaper2Sentences.sublist(0, 25).asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dotIdx = raw.indexOf('. ');
              final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
              return _hindi2engTile(e.key + 1, hindi, e.value['english']!, AppColors.primary);
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'Q1: English में अनुवाद करें (जारी)', subtitle: '26–50', color: const Color(0xFF7C3AED),
          child: Column(
            children: Chapter26Data.testPaper2Sentences.sublist(25).asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dotIdx = raw.indexOf('. ');
              final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
              return _hindi2engTile(e.key + 26, hindi, e.value['english']!, const Color(0xFF7C3AED));
            }).toList(),
          ),
        ),

        const SizedBox(height: AppSpacing.xl),
        // Quotation
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.accentGold.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💬 Quotation', style: AppTextStyles.headingMedium.copyWith(color: AppColors.accentGold)),
              const SizedBox(height: AppSpacing.sm),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'If you think of something difficult, that means you have not understood it well.',
                      style: AppTextStyles.labelLarge.copyWith(color: AppColors.accentGold, fontSize: 13),
                    ),
                  ),
                  commonWidgets.ttsButton(
                    'If you think of something difficult, that means you have not understood it well.',
                    color: AppColors.accentGold,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'अगर आपको कुछ मुश्किल लगता है, तो इसका यही मतलब है कि आपने उसे ढंग से समझा नहीं।',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L8: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔄', 'title': 'Active vs Passive — Concept', 'hi': 'पहचान और नियम'},
      {'emoji': '📋', 'title': 'Passive of Tenses', 'hi': 'सभी Tenses की Passive HV Table'},
      {'emoji': '⚙️', 'title': 'Passive of Modals', 'hi': 'be / been rule'},
      {'emoji': '🔓', 'title': 'Passive of Let', 'hi': 'Let / Let / Let — same forms'},
      {'emoji': '✍️', 'title': 'Practice — 90 sentences', 'hi': '90 अभ्यास वाक्य (3 sets)'},
      {'emoji': '📝', 'title': 'Test Paper I — MCQ (16)', 'hi': 'सही विकल्प चुनें'},
      {'emoji': '📋', 'title': 'Test Paper II — Hindi→Eng (50)', 'hi': '50 अनुवाद वाक्य'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 26 — फ़ाइनल क्विज़', style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Active & Passive Voice — Final Quiz',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
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
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
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
                        Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 27 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 27!',
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