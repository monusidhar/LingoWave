import '../models/lesson_model.dart';

/// Chapter 11 — Adverbs (क्रिया विशेषण)
class Chapter11Data {

  static ChapterModel get chapter => ChapterModel(
        id: 11, title: 'Adverbs', titleHindi: 'क्रिया विशेषण',
        description: 'Adverbs modify Verbs, Adjectives & other Adverbs',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What is an Adverb?', titleHindi: 'क्रिया विशेषण क्या है?',
              emoji: '🔍', type: LessonType.ch11Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Degrees of Adverbs', titleHindi: 'क्रिया विशेषण की degrees',
              emoji: '📊', type: LessonType.ch11Degrees, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Adverb Examples — Part 1', titleHindi: 'उदाहरण — भाग 1',
              emoji: '📝', type: LessonType.ch11Examples1, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Adverb Examples — Part 2', titleHindi: 'उदाहरण — भाग 2',
              emoji: '📝', type: LessonType.ch11Examples2, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Adverb Examples — Part 3 + LY Rule', titleHindi: 'उदाहरण — भाग 3 + LY नियम',
              emoji: '✨', type: LessonType.ch11Examples3, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch11ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch11Intro:       return introQuestions;
      case LessonType.ch11Degrees:     return degreesQuestions;
      case LessonType.ch11Examples1:   return examples1Questions;
      case LessonType.ch11Examples2:   return examples2Questions;
      case LessonType.ch11Examples3:   return examples3Questions;
      case LessonType.ch11ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ── L1 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'What is an Adverb?', questionHi: 'Adverb (क्रिया विशेषण) किसे कहते हैं?',
      options: ['Noun की विशेषता बताने वाला शब्द', 'Verb/Adjective/Adverb की विशेषता बताने वाला शब्द', 'Subject की जगह प्रयोग होने वाला शब्द', 'Noun को modify करने वाला शब्द'],
      correctIndex: 1, explanation: 'Adverb = क्रिया विशेषण — Verb, Adjective या दूसरे Adverb की विशेषता बताता है।'),
    QuizQuestion(
      questionEn: '"Ram runs fast." — "fast" is an adverb because ___.',
      questionHi: '"Ram runs fast." — "fast" क्रिया विशेषण है क्योंकि ___.',
      options: ['Ram एक Noun है', 'यह Verb "run" को modify करता है', 'यह एक Pronoun है', 'यह Subject है'],
      correctIndex: 1, explanation: '"Fast" verb "run" की विशेषता बताता है — इसलिए यह Adverb है।'),
    QuizQuestion(
      questionEn: '"He is a very good boy." — "very" is an adverb because ___.',
      questionHi: '"He is a very good boy." — "very" क्रिया विशेषण है क्योंकि ___.',
      options: ['यह "boy" को modify करता है', 'यह Adjective "good" को modify करता है', 'यह एक Noun है', 'यह Pronoun है'],
      correctIndex: 1, explanation: '"Very" Adjective "good" की विशेषता बताता है — इसलिए "very" एक Adverb है।'),
    QuizQuestion(
      questionEn: '"Ram runs very fast." — what does "very" modify?',
      questionHi: '"Ram runs very fast." — "very" किसे modify करता है?',
      options: ['Noun "Ram" को', 'Verb "runs" को', 'Adverb "fast" को', 'Sentence को'],
      correctIndex: 2, explanation: '"Very" Adverb "fast" को modify करता है — इसलिए "very" भी एक Adverb है।'),
    QuizQuestion(
      questionEn: 'An Adverb clause is a ___ of words functioning as an adverb.',
      questionHi: 'Adverb clause शब्दों का ___ होता है जो Adverb का काम करता है।',
      options: ['एक शब्द', 'समूह (group)', 'Noun', 'Subject'],
      correctIndex: 1, explanation: '"which is good for us" जैसे शब्द-समूह Adverb clause होते हैं।'),
  ];

  // ── L2 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> degreesQuestions = [
    QuizQuestion(
      questionEn: 'Comparative degree of "Fast" (adverb) is ___.',
      questionHi: '"Fast" (adverb) की Comparative degree क्या है?',
      options: ['Fastest', 'More Fast', 'Faster', 'Most Fast'],
      correctIndex: 2, explanation: 'Fast → Faster → Fastest'),
    QuizQuestion(
      questionEn: 'Superlative of "Far" (adverb) is ___.',
      questionHi: '"Far" (adverb) की Superlative degree क्या है?',
      options: ['Farther', 'More Far', 'Farthest', 'Most Far'],
      correctIndex: 2, explanation: 'Far → Farther → Farthest'),
    QuizQuestion(
      questionEn: '"Very" and "quite" are adverbs that have ___ degrees.',
      questionHi: '"Very" और "quite" की degrees ___.',
      options: ['3 degrees होती हैं', 'कोई degree नहीं होती', '2 degrees होती हैं', 'Irregular होती हैं'],
      correctIndex: 1, explanation: '"Very", "quite" आदि adverbs की कोई degree नहीं होती।'),
    QuizQuestion(
      questionEn: 'Comparative of "Late" (adverb) is ___.',
      questionHi: '"Late" (adverb) की Comparative degree क्या है?',
      options: ['Latest', 'Last', 'Later', 'Lately'],
      correctIndex: 2, explanation: 'Late → Later → Last'),
    QuizQuestion(
      questionEn: 'Comparative of "Often" (adverb) is ___.',
      questionHi: '"Often" (adverb) की Comparative degree क्या है?',
      options: ['Oftenest', 'Oftener', 'More often', 'Most often'],
      correctIndex: 2, explanation: 'Often → More often → Most often'),
  ];

  // ── L3 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> examples1Questions = [
    QuizQuestion(
      questionEn: '"Afterwards" means ___.',
      questionHi: '"Afterwards" का अर्थ क्या है?',
      options: ['पहले', 'बाद में', 'कभी-कभी', 'दूर'],
      correctIndex: 1, explanation: '"Afterwards" = बाद में। "Soon afterwards" = तुरन्त बाद।'),
    QuizQuestion(
      questionEn: '"Again and again" means ___.',
      questionHi: '"Again and again" का अर्थ क्या है?',
      options: ['एक बार', 'दोबारा', 'बार-बार', 'कभी नहीं'],
      correctIndex: 2, explanation: '"Again and again" = बार-बार'),
    QuizQuestion(
      questionEn: '"They left one hour ago." — "ago" means ___.',
      questionHi: '"They left one hour ago." — "ago" का अर्थ?',
      options: ['बाद में', 'पहले', 'अभी', 'दूर'],
      correctIndex: 1, explanation: '"Ago" = पहले। "One hour ago" = एक घंटे पहले।'),
    QuizQuestion(
      questionEn: '"Already" means ___.',
      questionHi: '"Already" का अर्थ क्या है?',
      options: ['अभी नहीं', 'बाद में', 'पहले से ही', 'कभी-कभी'],
      correctIndex: 2, explanation: '"Already" = पहले से ही। "I have already told you." = मैं तुम्हें पहले ही बता चुका हूँ।'),
    QuizQuestion(
      questionEn: '"Enough" means ___.',
      questionHi: '"Enough" का अर्थ क्या है?',
      options: ['जल्दी', 'काफी', 'कभी नहीं', 'दूर'],
      correctIndex: 1, explanation: '"Enough" = काफी। "They are preparing enough." = वे काफी तैयारी कर रहे हैं।'),
  ];

  // ── L4 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> examples2Questions = [
    QuizQuestion(
      questionEn: '"Did you ever think about this?" — "ever" means ___.',
      questionHi: '"Did you ever think about this?" — "ever" का अर्थ?',
      options: ['कभी नहीं', 'कभी', 'अक्सर', 'बस अभी'],
      correctIndex: 1, explanation: '"Ever" = कभी (in questions)। "Never" = कभी नहीं।'),
    QuizQuestion(
      questionEn: '"Hardly/Rarely/Seldom" all mean ___.',
      questionHi: '"Hardly/Rarely/Seldom" सभी का अर्थ?',
      options: ['बहुत अक्सर', 'मुश्किल से ही / शायद ही कभी', 'हमेशा', 'बाद में'],
      correctIndex: 1, explanation: '"Hardly/Rarely/Seldom" = मुश्किल से ही / शायद ही कभी।'),
    QuizQuestion(
      questionEn: '"I am just coming." — "just" means ___.',
      questionHi: '"I am just coming." — "just" का अर्थ?',
      options: ['बाद में', 'बस अभी', 'कभी नहीं', 'दोबारा'],
      correctIndex: 1, explanation: '"Just" = बस अभी। "The bus has just left." = बस अभी-अभी निकली है।'),
    QuizQuestion(
      questionEn: '"She never cares for me." — "never" means ___.',
      questionHi: '"She never cares for me." — "never" का अर्थ?',
      options: ['कभी', 'कभी नहीं', 'अक्सर', 'बस अभी'],
      correctIndex: 1, explanation: '"Never" = कभी नहीं।'),
    QuizQuestion(
      questionEn: '"He is only going there." — "only" means ___.',
      questionHi: '"He is only going there." — "only" का अर्थ?',
      options: ['बहुत', 'दूर', 'केवल', 'जल्दी'],
      correctIndex: 2, explanation: '"Only" = केवल / इकलौता।'),
  ];

  // ── L5 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> examples3Questions = [
    QuizQuestion(
      questionEn: '"Quite" means ___.',
      questionHi: '"Quite" का अर्थ क्या है?',
      options: ['कभी नहीं', 'जल्दी', 'बहुत / काफी', 'दूर'],
      correctIndex: 2, explanation: '"Quite" = बहुत / काफी। "She was quite a daring girl."'),
    QuizQuestion(
      questionEn: '"They always work together." — "together" means ___.',
      questionHi: '"They always work together." — "together" का अर्थ?',
      options: ['जल्दी', 'साथ में', 'दूर', 'कभी नहीं'],
      correctIndex: 1, explanation: '"Together" = साथ में।'),
    QuizQuestion(
      questionEn: 'Words ending in "-ly" are mostly ___.',
      questionHi: '"-ly" से खत्म होने वाले शब्द अधिकतर ___ होते हैं।',
      options: ['Nouns', 'Verbs', 'Adjectives', 'Adverbs'],
      correctIndex: 3, explanation: 'Quickly, nicely, clearly, sincerely — "-ly" ending words are mostly Adverbs।'),
    QuizQuestion(
      questionEn: '"Ram is nice." vs "He danced nicely." — "nicely" is ___.',
      questionHi: '"Ram is nice." vs "He danced nicely." — "nicely" क्या है?',
      options: ['Noun', 'Adjective', 'Adverb', 'Verb'],
      correctIndex: 2, explanation: '"Nice" Adjective है (Ram को describe करता है), लेकिन "nicely" Adverb है (dance को describe करता है)।'),
    QuizQuestion(
      questionEn: 'To make "quick" (adjective) into an adverb, you add ___.',
      questionHi: '"Quick" (adjective) को adverb बनाने के लिए क्या जोड़ते हैं?',
      options: ['-er', '-est', '-ly', '-ing'],
      correctIndex: 2, explanation: 'Quick → Quickly। Adjective + ly = Adverb।'),
  ];

  // ── Chapter Final Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'An Adverb modifies a ___.',
      questionHi: 'Adverb किसे modify करता है?',
      options: ['सिर्फ Noun को', 'Verb / Adjective / another Adverb को', 'सिर्फ Subject को', 'सिर्फ Pronoun को'],
      correctIndex: 1, explanation: 'Adverb = Verb, Adjective, या दूसरे Adverb की विशेषता बताता है।'),
    QuizQuestion(
      questionEn: 'Comparative of "Fast" (adverb) is ___.',
      questionHi: '"Fast" (adverb) की Comparative degree ___.',
      options: ['Fastest', 'More Fast', 'Faster', 'Most Fast'],
      correctIndex: 2, explanation: 'Fast → Faster → Fastest'),
    QuizQuestion(
      questionEn: '"Ago" means ___.',
      questionHi: '"Ago" का अर्थ ___.',
      options: ['बाद में', 'पहले', 'अभी', 'दोबारा'],
      correctIndex: 1, explanation: '"Ago" = पहले। "One hour ago" = एक घंटे पहले।'),
    QuizQuestion(
      questionEn: '"Already" means ___.',
      questionHi: '"Already" का अर्थ ___.',
      options: ['अभी नहीं', 'बाद में', 'पहले से ही', 'कभी-कभी'],
      correctIndex: 2, explanation: '"Already" = पहले से ही।'),
    QuizQuestion(
      questionEn: '"Never" means ___.',
      questionHi: '"Never" का अर्थ ___.',
      options: ['कभी', 'कभी नहीं', 'अक्सर', 'बस अभी'],
      correctIndex: 1, explanation: '"Never" = कभी नहीं।'),
    QuizQuestion(
      questionEn: '"Just" means ___.',
      questionHi: '"Just" का अर्थ ___.',
      options: ['बाद में', 'बस अभी', 'कभी नहीं', 'दोबारा'],
      correctIndex: 1, explanation: '"Just" = बस अभी।'),
    QuizQuestion(
      questionEn: '"Hardly/Rarely/Seldom" mean ___.',
      questionHi: '"Hardly/Rarely/Seldom" का अर्थ ___.',
      options: ['बहुत अक्सर', 'शायद ही कभी / मुश्किल से ही', 'हमेशा', 'बाद में'],
      correctIndex: 1, explanation: 'Hardly/Rarely/Seldom = मुश्किल से ही / शायद ही कभी।'),
    QuizQuestion(
      questionEn: 'Words ending in "-ly" are mostly ___.',
      questionHi: '"-ly" से खत्म होने वाले शब्द अधिकतर ___.',
      options: ['Nouns', 'Verbs', 'Adjectives', 'Adverbs'],
      correctIndex: 3, explanation: 'Quickly, nicely, clearly — "-ly" ending = mostly Adverbs।'),
    QuizQuestion(
      questionEn: '"Very" and "quite" have ___ degrees.',
      questionHi: '"Very" और "quite" की ___ degrees होती हैं।',
      options: ['3', '2', 'कोई नहीं', 'Irregular'],
      correctIndex: 2, explanation: '"Very", "quite" जैसे adverbs की कोई degree नहीं होती।'),
    QuizQuestion(
      questionEn: '"Only" means ___.',
      questionHi: '"Only" का अर्थ ___.',
      options: ['बहुत', 'दूर', 'केवल', 'जल्दी'],
      correctIndex: 2, explanation: '"Only" = केवल / इकलौता।'),
    QuizQuestion(
      questionEn: 'Superlative of "Far" (adverb) is ___.',
      questionHi: '"Far" (adverb) की Superlative degree ___.',
      options: ['Farther', 'More Far', 'Farthest', 'Most Farthest'],
      correctIndex: 2, explanation: 'Far → Farther → Farthest'),
    QuizQuestion(
      questionEn: '"Together" means ___.',
      questionHi: '"Together" का अर्थ ___.',
      options: ['जल्दी', 'साथ में', 'दूर', 'कभी नहीं'],
      correctIndex: 1, explanation: '"Together" = साथ में।'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> introExamples = [
    {'no': '1', 'en': 'Ram runs fast.',                          'hi': 'राम तेज दौड़ता है।',                     'adverb': 'fast',               'modifies': 'run (Verb)',       'note': '"Fast" verb "run" को modify करता है।'},
    {'no': '2', 'en': 'I study till late.',                      'hi': 'मैं देर तक पढ़ता हूँ।',                 'adverb': 'till late',           'modifies': 'study (Verb)',     'note': '"Till late" verb "study" को modify करता है।'},
    {'no': '3', 'en': 'He is a very good boy.',                  'hi': 'वो बहुत अच्छा लड़का है।',              'adverb': 'very',                'modifies': 'good (Adjective)', 'note': '"Very" adjective "good" को modify करता है।'},
    {'no': '4', 'en': 'Ram runs very fast.',                     'hi': 'राम बहुत तेज़ दौड़ता है।',              'adverb': 'very',                'modifies': 'fast (Adverb)',    'note': '"Very" adverb "fast" को modify करता है।'},
    {'no': '5', 'en': 'Ram runs fast, which is good for us.',    'hi': 'राम तेज़ दौड़ता है जो हमारे लिए अच्छा है।', 'adverb': 'which is good for us', 'modifies': 'fast (Adverb clause)', 'note': '"which is good for us" एक Adverb clause है।'},
  ];

  static const List<Map<String, String>> degreesTable = [
    {'positive': 'Fast',  'positiveHi': 'तेज',         'comparative': 'Faster',      'superlative': 'Fastest'},
    {'positive': 'Slow',  'positiveHi': 'धीरे',        'comparative': 'Slower',      'superlative': 'Slowest'},
    {'positive': 'Often', 'positiveHi': 'अक्सर',        'comparative': 'More often',  'superlative': 'Most often'},
    {'positive': 'Late',  'positiveHi': 'देर से',       'comparative': 'Later',       'superlative': 'Last'},
    {'positive': 'In',    'positiveHi': 'अन्दर',        'comparative': 'Inner',       'superlative': 'Innermost'},
    {'positive': 'Up',    'positiveHi': 'ऊपर',          'comparative': 'Upper',       'superlative': 'Uppermost'},
    {'positive': 'Far',   'positiveHi': 'दूर',          'comparative': 'Farther',     'superlative': 'Farthest'},
  ];

  static const List<Map<String, dynamic>> adverbExamples1 = [
    {'word': 'Afterwards',       'hindi': 'बाद में',          'combo': 'Soon afterwards = तुरन्त बाद',
     'examples': [
       {'en': 'I will come afterwards if you are busy now.',   'hi': 'मैं बाद में आऊँगा अगर आप अभी व्यस्त हैं।'},
       {'en': 'You left at 4 pm and soon afterwards, we left.','hi': 'आप 4 बजे निकले और उसके तुरन्त बाद हम निकले।'},
     ]},
    {'word': 'Again',            'hindi': 'दोबारा',           'combo': 'Once again / Again & again',
     'examples': [
       {'en': 'That girl will go again.',                       'hi': 'वो लड़की दोबारा जायेगी।'},
       {'en': 'I will think once again.',                       'hi': 'मैं एक बार फिर सोचूँगा।'},
       {'en': 'You are doing the same mistake again and again.','hi': 'तुम बार-बार एक ही गलती कर रहे हो।'},
     ]},
    {'word': 'Ago',              'hindi': 'पहले',             'combo': 'one hour ago / two years ago',
     'examples': [
       {'en': 'They left one hour ago.',                        'hi': 'वे एक घंटे पहले निकले।'},
       {'en': 'He had come here about two years ago.',          'hi': 'वो यहाँ लगभग दो साल पहले आया था।'},
     ]},
    {'word': 'Already',          'hindi': 'पहले से ही',       'combo': '',
     'examples': [
       {'en': 'I have already told you about this.',            'hi': 'मैं तुम्हें पहले ही इस बारे में बता चुका हूँ।'},
       {'en': 'I have already listened to this song.',          'hi': 'मैं पहले से ही ये गाना सुन चुका हूँ।'},
     ]},
    {'word': 'Away',             'hindi': 'दूर',              'combo': 'Stay away from = दूर रहो',
     'examples': [
       {'en': "You can't go away from me.",                     'hi': 'तुम मुझसे दूर नहीं जा सकते।'},
       {'en': 'Stay away from that girl.',                      'hi': 'उस लड़की से दूर रहो।'},
     ]},
    {'word': 'Early',            'hindi': 'जल्दी',            'combo': 'pretty early = बहुत जल्दी',
     'examples': [
       {'en': 'I get up early in the morning.',                 'hi': 'मैं सुबह जल्दी उठता हूँ।'},
       {'en': 'He reached office pretty early.',                'hi': 'वह ऑफिस बहुत जल्दी पहुँचा।'},
     ]},
    {'word': 'Else',             'hindi': 'कुछ/कहीं/कोई और', 'combo': 'somewhere else / anything else',
     'examples': [
       {'en': 'He went somewhere else.',                        'hi': 'वह कहीं और गया।'},
       {'en': "I don't want anything else.",                    'hi': 'मैं कुछ और नहीं चाहता।'},
       {'en': "I am wearing someone else's shirt.",             'hi': 'मैंने किसी और की शर्ट पहनी है।'},
     ]},
    {'word': 'Enough',           'hindi': 'काफी',             'combo': '',
     'examples': [
       {'en': 'They are preparing enough for the exams.',       'hi': 'वे परीक्षा के लिए काफी तैयारी कर रहे हैं।'},
       {'en': 'He said enough to me.',                          'hi': 'उसने मुझे काफी कुछ कहा।'},
     ]},
  ];

  static const List<Map<String, dynamic>> adverbExamples2 = [
    {'word': 'Ever',             'hindi': 'कभी',              'combo': 'best ever = अब तक का सबसे अच्छा',
     'examples': [
       {'en': 'Did you ever think about this?',                 'hi': 'क्या तुमने कभी इस बारे में सोचा?'},
       {'en': 'Do you ever go there?',                          'hi': 'क्या तुम कभी वहाँ जाते हो?'},
       {'en': 'This is the best book that I have ever read.',   'hi': 'ये सबसे अच्छी किताब है जो मैंने कभी पढ़ी है।'},
     ]},
    {'word': 'Far',              'hindi': 'दूर / बहुत',       'combo': 'far better / far away',
     'examples': [
       {'en': 'He is far more experienced than you.',           'hi': 'उसे तुमसे बहुत ज़्यादा अनुभव है।'},
       {'en': 'He swims far better than you.',                  'hi': 'वो तुमसे बहुत अच्छा तैरता है।'},
       {'en': 'He lives far away.',                             'hi': 'वो बहुत दूर रहता है।'},
     ]},
    {'word': 'Hardly / Rarely / Seldom', 'hindi': 'मुश्किल से ही / शायद ही कभी', 'combo': 'Synonyms',
     'examples': [
       {'en': 'He hardly/rarely/seldom comes here.',            'hi': 'वो मुश्किल से ही कभी यहाँ आता है।'},
       {'en': 'I could hardly hear you.',                       'hi': 'मैं मुश्किल से ही तुम्हारी बात सुन सका।'},
       {'en': 'I hardly ate anything yesterday.',               'hi': 'मैंने कल शायद ही कुछ खाया।'},
     ]},
    {'word': 'Just',             'hindi': 'बस अभी',           'combo': 'just now = बस अभी',
     'examples': [
       {'en': 'I am just coming.',                              'hi': 'मैं बस अभी आ रहा हूँ।'},
       {'en': 'The bus has just left.',                         'hi': 'बस अभी-अभी निकली है।'},
       {'en': 'He has left just now.',                          'hi': 'वो बस अभी निकला है।'},
     ]},
    {'word': 'Never',            'hindi': 'कभी नहीं',         'combo': '',
     'examples': [
       {'en': 'I never said anything to you.',                  'hi': 'मैंने तुम्हें कभी कुछ नहीं कहा।'},
       {'en': 'I never thought to hurt you.',                   'hi': 'मैंने तुम्हें दुख पहुँचाने की कभी नहीं सोची।'},
       {'en': 'She never cares for me.',                        'hi': 'वो मेरी चिन्ता कभी नहीं करती।'},
     ]},
    {'word': 'Often',            'hindi': 'अक्सर',            'combo': 'pretty/quite/very often',
     'examples': [
       {'en': 'I visit his home pretty often.',                 'hi': 'मैं अक्सर उसके घर जाता हूँ।'},
       {'en': 'How often do you go to office?',                 'hi': 'आप अक्सर कितनी बार ऑफिस जाते हो?'},
     ]},
    {'word': 'Once',             'hindi': 'एक बार',           'combo': 'at once / once again / once more',
     'examples': [
       {'en': 'I had gone there once.',                         'hi': 'मैं एक बार वहाँ गया था।'},
       {'en': 'They all shouted at once.',                      'hi': 'वे सारे एक साथ चिल्लाए।'},
       {'en': 'You must read this book once more.',             'hi': 'तुम्हें यह किताब एक बार और पढ़नी चाहिए।'},
     ]},
    {'word': 'Only',             'hindi': 'केवल / इकलौता',    'combo': '',
     'examples': [
       {'en': 'He is only going there.',                        'hi': 'वो केवल वहाँ जा रहा है।'},
       {'en': 'They were only drinking the water.',             'hi': 'वे केवल पानी पी रहे थे।'},
     ]},
  ];

  static const List<Map<String, dynamic>> adverbExamples3 = [
    {'word': 'Quite',            'hindi': 'बहुत / काफी',      'combo': '',
     'examples': [
       {'en': 'She was quite a daring girl.',                   'hi': 'वो काफी हिम्मत वाली लड़की थी।'},
       {'en': 'Dad is doing it quite easily.',                  'hi': 'पापा इसे बहुत आराम से कर रहे हैं।'},
       {'en': 'That was quite a touching moment.',              'hi': 'वो बहुत ही दिल छूने वाला पल था।'},
     ]},
    {'word': 'So',               'hindi': 'बहुत / ऐसा',       'combo': '',
     'examples': [
       {'en': 'Why are you saying so?',                         'hi': 'तुम ऐसा क्यों कह रहे हो?'},
       {'en': 'Do you think so?',                               'hi': 'क्या तुम ऐसा सोचते हो?'},
     ]},
    {'word': 'Together',         'hindi': 'साथ में',           'combo': '',
     'examples': [
       {'en': 'They always work together.',                     'hi': 'वे हमेशा साथ काम करते हैं।'},
       {'en': 'We go to class together.',                       'hi': 'हम क्लास साथ में जाते हैं।'},
     ]},
    {'word': 'Very',             'hindi': 'बहुत',              'combo': '',
     'examples': [
       {'en': 'He runs very fast.',                             'hi': 'वो बहुत तेज दौड़ता है।'},
       {'en': 'I reached very early today.',                    'hi': 'आज मैं बहुत जल्दी पहुँचा।'},
     ]},
  ];

  static const List<Map<String, String>> lyExamples = [
    {'adjective': 'Quick',    'adverb': 'Quickly',    'exAdj': 'He is quick.',        'exAdv': 'He ran quickly.'},
    {'adjective': 'Nice',     'adverb': 'Nicely',     'exAdj': 'Ram is nice.',         'exAdv': 'He danced nicely.'},
    {'adjective': 'First',    'adverb': 'Firstly',    'exAdj': 'He is first in class.','exAdv': 'Firstly, let me explain.'},
    {'adjective': 'Clear',    'adverb': 'Clearly',    'exAdj': 'The sky is clear.',    'exAdv': 'She spoke clearly.'},
    {'adjective': 'Sincere',  'adverb': 'Sincerely',  'exAdj': 'He is sincere.',       'exAdv': 'He worked sincerely.'},
    {'adjective': 'Loud',     'adverb': 'Loudly',     'exAdj': 'His voice is loud.',   'exAdv': 'He shouted loudly.'},
    {'adjective': 'Slow',     'adverb': 'Slowly',     'exAdj': 'He is slow.',          'exAdv': 'He walked slowly.'},
    {'adjective': 'Soft',     'adverb': 'Softly',     'exAdj': 'Her voice is soft.',   'exAdv': 'She spoke softly.'},
  ];
}