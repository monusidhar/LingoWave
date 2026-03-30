import '../models/lesson_model.dart';

/// Chapter 15 — Determiners (निर्धारक)
class Chapter15Data {

  static ChapterModel get chapter => ChapterModel(
        id: 15, title: 'Determiners', titleHindi: 'निर्धारक',
        description: 'Articles, Demonstratives, Possessives & Quantifiers',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What are Determiners?', titleHindi: 'Determiners क्या हैं?',
              emoji: '🔑', type: LessonType.ch15Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Demonstratives', titleHindi: 'This / That / These / Those',
              emoji: '👆', type: LessonType.ch15Demonstratives, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Possessives', titleHindi: 'His / Her / My / Our / Their...',
              emoji: '🤝', type: LessonType.ch15Possessives, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Quantifiers — Part 1', titleHindi: 'Few / Some / Any / Every / All / Each',
              emoji: '🔢', type: LessonType.ch15Quantifiers1, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Quantifiers — Part 2', titleHindi: 'Both / Enough / Half / Many / Much & more',
              emoji: '🔢', type: LessonType.ch15Quantifiers2, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch15ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch15Intro:         return introQuestions;
      case LessonType.ch15Demonstratives: return demonstrativeQuestions;
      case LessonType.ch15Possessives:   return possessiveQuestions;
      case LessonType.ch15Quantifiers1:  return quantifier1Questions;
      case LessonType.ch15Quantifiers2:  return quantifier2Questions;
      case LessonType.ch15ChapterQuiz:   return chapterFinalQuestions;
      default:                           return [];
    }
  }

  // ── L1 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(questionEn: 'What is a Determiner?',
      questionHi: 'Determiner किसे कहते हैं?',
      options: ['Verb की विशेषता बताने वाला शब्द', 'Noun से तुरंत पहले रखा जाने वाला शब्द जो Noun के बारे में सूचना दे', 'दो वाक्यों को जोड़ने वाला शब्द', 'Pronoun की जगह प्रयोग होने वाला शब्द'],
      correctIndex: 1, explanation: 'Determiner = Noun से तुरंत पहले आता है और बताता है — कौन, कितना, कैसा।'),
    QuizQuestion(questionEn: 'Determiners are also classified as ___.',
      questionHi: 'Determiners को किस Part of Speech में भी रखा जाता है?',
      options: ['Noun', 'Verb', 'Adjective', 'Adverb'],
      correctIndex: 2, explanation: 'Determiners भी Adjectives होते हैं क्योंकि ये Noun के बारे में अतिरिक्त सूचना देते हैं।'),
    QuizQuestion(questionEn: 'How many types of Determiners are there?',
      questionHi: 'Determiners कितने प्रकार के होते हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 2, explanation: '4 types: Articles, Demonstratives, Possessives, Quantifiers।'),
    QuizQuestion(questionEn: '"A boy is at the door." — "A" is a ___.',
      questionHi: '"A boy is at the door." — "A" किस प्रकार का Determiner है?',
      options: ['Demonstrative', 'Possessive', 'Article', 'Quantifier'],
      correctIndex: 2, explanation: 'A/An/The = Articles — ये भी Determiners हैं।'),
    QuizQuestion(questionEn: 'In "5 boys", "5" is a ___.',
      questionHi: '"5 boys" में "5" क्या है?',
      options: ['Article', 'Demonstrative', 'Possessive', 'Quantifier'],
      correctIndex: 3, explanation: 'Numbers (1, 2, 3...) Quantifiers होते हैं — ये संख्या की मात्रा बताते हैं।'),
  ];

  // ── L2 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> demonstrativeQuestions = [
    QuizQuestion(questionEn: '"This book is mine." — "This" is used as ___.',
      questionHi: '"This book is mine." — "This" किस तरह प्रयोग हुआ है?',
      options: ['Pronoun (सर्वनाम)', 'Determiner', 'Adjective', 'Verb'],
      correctIndex: 1, explanation: '"This" के तुरंत बाद "book" (noun) है → Demonstrative Determiner।'),
    QuizQuestion(questionEn: '"This is a book." — "This" is used as ___.',
      questionHi: '"This is a book." — "This" किस तरह प्रयोग हुआ है?',
      options: ['Determiner', 'Pronoun (सर्वनाम)', 'Article', 'Verb'],
      correctIndex: 1, explanation: '"This" के तुरंत बाद कोई noun नहीं है → Demonstrative Pronoun।'),
    QuizQuestion(questionEn: '"Those people are mad." — "Those" is used as ___.',
      questionHi: '"Those people are mad." — "Those" किस तरह है?',
      options: ['Pronoun', 'Determiner (followed by noun "people")', 'Article', 'Quantifier'],
      correctIndex: 1, explanation: '"Those" के बाद "people" (noun) है → Demonstrative Determiner।'),
    QuizQuestion(questionEn: 'Which is used for MORE THAN ONE (plural)?',
      questionHi: 'एक से ज़्यादा के लिए कौन से Demonstratives प्रयोग होते हैं?',
      options: ['This और That', 'These और Those', 'That और Those', 'This और These'],
      correctIndex: 1, explanation: 'These और Those = plural (एक से ज़्यादा)। This और That = singular (एक)।'),
    QuizQuestion(questionEn: '"These are my books." — "These" is ___.',
      questionHi: '"These are my books." — "These" क्या है?',
      options: ['Determiner (followed by noun)', 'Pronoun (not followed by noun)', 'Article', 'Possessive'],
      correctIndex: 1, explanation: '"These" के बाद सीधे noun नहीं है → Demonstrative Pronoun।'),
  ];

  // ── L3 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> possessiveQuestions = [
    QuizQuestion(questionEn: '"His friend is a teacher." — "His" is ___.',
      questionHi: '"His friend is a teacher." — "His" क्या है?',
      options: ['Article', 'Demonstrative', 'Possessive Determiner', 'Quantifier'],
      correctIndex: 2, explanation: '"His" एक Possessive Determiner है — "friend" (noun) से पहले आया है।'),
    QuizQuestion(questionEn: 'Which of these is NOT a Possessive Determiner?',
      questionHi: 'इनमें से कौन Possessive Determiner नहीं है?',
      options: ['My', 'Her', 'This', 'Their'],
      correctIndex: 2, explanation: '"This" Demonstrative है। My, Her, Their = Possessive Determiners हैं।'),
    QuizQuestion(questionEn: '"Our books are on the table." — "Our" is ___.',
      questionHi: '"Our books are on the table." — "Our" क्या है?',
      options: ['Article', 'Quantifier', 'Possessive Determiner', 'Demonstrative'],
      correctIndex: 2, explanation: '"Our" एक Possessive Determiner है।'),
    QuizQuestion(questionEn: 'Possessives are ALWAYS followed by ___.',
      questionHi: 'Possessives के बाद हमेशा क्या होता है?',
      options: ['Verb', 'Noun', 'Adjective', 'Preposition'],
      correctIndex: 1, explanation: 'Possessive Determiners (His/Her/My/Our/Their/Its/Your) के तुरंत बाद हमेशा Noun होता है।'),
    QuizQuestion(questionEn: '"Their parents were not present." — "Their" is ___.',
      questionHi: '"Their parents were not present." — "Their" क्या है?',
      options: ['Demonstrative', 'Article', 'Possessive Determiner', 'Quantifier'],
      correctIndex: 2, explanation: '"Their" Possessive Determiner है — "parents" (noun) से पहले आया।'),
  ];

  // ── L4 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> quantifier1Questions = [
    QuizQuestion(questionEn: '"Few boys" — "few" is used with ___ nouns.',
      questionHi: '"Few boys" — "few" किस तरह के nouns के साथ?',
      options: ['Uncountable (जिन्हें गिना नहीं जा सकता)', 'Countable (जिन्हें गिना जा सकता है)', 'दोनों', 'केवल Proper Nouns'],
      correctIndex: 1, explanation: '"Few" = Countable nouns के साथ — Few boys, few books, few children।'),
    QuizQuestion(questionEn: '"Little water" — "little" is used with ___ nouns.',
      questionHi: '"Little water" — "little" किस तरह के nouns के साथ?',
      options: ['Countable', 'Uncountable (जिन्हें गिना नहीं जा सकता)', 'दोनों', 'Plural'],
      correctIndex: 1, explanation: '"Less/Little" = Uncountable nouns के साथ — little water, little milk, little petrol।'),
    QuizQuestion(questionEn: '"Some" can be used with ___.',
      questionHi: '"Some" किसके साथ प्रयोग होता है?',
      options: ['सिर्फ Countable', 'सिर्फ Uncountable', 'Countable और Uncountable दोनों', 'सिर्फ Plural'],
      correctIndex: 2, explanation: '"Some" = दोनों के साथ — Some boys (countable), Some water (uncountable)। Mostly positive sentences।'),
    QuizQuestion(questionEn: '"Any" is mostly used in ___.',
      questionHi: '"Any" का प्रयोग मुख्यतः किस वाक्य में?',
      options: ['सकारात्मक (Positive) वाक्यों में', 'नकारात्मक (Negative) वाक्यों में', 'Question वाक्यों में', 'सभी'],
      correctIndex: 1, explanation: '"Any" = मुख्यतः Negative sentences में। "Some" = Positive sentences में। Both = Countable + Uncountable।'),
    QuizQuestion(questionEn: '"Each friend" vs "Every person" — difference?',
      questionHi: '"Each" और "Every" में क्या फर्क है?',
      options: ['कोई फर्क नहीं', '"Each" = प्रत्येक अलग-अलग | "Every" = हर कोई (सब मिलकर)', '"Each" plural, "Every" singular', '"Every" uncountable'],
      correctIndex: 1, explanation: '"Each" = प्रत्येक, हर एक (individually)। "Every" = हर कोई (as a group)। दोनों Countable singular के साथ।'),
  ];

  // ── L5 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> quantifier2Questions = [
    QuizQuestion(questionEn: '"Both the friends" — "both" means ___.',
      questionHi: '"Both" का अर्थ?',
      options: ['सभी', 'दोनों (exactly two)', 'कुछ', 'ज़्यादा'],
      correctIndex: 1, explanation: '"Both" = दोनों — exactly two के लिए। Both the friends, Both the books।'),
    QuizQuestion(questionEn: '"Many boys" — "many" is used with ___.',
      questionHi: '"Many" किसके साथ?',
      options: ['Uncountable nouns', 'Countable nouns', 'दोनों', 'Abstract nouns'],
      correctIndex: 1, explanation: '"Many" = Countable nouns के साथ — Many boys, Many books, Many people।'),
    QuizQuestion(questionEn: '"Much water" — "much" is used with ___.',
      questionHi: '"Much" किसके साथ?',
      options: ['Countable nouns', 'Uncountable nouns', 'दोनों', 'Plural'],
      correctIndex: 1, explanation: '"Much" = Uncountable nouns के साथ — Much water, Much milk, Much time।'),
    QuizQuestion(questionEn: '"More" can be used with ___.',
      questionHi: '"More" किसके साथ?',
      options: ['सिर्फ Countable', 'सिर्फ Uncountable', 'Countable और Uncountable दोनों', 'सिर्फ Singular'],
      correctIndex: 2, explanation: '"More" = दोनों के साथ — More boys (countable), More water (uncountable)।'),
    QuizQuestion(questionEn: '"Half the glass" — "half" means ___.',
      questionHi: '"Half" का अर्थ?',
      options: ['पूरा', 'एक चौथाई', 'आधा (1/2)', 'तीन चौथाई'],
      correctIndex: 2, explanation: '"Half" = आधा (1/2)। Quarter = एक चौथाई (1/4)। Whole/Full = पूरा।'),
  ];

  // ── Chapter Final Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: 'Determiners are also known as ___.',
      questionHi: 'Determiners को किस नाम से भी जाना जाता है?',
      options: ['Verbs', 'Nouns', 'Adjectives', 'Adverbs'],
      correctIndex: 2, explanation: 'Determiners = Adjectives — ये Noun के बारे में अतिरिक्त सूचना देते हैं।'),
    QuizQuestion(questionEn: '"This book is mine." — "This" is a ___.',
      questionHi: '"This book is mine." — "This" क्या है?',
      options: ['Demonstrative Pronoun', 'Demonstrative Determiner', 'Possessive', 'Article'],
      correctIndex: 1, explanation: '"This" के तुरंत बाद "book" (noun) है → Demonstrative Determiner।'),
    QuizQuestion(questionEn: '"This is a book." — "This" is a ___.',
      questionHi: '"This is a book." — "This" क्या है?',
      options: ['Demonstrative Determiner', 'Demonstrative Pronoun', 'Article', 'Possessive'],
      correctIndex: 1, explanation: '"This" के बाद noun नहीं है → Demonstrative Pronoun।'),
    QuizQuestion(questionEn: '"My brother will not go." — "My" is a ___.',
      questionHi: '"My brother will not go." — "My" क्या है?',
      options: ['Article', 'Demonstrative', 'Possessive Determiner', 'Quantifier'],
      correctIndex: 2, explanation: '"My" Possessive Determiner है — हमेशा noun से पहले।'),
    QuizQuestion(questionEn: '"Few boys" vs "Little water" — rule?',
      questionHi: '"Few" और "Little" में फर्क?',
      options: ['कोई फर्क नहीं', '"Few" = Countable, "Little/Less" = Uncountable', '"Few" = Uncountable, "Little" = Countable', 'दोनों Uncountable'],
      correctIndex: 1, explanation: '"Few" = Countable (boys, books) | "Little/Less" = Uncountable (water, milk)।'),
    QuizQuestion(questionEn: '"Some" is mostly used in ___.',
      questionHi: '"Some" का प्रयोग मुख्यतः किस वाक्य में?',
      options: ['Negative sentences', 'Positive sentences', 'Questions only', 'कोई नियम नहीं'],
      correctIndex: 1, explanation: '"Some" = mostly Positive sentences। "Any" = mostly Negative sentences।'),
    QuizQuestion(questionEn: '"Many" is used with ___.',
      questionHi: '"Many" किसके साथ?',
      options: ['Uncountable', 'Countable', 'दोनों', 'Abstract'],
      correctIndex: 1, explanation: '"Many" = Countable। "Much" = Uncountable। "More" = दोनों।'),
    QuizQuestion(questionEn: '"Both" is used for exactly ___ items.',
      questionHi: '"Both" कितनी चीज़ों के लिए?',
      options: ['एक', 'दो', 'तीन', 'अनेक'],
      correctIndex: 1, explanation: '"Both" = exactly दो के लिए — Both the books, Both friends।'),
    QuizQuestion(questionEn: 'Which determiners can be used with BOTH countable & uncountable nouns?',
      questionHi: 'कौन से Determiners Countable और Uncountable दोनों के साथ?',
      options: ['Few और Much', 'Some और Any और More', 'Many और Little', 'Each और Every'],
      correctIndex: 1, explanation: 'Some, Any, More = दोनों के साथ — countable और uncountable।'),
    QuizQuestion(questionEn: '"Those people are mad." — "Those" is used as ___.',
      questionHi: '"Those people are mad." — "Those" क्या है?',
      options: ['Demonstrative Pronoun', 'Demonstrative Determiner', 'Article', 'Possessive'],
      correctIndex: 1, explanation: '"Those" के बाद "people" (noun) है → Demonstrative Determiner।'),
    QuizQuestion(questionEn: '"Quarter the glass" — "quarter" means ___.',
      questionHi: '"Quarter" का अर्थ?',
      options: ['आधा', 'एक चौथाई (1/4)', 'पूरा', 'तीन चौथाई'],
      correctIndex: 1, explanation: '"Quarter" = एक चौथाई (1/4)। Half = 1/2। Full/Whole = पूरा।'),
    QuizQuestion(questionEn: '"Each friend" — "each" is used with ___.',
      questionHi: '"Each" किसके साथ?',
      options: ['Plural countable', 'Singular countable', 'Uncountable', 'All types'],
      correctIndex: 1, explanation: '"Each" = Singular countable nouns के साथ — Each friend, Each book।'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> determinerTypes = [
    {'no': '1', 'type': 'Articles', 'typeHi': 'आर्टिकल', 'words': 'A, An, The', 'emoji': '📰', 'color': 'primary'},
    {'no': '2', 'type': 'Demonstratives', 'typeHi': 'संकेतवाचक', 'words': 'This, That, These, Those', 'emoji': '👆', 'color': 'accent'},
    {'no': '3', 'type': 'Possessives', 'typeHi': 'स्वत्वबोधक', 'words': 'His, Her, My, Our, Their, Your, Its', 'emoji': '🤝', 'color': 'success'},
    {'no': '4', 'type': 'Quantifiers', 'typeHi': 'परिमाणवाचक', 'words': 'Few, Some, Any, Many, Much, Both, All...', 'emoji': '🔢', 'color': 'warning'},
  ];

  static const List<Map<String, String>> demonstratives = [
    {'word': 'This', 'pronun': 'दिस', 'hindi': 'यह, ये', 'number': 'Singular (एक)', 'emoji': '1️⃣'},
    {'word': 'That', 'pronun': 'दैट', 'hindi': 'वह, वो', 'number': 'Singular (एक)', 'emoji': '1️⃣'},
    {'word': 'These', 'pronun': 'दीज़', 'hindi': 'ये (नज़दीक)', 'number': 'Plural (एक से ज़्यादा)', 'emoji': '🔢'},
    {'word': 'Those', 'pronun': 'दोज़', 'hindi': 'वे (दूर)', 'number': 'Plural (एक से ज़्यादा)', 'emoji': '🔢'},
  ];

  static const List<Map<String, String>> demonstrativeExamples = [
    {'sentence': 'I love this.', 'hindi': 'मुझे यह पसंद है।', 'type': 'Pronoun', 'reason': 'this के बाद कोई noun नहीं'},
    {'sentence': 'This is a cute baby.', 'hindi': 'यह एक प्यारा बच्चा है।', 'type': 'Pronoun', 'reason': 'this के बाद noun नहीं (is = verb)'},
    {'sentence': 'These are my books.', 'hindi': 'ये मेरी किताबें हैं।', 'type': 'Pronoun', 'reason': 'these के बाद noun नहीं'},
    {'sentence': 'That man is my dad.', 'hindi': 'वो आदमी मेरे पापा हैं।', 'type': 'Determiner', 'reason': 'that के बाद "man" (noun)'},
    {'sentence': 'Those people are mad.', 'hindi': 'वे लोग पागल हैं।', 'type': 'Determiner', 'reason': 'those के बाद "people" (noun)'},
    {'sentence': 'This book is mine.', 'hindi': 'यह किताब मेरी है।', 'type': 'Determiner', 'reason': 'this के बाद "book" (noun)'},
  ];

  static const List<Map<String, String>> possessives = [
    {'word': 'My',    'hindi': 'मेरा/मेरी',      'example': 'My brother will not go.'},
    {'word': 'Your',  'hindi': 'तुम्हारा/आपका',  'example': 'Your book is on the table.'},
    {'word': 'His',   'hindi': 'उसका (पुरुष)',    'example': 'His friend is a teacher.'},
    {'word': 'Her',   'hindi': 'उसका (स्त्री)',   'example': 'Her mother came yesterday.'},
    {'word': 'Its',   'hindi': 'इसका (निर्जीव)',  'example': 'Its color is red.'},
    {'word': 'Our',   'hindi': 'हमारा/हमारी',     'example': 'Our books are on the table.'},
    {'word': 'Their', 'hindi': 'उनका/उनकी',       'example': 'Their parents were not present.'},
  ];

  static const List<Map<String, dynamic>> quantifiers = [
    {'no': '1',  'word': 'Few',      'hindi': 'थोड़ा / कुछ',                'use': 'Countable only',           'emoji': '🔢', 'example': 'Few boys, Few books'},
    {'no': '2',  'word': 'Less / Little', 'hindi': 'थोड़ा / कुछ',          'use': 'Uncountable only',         'emoji': '💧', 'example': 'Little water, Less petrol'},
    {'no': '3',  'word': 'Some',     'hindi': 'थोड़ा / कुछ',                'use': 'Both (Positive sentences)','emoji': '✅', 'example': 'Some boys, Some water'},
    {'no': '4',  'word': 'Any',      'hindi': 'कोई / कुछ',                  'use': 'Both (Negative sentences)','emoji': '❌', 'example': 'Any boys, Any water'},
    {'no': '5',  'word': 'Every',    'hindi': 'हर कोई',                    'use': 'Countable singular',       'emoji': '🌐', 'example': 'Every person, Every book'},
    {'no': '6',  'word': 'All',      'hindi': 'सभी / सब',                  'use': 'All types',                'emoji': '🎯', 'example': 'All the friends, All the books'},
    {'no': '7',  'word': 'Each',     'hindi': 'प्रत्येक / हर एक',          'use': 'Countable singular',       'emoji': '1️⃣', 'example': 'Each friend, Each book'},
    {'no': '8',  'word': 'Both',     'hindi': 'दोनों',                     'use': 'Exactly two',              'emoji': '👥', 'example': 'Both the friends, Both books'},
    {'no': '9',  'word': 'Enough',   'hindi': 'काफी',                      'use': 'Both types',               'emoji': '⚖️', 'example': 'Enough money, Enough people'},
    {'no': '10', 'word': 'Full',     'hindi': 'पूरा',                      'use': 'Container/object',         'emoji': '🫙', 'example': 'Full glass, Full bottle'},
    {'no': '11', 'word': 'Half',     'hindi': 'आधा (1/2)',                 'use': 'Fraction',                 'emoji': '½', 'example': 'Half the glass'},
    {'no': '12', 'word': 'Quarter',  'hindi': 'एक चौथाई (1/4)',            'use': 'Fraction',                 'emoji': '¼', 'example': 'Quarter the glass'},
    {'no': '13', 'word': 'Whole',    'hindi': 'पूरा',                      'use': 'Entire amount',            'emoji': '🌕', 'example': 'Whole world, Whole day'},
    {'no': '14', 'word': 'More',     'hindi': 'ज़्यादा',                   'use': 'Both types',               'emoji': '📈', 'example': 'More boys, More water'},
    {'no': '15', 'word': 'Less',     'hindi': 'कम',                        'use': 'Uncountable only',         'emoji': '📉', 'example': 'Less water, Less time'},
    {'no': '16', 'word': 'Many',     'hindi': 'कई',                        'use': 'Countable only',           'emoji': '👥', 'example': 'Many boys, Many books'},
    {'no': '17', 'word': 'Much',     'hindi': 'ज़्यादा',                   'use': 'Uncountable only',         'emoji': '💧', 'example': 'Much water, Much time'},
    {'no': '18', 'word': '1, 2, 3...', 'hindi': 'एक, दो, तीन...',         'use': 'Countable',                'emoji': '🔢', 'example': '2 friends, 50 people'},
  ];
}