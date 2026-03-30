import '../models/lesson_model.dart';

/// Chapter 17 — There (देअर)
class Chapter17Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 17,
        title: 'There',
        titleHindi: 'देअर — वहाँ / यहाँ',
        description: 'There is / There are / There was / There were',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'There — Concept 1',
              titleHindi: 'There का पहला कॉन्सेप्ट',
              emoji: '📍',
              type: LessonType.ch17Concept1,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 2,
              title: 'There — Concept 2',
              titleHindi: 'Subject/Object की जगह There',
              emoji: '🔄',
              type: LessonType.ch17Concept2,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 3,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास — 50 वाक्य',
              emoji: '✍️',
              type: LessonType.ch17Practice,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 4,
              title: 'Test Papers',
              titleHindi: 'टेस्ट पेपर',
              emoji: '📝',
              type: LessonType.ch17TestPaper,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 5,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch17ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 50),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch17Concept1:     return concept1Questions;
      case LessonType.ch17Concept2:     return concept2Questions;
      case LessonType.ch17Practice:     return practiceQuizQuestions;
      case LessonType.ch17TestPaper:    return testPaperQuizQuestions;
      case LessonType.ch17ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Concept 1: Here/There as location words
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept1Questions = [
    QuizQuestion(
      questionEn: '"There" means ___.',
      questionHi: '"There" का मतलब क्या है?',
      options: ['यहाँ', 'वहाँ', 'कहाँ', 'जहाँ'],
      correctIndex: 1,
      explanation: '"There" = वहाँ (that place). "Here" = यहाँ (this place).',
    ),
    QuizQuestion(
      questionEn: '"वहाँ एक पेड़ है।" — English?',
      questionHi: '"वहाँ एक पेड़ है।"',
      options: [
        'Here is a tree.',
        'There is a tree. / A tree is there.',
        'There are a tree.',
        'A tree is here.'
      ],
      correctIndex: 1,
      explanation: '"वहाँ एक पेड़ है।" = "There is a tree." OR "A tree is there." — both are correct.',
    ),
    QuizQuestion(
      questionEn: '"वहाँ दो लड़कियाँ हैं।" — English?',
      questionHi: '"वहाँ दो लड़कियाँ हैं।"',
      options: [
        'There is two girls.',
        'There are two girls.',
        'Two girls is there.',
        'Here are two girls.'
      ],
      correctIndex: 1,
      explanation: '"Two girls" is Plural → "There are two girls." Plural subjects use "are".',
    ),
    QuizQuestion(
      questionEn: '"यहाँ कोई नहीं है।" — English?',
      questionHi: '"यहाँ कोई नहीं है।"',
      options: [
        'There is no one here.',
        'Here is no one. / No one is here.',
        'Here are no one.',
        'No one are here.'
      ],
      correctIndex: 1,
      explanation: '"यहाँ कोई नहीं है।" = "Here is no one." OR "No one is here."',
    ),
    QuizQuestion(
      questionEn: '"यहाँ किसी का पेन था।" — English?',
      questionHi: '"यहाँ किसी का पेन था।"',
      options: [
        "Here is someone's pen.",
        "Here was someone's pen. / Someone's pen was here.",
        "There was someone's pen.",
        "Someone's pen is here."
      ],
      correctIndex: 1,
      explanation: 'Past tense (था) → "was". "Here was someone\'s pen." OR "Someone\'s pen was here."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Concept 2: There replacing missing Subject/Object
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept2Questions = [
    QuizQuestion(
      questionEn: 'In "एक राजा था।" — what is missing?',
      questionHi: '"एक राजा था।" — इसमें क्या नहीं है?',
      options: ['Subject', 'Helping Verb', 'Object', 'Nothing is missing'],
      correctIndex: 2,
      explanation:
          'Subject = एक राजा (a king). Object = missing. So "There" replaces the missing object → "There was a king." OR "A king was there."',
    ),
    QuizQuestion(
      questionEn: '"एक नल है।" — English using There?',
      questionHi: '"एक नल है।" — There का प्रयोग करके?',
      options: [
        'There are a tap.',
        'There is a tap.',
        'A tap are there.',
        'Here is a tap.'
      ],
      correctIndex: 1,
      explanation: '"एक नल है।" — Subject = नल (singular) → "There is a tap."',
    ),
    QuizQuestion(
      questionEn: '"पानी नहीं है।" — English?',
      questionHi: '"पानी नहीं है।"',
      options: [
        'Water is not there.',
        'There is no water. / Water is not there.',
        'There are no water.',
        'No water are there.'
      ],
      correctIndex: 1,
      explanation: '"There is no water." OR "Water is not there." — both are correct.',
    ),
    QuizQuestion(
      questionEn: '"क्या कुछ था?" — English?',
      questionHi: '"क्या कुछ था?"',
      options: [
        'Something was?',
        'Is there something?',
        'Was there something? / Was something there?',
        'Were there something?'
      ],
      correctIndex: 2,
      explanation: 'Past tense question → "Was there something?" OR "Was something there?"',
    ),
    QuizQuestion(
      questionEn: 'In "There was a king." — "There" is used as ___.',
      questionHi: '"There was a king." — "There" किसकी जगह पर है?',
      options: ['Subject', 'Object', 'Subject OR Object (interchangeable)', 'Verb'],
      correctIndex: 2,
      explanation:
          '"There" can replace the missing Object: "A king was there." OR replace Subject position: "There was a king." — both are correct.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE QUIZ — 5 questions from the 50-sentence exercise
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionEn: '"वहाँ कुछ नहीं था।" — English?',
      questionHi: '"वहाँ कुछ नहीं था।"',
      options: [
        'There is nothing there.',
        'Nothing was there.',
        'There were nothing.',
        'Nothing is there.'
      ],
      correctIndex: 1,
      explanation: 'Past tense → "was". "Nothing was there." (OR "There was nothing.")',
    ),
    QuizQuestion(
      questionEn: '"तकिये के नीचे एक पत्र है।" — English?',
      questionHi: '"तकिये के नीचे एक पत्र है।"',
      options: [
        'There is a letter above the pillow.',
        'There is a letter beneath the pillow.',
        'There was a letter beneath the pillow.',
        'A letter are there beneath the pillow.'
      ],
      correctIndex: 1,
      explanation: '"तकिये के नीचे" = "beneath the pillow". Present tense → "There is a letter beneath the pillow."',
    ),
    QuizQuestion(
      questionEn: '"वहाँ कोई नहीं होगा।" — English?',
      questionHi: '"वहाँ कोई नहीं होगा।"',
      options: [
        'There is no one there.',
        'There was no one there.',
        'There will be no one there.',
        'No one will there be.'
      ],
      correctIndex: 2,
      explanation: 'Future tense (होगा) → "will be". "There will be no one there."',
    ),
    QuizQuestion(
      questionEn: '"क्या क्लास में कोई नहीं है?" — English?',
      questionHi: '"क्या क्लास में कोई नहीं है?"',
      options: [
        'Is there someone in the class?',
        "Isn't there anyone in the class?",
        'Is there no one in class?',
        'There is no one in class?'
      ],
      correctIndex: 1,
      explanation: 'Negative Interrogative → "Isn\'t there anyone in the class?"',
    ),
    QuizQuestion(
      questionEn: '"ऐसा कोई शब्द नहीं होता।" — English?',
      questionHi: '"ऐसा कोई शब्द नहीं होता।"',
      options: [
        'There is no word.',
        'There is no word as such.',
        'There are no words as such.',
        'No such word is there.'
      ],
      correctIndex: 1,
      explanation: '"ऐसा... नहीं होता" = "There is no... as such." → "There is no word as such."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER QUIZ — 5 questions from Test I & II
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaperQuizQuestions = [
    QuizQuestion(
      questionEn: '"There was a king." — Hindi?',
      questionHi: '"There was a king." — हिंदी में?',
      options: [
        'एक राजा है।',
        'एक राजा था। / वहाँ एक राजा था।',
        'एक राजा होगा।',
        'वहाँ एक राजा है।'
      ],
      correctIndex: 1,
      explanation: '"There was" = past tense → था। "There was a king." = "एक राजा था।"',
    ),
    QuizQuestion(
      questionEn: '"There is a bridge over the Yamuna River." — Hindi?',
      questionHi: '"There is a bridge over the Yamuna River."',
      options: [
        'यमुना नदी के नीचे एक पुल है।',
        'यमुना नदी के ऊपर एक पुल है।',
        'यमुना नदी के ऊपर एक पुल था।',
        'यमुना नदी पर कोई पुल नहीं है।'
      ],
      correctIndex: 1,
      explanation: '"Over" = के ऊपर। "There is a bridge over the Yamuna River." = "यमुना नदी के ऊपर एक पुल है।"',
    ),
    QuizQuestion(
      questionEn: '"उस घर में एक छोटा बच्चा था।" — English?',
      questionHi: '"उस घर में एक छोटा बच्चा था।"',
      options: [
        'There is a small kid in that home.',
        'There was a small child in that home.',
        'There were a small kid in that home.',
        'In that home there is small kid.'
      ],
      correctIndex: 1,
      explanation: 'Past tense (था) → "was". Singular → "was". "There was a small kid in that home."',
    ),
    QuizQuestion(
      questionEn: '"दोस्ती में थैंक्स नहीं होता।" — English?',
      questionHi: '"दोस्ती में थैंक्स नहीं होता।"',
      options: [
        'There is no thanks in love.',
        'There is no thanks in friendship.',
        'There are no thanks in friendship.',
        'Friendship has no thanks.'
      ],
      correctIndex: 1,
      explanation: '"दोस्ती में" = "in friendship". "There is no thanks in friendship."',
    ),
    QuizQuestion(
      questionEn: '"सभी लोग वहाँ होंगे।" — English?',
      questionHi: '"सभी लोग वहाँ होंगे।"',
      options: [
        'All the people are there.',
        'All the people were there.',
        'All the people will be there.',
        'There will all people be.'
      ],
      correctIndex: 2,
      explanation: 'Future tense (होंगे) → "will be". "All the people will be there."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 10 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"There" is used when ___.',
      questionHi: '"There" का प्रयोग कब होता है?',
      options: [
        'Subject is missing only',
        'Object is missing only',
        'Either Subject OR Object is missing in a Simple Sentence',
        'Verb is missing'
      ],
      correctIndex: 2,
      explanation:
          'When either the Subject or the Object is missing from a Simple Sentence, "There" is used in its place.',
    ),
    QuizQuestion(
      questionEn: '"एक बच्चा था।" — English?',
      questionHi: '"एक बच्चा था।"',
      options: [
        'There is a kid.',
        'There are a kid.',
        'There was a kid.',
        'There were a kid.'
      ],
      correctIndex: 2,
      explanation: 'Past tense (था) + Singular → "There was a kid."',
    ),
    QuizQuestion(
      questionEn: '"कोई है।" — English?',
      questionHi: '"कोई है।"',
      options: [
        'There are someone.',
        'There is someone.',
        'Someone are there.',
        'There was someone.'
      ],
      correctIndex: 1,
      explanation: 'Present tense (है) + Singular → "There is someone." OR "Someone is there."',
    ),
    QuizQuestion(
      questionEn: '"There is no love." — Hindi?',
      questionHi: '"There is no love." — हिंदी में?',
      options: [
        'प्यार है।',
        'प्यार था।',
        'प्यार नहीं है।',
        'प्यार नहीं था।'
      ],
      correctIndex: 2,
      explanation: '"There is no love." = "प्यार नहीं है।" — Present tense negative.',
    ),
    QuizQuestion(
      questionEn: '"वहाँ क्या है?" — English?',
      questionHi: '"वहाँ क्या है?"',
      options: [
        'Where is there?',
        'What is there?',
        'What are there?',
        'There is what?'
      ],
      correctIndex: 1,
      explanation: '"क्या" = "What". WH + is/are + there → "What is there?"',
    ),
    QuizQuestion(
      questionEn: '"कुछ था।" — English?',
      questionHi: '"कुछ था।"',
      options: [
        'There is something.',
        'There was something.',
        'There were something.',
        'Something is there.'
      ],
      correctIndex: 1,
      explanation: 'Past tense (था) → "was". "There was something." OR "Something was there."',
    ),
    QuizQuestion(
      questionEn: 'Which is the correct English for "वहाँ कितने लोग थे?"',
      questionHi: '"वहाँ कितने लोग थे?"',
      options: [
        'How many people is there?',
        'How many people are there?',
        'How many people were there?',
        'How many peoples were there?'
      ],
      correctIndex: 2,
      explanation: 'Past tense (थे) + Plural → "were". "How many people were there?"',
    ),
    QuizQuestion(
      questionEn: '"There is no need to go." — Hindi?',
      questionHi: '"There is no need to go." — हिंदी में?',
      options: [
        'जाने की ज़रूरत है।',
        'जाने की ज़रूरत नहीं है।',
        'जाने की ज़रूरत थी।',
        'कहीं जाना है।'
      ],
      correctIndex: 1,
      explanation: '"There is no need to go." = "जाने की ज़रूरत नहीं है।"',
    ),
    QuizQuestion(
      questionEn: '"A King was there." and "There was a king." are ___.',
      questionHi: '"A King was there." और "There was a king." ___।',
      options: [
        'Different in meaning',
        'The same — Subject and Object positions are interchangeable with There',
        'Both wrong',
        'Only the first one is correct'
      ],
      correctIndex: 1,
      explanation:
          'Both mean the same — "एक राजा था।". Subject and Object positions can be swapped with "There".',
    ),
    QuizQuestion(
      questionEn: '"There is a magic in his voice." — Hindi?',
      questionHi: '"There is a magic in his voice." — हिंदी में?',
      options: [
        'उसकी आवाज़ में जादू नहीं है।',
        'उसकी आवाज़ में जादू था।',
        'उसकी आवाज़ में जादू है।',
        'उसकी आवाज़ में जादू होगा।'
      ],
      correctIndex: 2,
      explanation: '"There is" = present tense → है। "उसकी आवाज़ में जादू है।"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// Concept 1 — Here/There basic examples
  static const List<Map<String, String>> concept1Examples = [
    {'hindi': 'वहाँ एक पेड़ है।',       'english': 'There is a tree. / A tree is there.',      'tense': 'Present'},
    {'hindi': 'वहाँ कोई है।',           'english': 'There is someone. / Someone is there.',    'tense': 'Present'},
    {'hindi': 'वहाँ मैं गया।',          'english': 'I went there. / There went I.',            'tense': 'Past'},
    {'hindi': 'वहाँ दो लड़कियाँ हैं।',   'english': 'There are two girls. / Two girls are there.', 'tense': 'Present'},
    {'hindi': 'यहाँ कोई नहीं है।',      'english': 'Here is no one. / No one is here.',       'tense': 'Present'},
    {'hindi': 'यहाँ किसी का पेन था।',   'english': "Here was someone's pen. / Someone's pen was here.", 'tense': 'Past'},
  ];

  /// Concept 2 — There replacing missing Subject/Object
  static const List<Map<String, String>> concept2Examples = [
    {'hindi': 'एक नल है।',    'english': 'There is a tap. / A tap is there.',         'note': 'Object missing'},
    {'hindi': 'कोई है।',      'english': 'There is someone. / Someone is there.',     'note': 'Object missing'},
    {'hindi': 'पानी नहीं है।', 'english': 'There is no water. / Water is not there.', 'note': 'Object missing'},
    {'hindi': 'लड़की नहीं है।', 'english': 'There is no girl. / Girl is not there.',  'note': 'Object missing'},
    {'hindi': 'एक बच्चा था।', 'english': 'There was a kid. / A kid was there.',       'note': 'Object missing'},
    {'hindi': 'कुछ था।',      'english': 'There was something. / Something was there.','note': 'Object missing'},
    {'hindi': 'प्यार नहीं है।', 'english': 'There is no love. / No love is there.',  'note': 'Object missing'},
    {'hindi': 'क्या कुछ था?', 'english': 'Was there something? / Was something there?', 'note': 'Question'},
    {'hindi': 'कौन है?',      'english': 'Who is there?',                             'note': 'WH Question'},
  ];

  /// There + Helping Verb rules
  static const List<Map<String, String>> thereRules = [
    {
      'tense': 'Simple Present',
      'tenseHi': 'सरल वर्तमान (है/हैं)',
      'singular': 'There is',
      'plural': 'There are',
      'emoji': '🟢',
    },
    {
      'tense': 'Simple Past',
      'tenseHi': 'सरल भूतकाल (था/थे)',
      'singular': 'There was',
      'plural': 'There were',
      'emoji': '🔵',
    },
    {
      'tense': 'Simple Future',
      'tenseHi': 'सरल भविष्य (होगा)',
      'singular': 'There will be',
      'plural': 'There will be',
      'emoji': '🟡',
    },
  ];

  /// Four sentence types using There
  static const List<Map<String, String>> thereFourTypes = [
    {
      'type': 'Affirmative', 'typeHi': 'सकारात्मक',
      'ex1': 'There is a tree.',    'ex1Hi': 'एक पेड़ है।',
      'ex2': 'There was a king.',   'ex2Hi': 'एक राजा था।',
    },
    {
      'type': 'Negative', 'typeHi': 'नकारात्मक',
      'ex1': 'There is no water.',     'ex1Hi': 'पानी नहीं है।',
      'ex2': 'There was nothing.',     'ex2Hi': 'कुछ नहीं था।',
    },
    {
      'type': 'Interrogative', 'typeHi': 'प्रश्नवाचक',
      'ex1': 'Is there someone?',      'ex1Hi': 'क्या कोई है?',
      'ex2': 'Was there something?',   'ex2Hi': 'क्या कुछ था?',
    },
    {
      'type': 'Negative Interrogative', 'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': "Isn't there anyone?",    'ex1Hi': 'क्या कोई नहीं है?',
      'ex2': 'Was there nothing?',     'ex2Hi': 'क्या कुछ नहीं था?',
    },
  ];

  /// WH + There examples
  static const List<Map<String, String>> thereWhExamples = [
    {'hindi': 'वहाँ क्या है?',          'english': 'What is there?'},
    {'hindi': 'वहाँ कितने लोग हैं?',    'english': 'How many people are there?'},
    {'hindi': 'वहाँ कितने लोग थे?',    'english': 'How many people were there?'},
    {'hindi': 'तुम वहाँ क्यों छिपे हुए हो?', 'english': 'Why are you hidden there?'},
    {'hindi': 'वहाँ कौन सब लोग हैं?',  'english': 'Who all people are there?'},
    {'hindi': 'दरवाजे पर कौन है?',     'english': 'Who is there at the door?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE EXERCISE — 50 sentences (Hindi → English)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'एक नल था।',                         'english': 'There was a tap.'},
    {'hindi': 'क्या तुम्हारा भाई वहाँ था?',          'english': 'Was your brother there?'},
    {'hindi': 'कोई है क्या?',                       'english': 'Is there someone?'},
    {'hindi': 'क्या आपके दिल में प्यार नहीं है?',    'english': "Isn't there love in your heart?"},
    {'hindi': 'तुम वहाँ क्यों छिपे हुए हो?',         'english': 'Why are you hidden there?'},
    {'hindi': 'जंगल में एक राजा रहता था।',           'english': 'There lived a king in jungle.'},
    {'hindi': 'वहाँ कुछ नहीं था।',                  'english': 'Nothing was there.'},
    {'hindi': 'एक राजा वहाँ गया।',                  'english': 'There went a king. / A king went there.'},
    {'hindi': 'वहाँ क्या है?',                       'english': 'What is there?'},
    {'hindi': 'उस शहर में एक पार्क था।',             'english': 'There was a park in that city.'},
    {'hindi': 'क्या तुम्हारे पास पैसे नहीं हैं?',    'english': "Isn't there money with you? / Do you not have money?"},
    {'hindi': 'क्लास में 3 लड़कियाँ बैठी थीं।',      'english': 'There were 3 girls sitting in the class.'},
    {'hindi': 'मेरे पापा वहाँ रहते थे।',             'english': 'There lived my dad. / My dad lived there.'},
    {'hindi': 'टेबल पर पेन था।',                    'english': 'There was a pen on the table.'},
    {'hindi': 'तकिये के नीचे एक पत्र है।',           'english': 'There is a letter beneath the pillow.'},
    {'hindi': 'वहाँ कोई नहीं होगा।',                'english': 'There will be no one there.'},
    {'hindi': 'तुम्हारे भाई के साथ एक आदमी खड़ा है।','english': 'There is a man standing with your brother.'},
    {'hindi': 'इस तरह के कई फूल हैं।',              'english': 'There are so many such flowers.'},
    {'hindi': 'वहाँ देखने को कुछ नहीं है।',          'english': 'There is nothing to see.'},
    {'hindi': 'क्या क्लास में कोई नहीं है?',          'english': "Isn't there anyone in the class?"},
    {'hindi': 'खेलने के लिए लड़के नहीं हैं।',        'english': 'There are no boys to play.'},
    {'hindi': 'उसके बटुए में पैसे नहीं हैं।',        'english': 'There is no money in his wallet.'},
    {'hindi': 'इस कम्पनी में आगे बढ़ने के कई अवसर हैं।', 'english': 'There are numerous growth opportunities in this company.'},
    {'hindi': 'जाने की जरूरत नहीं है।',              'english': 'There is no need to go.'},
    {'hindi': 'बर्गर खाने की कोई जरूरत नहीं।',       'english': 'There is no need to eat burger.'},
    {'hindi': 'एक साँप था।',                        'english': 'There was a snake.'},
    {'hindi': 'एक पेड़ है, जिसका रंग लाल है।',       'english': 'There is a tree, which is of red color.'},
    {'hindi': 'क्या तुम्हारे पास पेन है?',            'english': 'Is there a pen with you? / Do you have a pen?'},
    {'hindi': 'उस कुँए में पानी नहीं था।',           'english': 'There was no water in that well.'},
    {'hindi': 'जब कभी मैं परेशानी में था, तुम मेरे साथ थे।', 'english': 'Whenever I was in trouble, you were there with me.'},
    {'hindi': 'मैने जो कुछ किया, वहीं पर किया।',    'english': 'Whatever I did, I did there.'},
    {'hindi': 'उसकी जिन्दगी में खुशी नहीं है।',      'english': 'There is no joy in his life.'},
    {'hindi': 'क्या वहाँ कुछ चल रहा है?',           'english': 'Is there something going on?'},
    {'hindi': 'प्यार जैसी कोई चीज नहीं होती।',      'english': 'There is nothing as such love.'},
    {'hindi': 'ऐसा कोई शब्द नहीं होता।',            'english': 'There is no word as such.'},
    {'hindi': 'ऐसी कोई कहानी नहीं है।',             'english': 'There is no such story.'},
    {'hindi': 'ऐसा कोई गाँव नहीं है।',              'english': 'There is no such village.'},
    {'hindi': 'ऐसा कोई देश नहीं है, जहाँ सिर्फ जानवर रहते हों।', 'english': 'There is no country as such, where there are only animals.'},
    {'hindi': 'ऐसा कोई मोबाइल नहीं है, जिसे मैं ठीक नहीं कर सकता।', 'english': "There is no such a mobile, which I can't repair."},
    {'hindi': 'क्या वहाँ कोई नहीं है?',              'english': "Isn't there anyone?"},
    {'hindi': 'ऐसा कोई आदमी नहीं होता जिसे चोट नहीं लगती।', 'english': "There is no such a man, who doesn't get hurt."},
    {'hindi': 'वहाँ कितने लोग हैं?',                'english': 'How many guys are there?'},
    {'hindi': 'वहाँ कितने लोग थे?',                 'english': 'How many people were there?'},
    {'hindi': 'वहाँ क्या है?',                       'english': 'What is there?'},
    {'hindi': 'तुम वहाँ किसके साथ थे?',              'english': 'With whom were you there?'},
    {'hindi': 'उस गाँव में बिजली नहीं है।',           'english': 'There is no electricity in that village.'},
    {'hindi': 'क्या तुम्हारे दिमाग में कुछ है?',      'english': 'Is there something in your mind?'},
    {'hindi': 'क्या इस जीवन में केवल दुख है?',       'english': 'Is there only sorrow in this life?'},
    {'hindi': 'वहाँ कौन सब लोग हैं?',               'english': 'Who all people are there?'},
    {'hindi': 'क्या तुम्हारे पापा वहाँ नहीं थे?',    'english': 'Was your dad not there?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST I — English → Hindi (50 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testI = [
    {'english': 'Were you there?',                          'hindi': 'क्या तुम थे?'},
    {'english': 'Who is there at the door?',                'hindi': 'दरवाजे पर कौन है?'},
    {'english': 'There was a king.',                        'hindi': 'एक राजा था। / वहाँ एक राजा था।'},
    {'english': 'How much petrol is there in your car?',    'hindi': 'तुम्हारी कार में कितना पेट्रोल है?'},
    {'english': 'Until when were you there in office?',     'hindi': 'तुम ऑफिस में कब तक थे?'},
    {'english': 'There is a book on the bed.',              'hindi': 'बिस्तर पर एक किताब है।'},
    {'english': 'How many students were there in the class?','hindi': 'क्लास में कितने बच्चे थे?'},
    {'english': 'Is there money in your pocket?',           'hindi': 'क्या तुम्हारी जेब में पैसे हैं?'},
    {'english': 'No one is there.',                         'hindi': 'वहाँ कोई नहीं है।'},
    {'english': 'There is a boy standing.',                 'hindi': 'एक लड़का खड़ा है। / वहाँ एक लड़का खड़ा है।'},
    {'english': 'Is someone there?',                       'hindi': 'क्या कोई है?'},
    {'english': 'There were 29 people in total.',           'hindi': 'कुल मिलाकर 29 लोग थे।'},
    {'english': 'Why were you there?',                     'hindi': 'तुम वहाँ क्यों थे?'},
    {'english': 'With whom is he there?',                  'hindi': 'वो वहाँ किसके साथ है?'},
    {'english': 'There was a lion in that forest.',         'hindi': 'उस जंगल में एक शेर था।'},
    {'english': 'There is a ghost, whose name is Rahul.',   'hindi': 'वहाँ एक भूत है जिसका नाम राहुल है।'},
    {'english': 'When you were there, I was not there.',    'hindi': 'जब तुम थे, मैं नहीं था।'},
    {'english': 'There were 15 students in that class.',    'hindi': 'उस क्लास में 15 बच्चे थे।'},
    {'english': 'There is a phone call for you.',           'hindi': 'तुम्हारे लिए एक फोन कॉल है।'},
    {'english': 'A friend of yours is there at the door.',  'hindi': 'तुम्हारा कोई दोस्त दरवाजे पर है।'},
    {'english': 'There is no Rahul in my class.',           'hindi': 'मेरी क्लास में कोई राहुल नहीं है।'},
    {'english': 'There are no pens in my bag.',             'hindi': 'मेरे बैग में पेन नहीं हैं।'},
    {'english': 'How much is there in your pocket?',        'hindi': 'तुम्हारी जेब में कितना है?'},
    {'english': 'How many stars are there in the sky?',     'hindi': 'आसमान में कितने तारे हैं?'},
    {'english': 'His dad is there with my dad.',            'hindi': 'उसके पापा मेरे पापा के साथ हैं।'},
    {'english': 'Her sister is there in Japan.',            'hindi': 'उसकी बहन जापान में है।'},
    {'english': 'There is a tap in his kitchen, which is very old.', 'hindi': 'उसके किचन में एक नल है, जो बहुत पुराना है।'},
    {'english': 'There is a boy with him, who is very thin.','hindi': 'उसके साथ एक लड़का है, जो बहुत पतला है।'},
    {'english': 'There is a girl in his class, for whom he is mad.', 'hindi': 'उसकी क्लास में एक लड़की है, जिसके लिए वो पागल है।'},
    {'english': 'There is no friend of mine in this photograph.', 'hindi': 'इस फोटो में मेरा कोई दोस्त नहीं है।'},
    {'english': 'Is there any friend of yours in this photograph?', 'hindi': 'क्या इस फोटो में तुम्हारा कोई दोस्त है?'},
    {'english': 'There are numerous hotels in Shimla.',     'hindi': 'शिमला में कई होटल हैं।'},
    {'english': 'There is a beautiful lake in Mussorie.',   'hindi': 'मसूरी में एक सुन्दर झील है।'},
    {'english': 'There is a laptop on my bed.',             'hindi': 'मेरे बिस्तर पर एक लेपटॉप है।'},
    {'english': 'Is there a mobile on my table?',           'hindi': 'क्या मेरी टेबल पर कोई मोबाइल है?'},
    {'english': 'There is no letter underneath the pillow.','hindi': 'तकिए के नीचे कोई पत्र नहीं है।'},
    {'english': 'There is no one standing ahead of me.',    'hindi': 'मेरे आगे कोई नहीं खड़ा।'},
    {'english': 'How many people are there next to you?',   'hindi': 'तुम्हारे बगल में कितने लोग हैं?'},
    {'english': 'Ram is there in the car.',                 'hindi': 'राम कार में है।'},
    {'english': 'There is a bridge over the Yamuna River.', 'hindi': 'यमुना नदी के ऊपर एक पुल है।'},
    {'english': 'How many books are there in your bag?',    'hindi': 'तुम्हारे बैग में कितनी किताबें हैं?'},
    {'english': 'Nothing is there.',                        'hindi': 'वहाँ कुछ नहीं है।'},
    {'english': 'Nobody is there in your room.',            'hindi': 'तुम्हारे कमरे में कोई नहीं है।'},
    {'english': 'Some people are there eating the food.',   'hindi': 'वहाँ कुछ लोग खाना खा रहे हैं।'},
    {'english': 'My life is there in you.',                 'hindi': 'मेरी जिन्दगी तुम में है।'},
    {'english': 'I am always there with you.',              'hindi': 'मैं हमेशा तुम्हारे साथ हूँ।'},
    {'english': 'The condition is pathetic there.',         'hindi': 'वहाँ हालत बहुत बुरी है।'},
    {'english': 'My dad was never there.',                  'hindi': 'मेरे पापा वहाँ कभी नहीं थे।'},
    {'english': 'Weather conditions were phenomenal there.','hindi': 'मौसम बड़ा जबरदस्त था वहाँ।'},
    {'english': 'How many brothers of yours were standing there?', 'hindi': 'तुम्हारे कितने भाई वहाँ खड़े थे?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST II — Hindi → English (45 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testII = [
    {'hindi': 'उस घर में एक छोटा बच्चा था।',             'english': 'There was a small kid in that home.'},
    {'hindi': 'वहाँ कुछ नहीं था शायद।',                  'english': 'Perhaps there was nothing.'},
    {'hindi': 'बाल्टी के नीचे कुछ है।',                  'english': 'There is something beneath the bucket.'},
    {'hindi': 'सभी लोग वहाँ होंगे।',                     'english': 'All the people will be there.'},
    {'hindi': 'क्या मेरा भाई वहाँ होगा?',                'english': 'Will my brother be there?'},
    {'hindi': 'वहाँ पहनने को कुछ नहीं है।',              'english': 'There is nothing to wear.'},
    {'hindi': 'कहने की जरूरत नहीं है।',                  'english': 'There is no need to say.'},
    {'hindi': 'जब कभी तुम थे, राम नहीं था।',             'english': "Whenever you were there, Ram wasn't there."},
    {'hindi': 'उसके भाई के दिल में कोई बात नहीं है।',    'english': "There is nothing in his brother's heart."},
    {'hindi': 'बात करने की कोई जरूरत नहीं है।',          'english': 'There is no need to talk.'},
    {'hindi': 'ऐसा कुछ नहीं है।',                        'english': 'There is nothing as such.'},
    {'hindi': 'हमारे बीच ऐसा कुछ नहीं था।',              'english': 'There was nothing as such between us.'},
    {'hindi': 'कितने लोग हैं?',                           'english': 'How many people are there?'},
    {'hindi': 'कुछ है क्या?',                             'english': 'Is there something? / Is something there?'},
    {'hindi': 'उस घर में कुछ है।',                        'english': 'There is something in that house.'},
    {'hindi': 'कितना पैसा था?',                           'english': 'How much money was there?'},
    {'hindi': 'तुम किसके साथ थे?',                       'english': 'With whom were you?'},
    {'hindi': 'इस दिल में क्या है, कौन जानता है?',        'english': "What's in this heart, who knows?"},
    {'hindi': 'एक राजा था। उसकी तीन रानियाँ थीं।',       'english': 'There was a king. He had three queens.'},
    {'hindi': 'दरवाजे पर कौन था?',                       'english': 'Who was there at the door?'},
    {'hindi': 'घर में कितने लोग हैं?',                    'english': 'How many people are there at home?'},
    {'hindi': 'मन में क्या है तुम्हारे?',                 'english': 'What is there in your mind/heart?'},
    {'hindi': 'कम्प्यूटर में कितने गेम हैं?',             'english': 'How many games are there in computer?'},
    {'hindi': 'राम और श्याम के बीच में कौन है?',          'english': 'Who is there between Ram and Shyam?'},
    {'hindi': 'मेरे आगे कोई नहीं है।',                   'english': 'Nobody is there ahead of me.'},
    {'hindi': 'तुम्हारे पीछे कौन था?',                   'english': 'Who was there behind you?'},
    {'hindi': 'राम के साथ कौन है?',                      'english': 'Who is there with Ram?'},
    {'hindi': 'पापा के सामने मम्मी थी।',                  'english': 'There was mom in front of dad.'},
    {'hindi': 'मेरे बगल में कोई है क्या?',               'english': 'Is someone there beside me?'},
    {'hindi': 'एक आदमी खड़ा है।',                        'english': 'There is a man standing.'},
    {'hindi': 'कोई लड़की है।',                            'english': 'There is some girl.'},
    {'hindi': 'कई बातें हैं जो मैं जानता हूँ।',           'english': 'There are lot many things that I know.'},
    {'hindi': 'प्यार में दूरियाँ नहीं होती।',             'english': 'There are no differences in love.'},
    {'hindi': 'दोस्ती में थैंक्स नहीं होता।',             'english': 'There is no thanks in friendship.'},
    {'hindi': 'हमारे बीच कुछ नहीं है।',                  'english': 'There is nothing between us.'},
    {'hindi': 'नल में पानी नहीं है।',                    'english': 'There is no water in the tap.'},
    {'hindi': 'दिल को प्यार है।',                         'english': 'There is love in heart.'},
    {'hindi': 'तुम्हारे दिल में क्या है?',                'english': 'What is there in your heart?'},
    {'hindi': 'कमरे में खिड़कियाँ हैं।',                  'english': 'There are windows in the room.'},
    {'hindi': 'पेन में स्याही नहीं है।',                  'english': 'There is no ink in the pen.'},
    {'hindi': 'कार में पेट्रोल था।',                      'english': 'There was petrol in the car.'},
    {'hindi': 'उसके दिल में बहुत दर्द है।',               'english': 'There is so much pain in his heart.'},
    {'hindi': 'उसकी आवाज़ में जादू है।',                  'english': 'There is a magic in his voice.'},
    {'hindi': 'तुम्हारे गाने के तरीके में कुछ तो बात है।','english': 'There is something in your way of singing.'},
    {'hindi': 'कुछ और भी है।',                           'english': 'Something else is there.'},
  ];

  /// Motivational quotes
  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'Why to afraid of what\'ll happen in life. Even if nothing happens, experience will be gained.',
      'hindi': 'क्यों डरें कि जिन्दगी में क्या होगा। कुछ नहीं भी हुआ तो कम से कम तजुर्बा होगा।',
      'author': '',
    },
    {
      'english': 'A man is great by deeds, not by birth.',
      'hindi': 'व्यक्ति अपने कर्मों से महान बनता है, जन्म से नहीं।',
      'author': 'Chanakya',
    },
    {
      'english': "Whose fingers you resorted to experience the world; never let their shoulders down.",
      'hindi': 'जिनकी उँगली पकड़कर तुमने चलना सीखा, उनके कन्धों को कभी झुकने मत देना।',
      'author': '',
    },
    {
      'english': 'Unless a man undertakes more than he possibly can, he will never do what he actually can.',
      'hindi': 'जब तक एक इन्सान उससे ज्यादा करने की कोशिश नहीं करता जितना उसे लगता है, वो कभी उतना नहीं कर पायेगा जितना वो वास्तव में कर सकता है।',
      'author': '',
    },
  ];
}