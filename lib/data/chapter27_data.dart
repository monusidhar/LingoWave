import '../models/lesson_model.dart';

class Chapter27Data {
  static ChapterModel get chapter => ChapterModel(
        id: 27,
        title: 'Special Cases',
        titleHindi: 'विशेष प्रकार के वाक्य',
        description: 'Get sick, Fond of, Meant for, How to & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Get (बीमार हो जाना)',
              titleHindi: 'Get — Falling Sick',
              emoji: '🤒',
              type: LessonType.ch27GetSick,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Fond of & Meant for',
              titleHindi: 'शौकीन होना & बना होना',
              emoji: '❤️',
              type: LessonType.ch27FondMeant,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Made in / of / by',
              titleHindi: 'किसका बना है?',
              emoji: '🏭',
              type: LessonType.ch27MadeInOf,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Able to & How to',
              titleHindi: 'काबिल & जानना',
              emoji: '🧠',
              type: LessonType.ch27AbleHowTo,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'Keep on & Having',
              titleHindi: 'करते रहना & करने के बाद',
              emoji: '🔄',
              type: LessonType.ch27KeepHaving,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 6,
              title: 'ऊँ / Hold / Suggest',
              titleHindi: 'ऊँ Formation, Hold, Suggest',
              emoji: '💭',
              type: LessonType.ch27SpecialMore,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 7,
              title: 'The very / Or so / The one(s)',
              titleHindi: 'यही, एकाद, वो',
              emoji: '🎯',
              type: LessonType.ch27TheVeryOrSo,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 8,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (50 sentences)',
              emoji: '✍️',
              type: LessonType.ch27Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 9,
              title: 'Test Paper',
              titleHindi: 'परीक्षा पत्र (I & II)',
              emoji: '📝',
              type: LessonType.ch27TestPaper,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 10,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch27ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch27GetSick:      return getSickQuestions;
      case LessonType.ch27FondMeant:    return fondMeantQuestions;
      case LessonType.ch27MadeInOf:     return madeInOfQuestions;
      case LessonType.ch27AbleHowTo:    return ableHowToQuestions;
      case LessonType.ch27KeepHaving:   return keepHavingQuestions;
      case LessonType.ch27SpecialMore:  return specialMoreQuestions;
      case LessonType.ch27TheVeryOrSo:  return theVeryOrSoQuestions;
      case LessonType.ch27Practice:     return practiceQuizQuestions;
      case LessonType.ch27TestPaper:    return testPaperQuizQuestions;
      case LessonType.ch27ChapterQuiz:  return chapterFinalQuestions;
      default:                          return getSickQuestions;
    }
  }

  // ─── L1: Get (Sick) ────────────────────────────────────────────────────────
  static const List<QuizQuestion> getSickQuestions = [
    QuizQuestion(
      questionHi: '"मुझे खाँसी हो गई।" — English?',
      questionEn: 'Correct translation?',
      options: ['I have cough.', 'I got cough.', 'I am cough.', 'I made cough.'],
      correctIndex: 1,
      explanation: '"हो जाना" यानि suddenly something happened → Get। I got cough।',
    ),
    QuizQuestion(
      questionHi: '"राम को बुखार हो गया है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram got fever.',
        'Ram has got fever.',
        'Ram is getting fever.',
        'Ram had got fever.',
      ],
      correctIndex: 1,
      explanation: '"हो गया है" = Present Perfect → Ram has got fever।',
    ),
    QuizQuestion(
      questionHi: '"तुम्हें ठंड लग जाएगी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You get cold.',
        'You got cold.',
        'You will get cold.',
        'You have got cold.',
      ],
      correctIndex: 2,
      explanation: '"लग जाएगी" = Future → You will get cold।',
    ),
    QuizQuestion(
      questionHi: '"वो नाराज़ हो गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is angry.',
        'He got angry.',
        'He makes angry.',
        'He was angry.',
      ],
      correctIndex: 1,
      explanation: '"हो गया" = Get (sudden state change) → He got angry।',
    ),
    QuizQuestion(
      questionHi: '"राम भीगा हुआ है। उसे बुखार हो सकता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram is drenched. He may get cold.',
        'Ram is wet. He will get fever.',
        'Ram is drenched. He may get fever.',
        'Ram got wet. He gets cold.',
      ],
      correctIndex: 2,
      explanation: 'भीगा हुआ = drenched। "हो सकता है" = may। He may get fever।',
    ),
  ];

  // ─── L2: Fond of & Meant for ───────────────────────────────────────────────
  static const List<QuizQuestion> fondMeantQuestions = [
    QuizQuestion(
      questionHi: '"राम पढ़ने का शौकीन था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram was fond of read.',
        'Ram was fond of reading.',
        'Ram is fond of reading.',
        'Ram fond of reading.',
      ],
      correctIndex: 1,
      explanation: '"पढ़ना" = verb → fond of + verb + ing। Ram was fond of reading।',
    ),
    QuizQuestion(
      questionHi: '"मैं संगीत का शौकीन हूँ।" — "ing" क्यों नहीं लगेगा?',
      questionEn: 'Why is "ing" NOT added to "music" in "I am fond of music"?',
      options: [
        'क्योंकि subject I है',
        'क्योंकि music कोई verb नहीं है — यह एक noun है',
        'क्योंकि tense present है',
        'क्योंकि fond of गलत है',
      ],
      correctIndex: 1,
      explanation: 'Rule: verb के साथ "ing" लगता है। Music एक noun है, verb नहीं — इसलिए ing नहीं।',
    ),
    QuizQuestion(
      questionHi: '"तुम बिज़नेस करने के लिए बने हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You are meant for business.',
        'You are meant for doing business.',
        'You made for business.',
        'You are fond of business.',
      ],
      correctIndex: 1,
      explanation: '"करने के लिए" → verb + ing। You are meant for doing business।',
    ),
    QuizQuestion(
      questionHi: '"किताब पढ़ने के लिए बनी है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Book is made for reading.',
        'Book is meant for reading.',
        'Book is meant for read.',
        'Book was meant for reading.',
      ],
      correctIndex: 1,
      explanation: '"बनी है" → meant for। पढ़ना = verb → reading। Book is meant for reading।',
    ),
    QuizQuestion(
      questionHi: '"हम एक दूसरे के लिए बने हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'We are fond of each other.',
        'We are meant/made for each other.',
        'We made for each other.',
        'We are meaning for each other.',
      ],
      correctIndex: 1,
      explanation: 'We are meant/made for each other। दोनों correct हैं।',
    ),
  ];

  // ─── L3: Made in / of / by ─────────────────────────────────────────────────
  static const List<QuizQuestion> madeInOfQuestions = [
    QuizQuestion(
      questionHi: '"ये मोबाइल चाईना का है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This mobile is made by China.',
        'This mobile is made of China.',
        'This mobile is made in China.',
        'This mobile is from China.',
      ],
      correctIndex: 2,
      explanation: 'China = देश का नाम (country) → Made in। This mobile is made in China।',
    ),
    QuizQuestion(
      questionHi: '"ये मोबाइल प्लास्टिक का है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This mobile is made in Plastic.',
        'This mobile is made by Plastic.',
        'This mobile is made of Plastic.',
        'This mobile is made with Plastic.',
      ],
      correctIndex: 2,
      explanation: 'Plastic = material → Made of। This mobile is made of Plastic।',
    ),
    QuizQuestion(
      questionHi: '"ये मोबाइल नोकिया का है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This mobile is made of Nokia.',
        'This mobile is made in Nokia.',
        'This mobile is made by Nokia.',
        'Nokia made this mobile in.',
      ],
      correctIndex: 2,
      explanation: 'Nokia = company का नाम → Made by। This mobile is made by Nokia।',
    ),
    QuizQuestion(
      questionHi: '"खिड़कियाँ लकड़ी की बनी हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Windows are made by wood.',
        'Windows are made in wood.',
        'Windows are made of wood.',
        'Windows are made with wood.',
      ],
      correctIndex: 2,
      explanation: 'Wood = material → Made of। Windows are made of wood।',
    ),
    QuizQuestion(
      questionHi: 'Made in / Made of / Made by — सही मिलान?',
      questionEn: 'Correct match for Made in / Made of / Made by?',
      options: [
        'Country / Company / Material',
        'Material / Country / Company',
        'Country / Material / Company',
        'Company / Material / Country',
      ],
      correctIndex: 2,
      explanation: 'Made in = Country, Made of = Material, Made by = Company/Person।',
    ),
  ];

  // ─── L4: Able to & How to ──────────────────────────────────────────────────
  static const List<QuizQuestion> ableHowToQuestions = [
    QuizQuestion(
      questionHi: '"मैं ये काम करने के काबिल हूँ।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I can able to do this work.',
        'I am able to do this work.',
        'I able to do this work.',
        'I am able doing this work.',
      ],
      correctIndex: 1,
      explanation: 'Able to + V1। I am able to do this work।',
    ),
    QuizQuestion(
      questionHi: '"मैं नाचना जानता हूँ।" — Best English?',
      questionEn: 'Best translation?',
      options: [
        'I know dancing.',
        'I know how to dance.',
        'I know dance.',
        'I am able to dance.',
      ],
      correctIndex: 1,
      explanation: '"जानना" के साथ "How to + V1" सबसे अच्छा तरीका है। I know how to dance।',
    ),
    QuizQuestion(
      questionHi: '"राम कार चलाना जानता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram knows how to driving a car.',
        'Ram knows how to drive a car.',
        'Ram knows to drive a car.',
        'Ram is able how to drive.',
      ],
      correctIndex: 1,
      explanation: 'How to + V1 (bare infinitive)। Ram knows how to drive a car।',
    ),
    QuizQuestion(
      questionHi: '"राम बाइक चलाना नहीं जानता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram doesn\'t know how to ride a bike.',
        'Ram knows not how to ride a bike.',
        'Ram didn\'t know how to ride a bike.',
        'Ram is not able how to ride.',
      ],
      correctIndex: 0,
      explanation: 'Negative: doesn\'t know। Ram doesn\'t know how to ride a bike।',
    ),
    QuizQuestion(
      questionHi: '"क्या तुम इस बिज़नेस को सँभालने के काबिल हो?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Can you handle this business?',
        'Are you able to handle this business?',
        'Are you able handling this business?',
        'Do you able to handle this business?',
      ],
      correctIndex: 1,
      explanation: 'Are + you + able to + V1? Are you able to handle this business?',
    ),
  ];

  // ─── L5: Keep on & Having ──────────────────────────────────────────────────
  static const List<QuizQuestion> keepHavingQuestions = [
    QuizQuestion(
      questionHi: '"वो पढ़ता रहता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He keeps reading.',
        'He keeps on reading.',
        'He kept on reading.',
        'He is keeping on reading.',
      ],
      correctIndex: 1,
      explanation: '"करता रहता है" = keeps on + V-ing। He keeps on reading।',
    ),
    QuizQuestion(
      questionHi: '"वो दिन भर खाना बनाता रहा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He keeps on cooking the food for the whole day.',
        'He kept on cooking the food for the whole day.',
        'He was keeping on cooking.',
        'He has kept on cooking.',
      ],
      correctIndex: 1,
      explanation: 'Past: "रहा" → kept on। He kept on cooking the food for the whole day।',
    ),
    QuizQuestion(
      questionHi: '"Having + V3" का प्रयोग कब होता है?',
      questionEn: '"Having + V3" is used when?',
      options: [
        'कोई काम शुरू करने से पहले',
        'कोई काम करने के बाद (After doing something)',
        'कोई काम करते समय',
        'कोई काम न करने पर',
      ],
      correctIndex: 1,
      explanation: '"Having + V3" = After doing something (क्रिया करने के बाद)।',
    ),
    QuizQuestion(
      questionHi: '"तुमसे मिलने के बाद, मैं वहाँ जाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'After meeting you, I will go there.',
        'Having met you, I will go there.',
        'Having meet you, I will go there.',
        'Both A and B are correct.',
      ],
      correctIndex: 3,
      explanation: 'Both are correct! Having + met (V3) या After + meeting। Both acceptable।',
    ),
    QuizQuestion(
      questionHi: '"मैं उसके घर जाता रहूँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will keep going his home.',
        'I will keep on going his home.',
        'I kept on going his home.',
        'I will keep on going to his home.',
      ],
      correctIndex: 3,
      explanation: 'Future: will keep on + V-ing। I will keep on going to his home।',
    ),
  ];

  // ─── L6: ऊँ / Hold / Suggest ──────────────────────────────────────────────
  static const List<QuizQuestion> specialMoreQuestions = [
    QuizQuestion(
      questionHi: '"क्या मैं जाऊँ?" — English?',
      questionEn: 'Correct translation?',
      options: ['Should I go?', 'Do I go?', 'Can I go?', 'Will I go?'],
      correctIndex: 1,
      explanation: '"ऊँ formation" वाले वाक्य interrogative होते हैं। क्या मैं जाऊँ? = Do I go?',
    ),
    QuizQuestion(
      questionHi: '"मैं हँसी नहीं रोक पाया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I couldn\'t stop laughing.',
        'I couldn\'t hold laughing.',
        'I can\'t hold my laugh.',
        'I was unable to laugh.',
      ],
      correctIndex: 1,
      explanation: '"रोक पाना" = Hold। I couldn\'t hold laughing।',
    ),
    QuizQuestion(
      questionHi: '"तुम्हारी फालतू बातों से लगता है कि तुम पागल हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Your nonsense makes that you are mad.',
        'Your nonsense suggests that you are mad.',
        'Your nonsense shows that you are mad.',
        'Your nonsense tells you are mad.',
      ],
      correctIndex: 1,
      explanation: '"लगना" (inferred from behavior) = Suggest। Your nonsense suggests that you are mad।',
    ),
    QuizQuestion(
      questionHi: '"अब मैं क्या करूँ?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Now what should I do?',
        'Now what do I do?',
        'What can I do now?',
        'What will I do now?',
      ],
      correctIndex: 1,
      explanation: '"ऊँ formation" → Do I। What do I do now?',
    ),
    QuizQuestion(
      questionHi: '"राम अपने आँसू नहीं रोक पाया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram couldn\'t hold his tears.',
        'Ram didn\'t hold his tears.',
        'Ram couldn\'t stop his tear.',
        'Ram was unable to hold tear.',
      ],
      correctIndex: 0,
      explanation: 'Hold = रोक पाना। Ram couldn\'t hold his tears।',
    ),
  ];

  // ─── L7: The very / Or so / The one(s) ────────────────────────────────────
  static const List<QuizQuestion> theVeryOrSoQuestions = [
    QuizQuestion(
      questionHi: '"मुझे यही किताब चाहिए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I need this book.',
        'I need the very book.',
        'I need that very book.',
        'I need the same books.',
      ],
      correctIndex: 1,
      explanation: '"यही/वही" = The very। I need the very book।',
    ),
    QuizQuestion(
      questionHi: '"अमन एकाद दिन में आ जायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Aman will come in one day.',
        'Aman will come in a day or so.',
        'Aman will come in a day or two.',
        'Aman will come soon.',
      ],
      correctIndex: 1,
      explanation: '"एकाद" = Or so। Aman will come in a day or so।',
    ),
    QuizQuestion(
      questionHi: '"राम वो है जो मेरे साथ था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram is the ones, who was with me.',
        'Ram is the one, who was with me.',
        'Ram is the very one with me.',
        'Ram is one who was with me.',
      ],
      correctIndex: 1,
      explanation: '"राम" = singular → The one। Ram is the one, who was with me।',
    ),
    QuizQuestion(
      questionHi: '"हम वो हैं जो तुम्हारे साथ थे।" — The one या The ones?',
      questionEn: '"We are the ___ who were with you." — one or ones?',
      options: ['The one', 'The ones', 'The very', 'The same'],
      correctIndex: 1,
      explanation: '"हम" = plural → The ones। We are the ones who were with you।',
    ),
    QuizQuestion(
      questionHi: '"राम वो लड़का है जो मेरे साथ था।" — English?',
      questionEn: 'Correct translation? (Note: "वो लड़का" — noun present)',
      options: [
        'Ram is the one, who was with me.',
        'Ram is the boy, who was with me.',
        'Ram is the very boy, who was with me.',
        'Ram is the same, who was with me.',
      ],
      correctIndex: 1,
      explanation: 'जब "वो" के साथ noun हो (लड़का), तो the one की जगह सिर्फ "the" + noun। Ram is the boy who was with me।',
    ),
  ];

  // ─── L8: Practice Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"राम और सीता एक दूसरे के लिए ही बने हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram & Seeta are fond of each other.',
        'Ram & Seeta are meant for each other.',
        'Ram & Seeta are made by each other.',
        'Ram & Seeta made for each other.',
      ],
      correctIndex: 1,
      explanation: '"के लिए बने हैं" = Meant for। Ram & Seeta are meant for each other।',
    ),
    QuizQuestion(
      questionHi: '"यह पेन भारत में बना है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This pen is made of India.',
        'This pen is made by India.',
        'This pen is made in India.',
        'This pen made in India.',
      ],
      correctIndex: 2,
      explanation: 'India = country → Made in। This pen is made in India।',
    ),
    QuizQuestion(
      questionHi: '"मैं दिन भर खेलता रहता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I used to keep on playing throughout the day.',
        'I kept on playing throughout the day.',
        'I was keeping on playing.',
        'I used to play throughout the day.',
      ],
      correctIndex: 0,
      explanation: '"रहता था" = used to keep on + V-ing। I used to keep on playing throughout the day।',
    ),
    QuizQuestion(
      questionHi: '"मैं वो नहीं जिसने तुम्हारे भाई को डाँटा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am not the ones who scolded your brother.',
        'I am not the one who scolded your brother.',
        'I am not the very who scolded your brother.',
        'I was not the one who scolded your brother.',
      ],
      correctIndex: 1,
      explanation: '"मैं" = singular → The one। I am not the one who scolded your brother।',
    ),
    QuizQuestion(
      questionHi: '"मम्मी एकाद साल में ठीक हो जायेगी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Mom will be fine in one year.',
        'Mom will be fine in a year or so.',
        'Mom will be fine in years or so.',
        'Mom will be fine or so.',
      ],
      correctIndex: 1,
      explanation: '"एकाद साल में" = in a year or so।',
    ),
    QuizQuestion(
      questionHi: '"बच्चे को ठंड लग गयी थी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Child has got cold.',
        'Child got cold.',
        'Child had got cold.',
        'Child gets cold.',
      ],
      correctIndex: 2,
      explanation: '"लग गयी थी" = Past Perfect → Child had got cold।',
    ),
    QuizQuestion(
      questionHi: '"खाना खाने के बाद मुझे जाना था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Having eaten the food, I had to go.',
        'Having eat the food, I had to go.',
        'Having eating the food, I had to go.',
        'After food, I had to go.',
      ],
      correctIndex: 0,
      explanation: 'Having + V3 (eaten)। Having eaten the food, I had to go।',
    ),
    QuizQuestion(
      questionHi: '"तुम्हारी आवाज़ से लगता है कि तुम्हें खाँसी है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Your voice shows you are suffering from cough.',
        'Your voice suggests you are suffering from cough.',
        'Your voice tells you have cough.',
        'Your voice means you have cough.',
      ],
      correctIndex: 1,
      explanation: '"लगता है" (from behavior) = Suggests। Your voice suggests you are suffering from cough।',
    ),
  ];

  // ─── L9: Test Paper Quiz ───────────────────────────────────────────────────
  static const List<QuizQuestion> testPaperQuizQuestions = [
    QuizQuestion(
      questionHi: '"Sachin was fond of playing Cricket." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'सचिन क्रिकेट देखने का शौकीन था।',
        'सचिन क्रिकेट खेलने का शौकीन था।',
        'सचिन को क्रिकेट पसंद था।',
        'सचिन क्रिकेट खेलता था।',
      ],
      correctIndex: 1,
      explanation: 'Fond of + playing (V-ing)। सचिन क्रिकेट खेलने का शौकीन था।',
    ),
    QuizQuestion(
      questionHi: '"You keep on irritating me." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम मुझे एक बार परेशान करते हो।',
        'तुम मुझे परेशान करते रहते हो।',
        'तुम मुझे परेशान कर चुके हो।',
        'तुम मुझे परेशान करोगे।',
      ],
      correctIndex: 1,
      explanation: 'Keep on + V-ing = करते रहते हो। तुम मुझे परेशान करते रहते हो।',
    ),
    QuizQuestion(
      questionHi: '"Having met your friends, I can guess why you don\'t study." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम्हारे दोस्तों को देखकर मैंने सोचा।',
        'तुम्हारे दोस्तों से मिलने के बाद, मैं अंदाजा लगा सकता हूँ।',
        'तुम्हारे दोस्त पढ़ाई नहीं करते।',
        'मैं तुम्हारे दोस्तों से मिला और मुझे गुस्सा आया।',
      ],
      correctIndex: 1,
      explanation: 'Having met = मिलने के बाद। I can guess = अंदाजा लगा सकता हूँ।',
    ),
    QuizQuestion(
      questionHi: '"तुम्हारी बातों से लगता है कि तुम ज्यादा सोचते हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Your talks show, you think a lot.',
        'Your talks suggest, you think a lot.',
        'Your talks tell, you think a lot.',
        'Your talks mean, you think a lot.',
      ],
      correctIndex: 1,
      explanation: '"लगना" = Suggest। Your talks suggest, you think a lot।',
    ),
    QuizQuestion(
      questionHi: '"सीता वही लड़की तो है जो उस दिन आयी थी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Seeta is the one who had come the other day.',
        'Seeta is the very girl who had come the other day.',
        'Seeta is the same girl who had come.',
        'Both B and C',
      ],
      correctIndex: 3,
      explanation: '"वही लड़की" — noun present → "the very girl" OR "the same girl"। Both B and C correct।',
    ),
    QuizQuestion(
      questionHi: '"मैं सिर्फ तुम्हारे लिए ही बना हूँ।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am fond of only you.',
        'I am meant only for you.',
        'I made only for you.',
        'I am able only for you.',
      ],
      correctIndex: 1,
      explanation: '"के लिए बना हूँ" = Meant for। I am meant only for you।',
    ),
    QuizQuestion(
      questionHi: '"हमें सर्दी लग गयी थी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'We had got cold.',
        'We got cold.',
        'We have got cold.',
        'We will get cold.',
      ],
      correctIndex: 0,
      explanation: '"लग गयी थी" = Past Perfect → We had got cold।',
    ),
    QuizQuestion(
      questionHi: '"मैं खुद को नहीं रोक सकता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I can\'t stop myself.',
        'I can\'t hold myself.',
        'Both A and B',
        'I couldn\'t hold myself.',
      ],
      correctIndex: 2,
      explanation: '"रोक पाना" = Hold। Both "stop" and "hold" work here।',
    ),
  ];

  // ─── L10: Chapter Final Quiz ───────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: '"मुझे परेशानी हो गई।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am annoyed.',
        'I got annoyed.',
        'I make annoyed.',
        'I was annoying.',
      ],
      correctIndex: 1,
      explanation: '"हो जाना" = Get (sudden change)। I got annoyed।',
    ),
    QuizQuestion(
      questionHi: '"Fond of" के बाद verb आए तो क्या होगा?',
      questionEn: 'If a verb comes after "Fond of", what form is used?',
      options: ['V1', 'V2', 'V3', 'V + ing'],
      correctIndex: 3,
      explanation: 'Fond of + verb → verb + ing। जैसे: fond of playing, fond of reading।',
    ),
    QuizQuestion(
      questionHi: '"ये मूर्ति सोने की है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This idol is made by Gold.',
        'This idol is made in Gold.',
        'This idol is made of Gold.',
        'This idol is from Gold.',
      ],
      correctIndex: 2,
      explanation: 'Gold = material → Made of। This idol is made of Gold।',
    ),
    QuizQuestion(
      questionHi: '"मैं अंग्रेज़ी बोलना जानता हूँ।" — English?',
      questionEn: 'Best translation?',
      options: [
        'I know speaking English.',
        'I know how to speak English.',
        'I can speak English.',
        'Both B and C',
      ],
      correctIndex: 3,
      explanation: 'Both "I know how to speak English" और "I can speak English" correct हैं।',
    ),
    QuizQuestion(
      questionHi: '"बच्चे खेलते रहते हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Children keep playing.',
        'Children keep on playing.',
        'Children kept on playing.',
        'Children are keeping on playing.',
      ],
      correctIndex: 1,
      explanation: 'Keep on + V-ing (present)। Children keep on playing।',
    ),
    QuizQuestion(
      questionHi: '"पापा से अनुमति लेने के बाद, मैं घर से निकल गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Having take permission from dad, I left home.',
        'Having taken permission from dad, I left home.',
        'Having taking permission from dad, I left home.',
        'After taken permission from dad, I left home.',
      ],
      correctIndex: 1,
      explanation: 'Having + V3 (taken)। Having taken permission from dad, I left home।',
    ),
    QuizQuestion(
      questionHi: '"दिल को कैसे मनाऊँ?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'How should I convince my heart?',
        'How do I convince my heart?',
        'How can I convince my heart?',
        'How will I convince my heart?',
      ],
      correctIndex: 1,
      explanation: '"ऊँ formation" = Do I। How do I convince my heart?',
    ),
    QuizQuestion(
      questionHi: '"माता पिता वो हैं जिनके बिना जिन्दगी अधूरी है।" — The one या The ones?',
      questionEn: 'Mom & Dad are the ___ without whom life is incomplete.',
      options: ['The one', 'The ones', 'The very', 'The same'],
      correctIndex: 1,
      explanation: '"माता पिता" = दो लोग = plural → The ones। Mom & Dad are the ones without whom life is incomplete।',
    ),
    QuizQuestion(
      questionHi: '"मैं एकाद बार उसके घर गया था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I had gone to his home once.',
        'I had gone to his home once or so.',
        'I went to his home once or so.',
        'I have gone to his home or so.',
      ],
      correctIndex: 1,
      explanation: '"एकाद बार" = once or so। I had gone to his home once or so।',
    ),
    QuizQuestion(
      questionHi: '"उसके चलने के तरीके से लगता है कि वो कोई मॉडल है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Her way of walking shows that she is a model.',
        'Her way of walking suggests that she is a model.',
        'Her way of walking tells that she is a model.',
        'Her way of walking makes that she is a model.',
      ],
      correctIndex: 1,
      explanation: '"लगना" (inferred) = Suggests। Her way of walking suggests that she is a model।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> getSickExamples = [
    {'hindi': 'मुझे खाँसी हो गई।', 'english': 'I got cough.', 'tense': 'Past'},
    {'hindi': 'राम को बुखार हो गया है।', 'english': 'Ram has got fever.', 'tense': 'Present Perfect'},
    {'hindi': 'जब भी पापा डाँटते हैं, तुम्हें बुखार हो जाता है।', 'english': 'Whenever dad scolds you, you get fever.', 'tense': 'Present'},
    {'hindi': 'उसे टीबी हो गया था।', 'english': 'He had got TB.', 'tense': 'Past Perfect'},
    {'hindi': 'ठंडा पानी मत पियो, तुम्हें ठंड लग जाएगी।', 'english': 'Don\'t drink cold water, you will get cold.', 'tense': 'Future'},
    {'hindi': 'राम भीगा हुआ है। उसे बुखार हो सकता है।', 'english': 'Ram is drenched. He may get fever.', 'tense': 'Modal'},
  ];

  static const List<Map<String, String>> fondExamples = [
    {'hindi': 'मैं संगीत का शौकीन हूँ।', 'english': 'I am fond of music.', 'note': 'Noun — no ing'},
    {'hindi': 'तुम इसके शौकीन क्यों हो?', 'english': 'Why are you fond of it?', 'note': 'Pronoun — no ing'},
    {'hindi': 'राम पढ़ने का शौकीन था।', 'english': 'Ram was fond of reading.', 'note': 'Verb → +ing'},
    {'hindi': 'ये लड़का खेलने का शौकीन है।', 'english': 'This boy is fond of playing.', 'note': 'Verb → +ing'},
    {'hindi': 'मैं क्रिकेट का शौकीन हूँ।', 'english': 'I am fond of cricket.', 'note': 'Noun — no ing'},
    {'hindi': 'मैं क्रिकेट खेलने का शौकीन हूँ।', 'english': 'I am fond of playing cricket.', 'note': 'Verb → +ing'},
  ];

  static const List<Map<String, String>> meantForExamples = [
    {'hindi': 'तुम बिज़नेस के लिए बने हो।', 'english': 'You are meant for business.', 'note': 'Noun'},
    {'hindi': 'तुम बिज़नेस करने के लिए बने हो।', 'english': 'You are meant for doing business.', 'note': 'Verb → +ing'},
    {'hindi': 'तुम सिर्फ मेरे लिए बने हो।', 'english': 'You are only meant for me.', 'note': 'Pronoun'},
    {'hindi': 'हम एक दूसरे के लिए बने हैं।', 'english': 'We are meant/made for each other.', 'note': 'Both OK'},
    {'hindi': 'किताब पढ़ने के लिए बनी है।', 'english': 'Book is meant for reading.', 'note': 'Verb → +ing'},
    {'hindi': 'अध्यापक पढ़ाने के लिए बने हैं।', 'english': 'Teachers are meant for teaching.', 'note': 'Verb → +ing'},
  ];

  static const List<Map<String, String>> madeInOfByExamples = [
    {'hindi': 'ये मोबाइल चाईना का है।', 'english': 'This mobile is made in China.', 'type': 'Made in (Country)'},
    {'hindi': 'ये मोबाइल प्लास्टिक का है।', 'english': 'This mobile is made of Plastic.', 'type': 'Made of (Material)'},
    {'hindi': 'ये मोबाइल नोकिया का है।', 'english': 'This mobile is made by Nokia.', 'type': 'Made by (Company)'},
    {'hindi': 'ये मूर्ति सोने की है।', 'english': 'This idol is made of Gold.', 'type': 'Made of (Material)'},
    {'hindi': 'गूगल माईक्रोसाफ्ट ने बनाया है।', 'english': 'Google is made by Microsoft.', 'type': 'Made by (Company)'},
    {'hindi': 'यह वेबसाइट मैंने बनाई है।', 'english': 'This website is made by me.', 'type': 'Made by (Person)'},
  ];

  static const List<Map<String, String>> howToExamples = [
    {'hindi': 'मैं नाचना जानता हूँ।', 'english': 'I know how to dance.'},
    {'hindi': 'मैं नाचना नहीं जानता हूँ।', 'english': 'I don\'t know how to dance.'},
    {'hindi': 'राम क्रिकेट खेलना जानता है।', 'english': 'Ram knows how to play cricket.'},
    {'hindi': 'क्या वो खेलना जानता था?', 'english': 'Did he know how to play?'},
    {'hindi': 'मैं पंजाबी बोलना जानता हूँ।', 'english': 'I know how to speak Punjabi.'},
    {'hindi': 'राम कार चलाना जानता है।', 'english': 'Ram knows how to drive a car.'},
    {'hindi': 'राम बाइक चलाना नहीं जानता।', 'english': 'Ram doesn\'t know how to ride a bike.'},
  ];

  static const List<Map<String, String>> keepOnExamples = [
    {'hindi': 'वो पढ़ता रहता है।', 'english': 'He keeps on reading.'},
    {'hindi': 'लोग लड़ते रहते हैं।', 'english': 'People keep on fighting.'},
    {'hindi': 'मैं उसके घर जाता रहूँगा।', 'english': 'I will keep on going to his home.'},
    {'hindi': 'बच्चे खेलते रहते हैं।', 'english': 'Children keep on playing.'},
    {'hindi': 'राम 24 घंटे पढ़ता रहता है।', 'english': 'Ram keeps on studying 24 hours.'},
    {'hindi': 'वो दिन भर खाना बनाता रहा।', 'english': 'He kept on cooking the food for the whole day.'},
    {'hindi': 'हम चलते रहे।', 'english': 'We kept on walking.'},
    {'hindi': 'वो सोता रहा।', 'english': 'He kept on sleeping.'},
  ];

  static const List<Map<String, String>> havingExamples = [
    {'hindi': 'तुमसे मिलने के बाद, मैं वहाँ जाऊँगा।', 'english': 'Having met you, I will go there.'},
    {'hindi': 'राम के साथ खाना खाने के बाद, मैंने पूछा।', 'english': 'Having eaten the food with Ram, I asked.'},
    {'hindi': 'ये देखने के बाद, मैं वहाँ जाने की हिम्मत नहीं कर सकता।', 'english': 'Having seen this, I can\'t dare to go there.'},
    {'hindi': 'पापा से अनुमति लेने के बाद, मैं घर से निकल गया।', 'english': 'Having taken permission from dad, I left home.'},
    {'hindi': 'तुम्हें पाने के बाद मानो सारे ख्वाब पूरे हो गये।', 'english': 'Having found you, as if all dreams came true.'},
  ];

  static const List<Map<String, String>> oonFormationExamples = [
    {'hindi': 'क्या मैं जाऊँ?', 'english': 'Do I go?'},
    {'hindi': 'मैं कहाँ जाऊँ?', 'english': 'Where do I go?'},
    {'hindi': 'मैं किससे कहूँ?', 'english': 'Who do I say?'},
    {'hindi': 'मैं उससे कैसे मिलूँ?', 'english': 'How do I meet him?'},
    {'hindi': 'अब मैं क्या करूँ?', 'english': 'What do I do now?'},
    {'hindi': 'ये बात अब किसे बताऊँ?', 'english': 'Whom do I tell this now?'},
  ];

  static const List<Map<String, String>> holdExamples = [
    {'hindi': 'मैं हँसी नहीं रोक पाया।', 'english': 'I couldn\'t hold laughing.'},
    {'hindi': 'राम अपने आँसू नहीं रोक पाया।', 'english': 'Ram couldn\'t hold his tears.'},
    {'hindi': 'मैं अपनी भावनाओं पर काबू नहीं कर पाया।', 'english': 'I couldn\'t hold my emotions.'},
    {'hindi': 'मैं हँसी नहीं रोक पाऊँगा।', 'english': 'I won\'t be able to hold laughing.'},
  ];

  static const List<Map<String, String>> suggestExamples = [
    {'hindi': 'तुम्हारी फालतू बातों से लगता है कि तुम पागल हो।', 'english': 'Your nonsense suggests that you are mad.'},
    {'hindi': 'उसके बात करने के तरीके से लगता है कि वो बहुत अमीर है।', 'english': 'His way of talking suggests that he is very rich.'},
    {'hindi': 'उसके चलने के तरीके से लगता है कि वो कोई मॉडल है।', 'english': 'Her way of walking suggests that she is a model.'},
  ];

  static const List<Map<String, String>> theVeryExamples = [
    {'hindi': 'मुझे यही किताब चाहिए।', 'english': 'I need the very book.'},
    {'hindi': 'मुझे यही पेन चाहिए।', 'english': 'I need the very pen.'},
    {'hindi': 'राम वही लड़का है।', 'english': 'Ram is the very boy.'},
  ];

  static const List<Map<String, String>> orSoExamples = [
    {'hindi': 'अमन एकाद दिन में आ जायेगा।', 'english': 'Aman will come in a day or so.'},
    {'hindi': 'राम एकाद साल में अमेरिका जा रहा है।', 'english': 'Ram is going to America in a year or so.'},
    {'hindi': 'मैं एकाद बार उसके घर गया था।', 'english': 'I had gone to his home once or so.'},
    {'hindi': 'पापा एकाद घंटे में पहुँचने वाले हैं।', 'english': 'Dad is about to reach in an hour or so.'},
    {'hindi': 'उसने ये एकाद हफ्ते में किया।', 'english': 'He did it in a week or so.'},
  ];

  // The one(s) examples — singular & plural
  static const List<Map<String, dynamic>> theOneExamples = [
    {'hindi': 'राम वो है जो मेरे साथ था।', 'english': 'Ram is the one, who was with me.', 'singular': true},
    {'hindi': 'हम वो हैं जो तुम्हारे साथ थे।', 'english': 'We are the ones, who were with you.', 'singular': false},
    {'hindi': 'ये वो है जो मैंने तुम्हें गिफ्ट किया था।', 'english': 'This is the one that I had gifted to you.', 'singular': true},
    {'hindi': 'ये वो हैं जो मैंने खरीदे थे।', 'english': 'These are the ones that I had purchased.', 'singular': false},
    {'hindi': 'माता पिता वो हैं जिनके बिना जिन्दगी अधूरी है।', 'english': 'Mom & Dad are the ones, without whom, life is incomplete.', 'singular': false},
  ];

  // The one(s) with noun — use "the" + noun
  static const List<Map<String, String>> theOneWithNounExamples = [
    {'hindi': 'राम वो लड़का है जो मेरे साथ था।', 'english': 'Ram is the boy who was with me.'},
    {'hindi': 'हम वो लोग हैं जो तुम्हारे साथ थे।', 'english': 'We are the people who were with you.'},
    {'hindi': 'ये वो मोबाईल है जो मैंने गिफ्ट किया था।', 'english': 'This is the mobile that I had gifted to you.'},
    {'hindi': 'प्यार वो अहसास है जो अन्दर से महसूस होता है।', 'english': 'Love is the feeling that comes from within.'},
    {'hindi': 'मेरी मम्मी वो औरत हैं जो किसी को परेशानी में नहीं देख सकती।', 'english': 'My mother is the woman, who can\'t see anyone in trouble.'},
  ];

  static const List<Map<String, String>> practiceSentences = [
    {'hindi': '1. आज तुम्हारा चेहरा अच्छा लग रहा है।', 'english': 'Your face is looking good today.'},
    {'hindi': '2. तुम्हें देखने के बाद मुझे अच्छा लगा।', 'english': 'Having seen you, I felt good.'},
    {'hindi': '3. राम और सीता एक दूसरे के लिए ही बने हैं।', 'english': 'Ram & Seeta are meant for each other.'},
    {'hindi': '4. क्या तुम अंग्रेज़ी बोलना जानते हो?', 'english': 'Do you know how to speak in English?'},
    {'hindi': '5. मैं दिन भर खेलता रहता था।', 'english': 'I used to keep on playing throughout the day.'},
    {'hindi': '6. यह पेन भारत में बना है।', 'english': 'This pen is made in India.'},
    {'hindi': '7. तुम जब उसकी हालत देखोगे तो अपने आँसू रोक नहीं पाओगे।', 'english': 'When you will see his plight, you wouldn\'t be able to hold your emotions.'},
    {'hindi': '8. चाहे वो जो करे, मैं साथ दूँगा।', 'english': 'No matter what, I\'ll stand by him.'},
    {'hindi': '9. राम के पास पैसे नहीं हैं, अब राम क्या करे?', 'english': 'Ram doesn\'t have money, what does he do now?'},
    {'hindi': '10. तुम्हारी आवाज़ अच्छी लगी।', 'english': 'Your voice sounded pretty.'},
    {'hindi': '11. यह चश्मा चाईना में बना है।', 'english': 'These spectacles are made in China.'},
    {'hindi': '12. खाना खाने के बाद मुझे जाना था।', 'english': 'Having had food, I had to go.'},
    {'hindi': '13. पैसा खर्च करने के लिए ही होता है।', 'english': 'Money is to spend.'},
    {'hindi': '14. क्या तुम लिखना जानते थे?', 'english': 'Did you know how to write?'},
    {'hindi': '15. मैं रात भर पढ़ता रहा।', 'english': 'I kept on reading whole night.'},
    {'hindi': '16. हम कहाँ सोयें?', 'english': 'Where do we sleep?'},
    {'hindi': '17. मैं आँसू नहीं रोक पाया।', 'english': 'I couldn\'t hold tears.'},
    {'hindi': '18. यह मोबाइल ऑस्ट्रेलिया में बना है।', 'english': 'This mobile is made in Australia.'},
    {'hindi': '19. मैं कार चलाना नहीं जानता।', 'english': 'I don\'t know how to drive the car.'},
    {'hindi': '20. तुम्हारी आवाज़ से लगता है कि तुम्हें खाँसी है।', 'english': 'Your voice suggests you are suffering from cough.'},
    {'hindi': '21. वो नाराज़ हो गया।', 'english': 'He got angry.'},
    {'hindi': '22. मैं किसे पूछूँ?', 'english': 'Whom do I ask?'},
    {'hindi': '23. मैं परेशान हो गया।', 'english': 'I got annoyed.'},
    {'hindi': '24. सीता कम्प्यूटर चलाना नहीं जानती थी।', 'english': 'Seeta didn\'t know how to operate a computer.'},
    {'hindi': '25. मम्मी एकाद साल में ठीक हो जायेगी।', 'english': 'Mom will be fine in a year or so.'},
    {'hindi': '26. मैं वो नहीं जिसने तुम्हारे भाई को डाँटा।', 'english': 'I am not the one who scolded your brother.'},
    {'hindi': '27. तुम वो इन्सान हो जिसे मैं चाहती हूँ।', 'english': 'You are the person who I love.'},
    {'hindi': '28. क्या मैं वहाँ जाऊँ?', 'english': 'Do I go there?'},
    {'hindi': '29. वो खाना बनाना नहीं जानता।', 'english': 'He doesn\'t know how to prepare the food.'},
    {'hindi': '30. दिल को कैसे मनाऊँ?', 'english': 'How do I convince my heart?'},
    {'hindi': '31. ये बात अच्छी लगती है।', 'english': 'This sounds good.'},
    {'hindi': '32. बच्चे को ठंड लग गयी थी।', 'english': 'Child had got cold.'},
    {'hindi': '33. तुम्हारा ये कहना कि मैं पागल हूँ, मुझे अच्छा नहीं लगा।', 'english': 'Someone saying that I was mad, I didn\'t like.'},
    {'hindi': '34. तुम्हारा मुझे डाँटना ठीक नहीं था।', 'english': 'Your scolding me was not fair.'},
    {'hindi': '35. राम का मुझे डाँटना ठीक नहीं था।', 'english': 'Ram\'s scolding me was not fair.'},
    {'hindi': '36. पापा का मुझे पीटना ठीक नहीं था।', 'english': 'Dad\'s beating me was not fair.'},
    {'hindi': '37. यह संगीत अच्छा लग रहा है।', 'english': 'This music is sounding good.'},
    {'hindi': '38. लगता है तुम्हें मैं अच्छा नहीं लगा।', 'english': 'Seems as you didn\'t like me.'},
    {'hindi': '39. लगता है तुम पागल हो।', 'english': 'Seems as you are mad.'},
    {'hindi': '40. रोटी मम्मी ने बनायीं थी।', 'english': 'Roti was made by Mom.'},
    {'hindi': '41. मैं तुम्हें देखता रहूँगा।', 'english': 'I will keep on watching you.'},
    {'hindi': '42. वो खाना पकाना क्यों नहीं जानती?', 'english': 'Why does she not know how to cook the food?'},
    {'hindi': '43. मैं घर पहुँचने वाला हूँ।', 'english': 'I am about to reach home.'},
    {'hindi': '44. ट्रेन आने वाली थी।', 'english': 'Train was about to arrive.'},
    {'hindi': '45. मैं ये काम करने योग्य हूँ।', 'english': 'I am able to do this work.'},
    {'hindi': '46. ये राम ने बनाया है।', 'english': 'This is made by Ram.'},
    {'hindi': '47. क्या तुम खेलना जानते हो?', 'english': 'Do you know how to play?'},
    {'hindi': '48. खिड़कियाँ लकड़ी की बनी हैं।', 'english': 'Windows are made of wood.'},
    {'hindi': '49. मैं इसी काम के लिए बना हूँ।', 'english': 'I am meant only for this.'},
    {'hindi': '50. ये दरवाजा लोहे का है।', 'english': 'This door is made of Iron.'},
  ];

  static const List<Map<String, String>> quotations = [
    {
      'english': 'The measure of who we are is what we do with what we have.',
      'hindi': 'हम कौन हैं इसकी पहचान इससे है कि हम जो है उससे क्या करते हैं।',
    },
    {
      'english': 'You can avoid reality but you can never avoid the consequences of avoiding reality.',
      'hindi': 'तुम हकीकत से बच सकते हो पर हकीकत से बचने के अंजाम से कभी नहीं।',
    },
    {
      'english': 'Life is not about waiting for storm to pass; it\'s about learning to dance in the rain.',
      'hindi': 'जिन्दगी तूफान के गुजरने का इंतज़ार करने के बारे में नहीं है — यह बारिश में नाचना सीखने के बारे में है।',
    },
    {
      'english': 'If you want to lift yourself up, lift up someone else.',
      'hindi': 'अगर तुम खुद को ऊपर उठाना चाहते हो, तो किसी और को ऊपर उठाओ।',
    },
    {
      'english': 'If you don\'t go after what you want, you will never have it.',
      'hindi': 'अगर तुम वो नहीं पाने की कोशिश करते जो तुम चाहते हो, तो तुम्हें कभी नहीं मिलेगा।',
    },
    {
      'english': 'Talent does what it can; genius does what it must.',
      'hindi': 'प्रतिभा वो करती है जो कर सकती है; प्रतिभाशाली वो करता है जो उसे करना ही होता है।',
    },
  ];
}