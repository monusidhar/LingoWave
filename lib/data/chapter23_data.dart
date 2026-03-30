import '../models/lesson_model.dart';

class Chapter23Data {
  static ChapterModel get chapter => ChapterModel(
        id: 23,
        title: 'Imperative Sentences',
        titleHindi: 'आज्ञा सूचक वाक्य',
        description: 'Do, Don\'t, Let, Never, Always & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Imperative Sentences',
              titleHindi: 'आज्ञा सूचक वाक्य — नियम',
              emoji: '📢',
              type: LessonType.ch23Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Let / Don\'t Let',
              titleHindi: 'करने दो / मत करने दो',
              emoji: '🙌',
              type: LessonType.ch23Let,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Quotations',
              titleHindi: 'महान व्यक्तियों के वचन',
              emoji: '💬',
              type: LessonType.ch23Quotations,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (95 sentences)',
              emoji: '✍️',
              type: LessonType.ch23Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 5,
              title: 'Test Paper I',
              titleHindi: 'परीक्षा पत्र I (Hindi→English)',
              emoji: '📝',
              type: LessonType.ch23TestPaper1,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 6,
              title: 'Test Paper II',
              titleHindi: 'परीक्षा पत्र II (English→Hindi)',
              emoji: '📋',
              type: LessonType.ch23TestPaper2,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 7,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch23ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch23Intro:
        return introQuestions;
      case LessonType.ch23Let:
        return letQuestions;
      case LessonType.ch23Quotations:
        return quotationQuestions;
      case LessonType.ch23Practice:
        return practiceQuizQuestions;
      case LessonType.ch23TestPaper1:
        return testPaper1QuizQuestions;
      case LessonType.ch23TestPaper2:
        return testPaper2QuizQuestions;
      case LessonType.ch23ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Imperative Sentence में Subject कौन होता है?',
      questionEn: 'What is the subject in an Imperative Sentence?',
      options: ['I', 'He/She', 'You (hidden)', 'They'],
      correctIndex: 2,
      explanation: 'Imperative sentences have a hidden subject "You". E.g., "Go!" = "You go!"',
    ),
    QuizQuestion(
      questionHi: '"राम के साथ जाओ।" — सही अनुवाद?',
      questionEn: 'Correct translation of "राम के साथ जाओ"?',
      options: ['Ram goes with you.', 'Go with Ram.', 'You went with Ram.', 'Going with Ram.'],
      correctIndex: 1,
      explanation: 'Imperative: Verb 1st form + Object → "Go with Ram."',
    ),
    QuizQuestion(
      questionHi: '"Please/Kindly" का प्रयोग कब होता है?',
      questionEn: 'When is "Please/Kindly" used in Imperative?',
      options: ['आदेश देते वक्त', 'अनुरोध (request) करते वक्त', 'मना करते वक्त', 'हमेशा'],
      correctIndex: 1,
      explanation: '"Please/Kindly" is added when making a polite request.',
    ),
    QuizQuestion(
      questionHi: '"Never tell a lie." — किस formula से बना?',
      questionEn: '"Never tell a lie." — which formula?',
      options: ['Don\'t + Verb', 'Always + Verb', 'Never + Verb 1st form', 'Please + Verb'],
      correctIndex: 2,
      explanation: '"Never" = कभी मत। Formula: Never + Verb 1st form + Object.',
    ),
    QuizQuestion(
      questionHi: '"Do go!" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Do go!"?',
      options: ['जाओ', 'मत जाओ', 'जरूर जाओ (emphasis)', 'कभी-कभी जाओ'],
      correctIndex: 2,
      explanation: '"Do + Verb" in Imperative = emphasis → "जरूर जाओ" (definitely go).',
    ),
  ];

  // ─── L2: Let Quiz ──────────────────────────────────────────────────────────
  static const List<QuizQuestion> letQuestions = [
    QuizQuestion(
      questionHi: '"Let me go." — formula?',
      questionEn: '"Let me go." — which formula?',
      options: [
        'Let + subject + Verb 1st form',
        'Don\'t + let + Verb',
        'Let + not + Verb',
        'Please + let + Verb'
      ],
      correctIndex: 0,
      explanation: 'Let + subject (me/him/her/them/noun) + Verb 1st form.',
    ),
    QuizQuestion(
      questionHi: '"उसे मत आने दो।" — सही अनुवाद?',
      questionEn: 'Correct translation of "उसे मत आने दो"?',
      options: [
        'Let him come.',
        'Don\'t let him come. / Let him not come.',
        'Never let him.',
        'Don\'t him come.'
      ],
      correctIndex: 1,
      explanation: '"Don\'t let + subject + Verb" OR "Let + subject + not + Verb".',
    ),
    QuizQuestion(
      questionHi: '"Let" वाले वाक्यों में subject क्या होता है?',
      questionEn: 'What type of word is used as subject after "Let"?',
      options: [
        'Subjective pronoun (I, he, she)',
        'Noun या Objective pronoun (me, him, her, us, them)',
        'Possessive pronoun (my, his)',
        'Verb'
      ],
      correctIndex: 1,
      explanation: 'Subject after "Let" = Noun (Ram) or Objective pronoun (me, him, her, us, them).',
    ),
    QuizQuestion(
      questionHi: '"Let children go to park." — हिंदी?',
      questionEn: 'Hindi meaning of "Let children go to park."?',
      options: [
        'बच्चों को पार्क में मत जाने दो।',
        'बच्चे पार्क जाते हैं।',
        'बच्चों को पार्क जाने दो।',
        'बच्चे पार्क जाएंगे।'
      ],
      correctIndex: 2,
      explanation: '"Let + noun + Verb" = उसे/उन्हें करने दो।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t let dad go." का दूसरा तरीका?',
      questionEn: 'Alternative for "Don\'t let dad go."?',
      options: [
        'Let dad not go.',
        'Never let dad.',
        'Please let dad not.',
        'Don\'t dad go.'
      ],
      correctIndex: 0,
      explanation: '"Don\'t let + subject + Verb" = "Let + subject + not + Verb".',
    ),
  ];

  // ─── L3: Quotations Quiz ───────────────────────────────────────────────────
  static const List<QuizQuestion> quotationQuestions = [
    QuizQuestion(
      questionHi: '"Never give up." — किसने कहा जैसा famous quote है?',
      questionEn: '"Never give up." — what type of Imperative?',
      options: ['Do (करो)', 'Please (request)', 'Never (कभी मत)', 'Let'],
      correctIndex: 2,
      explanation: '"Never" + Verb 1st form = कभी मत करो।',
    ),
    QuizQuestion(
      questionHi: '"Live as if you were to die tomorrow." — Mahatma Gandhi का quote। "as if" का अर्थ?',
      questionEn: '"Live as if you were to die tomorrow." — "as if" means:',
      options: ['जैसे ही', 'मानो / जैसे कि', 'जब तक', 'जहाँ तक'],
      correctIndex: 1,
      explanation: '"As if" = मानो / जैसे कि (imaginary situation).',
    ),
    QuizQuestion(
      questionHi: '"Always believe in yourself." — formula?',
      questionEn: '"Always believe in yourself." — formula?',
      options: [
        'Don\'t + Verb',
        'Never + Verb',
        'Always + Verb 1st form',
        'Please + Verb'
      ],
      correctIndex: 2,
      explanation: '"Always" + Verb 1st form = हमेशा करो।',
    ),
    QuizQuestion(
      questionHi: '"Do good deed." — "Do" यहाँ किस लिए?',
      questionEn: '"Do good deed." — purpose of "Do" here?',
      options: [
        'Helping verb के रूप में',
        'Emphasis (जोर देने) के लिए',
        'Negative बनाने के लिए',
        'Question बनाने के लिए'
      ],
      correctIndex: 1,
      explanation: '"Do + Verb" in Imperative = जोर देकर कहना (emphasis/definitely).',
    ),
    QuizQuestion(
      questionHi: '"Kindly help the poor." — यह किस तरह का Imperative है?',
      questionEn: '"Kindly help the poor." — type of Imperative?',
      options: ['Order (आदेश)', 'Polite Request (विनम्र अनुरोध)', 'Prohibition (मनाही)', 'Never'],
      correctIndex: 1,
      explanation: '"Kindly/Please" + Verb = Polite Request।',
    ),
  ];

  // ─── L4: Practice Quiz ────────────────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"Don\'t shirk the work." — हिंदी?',
      questionEn: 'Hindi meaning of "Don\'t shirk the work."?',
      options: [
        'काम पर जाओ।',
        'काम से जी मत चुराओ।',
        'काम हमेशा करो।',
        'कृपया काम करो।'
      ],
      correctIndex: 1,
      explanation: '"Shirk" = जी चुराना (avoid work lazily).',
    ),
    QuizQuestion(
      questionHi: '"Button up your shirt." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'कमीज उतारो।',
        'कमीज के बटन खोलो।',
        'अपनी कमीज के बटन बन्द करो।',
        'नई कमीज पहनो।'
      ],
      correctIndex: 2,
      explanation: '"Button up" = बटन बंद करना।',
    ),
    QuizQuestion(
      questionHi: '"Pass the salt please." — Formula?',
      questionEn: '"Pass the salt please." — formula used?',
      options: [
        'Never + Verb',
        'Don\'t + Verb',
        'Verb 1st form + Object + Please (request)',
        'Always + Verb'
      ],
      correctIndex: 2,
      explanation: 'Please at end = polite request. "Pass the salt please."',
    ),
    QuizQuestion(
      questionHi: '"Blow out the candle." — हिंदी?',
      questionEn: 'Hindi meaning of "Blow out the candle."?',
      options: [
        'मोमबत्ती जला लो।',
        'मोमबत्ती बुझा दो।',
        'मोमबत्ती खरीदो।',
        'मोमबत्ती रखो।'
      ],
      correctIndex: 1,
      explanation: '"Blow out" = बुझाना। "Light" = जलाना।',
    ),
    QuizQuestion(
      questionHi: '"Mind your language." — हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Mind your language."?',
      options: [
        'अपनी भाषा बदलो।',
        'हिंदी बोलो।',
        'अपनी जुबान पर काबू रखो।',
        'ध्यान से पढ़ो।'
      ],
      correctIndex: 2,
      explanation: '"Mind your language" = अपनी जुबान पर काबू रखो।',
    ),
    QuizQuestion(
      questionHi: '"Pare your nails." — हिंदी?',
      questionEn: 'Hindi meaning of "Pare your nails."?',
      options: [
        'नाखून रंगो।',
        'नाखून काटो।',
        'नाखून देखो।',
        'नाखून साफ करो।'
      ],
      correctIndex: 1,
      explanation: '"Pare" = काटना (trim/pare nails).',
    ),
    QuizQuestion(
      questionHi: '"Keep to the left." — हिंदी?',
      questionEn: 'Hindi meaning of "Keep to the left."?',
      options: [
        'दाये चलो।',
        'बाये चलो।',
        'सीधे चलो।',
        'रुको।'
      ],
      correctIndex: 1,
      explanation: '"Keep to the left" = बाये चलो।',
    ),
    QuizQuestion(
      questionHi: '"Get well soon." — Formula?',
      questionEn: '"Get well soon." — type of Imperative?',
      options: [
        'Don\'t + Verb',
        'Please + Verb',
        'Verb 1st form (wish/command)',
        'Never + Verb'
      ],
      correctIndex: 2,
      explanation: '"Get well soon" = जल्दी ठीक हो जाओ। Verb 1st form used as a wish.',
    ),
  ];

  // ─── L5: Test Paper I Quiz ─────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionHi: '"Don\'t see the time." — हिंदी?',
      questionEn: 'Hindi meaning of "Don\'t see the time."?',
      options: ['समय देखो।', 'समय मत देखो।', 'समय पर आओ।', 'समय याद करो।'],
      correctIndex: 1,
      explanation: '"Don\'t + Verb" = मत करो।',
    ),
    QuizQuestion(
      questionHi: '"Let us study as it is our paper day after tomorrow." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'हमें पढ़ने दो क्योंकि परसों हमारा पेपर है।',
        'हम पढ़ेंगे।',
        'हमें पेपर देने दो।',
        'हमें पढ़ना है।'
      ],
      correctIndex: 0,
      explanation: '"Let us + Verb" = हमें करने दो। "Day after tomorrow" = परसों।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t back out of your promise." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'वादा करो।',
        'वादे को याद रखो।',
        'अपने वादे से मत मुकरो।',
        'वादा तोड़ दो।'
      ],
      correctIndex: 2,
      explanation: '"Back out of" = मुकरना (go back on a promise).',
    ),
    QuizQuestion(
      questionHi: '"Mingle with people." — हिंदी?',
      questionEn: 'Hindi meaning of "Mingle with people."?',
      options: [
        'लोगों से दूर रहो।',
        'लोगों से घुल मिल कर रहा करो।',
        'लोगों को बुलाओ।',
        'लोगों से बात करो।'
      ],
      correctIndex: 1,
      explanation: '"Mingle" = घुल-मिलना (mix/socialize).',
    ),
    QuizQuestion(
      questionHi: '"Hold my hand." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: ['हाथ हिलाओ।', 'मेरा हाथ पकड़ लो।', 'मुझे छोड़ो।', 'हाथ जोड़ो।'],
      correctIndex: 1,
      explanation: '"Hold" = पकड़ना।',
    ),
    QuizQuestion(
      questionHi: '"Imagine that you are on a mountain." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'पहाड़ पर जाओ।',
        'पहाड़ की कल्पना करो।',
        'कल्पना करो कि तुम किसी पहाड़ पर हो।',
        'पहाड़ मत चढ़ो।'
      ],
      correctIndex: 2,
      explanation: '"Imagine that/as if" = कल्पना करो कि।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t guess." — हिंदी?',
      questionEn: 'Hindi meaning of "Don\'t guess."?',
      options: ['अंदाज़ लगाओ।', 'सोचो।', 'अंदाज़ मत लगाओ।', 'कुछ मत करो।'],
      correctIndex: 2,
      explanation: '"Guess" = अंदाज़ा लगाना।',
    ),
    QuizQuestion(
      questionHi: '"Fill the bottles." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: ['बोतलें तोड़ो।', 'बोतलें खरीदो।', 'बोतलें भर लो।', 'बोतलें रखो।'],
      correctIndex: 2,
      explanation: '"Fill" = भरना।',
    ),
  ];

  // ─── L6: Test Paper II Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionHi: '"Never give up." — हिंदी?',
      questionEn: 'Hindi meaning of "Never give up."?',
      options: ['हमेशा हारो।', 'कभी हार मत मानो।', 'हार जाओ।', 'मत सोचो।'],
      correctIndex: 1,
      explanation: '"Never give up" = कभी हार मत मानो।',
    ),
    QuizQuestion(
      questionHi: '"Always be nice to people." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'लोगों से दूर रहो।',
        'लोगों को देखो।',
        'हमेशा लोगों के लिए अच्छे बनो।',
        'लोगों से बात करो।'
      ],
      correctIndex: 2,
      explanation: '"Always be nice to" = हमेशा...के लिए अच्छे बनो।',
    ),
    QuizQuestion(
      questionHi: '"Let God decide what we achieve in life." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'भगवान के पास जाओ।',
        'भगवान को फैसला करने दो कि हमें जीवन में क्या मिले।',
        'भगवान से माँगो।',
        'जीवन में कुछ मत करो।'
      ],
      correctIndex: 1,
      explanation: '"Let + subject + Verb" = subject को करने दो।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t misbehave with others." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'दूसरों से दोस्ती करो।',
        'किसी के साथ गलत व्यवहार मत करो।',
        'दूसरों की मदद करो।',
        'व्यवहार सीखो।'
      ],
      correctIndex: 1,
      explanation: '"Misbehave" = गलत/बुरा व्यवहार करना।',
    ),
    QuizQuestion(
      questionHi: '"Have a little food with me." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मेरा खाना खा लो।',
        'मेरे साथ थोड़ा खाना खा लो।',
        'थोड़ा पानी पीलो।',
        'खाना बनाओ।'
      ],
      correctIndex: 1,
      explanation: '"Have a little" = थोड़ा खाना/पीना।',
    ),
    QuizQuestion(
      questionHi: '"Wash the utensils." — हिंदी?',
      questionEn: 'Hindi meaning of "Wash the utensils."?',
      options: ['बर्तन खरीदो।', 'बर्तन तोड़ो।', 'बर्तन धोओ।', 'बर्तन रखो।'],
      correctIndex: 2,
      explanation: '"Utensils" = बर्तन। "Wash" = धोना।',
    ),
    QuizQuestion(
      questionHi: '"Kindly do the needful." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'जरूरी काम मत करो।',
        'कृपया ये कर दीजिए।',
        'जरूरत पड़ने पर बताओ।',
        'कृपया बैठिए।'
      ],
      correctIndex: 1,
      explanation: '"Do the needful" = जो जरूरी हो वो कर देना।',
    ),
    QuizQuestion(
      questionHi: '"Come to the point." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'यहाँ आओ।',
        'मुद्दे पर आइए।',
        'बात करो।',
        'बिंदु देखो।'
      ],
      correctIndex: 1,
      explanation: '"Come to the point" = मुद्दे पर आना (stop beating around the bush).',
    ),
  ];

  // ─── L7: Chapter Final Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'Imperative Sentence का formula क्या है?',
      questionEn: 'Basic formula for Imperative Sentence?',
      options: [
        'Subject + Verb + Object',
        'Verb 1st form + Object',
        'Helping Verb + Subject + Verb',
        'Was/Were + Verb+ing'
      ],
      correctIndex: 1,
      explanation: 'Imperative = Verb 1st form + Object. Subject "you" is hidden.',
    ),
    QuizQuestion(
      questionHi: '"Always speak the truth." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'सच मत बोलो।',
        'कभी सच मत बोलो।',
        'हमेशा सच बोलो।',
        'कभी-कभी सच बोलो।'
      ],
      correctIndex: 2,
      explanation: '"Always" + Verb = हमेशा करो।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t scold Bobby." — formula?',
      questionEn: '"Don\'t scold Bobby." — formula?',
      options: [
        'Never + Verb',
        'Don\'t + Verb 1st form + Object',
        'Please + Verb',
        'Let + Verb'
      ],
      correctIndex: 1,
      explanation: '"Don\'t + Verb 1st form + Object" = मत करो।',
    ),
    QuizQuestion(
      questionHi: '"पापा को मत जाने दो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Let dad go.',
        'Don\'t let dad go. / Let dad not go.',
        'Never let dad.',
        'Please don\'t let dad.'
      ],
      correctIndex: 1,
      explanation: '"Don\'t let + subject + Verb" OR "Let + subject + not + Verb".',
    ),
    QuizQuestion(
      questionHi: '"Do eat the food." — इसका क्या अर्थ है?',
      questionEn: '"Do eat the food." — meaning?',
      options: [
        'खाना मत खाओ।',
        'खाना खाओ।',
        'जरूर खाना खाओ (emphasis)',
        'क्या तुम खाना खाते हो?'
      ],
      correctIndex: 2,
      explanation: '"Do + Verb" in Imperative = emphasis/definitely → जरूर खाओ।',
    ),
    QuizQuestion(
      questionHi: '"Never bother the poor." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'गरीबों की मदद करो।',
        'गरीबों को कभी मत सताओ।',
        'हमेशा गरीबों से मिलो।',
        'गरीबों के पास जाओ।'
      ],
      correctIndex: 1,
      explanation: '"Never" + Verb = कभी मत करो।',
    ),
    QuizQuestion(
      questionHi: '"Kindly bolt the door." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'दरवाजा खोलो।',
        'दरवाजा तोड़ो।',
        'कृपया दरवाजे की कुंडी लगा दो।',
        'दरवाजे के पास जाओ।'
      ],
      correctIndex: 2,
      explanation: '"Kindly" = कृपया। "Bolt" = कुंडी लगाना।',
    ),
    QuizQuestion(
      questionHi: '"Let me wring all the clothes." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'सभी कपड़े धोने दो।',
        'मुझे सभी कपड़े निचोड़ने दो।',
        'कपड़े मत निचोड़ो।',
        'कपड़े सुखाने दो।'
      ],
      correctIndex: 1,
      explanation: '"Wring" = निचोड़ना। "Let me + Verb" = मुझे करने दो।',
    ),
    QuizQuestion(
      questionHi: '"Mind your own business." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'व्यापार शुरू करो।',
        'सोचो मत।',
        'अपने काम से काम रखो।',
        'काम बंद करो।'
      ],
      correctIndex: 2,
      explanation: '"Mind your own business" = अपने काम से काम रखो।',
    ),
    QuizQuestion(
      questionHi: '"Sink the differences." — हिंदी?',
      questionEn: 'Hindi meaning of "Sink the differences."?',
      options: [
        'अंतर देखो।',
        'डूब जाओ।',
        'अपने मन मुटाव दूर करो।',
        'फर्क मत करो।'
      ],
      correctIndex: 2,
      explanation: '"Sink the differences" = मन-मुटाव दूर करना / भेद मिटाना।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  /// Imperative rules table
  static const List<Map<String, String>> rulesData = [
    {
      'rule': 'Do (करो)',
      'hindi': 'अगर वाक्य में कुछ करने को कहा गया हो।',
      'formula': 'Verb 1st form + Object',
      'example1hi': 'राम के साथ जाओ।',
      'example1en': 'Go with Ram.',
      'example2hi': 'पार्क में आओ।',
      'example2en': 'Come to the park.',
      'emoji': '👉',
    },
    {
      'rule': 'Please/Kindly Do (कृपया करो)',
      'hindi': 'अगर अनुरोध (request) करते हुए कहा जाए।',
      'formula': 'Please/Kindly + Verb 1st form + Object',
      'example1hi': 'प्लीज बच्चों से मिलें।',
      'example1en': 'Please meet the children.',
      'example2hi': 'प्लीज मुझे बताओ।',
      'example2en': 'Kindly tell me.',
      'emoji': '🙏',
    },
    {
      'rule': 'Always Do (हमेशा करो)',
      'hindi': 'अगर वाक्य में कुछ हमेशा करने को कहा गया हो।',
      'formula': 'Always + Verb 1st form + Object',
      'example1hi': 'हमेशा सच बोलें।',
      'example1en': 'Always speak the truth.',
      'example2hi': 'हमेशा बड़ों को इज्जत दो।',
      'example2en': 'Always respect elders.',
      'emoji': '🔁',
    },
    {
      'rule': 'Don\'t (मत करो)',
      'hindi': 'अगर वाक्य में कुछ करने को मना किया गया हो।',
      'formula': 'Don\'t + Verb 1st form + Object',
      'example1hi': 'झूठ मत बोलो।',
      'example1en': 'Don\'t tell a lie.',
      'example2hi': 'बॉबी को मत डाँटो।',
      'example2en': 'Don\'t scold Bobby.',
      'emoji': '🚫',
    },
    {
      'rule': 'Never Do (कभी मत करो)',
      'hindi': 'अगर कुछ कभी न करने को कहा गया हो।',
      'formula': 'Never + Verb 1st form + Object',
      'example1hi': 'गरीबों को कभी मत सताओ।',
      'example1en': 'Never bother the poor.',
      'example2hi': 'कभी झूठ मत बोलो।',
      'example2en': 'Never tell a lie.',
      'emoji': '❌',
    },
  ];

  /// Let examples
  static const List<Map<String, String>> letExamples = [
    {'hindi': 'मुझे जाने दो।', 'english': 'Let me go.'},
    {'hindi': 'रोहित को खेलने दो।', 'english': 'Let Rohit play.'},
    {'hindi': 'बच्चों को पार्क जाने दो।', 'english': 'Let children go to park.'},
    {'hindi': 'उसे मत आने दो।', 'english': 'Don\'t let him come. / Let him not come.'},
    {'hindi': 'पापा को मत जाने दो।', 'english': 'Don\'t let dad go. / Let dad not go.'},
  ];

  /// Quotations
  static const List<Map<String, String>> quotations = [
    {
      'english': 'In theory, there is no difference between theory and practice. But in practice, there is.',
      'hindi': 'सिद्धांत में, सिद्धांत और अभ्यास में कोई अंतर नहीं है। पर व्यवहार में, है।',
    },
    {
      'english': 'I find that the harder I work, the more luck I seem to have.',
      'hindi': 'मुझे लगता है कि जितना कठिन मैं काम करता हूँ, उतना ही ज़्यादा मुझे भाग्य मिलता है।',
    },
    {
      'english': 'Each problem that I solved became a rule which served afterwards to solve other problems.',
      'hindi': 'हर समस्या जो मैंने सुलझाई, एक नियम बन गई जो बाद में अन्य समस्याएं सुलझाने में काम आई।',
    },
    {
      'english': 'Luck is something you are born with; but destiny is something you make yourself.',
      'hindi': 'किस्मत वो चीज है जो आपको जन्म से मिलती है; पर नियति वो है जो आप खुद बनाते हैं।',
    },
    {
      'english': 'Live every moment to the fullest; who knows what will happen tomorrow.',
      'hindi': 'हर पल को पूरी तरह जियो; कौन जानता है कल क्या होगा।',
    },
    {
      'english': 'Live as if you were to die tomorrow. Learn as if you were to live forever.',
      'hindi': 'ऐसे जियो जैसे कल मरना हो। ऐसे सीखो जैसे हमेशा जीना हो।',
      'author': 'Mahatma Gandhi',
    },
    {
      'english': 'Don\'t be afraid to give up the good to go for the great.',
      'hindi': 'महान पाने के लिए अच्छे को छोड़ने से मत डरो।',
    },
    {
      'english': 'No masterpiece was ever created without efforts.',
      'hindi': 'कोई भी कृति बिना प्रयास के नहीं बनी।',
    },
    {
      'english': 'Thinking should become your capital asset, no matter whatever ups and downs you come across in your life.',
      'hindi': 'सोचना आपकी पूँजी होनी चाहिए, चाहे जीवन में कितने भी उतार-चढ़ाव आएं।',
    },
    {
      'english': 'Winners are those who learn from their failures.',
      'hindi': 'विजेता वे होते हैं जो अपनी असफलताओं से सीखते हैं।',
    },
    {
      'english': 'You are never too old to dream a new dream.',
      'hindi': 'आप कभी इतने बूढ़े नहीं होते कि कोई नया सपना न देख सकें।',
    },
    {
      'english': 'A successful person is one who can lay a firm foundation with the stones thrown at him by others.',
      'hindi': 'एक सफल व्यक्ति वो है जो दूसरों के फेंके पत्थरों से मजबूत नींव बना सके।',
    },
    {
      'english': 'A machine can replace an ordinary man but no machine can replace an extraordinary man.',
      'hindi': 'एक मशीन साधारण व्यक्ति की जगह ले सकती है, पर कोई मशीन असाधारण व्यक्ति की जगह नहीं ले सकती।',
    },
  ];

  // ─── Practice Exercise — 95 sentences ────────────────────────────────────
  static const List<Map<String, String>> practiceSet1 = [
    {'hindi': '1. मेरे साथ रहो।', 'english': 'Be with me.'},
    {'hindi': '2. अपने दोस्तों से बात करो।', 'english': 'Talk to your friends.'},
    {'hindi': '3. किसी दोस्त को मत छोड़ो।', 'english': 'Don\'t leave any friend.'},
    {'hindi': '4. मेरे बारे में सोचो।', 'english': 'Think about me.'},
    {'hindi': '5. मुझे तुम्हें कुछ बताने दो।', 'english': 'Let me tell you something.'},
    {'hindi': '6. इस परेशानी का हल निकालो।', 'english': 'Find out the solution of this problem.'},
    {'hindi': '7. मुझे देखने दो।', 'english': 'Let me see.'},
    {'hindi': '8. नाक साफ करो।', 'english': 'Blow the nose.'},
    {'hindi': '9. कभी–कभी घर आया करो।', 'english': 'Come home sometimes.'},
    {'hindi': '10. उसे एक इन्च भी मत हिलने दो।', 'english': 'Don\'t let him move even an inch.'},
    {'hindi': '11. हमेशा समय के पाबंद हो।', 'english': 'Always be punctual.'},
    {'hindi': '12. ऐसे चालाक आदमी से सावधान रहो।', 'english': 'Beware of such a clever man.'},
    {'hindi': '13. अपनी कमीज के बटन बन्द करो।', 'english': 'Button up your shirt.'},
    {'hindi': '14. विवेक को उन लोगों से मत मिलने दो।', 'english': 'Don\'t let Vivek meet those people.'},
    {'hindi': '15. कृपया दरवाजे की कुंडी लगा दो।', 'english': 'Kindly bolt the door.'},
    {'hindi': '16. काम से जी मत चुराओ।', 'english': 'Don\'t shirk the work.'},
    {'hindi': '17. उसे ढूँढ़ने दो।', 'english': 'Let me find out/search.'},
    {'hindi': '18. उसे परेशान मत करो।', 'english': 'Don\'t bother her.'},
    {'hindi': '19. अपनी कार यहाँ खड़ी मत करो।', 'english': 'Don\'t park your car here.'},
    {'hindi': '20. उसे ये मत करने दो।', 'english': 'Let him not do this.'},
    {'hindi': '21. कभी–कभी अपने माता–पिता को देखने जाओ।', 'english': 'Sometimes, go to see your parents.'},
    {'hindi': '22. उस लड़के के साथ ठहरो।', 'english': 'Stay with that boy.'},
    {'hindi': '23. गरीबों की मदद करो।', 'english': 'Help the poor.'},
    {'hindi': '24. इस लड़की को यहाँ काम करने दो।', 'english': 'Let this girl work here.'},
    {'hindi': '25. सभी कपड़े प्रेस (इस्त्री) कर दो।', 'english': 'Iron all the clothes.'},
  ];

  static const List<Map<String, String>> practiceSet2 = [
    {'hindi': '26. जिम्मेदारियों से जी मत चुराओ।', 'english': 'Don\'t shirk responsibilities.'},
    {'hindi': '27. बाल बना लो।', 'english': 'Comb the hair.'},
    {'hindi': '28. उन्हें जाने दो।', 'english': 'Let them go.'},
    {'hindi': '29. थोड़ा पानी और मिला लो।', 'english': 'Add a little more water.'},
    {'hindi': '30. कृपया नमक पास करो।', 'english': 'Pass the salt please.'},
    {'hindi': '31. समय देखो।', 'english': 'Look at the time.'},
    {'hindi': '32. यहाँ मत उतरो।', 'english': 'Don\'t get off here.'},
    {'hindi': '33. हमें पढ़ने दो क्योंकि कल हमारा पेपर है।', 'english': 'Let us study as it is our paper tomorrow.'},
    {'hindi': '34. मोमबत्ती बुझा दो।', 'english': 'Blow out the candle.'},
    {'hindi': '35. सब को प्यार करो जो कोई तुम्हारी जिन्दगी में आये।', 'english': 'Love everyone whoever comes in your life.'},
    {'hindi': '36. अपना हिसाब कर लो।', 'english': 'Clear your accounts.'},
    {'hindi': '37. नीले पेन से मत लिखिए।', 'english': 'Don\'t write with blue pen.'},
    {'hindi': '38. यहाँ से चले जाओ।', 'english': 'Go away from here.'},
    {'hindi': '39. इस कार से बाहर निकल जाओ।', 'english': 'Get out of this car.'},
    {'hindi': '40. घसीट मत लिखो, साफ–साफ लिखो।', 'english': 'Do not scribble, write legibly.'},
    {'hindi': '41. जल्दी ठीक हो जाइए।', 'english': 'Get well soon.'},
    {'hindi': '42. मुद्दे पर आइए।', 'english': 'Come to the point.'},
    {'hindi': '43. अपने वादे से मत मुकरो।', 'english': 'Do not back out of your promise.'},
    {'hindi': '44. फर्श पर यहाँ वहाँ मत थूको।', 'english': 'Don\'t spit on the floor here and there.'},
    {'hindi': '45. खूब मुस्कुराओ।', 'english': 'Smile a lot.'},
    {'hindi': '46. जल्दी ऑफिस पहुँचो क्योंकि बॉस नाराज है।', 'english': 'Reach office early as boss is angry.'},
    {'hindi': '47. ज्यादा मत खाओ।', 'english': 'Do not overeat.'},
    {'hindi': '48. अपने जूते निकाल लो।', 'english': 'Take off your shoes.'},
    {'hindi': '49. फालतू बात मत करो।', 'english': 'Do not talk nonsense.'},
    {'hindi': '50. टेबल लगा लो।', 'english': 'Lay the table.'},
  ];

  static const List<Map<String, String>> practiceSet3 = [
    {'hindi': '51. बड़ी–बड़ी बातें मत करो।', 'english': 'Do not beat about the bush.'},
    {'hindi': '52. सुई में धागा डाल दो।', 'english': 'Thread the needle.'},
    {'hindi': '53. नंगे पैर मत चलो।', 'english': 'Do not walk bare-footed.'},
    {'hindi': '54. किस्मत पर छोड़ दो।', 'english': 'Leave it to fate.'},
    {'hindi': '55. किसी को दुख मत दो।', 'english': 'Don\'t hurt anybody.'},
    {'hindi': '56. अपने जूते के फीते खोल दो।', 'english': 'Unlace your shoes.'},
    {'hindi': '57. अपने जूते के फीते लगा लो।', 'english': 'Lace your shoes.'},
    {'hindi': '58. अपने नाखून काटो।', 'english': 'Pare your nails.'},
    {'hindi': '59. अपनी हद से ज्यादा खर्च मत करो।', 'english': 'Don\'t spend beyond your limit.'},
    {'hindi': '60. माचिस जला लो।', 'english': 'Strike a match.'},
    {'hindi': '61. वहाँ बिल्कुल खड़े मत होना।', 'english': 'Don\'t stand there at all.'},
    {'hindi': '62. अपना घर समझिए।', 'english': 'Feel at home here.'},
    {'hindi': '63. नल बन्द करो।', 'english': 'Turn off the tap.'},
    {'hindi': '64. नल खोलो।', 'english': 'Turn on the tap.'},
    {'hindi': '65. पहले उसे बोलने दो।', 'english': 'Let him speak first.'},
    {'hindi': '66. कम्प्यूटर ऑफ कर दो।', 'english': 'Shut down the computer.'},
    {'hindi': '67. बाये चलो।', 'english': 'Keep to the left.'},
    {'hindi': '68. दाये चलो।', 'english': 'Keep to the right.'},
    {'hindi': '69. इस मामले को छोड़ दो।', 'english': 'Leave this matter.'},
    {'hindi': '70. मुझे 500 का छुट्टा दो।', 'english': 'Give me change of five hundred.'},
    {'hindi': '71. अपनी अंग्रेजी सुधारो।', 'english': 'Improve your English.'},
    {'hindi': '72. अपने तक रखो ये बात। किसी को भी मत बताना।', 'english': 'Keep it to yourself. Do not tell anyone.'},
    {'hindi': '73. कभी–कभी हमसे मिला करो।', 'english': 'Sometimes, meet us.'},
    {'hindi': '74. इस शब्द को डिक्शनरी में ढूँढ़ो।', 'english': 'Look up this word in the dictionary.'},
    {'hindi': '75. अपनी जुबान पर काबू रखो।', 'english': 'Mind your language.'},
  ];

  static const List<Map<String, String>> practiceSet4 = [
    {'hindi': '76. लाइट बन्द मत करो।', 'english': 'Don\'t switch off the light.'},
    {'hindi': '77. मुझे सामान खोलने दो।', 'english': 'Let me unpack the luggage.'},
    {'hindi': '78. मुझे सामान बाँधने दो।', 'english': 'Let me pack the luggage.'},
    {'hindi': '79. कृपया बिस्तर लगा दो।', 'english': 'Make the bed please.'},
    {'hindi': '80. मुझे ये याद दिलाना।', 'english': 'Remind me of it.'},
    {'hindi': '81. अपने काम से काम रखो।', 'english': 'Mind your own business.'},
    {'hindi': '82. उसे फोन करो।', 'english': 'Call her up.'},
    {'hindi': '83. मुझे उसे फोन करने दो।', 'english': 'Let me call her.'},
    {'hindi': '84. अपने मन मुटाव दूर करो।', 'english': 'Sink the differences.'},
    {'hindi': '85. नींबू निचोड़ दो।', 'english': 'Squeeze the lemon.'},
    {'hindi': '86. उसे मत छोड़ो।', 'english': 'Don\'t touch him.'},
    {'hindi': '87. अपना ख्याल रखना।', 'english': 'Take care of yourself.'},
    {'hindi': '88. उसे पैसे दे दो।', 'english': 'Give him money.'},
    {'hindi': '89. कपड़े निचोड़ लो।', 'english': 'Wring the clothes.'},
    {'hindi': '90. मुझे सभी कपड़े निचोड़ने दो।', 'english': 'Let me wring all the clothes.'},
    {'hindi': '91. 8 बजे का अलार्म लगा दो।', 'english': 'Set the alarm at 8.'},
    {'hindi': '92. मुझे 9 बजे का अलार्म लगाने दो।', 'english': 'Let me set the alarm at 9 o\'clock.'},
    {'hindi': '93. मुझ पर भरोसा रखो।', 'english': 'Trust me.'},
    {'hindi': '94. संतरा छील लो।', 'english': 'Peel off the orange.'},
    {'hindi': '95. दिमाग से खेलो।', 'english': 'Play wisely.'},
  ];

  // ─── Test Paper I — Hindi → English (50 sentences) ───────────────────────
  static const List<Map<String, String>> testPaper1Sentences = [
    {'hindi': '1. समय मत देखो।', 'english': 'Don\'t see the time.'},
    {'hindi': '2. यहाँ से मत जाओ।', 'english': 'Don\'t go from here.'},
    {'hindi': '3. हमें पढ़ने दो क्योंकि परसों हमारा पेपर है।', 'english': 'Let us study as it is our paper day after tomorrow.'},
    {'hindi': '4. मोमबत्ती जला लो।', 'english': 'Light the candle.'},
    {'hindi': '5. नीले पैन से ही लिखो।', 'english': 'Write only with a blue pen.'},
    {'hindi': '6. यहाँ आ जाओ।', 'english': 'Come here.'},
    {'hindi': '7. इस घर से बाहर निकल जाओ।', 'english': 'Go out of this home.'},
    {'hindi': '8. साफ-साफ लिखने की कोशिश करो।', 'english': 'Try to write clearly / legibly.'},
    {'hindi': '9. जल्दी ठीक हो जाओ, हमें बहुत काम करने हैं।', 'english': 'Get well soon, we have lots of work to do.'},
    {'hindi': '10. मुद्दे पर आइए क्योंकि समय बहुत कम है।', 'english': 'Come to the point as we have less time.'},
    {'hindi': '11. अपना वादा मत तोड़ना।', 'english': 'Don\'t back out of your promise.'},
    {'hindi': '12. तुम खूब मुस्कुराओ।', 'english': 'I wish you smile a lot.'},
    {'hindi': '13. जल्दी करो क्योंकि हम लेट हो रहे हैं।', 'english': 'Hurry up as we are getting late.'},
    {'hindi': '14. ज्यादा मत खाओ, पेट फट जायेगा।', 'english': 'Don\'t overeat, stomach might blow up.'},
    {'hindi': '15. जूते पहन लो।', 'english': 'Put on the shoes.'},
    {'hindi': '16. कम्बल ओढ़ लो।', 'english': 'Take a blanket.'},
    {'hindi': '17. कम्बल ओढ़ कर सोओ।', 'english': 'Sleep with a blanket.'},
    {'hindi': '18. फालतू बात मत करो, दिमाग खराब होता है।', 'english': 'Don\'t talk rubbish/nonsense, I am fed up.'},
    {'hindi': '19. बिस्तर लगा लो।', 'english': 'Make the bed.'},
    {'hindi': '20. उसके बारे में बात मत करो।', 'english': 'Don\'t talk about him/her.'},
    {'hindi': '21. कम से कम पैन तो खरीद लो।', 'english': 'At least purchase a pen.'},
    {'hindi': '22. नंगे पैर सड़क पर मत चलो।', 'english': 'Don\'t walk bare footed on the road.'},
    {'hindi': '23. बाकी सब किस्मत पर छोड़ दो।', 'english': 'Leave rest on luck/destiny.'},
    {'hindi': '24. बाकी सब मुझ पर छोड़ दो।', 'english': 'Leave rest on me.'},
    {'hindi': '25. किसी को भी दुख मत दो।', 'english': 'Don\'t hurt anyone.'},
    {'hindi': '26. दिन में कम से कम एक बार नहाया करो।', 'english': 'Take a bath at least once in a day.'},
    {'hindi': '27. अपनी सुख सुविधाओं पर ज्यादा खर्च मत करो।', 'english': 'Don\'t spend a lot on your luxuries.'},
    {'hindi': '28. पैन में इंक डाल लो।', 'english': 'Put the ink into the pen.'},
    {'hindi': '29. बोतलें भर लो। पानी आ रहा है।', 'english': 'Fill the bottles. Water is running.'},
    {'hindi': '30. कार से जल्दी उतरो।', 'english': 'Quickly get off the car.'},
    {'hindi': '31. वहाँ जाने की गलती मत करना।', 'english': 'Don\'t mistake to go there.'},
    {'hindi': '32. मुझे डाक्टर मत समझो। मैं तो चपरासी हूँ।', 'english': 'Don\'t mistake me for the doctor. I am a peon.'},
    {'hindi': '33. लोगों से घुल मिल कर रहा करो।', 'english': 'Mingle with people.'},
    {'hindi': '34. किचन में एक मोमबत्ती का पैकेट रख लो।', 'english': 'Keep a packet of candles in kitchen.'},
    {'hindi': '35. उसकी कहानी मत सुनाओ, मैं पक गया हूँ।', 'english': 'Don\'t tell me his story, I am fed up / bored.'},
    {'hindi': '36. वहाँ बिल्कुल मत जाना, वहाँ कुछ नहीं है।', 'english': 'Don\'t go there at all, there is nothing.'},
    {'hindi': '37. मुझसे मत कहिए, कोई फायदा नहीं।', 'english': 'Don\'t tell me, it is of no use.'},
    {'hindi': '38. दरवाजा बन्द मत करो।', 'english': 'Don\'t shut the door.'},
    {'hindi': '39. थोड़ा सा पानी दे दो।', 'english': 'Give me some water. / Give me a little water.'},
    {'hindi': '40. थोड़ी किताबें रख लो।', 'english': 'Keep a few books.'},
    {'hindi': '41. थोड़ी चाय दे दीजिए।', 'english': 'Give me some/a little tea.'},
    {'hindi': '42. लाइट ऑफ मत करो।', 'english': 'Don\'t turn/switch off the light.'},
    {'hindi': '43. मोबाइल को साइलेंट मोड में रखो।', 'english': 'Keep the mobile in silent mode.'},
    {'hindi': '44. पहले उसे जाने दो।', 'english': 'Let him go first.'},
    {'hindi': '45. कम्प्यूटर ऑन करने की गलती मत करना।', 'english': 'Don\'t mistake to switch on the computer.'},
    {'hindi': '46. मेरे साथ साथ चलो।', 'english': 'Walk with me. / Follow me.'},
    {'hindi': '47. दायी तरफ चलो।', 'english': 'Walk to the right.'},
    {'hindi': '48. मेरा हाथ पकड़ लो।', 'english': 'Hold my hand.'},
    {'hindi': '49. कल्पना करो कि तुम किसी पहाड़ पर हो।', 'english': 'Imagine that/as if you are on a mountain.'},
    {'hindi': '50. अंदाज़ मत लगाओ।', 'english': 'Don\'t guess.'},
  ];

  // ─── Test Paper II — English → Hindi (50 sentences) ──────────────────────
  static const List<Map<String, String>> testPaper2Sentences = [
    {'english': '1. Let me find out what he has.', 'hindi': 'मुझे पता लगाने दो कि उसके पास क्या है।'},
    {'english': '2. Sometimes try to visit him.', 'hindi': 'कभी–कभी उसके यहाँ जाने की कोशिश करो।'},
    {'english': '3. He dropped in to my place.', 'hindi': 'वो मेरे यहाँ टपक गया/आया।'},
    {'english': '4. Always be nice to people.', 'hindi': 'हमेशा लोगों के लिए अच्छे बनो।'},
    {'english': '5. Don\'t do it. You\'ll repent sooner or later.', 'hindi': 'ऐसा मत करो। तुम आज नहीं तो कल पछताओगे।'},
    {'english': '6. Kindly do the needful.', 'hindi': 'कृपया ये कर दीजिए।'},
    {'english': '7. Don\'t lisp.', 'hindi': 'मत तुतलाओ।'},
    {'english': '8. Do it because you are good at it.', 'hindi': 'ये करो क्योंकि तुम ये करने में अच्छे हो।'},
    {'english': '9. Teach them something.', 'hindi': 'उन्हें कुछ पढ़ाओ।'},
    {'english': '10. Look at me.', 'hindi': 'मुझे देखो।'},
    {'english': '11. Have a look at it.', 'hindi': 'इसे देखो।'},
    {'english': '12. Have something.', 'hindi': 'कुछ लो / कुछ खा लो।'},
    {'english': '13. Have a look at this page.', 'hindi': 'इस पेज को देखो।'},
    {'english': '14. Get off the car.', 'hindi': 'कार से उतरो।'},
    {'english': '15. Always behave like a literate.', 'hindi': 'हमेशा पढ़े लिखे इन्सान जैसा व्यवहार करो।'},
    {'english': '16. Don\'t misbehave with others.', 'hindi': 'किसी के साथ गलत व्यवहार मत करो।'},
    {'english': '17. Don\'t defame me.', 'hindi': 'मुझे बदनाम मत करो।'},
    {'english': '18. Never give up.', 'hindi': 'कभी हार मत मानो।'},
    {'english': '19. Switch on the mobile after a while.', 'hindi': 'थोड़ी देर में मोबाइल ऑन कर देना।'},
    {'english': '20. Put on new clothes & take off the old ones.', 'hindi': 'नये कपड़े पहनो, पुराने कपड़े उतार दो।'},
    {'english': '21. Be my friend.', 'hindi': 'मेरे दोस्त बनो।'},
    {'english': '22. Don\'t fool me.', 'hindi': 'मुझे बेवकूफ मत बनाओ।'},
    {'english': '23. Remind me of it tomorrow.', 'hindi': 'मुझे कल इसकी याद दिलाना।'},
    {'english': '24. Love your real ones.', 'hindi': 'अपनों को प्यार करो।'},
    {'english': '25. Don\'t scold that kid.', 'hindi': 'उस बच्चे को मत डाँटो।'},
    {'english': '26. Bear the charges yourself.', 'hindi': 'खर्चा अपने आप उठाओ।'},
    {'english': '27. Don\'t watch such movies.', 'hindi': 'ऐसी फिल्में मत देखा करो।'},
    {'english': '28. Repair it as soon as possible.', 'hindi': 'जितनी जल्दी हो सके इसे रिपेयर/ठीक कर दो।'},
    {'english': '29. Let me purchase something for her.', 'hindi': 'मुझे उसके लिए कुछ खरीदने दो।'},
    {'english': '30. Let me tell you something.', 'hindi': 'मुझे तुम्हें कुछ बताने दो।'},
    {'english': '31. Be regular in gym.', 'hindi': 'जिम हमेशा जाओ।'},
    {'english': '32. Always believe in yourself.', 'hindi': 'हमेशा अपनी काबिलियत पे विश्वास रखो।'},
    {'english': '33. Kindly help the poor.', 'hindi': 'कृपया गरीबों की मदद करो।'},
    {'english': '34. Don\'t rip off the people.', 'hindi': 'लोगों को मत लूटो।'},
    {'english': '35. Do good deed.', 'hindi': 'अच्छे कर्म करो।'},
    {'english': '36. Let his father come.', 'hindi': 'उसके पिता को आने दो।'},
    {'english': '37. Come and play with us.', 'hindi': 'आओ हमारे साथ खेलो।'},
    {'english': '38. Go and meet him.', 'hindi': 'जाओ उससे मिलो।'},
    {'english': '39. Just do it, don\'t think much.', 'hindi': 'बस कर दो, ज्यादा मत सोचो।'},
    {'english': '40. Wash the utensils.', 'hindi': 'बर्तन धोओ।'},
    {'english': '41. Hang this poster on the wall.', 'hindi': 'इस पोस्टर को दीवार पर लटका दो।'},
    {'english': '42. Keep on the right.', 'hindi': 'दायें चलो। / दायीं तरफ रहो।'},
    {'english': '43. Let go.', 'hindi': 'जाने दो।'},
    {'english': '44. Let him try.', 'hindi': 'उसे कोशिश करने दो।'},
    {'english': '45. Count the stars.', 'hindi': 'तारे गिनो।'},
    {'english': '46. Kindly meet me today.', 'hindi': 'प्लीज आज मुझसे मिलो।'},
    {'english': '47. Have at least one burger.', 'hindi': 'कम से कम एक बर्गर तो खाओ।'},
    {'english': '48. Have a little food with me.', 'hindi': 'मेरे साथ थोड़ा खाना खा लो।'},
    {'english': '49. Have some water.', 'hindi': 'थोड़ा पानी पी लो।'},
    {'english': '50. Let God decide what we achieve in life.', 'hindi': 'भगवान को फैसला करने दो कि हमें जीवन में क्या मिले।'},
  ];
}