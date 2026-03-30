import '../models/lesson_model.dart';

/// Chapter 5 — WH Family (WH परिवार)
class Chapter5Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 5,
        title: 'WH Family',
        titleHindi: 'WH परिवार',
        description: 'What, Why, When, Where, How & More',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'WH Basics',
              titleHindi: 'WH के 9 मूल शब्द',
              emoji: '❓', type: LessonType.ch5WHBasics, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'How Combinations',
              titleHindi: 'How के संयोजन',
              emoji: '🔢', type: LessonType.ch5HowCombos, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Whom & Where Combos',
              titleHindi: 'Whom और Where के संयोजन',
              emoji: '📍', type: LessonType.ch5WhomWhere, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Which, Whose & Extended WH',
              titleHindi: 'Which, Whose और विस्तृत WH शब्द',
              emoji: '🔍', type: LessonType.ch5WhichWhose, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'WH in Phrases',
              titleHindi: 'WH शब्दों के व्यावहारिक प्रयोग',
              emoji: '💬', type: LessonType.ch5WHPhrases, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch5ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch5WHBasics:      return whBasicsQuestions;
      case LessonType.ch5HowCombos:     return howCombosQuestions;
      case LessonType.ch5WhomWhere:     return whomWhereQuestions;
      case LessonType.ch5WhichWhose:    return whichWhoseQuestions;
      case LessonType.ch5WHPhrases:     return whPhrasesQuestions;
      case LessonType.ch5ChapterQuiz:   return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 QUIZ — WH Basics
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> whBasicsQuestions = [
    QuizQuestion(
      questionEn: '"Who" is used for ___.',
      questionHi: '"Who" का प्रयोग ___ के लिए होता है।',
      options: ['किसी चीज़ के लिए', 'किसी व्यक्ति के लिए', 'किसी जगह के लिए', 'किसी समय के लिए'],
      correctIndex: 1,
      explanation: '"Who" (हू) = कौन/जो — किसी व्यक्ति के लिए। "Which" = किसी चीज़ के लिए।',
    ),
    QuizQuestion(
      questionEn: '"Whose" means ___.',
      questionHi: '"Whose" का मतलब ___ है।',
      options: ['कहाँ', 'कब', 'किसका / जिसका', 'कैसे'],
      correctIndex: 2,
      explanation: '"Whose" (हूज़) = किसका / जिसका — possession पूछने के लिए।',
    ),
    QuizQuestion(
      questionEn: '"Whom" is used as ___.',
      questionHi: '"Whom" का प्रयोग ___ के रूप में होता है।',
      options: ['Subject की जगह', 'Object की जगह', 'Verb की जगह', 'Adjective की जगह'],
      correctIndex: 1,
      explanation: '"Whom" (हूम) = किसे/किससे/किसको — Object के रूप में। जैसे: "With whom?"',
    ),
    QuizQuestion(
      questionEn: '"What" has TWO meanings — what are they?',
      questionHi: '"What" के दो अर्थ क्या हैं?',
      options: ['कब और कहाँ', 'क्या और जो', 'कैसे और क्यों', 'कौन और किसका'],
      correctIndex: 1,
      explanation: '"What" = क्या (interrogative) और जो (conjunction)। "When" = कब/जब।',
    ),
    QuizQuestion(
      questionEn: '"How many" vs "How much" — "How many" is for ___.',
      questionHi: '"How many" किसके लिए प्रयोग होता है?',
      options: ['जो गिना न जा सके', 'जो गिना जा सके (countable)', 'सिर्फ पैसे के लिए', 'सिर्फ समय के लिए'],
      correctIndex: 1,
      explanation: '"How many" = गिनती योग्य चीज़ें (brothers, stars)। "How much" = अगणनीय (money, sugar)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 QUIZ — How Combinations
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> howCombosQuestions = [
    QuizQuestion(
      questionEn: '"How old" means ___.',
      questionHi: '"How old" का मतलब ___ है।',
      options: ['कितना दूर', 'कितना लम्बा', 'कितना पुराना / कितना बड़ा (उम्र में)', 'कितनी जल्दी'],
      correctIndex: 2,
      explanation: '"How old" = कितना पुराना / कितना बड़ा (उम्र में)।',
    ),
    QuizQuestion(
      questionEn: '"How far" means ___.',
      questionHi: '"How far" का मतलब ___ है।',
      options: ['कितना लम्बा', 'कितना दूर', 'कितना अच्छा', 'कितनी जल्दी'],
      correctIndex: 1,
      explanation: '"How far" = कितना दूर।',
    ),
    QuizQuestion(
      questionEn: '"How soon" means ___.',
      questionHi: '"How soon" का मतलब ___ है।',
      options: ['कितना पुराना', 'कितना दूर', 'कितनी जल्दी', 'कितना लम्बा'],
      correctIndex: 2,
      explanation: '"How soon" = कितनी जल्दी।',
    ),
    QuizQuestion(
      questionEn: '"How long" can mean ___.',
      questionHi: '"How long" का मतलब ___ हो सकता है।',
      options: ['कितना पुराना', 'कितना लम्बा (दूरी) या कितना समय', 'कितना दूर', 'कितनी जल्दी'],
      correctIndex: 1,
      explanation: '"How long" = कितना लम्बा (दूरी) OR कितना समय — दोनों के लिए।',
    ),
    QuizQuestion(
      questionEn: '"How much sugar" — "How much" is used because sugar is ___.',
      questionHi: '"How much sugar" — "How much" प्रयोग हुआ क्योंकि sugar ___ है।',
      options: ['Countable (गिनने योग्य)', 'Uncountable (न गिन सकें)', 'Plural', 'Singular'],
      correctIndex: 1,
      explanation: 'Sugar गिनी नहीं जाती → Uncountable → "How much"। Brothers गिने जाते हैं → "How many"।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 QUIZ — Whom & Where Combinations
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> whomWhereQuestions = [
    QuizQuestion(
      questionEn: '"With whom" means ___.',
      questionHi: '"With whom" का मतलब ___ है।',
      options: ['किसके लिए', 'किसके साथ', 'किसके बारे में', 'किसकी तरफ'],
      correctIndex: 1,
      explanation: '"With whom" = किसके साथ। "For whom" = किसके लिए।',
    ),
    QuizQuestion(
      questionEn: '"About whom" means ___.',
      questionHi: '"About whom" का मतलब ___ है।',
      options: ['किसके साथ', 'किसके द्वारा', 'किसके बारे में', 'किसकी तरफ'],
      correctIndex: 2,
      explanation: '"About whom" = किसके बारे में।',
    ),
    QuizQuestion(
      questionEn: '"From where" means ___.',
      questionHi: '"From where" का मतलब ___ है।',
      options: ['कहाँ', 'कहाँ तक', 'कहाँ से / जहाँ से', 'कहाँ पर'],
      correctIndex: 2,
      explanation: '"From where" = कहाँ से / जहाँ से।',
    ),
    QuizQuestion(
      questionEn: '"By whom" means ___.',
      questionHi: '"By whom" का मतलब ___ है।',
      options: ['किसके साथ', 'किसके लिए', 'किसके द्वारा', 'किसकी तरफ'],
      correctIndex: 2,
      explanation: '"By whom" = किसके द्वारा।',
    ),
    QuizQuestion(
      questionEn: '"Until when" vs "Since when" — "Since when" means ___.',
      questionHi: '"Since when" का मतलब ___ है।',
      options: ['कब तक', 'कब से', 'किस समय', 'कब तक नहीं'],
      correctIndex: 1,
      explanation: '"Since when" = कब से (from what time). "Until when" = कब तक (up to what time).',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 QUIZ — Which & Whose + Extended WH
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> whichWhoseQuestions = [
    QuizQuestion(
      questionEn: '"Whereas" means ___.',
      questionHi: '"Whereas" का मतलब ___ है।',
      options: ['जहाँ', 'जबकि', 'जब भी', 'जहाँ भी'],
      correctIndex: 1,
      explanation: '"Whereas" (वेयरएज़) = जबकि।',
    ),
    QuizQuestion(
      questionEn: '"Whatever" and "Whatsoever" both mean ___.',
      questionHi: '"Whatever" और "Whatsoever" दोनों का मतलब ___ है।',
      options: ['जो कोई भी', 'जो कुछ भी', 'जब कभी भी', 'जहाँ भी'],
      correctIndex: 1,
      explanation: '"Whatever" / "Whatsoever" = जो कुछ भी।',
    ),
    QuizQuestion(
      questionEn: '"Whoever" means ___.',
      questionHi: '"Whoever" का मतलब ___ है।',
      options: ['जो कुछ भी', 'जो भी (कोई व्यक्ति)', 'जो भी (चीज़)', 'जब भी'],
      correctIndex: 1,
      explanation: '"Whoever" (हूएवर) = जो भी (कोई व्यक्ति)। "Whichever" = जो भी (कोई चीज़)।',
    ),
    QuizQuestion(
      questionEn: '"Why so" means ___.',
      questionHi: '"Why so" का मतलब ___ है।',
      options: ['इसलिए', 'ऐसा क्यों', 'किसलिए', 'क्यों नहीं'],
      correctIndex: 1,
      explanation: '"Why so" = ऐसा क्यों।',
    ),
    QuizQuestion(
      questionEn: '"For what" and "What for" both mean ___.',
      questionHi: '"For what" और "What for" दोनों का मतलब ___ है।',
      options: ['और क्या', 'किसलिए / जिसलिए', 'किस तरह का', 'तो क्या'],
      correctIndex: 1,
      explanation: '"For what" / "What for" = किसलिए / जिसलिए।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 QUIZ — WH in Practical Phrases
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> whPhrasesQuestions = [
    QuizQuestion(
      questionEn: '"From which office" means ___.',
      questionHi: '"From which office" का मतलब ___ है।',
      options: ['किस ऑफिस में', 'किस ऑफिस के लिए', 'किस ऑफिस से', 'किस ऑफिस तक'],
      correctIndex: 2,
      explanation: '"From which office" = किस ऑफिस से।',
    ),
    QuizQuestion(
      questionEn: '"How many brothers of mine" means ___.',
      questionHi: '"How many brothers of mine" का मतलब ___ है।',
      options: ['मेरा कौन सा भाई', 'मेरे कितने भाई', 'मेरे सभी भाई', 'मेरे भाई के साथ'],
      correctIndex: 1,
      explanation: '"How many brothers of mine" = मेरे कितने भाई।',
    ),
    QuizQuestion(
      questionEn: '"Which sister of yours" means ___.',
      questionHi: '"Which sister of yours" का मतलब ___ है।',
      options: ['तुम्हारी कितनी बहनें', 'तुम्हारी सभी बहनें', 'तुम्हारी कौन सी बहन', 'तुम्हारी बहन के साथ'],
      correctIndex: 2,
      explanation: '"Which sister of yours" = तुम्हारी कौन सी बहन।',
    ),
    QuizQuestion(
      questionEn: '"How come" means ___.',
      questionHi: '"How come" का मतलब ___ है।',
      options: ['कैसे आना', 'कैसे / किस तरह (surprised)', 'कब आना', 'कहाँ आना'],
      correctIndex: 1,
      explanation: '"How come" = कैसे / किस तरह (हैरानी के साथ)।',
    ),
    QuizQuestion(
      questionEn: '"At what time" means ___.',
      questionHi: '"At what time" का मतलब ___ है।',
      options: ['कितने समय के लिए', 'कब से', 'किस समय', 'कब तक'],
      correctIndex: 2,
      explanation: '"At what time" = किस समय।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 12 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"Who" is used for persons. "Which" is used for ___.',
      questionHi: '"Who" व्यक्तियों के लिए है। "Which" ___ के लिए है।',
      options: ['स्थानों के लिए', 'चीज़ों / विकल्पों के लिए', 'समय के लिए', 'कारण के लिए'],
      correctIndex: 1,
      explanation: '"Who" = व्यक्ति। "Which" = चीज़ / विकल्प।',
    ),
    QuizQuestion(
      questionEn: '"Whose" means ___.',
      questionHi: '"Whose" का मतलब ___ है।',
      options: ['कहाँ', 'कब', 'किसका / जिसका', 'कैसे'],
      correctIndex: 2,
      explanation: '"Whose" = किसका / जिसका — possession के लिए।',
    ),
    QuizQuestion(
      questionEn: '"How many stars" — "How many" is used because stars are ___.',
      questionHi: '"How many stars" — "How many" क्यों प्रयोग हुआ?',
      options: ['Uncountable हैं', 'Countable (गिनने योग्य) हैं', 'Singular हैं', 'Adjective हैं'],
      correctIndex: 1,
      explanation: 'Stars गिने जा सकते हैं → Countable → "How many"।',
    ),
    QuizQuestion(
      questionEn: '"With whom" means ___.',
      questionHi: '"With whom" का मतलब ___ है।',
      options: ['किसके लिए', 'किसके साथ', 'किसके बारे में', 'किसकी तरफ'],
      correctIndex: 1,
      explanation: '"With whom" = किसके साथ।',
    ),
    QuizQuestion(
      questionEn: '"Since when" means ___.',
      questionHi: '"Since when" का मतलब ___ है।',
      options: ['कब तक', 'कब से', 'किस समय', 'कब'],
      correctIndex: 1,
      explanation: '"Since when" = कब से।',
    ),
    QuizQuestion(
      questionEn: '"Whatever" means ___.',
      questionHi: '"Whatever" का मतलब ___ है।',
      options: ['जो कोई भी', 'जो कुछ भी', 'जब भी', 'जहाँ भी'],
      correctIndex: 1,
      explanation: '"Whatever" / "Whatsoever" = जो कुछ भी।',
    ),
    QuizQuestion(
      questionEn: '"How old" means ___.',
      questionHi: '"How old" का मतलब ___ है।',
      options: ['कितना दूर', 'कितना लम्बा', 'कितना पुराना / कितनी उम्र', 'कितनी जल्दी'],
      correctIndex: 2,
      explanation: '"How old" = कितना पुराना / कितना बड़ा (उम्र में)।',
    ),
    QuizQuestion(
      questionEn: '"Whereas" means ___.',
      questionHi: '"Whereas" का मतलब ___ है।',
      options: ['जहाँ', 'जबकि', 'जब भी', 'जहाँ भी'],
      correctIndex: 1,
      explanation: '"Whereas" = जबकि।',
    ),
    QuizQuestion(
      questionEn: '"From where" means ___.',
      questionHi: '"From where" का मतलब ___ है।',
      options: ['कहाँ', 'कहाँ तक', 'कहाँ से', 'कहाँ पर'],
      correctIndex: 2,
      explanation: '"From where" = कहाँ से।',
    ),
    QuizQuestion(
      questionEn: '"Why so" means ___.',
      questionHi: '"Why so" का मतलब ___ है।',
      options: ['इसलिए', 'ऐसा क्यों', 'किसलिए', 'क्यों नहीं'],
      correctIndex: 1,
      explanation: '"Why so" = ऐसा क्यों।',
    ),
    QuizQuestion(
      questionEn: '"How much money" — "How much" because money is ___.',
      questionHi: '"How much money" — "How much" क्योंकि पैसा ___ है।',
      options: ['Countable', 'Uncountable', 'Plural', 'Singular'],
      correctIndex: 1,
      explanation: 'Money Uncountable है → "How much money"।',
    ),
    QuizQuestion(
      questionEn: '"Whoever" means ___.',
      questionHi: '"Whoever" का मतलब ___ है।',
      options: ['जो कुछ भी', 'जो भी (कोई व्यक्ति)', 'जो भी (चीज़)', 'जब भी'],
      correctIndex: 1,
      explanation: '"Whoever" = जो भी कोई व्यक्ति।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ── 9 Base WH Words ────────────────────────────────────────────────────────
  static const List<Map<String, String>> whBaseWords = [
    {'en': 'What', 'pronunciation': 'वॉट (वट)', 'hi': 'क्या / जो', 'note': 'Question में = क्या, Conjunction में = जो'},
    {'en': 'Why', 'pronunciation': 'वाय', 'hi': 'क्यों', 'note': ''},
    {'en': 'When', 'pronunciation': 'वेन', 'hi': 'कब / जब', 'note': 'Question में = कब, Conjunction में = जब'},
    {'en': 'Where', 'pronunciation': 'वेयर', 'hi': 'कहाँ / जहाँ', 'note': 'Question में = कहाँ, Conjunction में = जहाँ'},
    {'en': 'How', 'pronunciation': 'हाउ', 'hi': 'कैसे', 'note': 'Many combinations possible'},
    {'en': 'Who', 'pronunciation': 'हू', 'hi': 'कौन / जो', 'note': 'व्यक्तियों के लिए (for persons)'},
    {'en': 'Which', 'pronunciation': 'विच', 'hi': 'कौन सा / जो', 'note': 'चीज़ों/विकल्पों के लिए (for things)'},
    {'en': 'Whose', 'pronunciation': 'हूज़', 'hi': 'किसका / जिसका', 'note': 'Possession के लिए'},
    {'en': 'Whom', 'pronunciation': 'हूम', 'hi': 'किसे / किससे / किसको', 'note': 'Object के रूप में (Who का Object form)'},
  ];

  // ── How Combinations ───────────────────────────────────────────────────────
  static const List<Map<String, String>> howCombos = [
    {'en': 'How many', 'pronunciation': 'हाउ मेनी', 'hi': 'कितने', 'note': 'Countable (गिनने योग्य)'},
    {'en': 'How much', 'pronunciation': 'हाउ मच', 'hi': 'कितना', 'note': 'Uncountable (न गिन सकें)'},
    {'en': 'How long', 'pronunciation': 'हाउ लॉंग', 'hi': 'कितना लम्बा / कितना समय', 'note': 'Distance or Duration'},
    {'en': 'How far', 'pronunciation': 'हाउ फार', 'hi': 'कितना दूर', 'note': ''},
    {'en': 'How old', 'pronunciation': 'हाउ ओल्ड', 'hi': 'कितना पुराना / कितनी उम्र', 'note': ''},
    {'en': 'How soon', 'pronunciation': 'हाउ सून', 'hi': 'कितनी जल्दी', 'note': ''},
    {'en': 'How good', 'pronunciation': 'हाउ गुड', 'hi': 'कितना अच्छा', 'note': ''},
    {'en': 'How beautiful', 'pronunciation': 'हाउ ब्यूटिफुल', 'hi': 'कितनी सुन्दर', 'note': ''},
    {'en': 'How come', 'pronunciation': 'हाउ कम', 'hi': 'कैसे / किस तरह', 'note': 'Surprise में प्रयोग'},
    {'en': 'For how long', 'pronunciation': 'फॉर हाउ लॉंग', 'hi': 'कितनी देर से / के लिए', 'note': ''},
  ];

  // ── Whom Combinations ──────────────────────────────────────────────────────
  static const List<Map<String, String>> whomCombos = [
    {'en': 'With whom', 'pronunciation': 'विद हूम', 'hi': 'किसके साथ'},
    {'en': 'For whom', 'pronunciation': 'फॉर हूम', 'hi': 'किसके लिए'},
    {'en': 'About whom', 'pronunciation': 'अबाउट हूम', 'hi': 'किसके बारे में'},
    {'en': 'Towards whom', 'pronunciation': 'टुवर्ड्स हूम', 'hi': 'किसकी तरफ'},
    {'en': 'By whom', 'pronunciation': 'बाय हूम', 'hi': 'किसके द्वारा'},
  ];

  // ── Where/When Combinations ────────────────────────────────────────────────
  static const List<Map<String, String>> whereWhenCombos = [
    {'en': 'From where', 'pronunciation': 'फ्रॉम वेयर', 'hi': 'कहाँ से / जहाँ से'},
    {'en': 'Until when', 'pronunciation': 'अन्टिल वेन', 'hi': 'कब तक'},
    {'en': 'Since when', 'pronunciation': 'सिन्स वेन', 'hi': 'कब से'},
    {'en': 'From when', 'pronunciation': 'फ्रॉम वेन', 'hi': 'कब से'},
    {'en': 'At what time', 'pronunciation': 'एट वट टाइम', 'hi': 'किस समय'},
  ];

  // ── What Combinations ──────────────────────────────────────────────────────
  static const List<Map<String, String>> whatCombos = [
    {'en': 'For what', 'pronunciation': 'फॉर वट', 'hi': 'किसलिए / जिसलिए'},
    {'en': 'What for', 'pronunciation': 'वट फॉर', 'hi': 'किसलिए / जिसलिए'},
    {'en': 'What else', 'pronunciation': 'वट एल्स', 'hi': 'और क्या'},
    {'en': 'What then', 'pronunciation': 'वट देन', 'hi': 'तो क्या / फिर क्या'},
    {'en': 'What type of', 'pronunciation': 'वट टाइप ऑफ', 'hi': 'किस तरह का'},
    {'en': 'What kind of', 'pronunciation': 'वट काइन्ड ऑफ', 'hi': 'किस तरह का'},
    {'en': 'In what way', 'pronunciation': 'इन वट वे', 'hi': 'किस तरह से'},
    {'en': 'Whatever', 'pronunciation': 'वटएवर', 'hi': 'जो कुछ भी'},
    {'en': 'Whatsoever', 'pronunciation': 'वटसोएवर', 'hi': 'जो कुछ भी'},
  ];

  // ── Extended WH Words ──────────────────────────────────────────────────────
  static const List<Map<String, String>> extendedWH = [
    {'en': 'Whenever', 'pronunciation': 'वेनेवर', 'hi': 'जब कभी'},
    {'en': 'Whensoever', 'pronunciation': 'वेनसोएवर', 'hi': 'जब कभी'},
    {'en': 'Whence', 'pronunciation': 'वेन्स', 'hi': 'कहाँ से / जहाँ से'},
    {'en': 'Whereas', 'pronunciation': 'वेयरएज़', 'hi': 'जबकि'},
    {'en': 'Wherein', 'pronunciation': 'वेयर इन', 'hi': 'जिसमें'},
    {'en': 'Whichever', 'pronunciation': 'विचएवर', 'hi': 'जो भी (कोई सा)'},
    {'en': 'Whichsoever', 'pronunciation': 'विचसोएवर', 'hi': 'जो भी (कोई सा)'},
    {'en': 'Which type', 'pronunciation': 'विच टाइप', 'hi': 'किस तरह का'},
    {'en': 'Whoever', 'pronunciation': 'हूएवर', 'hi': 'जो भी (कोई व्यक्ति)'},
    {'en': 'Whosesoever', 'pronunciation': 'हूसोएवर', 'hi': 'जिसका भी'},
    {'en': 'Why so', 'pronunciation': 'वाय सो', 'hi': 'ऐसा क्यों'},
  ];

  // ── Which & Whose with Nouns ────────────────────────────────────────────────
  static const List<Map<String, String>> whichWhosCombos = [
    {'en': 'From which office', 'pronunciation': 'फ्रॉम विच ऑफिस', 'hi': 'किस ऑफिस से'},
    {'en': 'From whose office', 'pronunciation': 'फ्रॉम हूज़ ऑफिस', 'hi': 'किसके ऑफिस से'},
    {'en': 'With which boy', 'pronunciation': 'विद विच बॉय', 'hi': 'किस लड़के के साथ'},
    {'en': 'Towards which city', 'pronunciation': 'टुवर्ड्स विच सिटी', 'hi': 'किस शहर की तरफ'},
    {'en': 'From which street', 'pronunciation': 'फ्रॉम विच स्ट्रीट', 'hi': 'किस गली से'},
    {'en': 'For which company', 'pronunciation': 'फॉर विच कम्पनी', 'hi': 'किस कम्पनी के लिए'},
    {'en': 'By which gun', 'pronunciation': 'बाय विच गन', 'hi': 'किस बन्दूक से'},
    {'en': 'In which glass', 'pronunciation': 'इन विच ग्लास', 'hi': 'किस गिलास में'},
    {'en': 'For whose son', 'pronunciation': 'फॉर हूज़ सन', 'hi': 'किसके बेटे के लिए'},
    {'en': 'With which people', 'pronunciation': 'विद विच पीपल', 'hi': 'किन लोगों के साथ'},
  ];

  // ── How many/much with Nouns ────────────────────────────────────────────────
  static const List<Map<String, String>> howManyMuchCombos = [
    {'en': 'How many brothers', 'pronunciation': 'हाउ मेनी ब्रदर्स', 'hi': 'कितने भाई'},
    {'en': 'How many hairs', 'pronunciation': 'हाउ मेनी हेअर्स', 'hi': 'कितने बाल'},
    {'en': 'How many stars', 'pronunciation': 'हाउ मेनी स्टार्स', 'hi': 'कितने तारे'},
    {'en': 'How many such people', 'pronunciation': 'हाउ मेनी सच पीपल', 'hi': 'ऐसे कितने लोग'},
    {'en': 'How many kilograms of sugar', 'pronunciation': 'हाउ मेनी किलोग्राम्स ऑफ शुगर', 'hi': 'कितने किलो चीनी'},
    {'en': 'How many glasses of milk', 'pronunciation': 'हाउ मेनी ग्लासेज़ ऑफ मिल्क', 'hi': 'कितने गिलास दूध'},
    {'en': 'How many brothers of mine', 'pronunciation': 'हाउ मेनी ब्रदर्स ऑफ माइन', 'hi': 'मेरे कितने भाई'},
    {'en': 'How many brothers of yours', 'pronunciation': 'हाउ मेनी ब्रदर्स ऑफ योर्स', 'hi': 'तुम्हारे कितने भाई'},
    {'en': 'How much money', 'pronunciation': 'हाउ मच मनी', 'hi': 'कितना पैसा'},
    {'en': 'How much sugar', 'pronunciation': 'हाउ मच शुगर', 'hi': 'कितनी चीनी'},
  ];

  // ── Which + Possessive ──────────────────────────────────────────────────────
  static const List<Map<String, String>> whichPossessive = [
    {'en': 'Which brother of mine', 'pronunciation': 'विच ब्रदर ऑफ माइन', 'hi': 'मेरा कौन सा भाई'},
    {'en': 'Which sister of yours', 'pronunciation': 'विच सिस्टर ऑफ योर्स', 'hi': 'तुम्हारी कौन सी बहन'},
    {'en': 'Which school\'s student', 'pronunciation': 'विच स्कूल्स स्टूडेंट', 'hi': 'किस स्कूल का विद्यार्थी'},
    {'en': 'Which girl\'s brother', 'pronunciation': 'विच गर्ल्स ब्रदर', 'hi': 'किस लड़की का भाई'},
    {'en': 'What kind of people', 'pronunciation': 'वट काइन्ड ऑफ पीपल', 'hi': 'किस तरह के लोग'},
    {'en': 'What kind of book', 'pronunciation': 'वट काइन्ड ऑफ बुक', 'hi': 'किस तरह की किताब'},
  ];
}