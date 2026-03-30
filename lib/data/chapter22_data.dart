import '../models/lesson_model.dart';

class Chapter22Data {
  static ChapterModel get chapter => ChapterModel(
        id: 22,
        title: 'Conjunctions',
        titleHindi: 'समुच्चय बोधक अव्यय',
        description: 'And, But, Because, If, Although & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'And / Or / But / Except',
              titleHindi: 'और / या / लेकिन / सिवाय',
              emoji: '🔗',
              type: LessonType.ch22Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Because / Since / Also / Too',
              titleHindi: 'क्योंकि / चूंकि / भी',
              emoji: '💡',
              type: LessonType.ch22Because,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'As + Adj + As / As well as',
              titleHindi: 'उतना...जितना / साथ ही साथ',
              emoji: '⚖️',
              type: LessonType.ch22AsAs,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'As soon as / As far as / As if',
              titleHindi: 'जैसे ही / जहाँ तक / मानो',
              emoji: '🌀',
              type: LessonType.ch22AsGroup,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'If / Although / Lest / So that',
              titleHindi: 'अगर / हालाँकि / कहीं ऐसा न / ताकि',
              emoji: '🎯',
              type: LessonType.ch22IfAlthough,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 6,
              title: 'WH as Conjunctions / Such / That\'s',
              titleHindi: 'WH शब्द / ऐसा / यही तो',
              emoji: '❓',
              type: LessonType.ch22WH,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 7,
              title: 'Either-Or / Neither-Nor / While / Unless',
              titleHindi: 'या तो / न-न / जबकि / जब तक नहीं',
              emoji: '🔄',
              type: LessonType.ch22Special,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 8,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (148 sentences)',
              emoji: '✍️',
              type: LessonType.ch22Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 9,
              title: 'Test Paper I & II',
              titleHindi: 'परीक्षा पत्र I और II',
              emoji: '📝',
              type: LessonType.ch22TestPaper,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 10,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch22ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch22Intro:
        return introQuestions;
      case LessonType.ch22Because:
        return becauseQuestions;
      case LessonType.ch22AsAs:
        return asAsQuestions;
      case LessonType.ch22AsGroup:
        return asGroupQuestions;
      case LessonType.ch22IfAlthough:
        return ifAlthoughQuestions;
      case LessonType.ch22WH:
        return whQuestions;
      case LessonType.ch22Special:
        return specialQuestions;
      case LessonType.ch22Practice:
        return practiceQuizQuestions;
      case LessonType.ch22TestPaper:
        return testPaperQuizQuestions;
      case LessonType.ch22ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: And / Or / But / Except ──────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: '"राम और मोहन" — यहाँ "और" कौन सा Conjunction है?',
      questionEn: '"Ram and Mohan" — what kind of conjunction is "and"?',
      options: ['But', 'Or', 'And', 'Because'],
      correctIndex: 2,
      explanation: '"And" (और) joins two similar things/people.',
    ),
    QuizQuestion(
      questionHi: '"I can go anywhere but your home." — "but" का अर्थ?',
      questionEn: '"I can go anywhere but your home." — meaning of "but" here?',
      options: ['लेकिन', 'सिवाय', 'बल्कि', 'और'],
      correctIndex: 1,
      explanation: 'Here "but" means सिवाय/except.',
    ),
    QuizQuestion(
      questionHi: '"This is not a pen, but a pencil." — "but" का अर्थ?',
      questionEn: '"This is not a pen, but a pencil." — meaning?',
      options: ['सिवाय', 'और', 'बल्कि', 'या'],
      correctIndex: 2,
      explanation: 'Here "but" means बल्कि (rather).',
    ),
    QuizQuestion(
      questionHi: '"सिवाय" के लिए कौन सा शब्द भी प्रयोग होता है?',
      questionEn: 'Which word also means "सिवाय" (except)?',
      options: ['Also', 'But', 'Except', 'Both B & C'],
      correctIndex: 3,
      explanation: 'Both "but" and "except" can mean सिवाय.',
    ),
    QuizQuestion(
      questionHi: '"आप ये या वो किताब ले सकते हैं।" — सही अनुवाद?',
      questionEn: 'Correct translation of "आप ये या वो किताब ले सकते हैं"?',
      options: [
        'You may take this book and that book.',
        'You may take this book or that book.',
        'You may take this book but that book.',
        'You may take this book for that book.'
      ],
      correctIndex: 1,
      explanation: '"या" = or (choice between two things).',
    ),
  ];

  // ─── L2: Because / Since / Also / Too / Either / Even ─────────────────────
  static const List<QuizQuestion> becauseQuestions = [
    QuizQuestion(
      questionHi: '"Because" का प्रयोग कहाँ होता है?',
      questionEn: 'Where is "because" used in a sentence?',
      options: ['वाक्य के शुरू में', 'वाक्य के बीच में', 'वाक्य के अंत में', 'कहीं भी'],
      correctIndex: 1,
      explanation: '"Because" is used only in the middle of a sentence.',
    ),
    QuizQuestion(
      questionHi: '"Since" का प्रयोग कहाँ होता है?',
      questionEn: 'Where is "since" (क्योंकि/चूंकि) used?',
      options: ['वाक्य के बीच में', 'वाक्य के अंत में', 'वाक्य के शुरू में', 'कहीं नहीं'],
      correctIndex: 2,
      explanation: '"Since" (as conjunction = क्योंकि) is used at the beginning.',
    ),
    QuizQuestion(
      questionHi: '"मैं भी अच्छा हूँ।" — "also" कहाँ लगेगा?',
      questionEn: '"I am also good." — where does "also" go?',
      options: [
        'Helping verb के बाद, verb से पहले',
        'वाक्य के अंत में',
        'Subject से पहले',
        'Verb के बाद'
      ],
      correctIndex: 0,
      explanation: '"Also" goes after helping verb and before main verb.',
    ),
    QuizQuestion(
      questionHi: '"मैं भी अच्छा नहीं हूँ।" (Negative) — सही अनुवाद?',
      questionEn: '"I am not good either." — "either" is used here because:',
      options: [
        'Positive sentence है',
        'Negative sentence में "भी" के लिए either',
        '"Also" negative में नहीं आता — दोनों B & C',
        'इनमें से कोई नहीं'
      ],
      correctIndex: 2,
      explanation: 'In negative sentences, "भी" = either. "Also/too/as well" are for positive sentences.',
    ),
    QuizQuestion(
      questionHi: '"Even" का प्रयोग कहाँ नहीं होता?',
      questionEn: '"Even" is NOT used in which type of sentence?',
      options: ['Positive sentences', 'Negative sentences', 'Interrogative sentences', 'Simple sentences'],
      correctIndex: 2,
      explanation: '"Even" is not used in interrogative (question) sentences.',
    ),
  ];

  // ─── L3: As+Adj+As / As / As well as ─────────────────────────────────────
  static const List<QuizQuestion> asAsQuestions = [
    QuizQuestion(
      questionHi: '"As tall as Amit" का हिंदी अर्थ?',
      questionEn: 'Meaning of "As tall as Amit"?',
      options: [
        'अमित से लम्बा',
        'अमित के जितना लम्बा',
        'अमित से छोटा',
        'अमित जितना'
      ],
      correctIndex: 1,
      explanation: '"As + adjective + as" = उतना...जितना',
    ),
    QuizQuestion(
      questionHi: '"तुम मेरे जितने चालाक नहीं हो।" — सही अनुवाद?',
      questionEn: 'Correct translation of "You are not as clever as I."?',
      options: [
        'You are clever as I.',
        'You are not as clever as I.',
        'You are not clever than I.',
        'You are not more clever as I.'
      ],
      correctIndex: 1,
      explanation: 'Negative comparison: You are not as clever as I.',
    ),
    QuizQuestion(
      questionHi: '"As you wish." का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "As you wish"?',
      options: ['जैसा तुम चाहते हो', 'जैसी आपकी मर्जी', 'जैसा आप कहें', 'B and C both'],
      correctIndex: 1,
      explanation: '"As you wish" = जैसी आपकी मर्जी।',
    ),
    QuizQuestion(
      questionHi: '"He, as well as his friends, ___ good." — सही helping verb?',
      questionEn: '"He, as well as his friends, ___ good." — correct verb?',
      options: ['are', 'were', 'is', 'have'],
      correctIndex: 2,
      explanation: 'With "as well as", helping verb follows the FIRST subject. First subject = He → "is".',
    ),
    QuizQuestion(
      questionHi: '"I, as well as my friends, ___ here." — सही?',
      questionEn: '"I, as well as my friends, ___ here." — fill in:',
      options: ['is', 'are', 'am', 'were'],
      correctIndex: 2,
      explanation: 'First subject = I → helping verb = "am".',
    ),
  ];

  // ─── L4: As soon as / As far as / As if / As though ──────────────────────
  static const List<QuizQuestion> asGroupQuestions = [
    QuizQuestion(
      questionHi: '"जैसे ही वो आया, मैं चला गया।" — सही अनुवाद?',
      questionEn: 'Correct translation of "As soon as he came, I left."?',
      options: [
        'When he came, I left.',
        'The moment he came, I left.',
        'As soon as he came, I left.',
        'Both B & C'
      ],
      correctIndex: 3,
      explanation: '"जैसे ही" = "as soon as" or "the moment".',
    ),
    QuizQuestion(
      questionHi: '"जहाँ तक मैं जानता हूँ" — English?',
      questionEn: '"जहाँ तक मैं जानता हूँ" in English?',
      options: [
        'As long as I know',
        'As soon as I know',
        'As far as I know',
        'As well as I know'
      ],
      correctIndex: 2,
      explanation: '"जहाँ तक" = "As far as"',
    ),
    QuizQuestion(
      questionHi: '"As if" और "As though" का अर्थ?',
      questionEn: 'Meaning of "As if" / "As though"?',
      options: ['जैसे ही', 'जहाँ तक', 'मानो / जैसे कि', 'साथ ही साथ'],
      correctIndex: 2,
      explanation: '"As if" / "As though" = मानो, जैसे कि',
    ),
    QuizQuestion(
      questionHi: '"तुम ऐसे बात करते हो मानो तुम्हें सब पता हो।" — सही?',
      questionEn: '"You talk as if you know everything." — correct?',
      options: [
        'You talk as though you knew everything.',
        'You talk as if you know everything.',
        'You talk in such a way as if you know everything.',
        'Both B & C'
      ],
      correctIndex: 3,
      explanation: 'Both "as if" and "in such a way as if" are correct.',
    ),
    QuizQuestion(
      questionHi: '"जितनी जल्दी हो सके" — English?',
      questionEn: '"जितनी जल्दी हो सके" in English?',
      options: ['As far as possible', 'As well as possible', 'As soon as possible', 'As long as possible'],
      correctIndex: 2,
      explanation: '"जितनी जल्दी हो सके" = "as soon as possible"',
    ),
  ];

  // ─── L5: If / Although / Lest / Otherwise / So that / Provided ────────────
  static const List<QuizQuestion> ifAlthoughQuestions = [
    QuizQuestion(
      questionHi: '"अगर मैं जाता तो उससे मिलता।" — किस तरह का If sentence?',
      questionEn: '"If I went, I would meet him." — which type of If?',
      options: [
        'If + Present, will',
        'If + Past Indefinite, would',
        'If + Past Perfect, would have',
        'If + Future, shall'
      ],
      correctIndex: 1,
      explanation: 'Type 1: If + Past Indefinite → would (होता तो होता).',
    ),
    QuizQuestion(
      questionHi: '"अगर मैं गया होता, तो उससे मिल लिया होता।" — किस तरह का?',
      questionEn: '"If I had gone, I would have met him." — which type?',
      options: [
        'If + Present, will',
        'If + Past Indefinite, would',
        'If + Past Perfect, would have',
        'Unless'
      ],
      correctIndex: 2,
      explanation: 'Type 2: If + Past Perfect → would have (हुआ होता तो हो चुका होता).',
    ),
    QuizQuestion(
      questionHi: '"Although" के साथ कौन सा शब्द ज़रूरी है?',
      questionEn: 'Which word MUST be used with "Although"?',
      options: ['Still', 'Yet', 'But', 'So'],
      correctIndex: 1,
      explanation: 'Rule: "Although" must be followed by "yet".',
    ),
    QuizQuestion(
      questionHi: '"Lest" के बाद कौन सी helping verb आती है?',
      questionEn: 'Which helping verb follows "lest"?',
      options: ['Will', 'Would', 'Should', 'Shall'],
      correctIndex: 2,
      explanation: 'Rule: After "lest", always use "should".',
    ),
    QuizQuestion(
      questionHi: '"Provided" के बाद का वाक्य किस Tense में बनता है?',
      questionEn: '"Provided" is always followed by which tense?',
      options: ['Past Indefinite', 'Future Tense', 'Present Indefinite', 'Present Perfect'],
      correctIndex: 2,
      explanation: '"Provided" is always followed by Present Indefinite Tense.',
    ),
  ];

  // ─── L6: WH as Conjunctions / Such / That's what/where/why ───────────────
  static const List<QuizQuestion> whQuestions = [
    QuizQuestion(
      questionHi: '"जो" (सजीव के लिए) Conjunction के रूप में?',
      questionEn: '"जो" for a living being as a conjunction?',
      options: ['Which', 'What', 'Who', 'Where'],
      correctIndex: 2,
      explanation: '"Who" is used for living beings as a relative conjunction.',
    ),
    QuizQuestion(
      questionHi: '"जो" (निर्जीव के लिए) Conjunction के रूप में?',
      questionEn: '"जो" for a non-living thing as a conjunction?',
      options: ['Who', 'Whom', 'Which / That', 'Where'],
      correctIndex: 2,
      explanation: '"Which" or "that" is used for non-living things.',
    ),
    QuizQuestion(
      questionHi: '"That\'s why" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "That\'s why"?',
      options: ['यहीं तो', 'यही तो', 'इसीलिए / तभी तो', 'इसी तरह'],
      correctIndex: 2,
      explanation: '"That\'s why" = इसीलिए / तभी तो (reason)',
    ),
    QuizQuestion(
      questionHi: '"That\'s where I am going." — हिंदी अर्थ?',
      questionEn: '"That\'s where I am going." — Hindi meaning?',
      options: [
        'यही बात तो मैं कह रहा था।',
        'मैं वहीं तो जा रहा हूँ।',
        'इसी तरह मैं जा रहा हूँ।',
        'इसीलिए मैं जा रहा हूँ।'
      ],
      correctIndex: 1,
      explanation: '"That\'s where" = वहीं तो / यहीं तो (place).',
    ),
    QuizQuestion(
      questionHi: 'Proper noun के बाद "जो/जिसे" वाले वाक्यों में क्या लगता है?',
      questionEn: 'After a proper noun in "who/which" clauses, what punctuation is used?',
      options: ['Full stop (.)', 'Exclamation (!)', 'Comma (,)', 'Colon (:)'],
      correctIndex: 2,
      explanation: 'Proper noun + comma. Common noun: no comma. E.g., "Ram, who was with me, ..."',
    ),
  ];

  // ─── L7: Either-or / Neither-nor / Not only-but also / While / No sooner / etc.
  static const List<QuizQuestion> specialQuestions = [
    QuizQuestion(
      questionHi: '"Either you go or let me go." — हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Either you go or let me go."?',
      options: [
        'न तुम जाओ न मुझे जाने दो।',
        'या तो तुम जाओ या मुझे जाने दो।',
        'तुम भी जाओ और मुझे भी जाने दो।',
        'तुम जाओ या मत जाओ।'
      ],
      correctIndex: 1,
      explanation: '"Either...or" = या तो...या।',
    ),
    QuizQuestion(
      questionHi: '"I\'ll neither go to Delhi nor Mumbai." — हिंदी?',
      questionEn: '"I\'ll neither go to Delhi nor Mumbai." — Hindi?',
      options: [
        'मैं दिल्ली या मुम्बई जाऊँगा।',
        'मैं न दिल्ली जाऊँगा न मुम्बई।',
        'मैं दिल्ली और मुम्बई नहीं जाऊँगा।',
        'मैं दिल्ली या मुम्बई नहीं जाऊँगा।'
      ],
      correctIndex: 1,
      explanation: '"Neither...nor" = न...न।',
    ),
    QuizQuestion(
      questionHi: '"While" के बाद verb किस form में आती है?',
      questionEn: 'Verb form after "while"?',
      options: ['1st form', '2nd form', '1st form + ing', 'infinitive (to + verb)'],
      correctIndex: 2,
      explanation: 'Rule: "while" + verb + ing. E.g., while walking, while studying.',
    ),
    QuizQuestion(
      questionHi: '"No sooner had I reached ___ they came." — सही शब्द?',
      questionEn: '"No sooner had I reached ___ they came." — fill in:',
      options: ['when', 'then', 'than', 'that'],
      correctIndex: 2,
      explanation: '"No sooner...than" = ही था कि।',
    ),
    QuizQuestion(
      questionHi: '"Unless" के बाद का वाक्य किस Tense में?',
      questionEn: '"Unless" is followed by which tense?',
      options: ['Future', 'Present or Past Indefinite', 'Present Perfect', 'Past Perfect'],
      correctIndex: 1,
      explanation: '"Unless/Until" → Present Indefinite or Past Indefinite (never Future).',
    ),
  ];

  // ─── L8: Practice Quiz Questions ─────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"उसने भी नहीं चाहा।" — English?',
      questionEn: '"Even he didn\'t want." — which word shows "भी" in negative?',
      options: ['also', 'too', 'even', 'either'],
      correctIndex: 2,
      explanation: '"Even" can be used in negative sentences for "भी".',
    ),
    QuizQuestion(
      questionHi: '"I can make him go ___ you come home." — सही?',
      questionEn: '"मैं उसे भिजवा सकता हूँ पर तब जब तुम घर आ जाओ।"',
      options: ['if', 'provided', 'unless', 'lest'],
      correctIndex: 1,
      explanation: '"Provided" = पर तब जब / बशर्ते (condition).',
    ),
    QuizQuestion(
      questionHi: '"जो तुमने टेबल पर रखा, क्या है वो?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'That which you kept on table, what is that?',
        'What did you keep on the table?',
        'That you kept on table, what is that?',
        'Which you put on table?'
      ],
      correctIndex: 2,
      explanation: '"That you kept on table, what is that?" uses "that" as WH conjunction.',
    ),
    QuizQuestion(
      questionHi: '"No sooner had I opened this book ___ I remembered my childhood."',
      questionEn: 'Fill in the blank:',
      options: ['when', 'then', 'than', 'as'],
      correctIndex: 2,
      explanation: '"No sooner...than" is the correct pair.',
    ),
    QuizQuestion(
      questionHi: '"वो यही तो चाहती है।" — English?',
      questionEn: 'Correct translation of "वो यही तो चाहती है"?',
      options: [
        'That\'s where she wants.',
        'That\'s why she wants.',
        'That\'s what she wants.',
        'That\'s how she wants.'
      ],
      correctIndex: 2,
      explanation: '"That\'s what" = यही तो (referring to a thing/action).',
    ),
    QuizQuestion(
      questionHi: '"Although" के साथ "yet" न लगाने पर क्या होगा?',
      questionEn: 'What happens if you use "although" without "yet/still"?',
      options: ['वाक्य सही रहता है', 'वाक्य गलत हो जाता है', 'अर्थ बदल जाता है', 'कोई फर्क नहीं'],
      correctIndex: 1,
      explanation: 'Rule: "Although" MUST be followed by "yet" or "still". Without it, the sentence is incorrect.',
    ),
    QuizQuestion(
      questionHi: '"He is working ___ a manager." — सही preposition/conjunction?',
      questionEn: '"He is working ___ a manager." — correct word?',
      options: ['like', 'as', 'such as', 'as if'],
      correctIndex: 1,
      explanation: '"As" = के तौर पर (role/capacity). "Like" = like (similarity in manner).',
    ),
    QuizQuestion(
      questionHi: '"He has as ___ pencils as you have." — सही शब्द?',
      questionEn: '"He has as ___ pencils as you have." — fill in:',
      options: ['much', 'many', 'more', 'most'],
      correctIndex: 1,
      explanation: '"Many" for countable nouns (pencils). "Much" for uncountable.',
    ),
  ];

  // ─── L9: Test Paper Quiz Questions ────────────────────────────────────────
  static const List<QuizQuestion> testPaperQuizQuestions = [
    QuizQuestion(
      questionHi: '"Work hard lest you ___ fail." — सही?',
      questionEn: '"Work hard lest you ___ fail." — fill in:',
      options: ['will', 'may', 'should', 'might'],
      correctIndex: 2,
      explanation: '"Lest" is always followed by "should".',
    ),
    QuizQuestion(
      questionHi: '"Either you or he ___ wrong." — सही verb?',
      questionEn: '"Either you or he ___ wrong." — correct verb?',
      options: ['am', 'are', 'is', 'were'],
      correctIndex: 2,
      explanation: 'With "either...or", verb agrees with the CLOSER subject (he → is).',
    ),
    QuizQuestion(
      questionHi: '"Did you not go there ___?" — negative question में "भी"?',
      questionEn: '"Did you not go there ___?" — correct word for "भी"?',
      options: ['also', 'even', 'either', 'too'],
      correctIndex: 2,
      explanation: 'Negative questions → "either" for "भी".',
    ),
    QuizQuestion(
      questionHi: '"My friends have not reached ___." — सही?',
      questionEn: '"My friends have not reached ___." — correct?',
      options: ['till now', 'as yet', 'yet', 'Both B & C'],
      correctIndex: 3,
      explanation: '"Yet" and "as yet" are correct. "Till now" is incorrect — use "yet/as yet/so far".',
    ),
    QuizQuestion(
      questionHi: '"Whether he ___ or not, I must go." — सही verb?',
      questionEn: '"Whether he ___ or not, I must go." — correct:',
      options: ['comes', 'came', 'come', 'will come'],
      correctIndex: 0,
      explanation: '"Whether" + Present Indefinite. "comes" is correct (he = 3rd person singular).',
    ),
    QuizQuestion(
      questionHi: '"Because I lost everything, I am depressed." — यह sentence गलत क्यों है?',
      questionEn: 'Why is "Because I lost everything, I am depressed." incorrect?',
      options: [
        '"Because" verb से पहले आता है',
        '"Because" वाक्य के शुरू में नहीं आता',
        '"Because" के बाद comma नहीं आता',
        'वाक्य सही है'
      ],
      correctIndex: 1,
      explanation: '"Because" is only used in the middle. Use "Since/As/For" at the beginning.',
    ),
    QuizQuestion(
      questionHi: '"I will give you the book provided you ___ it daily." — सही?',
      questionEn: '"I will give you the book provided you ___ it daily."',
      options: ['will read', 'would read', 'read', 'have read'],
      correctIndex: 2,
      explanation: '"Provided" is always followed by Present Indefinite (read, not will read).',
    ),
    QuizQuestion(
      questionHi: '"As soon as Dad came, I started ___." — सही form?',
      questionEn: '"As soon as Dad came, I started ___." — correct form?',
      options: ['study', 'to study', 'studying', 'studied'],
      correctIndex: 2,
      explanation: '"Started" is followed by verb+ing → "studying".',
    ),
  ];

  // ─── L10: Chapter Final Quiz ──────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: '"And" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "and"?',
      options: ['या', 'लेकिन', 'और', 'क्योंकि'],
      correctIndex: 2,
      explanation: '"And" = और (joins similar things).',
    ),
    QuizQuestion(
      questionHi: '"Because" वाक्य में कहाँ आता है?',
      questionEn: '"Because" is placed:',
      options: ['शुरू में', 'बीच में', 'अंत में', 'कहीं भी'],
      correctIndex: 1,
      explanation: '"Because" is used only in the MIDDLE of the sentence.',
    ),
    QuizQuestion(
      questionHi: '"As well as" वाले वाक्य में helping verb?',
      questionEn: 'With "as well as", helping verb agrees with:',
      options: ['दोनों subjects', 'बाद वाला subject', 'पहला subject', 'कोई नहीं'],
      correctIndex: 2,
      explanation: 'Helping verb agrees with the FIRST subject when "as well as" joins subjects.',
    ),
    QuizQuestion(
      questionHi: '"Lest" के बाद helping verb?',
      questionEn: 'Helping verb after "lest"?',
      options: ['Will', 'Would', 'Should', 'Must'],
      correctIndex: 2,
      explanation: '"Lest" is always followed by "should".',
    ),
    QuizQuestion(
      questionHi: '"No sooner...___" — pair?',
      questionEn: '"No sooner...___" — complete the pair:',
      options: ['when', 'then', 'than', 'that'],
      correctIndex: 2,
      explanation: '"No sooner...than" is the fixed pair.',
    ),
    QuizQuestion(
      questionHi: '"While" के बाद verb?',
      questionEn: 'Verb form after "while"?',
      options: ['1st form', '2nd form', 'verb+ing', 'infinitive'],
      correctIndex: 2,
      explanation: '"While" + verb+ing (e.g., while walking).',
    ),
    QuizQuestion(
      questionHi: '"Although" के साथ कौन सा शब्द ज़रूरी?',
      questionEn: 'Which word MUST accompany "although"?',
      options: ['But', 'Still/Yet', 'However', 'So'],
      correctIndex: 1,
      explanation: '"Although...yet/still" is the correct pair.',
    ),
    QuizQuestion(
      questionHi: '"Either...or" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Either...or"?',
      options: ['न...न', 'और...और', 'या तो...या', 'चाहे...या'],
      correctIndex: 2,
      explanation: '"Either...or" = या तो...या।',
    ),
    QuizQuestion(
      questionHi: '"Unless" के बाद का वाक्य?',
      questionEn: '"Unless" is followed by:',
      options: ['Future tense', 'Present/Past Indefinite', 'Present Perfect', 'Continuous tense'],
      correctIndex: 1,
      explanation: '"Unless/Until" → Present or Past Indefinite tense.',
    ),
    QuizQuestion(
      questionHi: '"That\'s how" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "That\'s how"?',
      options: ['यहीं तो', 'इसीलिए', 'इसी तरह से', 'उसी वक्त'],
      correctIndex: 2,
      explanation: '"That\'s how" = इसी तरह से / इसी तरह तो (way of doing).',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> andOrButData = [
    {'hindi': 'राम और मोहन अच्छे दोस्त हैं।', 'english': 'Ram and Mohan are good friends.', 'keyword': 'and (और)'},
    {'hindi': 'आप ये या वो किताब ले सकते हैं।', 'english': 'You may take this book or that book.', 'keyword': 'or (या)'},
    {'hindi': 'राम और श्याम दोस्त हैं पर लड़ते हैं।', 'english': 'Ram and Shyam are friends but they fight.', 'keyword': 'but (लेकिन)'},
    {'hindi': 'मैं तुम्हारे घर के सिवाय कहीं भी जा सकता हूँ।', 'english': 'I can go anywhere but/except your home.', 'keyword': 'but / except (सिवाय)'},
    {'hindi': 'ये पैन नहीं बल्कि पैन्सिल है।', 'english': 'This is not a pen, but a pencil.', 'keyword': 'but (बल्कि)'},
  ];

  static const List<Map<String, String>> becauseData = [
    {'hindi': 'चूंकि मैं बीमार था, इसलिए मैं नहीं आया।', 'english': 'Since/As I was unwell, hence I didn\'t come.', 'note': 'Since/As → शुरू में'},
    {'hindi': 'मैं नहीं आया क्योंकि मैं बीमार था।', 'english': 'I didn\'t come because/as I was unwell.', 'note': 'Because → बीच में'},
    {'hindi': 'मैं भी अच्छा हूँ।', 'english': 'I am good too. / I am also good. / Even I am good.', 'note': 'Positive → too/also/even'},
    {'hindi': 'मैं भी अच्छा नहीं हूँ।', 'english': 'Even I am not good. / I am not good either.', 'note': 'Negative → either/even'},
    {'hindi': 'क्या तुम भी वहाँ नहीं थे?', 'english': 'Were you not there either?', 'note': 'Negative Interrogative → either'},
  ];

  static const List<Map<String, String>> asAsData = [
    {'hindi': 'उतना लम्बा जितना अमित', 'english': 'As tall as Amit', 'type': 'comparison'},
    {'hindi': 'उतना काला जितना कोयला', 'english': 'As black as coal', 'type': 'comparison'},
    {'hindi': 'तुम मेरे जितने चालाक नहीं हो।', 'english': 'You are not as clever as I.', 'type': 'negative'},
    {'hindi': 'जैसा आप कहें।', 'english': 'As you say.', 'type': 'as (जैसा)'},
    {'hindi': 'मैं यहाँ मैनेजर के तौर पर काम कर रहा हूँ।', 'english': 'I am working here as a manager.', 'type': 'as (के तौर पर)'},
  ];

  static const List<Map<String, String>> ifData = [
    {'type': 'Type 1', 'formula': 'If + Past Indefinite → would', 'hindi': 'अगर मैं जाता तो उससे मिलता।', 'english': 'If I went, I would meet him.'},
    {'type': 'Type 2', 'formula': 'If + Past Perfect → would have', 'hindi': 'अगर मैं गया होता, तो मिल लिया होता।', 'english': 'If I had gone, I would have met him.'},
    {'type': 'Type 3', 'formula': 'If + Present Indefinite → will', 'hindi': 'अगर मैं गया, तो उससे मिलूंगा।', 'english': 'If I go, I will meet him.'},
  ];

  static const List<Map<String, String>> specialConjData = [
    {'hindi': 'या तो तुम जाओ या मुझे जाने दो।', 'english': 'Either you go or let me go.', 'pair': 'Either...or'},
    {'hindi': 'मैं न दिल्ली जाऊँगा न मुम्बई।', 'english': 'I\'ll neither go to Delhi nor Mumbai.', 'pair': 'Neither...nor'},
    {'hindi': 'तुम आते हो। वो भी आता है।', 'english': 'You come. So does he.', 'pair': 'So (वो भी)'},
    {'hindi': 'तुम नहीं आते। वो भी नहीं आता।', 'english': 'You don\'t come. Nor does he.', 'pair': 'Nor/Neither'},
    {'hindi': 'वो न केवल मैनेजर है बल्कि विद्यार्थी भी है।', 'english': 'He is not only a manager, but also a student.', 'pair': 'Not only...but also'},
  ];

  static const List<Map<String, String>> whConjData = [
    {'hindi': 'जो (सजीव)', 'english': 'Who', 'example': 'Ram, who was with me, is my friend.'},
    {'hindi': 'जो (निर्जीव)', 'english': 'Which / That', 'example': 'Pen which I had is not yours.'},
    {'hindi': 'जहाँ', 'english': 'Where', 'example': 'I came from where you came.'},
    {'hindi': 'जिसका (सजीव)', 'english': 'Whose', 'example': 'Ram is the one whose father is in police.'},
    {'hindi': 'जिसका (निर्जीव)', 'english': 'Of which', 'example': 'The house, the roof of which is weak.'},
    {'hindi': 'जिसे', 'english': 'Whom', 'example': 'For whom I did everything.'},
    {'hindi': 'जब', 'english': 'When', 'example': 'That\'s when I reached.'},
    {'hindi': 'जिस तरह से', 'english': 'How / The way', 'example': 'Tell me how you reached there.'},
  ];

  static const List<Map<String, String>> thatsData = [
    {'key': 'That\'s what', 'hindi': 'यही तो / वही बात तो', 'example': 'That\'s what I was saying.'},
    {'key': 'That\'s where', 'hindi': 'यहीं तो / वहीं तो', 'example': 'That\'s where I am going.'},
    {'key': 'That\'s why', 'hindi': 'इसीलिए / तभी तो', 'example': 'That\'s why he didn\'t come.'},
    {'key': 'That\'s when', 'hindi': 'उसी समय तो / तभी तो', 'example': 'That\'s when I reached.'},
    {'key': 'That\'s how', 'hindi': 'इसी तरह से', 'example': 'That\'s how I learned.'},
    {'key': 'That\'s who/whom', 'hindi': 'उसी को (सजीव)', 'example': 'That\'s who I had scolded.'},
    {'key': 'That\'s which', 'hindi': 'उसी को (निर्जीव)', 'example': 'That\'s which I had kept the book on.'},
  ];

  // ─── Practice Exercise — all 148 sentences ────────────────────────────────
  // Split into sets of ~25 for UI display (6 sets)

  static const List<Map<String, String>> practiceSet1 = [
    {'hindi': '1. उसने भी नहीं चाहा।', 'english': 'Even he didn\'t want.'},
    {'hindi': '2. हालाँकि मुझे खेलने नहीं दिया जा रहा, फिर भी मैं शान्त हूँ।', 'english': 'Though I am not being let play, still I am quiet.'},
    {'hindi': '3. मैं उसे भिजवा सकता हूँ पर तब जब तुम घर आ जाओ।', 'english': 'I can make him go provided you come home.'},
    {'hindi': '4. मैंने न कभी किया न करने की सोच सकता हूँ।', 'english': 'Neither I did nor I can ever think of doing.'},
    {'hindi': '5. चाहे वो बैठे या न बैठे मैं तो जरूर बैठूँगा।', 'english': 'Whether he sits or not, I will definitely sit.'},
    {'hindi': '6. हमें पढ़ने तक नहीं दिया गया था।', 'english': 'We were not even let study.'},
    {'hindi': '7. मेरी बात किसी ने नहीं सुनी।', 'english': 'Nobody listened to me.'},
    {'hindi': '8. जिसे तुम याद कर रहे हो, उसे तुम कभी याद नहीं आते।', 'english': 'The one who you are missing, she never misses you.'},
    {'hindi': '9. जो तुमने टेबल पर रखा, क्या है वो?', 'english': 'That you kept on table, what is that?'},
    {'hindi': '10. चाहे वो न आये, मैं तो सुबह-2 ही दिल्ली के लिए निकल जाऊँगा।', 'english': 'Even if he doesn\'t come, I will leave for Delhi early in the morning.'},
    {'hindi': '11. वो भी हमें देखता रहा।', 'english': 'Even he kept on watching us.'},
    {'hindi': '12. क्या वो जानता था कि मैं कौन हूँ?', 'english': 'Did he know who I was?'},
    {'hindi': '13. मैं तुम्हें यही तो समझा रहा हूँ।', 'english': 'That\'s what I am making you understand.'},
    {'hindi': '14. रिश्ता वो चीज है जिसके बिना हम अधूरे हैं।', 'english': 'Relation is something without which we are incomplete.'},
    {'hindi': '15. हम वहीं पर तो खड़े होकर पढ़ रहे थे।', 'english': 'That\'s where we were standing and studying.'},
    {'hindi': '16. उसने मुझे सिखाया था कि लड़ते कैसे हैं।', 'english': 'He had taught me how to fight.'},
    {'hindi': '17. या तो अपनी हार पर रोना होगा हमें या फिर लड़ते हुए जान देनी होगी।', 'english': 'Either we will have to cry over our defeat or sacrifice our lives, fighting.'},
    {'hindi': '18. वो अंग्रेजी ही नहीं पंजाबी भी बोलना जानता है।', 'english': 'He not only knows English but also Punjabi.'},
    {'hindi': '19. सबको इज्जत दो ऐसा न हो तुम्हें भी कोई इज्जत न दे।', 'english': 'Respect all lest nobody should respect you.'},
    {'hindi': '20. अब चलते हैं वरना हमें देर हो सकती है।', 'english': 'Let\'s go now otherwise we may be late.'},
    {'hindi': '21. वो पढ़ने के लिए नहीं आया ताकि उसे डाँट न पड़े।', 'english': 'He didn\'t come to study so that he was not scolded.'},
    {'hindi': '22. मैं कह नहीं सकता कि वो कब तक आयेगा।', 'english': 'I can\'t say until when he will come.'},
    {'hindi': '23. उसे अभी भी बुखार है।', 'english': 'He is still suffering from fever. / He still has fever.'},
    {'hindi': '24. मैंने तुम्हारा नाम सुना तक नहीं था।', 'english': 'I had not even heard your name.'},
    {'hindi': '25. न उसने देखा होगा न किसी और ने।', 'english': 'Neither he will have seen nor anybody else.'},
  ];

  static const List<Map<String, String>> practiceSet2 = [
    {'hindi': '26. मैं कह नहीं सकता कि वो आयेगा।', 'english': 'I can\'t say if he will come.'},
    {'hindi': '27. जहाँ तक मेरी जिन्दगी का सवाल है, मैंने इसे मानव कल्याण पर लगा दिया है।', 'english': 'As far as my life is concerned, I have devoted it to human welfare.'},
    {'hindi': '28. लोग अक्सर मेरे घर आते हैं ताकि वो मेरे अमीर पिता का पैसा प्रयोग कर सकें।', 'english': 'People visit my home very often so that they might use my rich father\'s money.'},
    {'hindi': '29. वो माता पिता जिनकी ऊँगली पकड़कर तुमने चलना सीखा, उन्हें कभी दुख मत पहुँचाना।', 'english': 'The parents, holding whose fingers you toddled, don\'t ever hurt them.'},
    {'hindi': '30. न वो समझा जो मुझे कहना था न ही उसने सुनने की कोशिश तक की।', 'english': 'Neither he understood what I had to say nor he even tried to listen.'},
    {'hindi': '31. या तो वो तुम्हें जाने देगा या वो बहाने बनायेगा।', 'english': 'Either he will let you go or he will make excuses.'},
    {'hindi': '32. शिक्षा व्यवसाय नहीं बल्कि आप तक पहुँचने का एक प्रयास है।', 'english': 'Education is not a business but an endeavor to reach you.'},
    {'hindi': '33. मैं भी खुश नहीं हूँ।', 'english': 'Even I am not happy. / I am not happy either.'},
    {'hindi': '34. हम उतने सभ्य हैं जितना हमें होना चाहिए।', 'english': 'We are as civilized as we should be.'},
    {'hindi': '35. जहाँ तक मेरी सोच का सवाल है, मुझे पूरा यकीन है कि मैं सबका दिल जीत लूँगा।', 'english': 'As far as my thinking is concerned, I firmly believe that I will win everyone\'s heart.'},
    {'hindi': '36. वो तुम्हें डाँटने के सिवाय कुछ भी कर सकता है।', 'english': 'He can do anything but scold you.'},
    {'hindi': '37. ये मेरा प्यार नहीं, उस लड़की की तरफ मेरा आकर्षण है।', 'english': 'It\'s not my love but an attraction towards that girl.'},
    {'hindi': '38. वो मुझसे बात करने लगा मानो मुझे पहले से जानता हो।', 'english': 'He started talking to me as if he already knew me.'},
    {'hindi': '39. चाहे ट्रेन 2 घंटे बाद आये, हमें तैयार रहना चाहिए।', 'english': 'Even if train comes after 2 hrs, we must be ready.'},
    {'hindi': '40. क्या उनमें से कोई इतना ही खूबसूरत था जितना वो है।', 'english': 'Was any of them as handsome as he is?'},
    {'hindi': '41. क्या उसके पास मेरे जितनी गाडियाँ थी?', 'english': 'Did he have as many cars as I have?'},
    {'hindi': '42. उसे भी फूल पसन्द नहीं थे।', 'english': 'He didn\'t like flowers either. / Even he didn\'t like flowers.'},
    {'hindi': '43. चूँकि मैंने उसे फोन नहीं किया, इसलिए उसने अगले पूरे दिन मुझसे बात नहीं की।', 'english': 'Since I didn\'t phone him, he didn\'t talk to me for the next whole day.'},
    {'hindi': '44. राज नहीं जानता कि वो दिल्ली जायेगा या नहीं।', 'english': 'Raj doesn\'t know whether he will go to Delhi or not.'},
    {'hindi': '45. उसे पता नहीं था कि वो जायेगा।', 'english': 'He didn\'t know whether he would go.'},
    {'hindi': '46. इसी तरह मैं बड़ा हुआ।', 'english': 'That\'s how I grew up.'},
    {'hindi': '47. मेरी मम्मी ऐसी नहीं है कि तुम्हारे बहानों को मान जाए।', 'english': 'My mom is not such a lady who will buy your excuses.'},
    {'hindi': '48. मैंने ये किताब खोली ही थी कि मुझे अपना बचपन याद आ गया क्योंकि जब मैं बच्चा था मुझे ये किताब पसंद थी।', 'english': 'No sooner had I opened this book than I remembered my childhood as I loved it when I was a kid.'},
    {'hindi': '49. मैं अभी भी तुम्हें अपनी जिंदगी से ज्यादा प्यार करता हूँ।', 'english': 'I still love you more than my life.'},
    {'hindi': '50. उनमें से किसी के पास भी मेरे जितनी पेन्सिलें नहीं थी।', 'english': 'None of them had as many pens as I had.'},
  ];

  static const List<Map<String, String>> practiceSet3 = [
    {'hindi': '51. क्या तुम्हारा सुझाव मेरे जितना अच्छा है?', 'english': 'Is your suggestion as good as mine?'},
    {'hindi': '52. मैंने वहीं तो उस अजनबी को देखा था।', 'english': 'That\'s where I had seen that stranger.'},
    {'hindi': '53. उसने मुझे फोन नहीं किया क्योंकि वो मुझसे नाराज है।', 'english': 'He didn\'t call me because he is angry with me.'},
    {'hindi': '54. वो मेरे जितना लम्बा नहीं था।', 'english': 'He was not as tall as I.'},
    {'hindi': '55. तुम्हारी आँखें मुझे इस तरह घूरती हैं कि एक पल के लिए मैं खो जाता हूँ।', 'english': 'Your eyes stare at me in such a way that I feel lost for a moment.'},
    {'hindi': '56. उसके हालात अभी भी उसके काबू से बाहर हैं।', 'english': 'His circumstances are still out of his hands.'},
    {'hindi': '57. वो लड़की ऐसा गिफ्ट पसन्द नहीं करेगी।', 'english': 'That girl will not like such a gift.'},
    {'hindi': '58. उनमें से कुछ मेरे भाई जितने तेज हैं।', 'english': 'Few of them are as intelligent as my brother is.'},
    {'hindi': '59. उसी वक्त मैंने भी ग्रेजुएशन पूरी की।', 'english': 'That\'s when even I completed Graduation.'},
    {'hindi': '60. जैसे ही तुम वहाँ पहुँचो, मुझे कॉल करना।', 'english': 'As soon as you reach there, call me.'},
    {'hindi': '61. जहाँ तक मुझे पता है वो स्वभाव का अच्छा है।', 'english': 'As far as I know, he is nice by nature.'},
    {'hindi': '62. न केवल मेरी जिंदगी बल्कि उसकी भी इस एक गलत फैसले के कारण बर्बाद हो गई है।', 'english': 'Not only my life but also his is ruined due to this one wrong decision.'},
    {'hindi': '63. मैं न उसे कॉल कर पाया न उसे आखिरी वक्त पे देख पाया।', 'english': 'I could neither call him nor see him at the last moment.'},
    {'hindi': '64. इस साल कई हिट फिल्में हैं जैसे दबंग 2, सन ऑफ सरदार आदि।', 'english': 'There are so many big hits this year such as Dabang 2, Son of Sardar etc.'},
    {'hindi': '65. वो अपने दोस्तों के साथ खेलते हुए टीवी देख रहा था।', 'english': 'He was watching TV while playing with his friends.'},
    {'hindi': '66. या तो मेरा गलत है या तुम्हारा?', 'english': 'Either mine is wrong or yours is.'},
    {'hindi': '67. तुम मेरे दोस्त नहीं हो इसलिए मैंने कॉल नहीं की।', 'english': 'You are not my friend, that\'s why I didn\'t call you.'},
    {'hindi': '68. जब तक तुम यहाँ खड़े हो, मैं भी कहीं नहीं जाऊँगा।', 'english': 'As long as you are standing here, even I will not go anywhere.'},
    {'hindi': '69. ऐसी कहानियाँ बहुत बोरिंग होती हैं।', 'english': 'Such stories are very boring.'},
    {'hindi': '70. मैं कह नहीं सकता, वो तुम्हें ऐसी किसी बात के लिए फोन करेगा।', 'english': 'I can\'t say if he will call you for any such purpose.'},
    {'hindi': '71. मैं उसे कॉल करने के अलावा कुछ भी कर सकता था।', 'english': 'I could do anything but call her.'},
    {'hindi': '72. चाहे वो खाये या न खाये, कम से कम मैं तो नहीं खाने वाला।', 'english': 'Whether he eats or not, at least I am not going to eat.'},
    {'hindi': '73. या तो मैं गलत हूँ या फिर तुम।', 'english': 'Either I am wrong or you are.'},
    {'hindi': '74. जितना तुम उसे प्यार करते हो मैं भी करता हूँ।', 'english': 'As much as you love her, even I do.'},
    {'hindi': '75. मैंने भी उसे रुलाया।', 'english': 'Even I made him weep.'},
  ];

  static const List<Map<String, String>> practiceSet4 = [
    {'hindi': '76. यही तो मुझे हमेशा नापसंद था और नियति देखिए आज मेरे पास ये करने के सिवाय कोई चारा ही नहीं है।', 'english': 'That\'s what I always disliked and what a coincidence, I have no choice but to do it.'},
    {'hindi': '77. वो अभी भी बुरे दौर से गुजर रहा है।', 'english': 'He is still going through a bad phase.'},
    {'hindi': '78. चाहे मेरे साथ बुरे से भी बुरा बर्ताव हो या मुझे जान से मार दिया जाये मेरी आखिरी साँस भी यही कहेंगी कि मैं अपने देश से प्यार करता हूँ।', 'english': 'Whether I am treated brutally or killed, even my last breath will say I love my country.'},
    {'hindi': '79. जो तुम कहो, मैं अंत तक करता रहूँगा।', 'english': 'Whatever you say, I will keep doing till the end.'},
    {'hindi': '80. जब तक वो मिलने नहीं आता मैं नहीं जाने वाला।', 'english': 'Unless he comes to meet, I am not going to go.'},
    {'hindi': '81. हम इस तरह रोड पार करते हैं।', 'english': 'That\'s how we cross the road.'},
    {'hindi': '82. जैसा तुम चाहो / जैसा तुम पसंद करो।', 'english': 'As you feel like.'},
    {'hindi': '83. मैं पढ़ने लगा ज्यों ही पापा आये।', 'english': 'I started studying as soon as / the moment Dad came.'},
    {'hindi': '84. तुम मेरे कोई नहीं हो जबकि वो मेरा सब कुछ है।', 'english': 'You are no one to me whereas he is everything to me.'},
    {'hindi': '85. वो मेरे लिए रुका जब तक मैं नहीं आया।', 'english': 'He waited for me until I came.'},
    {'hindi': '86. जैसा-जैसा आपने मुझे बताया था मैंने कर लिया है।', 'english': 'I have done as you had instructed me.'},
    {'hindi': '87. उसने पढ़ते हुए मुझे कॉल किया।', 'english': 'He called me while studying.'},
    {'hindi': '88. मैंने तुम्हें कॉल की ही थी कि तुम मेरे घर पहुँच गये।', 'english': 'No sooner had I called you than you reached my home.'},
    {'hindi': '89. हमने अभी तक ताजमहल नहीं देखा है।', 'english': 'We have not seen the Taj Mahal yet.'},
    {'hindi': '90. तुमने अभी तक कितना पैसा इकट्ठा कर लिया है?', 'english': 'How much money have you collected so far?'},
    {'hindi': '91. इस तरह का आदमी घमंडी होता है।', 'english': 'Such a man is arrogant.'},
    {'hindi': '92. उसने इस तरह मेरा स्वागत किया कि एक पल को मुझे लगा कि मैं हीरो हूँ।', 'english': 'She welcomed me in such a way that for a moment I felt as if I was a hero.'},
    {'hindi': '93. मुझे भी ऐसा व्यवहार कभी पसंद नहीं आया।', 'english': 'Even I never liked such a behavior.'},
    {'hindi': '94. मैं इस साल ज्यादा मेहनत करूंगा क्योंकि मैं दोबारा फेल नहीं होना चाहता।', 'english': 'I will work harder this year because I don\'t want to fail again.'},
    {'hindi': '95. मुझे टीवी की जरूरत नहीं थी पर तुमने दिला दी, मैं धन्यवाद करता हूँ।', 'english': 'I didn\'t need a TV but you provided me one. I thank you so much.'},
    {'hindi': '96. मेरे पास कुछ नहीं है फिर भी मैं हिम्मत नहीं हारता।', 'english': 'I have nothing, yet I don\'t lose hope.'},
    {'hindi': '97. कोई तो दोषी है, तुम या मैं?', 'english': 'Someone is to blame; either you or I?'},
    {'hindi': '98. वो साथी जिसके बिना तुम आज जहाँ हो पहुँच नहीं सकते थे, कहाँ है वो?', 'english': 'The mate without whom you could not have reached where you are today, where is he?'},
    {'hindi': '99. जब तक वो मेरे पैसे वापस नहीं करता मैं उसे नहीं छोड़ने वाला।', 'english': 'Unless he returns my money, I am not going to spare him.'},
    {'hindi': '100. वो उतनी दूर तक नहीं जा सका।', 'english': 'He couldn\'t go up to that far.'},
  ];

  static const List<Map<String, String>> practiceSet5 = [
    {'hindi': '101. वो सच नहीं, एक दिखावा था।', 'english': 'That was not truth but fake.'},
    {'hindi': '102. जिसके साथ बैठकर तुमने फोटो खिंचवाई, वो कौन है?', 'english': 'The one, sitting with whom you had a snap. Who is he?'},
    {'hindi': '103. उसी को तो मैंने भेजा था।', 'english': 'That\'s whom I had sent.'},
    {'hindi': '104. इसी बात पर तो हमारे बीच झगड़ा हुआ।', 'english': 'That\'s what we disputed on.'},
    {'hindi': '105. न खुद करते हों, न करने देते हों।', 'english': 'Neither you do yourself nor let do.'},
    {'hindi': '106. ऐसी लापरवाही अभी तक किसी और ने नहीं की है।', 'english': 'Nobody else has done such a negligence.'},
    {'hindi': '107. उसके पास अभी भी बहुत पैसा है।', 'english': 'He still has a lot of money.'},
    {'hindi': '108. न बारिश हुई, न कोई आया।', 'english': 'Neither it rained, nor did anybody come.'},
    {'hindi': '109. तुमने उसे बुलाया ताकि हमें पिटवा सको।', 'english': 'You made him come so that we could be beaten.'},
    {'hindi': '110. जिसके साथ हम चल रहे हैं, वो भूत नहीं हो सकता।', 'english': 'The one with whom we are walking, he can\'t be a ghost.'},
    {'hindi': '111. जिसका दिल टूटा होता है वो अक्सर दर्द महसूस करता है।', 'english': 'The one whose heart is broken, he often feels the pain.'},
    {'hindi': '112. कल छुट्टी होगी।', 'english': 'It will be holiday tomorrow.'},
    {'hindi': '113. उसका भी कोई नहीं था।', 'english': 'Nobody was his either.'},
    {'hindi': '114. मैंने उसी समय बन्दूक निकाल ली।', 'english': 'That\'s when I took out the gun.'},
    {'hindi': '115. राम ने ये करवाया ताकि कोई उसे दोष न दे।', 'english': 'Ram got it done so that nobody blames him.'},
    {'hindi': '116. जब भी उससे पूछा गया, वो लोग चुप हो जाते थे।', 'english': 'Whenever they were asked, those people would keep quiet.'},
    {'hindi': '117. मैं भी किसी से नहीं डरता था।', 'english': 'Even I was not scared of anybody.'},
    {'hindi': '118. जब तक बच्चे नहीं पूछेंगे, उन्हें कैसे पता चलेगा?', 'english': 'Unless children ask, how will they know?'},
    {'hindi': '119. वो तुम्हें आने देगा बशर्ते तुम उसे कुछ पैसे दो।', 'english': 'He will let you come provided you give him some money.'},
    {'hindi': '120. मेरे पास उसके जितनी किताबें क्यों नहीं थी?', 'english': 'Why did I not have as many books as he had?'},
    {'hindi': '121. हमारे घर में भले ही कम्प्यूटर न हो, पर हमने काम करना सीख लिया है।', 'english': 'Even if we don\'t have a computer at home, we have learnt how to work.'},
    {'hindi': '122. हमसे कोई नहीं मिल पाता था शायद इसलिए क्योंकि हम सबसे अलग थे।', 'english': 'Nobody was able to meet us, probably because we were different than others.'},
    {'hindi': '123. उन्हें ही नहीं, उनके परिवार वालों को भी कोर्ट में पेश किया जाना है।', 'english': 'Not only they but also their family members have to be produced in court.'},
    {'hindi': '124. हमने अभी तक किसी को नहीं बुलाया है।', 'english': 'We have not called anyone yet.'},
    {'hindi': '125. बच्चे ने आँखें खोली भी नहीं थी कि उसे मार दिया गया।', 'english': 'The child had not even opened the eyes when he was killed.'},
  ];

  static const List<Map<String, String>> practiceSet6 = [
    {'hindi': '126. भले ही उसने मुझे जाने दिया पर मैं उसका साथ देने की सोच भी नहीं सकता।', 'english': 'Even if he let me go, I can\'t even think of supporting him.'},
    {'hindi': '127. क्या तुम अभी भी ऐसा सोचते हो?', 'english': 'Do you still think so?'},
    {'hindi': '128. हालाँकि उसकी तबीयत खराब है फिर भी मैं उसकी हिम्मत की दाद देता हूँ।', 'english': 'Though he is unwell, still I salute his courage that he has been working since morning.'},
    {'hindi': '129. उसने ऐसा किया ताकि लोग उसकी तारीफ करें।', 'english': 'He did so, so that people appreciate him.'},
    {'hindi': '130. अपने दोस्तों का साथ दो ऐसा न हो कि ज़रूरत पड़ने पर वो तुम्हारा साथ न दे।', 'english': 'Help your friends lest in need, they shouldn\'t help you.'},
    {'hindi': '131. क्या ये वही लड़का है जिसे तुम उस दिन कुछ पूछ रहे थे?', 'english': 'Is this the boy whom you were asking something the other day?'},
    {'hindi': '132. जिसमें मैंने पिया वो पानी नहीं कुछ और था।', 'english': 'That I drank wasn\'t water but something else.'},
    {'hindi': '133. तुम मुझे रोक नहीं पाओगे।', 'english': 'You will not be able to stop me.'},
    {'hindi': '134. क्या वो आज भी मुझे याद करता है?', 'english': 'Does he still miss me?'},
    {'hindi': '135. मैंने अभी तक कुछ नहीं खाया है।', 'english': 'I have not eaten anything as yet.'},
    {'hindi': '136. उसके बारे में भले ही तुम कुछ भी कहो पर उसे मुझ से बेहतर कोई नहीं जानता।', 'english': 'Although you say anything about him, yet nobody knows him better than I.'},
    {'hindi': '137. ऐसा ख्याल तक मुझे नहीं आता।', 'english': 'I can\'t even think so.'},
    {'hindi': '138. वो न कुछ सोच पाया न अपनी बात कह पाया।', 'english': 'He could neither think something nor say what he wanted to.'},
    {'hindi': '139. ऐसी चीज़ें मैं भी नहीं खाता।', 'english': 'I don\'t eat such things either.'},
    {'hindi': '140. या तो वो तुम्हें जाने देगा या फिर ये कहकर रोकेगा कि उसे तुम्हारी जरूरत है।', 'english': 'Either he will let you go or he will stop you, saying that he needs you.'},
    {'hindi': '141. रिश्ते उन्हें कहते हैं जो हमें एक दूसरे से प्यार करना सिखाते हैं।', 'english': 'Relations are those which teach us to love each other.'},
    {'hindi': '142. गांधीजी वो महापुरुष हैं जिनके सिद्धांतों को सुनते हुए मैं बड़ा हुआ।', 'english': 'Gandhi ji is the great man, hearing whose principles I grew up.'},
    {'hindi': '143. जिसने तुम्हें जाने दिया वो मेरा बड़ा भाई था।', 'english': 'The one, who let you go, was my elder brother.'},
    {'hindi': '144. हम भी किसी को नहीं कहते थे।', 'english': 'Even we didn\'t use to say to anyone.'},
    {'hindi': '145. जिसके कंधे पर बैठकर तुमने दुनिया देखी, उनके कंधे को कभी झुकने मत देना।', 'english': 'The one, sitting on whose shoulders you saw the world, don\'t let him ever bow down.'},
    {'hindi': '146. मैंने तुम्हें पूछा तक नहीं कि तुम कैसे हो!', 'english': 'I didn\'t even ask you how you were.'},
    {'hindi': '147. उसे भी ये नहीं बताया गया।', 'english': 'Even he was not told this.'},
    {'hindi': '148. क्या तुम कार चलाना जानते हो?', 'english': 'Do you know how to drive the car?'},
  ];

  // ─── Test Paper I — Q1: Translation (20 sentences) ────────────────────────
  static const List<Map<String, String>> testPaper1Q1 = [
    {'hindi': '1. भले ही ये दूरियाँ बहुत गहरी हैं, फिर भी तुम मेरे दिल के सबसे करीब हो।', 'english': 'Even if the differences are quite deep, still you are the closest to my heart.'},
    {'hindi': '2. राम न मेरा दोस्त था न है।', 'english': 'Ram was neither my friend nor he is.'},
    {'hindi': '3. मैं अभी भी सोच रहा हूँ।', 'english': 'I am still thinking.'},
    {'hindi': '4. वो यही तो चाहती है।', 'english': 'That\'s what she wants.'},
    {'hindi': '5. न वो मेरे जितना गोरा था न तुम्हारे जितना काला।', 'english': 'Neither he was as fair as I nor as dark as you.'},
    {'hindi': '6. राम के दस भाई हैं जबकि मेरे केवल दो।', 'english': 'Ram has 10 brothers whereas I have only two.'},
    {'hindi': '7. हम सब इस तरह खेलते हैं जैसे कि भाई भाई हों।', 'english': 'We all play as if we are brothers.'},
    {'hindi': '8. वो वैसे ही लड़ा जैसा तुमने उसे सिखाया था।', 'english': 'He fought as / the way you had trained him.'},
    {'hindi': '9. मैं राजेन्द्र नहीं, सलमान हूँ।', 'english': 'I am not Rajendra but Salman.'},
    {'hindi': '10. मैंने तुम्हें मैसेज भेजा ही था कि तुमने कॉल कर दी।', 'english': 'No sooner had I messaged you than you called.'},
    {'hindi': '11. मैं सब कुछ देख सकता हूँ, होते हुए पर नहीं देख सकता तुम्हें रोते हुए।', 'english': 'I can see anything happening but you crying.'},
    {'hindi': '12. उसने किताब तक नहीं खोली थी पर पास हो गया।', 'english': 'He had not even opened the book but he passed.'},
    {'hindi': '13. मेरे साथ रहो ताकि कुछ सीख सको।', 'english': 'Be with me so that you could learn something.'},
    {'hindi': '14. मेरे पास भी पैन नहीं है।', 'english': 'I don\'t have a pen either. / Even I don\'t have a pen.'},
    {'hindi': '15. जितनी जल्दी हो सके मेरे घर आओ।', 'english': 'Come to my home as soon as possible.'},
    {'hindi': '16. मेरा ऑफिस भी तुम्हारे ऑफिस जितना ही दूर है।', 'english': 'Even my office is as far as your office.'},
    {'hindi': '17. आसमान के जितना ऊँचा बनो।', 'english': 'Be as high as the sky.'},
    {'hindi': '18. उसका शरीर लोहे की तरह मजबूत था पर दिल एक बच्चे की तरह निर्मल।', 'english': 'His body was as strong as iron but his heart was as innocent as a kid\'s.'},
    {'hindi': '19. बच्चे ही नहीं टीचर्स भी आये थे।', 'english': 'Not only students but also teachers had come.'},
    {'hindi': '20. मैं तुम्हें किताब दूँगा पर तब जब तुम इसे रोज पढ़ो।', 'english': 'I\'ll give you the book provided you read it daily.'},
  ];

  // ─── Test Paper I — Q2: MCQ (correct answers with explanations) ───────────
  static const List<Map<String, String>> testPaper1Q2 = [
    {
      'question': 'My father always scolds me ___ he was Hitler.',
      'options': 'i) Even  ii) However  iii) As though  iv) So that',
      'answer': 'iii) As though',
      'explanation': '"मानो" = as though/as if (imaginary comparison).',
    },
    {
      'question': 'I have not met him ___.',
      'options': 'i) Till now  ii) As Yet  iii) So far  iv) Still',
      'answer': 'ii) As Yet',
      'explanation': '"As yet" is the most natural here. "Till now" is incorrect; "still" goes mid-sentence.',
    },
    {
      'question': 'Work hard lest you ___ fail.',
      'options': 'i) will  ii) should  iii) can  iv) might',
      'answer': 'ii) should',
      'explanation': 'Rule: "lest" is always followed by "should".',
    },
    {
      'question': 'I can\'t say ___ he will come.',
      'options': 'i) If  ii) That  iii) Whether  iv) as',
      'answer': 'iii) Whether',
      'explanation': '"I can\'t say whether" = indirect yes/no doubt.',
    },
    {
      'question': 'Either you or he ___ wrong.',
      'options': 'i) Am  ii) Are  iii) Is  iv) Were',
      'answer': 'iii) Is',
      'explanation': 'With "either...or", verb agrees with the closer subject (he → is).',
    },
    {
      'question': 'Did you not go there ___?',
      'options': 'i) also  ii) even  iii) either  iv) too',
      'answer': 'iii) either',
      'explanation': 'Negative interrogative → "either" for "भी".',
    },
    {
      'question': 'Although I am your friend, ___ it doesn\'t mean you make me fool.',
      'options': 'i) then also  ii) yet  iii) however  iv) still',
      'answer': 'ii) yet',
      'explanation': '"Although...yet" is the correct pair.',
    },
    {
      'question': 'He can\'t ___ go there.',
      'options': 'i) even  ii) either  iii) yet  iv) still',
      'answer': 'i) even',
      'explanation': '"Even" intensifies negation in statements: "He can\'t even go there."',
    },
    {
      'question': 'He as well as his friends ___ coming.',
      'options': 'i) is  ii) are  iii) were  iv) have been',
      'answer': 'i) is',
      'explanation': '"As well as" → verb agrees with first subject (he → is).',
    },
    {
      'question': 'Whether he ___ or not, I must go.',
      'options': 'i) comes  ii) came  iii) come  iv) will come',
      'answer': 'i) comes',
      'explanation': '"Whether" + Present Indefinite. 3rd person singular → comes.',
    },
  ];

  // ─── Test Paper I — Q3: Error Correction ──────────────────────────────────
  static const List<Map<String, String>> testPaper1Q3 = [
    {
      'incorrect': 'I will give you the book provided you will read that daily.',
      'correct': 'I will give you the book provided you read that daily.',
      'rule': '"Provided" → Present Indefinite (not Future).',
    },
    {
      'incorrect': 'My friends have not reached till now.',
      'correct': 'My friends have not reached yet / as yet.',
      'rule': '"Till now" is wrong; use "yet" or "as yet" with Present Perfect.',
    },
    {
      'incorrect': 'I will see whether he is at home.',
      'correct': 'I will see if he is at home.',
      'rule': '"Whether" is for yes/no doubt. "If" is used in reported speech here.',
    },
    {
      'incorrect': 'Read the whole book thoroughly lest you may fail.',
      'correct': 'Read the whole book thoroughly lest you should fail.',
      'rule': '"Lest" → "should" (not may/will/might).',
    },
    {
      'incorrect': 'Even if he will go, I don\'t care.',
      'correct': 'Even if he goes, I don\'t care.',
      'rule': '"Even if" → Present Indefinite (not Future).',
    },
    {
      'incorrect': 'I am even now thinking about her.',
      'correct': 'I am thinking about her even now. / I am still thinking about her.',
      'rule': '"Even now" goes at the END. Or use "still" mid-sentence.',
    },
    {
      'incorrect': 'As soon as Dad came, I started study.',
      'correct': 'As soon as Dad came, I started studying.',
      'rule': '"Started" is followed by verb+ing.',
    },
    {
      'incorrect': 'You ordered me as if you are my boss.',
      'correct': 'You ordered me as if you were my boss.',
      'rule': '"As if" → Past tense (were) for imaginary/unreal situations.',
    },
    {
      'incorrect': 'Because I lost everything, I am depressed.',
      'correct': 'Since/As/For I lost everything, I am depressed.',
      'rule': '"Because" cannot start a sentence. Use Since/As/For at the beginning.',
    },
    {
      'incorrect': 'While walk, he was studying.',
      'correct': 'While walking, he was studying.',
      'rule': '"While" → verb+ing.',
    },
  ];

  // ─── Test Paper II — Q1: Translation (30 sentences) ──────────────────────
  static const List<Map<String, String>> testPaper2Q1 = [
    {'hindi': '1. मेरा घर तुम्हारे घर जितना ही दूर है।', 'english': 'My house is as far as your house.'},
    {'hindi': '2. मैं राहुल नहीं रोहन हूँ।', 'english': 'I am not Rahul but Rohit.'},
    {'hindi': '3. मैं तुम्हारे घर के सिवाय कहीं भी जा सकता हूँ।', 'english': 'I can go anywhere but your home.'},
    {'hindi': '4. तुम न अच्छे हो न बुरे।', 'english': 'You are neither good nor bad.'},
    {'hindi': '5. तुम या तो कम्प्यूटर ले लो या लैपटॉप।', 'english': 'Either take a computer or a laptop.'},
    {'hindi': '6. राम कुछ भी कर सकता है पर किसी का दिल नहीं दुखा सकता।', 'english': 'Ram can do anything but hurt someone.'},
    {'hindi': '7. तुम एक अच्छे इन्सान नहीं हो। मैं भी नहीं।', 'english': 'You are not a good person. Even I am not. / I am not either.'},
    {'hindi': '8. मैं आम नहीं खाता, तुम भी नहीं खाते।', 'english': 'I don\'t eat mangoes. You don\'t either.'},
    {'hindi': '9. भले ही वो कभी स्कूल नहीं गया, फिर भी गजब की अंग्रेजी बोलता है।', 'english': 'Even if he never went to school, yet he speaks excellent English.'},
    {'hindi': '10. राकेश के पास कई गाडियाँ हैं जैसे मर्सिडीज, होन्डा आदि।', 'english': 'Rakesh has many cars such as Mercedes, Honda etc.'},
    {'hindi': '11. वो इतना अच्छा दोस्त था कि मैं बता नहीं सकता।', 'english': 'He was such a good friend that I can\'t even tell you.'},
    {'hindi': '12. तुम उतनी दूर तक कभी नहीं दौड़ सकते जितना मैं दौड़ सकता हूँ।', 'english': 'You can never run as far as I can.'},
    {'hindi': '13. तुम मिलने आ सकते हो जब तक मैं ऑफिस में हूँ।', 'english': 'You can come to meet till I am in office.'},
    {'hindi': '14. जितनी जल्दी हो सके खाना खा लो।', 'english': 'Eat the food as soon as possible.'},
    {'hindi': '15. न मैंने खाया, न पिया।', 'english': 'Neither I ate nor drank.'},
    {'hindi': '16. मेहनत करो ताकि इग्जाम में पास हो सको।', 'english': 'Work hard so that you could pass the exam.'},
    {'hindi': '17. मैं अभी तक उससे नहीं मिला हूँ।', 'english': 'I have not met him yet.'},
    {'hindi': '18. इस तरह के लोग किसी से नहीं मिलते।', 'english': 'Such people don\'t meet anyone.'},
    {'hindi': '19. जब तक तुम मेहनत नहीं करते, सफल नहीं होगे।', 'english': 'Unless you work hard, you can\'t succeed.'},
    {'hindi': '20. चाहे तुम आओ या न आओ, मैं जा रहा हूँ।', 'english': 'Whether you come or not, I am going.'},
    {'hindi': '21. मैं कह नहीं सकता वो आयेगा या नहीं।', 'english': 'I can\'t say whether he will come or not.'},
    {'hindi': '22. वो 5000 रु कमा रहा है जबकि तुम 10000।', 'english': 'He is earning Rs 5000 whereas you earn 10000.'},
    {'hindi': '23. यही तो मैंने तुम्हें कहा।', 'english': 'That\'s what I said to you.'},
    {'hindi': '24. न तुमने कुछ कहा, न उसने।', 'english': 'Neither you said anything nor he.'},
    {'hindi': '25. लोग अभी भी उससे लड़ रहे हैं।', 'english': 'People are still fighting with him.'},
    {'hindi': '26. भले ही तुम मुझे पैसे दे दो, मैं ये नहीं करूँगा।', 'english': 'Even if you give me money, I will not do it.'},
    {'hindi': '27. मैं तुमसे लड़ने को तैयार हूँ बशर्ते तुम उसे छोड़ दो।', 'english': 'I am ready to fight you, provided you leave him.'},
    {'hindi': '28. अगर तुम दिल्ली आओ तो मुझसे जरूर मिलना।', 'english': 'If you visit Delhi, meet me for sure.'},
    {'hindi': '29. मैं वहीं तो जा रहा हूँ।', 'english': 'That\'s where I am going.'},
    {'hindi': '30. तुम न केवल एक भाई हो बल्कि एक पिता भी हो।', 'english': 'You are not only a brother but also a father.'},
  ];

  // ─── Test Paper II — Q2: Error Correction ─────────────────────────────────
  static const List<Map<String, String>> testPaper2Q2 = [
    {
      'incorrect': 'You don\'t like me. I don\'t like you too.',
      'correct': 'You don\'t like me. I don\'t like you either.',
      'rule': 'In negative sentences, "भी" = "either" (not "too").',
    },
    {
      'incorrect': 'If I will go to market, I will meet you.',
      'correct': 'If I go to market, I will meet you.',
      'rule': '"If" clause → Present Indefinite (not Future).',
    },
    {
      'incorrect': 'Computer is such device, which can stop working anytime.',
      'correct': 'Computer is such a device, which can stop working anytime.',
      'rule': '"Such a" (with singular countable noun) — article "a" required.',
    },
    {
      'incorrect': 'Weather you go or not, I will go to Shimla.',
      'correct': 'Whether you go or not, I will go to Shimla.',
      'rule': 'Spelling: "Whether" (not "weather").',
    },
    {
      'incorrect': 'That\'s what I am telling you since morning.',
      'correct': 'That\'s what I have been telling you since morning.',
      'rule': '"Since" with a time reference → Present Perfect Continuous.',
    },
    {
      'incorrect': 'He is not only a manager, but a student as well.',
      'correct': 'He is not only a manager, but also a student.',
      'rule': '"Not only...but also" is the correct pair (not "but...as well").',
    },
    {
      'incorrect': 'He is not in office since he is unwell.',
      'correct': 'He is not in office because/as/for he is unwell.',
      'rule': '"Since" (time) ≠ "since" (reason) in mid-sentence. Use because/as/for.',
    },
    {
      'incorrect': 'He is working like a manager.',
      'correct': 'He is working as a manager.',
      'rule': '"As" = role/capacity. "Like" = manner/similarity.',
    },
    {
      'incorrect': 'He has as much pencils as you have.',
      'correct': 'He has as many pencils as you have.',
      'rule': '"Many" for countable nouns (pencils). "Much" for uncountable.',
    },
    {
      'incorrect': 'I am not yet satisfied.',
      'correct': 'I am not satisfied yet / as yet. / I am yet not satisfied.',
      'rule': '"Yet" goes at the END of sentence in negatives, or "yet not" mid-sentence.',
    },
  ];
}