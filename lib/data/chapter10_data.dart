import '../models/lesson_model.dart';

/// Chapter 10 — Verbs (क्रियाएँ)
class Chapter10Data {

  static ChapterModel get chapter => ChapterModel(
        id: 10, title: 'Verbs', titleHindi: 'क्रियाएँ',
        description: 'Main Verb, Helping Verb & 3 Forms',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What is a Verb?', titleHindi: 'क्रिया क्या है?',
              emoji: '⚡', type: LessonType.ch10Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Verb Forms — Part 1', titleHindi: 'क्रिया के 3 रूप — भाग 1',
              emoji: '📋', type: LessonType.ch10Forms1, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Verb Forms — Part 2', titleHindi: 'क्रिया के 3 रूप — भाग 2',
              emoji: '📋', type: LessonType.ch10Forms2, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Verb Forms — Part 3', titleHindi: 'क्रिया के 3 रूप — भाग 3',
              emoji: '📋', type: LessonType.ch10Forms3, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Special Verbs (Lay / Lie)', titleHindi: 'विशेष क्रियाएँ',
              emoji: '🔀', type: LessonType.ch10Special, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch10ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch10Intro:       return introQuestions;
      case LessonType.ch10Forms1:      return forms1Questions;
      case LessonType.ch10Forms2:      return forms2Questions;
      case LessonType.ch10Forms3:      return forms3Questions;
      case LessonType.ch10Special:     return specialQuestions;
      case LessonType.ch10ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ── L1 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'What is a Verb?', questionHi: 'Verb (क्रिया) किसे कहते हैं?',
      options: ['Noun की विशेषता बताने वाला शब्द', 'Subject के कार्य या अवस्था की जानकारी देने वाला शब्द', 'Noun की जगह प्रयोग होने वाला शब्द', 'दो वाक्यों को जोड़ने वाला शब्द'],
      correctIndex: 1, explanation: 'Verb = क्रिया — Subject के कार्य या अवस्था (state) की जानकारी देता है।'),
    QuizQuestion(
      questionEn: '"Ayansh is sleeping." — which is the Verb?', questionHi: '"Ayansh is sleeping." — Verb कौन सा है?',
      options: ['Ayansh', 'is sleeping', 'sleeping only', 'is only'],
      correctIndex: 1, explanation: '"is sleeping" Subject (Ayansh) के कार्य की जानकारी देता है — यह Verb है।'),
    QuizQuestion(
      questionEn: 'Is "to think" a verb?', questionHi: '"सोचना (to think)" क्या एक क्रिया है?',
      options: ['नहीं, क्योंकि हाथ-पैर नहीं चलते', 'हाँ, क्योंकि दिमाग काम करता है', 'नहीं, यह एक Adjective है', 'हाँ, लेकिन सिर्फ Helping Verb है'],
      correctIndex: 1, explanation: '"सोचना" एक Mental work है। क्रिया का मतलब सिर्फ Physical work नहीं — Mental work भी क्रिया है।'),
    QuizQuestion(
      questionEn: 'What are the two types of Verbs?', questionHi: 'Verbs कितने प्रकार की होती हैं?',
      options: ['Regular और Irregular', 'Main Verb और Helping Verb', 'Action और State', 'Simple और Complex'],
      correctIndex: 1, explanation: 'Verbs दो प्रकार की होती हैं: Main Verb (मुख्य क्रिया) और Helping Verb (सहायक क्रिया)।'),
    QuizQuestion(
      questionEn: 'Which of these is a Helping Verb?', questionHi: 'इनमें से कौन सी Helping Verb है?',
      options: ['Run', 'Dance', 'Is', 'Eat'],
      correctIndex: 2, explanation: '"Is" एक Helping Verb है। is, am, are, was, were, has, have, had, do, does, did, will — ये सभी Helping Verbs हैं।'),
  ];

  // ── L2 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> forms1Questions = [
    QuizQuestion(
      questionEn: '2nd form of "Go" is ___.',  questionHi: '"Go" की 2nd form क्या है?',
      options: ['Goed', 'Gone', 'Went', 'Goes'], correctIndex: 2,
      explanation: 'Go → Went → Gone'),
    QuizQuestion(
      questionEn: '3rd form of "Write" is ___.', questionHi: '"Write" की 3rd form क्या है?',
      options: ['Wrote', 'Writed', 'Written', 'Write'], correctIndex: 2,
      explanation: 'Write → Wrote → Written'),
    QuizQuestion(
      questionEn: '2nd form of "Eat" is ___.', questionHi: '"Eat" की 2nd form क्या है?',
      options: ['Eaten', 'Eated', 'Eat', 'Ate'], correctIndex: 3,
      explanation: 'Eat → Ate → Eaten'),
    QuizQuestion(
      questionEn: 'All 3 forms of "Read" are ___.',  questionHi: '"Read" के तीनों forms क्या हैं?',
      options: ['Read/Readed/Readed', 'Read/Read/Read', 'Read/Red/Red', 'Read/Rode/Ridden'],
      correctIndex: 1, explanation: 'Read → Read (रैड) → Read (रैड) — तीनों same spellings लेकिन 2nd-3rd में उच्चारण "रैड" होता है।'),
    QuizQuestion(
      questionEn: '2nd form of "See" is ___.', questionHi: '"See" की 2nd form क्या है?',
      options: ['Seen', 'Seed', 'Saw', 'Sawed'], correctIndex: 2,
      explanation: 'See → Saw → Seen'),
  ];

  // ── L3 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> forms2Questions = [
    QuizQuestion(
      questionEn: '2nd form of "Take" is ___.', questionHi: '"Take" की 2nd form क्या है?',
      options: ['Taked', 'Taken', 'Took', 'Takes'], correctIndex: 2,
      explanation: 'Take → Took → Taken'),
    QuizQuestion(
      questionEn: '3rd form of "Give" is ___.', questionHi: '"Give" की 3rd form क्या है?',
      options: ['Gived', 'Given', 'Gave', 'Give'], correctIndex: 1,
      explanation: 'Give → Gave → Given'),
    QuizQuestion(
      questionEn: '2nd form of "Sing" is ___.', questionHi: '"Sing" की 2nd form क्या है?',
      options: ['Sung', 'Singed', 'Sang', 'Singing'], correctIndex: 2,
      explanation: 'Sing → Sang → Sung'),
    QuizQuestion(
      questionEn: 'All 3 forms of "Cut" are ___.', questionHi: '"Cut" के तीनों forms क्या हैं?',
      options: ['Cut/Cuted/Cuted', 'Cut/Cut/Cut', 'Cut/Cutted/Cutted', 'Cut/Cuts/Cutting'],
      correctIndex: 1, explanation: 'Cut → Cut → Cut — तीनों same।'),
    QuizQuestion(
      questionEn: '3rd form of "Drive" is ___.', questionHi: '"Drive" की 3rd form क्या है?',
      options: ['Drove', 'Drived', 'Droven', 'Driven'], correctIndex: 3,
      explanation: 'Drive → Drove → Driven (ड्रिवन)'),
  ];

  // ── L4 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> forms3Questions = [
    QuizQuestion(
      questionEn: '2nd form of "Throw" is ___.', questionHi: '"Throw" की 2nd form क्या है?',
      options: ['Thrown', 'Throwed', 'Threw', 'Throw'], correctIndex: 2,
      explanation: 'Throw → Threw → Thrown'),
    QuizQuestion(
      questionEn: '3rd form of "Fly" is ___.', questionHi: '"Fly" की 3rd form क्या है?',
      options: ['Flew', 'Flyed', 'Flown', 'Fly'], correctIndex: 2,
      explanation: 'Fly → Flew → Flown'),
    QuizQuestion(
      questionEn: '2nd form of "Rise" is ___.', questionHi: '"Rise" (उगना/बढ़ना) की 2nd form क्या है?',
      options: ['Risen', 'Rised', 'Rose', 'Rises'], correctIndex: 2,
      explanation: 'Rise → Rose (रोज़) → Risen (रिज़न)'),
    QuizQuestion(
      questionEn: 'All 3 forms of "Hurt" are ___.', questionHi: '"Hurt" के तीनों forms:',
      options: ['Hurt/Hurted/Hurted', 'Hurt/Hurt/Hurt', 'Hurt/Hurt/Hurten', 'Hurt/Hert/Hurt'],
      correctIndex: 1, explanation: 'Hurt → Hurt → Hurt — तीनों same।'),
    QuizQuestion(
      questionEn: '3rd form of "Fall" is ___.', questionHi: '"Fall" की 3rd form क्या है?',
      options: ['Fell', 'Falled', 'Fallen', 'Fall'], correctIndex: 2,
      explanation: 'Fall → Fell → Fallen'),
  ];

  // ── L5 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> specialQuestions = [
    QuizQuestion(
      questionEn: '"Lay" (रखना) 2nd and 3rd forms are ___.', questionHi: '"Lay" (रखना) की 2nd और 3rd form क्या हैं?',
      options: ['Lay/Lay', 'Laid/Laid', 'Layed/Layed', 'Lie/Lain'], correctIndex: 1,
      explanation: 'Lay (रखना) → Laid (लेड) → Laid (लेड)'),
    QuizQuestion(
      questionEn: '"Lie" meaning झूठ बोलना — 2nd form is ___.', questionHi: '"Lie" (झूठ बोलना) की 2nd form क्या है?',
      options: ['Lay', 'Lain', 'Lied', 'Lied (लाइड)'], correctIndex: 3,
      explanation: 'Lie (झूठ बोलना) → Lied (लाइड) → Lied (लाइड)'),
    QuizQuestion(
      questionEn: '"Lie" meaning लेटना — 2nd form is ___.', questionHi: '"Lie" (लेटना) की 2nd form क्या है?',
      options: ['Lied', 'Lay (ले)', 'Lain', 'Laid'], correctIndex: 1,
      explanation: 'Lie (लेटना) → Lay (ले) → Lain (लेन) — "Lay" यहाँ 2nd form है, न कि अलग verb।'),
    QuizQuestion(
      questionEn: 'How many meanings does "Lie" have?', questionHi: '"Lie" के कितने अर्थ हैं?',
      options: ['1', '2', '3', '4'], correctIndex: 1,
      explanation: '"Lie" के 2 अर्थ हैं: (1) झूठ बोलना और (2) लेटना — दोनों की forms अलग हैं।'),
    QuizQuestion(
      questionEn: '"Bear" (जन्म देना) 3rd form is ___.', questionHi: '"Bear" (जन्म देना) की 3rd form क्या है?',
      options: ['Bore', 'Beared', 'Born', 'Bear'], correctIndex: 2,
      explanation: 'Bear (जन्म देना) → Bore → Born'),
  ];

  // ── Chapter Final Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Verb describes the ___ of the Subject.', questionHi: 'Verb Subject के ___ की जानकारी देता है।',
      options: ['नाम की', 'कार्य या अवस्था की', 'विशेषता की', 'सर्वनाम की'],
      correctIndex: 1, explanation: 'Verb = Subject के कार्य (action) या अवस्था (state) की जानकारी देता है।'),
    QuizQuestion(
      questionEn: 'Which is NOT a Helping Verb?', questionHi: 'इनमें से कौन सी Helping Verb नहीं है?',
      options: ['Is', 'Was', 'Run', 'Have'], correctIndex: 2,
      explanation: '"Run" एक Main Verb है। is, am, are, was, were, has, have, had, do, does, did, will — ये Helping Verbs हैं।'),
    QuizQuestion(
      questionEn: '2nd form of "Go" is ___.', questionHi: '"Go" की 2nd form ___.',
      options: ['Gone', 'Goes', 'Went', 'Goed'], correctIndex: 2,
      explanation: 'Go → Went → Gone'),
    QuizQuestion(
      questionEn: '3rd form of "Write" is ___.', questionHi: '"Write" की 3rd form ___.',
      options: ['Wrote', 'Writed', 'Writings', 'Written'], correctIndex: 3,
      explanation: 'Write → Wrote → Written'),
    QuizQuestion(
      questionEn: 'All 3 forms of "Put" are ___.', questionHi: '"Put" के तीनों forms ___.',
      options: ['Put/Putted/Putted', 'Put/Put/Put', 'Put/Puted/Puted', 'Put/Puts/Putting'],
      correctIndex: 1, explanation: 'Put → Put → Put — तीनों same।'),
    QuizQuestion(
      questionEn: '2nd form of "Take" is ___.', questionHi: '"Take" की 2nd form ___.',
      options: ['Taken', 'Taked', 'Took', 'Takes'], correctIndex: 2,
      explanation: 'Take → Took → Taken'),
    QuizQuestion(
      questionEn: '3rd form of "Sing" is ___.', questionHi: '"Sing" की 3rd form ___.',
      options: ['Sang', 'Singed', 'Singing', 'Sung'], correctIndex: 3,
      explanation: 'Sing → Sang → Sung'),
    QuizQuestion(
      questionEn: '2nd form of "Fly" is ___.', questionHi: '"Fly" की 2nd form ___.',
      options: ['Flown', 'Flyed', 'Flew', 'Flying'], correctIndex: 2,
      explanation: 'Fly → Flew → Flown'),
    QuizQuestion(
      questionEn: '"Lie" (लेटना) 2nd form is ___.', questionHi: '"Lie" (लेटना) की 2nd form ___.',
      options: ['Lied', 'Lain', 'Lay', 'Laid'], correctIndex: 2,
      explanation: 'Lie (लेटना) → Lay → Lain — Lay यहाँ 2nd form है।'),
    QuizQuestion(
      questionEn: 'All 3 forms of "Read" are ___.', questionHi: '"Read" के तीनों forms ___.',
      options: ['Read/Red/Red', 'Read/Readed/Readed', 'Read/Read/Read', 'Reed/Read/Reed'],
      correctIndex: 2, explanation: 'Read → Read (रैड) → Read (रैड) — spellings same, लेकिन 2nd-3rd का उच्चारण "रैड" है।'),
    QuizQuestion(
      questionEn: '2nd form of "Throw" is ___.', questionHi: '"Throw" की 2nd form ___.',
      options: ['Thrown', 'Throwed', 'Throw', 'Threw'], correctIndex: 3,
      explanation: 'Throw → Threw → Thrown'),
    QuizQuestion(
      questionEn: '"Lay" (रखना) 2nd form is ___.', questionHi: '"Lay" (रखना) की 2nd form ___.',
      options: ['Lie', 'Lay', 'Laid', 'Lain'], correctIndex: 2,
      explanation: 'Lay (रखना) → Laid (लेड) → Laid (लेड)'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> verbExamples = [
    {'en': 'Ayansh is sleeping.', 'hi': 'अयाँश सो रहा है।', 'verb': 'is sleeping', 'type': 'action', 'note': 'Subject कार्य कर रहा है।'},
    {'en': 'Ayansh is 8 months old.', 'hi': 'अयाँश 8 महीने का है।', 'verb': 'is', 'type': 'state', 'note': 'Present state — वर्तमान अवस्था।'},
    {'en': 'Ayansh was 8 months old.', 'hi': 'अयाँश 8 महीने का था।', 'verb': 'was', 'type': 'state', 'note': 'Past state — बीते हुए समय की अवस्था।'},
    {'en': 'Ayansh will be 8 months old.', 'hi': 'अयाँश 8 महीने का होगा।', 'verb': 'will be', 'type': 'state', 'note': 'Future state — आने वाले समय की अवस्था।'},
  ];

  static const List<Map<String, String>> helpingVerbs = [
    {'verb': 'is',   'hindi': 'है'},
    {'verb': 'am',   'hindi': 'हूँ'},
    {'verb': 'are',  'hindi': 'हैं'},
    {'verb': 'was',  'hindi': 'था / थी'},
    {'verb': 'were', 'hindi': 'थे / थीं'},
    {'verb': 'has',  'hindi': 'है (Has)'},
    {'verb': 'have', 'hindi': 'है / हैं (Have)'},
    {'verb': 'had',  'hindi': 'था / थे'},
    {'verb': 'do',   'hindi': 'करना'},
    {'verb': 'does', 'hindi': 'करता है'},
    {'verb': 'did',  'hindi': 'किया'},
    {'verb': 'will', 'hindi': 'होगा / करेगा'},
  ];

  // Part 1: verbs 1–42
  static const List<Map<String, String>> verbForms1 = [
    {'v1': 'Go',      'hindi': 'जाना',            'v2': 'Went',               'v3': 'Gone'},
    {'v1': 'Meet',    'hindi': 'मिलना',            'v2': 'Met',                'v3': 'Met'},
    {'v1': 'Come',    'hindi': 'आना',              'v2': 'Came',               'v3': 'Come'},
    {'v1': 'Leave',   'hindi': 'छोड़ना',            'v2': 'Left',               'v3': 'Left'},
    {'v1': 'Find',    'hindi': 'पाना',             'v2': 'Found',              'v3': 'Found'},
    {'v1': 'Live',    'hindi': 'रहना',             'v2': 'Lived',              'v3': 'Lived'},
    {'v1': 'Get',     'hindi': 'पाना',             'v2': 'Got',                'v3': 'Got / Gotten'},
    {'v1': 'Stay',    'hindi': 'ठहरना',            'v2': 'Stayed',             'v3': 'Stayed'},
    {'v1': 'Dance',   'hindi': 'डांस करना',        'v2': 'Danced',             'v3': 'Danced'},
    {'v1': 'Play',    'hindi': 'खेलना',            'v2': 'Played',             'v3': 'Played'},
    {'v1': 'Sit',     'hindi': 'बैठना',            'v2': 'Sat',                'v3': 'Sat'},
    {'v1': 'Tear',    'hindi': 'फाड़ना',            'v2': 'Tore',               'v3': 'Torn'},
    {'v1': 'Stand',   'hindi': 'खड़े होना',         'v2': 'Stood',              'v3': 'Stood'},
    {'v1': 'Start',   'hindi': 'शुरु करना',        'v2': 'Started',            'v3': 'Started'},
    {'v1': 'Laugh',   'hindi': 'हँसना',            'v2': 'Laughed',            'v3': 'Laughed'},
    {'v1': 'Fill',    'hindi': 'भरना',             'v2': 'Filled',             'v3': 'Filled'},
    {'v1': 'Smile',   'hindi': 'मुस्कुराना',       'v2': 'Smiled',             'v3': 'Smiled'},
    {'v1': 'Send',    'hindi': 'भेजना',            'v2': 'Sent',               'v3': 'Sent'},
    {'v1': 'Write',   'hindi': 'लिखना',            'v2': 'Wrote',              'v3': 'Written'},
    {'v1': 'Prepare', 'hindi': 'तैयार करना',       'v2': 'Prepared',           'v3': 'Prepared'},
    {'v1': 'Read',    'hindi': 'पढ़ना',             'v2': 'Read (रैड)',          'v3': 'Read (रैड)'},
    {'v1': 'Weep',    'hindi': 'रोना',             'v2': 'Wept',               'v3': 'Wept'},
    {'v1': 'Eat',     'hindi': 'खाना',             'v2': 'Ate',                'v3': 'Eaten'},
    {'v1': 'Shout',   'hindi': 'चिल्लाना',         'v2': 'Shouted',            'v3': 'Shouted'},
    {'v1': 'Drink',   'hindi': 'पीना',             'v2': 'Drank',              'v3': 'Drunk'},
    {'v1': 'Run',     'hindi': 'दौड़ना',            'v2': 'Ran',                'v3': 'Run'},
    {'v1': 'Wear',    'hindi': 'पहनना',            'v2': 'Wore',               'v3': 'Worn'},
    {'v1': 'Get up',  'hindi': 'उठना',             'v2': 'Got up',             'v3': 'Got up'},
    {'v1': 'Cost',    'hindi': 'मूल्य होना',       'v2': 'Cost',               'v3': 'Cost'},
    {'v1': 'Thank',   'hindi': 'धन्यवाद देना',     'v2': 'Thanked',            'v3': 'Thanked'},
    {'v1': 'Move',    'hindi': 'हिलना / हिलाना',   'v2': 'Moved',              'v3': 'Moved'},
    {'v1': 'Sound',   'hindi': 'सुनने में लगना',   'v2': 'Sounded',            'v3': 'Sounded'},
    {'v1': 'See',     'hindi': 'देखना',            'v2': 'Saw',                'v3': 'Seen'},
    {'v1': 'Touch',   'hindi': 'छूना',             'v2': 'Touched',            'v3': 'Touched'},
    {'v1': 'Look',    'hindi': 'देखना',            'v2': 'Looked',             'v3': 'Looked'},
    {'v1': 'Learn',   'hindi': 'सीखना',            'v2': 'Learned',            'v3': 'Learned / Learnt'},
    {'v1': 'Watch',   'hindi': 'देखना',            'v2': 'Watched',            'v3': 'Watched'},
    {'v1': 'Cook',    'hindi': 'खाना पकाना',       'v2': 'Cooked',             'v3': 'Cooked'},
    {'v1': 'Catch',   'hindi': 'पकड़ना',           'v2': 'Caught',             'v3': 'Caught'},
    {'v1': 'Teach',   'hindi': 'पढ़ाना',            'v2': 'Taught',             'v3': 'Taught'},
    {'v1': 'Hang',    'hindi': 'लटकना / लटकाना',  'v2': 'Hung',               'v3': 'Hung'},
    {'v1': 'Bring',   'hindi': 'लाना',             'v2': 'Brought',            'v3': 'Brought'},
  ];

  // Part 2: verbs 43–84
  static const List<Map<String, String>> verbForms2 = [
    {'v1': 'Comb',     'hindi': 'बाल बनाना',        'v2': 'Combed',             'v3': 'Combed'},
    {'v1': 'Take',     'hindi': 'लेना',             'v2': 'Took',               'v3': 'Taken'},
    {'v1': 'Ride',     'hindi': '2-wheeler चलाना',  'v2': 'Rode',               'v3': 'Ridden (रिडन)'},
    {'v1': 'Give',     'hindi': 'देना',             'v2': 'Gave',               'v3': 'Given'},
    {'v1': 'Drive',    'hindi': '4-wheeler चलाना',  'v2': 'Drove',              'v3': 'Driven (ड्रिवन)'},
    {'v1': 'Break',    'hindi': 'तोड़ना',            'v2': 'Broke',              'v3': 'Broken'},
    {'v1': 'Open',     'hindi': 'खोलना',            'v2': 'Opened',             'v3': 'Opened'},
    {'v1': 'Hold',     'hindi': 'पकड़ना',           'v2': 'Held',               'v3': 'Held'},
    {'v1': 'Close',    'hindi': 'बन्द करना',        'v2': 'Closed',             'v3': 'Closed'},
    {'v1': 'Shiver',   'hindi': 'काँपना',           'v2': 'Shivered',           'v3': 'Shivered'},
    {'v1': 'Sleep',    'hindi': 'सोना',             'v2': 'Slept',              'v3': 'Slept'},
    {'v1': 'Bother',   'hindi': 'परेशान करना',      'v2': 'Bothered',           'v3': 'Bothered'},
    {'v1': 'Sing',     'hindi': 'गाना',             'v2': 'Sang',               'v3': 'Sung'},
    {'v1': 'Know',     'hindi': 'जानना',            'v2': 'Knew',               'v3': 'Known'},
    {'v1': 'Cut',      'hindi': 'काटना',            'v2': 'Cut',                'v3': 'Cut'},
    {'v1': 'Think',    'hindi': 'सोचना',            'v2': 'Thought',            'v3': 'Thought'},
    {'v1': 'Put',      'hindi': 'रखना',             'v2': 'Put',                'v3': 'Put'},
    {'v1': 'Speak',    'hindi': 'बात करना',         'v2': 'Spoke',              'v3': 'Spoken'},
    {'v1': 'Walk',     'hindi': 'चलना / घूमना',     'v2': 'Walked',             'v3': 'Walked'},
    {'v1': 'Seem',     'hindi': 'लगना',             'v2': 'Seemed',             'v3': 'Seemed'},
    {'v1': 'Talk',     'hindi': 'बात करना',         'v2': 'Talked',             'v3': 'Talked'},
    {'v1': 'Feel',     'hindi': 'महसूस करना',       'v2': 'Felt',               'v3': 'Felt'},
    {'v1': 'Say',      'hindi': 'कहना',             'v2': 'Said',               'v3': 'Said'},
    {'v1': 'Work',     'hindi': 'करना',             'v2': 'Worked',             'v3': 'Worked'},
    {'v1': 'Tell',     'hindi': 'बताना',            'v2': 'Told',               'v3': 'Told'},
    {'v1': 'Want',     'hindi': 'चाहना',            'v2': 'Wanted',             'v3': 'Wanted'},
    {'v1': 'Ask',      'hindi': 'पूछना',            'v2': 'Asked',              'v3': 'Asked'},
    {'v1': 'Feed',     'hindi': 'खिलाना',           'v2': 'Fed (फैड)',           'v3': 'Fed (फैड)'},
    {'v1': 'Complain', 'hindi': 'शिकायत करना',      'v2': 'Complained',         'v3': 'Complained'},
    {'v1': 'Creep',    'hindi': 'रेंगना',           'v2': 'Crept',              'v3': 'Crept'},
    {'v1': 'Seek',     'hindi': 'ढूँढना',           'v2': 'Sought (सॉट)',        'v3': 'Sought (सॉट)'},
    {'v1': 'Dig',      'hindi': 'खोदना',            'v2': 'Dug',                'v3': 'Dug'},
    {'v1': 'Dip',      'hindi': 'डुबोना',           'v2': 'Dipped',             'v3': 'Dipped'},
    {'v1': 'Flee',     'hindi': 'भाग जाना',         'v2': 'Fled',               'v3': 'Fled'},
    {'v1': 'Bite',     'hindi': 'दाँत से काटना',    'v2': 'Bit',                'v3': 'Bitten'},
    {'v1': 'Hide',     'hindi': 'छिपना',            'v2': 'Hid (हिड)',           'v3': 'Hidden'},
    {'v1': 'Begin',    'hindi': 'शुरु करना',        'v2': 'Began (बिगैन)',       'v3': 'Begun (बिगन)'},
    {'v1': 'Dream',    'hindi': 'सपना देखना',       'v2': 'Dreamed / Dreamt',   'v3': 'Dreamed / Dreamt'},
    {'v1': 'Show',     'hindi': 'दिखाना',           'v2': 'Showed',             'v3': 'Showed'},
    {'v1': 'Hit',      'hindi': 'मारना',            'v2': 'Hit',                'v3': 'Hit'},
    {'v1': 'Beat',     'hindi': 'पीटना',            'v2': 'Beat (बीट)',          'v3': 'Beaten (बीटन)'},
    {'v1': 'Marry',    'hindi': 'शादी करना',        'v2': 'Married',            'v3': 'Married'},
  ];

  // Part 3: verbs 85–end
  static const List<Map<String, String>> verbForms3 = [
    {'v1': 'Peep',    'hindi': 'झाँकना',            'v2': 'Peeped',             'v3': 'Peeped'},
    {'v1': 'Plough',  'hindi': 'हल लगाना',          'v2': 'Ploughed',           'v3': 'Ploughed'},
    {'v1': 'Rest',    'hindi': 'आराम करना',         'v2': 'Rested',             'v3': 'Rested'},
    {'v1': 'Rise',    'hindi': 'उगना / बढ़ना',       'v2': 'Rose (रोज़)',          'v3': 'Risen (रिज़न)'},
    {'v1': 'Spit',    'hindi': 'थूकना',             'v2': 'Spat',               'v3': 'Spat'},
    {'v1': 'Hurt',    'hindi': 'चोट पहुँचाना',      'v2': 'Hurt',               'v3': 'Hurt'},
    {'v1': 'Throw',   'hindi': 'फेंकना',            'v2': 'Threw',              'v3': 'Thrown'},
    {'v1': 'Fly',     'hindi': 'उड़ना',              'v2': 'Flew',               'v3': 'Flown'},
    {'v1': 'Abuse',   'hindi': 'गाली देना',         'v2': 'Abused',             'v3': 'Abused'},
    {'v1': 'Add',     'hindi': 'जोड़ना',            'v2': 'Added',              'v3': 'Added'},
    {'v1': 'Tie',     'hindi': 'बाँधना',            'v2': 'Tied',               'v3': 'Tied'},
    {'v1': 'Weave',   'hindi': 'बुनना',             'v2': 'Wove (वोव)',          'v3': 'Woven (वुवन)'},
    {'v1': 'Bathe',   'hindi': 'नहाना',             'v2': 'Bathed (बैद्ड)',      'v3': 'Bathed (बैद्ड)'},
    {'v1': 'Bid',     'hindi': 'बोली लगाना',        'v2': 'Bade (बेड)',          'v3': 'Bidden (बिडन)'},
    {'v1': 'Wring',   'hindi': 'निचोड़ना / मरोड़ना', 'v2': 'Wrung (रंग)',         'v3': 'Wrung (रंग)'},
    {'v1': 'Fall',    'hindi': 'गिरना',             'v2': 'Fell',               'v3': 'Fallen'},
    {'v1': 'Bear',    'hindi': 'जन्म देना',         'v2': 'Bore',               'v3': 'Born'},
  ];

  // Special verbs: Lay / Lie
  static const List<Map<String, String>> specialVerbs = [
    {'v1': 'Lay',  'hindi': 'रखना',       'v2': 'Laid (लेड)',  'v3': 'Laid (लेड)',  'note': 'Transitive — object ज़रूरी'},
    {'v1': 'Lie',  'hindi': 'झूठ बोलना', 'v2': 'Lied (लाइड)', 'v3': 'Lied (लाइड)', 'note': 'Intransitive'},
    {'v1': 'Lie',  'hindi': 'लेटना',      'v2': 'Lay (ले)',    'v3': 'Lain (लेन)',  'note': 'Intransitive — Lay यहाँ 2nd form है'},
  ];
}