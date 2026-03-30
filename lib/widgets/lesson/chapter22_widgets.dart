import 'package:flutter/material.dart';
import '../../data/chapter22_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter22Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter22Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _sentenceRow(String hindi, String english, {String? note, Color? color}) {
    final c = color ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hindi,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(english,
                    style: AppTextStyles.labelLarge.copyWith(color: c, fontSize: 13)),
              ),
              commonWidgets.ttsButton(english, color: c),
            ],
          ),
          if (note != null) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: c.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(note,
                  style: AppTextStyles.labelSmall.copyWith(color: c)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _ruleBox(String rule, {String? emoji}) {
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
          Expanded(
            child: Text(rule, style: AppTextStyles.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _conjPill(String conj, String hindi, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(conj,
              style: AppTextStyles.labelLarge.copyWith(color: color, fontSize: 13)),
          const SizedBox(width: 6),
          Text('($hindi)',
              style: AppTextStyles.labelSmall.copyWith(color: color)),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm, top: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.headingMedium),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text(subtitle,
                style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
          ),
        ],
      ),
    );
  }

  /// Numbered sentence tile — used in practice sets
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

  /// Section card for a practice set block
  Widget _practiceSetCard({
    required String title,
    required String subtitle,
    required Color color,
    required List<Map<String, String>> data,
    required int startIndex,
  }) {
    return commonWidgets.sectionCard(
      title: title,
      subtitle: subtitle,
      color: color,
      child: Column(
        children: data.asMap().entries.map((e) {
          final raw = e.value['hindi']!;
          // strip leading "N. " if present
          final dotIdx = raw.indexOf('. ');
          final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
          return _practiceTile(
            startIndex + e.key,
            hindi,
            e.value['english']!,
            color,
          );
        }).toList(),
      ),
    );
  }

  // ─── L1: And / Or / But / Except ──────────────────────────────────────────
  Widget buildIntroContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Conjunctions ऐसे शब्द होते हैं जो दो शब्दों या वाक्यों को जोड़ देते हैं — वाक्य छोटा होता है, अर्थ नहीं बदलता।',
          'Conjunctions connect two words or sentences, shortening them without changing the meaning.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.75)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: const Column(
            children: [
              Text('🔗', style: TextStyle(fontSize: 36)),
              SizedBox(height: 8),
              Text('Conjunction',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('समुच्चय बोधक अव्यय',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('And (और) / Or (या)', '2 conjunctions'),
        ...Chapter22Data.andOrButData.take(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!,
                note: d['keyword'], color: AppColors.success)),
        _sectionHeader('But (लेकिन / सिवाय / बल्कि)', '3 meanings'),
        _ruleBox(
          '"But" के तीन अर्थ:\n1. लेकिन / पर / परन्तु — सामान्य contrast\n2. सिवाय / अलावा — "except" (but/except दोनों)\n3. बल्कि — Not X, but Y (correction)',
        ),
        ...Chapter22Data.andOrButData.skip(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!,
                note: d['keyword'], color: AppColors.warning)),
        const SizedBox(height: AppSpacing.sm),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('💡 नोट',
                  style: AppTextStyles.labelLarge.copyWith(color: AppColors.primary)),
              const SizedBox(height: 6),
              const Text(
                '"सिवाय" के लिए "but" के साथ "except" भी प्रयोग कर सकते हैं:\n'
                'I can go anywhere but your home.\n'
                'I can go anywhere except your home.',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── L2: Because / Since / Also / Too / Either / Even ─────────────────────
  Widget buildBecauseContent() {
    final alsoRules = [
      {'word': 'Also', 'position': 'Helping verb के बाद, main verb से पहले', 'sentence': 'Positive', 'example': 'I am also good.'},
      {'word': 'Too', 'position': 'वाक्य के अंत में', 'sentence': 'Positive', 'example': 'I am good too.'},
      {'word': 'As well', 'position': 'वाक्य के अंत में', 'sentence': 'Positive', 'example': 'I am good as well.'},
      {'word': 'Even', 'position': 'वाक्य के शुरू में (Interrogative में नहीं)', 'sentence': 'Positive & Negative', 'example': 'Even I am good.'},
      {'word': 'Either', 'position': 'वाक्य के अंत में', 'sentence': 'Negative', 'example': 'I am not good either.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'क्योंकि / चूंकि के लिए — For, As, Because, Since — चारों का प्रयोग कर सकते हैं। साथ ही "भी" के लिए सही शब्द चुनना सीखें।',
          'Learn when to use because/since/as/for, and how to translate "भी" correctly.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('क्योंकि / चूंकि (For/As/Because/Since)', 'नियम'),
        _ruleBox(
          '• "Because" — केवल वाक्य के बीच में\n'
          '• "Since / As" — केवल वाक्य के शुरू में\n'
          '• "For" — वाक्य के बीच में, पर comma ज़रूरी\n'
          '• "As" — शुरू और बीच दोनों में',
        ),
        ...Chapter22Data.becauseData.take(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['note'], color: AppColors.primary)),
        const SizedBox(height: AppSpacing.md),
        _sectionHeader('"भी" का सही अनुवाद', 'Also/Too/Either/Even'),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: alsoRules.asMap().entries.map((e) {
              final i = e.key;
              final r = e.value;
              final isNeg = r['sentence']!.contains('Negative');
              final color = isNeg ? AppColors.error : AppColors.success;
              return Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: i < alsoRules.length - 1
                      ? const Border(bottom: BorderSide(color: AppColors.lockedBg))
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(r['word']!,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13)),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r['position']!,
                              style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                          Text(r['example']!,
                              style: AppTextStyles.labelSmall.copyWith(
                                  color: color, fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(r['sentence']!,
                          style: AppTextStyles.labelSmall
                              .copyWith(color: color, fontSize: 9)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _sectionHeader('उदाहरण (Examples)', '5 sentences'),
        ...Chapter22Data.becauseData.skip(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['note'])),
      ],
    );
  }

  // ─── L3: As + Adj + As / As (जैसा) / As well as ──────────────────────────
  Widget buildAsAsContent() {
    final asWellAsExamples = [
      {'hindi': 'He, as well as his friends, is good.', 'note': 'He → is (पहला subject)'},
      {'hindi': 'I, as well as my friends, am here.', 'note': 'I → am (पहला subject)'},
      {'hindi': 'He, as well as his 3 brothers, is going.', 'note': 'He → is (पहला subject)'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"As + विशेषण + as" = उतना...जितना। साथ ही "As" के अलग-अलग अर्थ और "As well as" का नियम सीखें।',
          '"As + adj + as" = comparison. Learn different meanings of "as" and the "as well as" rule.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('As + Adjective + As (उतना...जितना)', 'Comparison'),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.07),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _conjPill('As', 'उतना', accentColor),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('+', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  _conjPill('Adjective', 'विशेषण', AppColors.success),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('+', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  _conjPill('As', 'जितना', accentColor),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'As tall as Amit',
                  'As black as coal',
                  'As red as blood',
                  'As strong as my dad',
                  'As beautiful as you',
                ].map((ex) => GestureDetector(
                  onTap: () => commonWidgets.onSpeak(ex),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      border: Border.all(color: accentColor.withOpacity(0.3)),
                    ),
                    child: Text(ex,
                        style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...Chapter22Data.asAsData.take(3).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['type'])),
        _sectionHeader('As (जैसा / के तौर पर / के नाते)', 'Other uses'),
        ...Chapter22Data.asAsData.skip(3).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['type'], color: AppColors.primary)),
        _sectionHeader('As well as (साथ ही साथ)', 'Special Rule ⚠️'),
        _ruleBox(
          'नियम: "As well as" दो subjects के बीच आने पर Helping Verb पहले वाले Subject के अनुसार लगती है।\n\n'
          'Rule: Helping verb follows the FIRST subject.',
          emoji: '⚠️',
        ),
        ...asWellAsExamples.map((e) => Container(
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
                    Row(
                      children: [
                        commonWidgets.ttsButton(e['hindi']!),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(e['hindi']!,
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: accentColor, fontSize: 13)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(e['note']!,
                        style: AppTextStyles.labelSmall
                            .copyWith(color: AppColors.success)),
                  ],
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  // ─── L4: As soon as / As far as / As if / As though ──────────────────────
  Widget buildAsGroupContent() {
    final asSoonData = [
      {'hindi': 'जैसे ही वो आया, मैं चला गया।', 'english': 'As soon as he came, I left. / The moment he came, I left.'},
      {'hindi': 'जितनी जल्दी हो सके चले जाओ।', 'english': 'Leave as soon as possible.'},
    ];
    final asFarData = [
      {'hindi': 'जहाँ तक मैं जानता हूँ उसके दो बच्चे हैं।', 'english': 'As far as I know, he has two children.'},
      {'hindi': 'जहाँ तक मेरी पढ़ाई का सवाल है, मैंने सिर्फ 12वीं पास की है।', 'english': 'As far as my studies are concerned, I am only 12th pass.'},
    ];
    final asIfData = [
      {'hindi': 'तुम ऐसे बात करते हो मानो तुम्हें सब पता हो।', 'english': 'You talk as if you know everything.'},
      {'hindi': 'राम मुझे डाँटने लगा जैसे कि वो मेरा बॉस हो।', 'english': 'Ram started scolding me as though he was my boss.'},
      {'hindi': 'वो मुझसे इस तरह बात कर रहा था जैसे मैं उसका नौकर हूँ।', 'english': 'He was speaking with me as if I was his servant.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          '"As" से बनने वाले कई महत्वपूर्ण Conjunctions — as soon as (जैसे ही), as far as (जहाँ तक), as if/as though (मानो)।',
          'Important "as" conjunctions — as soon as, as far as, as if/as though.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('As soon as / The moment (जैसे ही)', '2 equivalents'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.success.withOpacity(0.25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _conjPill('As soon as', 'जैसे ही', AppColors.success),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text('=', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _conjPill('The moment', 'जैसे ही', AppColors.success),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...asSoonData.map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, color: AppColors.success)),
        _sectionHeader('As far as (जहाँ तक)', 'Scope/Knowledge'),
        ...asFarData.map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, color: AppColors.primary)),
        _sectionHeader('As if / As though (मानो / जैसे कि)', 'Imaginary comparison'),
        _ruleBox(
          '"As if" और "As though" दोनों एक ही अर्थ रखते हैं।\n'
          'Past incident बताने पर "was/were" का प्रयोग।',
          emoji: '💡',
        ),
        ...asIfData.map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, color: AppColors.warning)),
      ],
    );
  }

  // ─── L5: If / Although / Lest / Otherwise / So that / Provided ─────────────
  Widget buildIfAlthoughContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'तीन तरह के "If" sentences, "Although-Yet" का नियम, "Lest", "Otherwise", "So that" और "Provided" सीखें।',
          'Three types of "if", the although-yet rule, lest, otherwise, so that, and provided.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('If (अगर / यदि)', '3 types'),
        ...Chapter22Data.ifData.map((d) {
          final colors = [accentColor, AppColors.primary, AppColors.success];
          final idx = Chapter22Data.ifData.indexOf(d);
          final c = colors[idx % colors.length];
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: c.withOpacity(0.3)),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(d['type']!,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(d['formula']!,
                          style: AppTextStyles.labelSmall.copyWith(color: c)),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(d['hindi']!, style: AppTextStyles.bodyMedium),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(d['english']!,
                          style: AppTextStyles.labelLarge.copyWith(color: c, fontSize: 13)),
                    ),
                    commonWidgets.ttsButton(d['english']!, color: c),
                  ],
                ),
              ],
            ),
          );
        }),
        _sectionHeader('Although / Though / Even if (हालाँकि)', 'Rule ⚠️'),
        _ruleBox(
            'नियम: "Although" के साथ "yet" का प्रयोग करना अनिवार्य है।\nRule: "Although" MUST be followed by "yet".',
            emoji: '⚠️'),
        ...[
          {'hindi': 'हालाँकि मैं गरीब हूँ, पर फिर भी मैं मदद करूँगा।', 'english': 'Although I am poor, yet I will try to help you.'},
          {'hindi': 'भले ही वो कभी स्कूल नहीं गया, फिर भी सब आता है।', 'english': 'Though he never went to school, still he knows everything.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.warning)),
        _sectionHeader('Lest (कहीं ऐसा न हो)', 'should के साथ'),
        _ruleBox('नियम: "Lest" के बाद हमेशा "should" का प्रयोग होता है।', emoji: '📌'),
        ...[
          {'hindi': 'मैं मेहनत करूँगा कहीं ऐसा न हो कि मैं फेल हो जाऊँ।', 'english': 'I\'ll work hard lest I should fail.'},
          {'hindi': 'वहाँ मत जाओ ये न हो कि वो तुम्हें डाँटे।', 'english': 'Don\'t go there lest he should scold you.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.error)),
        _sectionHeader('Otherwise / Or else (वरना / नहीं तो)', ''),
        ...[
          {'hindi': 'मैं मेहनत करूँगा वरना फेल हो जाऊँगा।', 'english': 'I\'ll work hard otherwise I will fail.'},
          {'hindi': 'वहाँ मत जाओ नहीं तो वो तुम्हें डाँटेगा।', 'english': 'Don\'t go there or else he will scold you.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.accent)),
        _sectionHeader('So that (ताकि)', ''),
        ...[
          {'hindi': 'मैं मेहनत करूँगा ताकि मैं पास हो जाऊँ।', 'english': 'I\'ll work hard so that I pass.'},
          {'hindi': 'मेरे साथ ही रहो ताकि मैं बोर न होऊँ।', 'english': 'Be with me so that I don\'t feel bored.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.success)),
        _sectionHeader('Provided / Providing (बशर्ते)', 'Rule'),
        _ruleBox('नियम: "Provided" के बाद हमेशा Present Indefinite Tense।', emoji: '📌'),
        _sentenceRow(
          'मैं तुमसे मिलूंगा पर तब जब तुम वादा करो।',
          'I\'ll meet you provided you promise me.',
          color: AppColors.primary,
        ),
      ],
    );
  }

  // ─── L6: WH as Conjunctions / Such / That's what/where/why ───────────────
  Widget buildWHContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'WH Family के शब्द Conjunction के रूप में भी प्रयोग होते हैं। साथ ही "Such" और "That\'s what/where/why" सीखें।',
          'WH-words used as conjunctions, "such", and "that\'s what/where/why" expressions.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('WH Family as Conjunctions', '12 words'),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: Chapter22Data.whConjData.asMap().entries.map((e) {
              final i = e.key;
              final d = e.value;
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: 12),
                decoration: BoxDecoration(
                  border: i < Chapter22Data.whConjData.length - 1
                      ? const Border(bottom: BorderSide(color: AppColors.lockedBg))
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 90,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(AppRadius.full),
                          ),
                          child: Text(d['english']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12)),
                        ),
                        const SizedBox(width: 10),
                        Text('= ${d['hindi']!}',
                            style: AppTextStyles.labelLarge.copyWith(
                                color: AppColors.textPrimary, fontSize: 13)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(d['example']!,
                        style: AppTextStyles.bodyMedium.copyWith(
                            fontStyle: FontStyle.italic,
                            color: AppColors.textSecondary,
                            fontSize: 12)),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _ruleBox(
          'Proper noun (जैसे Ram) के बाद comma लगता है।\n'
          'Common noun (जैसे Pen) के बाद comma नहीं।\n\n'
          '✓ Ram, who was with me, is my friend.\n'
          '✓ Pen which I had is not yours.',
          emoji: '✏️',
        ),
        _sectionHeader('Such (ऐसा / इस तरह का)', ''),
        ...[
          {'hindi': 'ऐसे लोग स्वार्थी होते हैं।', 'english': 'Such people are selfish.'},
          {'hindi': 'उसने इस तरह से मुझे देखा कि मुझे लगा वो मुझे चाहती है।', 'english': 'She looked at me in such a way that I felt she liked me.'},
          {'hindi': 'मेरे पास कई चीजें हैं जैसे कि कम्प्यूटर, लैपटॉप आदि।', 'english': 'I have many things such as a computer, a laptop etc.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.primary)),
        _sectionHeader('That\'s what / where / why / when / how', 'Focus expressions'),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: Chapter22Data.thatsData.asMap().entries.map((e) {
              final i = e.key;
              final d = e.value;
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md, vertical: 12),
                decoration: BoxDecoration(
                  border: i < Chapter22Data.thatsData.length - 1
                      ? const Border(bottom: BorderSide(color: AppColors.lockedBg))
                      : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(d['key']!,
                              style: AppTextStyles.labelLarge
                                  .copyWith(color: accentColor, fontSize: 13)),
                          Text('= ${d['hindi']!}',
                              style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(d['example']!,
                          style: AppTextStyles.bodyMedium.copyWith(
                              fontStyle: FontStyle.italic,
                              fontSize: 11,
                              color: AppColors.textSecondary)),
                    ),
                    commonWidgets.ttsButton(d['example']!),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── L7: Either-or / Neither-nor / Not only-but also / While / No sooner / etc.
  Widget buildSpecialContent() {
    final stillEvenNow = [
      {'hindi': 'मैं अभी भी पढ़ रहा हूँ।', 'english': 'I am still studying. / I am studying even now.'},
      {'hindi': 'क्या राम अभी भी खेलता है?', 'english': 'Does Ram still play? / Does Ram play even now?'},
    ];
    final tillUnless = [
      {'hindi': 'जब तक मैं नहीं आता, तुम मत जाना।', 'english': 'Till I don\'t come, you don\'t go.', 'pair': 'Till'},
      {'hindi': 'जब तक राम नहीं आयेगा, हम नहीं जायेंगे।', 'english': 'Until Ram comes, we will not go.', 'pair': 'Until'},
      {'hindi': 'जब तक मैं नहीं आता, तुम मत जाना।', 'english': 'Unless I come, you don\'t go.', 'pair': 'Unless'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में बाकी सभी महत्वपूर्ण Conjunctions — Either-or, Neither-nor, Not only-but also, While, No sooner-than, Still, Yet, Till, Unless, Whether, Whereas।',
          'Remaining important conjunctions covered in this lesson.',
        ),
        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Either...or / Neither...nor', ''),
        ...Chapter22Data.specialConjData.take(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['pair'], color: AppColors.primary)),
        _sectionHeader('So (वो भी) / Nor/Neither (वो भी नहीं)', ''),
        ...Chapter22Data.specialConjData.skip(2).take(2).map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['pair'], color: AppColors.success)),
        _sectionHeader('Not only...but also (न केवल...बल्कि...भी)', ''),
        _sentenceRow(
          Chapter22Data.specialConjData.last['hindi']!,
          Chapter22Data.specialConjData.last['english']!,
          note: Chapter22Data.specialConjData.last['pair'],
          color: AppColors.warning,
        ),
        _sectionHeader('While + verb+ing (जब दो काम साथ)', ''),
        _ruleBox('नियम: "while" के बाद आने वाली क्रिया के साथ "-ing" अनिवार्य।', emoji: '📌'),
        ...[
          {'hindi': 'मैं चलते हुए पढ़ रहा हूँ।', 'english': 'I am studying while walking.'},
          {'hindi': 'क्या राम पढ़ते हुए खाना खाता है?', 'english': 'Does Ram eat food while studying?'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: accentColor)),
        _sectionHeader('No sooner had...than (ही था कि)', ''),
        _ruleBox('"No sooner had" के साथ "than" का प्रयोग।', emoji: '📌'),
        ...[
          {'hindi': 'मैं पहुँचा ही था कि वो आ गये।', 'english': 'No sooner had I reached than they came.'},
          {'hindi': 'हम स्टेशन पहुँचे ही थे कि ट्रेन चल दी।', 'english': 'No sooner had we reached the station than the train left.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.error)),
        _sectionHeader('Still / Even now (अभी भी / आज भी)', ''),
        _ruleBox('"still" → helping verb के बाद, verb से पहले\n"even now" → वाक्य के अंत में', emoji: '📌'),
        ...stillEvenNow.map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, color: AppColors.primary)),
        _sectionHeader('Till / Until / Unless (जब तक / जब तक नहीं)', ''),
        _ruleBox('इनके बाद Present Indefinite या Past Indefinite — Future नहीं।', emoji: '⚠️'),
        ...tillUnless.map((d) =>
            _sentenceRow(d['hindi']!, d['english']!, note: d['pair'])),
        _sectionHeader('Whether...or (चाहे...या / कि...या)', ''),
        ...[
          {'hindi': 'चाहे वो आये या न आये, मैं तो जाऊँगा।', 'english': 'Whether he comes or not, I will go.'},
          {'hindi': 'मैं कह नहीं सकता कि वो खेलेगा या नहीं।', 'english': 'I can\'t say, whether he will play or not.'},
        ].map((d) => _sentenceRow(d['hindi']!, d['english']!, color: AppColors.warning)),
        _sectionHeader('Whereas / While (जबकि)', ''),
        _sentenceRow(
          'मेरे पास 10 रु हैं जबकि तुम्हारे पास 50।',
          'I have Rs 10 whereas/while you have 50.',
          color: AppColors.success,
        ),
      ],
    );
  }

  // ─── L8: Practice Exercise — 148 sentences in 6 sets ─────────────────────
  Widget buildPracticeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में अब तक सीखे सभी Conjunctions का अभ्यास करें — 148 वाक्य।',
          'Practice all conjunctions learned in this chapter — 148 sentences.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Stats banner
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.75)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonWidgets.quizStatBadge('148', 'वाक्य'),
              commonWidgets.quizStatBadge('6', 'सेट'),
              commonWidgets.quizStatBadge('Hindi→Eng', 'अनुवाद'),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _practiceSetCard(
          title: 'सेट 1',
          subtitle: 'Q 1–25',
          color: accentColor,
          data: Chapter22Data.practiceSet1,
          startIndex: 1,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 2',
          subtitle: 'Q 26–50',
          color: AppColors.primary,
          data: Chapter22Data.practiceSet2,
          startIndex: 26,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 3',
          subtitle: 'Q 51–75',
          color: AppColors.success,
          data: Chapter22Data.practiceSet3,
          startIndex: 51,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 4',
          subtitle: 'Q 76–100',
          color: AppColors.warning,
          data: Chapter22Data.practiceSet4,
          startIndex: 76,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 5',
          subtitle: 'Q 101–125',
          color: const Color(0xFF7C3AED),
          data: Chapter22Data.practiceSet5,
          startIndex: 101,
        ),
        const SizedBox(height: AppSpacing.md),
        _practiceSetCard(
          title: 'सेट 6',
          subtitle: 'Q 126–148',
          color: AppColors.accent,
          data: Chapter22Data.practiceSet6,
          startIndex: 126,
        ),
      ],
    );
  }

  // ─── L9: Test Papers I & II ───────────────────────────────────────────────
  Widget buildTestPaperContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header banner
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
              const Text('📋', style: TextStyle(fontSize: 48)),
              const SizedBox(height: AppSpacing.sm),
              const Text('परीक्षा पत्र I और II',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 13)),
              const Text('Test Papers I & II — Chapter 22',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('3', 'sections'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('20+30', 'sentences'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('MCQ+Correct', 'types'),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        // ── Test Paper I ──────────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Text('📝', style: const TextStyle(fontSize: 28)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Test Paper — I',
                        style: AppTextStyles.headingMedium
                            .copyWith(color: accentColor)),
                    Text('Q1: Translate (20)  |  Q2: MCQ (10)  |  Q3: Correct (10)',
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Q1 — Translation
        _sectionHeader('Q1: Hindi → English (अनुवाद)', '20 sentences'),
        ...Chapter22Data.testPaper1Q1.asMap().entries.map((e) {
          final raw = e.value['hindi']!;
          final dotIdx = raw.indexOf('. ');
          final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
          return _practiceTile(
            e.key + 1,
            hindi,
            e.value['english']!,
            accentColor,
          );
        }),

        const SizedBox(height: AppSpacing.xl),

        // Q2 — MCQ
        _sectionHeader('Q2: सही विकल्प चुनें (MCQ)', '10 questions'),
        ...Chapter22Data.testPaper1Q2.asMap().entries.map((e) {
          final i = e.key;
          final d = e.value;
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(d['question']!,
                          style: AppTextStyles.labelLarge),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.lockedBg,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(d['options']!,
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.success.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('✅ ', style: TextStyle(fontSize: 14)),
                          Text(d['answer']!,
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: AppColors.success, fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(d['explanation']!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.xl),

        // Q3 — Error Correction
        _sectionHeader('Q3: गलत वाक्य सुधारें', '10 corrections'),
        ...Chapter22Data.testPaper1Q3.asMap().entries.map((e) {
          final i = e.key;
          final d = e.value;
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
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: AppColors.error, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text('❌ ${d['incorrect']!}',
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.error, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.success.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('✅ ${d['correct']!}',
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.success, fontSize: 12)),
                          ),
                          commonWidgets.ttsButton(d['correct']!,
                              color: AppColors.success),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('📌 ${d['rule']!}',
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.primary)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: AppSpacing.xxl),

        // ── Test Paper II ─────────────────────────────────────────────────
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Text('📋', style: TextStyle(fontSize: 28)),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Test Paper — II',
                        style: AppTextStyles.headingMedium
                            .copyWith(color: AppColors.primary)),
                    Text('Q1: Translate (30)  |  Q2: Error Correction (10)',
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Q1 — Translation (30 sentences)
        _sectionHeader('Q1: Hindi → English (अनुवाद)', '30 sentences'),
        ...Chapter22Data.testPaper2Q1.asMap().entries.map((e) {
          final raw = e.value['hindi']!;
          final dotIdx = raw.indexOf('. ');
          final hindi = (dotIdx != -1 && dotIdx < 4) ? raw.substring(dotIdx + 2) : raw;
          return _practiceTile(
            e.key + 1,
            hindi,
            e.value['english']!,
            AppColors.primary,
          );
        }),

        const SizedBox(height: AppSpacing.xl),

        // Q2 — Error Correction (10 sentences)
        _sectionHeader('Q2: गलत वाक्य सुधारें', '10 corrections'),
        ...Chapter22Data.testPaper2Q2.asMap().entries.map((e) {
          final i = e.key;
          final d = e.value;
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
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: AppColors.error, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text('❌ ${d['incorrect']!}',
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.error, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.success.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('✅ ${d['correct']!}',
                                style: AppTextStyles.labelLarge.copyWith(
                                    color: AppColors.success, fontSize: 12)),
                          ),
                          commonWidgets.ttsButton(d['correct']!,
                              color: AppColors.success),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('📌 ${d['rule']!}',
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.primary)),
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

  // ─── L10: Chapter Quiz Intro ──────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔗', 'title': 'And / Or / But / Except', 'hi': 'और / या / लेकिन / सिवाय'},
      {'emoji': '💡', 'title': 'Because / Since / Also / Too', 'hi': 'क्योंकि / चूंकि / भी'},
      {'emoji': '⚖️', 'title': 'As + Adj + As / As well as', 'hi': 'उतना...जितना / साथ ही साथ'},
      {'emoji': '🌀', 'title': 'As soon as / As far as / As if', 'hi': 'जैसे ही / जहाँ तक / मानो'},
      {'emoji': '🎯', 'title': 'If / Although / Lest / So that', 'hi': 'अगर / हालाँकि / कहीं ऐसा न / ताकि'},
      {'emoji': '❓', 'title': 'WH as Conjunctions / Such', 'hi': 'WH शब्द / ऐसा / यही तो'},
      {'emoji': '🔄', 'title': 'Either-Or / While / Unless / Whereas', 'hi': 'या तो / जबकि / जब तक नहीं'},
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
              const Text('अध्याय 22 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Conjunctions — Final Quiz',
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
                  '6/10 या उससे अधिक अंक लाने पर अध्याय 23 खुल जाएगा।\nScore 6/10 or more to unlock Chapter 23!',
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