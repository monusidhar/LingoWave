import 'package:flutter/material.dart';
import '../../data/chapter1_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter1Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter1Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  Widget buildAlphabetContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'अंग्रेज़ी में 1 वर्णमाला (Alphabet) होती है जिसमें 26 अक्षर (Letters) होते हैं।',
          'There is 1 Alphabet in English with 26 letters — vowels & consonants.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'स्वर (Vowels) — 5',
                    style: AppTextStyles.headingMedium.copyWith(color: accentColor),
                  ),
                  commonWidgets.ttsButton('A E I O U'),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['A', 'E', 'I', 'O', 'U']
                    .map((v) => GestureDetector(
                          onTap: () => commonWidgets.onSpeak(v),
                          child: Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                            child: Center(
                              child: Text(
                                v,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'टैप करके सुनें 🔊',
                style: AppTextStyles.labelSmall.copyWith(color: accentColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('सभी 26 अक्षर', style: AppTextStyles.headingMedium),
            Text('टैप करके सुनें 🔊',
                style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemCount: Chapter1Data.alphabetContent.length,
          itemBuilder: (context, i) {
            final item = Chapter1Data.alphabetContent[i];
            final isVowel = item['vowel'] as bool;
            final letter = item['letter'] as String;
            return GestureDetector(
              onTap: () => commonWidgets.onSpeak(letter),
              child: Container(
                decoration: BoxDecoration(
                  color: isVowel ? accentColor.withOpacity(0.12) : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  border: Border.all(
                    color: isVowel ? accentColor.withOpacity(0.4) : AppColors.locked,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      letter,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: isVowel ? accentColor : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      item['hindi'] as String,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 9,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('📌 याद रखें', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppSpacing.sm),
              commonWidgets.caseRow('Upper Case (Capital)', 'A, B, C... W, X, Y, Z'),
              const SizedBox(height: 4),
              commonWidgets.caseRow('Lower Case (Small)', 'a, b, c... w, x, y, z'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildVowelsConsonantsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'अंग्रेज़ी के 26 वर्णों को दो भागों में बाँटा गया है — स्वर (Vowels) और व्यंजन (Consonants)।',
          'English\'s 26 letters are divided into two types — Vowels and Consonants.',
        ),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: 'English Vowels (स्वर)',
          subtitle: '5 vowels',
          color: AppColors.success,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['A', 'E', 'I', 'O', 'U']
                    .map((v) => GestureDetector(
                          onTap: () => commonWidgets.onSpeak(v),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              borderRadius: BorderRadius.circular(AppRadius.md),
                            ),
                            child: Center(
                                child: Text(v,
                                    style: const TextStyle(
                                      fontFamily: 'Nunito',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                    ))),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              Text('a, e, i, o, u (small letters)',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.success)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'English Consonants (व्यंजन)',
          subtitle: '21 consonants (बाकी सभी)',
          color: accentColor,
          child: Wrap(
            spacing: 6,
            runSpacing: 6,
            children: Chapter1Data.alphabetContent
                .where((a) => !(a['vowel'] as bool))
                .map((a) => GestureDetector(
                      onTap: () => commonWidgets.onSpeak(a['letter'] as String),
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          border: Border.all(color: accentColor.withOpacity(0.3)),
                        ),
                        child: Center(
                          child: Text(
                            a['letter'] as String,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                              color: accentColor,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('शब्द से पैराग्राफ तक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.buildChain(),
        const SizedBox(height: AppSpacing.lg),
        commonWidgets.sectionCard(
          title: 'हिंदी के स्वर (Hindi Vowels)',
          subtitle: '12 vowels in Hindi',
          color: const Color(0xFF7C3AED),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Chapter1Data.hindiVowels
                .map((v) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7C3AED).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        border: Border.all(color: const Color(0xFF7C3AED).withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(v['vowel']!,
                              style: AppTextStyles.labelLarge.copyWith(color: const Color(0xFF7C3AED))),
                          const SizedBox(width: 4),
                          Text('(${v['roman']!})', style: AppTextStyles.labelSmall),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💡', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'हिंदी के स्वर और व्यंजन जानना ज़रूरी है क्योंकि जब हम Articles (A, An, The) पढ़ेंगे तब काम आएगा。\n\nKnowing Hindi vowels & consonants helps when learning Articles (A, An, The).',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGreetingsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'अभिवादन का तरीका इस बात पर निर्भर करता है कि आप किस व्यक्ति से, कब और कहाँ मिल रहे हैं।',
          'How you greet depends on the time of day and your relationship with the person.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter1Data.greetingsContent.map((g) => Container(
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
                      Text(g['emoji']!, style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(g['timeHindi']!, style: AppTextStyles.labelLarge),
                            Text(g['timeEn']!,
                                style: AppTextStyles.bodyMedium.copyWith(
                                    fontSize: 12, color: accentColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const Divider(height: 1),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: commonWidgets.greetPill(
                            'मिलने पर', g['greetMeet']!, AppColors.success),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: commonWidgets.greetPill(
                            'जाते समय', g['greetBye']!, AppColors.warning),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.md),
        commonWidgets.sectionCard(
          title: 'Formal vs Casual',
          subtitle: 'औपचारिक बनाम अनौपचारिक',
          color: accentColor,
          child: Column(
            children: [
              commonWidgets.formalRow('Formal (औपचारिक)',
                  'Good Morning / Afternoon / Evening', true),
              const SizedBox(height: 8),
              commonWidgets.formalRow('Casual (अनौपचारिक)', 'Hi / Hello', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMannersContent() {
    final manners = [
      {'no': '1', 'hi': 'कुछ माँगते वक्त', 'en': 'Please / Kindly', 'emoji': '🙏'},
      {'no': '2', 'hi': 'कुछ मिलने पर / महत्व देने पर', 'en': 'Thank you / Thanks', 'emoji': '🤝'},
      {'no': '3', 'hi': 'जब कोई Thanks कहे', 'en': 'Welcome / My pleasure / It\'s ok', 'emoji': '😊'},
      {'no': '4', 'hi': 'फ़ोन पर / दोहराने की विनती', 'en': 'I beg your pardon / Excuse me', 'emoji': '📞'},
      {'no': '5', 'hi': 'बात काटनी हो', 'en': 'Sorry to interrupt / Sorry to intervene', 'emoji': '✋'},
      {'no': '6', 'hi': 'बड़े / महिला को रास्ता देते वक्त', 'en': 'After you', 'emoji': '🚶'},
      {'no': '7', 'hi': 'How are you? के जवाब में', 'en': 'I am fine. What about you?', 'emoji': '😄'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'जब आप शालीनता से पेश आते हैं, तो समाज में इज़्ज़त मिलती है।',
          'When you behave in a civilized manner, you earn respect in society.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...manners.map((m) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
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
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                    child: Center(
                      child: Text(m['no']!,
                          style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(m['hi']!, style: AppTextStyles.labelLarge),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(m['en']!,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: accentColor,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ),
                            commonWidgets.ttsButton(m['en']!),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(m['emoji']!, style: const TextStyle(fontSize: 22)),
                ],
              ),
            )),
      ],
    );
  }

  Widget buildDaysMonthsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'हफ्ते के सात दिन और साल के बारह महीने अंग्रेज़ी में सीखें।',
          'Learn the 7 days of the week and 12 months of the year in English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('हफ्ते के सात दिन', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: Chapter1Data.daysContent.asMap().entries.map((e) {
              final i = e.key;
              final d = e.value;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
                decoration: BoxDecoration(
                  border: i < Chapter1Data.daysContent.length - 1
                      ? const Border(bottom: BorderSide(color: AppColors.lockedBg))
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text('${i + 1}',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: accentColor,
                            )),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(flex: 3, child: Text(d['hindi']!,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary))),
                    Expanded(flex: 3, child: Text(d['english']!,
                        style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
                    Expanded(flex: 3, child: Text(d['pronunciation']!,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 12))),
                    commonWidgets.ttsButton(d['english']!),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('साल के बारह महीने', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.4,
          ),
          itemCount: Chapter1Data.monthsContent.length,
          itemBuilder: (context, i) {
            final m = Chapter1Data.monthsContent[i];
            return GestureDetector(
              onTap: () => commonWidgets.onSpeak(m['english']!),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: accentColor.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(m['english']!,
                            style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
                        Text(m['hindi']!,
                            style: AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                      ],
                    ),
                    Icon(Icons.volume_up_rounded,
                        color: accentColor.withOpacity(0.5), size: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildNumbersContent() {
    final largeNumbers = [
      {'n': '1,000', 'en': 'Thousand', 'hi': 'हज़ार'},
      {'n': '1,00,000', 'en': 'Lakh', 'hi': 'लाख'},
      {'n': '10,00,000', 'en': 'Ten Lakh', 'hi': 'दस लाख'},
      {'n': '1,00,00,000', 'en': 'Crore', 'hi': 'करोड़'},
      {'n': '1,00,00,00,000', 'en': 'Arab (Billion)', 'hi': 'अरब'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'संख्याओं को अंग्रेज़ी में बोलना और लिखना सीखें।',
          'Learn to say and write numbers in English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 से 99 तक', style: AppTextStyles.headingMedium),
            Text('टैप करके सुनें 🔊',
                style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.3,
          ),
          itemCount: Chapter1Data.numbersContent.length,
          itemBuilder: (context, i) {
            final n = Chapter1Data.numbersContent[i];
            return GestureDetector(
              onTap: () => commonWidgets.onSpeak(n['english'] as String),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: accentColor.withOpacity(0.2)),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${n['number']}',
                      style: AppTextStyles.displayMedium
                          .copyWith(color: accentColor, fontSize: 20),
                    ),
                    Text(n['english'] as String,
                        style: AppTextStyles.labelLarge.copyWith(fontSize: 12)),
                    Text(n['hindi'] as String,
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 10)),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('बड़ी संख्याएँ', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...largeNumbers.map((l) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(l['n']!,
                      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary))),
                  Expanded(flex: 2, child: Text(l['en']!,
                      style: AppTextStyles.labelLarge.copyWith(color: accentColor))),
                  Expanded(flex: 2, child: Text(l['hi']!, style: AppTextStyles.bodyMedium)),
                  commonWidgets.ttsButton(l['en']!),
                ],
              ),
            )),
      ],
    );
  }

  Widget buildTimeContent() {
    final formulas = [
      {'hi': 'X बजे (सिर्फ घंटे)', 'en': 'X o\'clock', 'example': '5 बजे → 5 o\'clock'},
      {'hi': 'X बजकर Y मिनट हुए', 'en': 'Y past X', 'example': '5 बजकर 10 मिनट → 10 past 5'},
      {'hi': 'X बजने में Y मिनट बाकी', 'en': 'Y to X', 'example': '5 बजने में 10 मिनट → 10 to 5'},
      {'hi': '30 मिनट = आधा घंटा', 'en': 'Half past X', 'example': '8 बजकर 30 मिनट → Half past 8'},
      {'hi': '15 मिनट = पाव घंटा (बजकर)', 'en': 'Quarter past X', 'example': '8 बजकर 15 मिनट → Quarter past 8'},
      {'hi': '15 मिनट = पाव घंटा (बजने में)', 'en': 'Quarter to X', 'example': '8 बजने में 15 मिनट → Quarter to 8'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'अंग्रेज़ी में समय बताने के लिए इन फ़ॉर्मूलों का प्रयोग करें।',
          'Use these formulas to tell time in English.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('फ़ॉर्मूले (Formulas)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...formulas.map((f) => Container(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(f['hi']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: AppColors.textPrimary)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: Text(f['en']!,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(f['example']!,
                              style: AppTextStyles.bodyMedium.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: accentColor)),
                        ),
                        commonWidgets.ttsButton(f['example']!.split('→').last.trim()),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: AppSpacing.md),
        Text('AM / PM', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.06),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              commonWidgets.amPmRow('🌙', 'रात 12 से दोपहर 12 बजे से पहले', 'AM',
                  AppColors.primary),
              const SizedBox(height: 8),
              commonWidgets.amPmRow('☀️', 'दोपहर 12 से रात 12 बजे से पहले', 'PM',
                  AppColors.accent),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPunctuationContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'विराम चिह्न वाक्य के प्रकार और ठहराव की जानकारी देते हैं।',
          'Punctuation marks indicate the type and pauses in a sentence.',
        ),
        const SizedBox(height: AppSpacing.lg),
        ...Chapter1Data.punctuationContent.map((p) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Center(
                      child: Text(
                        p['symbol']!,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(p['nameEn']!, style: AppTextStyles.labelLarge),
                        Text(p['nameHindi']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                color: accentColor, fontSize: 12)),
                        const SizedBox(height: 4),
                        Text(p['use']!, style: AppTextStyles.bodyMedium),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                          child: Text(p['example']!,
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget buildContractionsContent() {
    final contractions = [
      {'full': 'Does not', 'short': "Doesn't"}, {'full': 'Is not', 'short': "Isn't"},
      {'full': 'Do not', 'short': "Don't"}, {'full': 'Has not', 'short': "Hasn't"},
      {'full': 'I have', 'short': "I've"}, {'full': 'You are', 'short': "You're"},
      {'full': 'He is', 'short': "He's"}, {'full': 'They are', 'short': "They're"},
      {'full': 'We are', 'short': "We're"}, {'full': 'Cannot', 'short': "Can't"},
      {'full': 'I am', 'short': "I'm"}, {'full': 'It is', 'short': "It's"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'दो शब्दों को एक बनाने के लिए, एक सहायक क्रिया (helping verb) और दूसरा "not" या सर्वनाम होना चाहिए।',
          'To make two words one, one must be a helping verb and the other "not" or a pronoun.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: accentColor.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('📌 नियम (Rule)',
                  style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
              const SizedBox(height: 8),
              Text(
                'Helping Verbs: does, is, do, have, are, has, am, it, they, we, can',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "Apostrophe (') replaces the missing letters.",
                style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('सभी Contractions', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...contractions.map((c) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(c['full']!,
                        style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary)),
                  ),
                  const Icon(Icons.arrow_forward_rounded,
                      color: AppColors.textHint, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(c['short']!,
                        style: AppTextStyles.labelLarge.copyWith(color: accentColor)),
                  ),
                  commonWidgets.ttsButton(c['short']!),
                ],
              ),
            )),
      ],
    );
  }

  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔤', 'title': 'Alphabets', 'hi': 'वर्णमाला — 26 letters'},
      {'emoji': '🗣️', 'title': 'Vowels & Consonants', 'hi': 'स्वर और व्यंजन'},
      {'emoji': '👋', 'title': 'Greetings', 'hi': 'अभिवादन — Good Morning etc.'},
      {'emoji': '🙏', 'title': 'Manners', 'hi': 'शिष्टाचार — Please, Thank you'},
      {'emoji': '📅', 'title': 'Days & Months', 'hi': 'दिन और महीने'},
      {'emoji': '🔢', 'title': 'Numbers', 'hi': 'संख्याएँ — 1 to 100+'},
      {'emoji': '🕐', 'title': 'Telling Time', 'hi': 'समय — o\'clock, past, to'},
      {'emoji': '✍️', 'title': 'Punctuation', 'hi': 'विराम चिह्न — ?, !, ., ,'},
      {'emoji': '🔗', 'title': 'Contractions', 'hi': 'संकुचन — Don\'t, I\'ve'},
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
              const Text('अध्याय 1 — फ़ाइनल क्विज़',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white70,
                    fontSize: 14,
                  )),
              const SizedBox(height: 4),
              const Text('Chapter 1 — Final Quiz',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('70', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('9', 'टॉपिक'),
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
          child: Row(
            children: [
              const Text('💡', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'इस क्विज़ में 7 में से 5 सही जवाब देने पर अध्याय 2 खुल जाएगा।\nScore 5/10 or more to unlock Chapter 2!',
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