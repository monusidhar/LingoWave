import 'package:flutter/material.dart';
import '../../data/chapter27_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter27Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter27Widgets({required this.commonWidgets, required this.accentColor});

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _ruleBox(String text, {String emoji = '📌', Color? color}) {
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
          Text(emoji, style: const TextStyle(fontSize: 20)),
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

  Widget _exampleTile({
    required int index,
    required String hindi,
    required String english,
    required Color color,
    String? badge,
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
            width: 28, height: 28,
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
                if (badge != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(badge,
                        style: AppTextStyles.labelSmall.copyWith(color: color, fontSize: 10)),
                  ),
                  const SizedBox(height: 4),
                ],
                Text(hindi, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 3),
                Row(children: [
                  Expanded(
                    child: Text(english,
                        style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
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
            width: 28, height: 28,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Center(
              child: Text('$number',
                  style: const TextStyle(
                      fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 11)),
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
                        style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 12)),
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

  // ─── L1: Get (Sick) ────────────────────────────────────────────────────────
  Widget buildGetSickContent() {
    final colors = [accentColor, AppColors.primary, AppColors.success,
      AppColors.warning, const Color(0xFF7C3AED), AppColors.accent];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Get" का एक खास प्रयोग तब होता है जब कोई बीमार हो जाता है या किसी पर अचानक कोई अवस्था आ जाती है।',
          '"Get" is also used when someone suddenly falls ill or a state changes unexpectedly.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              const Text('🤒', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 6),
              const Text('Get = हो जाना / लग जाना',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              Wrap(spacing: 8, runSpacing: 6, alignment: WrapAlignment.center,
                children: ['fever', 'cold', 'cough', 'TB', 'angry', 'annoyed', 'sick']
                    .map((w) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(w,
                              style: const TextStyle(fontFamily: 'Nunito',
                                  color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),

        _sectionHeader('उदाहरण', badge: '6 sentences'),
        ...Chapter27Data.getSickExamples.asMap().entries.map((e) =>
            _exampleTile(
              index: e.key + 1,
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              color: colors[e.key % colors.length],
              badge: e.value['tense'],
            )),
      ],
    );
  }

  // ─── L2: Fond of & Meant for ───────────────────────────────────────────────
  Widget buildFondMeantContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'जब कोई किसी काम का "शौकीन" हो तो "Fond of" और किसी काम के लिए "बना हो" तो "Meant for" का प्रयोग होता है। अगर इनके बाद कोई verb (क्रिया) आए तो उसके साथ "ing" ज़रूर लगाएं।',
          'Use "Fond of" for hobbies/interests and "Meant for" for purpose. If a verb follows — always add "ing".',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Two rule cards side by side
        Row(
          children: [
            Expanded(
              child: _miniRuleCard('❤️', 'Fond of', 'शौकीन होना',
                  'fond of music\nfond of reading', AppColors.accent),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _miniRuleCard('🎯', 'Meant for', 'बना होना',
                  'meant for business\nmeant for teaching', AppColors.primary),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'नियम (Rule):\n'
          '• अगर बाद में कोई Noun आए → directly use it\n'
          '  fond of music ✓ (music = noun)\n'
          '• अगर बाद में कोई Verb आए → Verb + ing\n'
          '  fond of reading ✓ (read = verb → reading)',
          emoji: '📌',
        ),

        _sectionHeader('Fond of — Examples', badge: '6'),
        ...Chapter27Data.fondExamples.asMap().entries.map((e) =>
            _exampleTile(
              index: e.key + 1,
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              color: AppColors.accent,
              badge: e.value['note'],
            )),

        _sectionHeader('Meant for — Examples', badge: '6'),
        ...Chapter27Data.meantForExamples.asMap().entries.map((e) =>
            _exampleTile(
              index: e.key + 1,
              hindi: e.value['hindi']!,
              english: e.value['english']!,
              color: AppColors.primary,
              badge: e.value['note'],
            )),
      ],
    );
  }

  Widget _miniRuleCard(String emoji, String title, String sub, String examples, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(title, style: AppTextStyles.labelLarge.copyWith(color: color)),
          Text(sub, style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
          const SizedBox(height: 6),
          Text(examples,
              style: AppTextStyles.bodyMedium.copyWith(
                  color: color, fontStyle: FontStyle.italic, fontSize: 11)),
        ],
      ),
    );
  }

  // ─── L3: Made in / of / by ─────────────────────────────────────────────────
  Widget buildMadeInOfContent() {
    const rows = [
      {'prep': 'Made in', 'use': 'Country (देश)', 'icon': '🌍', 'example': 'Made in China'},
      {'prep': 'Made of', 'use': 'Material (सामग्री)', 'icon': '🪨', 'example': 'Made of Gold'},
      {'prep': 'Made by', 'use': 'Company/Person', 'icon': '🏭', 'example': 'Made by Nokia'},
    ];
    final colors = [accentColor, AppColors.success, AppColors.primary];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Made in", "Made of", और "Made by" — तीनों का प्रयोग अलग-अलग संदर्भों में होता है।',
          '"Made in", "Made of", and "Made by" are used in different contexts.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Summary table
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: rows.asMap().entries.map((e) {
              final i = e.key;
              final row = e.value;
              final c = colors[i];
              return Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: i < 2 ? const Border(bottom: BorderSide(color: AppColors.lockedBg)) : null,
                ),
                child: Row(
                  children: [
                    Text(row['icon']!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(row['prep']!,
                              style: AppTextStyles.labelLarge.copyWith(color: c)),
                          Text(row['use']!, style: AppTextStyles.bodyMedium),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: c.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(row['example']!,
                          style: AppTextStyles.labelSmall.copyWith(color: c)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        _sectionHeader('Examples', badge: '6'),
        ...Chapter27Data.madeInOfByExamples.asMap().entries.map((e) {
          final type = e.value['type']!;
          final c = type.contains('in') ? accentColor
              : type.contains('of') ? AppColors.success
              : AppColors.primary;
          return _exampleTile(
            index: e.key + 1,
            hindi: e.value['hindi']!,
            english: e.value['english']!,
            color: c,
            badge: type,
          );
        }),
      ],
    );
  }

  // ─── L4: Able to & How to ──────────────────────────────────────────────────
  Widget buildAbleHowToContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Able to" = काबिल/योग्य होना। "How to + V1" = कोई काम करना जानना। दोनों बहुत उपयोगी structures हैं।',
          '"Able to" means capable of doing something. "How to + V1" means knowing how to do something.',
        ),
        const SizedBox(height: AppSpacing.lg),

        Row(
          children: [
            Expanded(
              child: _miniRuleCard('💪', 'Able to', 'काबिल होना',
                  'am/is/are able to + V1', AppColors.success),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _miniRuleCard('🧠', 'How to', 'जानना',
                  'know/knew + how to + V1', AppColors.primary),
            ),
          ],
        ),

        _sectionHeader('Able to — Examples', badge: '3'),
        ...[ 
          {'h': 'मैं ये काम करने के काबिल हूँ।', 'e': 'I am able to do this work.'},
          {'h': 'राम ये काम कर सकता है।', 'e': 'Ram is able to do this work. / Ram can do this work.'},
          {'h': 'क्या तुम इस बिज़नेस को सँभालने के काबिल हो?', 'e': 'Are you able to handle this business?'},
        ].asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['h']!,
                english: e.value['e']!, color: AppColors.success)),

        _sectionHeader('How to — Examples', badge: '7'),
        ...Chapter27Data.howToExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.primary)),

        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Formula:\n'
          '• Sub + know/knew/knows + how to + V1\n'
          '• I know how to dance. ✓\n'
          '• I know dancing. (also OK but less preferred)\n'
          '• Sub + is/am/are + able to + V1\n'
          '• I am able to do this. ✓',
          emoji: '📐', color: AppColors.primary,
        ),
      ],
    );
  }

  // ─── L5: Keep on & Having ──────────────────────────────────────────────────
  Widget buildKeepHavingContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"Keep on + V-ing" = किसी काम को करते रहना। "Having + V3" = कोई काम करने के बाद।',
          '"Keep on + V-ing" = continuing to do something. "Having + V3" = after doing something.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Keep on banner
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
              Text('🔄 Keep on — करते रहना',
                  style: AppTextStyles.headingMedium.copyWith(color: accentColor)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text(
                  'Sub + keep/keeps/kept + on + V-ing',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 13),
                ),
              ),
            ],
          ),
        ),

        _sectionHeader('Keep on — Examples', badge: '8'),
        ...Chapter27Data.keepOnExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: accentColor)),

        const SizedBox(height: AppSpacing.md),

        // Having banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('✅ Having + V3 — करने के बाद',
                  style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text(
                  'Having + V3 (past participle) + ... , main clause',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontWeight: FontWeight.w800, fontSize: 13),
                ),
              ),
            ],
          ),
        ),

        _sectionHeader('Having — Examples', badge: '5'),
        ...Chapter27Data.havingExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.primary)),
      ],
    );
  }

  // ─── L6: ऊँ / Hold / Suggest ──────────────────────────────────────────────
  Widget buildSpecialMoreContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में तीन और महत्वपूर्ण structures सीखेंगे: ऊँ formation (interrogative), Hold (रोक पाना), और Suggest (लगना)।',
          'Three more important structures: ऊँ formation (interrogative), Hold (to restrain), and Suggest (to imply).',
        ),
        const SizedBox(height: AppSpacing.lg),

        // ऊँ Formation
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💭 ऊँ Formation',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('ये वाक्य हमेशा प्रश्नवाचक होते हैं।',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Text('क्या मैं जाऊँ? → Do I go?',
                    style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                        fontWeight: FontWeight.w700, fontSize: 13)),
              ),
            ],
          ),
        ),

        _sectionHeader('ऊँ Formation — Examples', badge: '6'),
        ...Chapter27Data.oonFormationExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: accentColor)),

        const SizedBox(height: AppSpacing.md),

        // Hold
        _ruleBox(
          'Hold (रोक पाना / काबू कर पाना):\n'
          'Sub + could/couldn\'t + hold + V-ing / Noun\n\n'
          '• मैं हँसी नहीं रोक पाया। → I couldn\'t hold laughing.\n'
          '• राम अपने आँसू नहीं रोक पाया। → Ram couldn\'t hold his tears.',
          emoji: '🤐', color: AppColors.warning,
        ),

        _sectionHeader('Hold — Examples', badge: '4'),
        ...Chapter27Data.holdExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.warning)),

        const SizedBox(height: AppSpacing.md),

        // Suggest
        _ruleBox(
          'Suggest (लगना — behavior से):\n'
          'किसी के तरीके या हरकत से कुछ "लगे" तो Suggest प्रयोग होता है।\n\n'
          '• उसके चलने के तरीके से लगता है... → Her way of walking suggests...\n'
          '• तुम्हारी आवाज़ से लगता है... → Your voice suggests...',
          emoji: '🔍', color: AppColors.success,
        ),

        _sectionHeader('Suggest — Examples', badge: '3'),
        ...Chapter27Data.suggestExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.success)),
      ],
    );
  }

  // ─── L7: The very / Or so / The one(s) ────────────────────────────────────
  Widget buildTheVeryOrSoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'तीन और विशेष प्रयोग: "The very" (यही/वही), "Or so" (एकाद), और "The one(s)" (वो)।',
          'Three more special usages: "The very" (the exact same), "Or so" (approximately), and "The one(s)".',
        ),
        const SizedBox(height: AppSpacing.lg),

        // The very
        _ruleBox(
          'The very = यही / वही (exact same thing)\n'
          '• मुझे यही किताब चाहिए। → I need the very book.\n'
          '• राम वही लड़का है। → Ram is the very boy.',
          emoji: '🎯',
        ),
        ...Chapter27Data.theVeryExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: accentColor)),

        _sectionHeader('Or so — एकाद', badge: '5'),
        _ruleBox('Or so = एकाद / लगभग\n'
            '• a day or so = एकाद दिन में\n'
            '• a year or so = एकाद साल में',
            emoji: '⏳', color: AppColors.accentGold),
        ...Chapter27Data.orSoExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.accentGold)),

        _sectionHeader('The one(s) — वो', badge: '5'),
        Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary.withOpacity(0.25)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _theOneRow('Singular (एकवचन)', 'the one', AppColors.success),
                    const SizedBox(height: 6),
                    _theOneRow('Plural (बहुवचन)', 'the ones', AppColors.primary),
                    const SizedBox(height: 6),
                    _theOneRow('With Noun (वो + noun)', 'the + noun', AppColors.warning),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...Chapter27Data.theOneExamples.asMap().entries.map((e) {
          final ex = e.value;
          final c = (ex['singular'] as bool) ? AppColors.success : AppColors.primary;
          return _exampleTile(
            index: e.key + 1,
            hindi: ex['hindi'] as String,
            english: ex['english'] as String,
            color: c,
            badge: (ex['singular'] as bool) ? 'The one (singular)' : 'The ones (plural)',
          );
        }),

        _sectionHeader('With Noun — सिर्फ "the" + noun', badge: '5'),
        _ruleBox(
          'जब "वो" के साथ noun भी हो (जैसे: वो लड़का, वो किताब) तो "the one" की जगह सिर्फ "the + noun" लगाते हैं।\n\n'
          '• वो लड़का → the boy\n'
          '• वो फिल्म → the movie',
          emoji: '📌', color: AppColors.warning,
        ),
        ...Chapter27Data.theOneWithNounExamples.asMap().entries.map((e) =>
            _exampleTile(index: e.key + 1, hindi: e.value['hindi']!,
                english: e.value['english']!, color: AppColors.warning)),
      ],
    );
  }

  Widget _theOneRow(String label, String value, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 140,
          child: Text(label, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(value,
              style: const TextStyle(fontFamily: 'Nunito', color: Colors.white,
                  fontWeight: FontWeight.w700, fontSize: 12)),
        ),
      ],
    );
  }

  // ─── L8: Practice ──────────────────────────────────────────────────────────
  Widget buildPracticeContent() {
    final colors = [accentColor, AppColors.primary, AppColors.success, AppColors.warning];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में Chapter 27 के सभी concepts के 50 अभ्यास वाक्य हैं।',
          'Practice 50 sentences covering all Special Cases concepts.',
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
              commonWidgets.quizStatBadge('50', 'वाक्य'),
              commonWidgets.quizStatBadge('10', 'Concepts'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: 'सेट 1', subtitle: 'Q 1–25', color: colors[0],
          child: Column(
            children: Chapter27Data.practiceSentences.sublist(0, 25).asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dot = raw.indexOf('. ');
              final hindi = dot != -1 && dot < 4 ? raw.substring(dot + 2) : raw;
              return _practiceTile(e.key + 1, hindi, e.value['english']!, colors[0]);
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'सेट 2', subtitle: 'Q 26–50', color: colors[1],
          child: Column(
            children: Chapter27Data.practiceSentences.sublist(25).asMap().entries.map((e) {
              final raw = e.value['hindi']!;
              final dot = raw.indexOf('. ');
              final hindi = dot != -1 && dot < 4 ? raw.substring(dot + 2) : raw;
              return _practiceTile(e.key + 26, hindi, e.value['english']!, colors[1]);
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── L9: Test Paper ────────────────────────────────────────────────────────
  Widget buildTestPaperContent() {
    final testQ1Eng = [
      'If you are meant for each other, no one can separate you.',
      'You may get cold.',
      'Sachin was fond of playing Cricket.',
      'This mobile is not meant for playing games.',
      'Is it made by you?',
      'Does he know how to prepare the food?',
      'You keep on irritating me.',
      'Having met your friends, I can guess why you don\'t study.',
      'How do I express my feelings?',
      'You are not preparing for exams. It suggests you are least bothered.',
    ];
    final testQ1Hi = [
      'अगर तुम एक दूसरे के लिए बने हो, तो तुम्हें कोई अलग नहीं कर सकता।',
      'तुम्हें सर्दी लग सकती है।',
      'सचिन क्रिकेट खेलने का शौकीन था।',
      'यह मोबाईल गेम्स खेलने के लिए नहीं बना है।',
      'क्या ये तुमने बनाया है?',
      'क्या वो खाना बनाना जानता है?',
      'तुम मुझे परेशान करते रहते हो।',
      'तुम्हारे दोस्तों से मिलने के बाद, मैं अंदाजा लगा सकता हूँ।',
      'मैं अपनी भावनाओं को कैसे व्यक्त करूँ?',
      'आप इग्ज़ैम्स के लिए तैयारी नहीं कर रहे। इससे लगता है आपको परवाह नहीं।',
    ];
    final testQ2Hi = [
      'तुम्हारी बातों से लगता है कि तुम ज्यादा सोचते हो।',
      'ये मोबाईल सैमसंग का है।',
      'मैं खुद को नहीं रोक सकता।',
      'मैं काबिल इन्सान हूँ।',
      'सीता वही लड़की तो है जो उस दिन आयी थी।',
      'हम एकाद दिन में आ सकते हैं।',
      'राम वो लड़का है जिसने तुम्हारी मदद की थी।',
      'हमें सर्दी लग गयी थी।',
      'मैं सिर्फ तुम्हारे लिए ही बना हूँ।',
      'मैं पंजाबी लिखना जानता हूँ।',
    ];
    final testQ2Eng = [
      'Your talks suggest, you think a lot.',
      'This mobile is made by Samsung.',
      'I can\'t hold myself.',
      'I am an able man.',
      'Seeta is the very girl who had come the other day.',
      'We can come in a day or so.',
      'Ram is the boy who had helped you.',
      'We had got cold.',
      'I am meant only for you.',
      'I know how to write Punjabi.',
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
              const Text('📝', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र I & II',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Papers — Special Cases',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10+10', 'Q1 & Q2'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('20', 'marks'),
              ]),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Test I: Eng→Hindi
        commonWidgets.sectionCard(
          title: 'Q1: Hindi में अनुवाद करें (Test I)',
          subtitle: '10 × 1 = 10 marks',
          color: accentColor,
          child: Column(
            children: testQ1Eng.asMap().entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                  child: Center(child: Text('${e.key + 1}',
                      style: const TextStyle(fontFamily: 'Nunito', color: Colors.white,
                          fontWeight: FontWeight.w800, fontSize: 11))),
                ),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(e.value,
                        style: AppTextStyles.labelLarge.copyWith(color: accentColor, fontSize: 12))),
                    commonWidgets.ttsButton(e.value, color: accentColor),
                  ]),
                  const SizedBox(height: 4),
                  Text(testQ1Hi[e.key], style: AppTextStyles.bodyMedium),
                ])),
              ]),
            )).toList(),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Test I: Hindi→Eng
        commonWidgets.sectionCard(
          title: 'Q2: English में अनुवाद करें (Test I)',
          subtitle: '10 × 1 = 10 marks',
          color: AppColors.primary,
          child: Column(
            children: testQ2Hi.asMap().entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                  child: Center(child: Text('${e.key + 1}',
                      style: const TextStyle(fontFamily: 'Nunito', color: Colors.white,
                          fontWeight: FontWeight.w800, fontSize: 11))),
                ),
                const SizedBox(width: 10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(e.value, style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 4),
                  Row(children: [
                    Expanded(child: Text(testQ2Eng[e.key],
                        style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary, fontSize: 12))),
                    commonWidgets.ttsButton(testQ2Eng[e.key], color: AppColors.primary),
                  ]),
                ])),
              ]),
            )).toList(),
          ),
        ),

        // Quotations
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: '💬 Quotations',
          subtitle: '6 महान वचन',
          color: AppColors.accentGold,
          child: Column(
            children: Chapter27Data.quotations.asMap().entries.map((e) {
              final q = e.value;
              return Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: AppColors.accentGold.withOpacity(0.25)),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(q['english']!,
                        style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.accentGold, fontSize: 12,
                            fontStyle: FontStyle.italic))),
                    commonWidgets.ttsButton(q['english']!, color: AppColors.accentGold),
                  ]),
                  const SizedBox(height: 4),
                  Text(q['hindi']!, style: AppTextStyles.bodyMedium),
                ]),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── L10: Chapter Quiz Intro ───────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🤒', 'title': 'Get (बीमार हो जाना)', 'hi': 'got fever / got angry / got cold'},
      {'emoji': '❤️', 'title': 'Fond of & Meant for', 'hi': 'शौकीन / के लिए बना + verb→ing'},
      {'emoji': '🏭', 'title': 'Made in / of / by', 'hi': 'Country / Material / Company'},
      {'emoji': '🧠', 'title': 'Able to & How to', 'hi': 'काबिल / जानना + V1'},
      {'emoji': '🔄', 'title': 'Keep on & Having', 'hi': 'करते रहना / करने के बाद'},
      {'emoji': '💭', 'title': 'ऊँ / Hold / Suggest', 'hi': 'Do I? / रोकना / लगना'},
      {'emoji': '🎯', 'title': 'The very / Or so / The one(s)', 'hi': 'यही / एकाद / वो'},
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
              const Text('अध्याय 27 — फ़ाइनल क्विज़',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Special Cases — Final Quiz',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white,
                      fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                commonWidgets.quizStatBadge('10', 'प्रश्न'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('100', 'XP'),
                const SizedBox(width: AppSpacing.md),
                commonWidgets.quizStatBadge('7', 'टॉपिक'),
              ]),
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 28 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 28!',
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