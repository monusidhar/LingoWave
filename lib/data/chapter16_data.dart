import '../models/lesson_model.dart';

/// Chapter 16 — Simple Sentences (सरल वाक्य)
class Chapter16Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 16,
        title: 'Simple Sentences',
        titleHindi: 'सरल वाक्य',
        description: 'Is/Am/Are, Has/Have, Was/Were & Will be',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'What are Simple Sentences?',
              titleHindi: 'सरल वाक्य क्या होते हैं?',
              emoji: '📖',
              type: LessonType.ch16Intro,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 2,
              title: 'Simple Present — Is/Am/Are',
              titleHindi: 'सरल वर्तमान — है/हैं/हूँ',
              emoji: '✅',
              type: LessonType.ch16PresentIsAmAre,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 3,
              title: 'Simple Present — Has/Have',
              titleHindi: 'सरल वर्तमान — पास है',
              emoji: '🤲',
              type: LessonType.ch16PresentHasHave,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 4,
              title: 'Simple Past — Was/Were',
              titleHindi: 'सरल भूतकाल — था/थे/थी',
              emoji: '⏮️',
              type: LessonType.ch16PastWasWere,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 5,
              title: 'Simple Past — Had',
              titleHindi: 'सरल भूतकाल — पास था',
              emoji: '📦',
              type: LessonType.ch16PastHad,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 6,
              title: 'Simple Future — Will be / Will have',
              titleHindi: 'सरल भविष्य — होगा / पास होगा',
              emoji: '🔮',
              type: LessonType.ch16Future,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 7,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास — 100 वाक्य',
              emoji: '✍️',
              type: LessonType.ch16Practice,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 8,
              title: 'Singular & Plural',
              titleHindi: 'एकवचन और बहुवचन पहचान',
              emoji: '🔢',
              type: LessonType.ch16SingularPlural,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 9,
              title: 'Test Papers',
              titleHindi: 'टेस्ट पेपर',
              emoji: '📝',
              type: LessonType.ch16TestPaper,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 10,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch16ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 70),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch16Intro:           return introQuestions;
      case LessonType.ch16PresentIsAmAre:  return presentIsAmAreQuestions;
      case LessonType.ch16PresentHasHave:  return presentHasHaveQuestions;
      case LessonType.ch16PastWasWere:     return pastWasWereQuestions;
      case LessonType.ch16PastHad:         return pastHadQuestions;
      case LessonType.ch16Future:          return futureQuestions;
      case LessonType.ch16Practice:        return practiceQuizQuestions;
      case LessonType.ch16SingularPlural:  return singularPluralQuestions;
      case LessonType.ch16TestPaper:       return testPaperQuizQuestions;
      case LessonType.ch16ChapterQuiz:     return chapterFinalQuestions;
      default:                             return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — What are Simple Sentences?
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'Which of these is a Simple Sentence?',
      questionHi: 'इनमें से कौन सा Simple Sentence है?',
      options: [
        'Ram is reading the book.',
        'Ram is a good boy.',
        'She is dancing.',
        'They are playing cricket.'
      ],
      correctIndex: 1,
      explanation:
          '"Ram is a good boy." — Subject (Ram) is NOT performing any action. It only describes Ram, so it is a Simple Sentence.',
    ),
    QuizQuestion(
      questionEn: 'In Simple Sentences, the subject ___.',
      questionHi: 'Simple Sentences में Subject ___.',
      options: [
        'Always performs an action',
        'Does NOT perform any action (or there is no verb)',
        'Always uses a main verb',
        'Always uses a WH word'
      ],
      correctIndex: 1,
      explanation:
          'In Simple Sentences, either there is no verb at all, or even if there is, the subject does NOT perform the action.',
    ),
    QuizQuestion(
      questionEn: '"Book is kept on the table." — Why is this a Simple Sentence?',
      questionHi: '"किताब टेबल पर रखी हुई है।" — यह Simple Sentence क्यों है?',
      options: [
        'Because it has no subject',
        'Because the book cannot perform the action of "keeping"',
        'Because it has no helping verb',
        'Because it is very short'
      ],
      correctIndex: 1,
      explanation:
          'Book is the subject, and "keeping" is the verb. But the book cannot perform the action itself — it is just kept. So this is a Simple Sentence.',
    ),
    QuizQuestion(
      questionEn: 'Simple Sentences are of how many types?',
      questionHi: 'Simple Sentences कितने प्रकार के होते हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 1,
      explanation:
          'Simple Sentences are of 3 types: Simple Present, Simple Past, and Simple Future.',
    ),
    QuizQuestion(
      questionEn: '"Ram is reading the book." is NOT a Simple Sentence because ___.',
      questionHi: '"राम किताब पढ़ रहा है।" Simple Sentence नहीं है क्योंकि ___.',
      options: [
        'It has no subject',
        'Ram (subject) is performing the action of reading',
        'It has no helping verb',
        'It is too long'
      ],
      correctIndex: 1,
      explanation:
          'Ram is the subject, and Ram IS performing the action of reading. So this is a Tense sentence, not a Simple Sentence.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Simple Present: Is/Am/Are
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentIsAmAreQuestions = [
    QuizQuestion(
      questionEn: '"Ram is a good boy." — Which helping verb is used and why?',
      questionHi: '"राम एक अच्छा लड़का है।" — कौन सी helping verb है और क्यों?',
      options: [
        'Are — Third Person Plural',
        'Am — First Person',
        'Is — Third Person Singular',
        'Have — possession'
      ],
      correctIndex: 2,
      explanation:
          'Ram is a Third Person Singular subject, so "Is" is used.',
    ),
    QuizQuestion(
      questionEn: 'Which helping verb is used with "I"?',
      questionHi: '"I" के साथ कौन सी helping verb का प्रयोग होता है?',
      options: ['Is', 'Are', 'Am', 'Have'],
      correctIndex: 2,
      explanation:
          '"I" (First Person Singular) always takes "Am". e.g. I am good.',
    ),
    QuizQuestion(
      questionEn: '"People are mad." — Why "are"?',
      questionHi: '"लोग पागल हैं।" — "are" क्यों?',
      options: [
        'People is First Person Singular',
        'People is Third Person Plural',
        'People is Second Person',
        'People is Third Person Singular'
      ],
      correctIndex: 1,
      explanation:
          '"People" is Third Person Plural, so "Are" is used.',
    ),
    QuizQuestion(
      questionEn: 'Negative form of "Ram is a good boy."',
      questionHi: '"राम एक अच्छा लड़का है।" का Negative?',
      options: [
        'Ram not is a good boy.',
        'Ram is not a good boy.',
        'Ram are not a good boy.',
        'Is Ram not a good boy.'
      ],
      correctIndex: 1,
      explanation:
          'In Negative sentences, "not" comes after the helping verb: "Ram is not a good boy."',
    ),
    QuizQuestion(
      questionEn: 'Interrogative form of "I am good for you."',
      questionHi: '"मैं तुम्हारे लिए अच्छा हूँ।" का Interrogative?',
      options: [
        'I am good for you?',
        'Am good for you I?',
        'Am I good for you?',
        'Do I good for you?'
      ],
      correctIndex: 2,
      explanation:
          'In Interrogative sentences, the helping verb comes first: "Am I good for you?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Simple Present: Has/Have
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentHasHaveQuestions = [
    QuizQuestion(
      questionEn: '"Pooja has a book." — Why "has"?',
      questionHi: '"पूजा के पास एक किताब है।" — "has" क्यों?',
      options: [
        'Pooja is First Person',
        'Pooja is Third Person Singular',
        'Pooja is Third Person Plural',
        'Pooja is Second Person'
      ],
      correctIndex: 1,
      explanation:
          'Pooja is a Third Person Singular subject, so "Has" is used.',
    ),
    QuizQuestion(
      questionEn: '"I have two brothers." — Why "have"?',
      questionHi: '"मेरे दो भाई हैं।" — "have" क्यों?',
      options: [
        'I is Third Person Singular',
        'I is First Person Singular',
        'I is Third Person Plural',
        'I is Second Person Plural'
      ],
      correctIndex: 1,
      explanation:
          '"I" is First Person Singular. Only Third Person Singular uses "has"; all others use "have".',
    ),
    QuizQuestion(
      questionEn: 'Negative of "Ram has a book."',
      questionHi: '"राम के पास किताब है।" का Negative?',
      options: [
        'Ram not has a book.',
        'Ram hasn\'t a book.',
        'Ram doesn\'t have a book.',
        'Ram don\'t have a book.'
      ],
      correctIndex: 2,
      explanation:
          'For Third Person Singular negative with "have/has", we use "doesn\'t have": "Ram doesn\'t have a book."',
    ),
    QuizQuestion(
      questionEn: 'Interrogative of "I have two brothers."',
      questionHi: '"मेरे दो भाई हैं।" का Interrogative?',
      options: [
        'Have I two brothers?',
        'Do I have two brothers?',
        'Does I have two brothers?',
        'I do have two brothers?'
      ],
      correctIndex: 1,
      explanation:
          'For Interrogative of "have" sentences with "I", we use "Do I have...?"',
    ),
    QuizQuestion(
      questionEn: 'WH question: "मेरे कितने भाई हैं?"',
      questionHi: '"मेरे कितने भाई हैं?" — English में?',
      options: [
        'How many brothers I have?',
        'How many brothers have I?',
        'How many brothers do I have?',
        'How many brothers does I have?'
      ],
      correctIndex: 2,
      explanation:
          'WH word + Do/Does + Subject + have = "How many brothers do I have?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Simple Past: Was/Were
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastWasWereQuestions = [
    QuizQuestion(
      questionEn: '"Ram was a good boy." — Why "was"?',
      questionHi: '"राम एक अच्छा लड़का था।" — "was" क्यों?',
      options: [
        'Ram is Plural Subject',
        'Ram is Singular Subject',
        'Ram is First Person',
        'Ram is Second Person'
      ],
      correctIndex: 1,
      explanation:
          '"Was" is used with Singular subjects. Ram is Singular, so "was" is correct.',
    ),
    QuizQuestion(
      questionEn: '"All were mad." — Why "were"?',
      questionHi: '"सब पागल थे।" — "were" क्यों?',
      options: [
        'All is Singular',
        'All is First Person',
        'All is Plural',
        'All is Second Person'
      ],
      correctIndex: 2,
      explanation:
          '"Were" is used with Plural subjects. "All" is Plural, so "were" is used.',
    ),
    QuizQuestion(
      questionEn: 'Negative of "Ram was a good boy."',
      questionHi: '"राम एक अच्छा लड़का था।" का Negative?',
      options: [
        'Ram was not a good boy.',
        'Ram were not a good boy.',
        'Ram not was a good boy.',
        'Ram didn\'t was a good boy.'
      ],
      correctIndex: 0,
      explanation:
          '"Not" comes after the helping verb: "Ram was not a good boy."',
    ),
    QuizQuestion(
      questionEn: 'Interrogative of "I was your friend."',
      questionHi: '"मैं तुम्हारा दोस्त था।" का Interrogative?',
      options: [
        'I was your friend?',
        'Was I your friend?',
        'Were I your friend?',
        'Did I your friend?'
      ],
      correctIndex: 1,
      explanation:
          'In Interrogative, helping verb comes first: "Was I your friend?"',
    ),
    QuizQuestion(
      questionEn: '"तुम उस समय कहाँ थे?" — English?',
      questionHi: '"तुम उस समय कहाँ थे?"',
      options: [
        'Where you were that time?',
        'Where were you that time?',
        'Were you where that time?',
        'You were where that time?'
      ],
      correctIndex: 1,
      explanation:
          'WH word + helping verb + subject: "Where were you that time?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Simple Past: Had
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastHadQuestions = [
    QuizQuestion(
      questionEn: '"Pankaj had two brothers." — Is this correct?',
      questionHi: '"पंकज के दो भाई थे।" — क्या यह सही है?',
      options: [
        'No, should be "Pankaj have two brothers"',
        'No, should be "Pankaj has two brothers"',
        'Yes, "had" is used for all subjects in Simple Past',
        'No, should be "Pankaj was two brothers"'
      ],
      correctIndex: 2,
      explanation:
          '"Had" is used for ALL subjects (Singular & Plural) in affirmative Simple Past sentences.',
    ),
    QuizQuestion(
      questionEn: 'Negative: "राम के पास किताब नहीं थी।"',
      questionHi: '"राम के पास किताब नहीं थी।" — English?',
      options: [
        'Ram had not a book.',
        'Ram didn\'t have a book.',
        'Ram hadn\'t a book.',
        'Ram not had a book.'
      ],
      correctIndex: 1,
      explanation:
          'Negative of "had" uses "didn\'t have" for all subjects: "Ram didn\'t have a book."',
    ),
    QuizQuestion(
      questionEn: 'Interrogative: "क्या राम के पास किताब थी?"',
      questionHi: '"क्या राम के पास किताब थी?"',
      options: [
        'Had Ram a book?',
        'Ram had a book?',
        'Did Ram have a book?',
        'Does Ram have a book?'
      ],
      correctIndex: 2,
      explanation:
          'Interrogative of "had" uses "Did + Subject + have": "Did Ram have a book?"',
    ),
    QuizQuestion(
      questionEn: '"मेरे पास कुछ नहीं था।" — English?',
      questionHi: '"मेरे पास कुछ नहीं था।"',
      options: [
        'I had nothing.',
        'I have nothing.',
        'I was nothing.',
        'I didn\'t was anything.'
      ],
      correctIndex: 0,
      explanation:
          '"I had nothing." — "had" is used for all subjects in affirmative Simple Past.',
    ),
    QuizQuestion(
      questionEn: 'WH question: "राम के पास किताब क्यों नहीं थी?"',
      questionHi: '"राम के पास किताब क्यों नहीं थी?"',
      options: [
        'Why Ram not had a book?',
        'Why did Ram not have a book?',
        'Why had Ram not a book?',
        'Why does Ram not have a book?'
      ],
      correctIndex: 1,
      explanation:
          'WH + Did + Subject + not + have: "Why did Ram not have a book?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Simple Future: Will be / Will have
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> futureQuestions = [
    QuizQuestion(
      questionEn: '"Dad will be in office." — Identify the helping verb.',
      questionHi: '"पापा ऑफिस में होंगे।" — Helping verb कौन सी है?',
      options: ['Will', 'Be', 'Will be', 'Is'],
      correctIndex: 2,
      explanation:
          '"Will be" is the helping verb for Simple Future (होगा endings).',
    ),
    QuizQuestion(
      questionEn: 'Negative: "Ram will not be there." — Hindi?',
      questionHi: '"Ram will not be there." — हिंदी में?',
      options: [
        'राम वहाँ था।',
        'राम वहाँ होगा।',
        'राम वहाँ नहीं होगा।',
        'राम वहाँ नहीं था।'
      ],
      correctIndex: 2,
      explanation:
          '"Will not be" = "नहीं होगा". So "Ram will not be there." = "राम वहाँ नहीं होगा।"',
    ),
    QuizQuestion(
      questionEn: '"Dad will have a mobile." — What does this mean?',
      questionHi: '"Dad will have a mobile." — इसका मतलब?',
      options: [
        'पापा के पास मोबाइल है।',
        'पापा के पास मोबाइल था।',
        'पापा के पास मोबाइल होगा।',
        'पापा के पास मोबाइल नहीं होगा।'
      ],
      correctIndex: 2,
      explanation:
          '"Will have" = "पास होगा". "Dad will have a mobile." = "पापा के पास मोबाइल होगा।"',
    ),
    QuizQuestion(
      questionEn: '"Will someone be there?" — Hindi?',
      questionHi: '"Will someone be there?" — हिंदी में?',
      options: [
        'क्या कोई वहाँ था?',
        'क्या वहाँ कोई होगा?',
        'क्या कोई वहाँ है?',
        'कोई वहाँ नहीं होगा।'
      ],
      correctIndex: 1,
      explanation:
          '"Will + someone + be + there?" = "क्या वहाँ कोई होगा?" — Interrogative Future.',
    ),
    QuizQuestion(
      questionEn: 'Negative Interrogative: "Will that girl not have books?"',
      questionHi: '"Will that girl not have books?" — Hindi?',
      options: [
        'क्या उस लड़की के पास किताबें हैं?',
        'उस लड़की के पास किताबें नहीं होगी।',
        'क्या उस लड़की के पास किताबें नहीं होगी?',
        'क्या उस लड़की के पास किताबें थीं?'
      ],
      correctIndex: 2,
      explanation:
          '"Will + Subject + not + have" = Negative Interrogative Future = "क्या उस लड़की के पास किताबें नहीं होगी?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 10 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Which sentence is a Simple Sentence?',
      questionHi: 'कौन सा Simple Sentence है?',
      options: [
        'Ram is running fast.',
        'She is dancing in the hall.',
        'Ram is a good boy.',
        'They are playing.'
      ],
      correctIndex: 2,
      explanation:
          '"Ram is a good boy." — Subject performs no action. It is a Simple Sentence.',
    ),
    QuizQuestion(
      questionEn: 'Which helping verb is used with "I" in Simple Present?',
      questionHi: 'Simple Present में "I" के साथ कौन सी helping verb?',
      options: ['Is', 'Are', 'Am', 'Has'],
      correctIndex: 2,
      explanation: '"I" always takes "Am" in Simple Present.',
    ),
    QuizQuestion(
      questionEn: '"Pooja has a book." — Change to Negative.',
      questionHi: '"पूजा के पास किताब है।" — Negative बनाएं।',
      options: [
        'Pooja not has a book.',
        'Pooja hasn\'t a book.',
        'Pooja doesn\'t have a book.',
        'Pooja don\'t have a book.'
      ],
      correctIndex: 2,
      explanation:
          'Third Person Singular negative with possession: "Pooja doesn\'t have a book."',
    ),
    QuizQuestion(
      questionEn: 'Which helping verb is used with Singular subject in Simple Past?',
      questionHi: 'Simple Past में Singular Subject के साथ?',
      options: ['Were', 'Had', 'Was', 'Will be'],
      correctIndex: 2,
      explanation: '"Was" is used with Singular subjects in Simple Past.',
    ),
    QuizQuestion(
      questionEn: '"All were my enemies." — Why "were"?',
      questionHi: '"सभी मेरे दुश्मन थे।" — "were" क्यों?',
      options: [
        'All is Singular',
        'All is Plural',
        'All is First Person',
        'All is Second Person'
      ],
      correctIndex: 1,
      explanation: '"All" is Plural, so "were" is used in Simple Past.',
    ),
    QuizQuestion(
      questionEn: '"Pankaj didn\'t have two brothers." — Sentence type?',
      questionHi: '"Pankaj didn\'t have two brothers." — वाक्य का प्रकार?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 1,
      explanation:
          '"didn\'t have" is the negative form of "had". This is a Negative sentence.',
    ),
    QuizQuestion(
      questionEn: '"Dad will be in office." — Tense type?',
      questionHi: '"पापा ऑफिस में होंगे।" — Tense?',
      options: ['Simple Present', 'Simple Past', 'Simple Future', 'Tense Sentence'],
      correctIndex: 2,
      explanation:
          '"Will be" = Simple Future tense marker (होगा ending).',
    ),
    QuizQuestion(
      questionEn: 'Interrogative of "Ram had a book."',
      questionHi: '"राम के पास किताब थी।" का Interrogative?',
      options: [
        'Had Ram a book?',
        'Did Ram have a book?',
        'Does Ram have a book?',
        'Was Ram have a book?'
      ],
      correctIndex: 1,
      explanation:
          'Interrogative of "had": Did + Subject + have = "Did Ram have a book?"',
    ),
    QuizQuestion(
      questionEn: '"Why was I not with you?" — Sentence type?',
      questionHi: '"मैं तुम्हारे साथ क्यों नहीं था?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation:
          'Has "not" AND is a question → Negative Interrogative. WH word is added at the beginning.',
    ),
    QuizQuestion(
      questionEn: '"Will + Subject + not + have" is the pattern for ___.',
      questionHi: '"Will + Subject + not + have" का pattern किसके लिए है?',
      options: [
        'Simple Present Negative',
        'Simple Past Interrogative',
        'Simple Future Negative Interrogative',
        'Simple Past Negative'
      ],
      correctIndex: 2,
      explanation:
          '"Will + Subject + not + have" = Simple Future Negative Interrogative (क्या... पास नहीं होगा?).',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// Examples explaining what a Simple Sentence is
  static const List<Map<String, String>> introExamples = [
    {
      'sentence': 'राम एक अच्छा लड़का है।',
      'english': 'Ram is a good boy.',
      'subject': 'राम / Ram',
      'hasVerb': 'No verb',
      'explanation': 'Only described Ram. Ram is performing no action.',
    },
    {
      'sentence': 'किताब टेबल पर रखी हुई है।',
      'english': 'Book is kept on the table.',
      'subject': 'किताब / Book',
      'hasVerb': 'Verb: रखना (keep)',
      'explanation': 'Verb exists but book cannot perform the action. Still a Simple Sentence.',
    },
    {
      'sentence': 'राम किताब पढ़ रहा है।',
      'english': 'Ram is reading the book.',
      'subject': 'राम / Ram',
      'hasVerb': 'Verb: पढ़ना (read)',
      'explanation': 'Ram IS performing the action. NOT a Simple Sentence — it\'s a Tense!',
    },
  ];

  /// More examples from the table
  static const List<Map<String, String>> moreExamples = [
    {
      'hindi': 'संदीप मेरा भाई है।',
      'english': 'Sandeep is my brother.',
      'verdict': '✅ Simple',
      'reason': 'No action. Just describing Sandeep.',
    },
    {
      'hindi': 'तुम मेरे कौन हो?',
      'english': 'Who are you to me?',
      'verdict': '✅ Simple',
      'reason': 'Subject performs no action.',
    },
    {
      'hindi': 'उसके पास पेन है।',
      'english': 'He has a pen.',
      'verdict': '✅ Simple',
      'reason': 'Just describing what he has. No action.',
    },
    {
      'hindi': 'बच्चे अच्छे थे।',
      'english': 'Children were good.',
      'verdict': '✅ Simple',
      'reason': 'Just describing children. No action.',
    },
    {
      'hindi': 'राम सोया हुआ है।',
      'english': 'Ram is asleep.',
      'verdict': '✅ Simple',
      'reason': 'Verb exists (sleep) but Ram himself is just asleep — not performing it.',
    },
    {
      'hindi': 'राम किताब पढ़ रहा है।',
      'english': 'Ram is reading the book.',
      'verdict': '❌ Tense',
      'reason': 'Ram IS performing the action of reading.',
    },
  ];

  /// Simple Present Category I — Is/Am/Are rules
  static const List<Map<String, String>> isAmAreRules = [
    {
      'subject': 'Third Person Singular',
      'examples': 'Ram, Pooja, She, He, It, My father...',
      'verb': 'Is',
      'color': 'primary',
    },
    {
      'subject': 'I (First Person Singular)',
      'examples': 'I',
      'verb': 'Am',
      'color': 'success',
    },
    {
      'subject': 'All Others',
      'examples': 'We, You, They, People, All...',
      'verb': 'Are',
      'color': 'accent',
    },
  ];

  /// Simple Present Category I — sentences table
  static const List<Map<String, String>> presentIsAmAreExamples = [
    {
      'hindi': 'राम एक अच्छा लड़का है।',
      'english': 'Ram is a good boy.',
      'verb': 'is',
      'reason': 'Ram = 3rd Person Singular',
    },
    {
      'hindi': 'लोग पागल हैं।',
      'english': 'People are mad.',
      'verb': 'are',
      'reason': 'People = 3rd Person Plural',
    },
    {
      'hindi': 'हम लोग तुम्हारे साथ हैं।',
      'english': 'We people are with you.',
      'verb': 'are',
      'reason': 'We People = 1st Person Plural',
    },
    {
      'hindi': 'सभी मेरे प्रिय हैं।',
      'english': 'All are my dear.',
      'verb': 'are',
      'reason': 'All = 3rd Person Plural',
    },
    {
      'hindi': 'मैं तुम्हारे लिए अच्छा हूँ।',
      'english': 'I am good for you.',
      'verb': 'am',
      'reason': 'I = 1st Person Singular',
    },
  ];

  /// Four sentence types for Is/Am/Are
  static const List<Map<String, String>> isAmAreFourTypes = [
    {
      'type': 'Affirmative',
      'typeHi': 'सकारात्मक',
      'ex1': 'Ram is a good boy.',
      'ex1Hi': 'राम एक अच्छा लड़का है।',
      'ex2': 'I am good for you.',
      'ex2Hi': 'मैं तुम्हारे लिए अच्छा हूँ।',
      'ex3': 'People are mad.',
      'ex3Hi': 'लोग पागल हैं।',
    },
    {
      'type': 'Negative',
      'typeHi': 'नकारात्मक',
      'ex1': 'Ram is not a good boy.',
      'ex1Hi': 'राम एक अच्छा लड़का नहीं है।',
      'ex2': 'I am not good for you.',
      'ex2Hi': 'मैं तुम्हारे लिए अच्छा नहीं हूँ।',
      'ex3': 'People are not mad.',
      'ex3Hi': 'लोग पागल नहीं हैं।',
    },
    {
      'type': 'Interrogative',
      'typeHi': 'प्रश्नवाचक',
      'ex1': 'Is Ram a good boy?',
      'ex1Hi': 'क्या राम एक अच्छा लड़का है?',
      'ex2': 'Am I good for you?',
      'ex2Hi': 'क्या मैं तुम्हारे लिए अच्छा हूँ?',
      'ex3': 'Are People mad?',
      'ex3Hi': 'क्या लोग पागल हैं?',
    },
    {
      'type': 'Negative Interrogative',
      'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': 'Is Ram not a good boy?',
      'ex1Hi': 'क्या राम एक अच्छा लड़का नहीं है?',
      'ex2': 'Am I not good for you?',
      'ex2Hi': 'क्या मैं तुम्हारे लिए अच्छा नहीं हूँ?',
      'ex3': 'Are People not mad?',
      'ex3Hi': 'क्या लोग पागल नहीं हैं?',
    },
  ];

  /// WH sentences for Is/Am/Are
  static const List<Map<String, String>> isAmAreWhExamples = [
    {
      'hindi': 'मैं तुम्हारे लिए अच्छा क्यों हूँ?',
      'english': 'Why am I good for you?',
    },
    {
      'hindi': 'लोग ऐसे क्यों हैं?',
      'english': 'Why are people so?',
    },
    {
      'hindi': 'बच्चे किसके साथ हैं?',
      'english': 'With whom are children?',
    },
  ];

  /// Has/Have rules
  static const List<Map<String, String>> hasHaveRules = [
    {
      'subject': 'Third Person Singular',
      'examples': 'Pooja, Ram, He, She, It, My father...',
      'verb': 'Has',
      'color': 'primary',
    },
    {
      'subject': 'All Other Subjects',
      'examples': 'I, We, You, They, All...',
      'verb': 'Have',
      'color': 'success',
    },
  ];

  /// Has/Have examples
  static const List<Map<String, String>> presentHasHaveExamples = [
    {
      'hindi': 'पूजा के पास एक किताब है।',
      'english': 'Pooja has a book.',
      'verb': 'has',
      'reason': 'Pooja = 3rd Person Singular',
    },
    {
      'hindi': 'मेरे दो भाई हैं।',
      'english': 'I have two brothers.',
      'verb': 'have',
      'reason': 'I = 1st Person Singular',
    },
    {
      'hindi': 'कुल्दीप का एक भाई है।',
      'english': 'Kuldeep has one brother.',
      'verb': 'has',
      'reason': 'Kuldeep = 3rd Person Singular',
    },
    {
      'hindi': 'मेरी सास के दो भाई हैं।',
      'english': 'My mother-in-law has two brothers.',
      'verb': 'has',
      'reason': 'My mother-in-law = 3rd Person Singular',
    },
    {
      'hindi': 'मेरे पापा के 5 भाई हैं।',
      'english': 'My father has five brothers.',
      'verb': 'has',
      'reason': 'My father = 3rd Person Singular',
    },
  ];

  /// Four sentence types for Has/Have
  static const List<Map<String, String>> hasHaveFourTypes = [
    {
      'type': 'Affirmative',
      'typeHi': 'सकारात्मक',
      'ex1': 'Ram has a book.',
      'ex1Hi': 'राम के पास किताब है।',
      'ex2': 'I have two brothers.',
      'ex2Hi': 'मेरे दो भाई हैं।',
    },
    {
      'type': 'Negative',
      'typeHi': 'नकारात्मक',
      'ex1': 'Ram doesn\'t have a book.',
      'ex1Hi': 'राम के पास किताब नहीं है।',
      'ex2': 'I don\'t have two brothers.',
      'ex2Hi': 'मेरे दो भाई नहीं हैं।',
    },
    {
      'type': 'Interrogative',
      'typeHi': 'प्रश्नवाचक',
      'ex1': 'Does Ram have a book?',
      'ex1Hi': 'क्या राम के पास किताब है?',
      'ex2': 'Do I have two brothers?',
      'ex2Hi': 'क्या मेरे दो भाई हैं?',
    },
    {
      'type': 'Negative Interrogative',
      'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': 'Does Ram not have a book?',
      'ex1Hi': 'क्या राम के पास किताब नहीं है?',
      'ex2': 'Do I not have two brothers?',
      'ex2Hi': 'क्या मेरे दो भाई नहीं हैं?',
    },
  ];

  /// Was/Were rules
  static const List<Map<String, String>> wasWereRules = [
    {
      'subject': 'Singular Subject',
      'examples': 'Ram, I, She, He, It, Aman...',
      'verb': 'Was',
      'color': 'primary',
    },
    {
      'subject': 'Plural Subject',
      'examples': 'All, They, We, People, Children...',
      'verb': 'Were',
      'color': 'accent',
    },
  ];

  /// Was/Were examples
  static const List<Map<String, String>> pastWasWereExamples = [
    {
      'hindi': 'राम एक अच्छा लड़का था।',
      'english': 'Ram was a good boy.',
      'verb': 'was',
      'reason': 'Ram = Singular Subject',
    },
    {
      'hindi': 'सब पागल थे।',
      'english': 'All were mad.',
      'verb': 'were',
      'reason': 'All = Plural Subject',
    },
    {
      'hindi': 'मैं हमेशा तुम्हारे साथ था।',
      'english': 'I was always with you.',
      'verb': 'was',
      'reason': 'I = Singular Subject',
    },
    {
      'hindi': 'सभी मेरे दुश्मन थे।',
      'english': 'All were my enemies.',
      'verb': 'were',
      'reason': 'All = Plural Subject',
    },
  ];

  /// Four sentence types for Was/Were
  static const List<Map<String, String>> wasWereFourTypes = [
    {
      'type': 'Affirmative',
      'typeHi': 'सकारात्मक',
      'ex1': 'Ram was a good boy.',
      'ex1Hi': 'राम एक अच्छा लड़का था।',
      'ex2': 'I was your friend.',
      'ex2Hi': 'मैं तुम्हारा दोस्त था।',
    },
    {
      'type': 'Negative',
      'typeHi': 'नकारात्मक',
      'ex1': 'Ram was not a good boy.',
      'ex1Hi': 'राम एक अच्छा लड़का नहीं था।',
      'ex2': 'I was not your friend.',
      'ex2Hi': 'मैं तुम्हारा दोस्त नहीं था।',
    },
    {
      'type': 'Interrogative',
      'typeHi': 'प्रश्नवाचक',
      'ex1': 'Was Ram a good boy?',
      'ex1Hi': 'क्या राम एक अच्छा लड़का था?',
      'ex2': 'Was I your friend?',
      'ex2Hi': 'क्या मैं तुम्हारा दोस्त था?',
    },
    {
      'type': 'Negative Interrogative',
      'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': 'Was Ram not a good boy?',
      'ex1Hi': 'क्या राम एक अच्छा लड़का नहीं था?',
      'ex2': 'Was I not your friend?',
      'ex2Hi': 'क्या मैं तुम्हारा दोस्त नहीं था?',
    },
  ];

  /// WH sentences for Was/Were
  static const List<Map<String, String>> wasWereWhExamples = [
    {
      'hindi': 'मैं तुम्हारे साथ क्यों नहीं था?',
      'english': 'Why was I not with you?',
    },
    {
      'hindi': 'लोग वहाँ कब से थे?',
      'english': 'From when were people there?',
    },
    {
      'hindi': 'राम घर पर क्यों नहीं था?',
      'english': 'Why was Ram not at home?',
    },
    {
      'hindi': 'तुम उस समय कहाँ थे?',
      'english': 'Where were you that time?',
    },
  ];

  /// Had examples
  static const List<Map<String, String>> pastHadExamples = [
    {
      'hindi': 'पुष्कर अंकल के पास एक किताब थी।',
      'english': 'Pushkar uncle had a book.',
      'type': 'Affirmative',
    },
    {
      'hindi': 'पंकज के दो भाई नहीं थे।',
      'english': 'Pankaj didn\'t have two brothers.',
      'type': 'Negative',
    },
    {
      'hindi': 'मेरे पास कुछ नहीं था।',
      'english': 'I had nothing.',
      'type': 'Affirmative',
    },
    {
      'hindi': 'सभी लोगों के पास लैपटॉप नहीं थे।',
      'english': 'All the people didn\'t have laptops.',
      'type': 'Negative',
    },
  ];

  /// Four sentence types for Had
  static const List<Map<String, String>> hadFourTypes = [
    {
      'type': 'Affirmative',
      'typeHi': 'सकारात्मक',
      'ex1': 'Ram had a book.',
      'ex1Hi': 'राम के पास एक किताब थी।',
      'ex2': 'I had two brothers.',
      'ex2Hi': 'मेरे दो भाई थे।',
    },
    {
      'type': 'Negative',
      'typeHi': 'नकारात्मक',
      'ex1': 'Ram didn\'t have a book.',
      'ex1Hi': 'राम के पास किताब नहीं थी।',
      'ex2': 'I didn\'t have two brothers.',
      'ex2Hi': 'मेरे दो भाई नहीं थे।',
    },
    {
      'type': 'Interrogative',
      'typeHi': 'प्रश्नवाचक',
      'ex1': 'Did Ram have a book?',
      'ex1Hi': 'क्या राम के पास किताब थी?',
      'ex2': 'Did I have two brothers?',
      'ex2Hi': 'क्या मेरे दो भाई थे?',
    },
    {
      'type': 'Negative Interrogative',
      'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': 'Did Ram not have a book?',
      'ex1Hi': 'क्या राम के पास किताब नहीं थी?',
      'ex2': 'Did I not have two brothers?',
      'ex2Hi': 'क्या मेरे दो भाई नहीं थे?',
    },
  ];

  /// Future — Will be / Will have examples
  static const List<Map<String, String>> futureExamples = [
    {
      'hindi': 'पापा ऑफिस में होंगे।',
      'english': 'Dad will be in office.',
      'verb': 'will be',
      'type': 'Affirmative',
    },
    {
      'hindi': 'राम वहाँ नहीं होगा।',
      'english': 'Ram will not be there.',
      'verb': 'will not be',
      'type': 'Negative',
    },
    {
      'hindi': 'क्या वहाँ कोई होगा?',
      'english': 'Will someone be there?',
      'verb': 'will be',
      'type': 'Interrogative',
    },
    {
      'hindi': 'वो सब मम्मी के साथ होंगे।',
      'english': 'They all will be with mom.',
      'verb': 'will be',
      'type': 'Affirmative',
    },
    {
      'hindi': 'पापा के पास मोबाइल होगा।',
      'english': 'Dad will have a mobile.',
      'verb': 'will have',
      'type': 'Affirmative',
    },
    {
      'hindi': 'राम के पास कुत्ता नहीं होगा।',
      'english': 'Ram will not have a dog.',
      'verb': 'will not have',
      'type': 'Negative',
    },
    {
      'hindi': 'क्या उसके पास कुछ होगा?',
      'english': 'Will he have something?',
      'verb': 'will have',
      'type': 'Interrogative',
    },
    {
      'hindi': 'क्या उस लड़की के पास किताबें नहीं होगी?',
      'english': 'Will that girl not have books?',
      'verb': 'will not have',
      'type': 'Negative Interrogative',
    },
  ];

  /// The 3 tense overview
  static const List<Map<String, String>> tenseSummary = [
    {
      'tense': 'Simple Present',
      'tenseHi': 'सरल वर्तमान',
      'ending': 'है / हैं / हो / हूँ',
      'catI': 'Is / Am / Are',
      'catII': 'Has / Have',
      'emoji': '🟢',
    },
    {
      'tense': 'Simple Past',
      'tenseHi': 'सरल भूतकाल',
      'ending': 'था / थे / थी',
      'catI': 'Was / Were',
      'catII': 'Had',
      'emoji': '🔵',
    },
    {
      'tense': 'Simple Future',
      'tenseHi': 'सरल भविष्य',
      'ending': 'होगा / होगी / होंगे',
      'catI': 'Will be',
      'catII': 'Will have',
      'emoji': '🟡',
    },
  ];

  /// Key rules note
  static const List<String> keyRules = [
    'Negative Interrogative वाक्यों में "Not" हमेशा Subject के बाद आता है।',
    'अगर "क्या" वाक्य के शुरू या अंत में आये तो Helping Verb पहले लगेगी।',
    'अगर "क्या" वाक्य के बीच में आये तो "What" का प्रयोग होगा।',
    'WH family (How, Why, When, Where) Interrogative वाक्य के शुरू में लगती है, उसके बाद Helping Verb।',
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE EXERCISE — 100 sentences (Hindi → English)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'क्या राम अच्छा है?', 'english': 'Is Ram good?'},
    {'hindi': 'बच्चे किसके साथ हैं?', 'english': 'With whom are children?'},
    {'hindi': 'तुम अच्छे हो।', 'english': 'You are good.'},
    {'hindi': 'पापा राहुल के साथ थे।', 'english': 'Papa was with Rahul.'},
    {'hindi': 'बच्चा मेरे आगे था।', 'english': 'Child was ahead of me.'},
    {'hindi': 'ये उसका दोस्त नहीं है।', 'english': 'This/He is not his friend.'},
    {'hindi': 'ये लड़का कहाँ पर था?', 'english': 'Where was this boy?'},
    {'hindi': 'मैं राम की वजह से यहाँ हूँ।', 'english': 'I am here because of Ram.'},
    {'hindi': 'उसके पास पेन था।', 'english': 'He had a pen.'},
    {'hindi': 'तुम्हारे पास क्या है?', 'english': 'What do you have?'},
    {'hindi': 'मम्मी के पास पैसे नहीं हैं।', 'english': "Mom doesn't have money."},
    {'hindi': 'राहुल किसका भाई है?', 'english': 'Whose brother is Rahul?'},
    {'hindi': 'ये आदमी किस लड़की का पापा है?', 'english': "Which girl's father is this man?"},
    {'hindi': 'वो घर किसका है?', 'english': 'Whose is that house?'},
    {'hindi': 'मैं तुमसे लम्बा हूँ।', 'english': 'I am taller than you.'},
    {'hindi': 'तुम किस शहर से हो?', 'english': 'From which city are you?'},
    {'hindi': 'तुम किस शहर में हो?', 'english': 'In which city are you?'},
    {'hindi': 'क्या तुम्हारे पास है?', 'english': 'Do you have?'},
    {'hindi': 'क्या तुम्हारे पास मोबाइल है?', 'english': 'Do you have a mobile?'},
    {'hindi': 'मैं कौन हूँ?', 'english': 'Who am I?'},
    {'hindi': 'क्या है वो?', 'english': 'What is that?'},
    {'hindi': 'मेरे पीछे कौन खड़ा था?', 'english': 'Who was standing behind me?'},
    {'hindi': 'मैं क्लास में बैठा हूँ।', 'english': 'I am sitting in the class.'},
    {'hindi': 'उसके भाई कितने बड़े हैं?', 'english': 'How old are his brothers?'},
    {'hindi': 'तुम मेरे सबसे छोटे भाई हो।', 'english': 'You are my youngest brother.'},
    {'hindi': 'ये मेरा प्यार है तुम्हारे लिए।', 'english': 'This is my love for you.'},
    {'hindi': 'क्या है उसका नाम?', 'english': 'What is his name?'},
    {'hindi': 'ये कहानी किसी और की है।', 'english': "This story is someone else's."},
    {'hindi': 'वो थकी हुई थी।', 'english': 'She was tired.'},
    {'hindi': 'राम सोया हुआ है।', 'english': 'Ram is asleep.'},
    {'hindi': 'हम बैठे हुए थे।', 'english': 'We were sitting.'},
    {'hindi': 'तुम खड़े क्यों हो?', 'english': 'Why are you standing?'},
    {'hindi': 'उस टेबल पर क्या है?', 'english': 'What is there on that table?'},
    {'hindi': 'तुम दिल्ली के आस पास हो।', 'english': 'You are near about Delhi.'},
    {'hindi': 'मैं इस फोटो में नहीं हूँ।', 'english': 'I am not in this photograph.'},
    {'hindi': 'वो कब से ऑफिस में है?', 'english': 'Since when is he in the office?'},
    {'hindi': 'तुम कब तक ऑफिस में थे?', 'english': 'Until when were you in the office?'},
    {'hindi': 'मेरे पैर में क्या है?', 'english': 'What is there in my leg?'},
    {'hindi': 'उसके पास कुछ नहीं है।', 'english': "He doesn't have anything."},
    {'hindi': 'मेरे पास कुछ फटे हुए कपड़े हैं।', 'english': 'I have some torn clothes.'},
    {'hindi': 'राम पेड़ के पीछे छिपा हुआ था।', 'english': 'Ram was hidden behind the tree.'},
    {'hindi': 'ये बच्चे मेरे हैं।', 'english': 'These children are mine.'},
    {'hindi': 'ये तुम्हारा नहीं है।', 'english': 'This is not yours.'},
    {'hindi': 'ये मेरी बिल्ली है।', 'english': 'This is my cat.'},
    {'hindi': 'ये बिल्ली मेरी है।', 'english': 'This cat is mine.'},
    {'hindi': 'ये राम की किताब है।', 'english': "This is Ram's book."},
    {'hindi': 'ये किताब राम की है।', 'english': "This book is Ram's."},
    {'hindi': 'हम तुम्हारे हैं।', 'english': 'We are yours.'},
    {'hindi': 'मैं हर पल तुम्हारे साथ था।', 'english': 'I was there with you at every moment.'},
    {'hindi': 'गाड़ी में कितना पेट्रोल है?', 'english': 'How much petrol is there in the car?'},
    {'hindi': 'तुम्हारे पास कितना पैसा है?', 'english': 'How much money do you have?'},
    {'hindi': 'किस शहर में हो तुम इस वक्त?', 'english': 'In which city are you at this time?'},
    {'hindi': 'मैं जिन्दा हूँ सिर्फ तुम्हारे लिए।', 'english': 'I am alive only for you.'},
    {'hindi': 'राम कहीं खोया हुआ था।', 'english': 'Ram was lost somewhere.'},
    {'hindi': 'मैं तुम्हारे सपनों में खोया हुआ हूँ।', 'english': 'I am lost in your dreams.'},
    {'hindi': 'मोबाइल टेबल पर रखा हुआ है।', 'english': 'Mobile is kept on the table.'},
    {'hindi': 'मैं डरा हुआ था।', 'english': 'I was scared.'},
    {'hindi': 'कितने बच्चे इस समय यहाँ हैं?', 'english': 'How many children are here at this time?'},
    {'hindi': 'राम 2 बजे जगा हुआ था।', 'english': 'Ram was awake at 2.'},
    {'hindi': 'उसके पापा पिये हुए थे।', 'english': 'His father was drunk.'},
    {'hindi': 'तुम मेरे करीबी दोस्त हो।', 'english': 'You are my close friend.'},
    {'hindi': 'ये लिखा हुआ था।', 'english': 'It was written.'},
    {'hindi': 'ये गीता में लिखा हुआ है।', 'english': 'It is written in Geeta.'},
    {'hindi': 'भिखारी के कपड़े फटे हुए थे।', 'english': "Beggar's clothes were torn."},
    {'hindi': 'क्या तुम्हारे पास कुछ था?', 'english': 'Did you have something?'},
    {'hindi': 'हमारे पास कुछ है।', 'english': 'We have something.'},
    {'hindi': 'मैं किसके लिए वहाँ था?', 'english': 'For whom was I there?'},
    {'hindi': 'वो तुम्हारे लिए रुका हुआ है।', 'english': 'He is stopped for you.'},
    {'hindi': 'तुम घर के अन्दर थे।', 'english': 'You were inside the home.'},
    {'hindi': 'राम मेरे बगल में खड़ा है।', 'english': 'Ram is standing beside me.'},
    {'hindi': 'शिव की पूजा यहाँ प्रसिद्ध है।', 'english': 'Worship of Lord Shiva is famous here.'},
    {'hindi': 'हमारी ख्वाहिशें इतनी क्यों हैं?', 'english': 'Why are our desires these many?'},
    {'hindi': 'तुम ऐसे क्यों हो?', 'english': 'Why are you so?'},
    {'hindi': 'पैसे किसके पास हैं?', 'english': 'Who has money?'},
    {'hindi': 'क्या तुम्हारे पास दिमाग नहीं है?', 'english': 'Do you not have mind/brain?'},
    {'hindi': 'ये टूटा हुआ दिल मेरा है।', 'english': 'This broken heart is mine.'},
    {'hindi': 'उसके कितने लड़के हैं?', 'english': 'How many sons does he have?'},
    {'hindi': 'आप मुझसे ज्यादा बुरे हैं।', 'english': 'You are worse than me.'},
    {'hindi': 'क्या राम मुझसे ज्यादा अच्छा है?', 'english': 'Is Ram better than me?'},
    {'hindi': 'मुझे तुमसे प्यार है।', 'english': 'I am in love with you.'},
    {'hindi': 'इतने सारे पैसे तुम्हारे पास कैसे हैं?', 'english': 'How do you have this much money?'},
    {'hindi': 'रिश्ते खूबसूरत होते हैं।', 'english': 'Relations are beautiful.'},
    {'hindi': 'ये कोई और है।', 'english': 'This is someone else.'},
    {'hindi': 'ये कुछ और है।', 'english': 'This is something else.'},
    {'hindi': 'तुम्हारा पेन कौन सा वाला है?', 'english': 'Which one is your pen?'},
    {'hindi': 'पेन किसका है?', 'english': 'Whose is the pen?'},
    {'hindi': 'तुम्हारे पीछे कौन है?', 'english': 'Who is behind you?'},
    {'hindi': 'पैसे किसके पास नहीं हैं?', 'english': "Who doesn't have money?"},
    {'hindi': 'तुम किस बात के लिए दुखी हो?', 'english': 'For what are you unhappy?'},
    {'hindi': 'राम कब तक इस जगह में था?', 'english': 'Until when was Ram in this place?'},
    {'hindi': 'मैं तुम्हारे सामने खड़ा था।', 'english': 'I was standing in front of you.'},
    {'hindi': 'मैं ठीक तुम्हारे सामने खड़ा था।', 'english': 'I was standing just in front of you.'},
    {'hindi': 'किस लड़की के पापा वहाँ खड़े थे?', 'english': "Which girl's father was standing there?"},
    {'hindi': 'मैं गिटार के लिए पागल हूँ।', 'english': 'I am crazy for guitar.'},
    {'hindi': 'वहाँ कितने लोग हैं?', 'english': 'How many people are there?'},
    {'hindi': 'पेन कहाँ रखा हुआ है?', 'english': 'Where is the pen kept?'},
    {'hindi': 'समय क्या हुआ है?', 'english': 'What is the time?'},
    {'hindi': 'तुम दोनों सबसे अच्छे हो।', 'english': 'You both are the best.'},
    {'hindi': 'हम सब तुम्हारे साथ हैं।', 'english': 'We all are with you.'},
    {'hindi': 'मैं तुम्हारा कौन हूँ?', 'english': 'Who am I to you?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE QUIZ — 5 questions picked from practice exercise
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionEn: '"तुम अच्छे हो।" — English?',
      questionHi: '"तुम अच्छे हो।"',
      options: ['You is good.', 'You are good.', 'You am good.', 'You were good.'],
      correctIndex: 1,
      explanation: '"You" always takes "Are". So: You are good.',
    ),
    QuizQuestion(
      questionEn: '"मम्मी के पास पैसे नहीं हैं।" — English?',
      questionHi: '"मम्मी के पास पैसे नहीं हैं।"',
      options: [
        "Mom don't have money.",
        "Mom hasn't money.",
        "Mom doesn't have money.",
        "Mom not have money."
      ],
      correctIndex: 2,
      explanation: 'Mom = 3rd Person Singular → doesn\'t have. "Mom doesn\'t have money."',
    ),
    QuizQuestion(
      questionEn: '"राम पेड़ के पीछे छिपा हुआ था।" — English?',
      questionHi: '"राम पेड़ के पीछे छिपा हुआ था।"',
      options: [
        'Ram is hidden behind the tree.',
        'Ram was hidden behind the tree.',
        'Ram were hidden behind the tree.',
        'Ram had hidden behind the tree.'
      ],
      correctIndex: 1,
      explanation: 'Past tense + Singular → was. "Ram was hidden behind the tree."',
    ),
    QuizQuestion(
      questionEn: '"मैं तुम्हारे सपनों में खोया हुआ हूँ।" — Helping verb?',
      questionHi: '"मैं तुम्हारे सपनों में खोया हुआ हूँ।"',
      options: ['Was', 'Are', 'Am', 'Is'],
      correctIndex: 2,
      explanation: '"I" always takes "Am" in Simple Present. Answer: I am lost in your dreams.',
    ),
    QuizQuestion(
      questionEn: '"तुम दोनों सबसे अच्छे हो।" — English?',
      questionHi: '"तुम दोनों सबसे अच्छे हो।"',
      options: [
        'You both is the best.',
        'You both am the best.',
        'You both are the best.',
        'Both of you was the best.'
      ],
      correctIndex: 2,
      explanation: '"You" always takes "Are". "You both are the best."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // SINGULAR / PLURAL IDENTIFICATION DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// These are Singular (एकवचन)
  static const List<String> singularWords = [
    'Ram', 'She', 'I', 'That', 'This', 'It', 'He', 'Man', 'Blood',
    'Woman', 'Sky', 'Child', 'Book', 'Table',
  ];

  /// These are Plural (बहुवचन)
  static const List<String> pluralWords = [
    'Ram & Shyam', 'People', 'We', 'You', 'These', 'Those',
    'They', 'Children', 'Books', 'All',
  ];

  /// Tricky words with explanation
  static const List<Map<String, String>> trickyWords = [
    {
      'word': 'You',
      'type': 'Plural (Always)',
      'reason': '"You" को हमेशा Plural माना जाता है, चाहे एक व्यक्ति हो या कई।',
      'helpingVerb': 'Are / Were / Have / Do',
    },
    {
      'word': 'People',
      'type': 'Plural',
      'reason': '"People" एक Plural noun है। इसके साथ Are/Were/Have का प्रयोग होता है।',
      'helpingVerb': 'Are / Were / Have',
    },
    {
      'word': 'All',
      'type': 'Plural',
      'reason': '"All" जब लोगों के लिए प्रयोग हो तो Plural माना जाता है।',
      'helpingVerb': 'Are / Were / Have',
    },
    {
      'word': 'I',
      'type': 'Singular (Special)',
      'reason': '"I" एक Singular subject है पर इसके साथ "Am/Was/Have/Do" का प्रयोग होता है।',
      'helpingVerb': 'Am / Was / Have / Do',
    },
    {
      'word': 'Ram & Shyam',
      'type': 'Plural',
      'reason': 'दो लोगों को "and" से जोड़ने पर वो Plural बन जाता है।',
      'helpingVerb': 'Are / Were / Have',
    },
    {
      'word': 'Blood / Sky',
      'type': 'Singular',
      'reason': 'Uncountable nouns जैसे Blood, Sky, Water को Singular माना जाता है।',
      'helpingVerb': 'Is / Was / Has',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // SINGULAR/PLURAL QUIZ — 5 questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> singularPluralQuestions = [
    QuizQuestion(
      questionEn: 'Which of these is Singular?',
      questionHi: 'इनमें से कौन Singular है?',
      options: ['People', 'We', 'Blood', 'Those'],
      correctIndex: 2,
      explanation: 'Blood is an uncountable noun — it is Singular. People, We, Those are Plural.',
    ),
    QuizQuestion(
      questionEn: '"You" is always treated as ___.',
      questionHi: '"You" को हमेशा ___ माना जाता है।',
      options: ['Singular', 'Plural', 'First Person', 'Third Person'],
      correctIndex: 1,
      explanation:
          '"You" is always treated as Plural in English — even for one person. So we use Are/Were/Have/Do with You.',
    ),
    QuizQuestion(
      questionEn: '"Ram & Shyam" is ___.',
      questionHi: '"राम और श्याम" — Singular या Plural?',
      options: ['Singular', 'Plural', 'Neither', 'Both'],
      correctIndex: 1,
      explanation:
          'When two people/things are joined with "and", the subject becomes Plural → Are/Were.',
    ),
    QuizQuestion(
      questionEn: 'Which set contains ONLY Singulars?',
      questionHi: 'कौन सा set सिर्फ Singulars है?',
      options: [
        'Ram, People, She',
        'I, That, This, It, He',
        'We, You, Those',
        'They, All, These'
      ],
      correctIndex: 1,
      explanation: 'I, That, This, It, He — all are Singular subjects.',
    ),
    QuizQuestion(
      questionEn: 'Which set contains ONLY Plurals?',
      questionHi: 'कौन सा set सिर्फ Plurals है?',
      options: [
        'I, We, You',
        'He, She, They',
        'Ram & Shyam, People, We, These, Those',
        'This, That, They'
      ],
      correctIndex: 2,
      explanation:
          'Ram & Shyam, People, We, These, Those — all are Plural subjects.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER SENTENCES — Test I Q1 (20 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testI_Q1 = [
    {'hindi': 'मैं तुम्हारा सबसे बड़ा भाई हूँ।', 'english': 'I am your eldest brother.'},
    {'hindi': 'क्या तुम मेरे दोस्त नहीं हो?', 'english': 'Are you not my friend?'},
    {'hindi': 'राम मेरे साथ हमेशा था।', 'english': 'Ram was always with me.'},
    {'hindi': 'क्या तुम्हारे दस भाई नहीं हैं?', 'english': 'Do you not have 10 brothers?'},
    {'hindi': 'राकेश के कई दोस्त हैं।', 'english': 'Rakesh has many friends.'},
    {'hindi': 'मेरे पास 4 मोबाईल नहीं थे।', 'english': "I didn't have 4 mobiles."},
    {'hindi': 'वे लोग हमारे साथ हैं।', 'english': 'They people are with us.'},
    {'hindi': 'हम सब तुम्हारे भाई के पास ही हैं।', 'english': "We all are with your brother only."},
    {'hindi': 'मैं अपने पापा का सबसे बड़ा लड़का हूँ।', 'english': 'I am the eldest son of my father.'},
    {'hindi': 'सभी लोगों के पास किताबें नहीं हैं।', 'english': "All the people don't have books."},
    {'hindi': 'वो आदमी एक अच्छा इन्सान नहीं है।', 'english': 'That man is not a good person.'},
    {'hindi': 'क्या राम के पास पेन नहीं है?', 'english': 'Does Ram not have a pen?'},
    {'hindi': 'तुम्हारे पास दिमाग क्यों नहीं है?', 'english': 'Why do you not have mind/brain?'},
    {'hindi': 'सभी मेरे प्रिय हैं।', 'english': 'All are my dear.'},
    {'hindi': 'मैं तुम्हारे लिए अच्छा क्यों नहीं हूँ?', 'english': 'Why am I not good for you?'},
    {'hindi': 'तुम हर किसी के लिए अच्छे थे।', 'english': 'You were good for all.'},
    {'hindi': 'क्या तुम्हारे दो भाई हैं?', 'english': 'Do you have two brothers?'},
    {'hindi': 'क्या हमारे पास पैसे थे?', 'english': 'Did we have money?'},
    {'hindi': 'वो बच्चा उनका सबसे छोटा लड़का है।', 'english': 'That boy is their youngest son.'},
    {'hindi': 'मेरे पापा डाक्टर हैं।', 'english': 'My father is a doctor.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER II — Q1 (30 sentences Hindi→English)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testII_Q1 = [
    {'hindi': 'क्या तुम कोई और हो?', 'english': 'Are you someone else?'},
    {'hindi': 'मैं किसी का भी दोस्त नहीं हूँ।', 'english': "I am not anybody's friend."},
    {'hindi': 'तुम्हारे कितने भाई हैं?', 'english': 'How many brothers do you have?'},
    {'hindi': 'उसके सोचने का तरीका मुझसे थोड़ा अलग है।', 'english': 'His way of thinking is a bit different than mine.'},
    {'hindi': 'राम सबसे बुरा इन्सान है।', 'english': 'Ram is the worst person.'},
    {'hindi': 'वे लोग ऐसे क्यों हैं?', 'english': 'Why are they people so?'},
    {'hindi': 'हमारी वजह से उसके पास आज कुछ भी नहीं है।', 'english': 'He has nothing today because of us.'},
    {'hindi': 'क्या तुम सबसे बड़े भाई हो?', 'english': 'Are you the eldest brother?'},
    {'hindi': 'मेरी हथेली पर कुछ रखा हुआ था, क्या था वो?', 'english': 'There was something on my palm, what was that?'},
    {'hindi': 'क्या पैसे नहीं थे उसके पास?', 'english': 'Did he not have money?'},
    {'hindi': 'जहाँ कहीं भी तुम हो, खुश रहो।', 'english': 'Wherever you are, be happy.'},
    {'hindi': 'जिन्दगी कोई मजाक है क्या?', 'english': 'Is life a joke?'},
    {'hindi': 'मेरे पास सबसे कम पानी है।', 'english': 'I have the least water.'},
    {'hindi': 'कोई मि. राम बाहर खड़े हैं।', 'english': 'A/Some Mr. Ram is standing outside.'},
    {'hindi': 'कोई राहुल क्लास में बैठा हुआ है।', 'english': 'A/Some Rahul is sitting in the class.'},
    {'hindi': 'उसके कपड़े फटे हुए थे शायद।', 'english': 'Perhaps his clothes were torn.'},
    {'hindi': 'क्या तुम्हारे पास कुछ है?', 'english': 'Do you have something?'},
    {'hindi': 'रानी उनकी सबसे छोटी बेटी है।', 'english': 'Rani is their youngest daughter.'},
    {'hindi': 'जानवर प्यार के भूखे होते हैं।', 'english': 'Animals are hungry for love.'},
    {'hindi': 'मेरे चलने का तरीका कैसा है?', 'english': 'How is my way of walking?'},
    {'hindi': 'किस बच्चे के पास मेरा पेन है?', 'english': 'Which kid has my pen?'},
    {'hindi': 'वहाँ कितने बच्चे बैठे हैं?', 'english': 'How many children are sitting there?'},
    {'hindi': 'जो कोई भी यहाँ है, मेरा दोस्त है।', 'english': 'Whoever is here, is my friend.'},
    {'hindi': 'जो कोई भी वहाँ है, मेरा दुश्मन है।', 'english': 'Whoever is there, is my enemy.'},
    {'hindi': 'मेरे बगल में सिर्फ दो बच्चे थे।', 'english': 'There were only two children beside me.'},
    {'hindi': 'उसके खाने का तरीका ठीक नहीं है।', 'english': 'His way of eating is not good.'},
    {'hindi': 'नाश्ते में आज क्या है?', 'english': 'What is there in breakfast today?'},
    {'hindi': 'मेरे दिल में क्या है?', 'english': 'What is there in my heart?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER II — Q2 (English→Hindi)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testII_Q2 = [
    {'english': 'Why are your friends not here?', 'hindi': 'तुम्हारे दोस्त यहाँ क्यों नहीं हैं?'},
    {'english': 'For what are you here?', 'hindi': 'तुम यहाँ किसलिए हो?'},
    {'english': 'Which one is mine?', 'hindi': 'कौन सा वाला मेरा है?'},
    {'english': 'Mine are three brothers.', 'hindi': 'मेरे तीन भाई हैं।'},
    {'english': 'His is this book.', 'hindi': 'उसकी है ये किताब।'},
    {'english': 'They were better than me.', 'hindi': 'वे मुझसे बेहतर थे।'},
    {'english': 'Am I no one to you?', 'hindi': 'क्या मैं तुम्हारा कोई नहीं हूँ?'},
    {'english': 'Seeta is a friend of mine.', 'hindi': 'सीता मेरी दोस्त है।'},
    {'english': 'How much petrol do you have at this moment?', 'hindi': 'तुम्हारे पास इस वक्त कितना पेट्रोल है?'},
    {'english': 'I am your better than the best friend.', 'hindi': 'मैं तुम्हारा सबसे अच्छे से भी अच्छा दोस्त हूँ।'},
    {'english': "Relation of a mom with her child is unique.", 'hindi': 'अपने बच्चे के साथ एक माँ का रिश्ता अनोखा होता है।'},
    {'english': 'Nothing is impossible in this world.', 'hindi': 'इस दुनिया में कुछ भी असम्भव नहीं है।'},
    {'english': "Government's endeavor is praiseworthy.", 'hindi': 'सरकार का प्रयास प्रशंसा योग्य है।'},
    {'english': 'Are you trustworthy?', 'hindi': 'क्या तुम भरोसे के लायक हो?'},
    {'english': 'Such people are not trustworthy.', 'hindi': 'ऐसे लोग भरोसे लायक नहीं होते।'},
    {'english': 'Life is beautiful for those, who are happy.', 'hindi': 'जिन्दगी उन लोगों के लिए खूबसूरत होती है, जो खुश हैं।'},
    {'english': "I don't have any friend in this locality.", 'hindi': 'इस जगह मेरा कोई दोस्त नहीं है।'},
    {'english': 'Glasses are half empty.', 'hindi': 'गिलास आधे खाली हैं।'},
    {'english': 'Dictionary is good source of words.', 'hindi': 'डिक्शनरी शब्दों का अच्छा स्रोत है।'},
    {'english': "Today's life is very hectic.", 'hindi': 'आजकल की जिन्दगी बहुत व्यस्त है।'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER III — Q1 (44 sentences English→Hindi)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testIII_Q1 = [
    {'english': 'Am I your friend?', 'hindi': 'क्या मैं तुम्हारा दोस्त हूँ?'},
    {'english': 'Who is this boy?', 'hindi': 'ये लड़का कौन है?'},
    {'english': 'Whose book is that?', 'hindi': 'वो किसकी किताब है?'},
    {'english': 'They are my friends.', 'hindi': 'वे मेरे दोस्त हैं।'},
    {'english': 'Until when were you in office?', 'hindi': 'तुम कब तक ऑफिस में थे?'},
    {'english': 'A book is lying on the bed.', 'hindi': 'एक किताब बिस्तर पर पड़ी हुई है।'},
    {'english': 'These are not pencils.', 'hindi': 'ये पेन्सिलें नहीं हैं।'},
    {'english': 'Who has money?', 'hindi': 'पैसे किसके पास हैं?'},
    {'english': 'Since when are you at home?', 'hindi': 'तुम घर पर कब से हो?'},
    {'english': "He is someone else's father.", 'hindi': 'वो किसी और के पापा हैं।'},
    {'english': 'You are no one to me.', 'hindi': 'तुम मेरे कोई नहीं हो।'},
    {'english': 'Those boys were not with me.', 'hindi': 'वो लड़के मेरे साथ नहीं थे।'},
    {'english': "I didn't have a pen.", 'hindi': 'मेरे पास पेन नहीं था।'},
    {'english': "Who didn't have pen?", 'hindi': 'किसके पास पेन नहीं था?'},
    {'english': 'He is with someone else.', 'hindi': 'वे किसी और के साथ हैं।'},
    {'english': 'Are chairs of white color?', 'hindi': 'क्या कुर्सियाँ सफेद रंग की हैं?'},
    {'english': 'Are they your relatives?', 'hindi': 'क्या वे आपके संबंधी हैं?'},
    {'english': 'This is a sweet dog.', 'hindi': 'यह एक प्यारा कुत्ता है।'},
    {'english': 'That is a mobile phone.', 'hindi': 'वो मोबाइल फोन है।'},
    {'english': 'I have two children.', 'hindi': 'मेरे दो बच्चे हैं।'},
    {'english': 'What is he to you?', 'hindi': 'वो तुम्हारा क्या है?'},
    {'english': 'His heart is broken.', 'hindi': 'उसका दिल टूटा हुआ है।'},
    {'english': 'His behavior was pretty awkward there.', 'hindi': 'उसका व्यवहार वहाँ बहुत अजीब था।'},
    {'english': "Her father's name is Mr. R K Sharma.", 'hindi': 'उसके पापा का नाम मि. आर के शर्मा है।'},
    {'english': 'I am a nice boy.', 'hindi': 'मैं अच्छा लड़का हूँ।'},
    {'english': 'His way of thinking is different altogether.', 'hindi': 'उसके सोचने का तरीका बहुत अलग है।'},
    {'english': 'In which home was he?', 'hindi': 'वो किस घर में था?'},
    {'english': 'Was he awake that time?', 'hindi': 'क्या वो उस वक्त जगा हुआ था?'},
    {'english': 'Mansi and Paras are good students.', 'hindi': 'मानसी और पारस अच्छे विद्यार्थी हैं।'},
    {'english': 'This is not a laptop.', 'hindi': 'ये लेपटॉप नहीं है।'},
    {'english': 'Who was that boy to Ram?', 'hindi': 'वो लड़का राम का कौन था?'},
    {'english': 'Death is a bitter truth of life.', 'hindi': 'मृत्यु जीवन का एक कटु सत्य है।'},
    {'english': 'Road is bent ahead.', 'hindi': 'रोड आगे से मुड़ी हुई है।'},
    {'english': 'I have six books.', 'hindi': 'मेरे पास 6 किताबें हैं।'},
    {'english': "I don't have 15 pencils.", 'hindi': 'मेरे पास 15 पेंसिलें नहीं हैं।'},
    {'english': 'How many books do you have?', 'hindi': 'तुम्हारे पास कितनी किताबें हैं?'},
    {'english': 'Here is a book.', 'hindi': 'यहाँ एक किताब है।'},
    {'english': 'What are these people to you?', 'hindi': 'ये लोग तुम्हारे क्या लगते हैं?'},
    {'english': 'There are a few notebooks.', 'hindi': 'वहाँ कुछ कापियाँ हैं।'},
    {'english': 'His uncle is very nice.', 'hindi': 'उसके अंकल बहुत अच्छे हैं।'},
    {'english': 'I am your best friend.', 'hindi': 'मैं तुम्हारा सबसे अच्छा दोस्त हूँ।'},
    {'english': 'The condition of my rattraps is pathetic.', 'hindi': 'मेरी चूहेदानियों की हालत बहुत खराब है।'},
    {'english': 'My dad is a nice man.', 'hindi': 'मेरे पापा एक अच्छे इन्सान हैं।'},
    {'english': 'How many brothers does he have?', 'hindi': 'उसके कितने भाई हैं?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER QUIZ — 5 questions mixing all 3 tests
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaperQuizQuestions = [
    QuizQuestion(
      questionEn: '"राकेश के कई दोस्त हैं।" — English?',
      questionHi: '"राकेश के कई दोस्त हैं।"',
      options: [
        'Rakesh have many friends.',
        'Rakesh has many friends.',
        'Rakesh had many friends.',
        'Rakesh is many friends.'
      ],
      correctIndex: 1,
      explanation: 'Rakesh = 3rd Person Singular → "has". "Rakesh has many friends."',
    ),
    QuizQuestion(
      questionEn: '"Are you not my friend?" — Hindi?',
      questionHi: '"Are you not my friend?"',
      options: [
        'तुम मेरे दोस्त हो।',
        'क्या तुम मेरे दोस्त नहीं हो?',
        'तुम मेरे दोस्त नहीं हो।',
        'क्या तुम मेरे दोस्त हो?'
      ],
      correctIndex: 1,
      explanation:
          '"Are you not..." = Negative Interrogative = "क्या तुम... नहीं हो?"',
    ),
    QuizQuestion(
      questionEn: '"Do you not have 10 brothers?" — Hindi?',
      questionHi: '"Do you not have 10 brothers?"',
      options: [
        'तुम्हारे 10 भाई हैं।',
        'क्या तुम्हारे 10 भाई हैं?',
        'क्या तुम्हारे 10 भाई नहीं हैं?',
        'तुम्हारे 10 भाई नहीं हैं।'
      ],
      correctIndex: 2,
      explanation:
          '"Do you not have..." = Negative Interrogative = "क्या तुम्हारे... नहीं हैं?"',
    ),
    QuizQuestion(
      questionEn: '"I didn\'t have 4 mobiles." — Sentence type?',
      questionHi: '"मेरे पास 4 मोबाईल नहीं थे।" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 1,
      explanation:
          '"didn\'t have" = negative past. This is a Negative sentence.',
    ),
    QuizQuestion(
      questionEn: '"A book is lying on the bed." — What state is described?',
      questionHi: '"एक किताब बिस्तर पर पड़ी हुई है।" — यह Simple Sentence क्यों है?',
      options: [
        'Book is performing the action of lying',
        'Book cannot perform the action — it is just lying there',
        'It is a Tense sentence',
        'It has no subject'
      ],
      correctIndex: 1,
      explanation:
          'Book is the subject but it cannot perform the action of "lying". So this is a Simple Sentence.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // MOTIVATIONAL QUOTES
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'Living is not enough, what matters is how you live.',
      'hindi': 'जीना काफी नहीं है, मायने ये रखता है कि आप जीते कैसे हैं।',
      'author': '',
    },
    {
      'english': 'When you make a decision, the universe conspires to make it happen.',
      'hindi': 'जब आप कोई फैसला कर लें, तो ब्रह्मांड उसे पूरा करने की साजिश करने लगता है।',
      'author': 'Ralph Waldo Emerson',
    },
    {
      'english': 'If we are not the part of solution, then we are the problem.',
      'hindi': 'अगर हम हल का हिस्सा नहीं हैं, तो हम ही समस्या हैं।',
      'author': 'Shiv Khera',
    },
    {
      'english': 'A man is great by deeds, not by birth.',
      'hindi': 'व्यक्ति अपने कर्मों से महान बनता है, जन्म से नहीं।',
      'author': 'Chanakya',
    },
    {
      'english': 'Start where you are today. Use what you have today. Do what you can today.',
      'hindi': 'शुरुआत करो आज जहाँ आप हो। हर उस चीज का प्रयोग करो जो आज आपके पास है।',
      'author': '',
    },
  ];
}