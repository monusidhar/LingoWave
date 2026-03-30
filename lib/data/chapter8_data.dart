import '../models/lesson_model.dart';

/// Chapter 8 — Pronoun (सर्वनाम)
class Chapter8Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 8,
        title: 'Pronoun',
        titleHindi: 'सर्वनाम',
        description: 'Subjective, Objective, Possessive & Reflexive',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
            id: 1, title: 'What is a Pronoun?',
            titleHindi: 'सर्वनाम क्या है?',
            emoji: '👤', type: LessonType.ch8Intro,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 2, title: 'Subjective & Objective Pronouns',
            titleHindi: 'कर्ता और कर्म सर्वनाम',
            emoji: '🔄', type: LessonType.ch8SubjObj,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 3, title: 'Possessive Pronouns',
            titleHindi: 'अधिकारवाचक सर्वनाम',
            emoji: '🔑', type: LessonType.ch8Possessive,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 4, title: 'Reflexive Pronouns',
            titleHindi: 'निजवाचक सर्वनाम',
            emoji: '🪞', type: LessonType.ch8Reflexive,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 5, title: 'My vs Mine & Examples',
            titleHindi: 'My और Mine का अंतर',
            emoji: '💡', type: LessonType.ch8MyMine,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 6, title: 'Chapter Quiz',
            titleHindi: 'अध्याय क्विज़',
            emoji: '🏆', type: LessonType.ch8ChapterQuiz,
            status: LessonStatus.inProgress, totalXP: 60,
          ),
        ],
      );

  // ─── Router ───────────────────────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch8Intro:        return introQuestions;
      case LessonType.ch8SubjObj:      return subjObjQuestions;
      case LessonType.ch8Possessive:   return possessiveQuestions;
      case LessonType.ch8Reflexive:    return reflexiveQuestions;
      case LessonType.ch8MyMine:       return myMineQuestions;
      case LessonType.ch8ChapterQuiz:  return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 QUIZ — What is a Pronoun?
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'What is a Pronoun?',
      questionHi: 'Pronoun (सर्वनाम) किसे कहते हैं?',
      options: [
        'किसी वस्तु का नाम',
        'Noun की जगह प्रयोग होने वाला शब्द',
        'क्रिया बताने वाला शब्द',
        'विशेषता बताने वाला शब्द',
      ],
      correctIndex: 1,
      explanation: 'Pronoun = सर्वनाम — ऐसे शब्द जो Noun की जगह प्रयोग होते हैं। जैसे: Ram → He, His',
    ),
    QuizQuestion(
      questionEn: '"Ram is a good boy. He is my friend." — "He" replaces ___.',
      questionHi: '"Ram is a good boy. He is my friend." — "He" किसकी जगह आया?',
      options: ['My', 'Boy', 'Ram', 'Friend'],
      correctIndex: 2,
      explanation: '"He" यहाँ "Ram" की जगह प्रयोग हुआ — यही Pronoun का काम है।',
    ),
    QuizQuestion(
      questionEn: 'How many types of Pronouns are taught in this chapter?',
      questionHi: 'इस अध्याय में Pronoun के कितने प्रकार बताए गए हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 2,
      explanation: '4 प्रकार: Subjective, Objective, Possessive और Reflexive Pronoun।',
    ),
    QuizQuestion(
      questionEn: '"He is mad." — "He" is which type of pronoun?',
      questionHi: '"He is mad." — "He" किस प्रकार का pronoun है?',
      options: ['Objective', 'Reflexive', 'Possessive', 'Subjective'],
      correctIndex: 3,
      explanation: 'Subjective Pronoun — Subject की जगह प्रयोग होता है। "He" यहाँ Subject है।',
    ),
    QuizQuestion(
      questionEn: 'Using Pronouns instead of Nouns makes a sentence ___.',
      questionHi: 'Pronoun के प्रयोग से वाक्य ___.',
      options: ['गलत हो जाता है', 'ज़्यादा बेहतर और सुगम हो जाता है', 'अधूरा लगता है', 'मुश्किल हो जाता है'],
      correctIndex: 1,
      explanation: 'Pronoun का प्रयोग वाक्य को दोहराव से बचाता है और ज़्यादा बेहतर बनाता है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 QUIZ — Subjective & Objective
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> subjObjQuestions = [
    QuizQuestion(
      questionEn: 'Which pronoun is used as Subject in a sentence?',
      questionHi: 'वाक्य में Subject के रूप में कौन सा pronoun प्रयोग होता है?',
      options: ['Me', 'Him', 'He', 'Them'],
      correctIndex: 2,
      explanation: '"He" Subjective Pronoun है। Me, Him, Them — Objective Pronouns हैं।',
    ),
    QuizQuestion(
      questionEn: '"Dad scolded me." — "me" is which type of pronoun?',
      questionHi: '"Dad scolded me." — "me" किस प्रकार का pronoun है?',
      options: ['Subjective', 'Reflexive', 'Objective', 'Possessive'],
      correctIndex: 2,
      explanation: '"Me" Objective Pronoun है — Object की जगह प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: 'The Subjective form of "Him" is ___.',
      questionHi: '"Him" का Subjective रूप क्या है?',
      options: ['Himself', 'His', 'He', 'Her'],
      correctIndex: 2,
      explanation: 'Him → He. "He" Subjective है, "Him" Objective है।',
    ),
    QuizQuestion(
      questionEn: '"We were in Dehradun." — "We" is ___.',
      questionHi: '"We were in Dehradun." — "We" ___ है।',
      options: ['Objective', 'Possessive', 'Reflexive', 'Subjective'],
      correctIndex: 3,
      explanation: '"We" Subjective Pronoun है — यह वाक्य का Subject है।',
    ),
    QuizQuestion(
      questionEn: '"Papa did a lot for them." — "them" is ___.',
      questionHi: '"Papa did a lot for them." — "them" ___ है।',
      options: ['Subjective', 'Possessive', 'Objective', 'Reflexive'],
      correctIndex: 2,
      explanation: '"Them" Objective Pronoun है। यह Object की जगह प्रयोग हुआ है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 QUIZ — Possessive Pronouns
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> possessiveQuestions = [
    QuizQuestion(
      questionEn: '"मेरा भाई" in English uses ___.',
      questionHi: '"मेरा भाई" के लिए English में ___ प्रयोग होगा।',
      options: ['Mine', 'My', 'Me', 'Myself'],
      correctIndex: 1,
      explanation: 'जब "मेरा" के साथ कोई Noun जुड़ा हो (मेरा भाई) तो "My" प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: '"Heart is yours, not ___." — fill in the blank.',
      questionHi: '"Heart is yours, not ___." — खाली जगह में क्या आएगा?',
      options: ['My', 'Me', 'Mine', 'Myself'],
      correctIndex: 2,
      explanation: 'जब "मेरा" अकेला आए (किसी noun के बिना) तो "Mine" प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: '"Your" vs "Yours" — "Your" is used when ___.',
      questionHi: '"Your" और "Yours" में "Your" का प्रयोग कब होता है?',
      options: ['जब अकेले आए', 'जब किसी Noun के साथ आए', 'दोनों समान हैं', 'Reflexive के लिए'],
      correctIndex: 1,
      explanation: '"Your" तब प्रयोग होता है जब किसी noun के साथ आए: Your book, Your friend.',
    ),
    QuizQuestion(
      questionEn: 'Possessive pronoun for "She" is ___.',
      questionHi: '"She" का Possessive pronoun क्या है?',
      options: ['Her / Hers', 'Him / His', 'Their / Theirs', 'Our / Ours'],
      correctIndex: 0,
      explanation: '"She" के लिए: Her (noun के साथ) और Hers (अकेले) प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: 'Possessive pronoun for "They" is ___.',
      questionHi: '"They" का Possessive pronoun क्या है?',
      options: ['His / His', 'Our / Ours', 'Their / Theirs', 'Your / Yours'],
      correctIndex: 2,
      explanation: '"They" के लिए Their (noun के साथ) और Theirs (अकेले) प्रयोग होता है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 QUIZ — Reflexive Pronouns
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> reflexiveQuestions = [
    QuizQuestion(
      questionEn: '"I will do it myself." — "myself" is which type?',
      questionHi: '"I will do it myself." — "myself" किस प्रकार का pronoun है?',
      options: ['Subjective', 'Objective', 'Possessive', 'Reflexive'],
      correctIndex: 3,
      explanation: 'Reflexive Pronoun — Subject (I) खुद ही वो काम कर रहा है।',
    ),
    QuizQuestion(
      questionEn: 'Reflexive pronoun for "She" is ___.',
      questionHi: '"She" का Reflexive pronoun क्या है?',
      options: ['Himself', 'Herself', 'Itself', 'Yourself'],
      correctIndex: 1,
      explanation: '"She" के लिए Reflexive pronoun = "Herself" (वो खुद — एक स्त्री)।',
    ),
    QuizQuestion(
      questionEn: '"He will go there himself." — "himself" is used because ___.',
      questionHi: '"He will go there himself." — "himself" क्यों प्रयोग हुआ?',
      options: ['He एक Object है', 'He खुद ही वो काम करेगा', 'Objective context है', '"Him" का रूप है'],
      correctIndex: 1,
      explanation: 'Reflexive pronoun तब आता है जब Subject (He) खुद ही वो काम करे।',
    ),
    QuizQuestion(
      questionEn: 'Reflexive pronoun for "We" is ___.',
      questionHi: '"We" का Reflexive pronoun क्या है?',
      options: ['Itself', 'Himself', 'Ourselves', 'Themselves'],
      correctIndex: 2,
      explanation: '"We" के लिए Reflexive pronoun = "Ourselves" (हम खुद)।',
    ),
    QuizQuestion(
      questionEn: '"Do it yourself." — "yourself" is the Reflexive of ___.',
      questionHi: '"Do it yourself." — "yourself" किसका Reflexive है?',
      options: ['I', 'He', 'You', 'They'],
      correctIndex: 2,
      explanation: '"Yourself/Yourselves" — "You" का Reflexive pronoun है (तुम/आप खुद)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 QUIZ — My vs Mine
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> myMineQuestions = [
    QuizQuestion(
      questionEn: '"This is my book." — why is "My" used here?',
      questionHi: '"This is my book." — यहाँ "My" क्यों प्रयोग हुआ?',
      options: [
        'क्योंकि book एक Noun है',
        'क्योंकि "मेरा" के साथ "book" (noun) जुड़ा है',
        'क्योंकि "मेरा" अकेला है',
        'कोई कारण नहीं',
      ],
      correctIndex: 1,
      explanation: 'जब "मेरा" के साथ कोई Noun जुड़ा हो (my book, my brother) तो "My" प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: '"This book is mine." — why is "Mine" used?',
      questionHi: '"This book is mine." — यहाँ "Mine" क्यों प्रयोग हुआ?',
      options: [
        'क्योंकि book plural है',
        'क्योंकि "मेरा" अकेला आया है (कोई noun नहीं जुड़ा)',
        'क्योंकि Subject है',
        'क्योंकि My गलत है',
      ],
      correctIndex: 1,
      explanation: 'जब "मेरा" अकेले आए — कोई noun न जुड़ा हो — तो "Mine" प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: '"You are my brother." — "My" is correct because ___.',
      questionHi: '"You are my brother." — "My" सही है क्योंकि ___.',
      options: ['You Subject है', '"मेरा" के साथ "brother" noun जुड़ा है', '"Mine" गलत शब्द है', 'Plural वाक्य है'],
      correctIndex: 1,
      explanation: '"My brother" — My के बाद noun (brother) है, इसलिए My सही है।',
    ),
    QuizQuestion(
      questionEn: '"You are mine." — "Mine" is correct because ___.',
      questionHi: '"You are mine." — "Mine" सही है क्योंकि ___.',
      options: ['You plural है', '"मेरा" के साथ कोई noun नहीं जुड़ा', '"My" बहुत formal है', 'Subject की जगह है'],
      correctIndex: 1,
      explanation: '"You are mine" — यहाँ "मेरा" अकेले आया है, कोई noun नहीं जुड़ा, इसलिए Mine।',
    ),
    QuizQuestion(
      questionEn: 'Same rule: "Your" is used when ___, "Yours" is used when ___.',
      questionHi: '"Your" कब, "Yours" कब?',
      options: [
        'अकेला / noun के साथ',
        'Noun के साथ / अकेला',
        'दोनों एक ही हैं',
        'Plural / Singular',
      ],
      correctIndex: 1,
      explanation: 'Your brother (noun जुड़ा) → Your. "Heart is yours" (अकेला) → Yours. My/Mine भी ऐसे ही।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 12 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Pronoun is used in place of ___.',
      questionHi: 'Pronoun ___ की जगह प्रयोग होता है।',
      options: ['Verb', 'Adjective', 'Noun', 'Adverb'],
      correctIndex: 2,
      explanation: 'Pronoun = सर्वनाम — Noun की जगह प्रयोग होने वाला शब्द।',
    ),
    QuizQuestion(
      questionEn: '"He is mad." — "He" is a ___ pronoun.',
      questionHi: '"He is mad." — "He" ___ pronoun है।',
      options: ['Objective', 'Possessive', 'Reflexive', 'Subjective'],
      correctIndex: 3,
      explanation: '"He" Subject की जगह है → Subjective Pronoun।',
    ),
    QuizQuestion(
      questionEn: '"Ram was with me." — "me" is a ___ pronoun.',
      questionHi: '"Ram was with me." — "me" ___ pronoun है।',
      options: ['Subjective', 'Objective', 'Possessive', 'Reflexive'],
      correctIndex: 1,
      explanation: '"Me" Object की जगह है → Objective Pronoun।',
    ),
    QuizQuestion(
      questionEn: '"Ram is my youngest son." — "my" is a ___ pronoun.',
      questionHi: '"Ram is my youngest son." — "my" ___ pronoun है।',
      options: ['Subjective', 'Objective', 'Possessive', 'Reflexive'],
      correctIndex: 2,
      explanation: '"My" किसका है बताता है → Possessive Pronoun।',
    ),
    QuizQuestion(
      questionEn: '"I will do it myself." — "myself" is a ___ pronoun.',
      questionHi: '"I will do it myself." — "myself" ___ pronoun है।',
      options: ['Subjective', 'Objective', 'Possessive', 'Reflexive'],
      correctIndex: 3,
      explanation: '"Myself" Subject खुद के बारे में बताता है → Reflexive Pronoun।',
    ),
    QuizQuestion(
      questionEn: 'Objective pronoun for "She" is ___.',
      questionHi: '"She" का Objective pronoun क्या है?',
      options: ['Hers', 'Her', 'Herself', 'His'],
      correctIndex: 1,
      explanation: '"She" → Objective = "Her" (उसे, उसको)।',
    ),
    QuizQuestion(
      questionEn: '"This is my book." — "My" because ___.',
      questionHi: '"This is my book." — "My" क्योंकि ___.',
      options: ['Mine गलत है', '"मेरा" के साथ "book" noun जुड़ा है', 'वाक्य plural है', 'Subject है'],
      correctIndex: 1,
      explanation: 'My + Noun (book) → "My" प्रयोग। अकेला "मेरा" → "Mine" प्रयोग।',
    ),
    QuizQuestion(
      questionEn: 'Reflexive pronoun for "They" is ___.',
      questionHi: '"They" का Reflexive pronoun क्या है?',
      options: ['Ourselves', 'Himself', 'Themselves', 'Yourself'],
      correctIndex: 2,
      explanation: '"They" → Reflexive = "Themselves" (वो खुद/वे खुद)।',
    ),
    QuizQuestion(
      questionEn: '"Heart is yours, not mine." — "mine" is because ___.',
      questionHi: '"Heart is yours, not mine." — "mine" क्योंकि ___.',
      options: ['noun जुड़ा है', '"मेरा" अकेले है', 'Reflexive context है', '"My" का दूसरा रूप'],
      correctIndex: 1,
      explanation: '"Mine" — "मेरा" अकेले आया है, कोई noun नहीं जुड़ा।',
    ),
    QuizQuestion(
      questionEn: 'Possessive pronoun for "We" is ___.',
      questionHi: '"We" का Possessive pronoun क्या है?',
      options: ['Their / Theirs', 'His / His', 'Our / Ours', 'Your / Yours'],
      correctIndex: 2,
      explanation: '"We" → Possessive = "Our" (noun के साथ) / "Ours" (अकेले)।',
    ),
    QuizQuestion(
      questionEn: '"Baby is watching you." — "you" is ___.',
      questionHi: '"Baby is watching you." — "you" यहाँ ___ है।',
      options: ['Subjective Pronoun', 'Reflexive Pronoun', 'Possessive Pronoun', 'Objective Pronoun'],
      correctIndex: 3,
      explanation: '"You" यहाँ Object की जगह है → Objective Pronoun।',
    ),
    QuizQuestion(
      questionEn: 'Subjective pronoun for "Her" is ___.',
      questionHi: '"Her" (Objective) का Subjective रूप क्या है?',
      options: ['Hers', 'Herself', 'She', 'His'],
      correctIndex: 2,
      explanation: 'Her (Objective) → She (Subjective). वह (एक स्त्री) = She।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ── Full Pronoun Table ────────────────────────────────────────────────────
  static const List<Map<String, String>> pronounTable = [
    {
      'subjective': 'I',   'subjectiveHi': 'मैं',
      'objective': 'Me',   'objectiveHi': 'मुझे / मेरे',
      'possessiveAdj': 'My',   'possessiveAdjHi': 'मेरा',
      'possessivePron': 'Mine', 'possessivePronHi': 'मेरा',
      'reflexive': 'Myself',   'reflexiveHi': 'मैं खुद',
      'note': '',
    },
    {
      'subjective': 'He',  'subjectiveHi': 'वह, वो (एक पुरुष)',
      'objective': 'Him',  'objectiveHi': 'उसे, उसको (एक पुरुष को)',
      'possessiveAdj': 'His',  'possessiveAdjHi': 'उसका (एक पुरुष का)',
      'possessivePron': 'His', 'possessivePronHi': 'उसका (एक पुरुष का)',
      'reflexive': 'Himself',  'reflexiveHi': 'वो खुद (एक पुरुष)',
      'note': 'Male / पुरुष',
    },
    {
      'subjective': 'She', 'subjectiveHi': 'वह, वो (एक स्त्री)',
      'objective': 'Her',  'objectiveHi': 'उसे, उसको (एक स्त्री को)',
      'possessiveAdj': 'Her',  'possessiveAdjHi': 'उसका (एक स्त्री का)',
      'possessivePron': 'Hers', 'possessivePronHi': 'उसका (एक स्त्री का)',
      'reflexive': 'Herself',  'reflexiveHi': 'वो खुद (एक स्त्री)',
      'note': 'Female / स्त्री',
    },
    {
      'subjective': 'You', 'subjectiveHi': 'तुम, आप',
      'objective': 'You',  'objectiveHi': 'तुम्हें, तुम्हारे / आपको, आपके',
      'possessiveAdj': 'Your', 'possessiveAdjHi': 'तुम्हारा / आपका',
      'possessivePron': 'Yours','possessivePronHi': 'तुम्हारा / आपका',
      'reflexive': 'Yourself / Yourselves', 'reflexiveHi': 'तुम / आप खुद',
      'note': 'Singular या Plural दोनों',
    },
    {
      'subjective': 'They','subjectiveHi': 'वे, वो (एक से ज्यादा)',
      'objective': 'Them', 'objectiveHi': 'उनके (एक से ज्यादा व्यक्तियों को)',
      'possessiveAdj': 'Their','possessiveAdjHi': 'उनका (एक से ज्यादा व्यक्तियों का)',
      'possessivePron': 'Theirs','possessivePronHi': 'उनका (एक से ज्यादा व्यक्तियों का)',
      'reflexive': 'Themselves','reflexiveHi': 'वो खुद / वे खुद (एक से ज्यादा)',
      'note': 'Plural',
    },
    {
      'subjective': 'We',  'subjectiveHi': 'हम',
      'objective': 'Us',   'objectiveHi': 'हमारे (एक से ज्यादा व्यक्तियों को)',
      'possessiveAdj': 'Our',  'possessiveAdjHi': 'हमारा (एक से ज्यादा व्यक्तियों का)',
      'possessivePron': 'Ours', 'possessivePronHi': 'हमारा (एक से ज्यादा व्यक्तियों का)',
      'reflexive': 'Ourselves', 'reflexiveHi': 'हम खुद (एक से ज्यादा)',
      'note': 'Plural',
    },
  ];

  // ── 4 Pronoun Types ───────────────────────────────────────────────────────
  static const List<Map<String, String>> pronounTypes = [
    {
      'type': 'Subjective Pronoun',
      'typeHi': 'कर्तावाचक सर्वनाम',
      'desc': 'यह Subject में प्रयोग किये जाते हैं।',
      'descEn': 'Used as the Subject of a sentence.',
      'emoji': '👤',
      'color': 'primary',
      'words': 'I, He, She, You, They, We',
    },
    {
      'type': 'Objective Pronoun',
      'typeHi': 'कर्मवाचक सर्वनाम',
      'desc': 'यह Object में प्रयोग किये जाते हैं।',
      'descEn': 'Used as the Object of a sentence.',
      'emoji': '📦',
      'color': 'accent',
      'words': 'Me, Him, Her, You, Them, Us',
    },
    {
      'type': 'Possessive Pronoun',
      'typeHi': 'अधिकारवाचक सर्वनाम',
      'desc': 'इस तरह के Pronoun का प्रयोग ये बताने के लिए किया जाता है कि यह किसका है।',
      'descEn': 'Used to show ownership/possession — whose something is.',
      'emoji': '🔑',
      'color': 'success',
      'words': 'My/Mine, His/His, Her/Hers, Your/Yours, Their/Theirs, Our/Ours',
    },
    {
      'type': 'Reflexive Pronoun',
      'typeHi': 'निजवाचक सर्वनाम',
      'desc': 'इस Pronoun का प्रयोग तब किया जाता है जब Subject खुद के बारे में बताता हो।',
      'descEn': 'Used when the Subject performs an action on/for itself.',
      'emoji': '🪞',
      'color': 'warning',
      'words': 'Myself, Himself, Herself, Yourself/Yourselves, Themselves, Ourselves',
    },
  ];

  // ── Intro Examples (Ram & He) ─────────────────────────────────────────────
  static const List<Map<String, String>> introExamples = [
    {
      'label': 'Without Pronoun',
      'hindi': 'राम अच्छा लड़का है। राम मेरा दोस्त है। राम के पापा मेरे पापा के साथ काम करते हैं।',
      'english': 'Ram is a good boy. Ram is my friend. Ram\'s father works with my father.',
      'note': 'बार-बार "राम" आने से वाक्य दोहराव लगता है।',
      'color': 'error',
    },
    {
      'label': 'With Pronoun',
      'hindi': 'राम अच्छा लड़का है। वो मेरा दोस्त है। उसके पापा मेरे पापा के साथ काम करते हैं।',
      'english': 'Ram is a good boy. He is my friend. His father works with my father.',
      'note': '"He" और "His" ने "Ram" की जगह ली — वाक्य बेहतर हो गया!',
      'color': 'success',
    },
  ];

  // ── Subjective Examples ───────────────────────────────────────────────────
  static const List<Map<String, String>> subjectiveExamples = [
    {'hi': 'वो पागल है।',           'en': 'He is mad.',           'pronoun': 'He'},
    {'hi': 'हम देहरादून में थे।',    'en': 'We were in Dehradun.', 'pronoun': 'We'},
    {'hi': 'वो मेरी दोस्त है।',     'en': 'She is my friend.',    'pronoun': 'She'},
    {'hi': 'मैं तुमसे प्यार करता हूँ।', 'en': 'I love you.',     'pronoun': 'I'},
    {'hi': 'वे स्कूल जाते हैं।',    'en': 'They go to school.',   'pronoun': 'They'},
    {'hi': 'तुम बहुत अच्छे हो।',    'en': 'You are very good.',   'pronoun': 'You'},
  ];

  // ── Objective Examples ────────────────────────────────────────────────────
  static const List<Map<String, String>> objectiveExamples = [
    {'hi': 'राम मेरे साथ था।',               'en': 'Ram was with me.',             'pronoun': 'me'},
    {'hi': 'पापा ने मुझे डाँटा।',             'en': 'Dad scolded me.',              'pronoun': 'me'},
    {'hi': 'बच्चा तुम्हें देख रहा है।',      'en': 'Baby is watching you.',        'pronoun': 'you'},
    {'hi': 'पापा ने उनके लिए बहुत कुछ किया।','en': 'Papa did a lot for them.',    'pronoun': 'them'},
    {'hi': 'माँ ने उसे बुलाया।',             'en': 'Mom called him.',              'pronoun': 'him'},
    {'hi': 'टीचर ने उसे समझाया।',            'en': 'The teacher explained to her.','pronoun': 'her'},
  ];

  // ── Possessive Examples ───────────────────────────────────────────────────
  static const List<Map<String, String>> possessiveExamples = [
    {'hi': 'राम मेरा सबसे छोटा बेटा है।', 'en': 'Ram is my youngest son.',         'pronoun': 'my'},
    {'hi': 'दिल तुम्हारा है, मेरा नहीं।', 'en': 'Heart is yours, not mine.',       'pronoun': 'yours / mine'},
    {'hi': 'मेरा दिल रो रहा था।',         'en': 'My heart was crying.',            'pronoun': 'My'},
    {'hi': 'भाई उसका है, राम का नहीं।',   'en': "Brother is his/hers, not Ram's.",'pronoun': 'his/hers'},
    {'hi': 'तुम मेरे नहीं थे।',           'en': 'You were not mine.',              'pronoun': 'mine'},
    {'hi': 'यह हमारा घर है।',             'en': 'This is our house.',              'pronoun': 'our'},
    {'hi': 'उनकी किताब मेज पर है।',       'en': 'Their book is on the table.',    'pronoun': 'Their'},
  ];

  // ── Reflexive Examples ────────────────────────────────────────────────────
  static const List<Map<String, String>> reflexiveExamples = [
    {'hi': 'मैं ये खुद करूँगा।',      'en': 'I will do it myself.',         'pronoun': 'myself'},
    {'hi': 'वो वहाँ अपने आप जायेगा।', 'en': 'He will go there himself.',    'pronoun': 'himself'},
    {'hi': 'ये आप खुद करिए।',         'en': 'Do it yourself.',              'pronoun': 'yourself'},
    {'hi': 'वो खुद ही आई थी।',        'en': 'She came herself.',            'pronoun': 'herself'},
    {'hi': 'हम खुद ही कर लेंगे।',     'en': 'We will do it ourselves.',     'pronoun': 'ourselves'},
    {'hi': 'वे खुद ही समझ गए।',       'en': 'They understood themselves.',  'pronoun': 'themselves'},
  ];

  // ── My vs Mine data ───────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> myMineData = [
    {
      'hindi': 'तुम मेरे भाई हो।',
      'english': 'You are my brother.',
      'uses': 'My',
      'reason': '"मेरा" + "भाई" (noun जुड़ा) → My',
      'usesMine': false,
    },
    {
      'hindi': 'तुम मेरे हो।',
      'english': 'You are mine.',
      'uses': 'Mine',
      'reason': '"मेरा" अकेला → Mine',
      'usesMine': true,
    },
    {
      'hindi': 'यह मेरी किताब है।',
      'english': 'This is my book.',
      'uses': 'My',
      'reason': '"मेरा" + "book" (noun जुड़ा) → My',
      'usesMine': false,
    },
    {
      'hindi': 'ये किताब मेरी है।',
      'english': 'This book is mine.',
      'uses': 'Mine',
      'reason': '"मेरा" अकेला (Subject का हिस्सा) → Mine',
      'usesMine': true,
    },
  ];

  // ── Possessive Difference (with noun vs alone) ────────────────────────────
  static const List<Map<String, String>> possessiveDifference = [
    {'withNoun': 'My',    'withNounHi': 'मेरा',              'alone': 'Mine',   'aloneHi': 'मेरा (अकेला)'},
    {'withNoun': 'Our',   'withNounHi': 'हमारा',             'alone': 'Ours',   'aloneHi': 'हमारा (अकेला)'},
    {'withNoun': 'Your',  'withNounHi': 'तुम्हारा / आपका',   'alone': 'Yours',  'aloneHi': 'तुम्हारा (अकेला)'},
    {'withNoun': 'His',   'withNounHi': 'उसका (पुरुष)',       'alone': 'His',    'aloneHi': 'उसका (पुरुष, दोनों)'},
    {'withNoun': 'Her',   'withNounHi': 'उसका (स्त्री)',      'alone': 'Hers',   'aloneHi': 'उसका (स्त्री, अकेला)'},
    {'withNoun': 'Their', 'withNounHi': 'उनका',              'alone': 'Theirs', 'aloneHi': 'उनका (अकेला)'},
  ];

  // ── Pronoun Examples (with/without noun label for possessive quick reference)
  static const List<Map<String, String>> possessiveWithNounExamples = [
    {'phrase': 'My book',    'hi': 'मेरी किताब',       'note': 'My + noun'},
    {'phrase': 'Your bag',   'hi': 'तुम्हारा बैग',      'note': 'Your + noun'},
    {'phrase': 'His pen',    'hi': 'उसका पेन (पुरुष)', 'note': 'His + noun'},
    {'phrase': 'Her dress',  'hi': 'उसकी ड्रेस (स्त्री)','note': 'Her + noun'},
    {'phrase': 'Our school', 'hi': 'हमारा स्कूल',       'note': 'Our + noun'},
    {'phrase': 'Their car',  'hi': 'उनकी गाड़ी',        'note': 'Their + noun'},
  ];

  static const List<Map<String, String>> possessiveAloneExamples = [
    {'phrase': 'This is mine.',    'hi': 'यह मेरा है।',            'note': 'Mine — अकेला'},
    {'phrase': 'That is yours.',   'hi': 'वो तुम्हारा है।',          'note': 'Yours — अकेला'},
    {'phrase': 'It is his.',       'hi': 'यह उसका है (पुरुष)।',     'note': 'His — अकेला'},
    {'phrase': 'It is hers.',      'hi': 'यह उसका है (स्त्री)।',    'note': 'Hers — अकेला'},
    {'phrase': 'It is ours.',      'hi': 'यह हमारा है।',            'note': 'Ours — अकेला'},
    {'phrase': 'Those are theirs.','hi': 'वो उनके हैं।',            'note': 'Theirs — अकेला'},
  ];
}