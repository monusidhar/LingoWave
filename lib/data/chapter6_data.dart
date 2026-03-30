import '../models/lesson_model.dart';

/// Chapter 6 — Parts of Speech (शब्द भेद)
class Chapter6Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 6,
        title: 'Parts of Speech',
        titleHindi: 'शब्द भेद',
        description: '8 Parts: Noun, Verb, Adjective & More',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Noun, Pronoun & Verb',
              titleHindi: 'संज्ञा, सर्वनाम और क्रिया',
              emoji: '📚', type: LessonType.ch6POS1, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Adjective, Adverb, Preposition, Conjunction & Interjection',
              titleHindi: 'विशेषण, क्रिया विशेषण, पूर्वसर्ग, संयोजक और विस्मयादिबोधक',
              emoji: '🔡', type: LessonType.ch6POS2, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Articles & Determiners',
              titleHindi: 'आर्टिकल्स और निर्धारक',
              emoji: '💡', type: LessonType.ch6POS3, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch6ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 40),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch6POS1:         return pos1Questions;
      case LessonType.ch6POS2:         return pos2Questions;
      case LessonType.ch6POS3:         return pos3Questions;
      case LessonType.ch6ChapterQuiz:  return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 QUIZ — Noun, Pronoun, Verb
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pos1Questions = [
    QuizQuestion(
      questionEn: 'How many Parts of Speech are there?',
      questionHi: 'Parts of Speech कितने होते हैं?',
      options: ['6', '7', '8', '9'],
      correctIndex: 2,
      explanation: 'Parts of Speech 8 होते हैं — Noun, Pronoun, Verb, Adjective, Adverb, Preposition, Conjunction, Interjection।',
    ),
    QuizQuestion(
      questionEn: 'What is a Noun?',
      questionHi: 'Noun (संज्ञा) किसे कहते हैं?',
      options: [
        'किसी क्रिया का नाम',
        'किसी प्राणी, जगह या वस्तु का नाम',
        'किसी विशेषता का नाम',
        'किसी संयोजक का नाम',
      ],
      correctIndex: 1,
      explanation: 'Noun = संज्ञा — किसी प्राणी (person), जगह (place) या वस्तु (thing) के नाम को संज्ञा कहते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Pronoun is used in place of ___.',
      questionHi: 'Pronoun (सर्वनाम) का प्रयोग ___ की जगह होता है।',
      options: ['Verb', 'Adjective', 'Noun', 'Adverb'],
      correctIndex: 2,
      explanation: 'Pronoun = सर्वनाम — Noun की जगह प्रयोग होता है। जैसे: Ram → He',
    ),
    QuizQuestion(
      questionEn: 'Which sentence uses a Verb correctly?',
      questionHi: 'कौन सा वाक्य Verb का सही प्रयोग दर्शाता है?',
      options: [
        'Ram is tall. (is = state verb)',
        'A red car.',
        'Quickly runs.',
        'Very beautiful.',
      ],
      correctIndex: 0,
      explanation: '"Is" describes the state of Subject Ram → यह Verb (क्रिया) है।',
    ),
    QuizQuestion(
      questionEn: '"Ram, Delhi, Pen" — these are examples of ___.',
      questionHi: '"Ram, Delhi, Pen" — ये किसके उदाहरण हैं?',
      options: ['Pronoun', 'Verb', 'Adjective', 'Noun'],
      correctIndex: 3,
      explanation: 'Ram (व्यक्ति), Delhi (जगह), Pen (वस्तु) — सभी Nouns (संज्ञा) हैं।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 QUIZ — Adjective, Adverb, Preposition, Conjunction, Interjection
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pos2Questions = [
    QuizQuestion(
      questionEn: 'Adjective describes ___.',
      questionHi: 'Adjective (विशेषण) किसकी विशेषता बताता है?',
      options: ['Verb की', 'Noun या Pronoun की', 'Adverb की', 'Conjunction की'],
      correctIndex: 1,
      explanation: 'Adjective = विशेषण — Noun या Pronoun की विशेषता बताता है। जैसे: "Red car" में Red एक Adjective है।',
    ),
    QuizQuestion(
      questionEn: 'Adverb can describe a Verb, an Adjective OR ___.',
      questionHi: 'Adverb, Verb या Adjective के अलावा ___ की भी विशेषता बता सकता है।',
      options: ['Noun', 'Pronoun', 'Another Adverb', 'Conjunction'],
      correctIndex: 2,
      explanation: 'Adverb = क्रिया विशेषण — यह Verb, Adjective या दूसरे Adverb की विशेषता बताता है।',
    ),
    QuizQuestion(
      questionEn: 'Preposition shows the relationship between a Noun/Pronoun and ___.',
      questionHi: 'Preposition किसी Noun/Pronoun और ___ के बीच सम्बन्ध दर्शाता है।',
      options: ['एक और Noun', 'वाक्य के दूसरे भाग', 'Verb', 'Adverb'],
      correctIndex: 1,
      explanation: 'Preposition = पूर्वसर्ग — Noun/Pronoun और वाक्य के दूसरे भाग के बीच सम्बन्ध दर्शाता है। जैसे: "on", "in", "at"।',
    ),
    QuizQuestion(
      questionEn: 'Conjunction is used to ___.',
      questionHi: 'Conjunction (संयोजक) का काम है ___।',
      options: [
        'भावनाएँ व्यक्त करना',
        'विशेषता बताना',
        'दो शब्दों या वाक्यों को जोड़ना',
        'क्रिया बताना',
      ],
      correctIndex: 2,
      explanation: 'Conjunction = संयोजक — दो शब्दों या वाक्यों को जोड़ता है बिना अर्थ बदले। जैसे: "and", "but", "or"।',
    ),
    QuizQuestion(
      questionEn: '"Wow!", "Ouch!", "Hurray!" are examples of ___.',
      questionHi: '"Wow!", "Ouch!", "Hurray!" किसके उदाहरण हैं?',
      options: ['Conjunction', 'Preposition', 'Adjective', 'Interjection'],
      correctIndex: 3,
      explanation: 'Interjection = विस्मयादिबोधक — भावनाओं की अभिव्यक्ति करने वाले शब्द।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 QUIZ — Articles & Determiners
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pos3Questions = [
    QuizQuestion(
      questionEn: 'Articles (A, An, The) are generally classified as ___.',
      questionHi: 'Articles (A, An, The) को सामान्यतः ___ माना जाता है।',
      options: ['Noun', 'Verb', 'Adjective', 'Adverb'],
      correctIndex: 2,
      explanation: 'Articles को Adjective माना जाता है क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं।',
    ),
    QuizQuestion(
      questionEn: '"A pen" — here "A" tells us ___.',
      questionHi: '"A pen" — यहाँ "A" क्या बताता है?',
      options: ['पेन का रंग', 'पेन की संख्या (एक पेन)', 'पेन का प्रकार', 'पेन की जगह'],
      correctIndex: 1,
      explanation: '"A" = एक — यह बताता है कि पेन एक है। इसीलिए Articles को Adjective कहते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Determiners (1 man, 2 pens, 50 pigeons) are also classified as ___.',
      questionHi: 'Determiners (1 आदमी, 2 पेन, 50 कबूतर) भी ___ माने जाते हैं।',
      options: ['Noun', 'Verb', 'Adjective', 'Pronoun'],
      correctIndex: 2,
      explanation: 'Determiners भी Adjective ही माने जाते हैं क्योंकि ये Noun की मात्रा के बारे में बताते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Which Part of Speech joins two sentences?',
      questionHi: 'कौन सा शब्द भेद दो वाक्यों को जोड़ता है?',
      options: ['Preposition', 'Conjunction', 'Interjection', 'Adverb'],
      correctIndex: 1,
      explanation: 'Conjunction = संयोजक — दो शब्दों या वाक्यों को जोड़ता है।',
    ),
    QuizQuestion(
      questionEn: 'Preposition shows relationship. "In", "On", "At" are ___.',
      questionHi: '"In", "On", "At" किस Part of Speech के उदाहरण हैं?',
      options: ['Conjunction', 'Adjective', 'Preposition', 'Interjection'],
      correctIndex: 2,
      explanation: '"In", "On", "At" = Prepositions (पूर्वसर्ग)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 10 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'How many Parts of Speech are there?',
      questionHi: 'Parts of Speech कितने होते हैं?',
      options: ['6', '7', '8', '9'],
      correctIndex: 2,
      explanation: '8 Parts of Speech: Noun, Pronoun, Verb, Adjective, Adverb, Preposition, Conjunction, Interjection।',
    ),
    QuizQuestion(
      questionEn: 'Noun is the name of a ___.',
      questionHi: 'Noun (संज्ञा) ___ का नाम है।',
      options: ['क्रिया', 'प्राणी / जगह / वस्तु', 'विशेषता', 'भावना'],
      correctIndex: 1,
      explanation: 'Noun = प्राणी (person), जगह (place) या वस्तु (thing) का नाम।',
    ),
    QuizQuestion(
      questionEn: 'Pronoun replaces ___.',
      questionHi: 'Pronoun ___ की जगह लेता है।',
      options: ['Verb', 'Adjective', 'Noun', 'Adverb'],
      correctIndex: 2,
      explanation: 'Pronoun = सर्वनाम — Noun की जगह प्रयोग होता है।',
    ),
    QuizQuestion(
      questionEn: 'Adjective describes Noun or ___.',
      questionHi: 'Adjective Noun या ___ की विशेषता बताता है।',
      options: ['Verb', 'Pronoun', 'Conjunction', 'Preposition'],
      correctIndex: 1,
      explanation: 'Adjective = विशेषण — Noun या Pronoun की विशेषता बताता है।',
    ),
    QuizQuestion(
      questionEn: 'Adverb can describe a Verb, Adjective, or another ___.',
      questionHi: 'Adverb, Verb, Adjective या दूसरे ___ की विशेषता बता सकता है।',
      options: ['Noun', 'Pronoun', 'Adverb', 'Conjunction'],
      correctIndex: 2,
      explanation: 'Adverb = क्रिया विशेषण — Verb, Adjective या दूसरे Adverb की विशेषता बताता है।',
    ),
    QuizQuestion(
      questionEn: '"And", "But", "Or" are examples of ___.',
      questionHi: '"And", "But", "Or" किसके उदाहरण हैं?',
      options: ['Preposition', 'Interjection', 'Conjunction', 'Adverb'],
      correctIndex: 2,
      explanation: '"And", "But", "Or" = Conjunctions (संयोजक)।',
    ),
    QuizQuestion(
      questionEn: '"Wow!" expresses emotion. It is an ___.',
      questionHi: '"Wow!" भावना व्यक्त करता है। यह ___ है।',
      options: ['Adverb', 'Conjunction', 'Preposition', 'Interjection'],
      correctIndex: 3,
      explanation: '"Wow!" = Interjection (विस्मयादिबोधक) — भावना की अभिव्यक्ति।',
    ),
    QuizQuestion(
      questionEn: 'Articles are generally considered a type of ___.',
      questionHi: 'Articles को सामान्यतः ___ का एक प्रकार माना जाता है।',
      options: ['Noun', 'Verb', 'Adjective', 'Pronoun'],
      correctIndex: 2,
      explanation: 'Articles (A, An, The) = Adjective — क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Determiners like "1 man, 3 pens" are classified as ___.',
      questionHi: '"1 आदमी, 3 पेन" जैसे Determiners ___ माने जाते हैं।',
      options: ['Noun', 'Verb', 'Adjective', 'Adverb'],
      correctIndex: 2,
      explanation: 'Determiners भी Adjective ही माने जाते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Preposition shows the relationship between a Noun/Pronoun and ___.',
      questionHi: 'Preposition Noun/Pronoun और ___ के बीच सम्बन्ध दर्शाता है।',
      options: ['एक और Noun', 'वाक्य के दूसरे भाग', 'Verb', 'Adjective'],
      correctIndex: 1,
      explanation: 'Preposition = पूर्वसर्ग — Noun/Pronoun और वाक्य के दूसरे भाग के बीच सम्बन्ध।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> partsOfSpeech = [
    {
      'number': '1',
      'nameEn': 'Noun',
      'nameHi': 'संज्ञा',
      'defHi': 'किसी भी प्राणी, जगह या वस्तु के नाम को संज्ञा कहते हैं।',
      'defEn': 'Name of a person, place or thing.',
      'emoji': '🏷️',
      'color': 'primary',
      'examples': ['Ram (व्यक्ति)', 'Delhi (जगह)', 'Pen (वस्तु)', 'Love (भावना)'],
    },
    {
      'number': '2',
      'nameEn': 'Pronoun',
      'nameHi': 'सर्वनाम',
      'defHi': 'सर्वनाम का प्रयोग संज्ञा की जगह पर किया जाता है।',
      'defEn': 'A word used in place of a noun.',
      'emoji': '👤',
      'color': 'success',
      'examples': ['I (मैं)', 'He (वह)', 'She (वह)', 'They (वे)', 'We (हम)'],
    },
    {
      'number': '3',
      'nameEn': 'Verb',
      'nameHi': 'क्रिया',
      'defHi': 'क्रिया से Subject के कार्य या अवस्था की जानकारी मिलती है।',
      'defEn': 'Describes the action or state of the subject.',
      'emoji': '⚡',
      'color': 'accent',
      'examples': ['Run (दौड़ना)', 'Is (है)', 'Think (सोचना)', 'Eat (खाना)'],
    },
    {
      'number': '4',
      'nameEn': 'Adjective',
      'nameHi': 'विशेषण',
      'defHi': 'जो किसी संज्ञा या सर्वनाम की विशेषता बताते हैं।',
      'defEn': 'Describes or modifies a noun or pronoun.',
      'emoji': '🎨',
      'color': 'warning',
      'examples': ['Red car (लाल गाड़ी)', 'Tall man (लम्बा आदमी)', 'Beautiful (सुन्दर)'],
    },
    {
      'number': '5',
      'nameEn': 'Adverb',
      'nameHi': 'क्रिया विशेषण',
      'defHi': 'जो किसी क्रिया, विशेषण या दूसरे क्रिया विशेषण की विशेषता बताते हैं।',
      'defEn': 'Modifies a verb, adjective or another adverb.',
      'emoji': '🔄',
      'color': 'primary',
      'examples': ['Quickly (जल्दी)', 'Very (बहुत)', 'Slowly (धीरे)', 'Always (हमेशा)'],
    },
    {
      'number': '6',
      'nameEn': 'Preposition',
      'nameHi': 'पूर्वसर्ग / सम्बन्ध सूचक अव्यय',
      'defHi': 'Noun/Pronoun और वाक्य के दूसरे भाग के बीच सम्बन्ध दर्शाते हैं।',
      'defEn': 'Shows relationship between noun/pronoun and another part of the sentence.',
      'emoji': '🔗',
      'color': 'success',
      'examples': ['In (में)', 'On (पर)', 'At (पर)', 'With (के साथ)', 'For (के लिए)'],
    },
    {
      'number': '7',
      'nameEn': 'Conjunction',
      'nameHi': 'संयोजक',
      'defHi': 'यह दो शब्दों या वाक्यों को जोड़ देते हैं, बिना अर्थ बदले।',
      'defEn': 'Joins two words or sentences without changing the meaning.',
      'emoji': '🔀',
      'color': 'accent',
      'examples': ['And (और)', 'But (लेकिन)', 'Or (या)', 'Because (क्योंकि)'],
    },
    {
      'number': '8',
      'nameEn': 'Interjection',
      'nameHi': 'विस्मयादिबोधक',
      'defHi': 'भावनाओं की अभिव्यक्ति करने वाले शब्द या शब्दों के समूह।',
      'defEn': 'Words or groups of words that express emotions.',
      'emoji': '😲',
      'color': 'warning',
      'examples': ['Wow! (वाह!)', 'Ouch! (आउच!)', 'Hurray! (हुर्रे!)', 'Oh no! (ओह नहीं!)'],
    },
  ];

  static const List<Map<String, String>> importantFacts = [
    {
      'title': 'Articles as Adjectives',
      'titleHi': 'Articles (A, An, The) → Adjective',
      'detail': 'Articles को सामान्यतः Adjective ही माना जाता है क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं।\n\nजैसे: "A Pen" — यहाँ "A" बताता है कि पेन एक है।\n\nGenerally, Articles are classified as adjectives because they modify nouns.',
      'emoji': '📌',
    },
    {
      'title': 'Determiners as Adjectives',
      'titleHi': 'Determiners → Adjective',
      'detail': 'जब हम Noun की मात्रा बतायें (1 आदमी, 2 पेन, 50 कबूतर) तो ये संख्याएँ Determiners कहलाती हैं और इन्हें भी Adjective ही माना जाता है।\n\nDeterminers are also classified as adjectives because they modify nouns by mentioning their quantity.',
      'emoji': '🔢',
    },
  ];
}