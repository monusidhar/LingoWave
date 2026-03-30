import '../models/lesson_model.dart';

/// Chapter 3 — Pronunciation (उच्चारण)
class Chapter3Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 3,
        title: 'Pronunciation',
        titleHindi: 'उच्चारण',
        description: 'सही उच्चारण सीखें',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Why Pronunciation & Vowel A',
              titleHindi: 'उच्चारण क्यों जरूरी + A का उच्चारण',
              emoji: '🔊', type: LessonType.ch3Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Vowel E & I Sounds',
              titleHindi: 'E और I का उच्चारण',
              emoji: '🗣️', type: LessonType.ch3VowelEI, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Vowel O & U Sounds',
              titleHindi: 'O और U का उच्चारण',
              emoji: '👄', type: LessonType.ch3VowelOU, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'S, SH, TH, C, G Sounds',
              titleHindi: 'स, श, द/थ, स/क, ग/ज की ध्वनि',
              emoji: '🔤', type: LessonType.ch3SoundsSH, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'J, Z & Special Sounds',
              titleHindi: 'ज, ज़, श़ और S से शुरू होने वाले शब्द',
              emoji: '⚡', type: LessonType.ch3SoundsJZ, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch3ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch3Intro:       return introVowelAQuestions;
      case LessonType.ch3VowelEI:     return vowelEIQuestions;
      case LessonType.ch3VowelOU:     return vowelOUQuestions;
      case LessonType.ch3SoundsSH:    return soundsSHQuestions;
      case LessonType.ch3SoundsJZ:    return soundsJZQuestions;
      case LessonType.ch3ChapterQuiz: return chapterFinalQuestions;
      default:                        return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 QUIZ — Why Pronunciation + Vowel A
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> introVowelAQuestions = [
    QuizQuestion(
      questionEn: 'What is the correct pronunciation of "Pronunciation"?',
      questionHi: '"Pronunciation" का सही उच्चारण क्या है?',
      options: ['प्रनाउनसिएशन', 'प्रननसिएशन', 'प्रनन्सिएशन', 'प्रोनन्सिएशन'],
      correctIndex: 1,
      explanation: '"Pronunciation" का सही उच्चारण "प्रननसिएशन" है, न कि "प्रनाउनसिएशन"।',
    ),
    QuizQuestion(
      questionEn: 'When "a" is used alone in a sentence (like "a man"), it is pronounced as ___.',
      questionHi: 'जब "a" वाक्य में अकेला आता है (जैसे "a man"), तो उसे ___ बोलते हैं।',
      options: ['ए', 'आ', 'अ', 'ऐ'],
      correctIndex: 2,
      explanation: 'जब "a" अकेले आता है ("a man", "a good boy") तो उसे "अ" बोलते हैं, "ए" नहीं।',
    ),
    QuizQuestion(
      questionEn: '"Name" is pronounced as ___.',
      questionHi: '"Name" का उच्चारण ___ है।',
      options: ['नाम', 'नेम', 'नैम', 'नम'],
      correctIndex: 1,
      explanation: '"Name" = "नेम" — यहाँ A की आवाज़ "ए" है।',
    ),
    QuizQuestion(
      questionEn: '"Map" is pronounced as ___.',
      questionHi: '"Map" का उच्चारण ___ है।',
      options: ['मेप', 'माप', 'मैप', 'मिप'],
      correctIndex: 2,
      explanation: '"Map" = "मैप" — यहाँ A की आवाज़ "ऐ" है।',
    ),
    QuizQuestion(
      questionEn: '"Cheek" means ___ and is pronounced as ___.',
      questionHi: '"Cheek" का मतलब ___ है और इसे ___ बोलते हैं।',
      options: ['मुर्गी का बच्चा — चिक', 'गाल — चीक', 'पक्षी — चिक', 'गाल — चेक'],
      correctIndex: 1,
      explanation: '"Cheek" = गाल = "चीक"। "Chick" (चिक) = मुर्गी का बच्चा। उच्चारण में अंतर बहुत जरूरी है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 QUIZ — Vowel E & I
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> vowelEIQuestions = [
    QuizQuestion(
      questionEn: '"Week" and "Weak" are pronounced ___.',
      questionHi: '"Week" और "Weak" का उच्चारण ___ है।',
      options: ['वेक और वीक', 'वीक और वेक', 'दोनों = वीक', 'दोनों = वेक'],
      correctIndex: 2,
      explanation: '"Week" (सप्ताह) और "Weak" (कमजोर) दोनों = "वीक"। EE और EA दोनों = ई की आवाज़।',
    ),
    QuizQuestion(
      questionEn: '"Is" is pronounced as ___.',
      questionHi: '"Is" का उच्चारण ___ है।',
      options: ['ईज़', 'इज़', 'आइज़', 'एज़'],
      correctIndex: 1,
      explanation: '"Is" = "इज़" — यहाँ I की आवाज़ "इ" (छोटी इ) है।',
    ),
    QuizQuestion(
      questionEn: '"File" is pronounced as ___.',
      questionHi: '"File" का उच्चारण ___ है।',
      options: ['फिल', 'फेल', 'फाइल', 'फील'],
      correctIndex: 2,
      explanation: '"File" = "फाइल" — यहाँ I की आवाज़ "आइ" है।',
    ),
    QuizQuestion(
      questionEn: '"Sleep" (not "Slip") means ___.',
      questionHi: '"Sleep" (न कि "Slip") का मतलब ___ है।',
      options: ['फिसलना', 'सोना', 'दौड़ना', 'बैठना'],
      correctIndex: 1,
      explanation: '"Sleep" (स्लीप) = सोना। "Slip" (स्लिप) = फिसलना। उच्चारण में छोटा फर्क बड़ा बदलाव लाता है।',
    ),
    QuizQuestion(
      questionEn: '"Third" is pronounced as ___.',
      questionHi: '"Third" का उच्चारण ___ है।',
      options: ['थर्ड', 'थीर्ड', 'थिर्ड', 'थायर्ड'],
      correctIndex: 0,
      explanation: '"Third" = "थर्ड" — यहाँ I की आवाज़ "अ" है (IR combination)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 QUIZ — Vowel O & U
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> vowelOUQuestions = [
    QuizQuestion(
      questionEn: '"Cook" is pronounced as ___.',
      questionHi: '"Cook" का उच्चारण ___ है।',
      options: ['कूक', 'कुक', 'कोक', 'काक'],
      correctIndex: 1,
      explanation: '"Cook" = "कुक" — OO की आवाज़ "उ" (छोटी) है जब OO पतली आवाज़ में हो।',
    ),
    QuizQuestion(
      questionEn: '"Son" is pronounced as ___.',
      questionHi: '"Son" का उच्चारण ___ है।',
      options: ['सोन', 'सन (अ की आवाज़)', 'सॉन', 'सून'],
      correctIndex: 1,
      explanation: '"Son" = "सन" — यहाँ O की आवाज़ "अ" है।',
    ),
    QuizQuestion(
      questionEn: '"Cow" is pronounced as ___.',
      questionHi: '"Cow" का उच्चारण ___ है।',
      options: ['को', 'कोव', 'काउ', 'कॉव'],
      correctIndex: 2,
      explanation: '"Cow" = "काउ" — OW की आवाज़ "आउ" है।',
    ),
    QuizQuestion(
      questionEn: '"Run" is pronounced as ___.',
      questionHi: '"Run" का उच्चारण ___ है।',
      options: ['रून', 'रन (अ की आवाज़)', 'रॉन', 'रान'],
      correctIndex: 1,
      explanation: '"Run" = "रन" — यहाँ U की आवाज़ "अ" है।',
    ),
    QuizQuestion(
      questionEn: '"Use" is pronounced as ___.',
      questionHi: '"Use" का उच्चारण ___ है।',
      options: ['अज़', 'उज़', 'यूज़', 'ओज़'],
      correctIndex: 2,
      explanation: '"Use" = "यूज़" — यहाँ U की आवाज़ "यू" है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 QUIZ — S/SH/TH/C/G sounds
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> soundsSHQuestions = [
    QuizQuestion(
      questionEn: 'When S is followed by H (SH), the sound is ___.',
      questionHi: 'जब S के बाद H आए (SH), तो आवाज़ ___ होती है।',
      options: ['स', 'श', 'ज़', 'क'],
      correctIndex: 1,
      explanation: 'SH combination = "श" की आवाज़। जैसे: Shirt = शर्ट, Fish = फिश।',
    ),
    QuizQuestion(
      questionEn: '"The" is pronounced as ___.',
      questionHi: '"The" का उच्चारण ___ है।',
      options: ['थे', 'द / दी', 'ज़े', 'से'],
      correctIndex: 1,
      explanation: '"The" = "द" (consonant से पहले) या "दी" (vowel से पहले)। TH = द की आवाज़।',
    ),
    QuizQuestion(
      questionEn: '"Think" — here TH sounds like ___.',
      questionHi: '"Think" में TH की आवाज़ ___ है।',
      options: ['द', 'थ', 'ज़', 'श'],
      correctIndex: 1,
      explanation: '"Think" = "थिंक" — यहाँ TH = "थ" की आवाज़। "The" में TH = "द"।',
    ),
    QuizQuestion(
      questionEn: '"Nice" — C here sounds like ___.',
      questionHi: '"Nice" में C की आवाज़ ___ है।',
      options: ['क', 'स', 'श', 'ज़'],
      correctIndex: 1,
      explanation: '"Nice" = "नाइस" — यहाँ C = "स" की आवाज़ (C followed by E/I)।',
    ),
    QuizQuestion(
      questionEn: '"Sugar" is pronounced as ___.',
      questionHi: '"Sugar" का उच्चारण ___ है।',
      options: ['सुगर', 'शुगर', 'सूगर', 'जुगर'],
      correctIndex: 1,
      explanation: '"Sugar" = "शुगर" — यह exception है। S के बाद H नहीं है फिर भी "श" की आवाज़ है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 QUIZ — J/Z/SH̤ sounds + S-start words
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> soundsJZQuestions = [
    QuizQuestion(
      questionEn: '"Music" — S here sounds like ___.',
      questionHi: '"Music" में S की आवाज़ ___ है।',
      options: ['स', 'श', 'ज़', 'ज'],
      correctIndex: 2,
      explanation: '"Music" = "म्यूज़िक" — यहाँ S = "ज़" की आवाज़ (Z sound)।',
    ),
    QuizQuestion(
      questionEn: '"Television" — S here sounds like ___.',
      questionHi: '"Television" में S की आवाज़ ___ है।',
      options: ['स', 'श', 'ज', 'श़ (zh sound)'],
      correctIndex: 3,
      explanation: '"Television" = "टेलिविश़न" — यहाँ SION = "श़न" (zh sound)।',
    ),
    QuizQuestion(
      questionEn: '"School" is correctly pronounced as ___.',
      questionHi: '"School" का सही उच्चारण ___ है।',
      options: ['इस्कूल', 'स्कूल', 'ईस्कूल', 'स्कोल'],
      correctIndex: 1,
      explanation: '"School" = "स्कूल" — S से शुरू होने वाले शब्दों में "इ" नहीं लगाते।',
    ),
    QuizQuestion(
      questionEn: '"Judge" — DG sounds like ___.',
      questionHi: '"Judge" में DG की आवाज़ ___ है।',
      options: ['ड', 'ग', 'ज', 'ज़'],
      correctIndex: 2,
      explanation: '"Judge" = "जज" — DG = "ज" की आवाज़। J, G, DG तीनों = "ज" की आवाज़ दे सकते हैं।',
    ),
    QuizQuestion(
      questionEn: '"Smile" is correctly pronounced as ___.',
      questionHi: '"Smile" का सही उच्चारण ___ है।',
      options: ['इस्माइल', 'स्माइल', 'ईस्माइल', 'सुमाइल'],
      correctIndex: 1,
      explanation: '"Smile" = "स्माइल" — "इस्माइल" गलत है। S से शुरू होने वाले शब्दों में "इ" नहीं लगाते।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Chapter Final Quiz (12 mixed questions)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"Pronunciation" is correctly said as ___.',
      questionHi: '"Pronunciation" को सही तरह से ___ बोलते हैं।',
      options: ['प्रनाउनसिएशन', 'प्रननसिएशन', 'प्रनन्सिएशन', 'प्रोनन्सिएशन'],
      correctIndex: 1,
      explanation: 'सही उच्चारण है "प्रननसिएशन"।',
    ),
    QuizQuestion(
      questionEn: 'When "a" comes alone in a sentence, it is pronounced as ___.',
      questionHi: 'वाक्य में अकेला "a" ___ बोला जाता है।',
      options: ['ए', 'आ', 'अ', 'ऐ'],
      correctIndex: 2,
      explanation: '"a man", "a good boy" — यहाँ "a" = "अ"।',
    ),
    QuizQuestion(
      questionEn: '"Map" is pronounced as ___.',
      questionHi: '"Map" का उच्चारण ___ है।',
      options: ['मेप', 'माप', 'मैप', 'मिप'],
      correctIndex: 2,
      explanation: '"Map" = "मैप" — A की आवाज़ "ऐ"।',
    ),
    QuizQuestion(
      questionEn: '"Sleep" means ___ and is pronounced ___.',
      questionHi: '"Sleep" का मतलब ___ है और उच्चारण ___ है।',
      options: ['फिसलना — स्लिप', 'सोना — स्लीप', 'सोना — स्लिप', 'फिसलना — स्लीप'],
      correctIndex: 1,
      explanation: '"Sleep" = सोना = "स्लीप"। "Slip" = फिसलना = "स्लिप"।',
    ),
    QuizQuestion(
      questionEn: 'SH combination always gives ___ sound.',
      questionHi: 'SH combination हमेशा ___ की आवाज़ देता है।',
      options: ['स', 'श', 'ज़', 'ज'],
      correctIndex: 1,
      explanation: 'SH = "श" — Shirt = शर्ट, Fish = फिश।',
    ),
    QuizQuestion(
      questionEn: '"The" (before consonant) is pronounced as ___.',
      questionHi: '"The" (व्यंजन से पहले) का उच्चारण ___ है।',
      options: ['थे', 'द', 'दी', 'ज़े'],
      correctIndex: 1,
      explanation: '"The" = "द" (consonant से पहले), "दी" (vowel से पहले)।',
    ),
    QuizQuestion(
      questionEn: '"Sugar" — despite no H after S, sounds like ___.',
      questionHi: '"Sugar" में S के बाद H नहीं है, फिर भी आवाज़ ___ है।',
      options: ['स', 'श', 'ज़', 'क'],
      correctIndex: 1,
      explanation: '"Sugar" = "शुगर" — यह exception है जहाँ बिना H के भी "श" की आवाज़ आती है।',
    ),
    QuizQuestion(
      questionEn: '"School" — NOT "Iskool". Words starting with S should ___.',
      questionHi: '"School" को "इस्कूल" नहीं बोलते। S से शुरू होने वाले शब्दों में ___.',
      options: ['आगे "इ" लगाएं', '"इ" नहीं लगाएं', '"ए" लगाएं', 'कुछ नहीं बदलता'],
      correctIndex: 1,
      explanation: 'S से शुरू होने वाले शब्दों में "इ" नहीं लगाते। School = स्कूल, Smile = स्माइल।',
    ),
    QuizQuestion(
      questionEn: '"Music" — S here has ___ sound.',
      questionHi: '"Music" में S की आवाज़ ___ है।',
      options: ['स', 'श', 'ज़', 'ज'],
      correctIndex: 2,
      explanation: '"Music" = "म्यूज़िक" — S = "ज़" की आवाज़।',
    ),
    QuizQuestion(
      questionEn: '"Cook" is pronounced as ___ (OO = short U sound).',
      questionHi: '"Cook" का उच्चारण ___ है (OO = छोटी उ)।',
      options: ['कूक', 'कुक', 'कोक', 'काक'],
      correctIndex: 1,
      explanation: '"Cook" = "कुक" — OO की आवाज़ "उ" (छोटी) है।',
    ),
    QuizQuestion(
      questionEn: '"Think" — TH sounds like ___.',
      questionHi: '"Think" में TH की आवाज़ ___ है।',
      options: ['द', 'थ', 'ज़', 'श'],
      correctIndex: 1,
      explanation: '"Think" = "थिंक"। TH = "थ"। (The में TH = "द")।',
    ),
    QuizQuestion(
      questionEn: '"Son" — O here sounds like ___.',
      questionHi: '"Son" में O की आवाज़ ___ है।',
      options: ['ओ', 'ऑ', 'अ', 'ऊ'],
      correctIndex: 2,
      explanation: '"Son" = "सन" — O की आवाज़ "अ" है। Done, Occur, Oppose — सभी में O = "अ"।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ── Vowel A sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, String>> vowelASounds = [
    // A = अ (when alone in sentence)
    // A = ए
    // A = ऐ
    // A = आ
    // A = ऑ
  ];

  static const List<Map<String, dynamic>> vowelAGroups = [
    {
      'sound': 'अ',
      'rule': 'जब "a" वाक्य में अकेला आए',
      'ruleEn': 'When "a" appears alone in a sentence',
      'color': 'primary',
      'examples': [
        {'word': 'A man', 'pronunciation': 'अ मैन', 'meaning': 'एक आदमी'},
        {'word': 'A good boy', 'pronunciation': 'अ गुड बॉय', 'meaning': 'एक अच्छा लड़का'},
        {'word': 'Alert', 'pronunciation': 'अलर्ट', 'meaning': 'सचेत'},
        {'word': 'Agree', 'pronunciation': 'अग्री', 'meaning': 'सहमत होना'},
        {'word': 'Ajay', 'pronunciation': 'अजय', 'meaning': 'नाम'},
      ],
    },
    {
      'sound': 'ए',
      'rule': 'A-E pattern या अन्य',
      'ruleEn': 'A-E pattern or others',
      'color': 'success',
      'examples': [
        {'word': 'Name', 'pronunciation': 'नेम', 'meaning': 'नाम'},
        {'word': 'Shame', 'pronunciation': 'शेम', 'meaning': 'शर्म'},
        {'word': 'Game', 'pronunciation': 'गेम', 'meaning': 'खेल'},
        {'word': 'Day', 'pronunciation': 'डे', 'meaning': 'दिन'},
        {'word': 'Say', 'pronunciation': 'से', 'meaning': 'कहना'},
        {'word': 'Same', 'pronunciation': 'सेम', 'meaning': 'समान'},
        {'word': 'Rate', 'pronunciation': 'रेट', 'meaning': 'मूल्य'},
      ],
    },
    {
      'sound': 'ऐ',
      'rule': 'Short A sound',
      'ruleEn': 'Short A sound',
      'color': 'accent',
      'examples': [
        {'word': 'Map', 'pronunciation': 'मैप', 'meaning': 'नक्शा'},
        {'word': 'Man', 'pronunciation': 'मैन', 'meaning': 'आदमी'},
        {'word': 'Ash', 'pronunciation': 'ऐश', 'meaning': 'राख'},
        {'word': 'Gas', 'pronunciation': 'गैस', 'meaning': 'गैस'},
        {'word': 'At', 'pronunciation': 'ऐट', 'meaning': 'पर, में'},
        {'word': 'An', 'pronunciation': 'ऐन', 'meaning': 'एक'},
      ],
    },
    {
      'sound': 'आ',
      'rule': 'AR pattern',
      'ruleEn': 'AR pattern',
      'color': 'warning',
      'examples': [
        {'word': 'Are', 'pronunciation': 'आर', 'meaning': 'सहायक क्रिया'},
        {'word': 'After', 'pronunciation': 'आफ्टर', 'meaning': 'बाद में'},
        {'word': 'Far', 'pronunciation': 'फार', 'meaning': 'दूर'},
      ],
    },
    {
      'sound': 'ऑ',
      'rule': 'A/AW before LL',
      'ruleEn': 'A or AW pattern',
      'color': 'primary',
      'examples': [
        {'word': 'Tall', 'pronunciation': 'टॉल', 'meaning': 'लम्बा'},
        {'word': 'Call', 'pronunciation': 'कॉल', 'meaning': 'फोन करना'},
        {'word': 'Hall', 'pronunciation': 'हॉल', 'meaning': 'बड़ा कमरा'},
        {'word': 'Awesome', 'pronunciation': 'ऑसम', 'meaning': 'बहुत बढ़िया'},
        {'word': 'Awful', 'pronunciation': 'ऑफुल', 'meaning': 'बहुत बुरा'},
      ],
    },
  ];

  // ── Vowel E sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> vowelEGroups = [
    {
      'sound': 'ई (बड़ी ई)',
      'rule': 'E, EE, EA',
      'ruleEn': 'E, EE or EA combination',
      'color': 'success',
      'examples': [
        {'word': 'Me', 'pronunciation': 'मी', 'meaning': 'मुझे'},
        {'word': 'He', 'pronunciation': 'ही', 'meaning': 'वह'},
        {'word': 'Be', 'pronunciation': 'बी', 'meaning': 'होना'},
        {'word': 'Week', 'pronunciation': 'वीक', 'meaning': 'सप्ताह'},
        {'word': 'Weak', 'pronunciation': 'वीक', 'meaning': 'कमजोर'},
        {'word': 'Sea', 'pronunciation': 'सी', 'meaning': 'सागर'},
        {'word': 'Keep', 'pronunciation': 'कीप', 'meaning': 'रखना'},
        {'word': 'Teen', 'pronunciation': 'टीन', 'meaning': 'किशोर'},
      ],
    },
    {
      'sound': 'ए',
      'rule': 'E in middle',
      'ruleEn': 'E in middle of word',
      'color': 'primary',
      'examples': [
        {'word': 'Pen', 'pronunciation': 'पेन', 'meaning': 'कलम'},
        {'word': 'Eleven', 'pronunciation': 'इलेवन', 'meaning': 'ग्यारह'},
        {'word': 'Enter', 'pronunciation': 'एन्टर', 'meaning': 'प्रवेश करना'},
      ],
    },
  ];

  // ── Vowel I sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> vowelIGroups = [
    {
      'sound': 'इ (छोटी इ)',
      'rule': 'I at start or in short words',
      'ruleEn': 'Short I sound',
      'color': 'primary',
      'examples': [
        {'word': 'Is', 'pronunciation': 'इज़', 'meaning': 'सहायक क्रिया'},
        {'word': 'Hill', 'pronunciation': 'हिल', 'meaning': 'पहाड़ी'},
        {'word': 'Injury', 'pronunciation': 'इन्जरी', 'meaning': 'चोट'},
        {'word': 'Example', 'pronunciation': 'इग्ज़ाम्पल', 'meaning': 'उदाहरण'},
      ],
    },
    {
      'sound': 'आइ',
      'rule': 'I-E or I-consonant-E pattern',
      'ruleEn': 'Long I sound (I-E pattern)',
      'color': 'accent',
      'examples': [
        {'word': 'File', 'pronunciation': 'फाइल', 'meaning': 'फाइल'},
        {'word': 'Kite', 'pronunciation': 'काइट', 'meaning': 'पतंग'},
        {'word': 'Hide', 'pronunciation': 'हाइड', 'meaning': 'छिपाना'},
        {'word': 'Strike', 'pronunciation': 'स्ट्राइक', 'meaning': 'हड़ताल'},
        {'word': 'Pile', 'pronunciation': 'पाइल', 'meaning': 'ढेर'},
      ],
    },
    {
      'sound': 'अ',
      'rule': 'IR combination',
      'ruleEn': 'IR combination = UR sound',
      'color': 'warning',
      'examples': [
        {'word': 'Third', 'pronunciation': 'थर्ड', 'meaning': 'तीसरा'},
        {'word': 'Shirt', 'pronunciation': 'शर्ट', 'meaning': 'कमीज़'},
        {'word': 'Shirk', 'pronunciation': 'शर्क', 'meaning': 'जिम्मेदारी से भागना'},
      ],
    },
    {
      'sound': 'ई (बड़ी ई)',
      'rule': 'IE pattern',
      'ruleEn': 'IE combination',
      'color': 'success',
      'examples': [
        {'word': 'Nice', 'pronunciation': 'नाइस', 'meaning': 'अच्छा'},
        {'word': 'Piece', 'pronunciation': 'पीस', 'meaning': 'टुकड़ा'},
        {'word': 'Believe', 'pronunciation': 'बिलीव', 'meaning': 'विश्वास करना'},
      ],
    },
  ];

  // ── Vowel O sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> vowelOGroups = [
    {
      'sound': 'ओ',
      'rule': 'O, OW (long O)',
      'ruleEn': 'Long O sound',
      'color': 'primary',
      'examples': [
        {'word': 'Om', 'pronunciation': 'ओम', 'meaning': 'ॐ'},
        {'word': 'Old', 'pronunciation': 'ओल्ड', 'meaning': 'बूढ़ा'},
        {'word': 'Only', 'pronunciation': 'ओन्ली', 'meaning': 'केवल'},
        {'word': 'Rope', 'pronunciation': 'रोप', 'meaning': 'रस्सी'},
        {'word': 'Snow', 'pronunciation': 'स्नो', 'meaning': 'बर्फ'},
        {'word': 'Bold', 'pronunciation': 'बोल्ड', 'meaning': 'साहसी'},
      ],
    },
    {
      'sound': 'उ (छोटी उ)',
      'rule': 'OO (short)',
      'ruleEn': 'OO short sound',
      'color': 'success',
      'examples': [
        {'word': 'Cook', 'pronunciation': 'कुक', 'meaning': 'रसोइया'},
        {'word': 'Look', 'pronunciation': 'लुक', 'meaning': 'देखना'},
        {'word': 'Good', 'pronunciation': 'गुड', 'meaning': 'अच्छा'},
        {'word': 'Book', 'pronunciation': 'बुक', 'meaning': 'किताब'},
      ],
    },
    {
      'sound': 'ऊ (बड़ी ऊ)',
      'rule': 'OO (long)',
      'ruleEn': 'OO long sound',
      'color': 'accent',
      'examples': [
        {'word': 'Too', 'pronunciation': 'टू', 'meaning': 'भी'},
        {'word': 'Shoot', 'pronunciation': 'शूट', 'meaning': 'गोली मारना'},
        {'word': 'Groom', 'pronunciation': 'ग्रूम', 'meaning': 'दूल्हा'},
        {'word': 'Root', 'pronunciation': 'रूट', 'meaning': 'जड़'},
      ],
    },
    {
      'sound': 'अ',
      'rule': 'O in unaccented syllable',
      'ruleEn': 'O = schwa sound',
      'color': 'warning',
      'examples': [
        {'word': 'Son', 'pronunciation': 'सन', 'meaning': 'बेटा'},
        {'word': 'Done', 'pronunciation': 'डन', 'meaning': 'हो गया'},
        {'word': 'Occur', 'pronunciation': 'अकर', 'meaning': 'घटित होना'},
      ],
    },
    {
      'sound': 'ऑ',
      'rule': 'O in short syllable',
      'ruleEn': 'Short O sound',
      'color': 'primary',
      'examples': [
        {'word': 'On', 'pronunciation': 'ऑन', 'meaning': 'के ऊपर'},
        {'word': 'Stop', 'pronunciation': 'स्टॉप', 'meaning': 'रुको'},
        {'word': 'Shop', 'pronunciation': 'शॉप', 'meaning': 'दुकान'},
        {'word': 'Lot', 'pronunciation': 'लॉट', 'meaning': 'बहुत सारा'},
      ],
    },
    {
      'sound': 'आउ',
      'rule': 'OW / OU',
      'ruleEn': 'OW/OU diphthong',
      'color': 'success',
      'examples': [
        {'word': 'Cow', 'pronunciation': 'काउ', 'meaning': 'गाय'},
        {'word': 'How', 'pronunciation': 'हाउ', 'meaning': 'कैसे'},
        {'word': 'Doubt', 'pronunciation': 'डाउट', 'meaning': 'संदेह'},
        {'word': 'Shout', 'pronunciation': 'शाउट', 'meaning': 'चिल्लाना'},
      ],
    },
    {
      'sound': 'ऑइ',
      'rule': 'OI / OY',
      'ruleEn': 'OI/OY diphthong',
      'color': 'accent',
      'examples': [
        {'word': 'Join', 'pronunciation': 'जॉइन', 'meaning': 'शामिल होना'},
        {'word': 'Coin', 'pronunciation': 'कॉइन', 'meaning': 'सिक्का'},
        {'word': 'Boy', 'pronunciation': 'बॉय', 'meaning': 'लड़का'},
        {'word': 'Enjoy', 'pronunciation': 'एन्जॉय', 'meaning': 'आनंद लेना'},
      ],
    },
  ];

  // ── Vowel U sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> vowelUGroups = [
    {
      'sound': 'उ (छोटी उ)',
      'rule': 'U in ULL pattern',
      'ruleEn': 'Short U sound',
      'color': 'primary',
      'examples': [
        {'word': 'Bull', 'pronunciation': 'बुल', 'meaning': 'बैल'},
        {'word': 'Full', 'pronunciation': 'फुल', 'meaning': 'भरा हुआ'},
      ],
    },
    {
      'sound': 'अ',
      'rule': 'U in short words',
      'ruleEn': 'Schwa U sound',
      'color': 'accent',
      'examples': [
        {'word': 'Run', 'pronunciation': 'रन', 'meaning': 'दौड़ना'},
        {'word': 'But', 'pronunciation': 'बट', 'meaning': 'लेकिन'},
        {'word': 'Shut', 'pronunciation': 'शट', 'meaning': 'बंद करना'},
        {'word': 'Under', 'pronunciation': 'अन्डर', 'meaning': 'के नीचे'},
        {'word': 'Urgent', 'pronunciation': 'अर्जेंट', 'meaning': 'जरूरी'},
      ],
    },
    {
      'sound': 'यू',
      'rule': 'U at word start or long U',
      'ruleEn': 'Long U sound',
      'color': 'success',
      'examples': [
        {'word': 'Use', 'pronunciation': 'यूज़', 'meaning': 'प्रयोग करना'},
        {'word': 'Cube', 'pronunciation': 'क्यूब', 'meaning': 'घन'},
        {'word': 'Tube', 'pronunciation': 'ट्यूब', 'meaning': 'नली'},
        {'word': 'Uniform', 'pronunciation': 'यूनिफॉर्म', 'meaning': 'वर्दी'},
        {'word': 'Salute', 'pronunciation': 'सल्यूट', 'meaning': 'सलाम'},
      ],
    },
  ];

  // ── S/SH/TH sounds ─────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> consonantSounds = [
    {
      'pattern': 'S → स',
      'rule': 'S alone = स',
      'color': 'primary',
      'examples': [
        {'word': 'Sun', 'pronunciation': 'सन', 'meaning': 'सूरज'},
        {'word': 'Safety', 'pronunciation': 'सेफ्टी', 'meaning': 'सुरक्षा'},
        {'word': 'Salute', 'pronunciation': 'सल्यूट', 'meaning': 'सलाम'},
      ],
    },
    {
      'pattern': 'SH → श',
      'rule': 'S followed by H = श',
      'color': 'success',
      'examples': [
        {'word': 'Shirt', 'pronunciation': 'शर्ट', 'meaning': 'कमीज़'},
        {'word': 'Fish', 'pronunciation': 'फिश', 'meaning': 'मछली'},
        {'word': 'Shape', 'pronunciation': 'शेप', 'meaning': 'आकार'},
      ],
    },
    {
      'pattern': 'TH → द / थ',
      'rule': 'TH = "द" (The, That) OR "थ" (Think, Thank)',
      'color': 'warning',
      'examples': [
        {'word': 'The', 'pronunciation': 'द/दी', 'meaning': 'निश्चित Article'},
        {'word': 'That', 'pronunciation': 'दैट', 'meaning': 'वह'},
        {'word': 'Think', 'pronunciation': 'थिंक', 'meaning': 'सोचना'},
        {'word': 'Thank', 'pronunciation': 'थैंक', 'meaning': 'धन्यवाद'},
        {'word': 'Theme', 'pronunciation': 'थीम', 'meaning': 'विषय'},
      ],
    },
    {
      'pattern': 'C → स / क',
      'rule': 'C + E/I = स | C elsewhere = क',
      'color': 'accent',
      'examples': [
        {'word': 'Nice', 'pronunciation': 'नाइस', 'meaning': 'अच्छा'},
        {'word': 'Peace', 'pronunciation': 'पीस', 'meaning': 'शांति'},
        {'word': 'Cell', 'pronunciation': 'सेल', 'meaning': 'कोशिका'},
        {'word': 'Cool', 'pronunciation': 'कूल', 'meaning': 'ठंडा'},
        {'word': 'Crime', 'pronunciation': 'क्राइम', 'meaning': 'अपराध'},
      ],
    },
    {
      'pattern': 'G → ग / ज',
      'rule': 'G + E/I = ज | G elsewhere = ग',
      'color': 'primary',
      'examples': [
        {'word': 'Gold', 'pronunciation': 'गोल्ड', 'meaning': 'सोना'},
        {'word': 'Get', 'pronunciation': 'गेट', 'meaning': 'पाना'},
        {'word': 'Magic', 'pronunciation': 'मैजिक', 'meaning': 'जादू'},
        {'word': 'Cage', 'pronunciation': 'केज', 'meaning': 'पिंजरा'},
        {'word': 'Age', 'pronunciation': 'एज', 'meaning': 'उम्र'},
      ],
    },
  ];

  // ── J/Z/SH̤ sounds ──────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> specialSounds = [
    {
      'pattern': 'ज (1st type)',
      'symbols': 'J, G, DG',
      'rule': 'Hard J sound',
      'color': 'primary',
      'examples': [
        {'word': 'Japan', 'pronunciation': 'जापान', 'meaning': 'देश'},
        {'word': 'Magic', 'pronunciation': 'मैजिक', 'meaning': 'जादू'},
        {'word': 'Judge', 'pronunciation': 'जज', 'meaning': 'न्यायाधीश'},
        {'word': 'Age', 'pronunciation': 'एज', 'meaning': 'उम्र'},
        {'word': 'Pigeon', 'pronunciation': 'पिजन', 'meaning': 'कबूतर'},
      ],
    },
    {
      'pattern': 'ज़ (2nd type)',
      'symbols': 'Z, S, X',
      'rule': 'Z sound',
      'color': 'accent',
      'examples': [
        {'word': 'Zoo', 'pronunciation': 'ज़ू', 'meaning': 'चिड़ियाघर'},
        {'word': 'Music', 'pronunciation': 'म्यूज़िक', 'meaning': 'संगीत'},
        {'word': 'Was', 'pronunciation': 'वॉज़', 'meaning': 'था/थे/थी'},
        {'word': 'Rise', 'pronunciation': 'राइज़', 'meaning': 'बढ़ना'},
        {'word': 'Example', 'pronunciation': 'इग्ज़ाम्पल', 'meaning': 'उदाहरण'},
      ],
    },
    {
      'pattern': 'श़ (3rd type)',
      'symbols': 'S, SU, SIO',
      'rule': 'ZH sound (like measure)',
      'color': 'success',
      'examples': [
        {'word': 'Television', 'pronunciation': 'टेलिविश़न', 'meaning': 'टीवी'},
        {'word': 'Vision', 'pronunciation': 'विश़न', 'meaning': 'दृष्टि'},
        {'word': 'Pleasure', 'pronunciation': 'प्लेश़र', 'meaning': 'आनंद'},
        {'word': 'Measure', 'pronunciation': 'मेश़र', 'meaning': 'नापना'},
        {'word': 'Revision', 'pronunciation': 'रिविश़न', 'meaning': 'संशोधन'},
      ],
    },
  ];

  // S-start words (no "ई" prefix)
  static const List<Map<String, String>> sStartWords = [
    {'word': 'School', 'wrong': 'इस्कूल', 'right': 'स्कूल', 'meaning': 'विद्यालय'},
    {'word': 'Smile', 'wrong': 'इस्माइल', 'right': 'स्माइल', 'meaning': 'मुस्कुराना'},
    {'word': 'Style', 'wrong': 'इस्टाइल', 'right': 'स्टाइल', 'meaning': 'शैली'},
    {'word': 'Start', 'wrong': 'इस्टार्ट', 'right': 'स्टार्ट', 'meaning': 'शुरू करना'},
    {'word': 'Stress', 'wrong': 'इस्ट्रेस', 'right': 'स्ट्रेस', 'meaning': 'तनाव'},
    {'word': 'Strange', 'wrong': 'इस्ट्रेंज', 'right': 'स्ट्रेंज', 'meaning': 'अजीब'},
    {'word': 'Spice', 'wrong': 'इस्पाइस', 'right': 'स्पाइस', 'meaning': 'मसाला'},
  ];

  // S vs SH contrasting pairs
  static const List<Map<String, String>> svsSHPairs = [
    {'s': 'See (सी) — देखना', 'sh': 'She (शी) — वह (लड़की)'},
    {'s': 'Seat (सीट) — बैठने की जगह', 'sh': 'Sheet (शीट) — चादर'},
    {'s': 'Sip (सिप) — घूँट', 'sh': 'Ship (शिप) — जहाज़'},
    {'s': 'Save (सेव) — बचाना', 'sh': 'Shave (शेव) — हजामत'},
    {'s': 'So (सो) — इसलिए', 'sh': 'Show (शो) — प्रदर्शन'},
    {'s': 'Sign (साइन) — हस्ताक्षर', 'sh': 'Shine (शाइन) — चमक'},
    {'s': 'Sour (साउर) — खट्टा', 'sh': 'Shower (शावर) — स्नान'},
  ];

  // Special exceptions (S sounds like SH without H)
  static const List<Map<String, String>> shExceptions = [
    {'word': 'Sugar', 'pronunciation': 'शुगर', 'meaning': 'चीनी', 'note': 'S alone → श'},
    {'word': 'Sure', 'pronunciation': 'श्योर', 'meaning': 'पक्का', 'note': 'S alone → श'},
    {'word': 'Passion', 'pronunciation': 'पैशन', 'meaning': 'जुनून', 'note': 'SS → श'},
    {'word': 'Pressure', 'pronunciation': 'प्रेशर', 'meaning': 'दबाव', 'note': 'SS → श'},
    {'word': 'Russia', 'pronunciation': 'रशिया', 'meaning': 'रूस', 'note': 'SS → श'},
  ];
}