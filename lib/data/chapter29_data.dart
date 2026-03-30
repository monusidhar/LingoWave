import '../models/lesson_model.dart';

class Chapter29Data {
  static ChapterModel get chapter => ChapterModel(
        id: 29,
        title: 'Question Tags',
        titleHindi: 'प्रश्न टैग',
        description: 'है ना? नहीं क्या? है कि नहीं?',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Question Tags — Concept',
              titleHindi: 'Question Tag क्या है?',
              emoji: '❓',
              type: LessonType.ch29Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Scenario 1 — Positive Sentences',
              titleHindi: 'सकारात्मक वाक्य → नकारात्मक Tag',
              emoji: '✅',
              type: LessonType.ch29Scenario1,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Scenario 2 — Negative Sentences',
              titleHindi: 'नकारात्मक वाक्य → सकारात्मक Tag',
              emoji: '❌',
              type: LessonType.ch29Scenario2,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch29ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch29Intro:        return introQuestions;
      case LessonType.ch29Scenario1:    return scenario1Questions;
      case LessonType.ch29Scenario2:    return scenario2Questions;
      case LessonType.ch29ChapterQuiz:  return chapterFinalQuestions;
      default:                          return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Question Tag क्या होता है?',
      questionEn: 'What is a Question Tag?',
      options: [
        'एक पूरा सवाल',
        'वाक्य के अंत में जोड़ा गया छोटा प्रश्न (है ना? नहीं क्या?)',
        'एक नकारात्मक वाक्य',
        'एक सकारात्मक वाक्य',
      ],
      correctIndex: 1,
      explanation: 'Question Tag = वाक्य के अंत में जोड़ा गया छोटा confirmation question। जैसे: "है ना?", "नहीं क्या?"',
    ),
    QuizQuestion(
      questionHi: 'अगर वाक्य सकारात्मक (positive) है, तो Question Tag कैसा होगा?',
      questionEn: 'If the sentence is positive, what will the question tag be?',
      options: [
        'Positive (सकारात्मक)',
        'Negative (नकारात्मक)',
        'दोनों हो सकते हैं',
        'कोई tag नहीं',
      ],
      correctIndex: 1,
      explanation: 'Rule 1: Positive sentence → Negative tag। जैसे: "He is good, isn\'t he?"',
    ),
    QuizQuestion(
      questionHi: 'अगर वाक्य नकारात्मक (negative) है, तो Question Tag कैसा होगा?',
      questionEn: 'If the sentence is negative, what will the question tag be?',
      options: [
        'Negative (नकारात्मक)',
        'Positive (सकारात्मक)',
        'No tag needed',
        'Same as sentence',
      ],
      correctIndex: 1,
      explanation: 'Rule 2: Negative sentence → Positive tag। जैसे: "He is not good, is he?"',
    ),
    QuizQuestion(
      questionHi: '"He is good." — Question tag क्या होगा?',
      questionEn: '"He is good." — What is the question tag?',
      options: ['is he?', 'isn\'t he?', 'wasn\'t he?', 'doesn\'t he?'],
      correctIndex: 1,
      explanation: 'Positive sentence → Negative tag। "isn\'t he?" (is का negative + he)',
    ),
    QuizQuestion(
      questionHi: '"He is not good." — Question tag क्या होगा?',
      questionEn: '"He is not good." — What is the question tag?',
      options: ['isn\'t he?', 'is he?', 'was he?', 'does he?'],
      correctIndex: 1,
      explanation: 'Negative sentence → Positive tag। "is he?" (is का positive + he)',
    ),
  ];

  // ─── L2: Scenario 1 Questions ──────────────────────────────────────────────
  static const List<QuizQuestion> scenario1Questions = [
    QuizQuestion(
      questionHi: '"पंकज अच्छा है, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Pankaj is good, is he?',
        'Pankaj is good, isn\'t he?',
        'Pankaj is good, wasn\'t he?',
        'Pankaj is good, doesn\'t he?',
      ],
      correctIndex: 1,
      explanation: 'Positive sentence (is good) → Negative tag (isn\'t he?)। Pankaj is good, isn\'t he?',
    ),
    QuizQuestion(
      questionHi: '"तुम पागल हो, नहीं क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You are mad, are you?',
        'You are mad, aren\'t you?',
        'You are mad, weren\'t you?',
        'You are mad, don\'t you?',
      ],
      correctIndex: 1,
      explanation: 'Positive (are mad) → Negative tag (aren\'t you?)।',
    ),
    QuizQuestion(
      questionHi: '"वो खुश था, नहीं?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He was happy, is he?',
        'He was happy, wasn\'t he?',
        'He was happy, weren\'t he?',
        'He was happy, didn\'t he?',
      ],
      correctIndex: 1,
      explanation: 'Past (was) → tag में भी was का negative = wasn\'t। He was happy, wasn\'t he?',
    ),
    QuizQuestion(
      questionHi: '"राम स्कूल जाता है, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram goes to school, isn\'t he?',
        'Ram goes to school, doesn\'t he?',
        'Ram goes to school, don\'t he?',
        'Ram goes to school, hasn\'t he?',
      ],
      correctIndex: 1,
      explanation: 'Present Indefinite (goes) → tag = doesn\'t he? (3rd person singular)। Ram goes to school, doesn\'t he?',
    ),
    QuizQuestion(
      questionHi: '"तुम वहाँ गये, है कि नहीं?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You went there, weren\'t you?',
        'You went there, didn\'t you?',
        'You went there, don\'t you?',
        'You went there, haven\'t you?',
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite (went) → tag = didn\'t you?। You went there, didn\'t you?',
    ),
    QuizQuestion(
      questionHi: '"मुझे जाना चाहिए, क्या कहते हो?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I should go, shouldn\'t I?',
        'I should go, should I?',
        'I must go, mustn\'t I?',
        'I should go, don\'t I?',
      ],
      correctIndex: 0,
      explanation: 'Should (positive) → Negative tag (shouldn\'t I?)। I should go, shouldn\'t I?',
    ),
    QuizQuestion(
      questionHi: '"बस चली गयी होगी, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Bus will have gone, isn\'t it?',
        'Bus will have gone, won\'t it?',
        'Bus will have gone, doesn\'t it?',
        'Bus will have gone, hasn\'t it?',
      ],
      correctIndex: 1,
      explanation: 'Will (positive) → Negative tag (won\'t it?)। Bus will have gone, won\'t it?',
    ),
  ];

  // ─── L3: Scenario 2 Questions ──────────────────────────────────────────────
  static const List<QuizQuestion> scenario2Questions = [
    QuizQuestion(
      questionHi: '"राम अच्छा नहीं है, है क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram is not good, isn\'t he?',
        'Ram is not good, is he?',
        'Ram is not good, was he?',
        'Ram is not good, does he?',
      ],
      correctIndex: 1,
      explanation: 'Negative (is not) → Positive tag (is he?)। Ram is not good, is he?',
    ),
    QuizQuestion(
      questionHi: '"तुम पागल नहीं हो, हो क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You are not mad, aren\'t you?',
        'You are not mad, are you?',
        'You are not mad, were you?',
        'You are not mad, do you?',
      ],
      correctIndex: 1,
      explanation: 'Negative (are not) → Positive tag (are you?)।',
    ),
    QuizQuestion(
      questionHi: '"राम स्कूल नहीं जाता, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram doesn\'t go to school, does he?',
        'Ram doesn\'t go to school, doesn\'t he?',
        'Ram doesn\'t go to school, is he?',
        'Ram doesn\'t go to school, did he?',
      ],
      correctIndex: 0,
      explanation: 'Negative (doesn\'t) → Positive tag (does he?)। Ram doesn\'t go to school, does he?',
    ),
    QuizQuestion(
      questionHi: '"उसके पास किताब नहीं थी, थी क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He didn\'t have a book, didn\'t he?',
        'He didn\'t have a book, did he?',
        'He didn\'t have a book, does he?',
        'He didn\'t have a book, had he?',
      ],
      correctIndex: 1,
      explanation: 'Negative past (didn\'t) → Positive tag (did he?)। He didn\'t have a book, did he?',
    ),
    QuizQuestion(
      questionHi: '"तुम नहीं जा सकते, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You can\'t go, can\'t you?',
        'You can\'t go, can you?',
        'You can\'t go, don\'t you?',
        'You can\'t go, won\'t you?',
      ],
      correctIndex: 1,
      explanation: 'Negative (can\'t) → Positive tag (can you?)। You can\'t go, can you?',
    ),
    QuizQuestion(
      questionHi: '"वो स्कूल नहीं जायेगा, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He will not go to school, won\'t he?',
        'He will not go to school, will he?',
        'He will not go to school, does he?',
        'He will not go to school, didn\'t he?',
      ],
      correctIndex: 1,
      explanation: 'Negative (will not) → Positive tag (will he?)। He will not go to school, will he?',
    ),
    QuizQuestion(
      questionHi: '"मुझे नहीं जाना चाहिए, क्या कहते हो?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I shouldn\'t go, shouldn\'t I?',
        'I shouldn\'t go, should I?',
        'I shouldn\'t go, don\'t I?',
        'I shouldn\'t go, won\'t I?',
      ],
      correctIndex: 1,
      explanation: 'Negative (shouldn\'t) → Positive tag (should I?)। I shouldn\'t go, should I?',
    ),
  ];

  // ─── L4: Chapter Final Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'Positive sentence → Question tag कैसा?',
      questionEn: 'Positive sentence → what kind of tag?',
      options: ['Positive', 'Negative', 'Either', 'No tag'],
      correctIndex: 1,
      explanation: 'Positive sentence → Negative tag। Rule 1।',
    ),
    QuizQuestion(
      questionHi: 'Negative sentence → Question tag कैसा?',
      questionEn: 'Negative sentence → what kind of tag?',
      options: ['Negative', 'Positive', 'Either', 'No tag'],
      correctIndex: 1,
      explanation: 'Negative sentence → Positive tag। Rule 2।',
    ),
    QuizQuestion(
      questionHi: '"पिंकी अच्छी लड़की है, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Pinki is a sweet girl, is she?',
        'Pinki is a sweet girl, isn\'t she?',
        'Pinki is a sweet girl, wasn\'t she?',
        'Pinki is a sweet girl, doesn\'t she?',
      ],
      correctIndex: 1,
      explanation: 'Positive (is) → Negative tag (isn\'t she?)।',
    ),
    QuizQuestion(
      questionHi: '"मैं बुरा हूँ, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am bad, am I not?',
        'I am bad, am I not? OR I am bad, aren\'t I?',
        'I am bad, isn\'t I?',
        'I am bad, don\'t I?',
      ],
      correctIndex: 1,
      explanation: '"I am" special case: tag = am I not? OR aren\'t I? — दोनों सही हैं।',
    ),
    QuizQuestion(
      questionHi: '"तुमने ताजमहल देखा है, है कि नहीं?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You have seen the Taj, haven\'t you?',
        'You have seen the Taj, have you?',
        'You have seen the Taj, didn\'t you?',
        'You have seen the Taj, don\'t you?',
      ],
      correctIndex: 0,
      explanation: 'Present Perfect (have seen) → Negative tag (haven\'t you?)।',
    ),
    QuizQuestion(
      questionHi: '"मैं नहीं आया था, आया था क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I hadn\'t come, hadn\'t I?',
        'I hadn\'t come, had I?',
        'I didn\'t come, did I?',
        'I haven\'t come, have I?',
      ],
      correctIndex: 1,
      explanation: 'Negative Past Perfect (hadn\'t) → Positive tag (had I?)।',
    ),
    QuizQuestion(
      questionHi: '"वो सो रहा होगा, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He will be sleeping, won\'t he?',
        'He will be sleeping, will he?',
        'He will be sleeping, isn\'t he?',
        'He will be sleeping, doesn\'t he?',
      ],
      correctIndex: 0,
      explanation: 'Positive (will be sleeping) → Negative tag (won\'t he?)।',
    ),
    QuizQuestion(
      questionHi: '"बस नहीं गयी होगी, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Bus will not have gone, won\'t it?',
        'Bus will not have gone, will it?',
        'Bus will not have gone, isn\'t it?',
        'Bus will not have gone, doesn\'t it?',
      ],
      correctIndex: 1,
      explanation: 'Negative (will not have gone) → Positive tag (will it?)।',
    ),
    QuizQuestion(
      questionHi: '"ये प्यार है, है ना?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'It is love, is it?',
        'It is love, isn\'t it?',
        'It is love, wasn\'t it?',
        'It is love, don\'t it?',
      ],
      correctIndex: 1,
      explanation: 'Positive (is love) → Negative tag (isn\'t it?)।',
    ),
    QuizQuestion(
      questionHi: '"ये प्यार नहीं है, है क्या?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'It is not love, isn\'t it?',
        'It is not love, is it?',
        'It is not love, wasn\'t it?',
        'It is not love, doesn\'t it?',
      ],
      correctIndex: 1,
      explanation: 'Negative (is not love) → Positive tag (is it?)।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> scenario1Sentences = [
    {'hindi': 'पंकज अच्छा है, है ना?', 'english': 'Pankaj is good, isn\'t he?'},
    {'hindi': 'पिंकी अच्छी लड़की है, है ना?', 'english': 'Pinki is a sweet girl, isn\'t she?'},
    {'hindi': 'तुम पागल हो, नहीं क्या?', 'english': 'You are mad, aren\'t you?'},
    {'hindi': 'मैं बुरा हूँ, है ना?', 'english': 'I am bad, am I not?'},
    {'hindi': 'वो खुश था, नहीं?', 'english': 'He was happy, wasn\'t he?'},
    {'hindi': 'हम दुखी थे, है ना?', 'english': 'We were sad, weren\'t we?'},
    {'hindi': 'मेरे पास पैसे हैं, नहीं?', 'english': 'I have money, haven\'t I?'},
    {'hindi': 'पापा के पास कुछ है, है ना?', 'english': 'Father has something, hasn\'t he?'},
    {'hindi': 'उसके पास किताब थी, नहीं क्या?', 'english': 'He had a book, hadn\'t he?'},
    {'hindi': 'तुम स्कूल जाते हो, है ना?', 'english': 'You go to school, don\'t you?'},
    {'hindi': 'राम स्कूल जाता है, है ना?', 'english': 'Ram goes to school, doesn\'t he?'},
    {'hindi': 'वो खेल रही है, है ना?', 'english': 'She is playing, isn\'t she?'},
    {'hindi': 'तुमने ताजमहल देखा है, है कि नहीं?', 'english': 'You have seen the Taj, haven\'t you?'},
    {'hindi': 'वो स्कूल जायेगा, है ना?', 'english': 'He will go to school, won\'t he?'},
    {'hindi': 'तुम वहाँ गये, है कि नहीं?', 'english': 'You went there, didn\'t you?'},
    {'hindi': 'मैं आया था, है कि नहीं?', 'english': 'I had come, hadn\'t I?'},
    {'hindi': 'बस चली गयी होगी, है ना?', 'english': 'Bus will have gone, won\'t it?'},
    {'hindi': 'वो सो रहा होगा, है ना?', 'english': 'He will be sleeping, won\'t he?'},
    {'hindi': 'तुम अकेले जा सकते हो, है कि नहीं?', 'english': 'You can go alone, can\'t you?'},
    {'hindi': 'मुझे जाना चाहिए, क्या कहते हो?', 'english': 'I should go, shouldn\'t I?'},
    {'hindi': 'ये प्यार है, है ना?', 'english': 'It is love, isn\'t it?'},
  ];

  static const List<Map<String, String>> scenario2Sentences = [
    {'hindi': 'राम अच्छा नहीं है, है क्या?', 'english': 'Ram is not good, is he?'},
    {'hindi': 'तुम पागल नहीं हो, हो क्या?', 'english': 'You are not mad, are you?'},
    {'hindi': 'मैं पागल नहीं हूँ, हूँ क्या?', 'english': 'I am not mad, am I?'},
    {'hindi': 'वो खुश नहीं था, था क्या?', 'english': 'He was not happy, was he?'},
    {'hindi': 'हम दुखी नहीं थे, थे क्या?', 'english': 'We were not sad, were we?'},
    {'hindi': 'मेरे पास पैसे नहीं हैं, हैं क्या?', 'english': 'I don\'t have money, do I?'},
    {'hindi': 'राम के पास कुछ नहीं है, है ना?', 'english': 'Ram doesn\'t have anything, does he?'},
    {'hindi': 'उसके पास किताब नहीं थी, थी क्या?', 'english': 'He didn\'t have a book, did he?'},
    {'hindi': 'तुम स्कूल नहीं जाते, हो ना?', 'english': 'You don\'t go to school, do you?'},
    {'hindi': 'राम स्कूल नहीं जाता, है ना?', 'english': 'Ram doesn\'t go to school, does he?'},
    {'hindi': 'वो नहीं खेल रही है, है ना?', 'english': 'She is not playing, is she?'},
    {'hindi': 'तुमने ताजमहल नहीं देखा है ना?', 'english': 'You haven\'t seen the Taj, have you?'},
    {'hindi': 'वो स्कूल नहीं जायेगा, है ना?', 'english': 'He will not go to school, will he?'},
    {'hindi': 'तुम वहाँ नहीं गये, है ना?', 'english': 'You didn\'t go there, did you?'},
    {'hindi': 'मैं नहीं आया था, आया था क्या?', 'english': 'I hadn\'t come, had I?'},
    {'hindi': 'बस नहीं गयी होगी, है ना?', 'english': 'Bus will not have gone, will it?'},
    {'hindi': 'वो सो नहीं रहा होगा, है ना?', 'english': 'He will not be sleeping, will he?'},
    {'hindi': 'तुम नहीं जा सकते, है ना?', 'english': 'You can\'t go, can you?'},
    {'hindi': 'मुझे जाना नहीं चाहिए, क्या कहते हो?', 'english': 'I shouldn\'t go, should I?'},
    {'hindi': 'ये प्यार नहीं है, है क्या?', 'english': 'It is not love, is it?'},
  ];

  // Tag formation rules with helping verbs
  static const List<Map<String, String>> tagRules = [
    {'verb': 'is / am / are', 'positive_tag': 'is/am/are ...?', 'negative_tag': 'isn\'t/aren\'t ...?', 'tense': 'Present (be)'},
    {'verb': 'was / were', 'positive_tag': 'was/were ...?', 'negative_tag': 'wasn\'t/weren\'t ...?', 'tense': 'Past (be)'},
    {'verb': 'has / have', 'positive_tag': 'has/have ...?', 'negative_tag': 'hasn\'t/haven\'t ...?', 'tense': 'Present Perfect'},
    {'verb': 'had', 'positive_tag': 'had ...?', 'negative_tag': 'hadn\'t ...?', 'tense': 'Past Perfect'},
    {'verb': 'do / does', 'positive_tag': 'do/does ...?', 'negative_tag': 'don\'t/doesn\'t ...?', 'tense': 'Present Indefinite'},
    {'verb': 'did', 'positive_tag': 'did ...?', 'negative_tag': 'didn\'t ...?', 'tense': 'Past Indefinite'},
    {'verb': 'will', 'positive_tag': 'will ...?', 'negative_tag': 'won\'t ...?', 'tense': 'Future'},
    {'verb': 'can', 'positive_tag': 'can ...?', 'negative_tag': 'can\'t ...?', 'tense': 'Modal'},
    {'verb': 'should', 'positive_tag': 'should ...?', 'negative_tag': 'shouldn\'t ...?', 'tense': 'Modal'},
    {'verb': 'must', 'positive_tag': 'must ...?', 'negative_tag': 'mustn\'t ...?', 'tense': 'Modal'},
  ];

  // Hindi tag words
  static const List<String> hindiTags = [
    'है ना?',
    'नहीं क्या?',
    'है कि नहीं?',
    'है क्या?',
    'हो क्या?',
    'था क्या?',
    'थे क्या?',
    'हूँ क्या?',
    'क्या कहते हो?',
    'आया था क्या?',
    'नहीं?',
  ];
}