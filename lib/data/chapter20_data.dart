import '../models/lesson_model.dart';

/// Chapter 20 — It (इट)
class Chapter20Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 20,
        title: 'It (इट)',
        titleHindi: 'It का प्रयोग',
        description: 'It — यह/ये — 4 Concepts with time, weather & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Concept 1 — It vs This',
              titleHindi: 'It और This का अंतर',
              emoji: '🔄',
              type: LessonType.ch20Concept1,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 2,
              title: 'Concept 2 — It as Subject (Day)',
              titleHindi: 'It — दिन/तारीख के लिए Subject',
              emoji: '📅',
              type: LessonType.ch20Concept2,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 3,
              title: 'Concept 3 — समय हो गया है/था',
              titleHindi: 'It has/had been — समय बीतना',
              emoji: '⌛',
              type: LessonType.ch20Concept3,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 4,
              title: 'Concept 4 — समय लगना (Take)',
              titleHindi: 'It takes — समय लगना',
              emoji: '⏱️',
              type: LessonType.ch20Concept4,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 5,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास — 100 वाक्य',
              emoji: '✍️',
              type: LessonType.ch20Practice,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 6,
              title: 'Test Paper I',
              titleHindi: 'टेस्ट पेपर — I (Hindi → English)',
              emoji: '📝',
              type: LessonType.ch20TestPaper1,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 7,
              title: 'Test Paper II',
              titleHindi: 'टेस्ट पेपर — II (English → Hindi)',
              emoji: '📋',
              type: LessonType.ch20TestPaper2,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 8,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch20ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 50),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch20Concept1:     return concept1Questions;
      case LessonType.ch20Concept2:     return concept2Questions;
      case LessonType.ch20Concept3:     return concept3Questions;
      case LessonType.ch20Concept4:     return concept4Questions;
      case LessonType.ch20Practice:     return practiceQuizQuestions;
      case LessonType.ch20TestPaper1:   return testPaper1QuizQuestions;
      case LessonType.ch20TestPaper2:   return testPaper2QuizQuestions;
      case LessonType.ch20ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CONCEPT 1 QUIZ — It vs This
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept1Questions = [
    QuizQuestion(
      questionEn: '"It" can be used for ___.',
      questionHi: '"It" का प्रयोग किसके लिए होता है?',
      options: ['Only living beings', 'Only non-living things', 'Both living and non-living', 'Only animals'],
      correctIndex: 1,
      explanation: '"It" is used only for non-living things (निर्जीव)। "This" can be used for both living and non-living.',
    ),
    QuizQuestion(
      questionEn: '"यह मेरा दोस्त राम है।" — Which is correct?',
      questionHi: '"यह मेरा दोस्त राम है।" — कौन सा सही है?',
      options: ['It is my friend Ram.', 'This is my friend Ram.', 'Both are correct.', 'Neither is correct.'],
      correctIndex: 1,
      explanation: 'Ram is a living being (सजीव) → only "This" is correct. "It" cannot be used for living beings.',
    ),
    QuizQuestion(
      questionEn: '"यह प्यार है।" — Both "It" and "This" correct?',
      questionHi: '"यह प्यार है।" — क्या "It" और "This" दोनों सही हैं?',
      options: ['Only It is correct', 'Only This is correct', 'Both are correct', 'Neither'],
      correctIndex: 2,
      explanation: '"Love" is non-living → both "This is love" and "It is love" are correct.',
    ),
    QuizQuestion(
      questionEn: '"यह एक पैन है।" — English?',
      questionHi: '"यह एक पैन है।"',
      options: ['This is a pen. (only)', 'It is a pen. (only)', 'Both "This is a pen" and "It is a pen" are correct.', 'Neither is correct.'],
      correctIndex: 2,
      explanation: 'A pen is non-living → both "This is a pen" and "It is a pen" are correct.',
    ),
    QuizQuestion(
      questionEn: 'In modern English, "It" used with living beings is ___.',
      questionHi: 'Modern English में "It" का सजीव के साथ प्रयोग?',
      options: ['Always wrong', 'Correct', 'An exception sometimes seen', 'Compulsory'],
      correctIndex: 2,
      explanation: 'Technically "It" is for non-living, but in modern English exceptions exist like "It\'s my friend, Rahul." — it\'s an exception.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONCEPT 2 QUIZ — It as Subject (Day/Date)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept2Questions = [
    QuizQuestion(
      questionEn: 'A sentence CANNOT start with a ___.',
      questionHi: 'वाक्य की शुरुआत ___ से नहीं हो सकती।',
      options: ['Noun', 'Pronoun', 'Day (Monday, Yesterday, Today...)', 'Verb'],
      correctIndex: 2,
      explanation: 'No sentence can start with a day/date. "Today is Monday" is incorrect → correct: "It is Monday today."',
    ),
    QuizQuestion(
      questionEn: '"आज सोमवार है।" — Correct English?',
      questionHi: '"आज सोमवार है।" — सही अंग्रेज़ी?',
      options: ['Today is Monday.', 'Monday is today.', 'It is Monday today.', 'It is today Monday.'],
      correctIndex: 2,
      explanation: 'Sentences with day/date use "It" as subject. "It is Monday today." is the correct form.',
    ),
    QuizQuestion(
      questionEn: '"कल छुट्टी थी।" — English?',
      questionHi: '"कल छुट्टी थी।"',
      options: ['Yesterday was holiday.', 'It was holiday yesterday.', 'Holiday was yesterday.', 'There was holiday yesterday.'],
      correctIndex: 1,
      explanation: '"It was holiday yesterday." — "It" is used as subject when a day/date is mentioned.',
    ),
    QuizQuestion(
      questionEn: '"परसों क्या था?" — English?',
      questionHi: '"परसों क्या था?"',
      options: ['What was day before yesterday?', 'What was it day before yesterday?', 'Day before yesterday was what?', 'It was what day before yesterday?'],
      correctIndex: 1,
      explanation: '"What was it day before yesterday?" — "It" replaces the subject when asking about a day.',
    ),
    QuizQuestion(
      questionEn: '"आज मेरा जन्मदिन है।" — English?',
      questionHi: '"आज मेरा जन्मदिन है।"',
      options: ['Today is my birthday.', 'My birthday is today.', 'It is my birthday today.', 'This is my birthday today.'],
      correctIndex: 2,
      explanation: '"It is my birthday today." — "It" as subject when mentioning what today is.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONCEPT 3 QUIZ — It has/had been (समय हो गया)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept3Questions = [
    QuizQuestion(
      questionEn: '"दो दिन हो गये हैं।" — English?',
      questionHi: '"दो दिन हो गये हैं।"',
      options: ['Two days have been.', 'It has been 2 days.', 'It had been 2 days.', 'It is 2 days.'],
      correctIndex: 1,
      explanation: 'समय हो चुका है/गया है → "It has been" + time. "It has been 2 days."',
    ),
    QuizQuestion(
      questionEn: '"कई साल हो चुके थे।" — English?',
      questionHi: '"कई साल हो चुके थे।"',
      options: ['It has been many years.', 'It have been many years.', 'It had been many years.', 'It will have been many years.'],
      correctIndex: 2,
      explanation: 'समय हो चुका था/गया था → "It had been" + time. "It had been many years."',
    ),
    QuizQuestion(
      questionEn: '"मुझे पढ़ते हुए दो साल हो गये हैं।" — English?',
      questionHi: '"मुझे पढ़ते हुए दो साल हो गये हैं।" — Subject अभी भी काम कर रहा है।',
      options: [
        'It has been 2 years to me having studied.',
        'It has been 2 years to me studying.',
        'It has been 2 years to me studied.',
        'It has been 2 years to me to study.',
      ],
      correctIndex: 1,
      explanation: 'जब Subject अभी भी क्रिया कर रहा हो → V1 + ing. "It has been 2 years to me studying." (still studying)',
    ),
    QuizQuestion(
      questionEn: '"मुझे पढ़े हुए दो साल हो गये हैं।" — English?',
      questionHi: '"मुझे पढ़े हुए दो साल हो गये हैं।" — Subject काम कर चुका है।',
      options: [
        'It has been 2 years to me studying.',
        'It has been 2 years to me having studied.',
        'It has been 2 years to me to have studied.',
        'It has been 2 years to me study.',
      ],
      correctIndex: 1,
      explanation: 'जब Subject क्रिया कर चुका हो (पहले हुई) → having + V3. "It has been 2 years to me having studied."',
    ),
    QuizQuestion(
      questionEn: '"कितने दिन हो गये हैं?" — English?',
      questionHi: '"कितने दिन हो गये हैं?"',
      options: ['How many days it has been?', 'How many days have been?', 'How many days has it been?', 'How many days had it been?'],
      correctIndex: 2,
      explanation: '"How many days has it been?" — It + has been in interrogative form.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONCEPT 4 QUIZ — It takes / समय लगना
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> concept4Questions = [
    QuizQuestion(
      questionEn: '"दो मिनट लगते हैं।" (no subject) — English?',
      questionHi: '"दो मिनट लगते हैं।" — वाक्य में Subject नहीं है।',
      options: ['Two minutes take.', 'It takes two minutes.', 'Takes two minutes.', 'Two minutes are taken.'],
      correctIndex: 1,
      explanation: 'जब वाक्य में Subject न हो तो "It" को Subject की तरह प्रयोग करें। "It takes two minutes."',
    ),
    QuizQuestion(
      questionEn: '"मुझे दो मिनट लगते हैं।" — English?',
      questionHi: '"मुझे दो मिनट लगते हैं।"',
      options: [
        'It takes me two minutes. / I take two minutes.',
        'I am taking two minutes.',
        'It is taking me two minutes.',
        'Two minutes take me.',
      ],
      correctIndex: 0,
      explanation: 'Subject (मुझे) होने पर: "I take two minutes." OR "It takes two minutes to me." — दोनों सही।',
    ),
    QuizQuestion(
      questionEn: '"पहुँचने में 2 मिनट लगते हैं।" — English?',
      questionHi: '"पहुँचने में 2 मिनट लगते हैं।"',
      options: [
        'It takes 2 minutes for reaching.',
        'It takes 2 minutes to reach.',
        'It is taking 2 minutes to reach.',
        'Reaching takes 2 minutes.',
      ],
      correctIndex: 1,
      explanation: '"It takes 2 minutes to reach." — क्रिया के लिए "to + V1" का प्रयोग।',
    ),
    QuizQuestion(
      questionEn: '"दो मिनट लगेंगे।" — English?',
      questionHi: '"दो मिनट लगेंगे।"',
      options: ['It takes 2 minutes.', 'It took 2 minutes.', 'It will take 2 minutes.', 'It has taken 2 minutes.'],
      correctIndex: 2,
      explanation: '"लगेंगे" = Future Indefinite → "will take". "It will take 2 minutes."',
    ),
    QuizQuestion(
      questionEn: '"राम को पहुँचने में 2 मिनट लगे।" — English?',
      questionHi: '"राम को पहुँचने में 2 मिनट लगे।"',
      options: [
        'It took Ram 2 minutes to reach. / Ram took 2 minutes to reach.',
        'Ram takes 2 minutes to reach.',
        'It takes Ram 2 minutes to reach.',
        'Ram will take 2 minutes to reach.',
      ],
      correctIndex: 0,
      explanation: '"Ram took 2 minutes to reach." OR "It took Ram 2 minutes to reach." — Past Indefinite with subject.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE QUIZ — 5 from 100 sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionEn: '"आज सोमवार नहीं है।" — English?',
      questionHi: '"आज सोमवार नहीं है।"',
      options: ['Today is not Monday.', 'It is not Monday today.', 'Monday is not today.', 'It is not today Monday.'],
      correctIndex: 1,
      explanation: '"It is not Monday today." — Day sentences always use "It" as subject.',
    ),
    QuizQuestion(
      questionEn: '"जब मैं वहाँ पहुँचा, बारिश हो रही थी।" — English?',
      questionHi: '"जब मैं वहाँ पहुँचा, बारिश हो रही थी।"',
      options: [
        'When I reached there, rain was happening.',
        'When I reached there, it was raining.',
        'When I reached there, it rained.',
        'When I reached there, it had rained.',
      ],
      correctIndex: 1,
      explanation: 'Weather sentences use "It". Past Continuous = "it was raining". "When I reached there, it was raining."',
    ),
    QuizQuestion(
      questionEn: '"2 मिनट लग रहे हैं।" — English?',
      questionHi: '"2 मिनट लग रहे हैं।"',
      options: ['It takes 2 minutes.', 'It is taking 2 minutes.', 'It was taking 2 minutes.', 'It took 2 minutes.'],
      correctIndex: 1,
      explanation: '"लग रहे हैं" = Present Continuous → "is taking". "It is taking 2 minutes."',
    ),
    QuizQuestion(
      questionEn: '"तुम्हें देखे हुए मुझे करीब 2 साल हो गये हैं।" — English?',
      questionHi: '"तुम्हें देखे हुए मुझे करीब 2 साल हो गये हैं।"',
      options: [
        'It has been about 2 years to me seeing you.',
        'It has been about 2 years to me having seen you.',
        'It had been about 2 years to me having seen you.',
        'It is about 2 years to me having seen you.',
      ],
      correctIndex: 1,
      explanation: 'देखे हुए (action done, time passed) → having + V3. हो गये हैं → has been. "It has been about 2 years to me having seen you."',
    ),
    QuizQuestion(
      questionEn: '"अगर बारिश हुई तो मैं भीग जाऊँगा।" — English?',
      questionHi: '"अगर बारिश हुई तो मैं भीग जाऊँगा।"',
      options: [
        'If rain happens, I will be drenched.',
        'If it rained, I will be drenched.',
        'If it rains, I will be drenched.',
        'If it will rain, I will be drenched.',
      ],
      correctIndex: 2,
      explanation: 'Weather → "it rains". Conditional present → "If it rains, I will be drenched."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER 1 QUIZ — 5 from 50 sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionEn: '"उसे काफी समय हो गया है।" — English?',
      questionHi: '"उसे काफी समय हो गया है।"',
      options: ['It has been a long time.', 'It has been a long to him.', 'It had been a long to him.', 'It is a long to him.'],
      correctIndex: 1,
      explanation: '"It has been a long to him." — समय हो गया है = has been. उसे = to him.',
    ),
    QuizQuestion(
      questionEn: '"ये करते हुए हमें 2 साल हो चुके थे।" — English?',
      questionHi: '"ये करते हुए हमें 2 साल हो चुके थे।" — Subject अभी भी करते हुए।',
      options: [
        'It had been 2 years to us having done this.',
        'It has been 2 years to us doing this.',
        'It had been 2 years to us doing this.',
        'It had been 2 years to us to do this.',
      ],
      correctIndex: 2,
      explanation: 'करते हुए (still doing) → V+ing. हो चुके थे → had been. "It had been 2 years to us doing this."',
    ),
    QuizQuestion(
      questionEn: '"बारिश हो सकती थी पर हुई नहीं।" — English?',
      questionHi: '"बारिश हो सकती थी पर हुई नहीं।"',
      options: [
        'It could rain but didn\'t.',
        'It could have rained but didn\'t.',
        'It might rain but didn\'t.',
        'It may have rained but didn\'t.',
      ],
      correctIndex: 1,
      explanation: '"Could have rained but didn\'t" = past possibility that didn\'t happen. "It could have rained but didn\'t."',
    ),
    QuizQuestion(
      questionEn: '"तुम पर निर्भर करता है।" — English?',
      questionHi: '"तुम पर निर्भर करता है।"',
      options: ['Depends on you.', 'This depends on you.', 'It depends on you.', 'That depends on you.'],
      correctIndex: 2,
      explanation: 'No subject in Hindi → "It" as dummy subject. "It depends on you."',
    ),
    QuizQuestion(
      questionEn: '"मुझे यहाँ रहते हुए 10 साल हो गये हैं।" — English?',
      questionHi: '"मुझे यहाँ रहते हुए 10 साल हो गये हैं।"',
      options: [
        'It has been 10 years to me having lived here.',
        'It had been 10 years to me living here.',
        'It has been 10 years to me living here.',
        'It is 10 years to me living here.',
      ],
      correctIndex: 2,
      explanation: 'रहते हुए (still living) → living. हो गये हैं → has been. "It has been 10 years to me living here."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER 2 QUIZ — 5 from 50 English→Hindi sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionEn: '"It was nothing but his vision." — Hindi?',
      questionHi: '"It was nothing but his vision."',
      options: [
        'ये उसका विज़न था।',
        'ये कुछ और नहीं बल्कि उसका दृष्टिकोण था।',
        'ये उसकी सोच नहीं थी।',
        'उसका विज़न कुछ था।',
      ],
      correctIndex: 1,
      explanation: '"It was nothing but" = "ये कुछ और नहीं बल्कि". "It was nothing but his vision." = "ये कुछ और नहीं बल्कि उसका दृष्टिकोण था।"',
    ),
    QuizQuestion(
      questionEn: '"It has been centuries having someone come here." — Hindi?',
      questionHi: '"It has been centuries having someone come here."',
      options: [
        'सदियों से यहाँ कोई नहीं आया।',
        'सदियाँ बीत गई हैं, यहाँ कोई आये हुए।',
        'यहाँ कोई सदियों से आ रहा है।',
        'यहाँ आये हुए सदियाँ हो गई थीं।',
      ],
      correctIndex: 1,
      explanation: '"has been centuries having someone come here" = "सदियाँ बीत गई हैं, यहाँ कोई आये हुए।"',
    ),
    QuizQuestion(
      questionEn: '"It took me lots of time." — Hindi?',
      questionHi: '"It took me lots of time."',
      options: ['मुझे कम समय लगा।', 'मुझे काफी/बहुत समय लगा।', 'मैंने काफी समय लिया।', 'काफी समय लग रहा था।'],
      correctIndex: 1,
      explanation: '"It took me lots of time." = "मुझे काफी/बहुत समय लगा।" — took = लगा (Past Indefinite).',
    ),
    QuizQuestion(
      questionEn: '"It wasn\'t my cup of tea." — Hindi?',
      questionHi: '"It wasn\'t my cup of tea."',
      options: [
        'ये मेरी चाय का कप नहीं था।',
        'ये मेरे बस की बात नहीं थी।',
        'ये मेरा काम नहीं था।',
        'मुझे चाय पसंद नहीं है।',
      ],
      correctIndex: 1,
      explanation: '"Not my cup of tea" = a phrase meaning something is not within one\'s ability/interest = "मेरे बस की बात नहीं".',
    ),
    QuizQuestion(
      questionEn: '"It might change your mind." — Hindi?',
      questionHi: '"It might change your mind."',
      options: [
        'ये बात तुम्हारा मन बदल देगी।',
        'ये बात तुम्हारा मन बदल सकती है।',
        'ये बात तुम्हारा मन बदल रही है।',
        'ये बात तुम्हारा मन बदल गई।',
      ],
      correctIndex: 1,
      explanation: '"might" = शायद हो सके / सकती है (possibility). "It might change your mind." = "ये बात तुम्हारा मन बदल सकती है।"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 10 questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"It" is used for ___ in Concept 1.',
      questionHi: 'Concept 1 में "It" किसके लिए होता है?',
      options: ['Living beings only', 'Non-living things only', 'Both', 'Days and dates'],
      correctIndex: 1,
      explanation: '"It" = only non-living (निर्जीव). "This" = both living and non-living.',
    ),
    QuizQuestion(
      questionEn: '"कल रविवार था।" — English?',
      questionHi: '"कल रविवार था।"',
      options: ['Yesterday was Sunday.', 'It was Sunday yesterday.', 'Sunday was yesterday.', 'It is Sunday yesterday.'],
      correctIndex: 1,
      explanation: 'Day sentences → "It" as subject. Past = was. "It was Sunday yesterday."',
    ),
    QuizQuestion(
      questionEn: '"समय हो चुका है/गया है" in English uses ___.',
      questionHi: '"समय हो चुका है/गया है" के लिए?',
      options: ['It takes', 'It had been', 'It has been', 'It is'],
      correctIndex: 2,
      explanation: 'समय हो चुका है/गया है → "It has been". समय हो चुका था/गया था → "It had been".',
    ),
    QuizQuestion(
      questionEn: 'V+ing vs having+V3 — which for "अभी भी कर रहा है"?',
      questionHi: '"अभी भी कर रहा है" के लिए कौन सा form?',
      options: ['having + V3', 'V + ing', 'to + V1', 'V3 only'],
      correctIndex: 1,
      explanation: 'अभी भी क्रिया जारी है → V+ing (e.g. studying, living). क्रिया हो चुकी है → having + V3.',
    ),
    QuizQuestion(
      questionEn: '"दो मिनट लगते हैं।" (no subject) — English?',
      questionHi: '"दो मिनट लगते हैं।" — subject नहीं है।',
      options: ['Two minutes take.', 'It takes two minutes.', 'It is taking two minutes.', 'It took two minutes.'],
      correctIndex: 1,
      explanation: 'No subject → "It" as dummy subject. Present Indefinite → takes. "It takes two minutes."',
    ),
    QuizQuestion(
      questionEn: '"मुझे पहुँचने में 2 मिनट लगते हैं।" — Best English?',
      questionHi: '"मुझे पहुँचने में 2 मिनट लगते हैं।"',
      options: ['I take 2 minutes to reach.', 'It takes 2 minutes to reach.', 'Both A and B are correct.', 'It reaches 2 minutes.'],
      correctIndex: 2,
      explanation: '"I take 2 minutes to reach." OR "It takes 2 minutes to me to reach." — Both are correct.',
    ),
    QuizQuestion(
      questionEn: '"बारिश हो रही थी।" — English?',
      questionHi: '"बारिश हो रही थी।"',
      options: ['Rain was happening.', 'It was raining.', 'It rained.', 'It had rained.'],
      correctIndex: 1,
      explanation: 'Weather → "It". Past Continuous = was raining. "It was raining."',
    ),
    QuizQuestion(
      questionEn: '"राम को मिले हुए 2 साल हो गये थे।" — English?',
      questionHi: '"राम को मिले हुए 2 साल हो गये थे।"',
      options: [
        'It has been 2 years to Ram having met.',
        'It had been 2 years to Ram having met.',
        'It had been 2 years to Ram meeting.',
        'It has been 2 years to Ram meeting.',
      ],
      correctIndex: 1,
      explanation: 'मिले हुए (action done) → having met. हो गये थे → had been. "It had been 2 years to Ram having met."',
    ),
    QuizQuestion(
      questionEn: '"ये कुछ और नहीं, एक कोशिश है।" — English?',
      questionHi: '"ये कुछ और नहीं, एक कोशिश है।"',
      options: ['It is something else, a try.', 'It is nothing else but a try.', 'This is not a try.', 'It is not a try.'],
      correctIndex: 1,
      explanation: '"ये कुछ और नहीं" = "It is nothing else but". "It is nothing else but a try."',
    ),
    QuizQuestion(
      questionEn: '"तुम पर निर्भर करता है।" — English?',
      questionHi: '"तुम पर निर्भर करता है।"',
      options: ['This depends on you.', 'You depend.', 'It depends on you.', 'Depends you.'],
      correctIndex: 2,
      explanation: 'No subject in Hindi → "It" as dummy subject. "It depends on you."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ─── Concept 1 — It vs This ───────────────────────────────────────────────
  static const List<Map<String, String>> concept1Examples = [
    {'hindi': 'यह एक पैन है।',      'this': 'This is a pen. ✅',     'it': 'It is a pen. ✅',     'note': 'Pen = non-living → both correct'},
    {'hindi': 'यह प्यार है।',        'this': 'This is love. ✅',      'it': 'It is love. ✅',      'note': 'Love = non-living → both correct'},
    {'hindi': 'यह मेरा दोस्त राम है।','this': 'This is my friend Ram. ✅','it': 'It is my friend Ram. ❌','note': 'Ram = living → only This correct'},
  ];

  // ─── Concept 2 — Day/Date as Subject ─────────────────────────────────────
  static const List<Map<String, String>> concept2Examples = [
    {'hindi': 'कल छुट्टी थी।',         'english': 'It was holiday yesterday.'},
    {'hindi': 'आज मेरा जन्मदिन है।',   'english': 'It is my birthday today.'},
    {'hindi': 'कल छुट्टी होगी।',        'english': 'It will be holiday tomorrow.'},
    {'hindi': 'उस दिन कुछ खास था।',    'english': 'It was something special that day.'},
    {'hindi': 'परसों क्या था?',          'english': 'What was it day before yesterday?'},
    {'hindi': 'कल रविवार था।',          'english': 'It was Sunday yesterday.'},
  ];

  // ─── Concept 3 — It has/had been ─────────────────────────────────────────
  static const List<Map<String, String>> concept3BasicExamples = [
    {'hindi': 'दो दिन हो गये हैं।',     'english': 'It has been 2 days.'},
    {'hindi': 'दो साल हो चुके हैं।',    'english': 'It has been 2 years.'},
    {'hindi': 'कई साल हो चुके थे।',     'english': 'It had been many years.'},
    {'hindi': 'सदियाँ बीत चुकी हैं।',   'english': 'It has been centuries.'},
    {'hindi': 'करीब दो घंटे हो गये हैं।','english': 'It has been about 2 hours.'},
  ];

  static const List<Map<String, String>> concept3WithPersonExamples = [
    {'hindi': 'मुझे दो दिन हो गये हैं।',     'english': 'It has been 2 days to me.'},
    {'hindi': 'राम को 6 साल हो गये हैं।',    'english': 'It has been 6 years to Ram.'},
    {'hindi': 'सीता को 5 महीने हो चुके हैं।', 'english': 'It has been 5 months to Seeta.'},
    {'hindi': 'मुझे 3 साल हो गये थे।',       'english': 'It had been 3 years to me.'},
  ];

  static const List<Map<String, String>> concept3VerbExamples = [
    {'hindi': 'मुझे दो दिन हो गए हैं।',                  'english': 'It has been 2 days to me.'},
    {'hindi': 'मुझे मिलते हुए दो दिन हो गए हैं।',        'english': 'It has been 2 days to me meeting.',    'note': 'अभी भी मिल रहा हूँ → V+ing'},
    {'hindi': 'मुझे मिले हुए दो दिन हो गए हैं।',         'english': 'It has been 2 days to me having met.', 'note': 'पहले मिल चुका था → having + V3'},
    {'hindi': 'राम को 2 साल हो गए थे।',                 'english': 'It had been 2 years to Ram.'},
    {'hindi': 'राम को मुझसे मिलते हुए 2 साल हो गए थे।', 'english': 'It had been 2 years to Ram meeting me.'},
    {'hindi': 'राम को मुझसे मिले हुए 2 साल हो गए थे।',  'english': 'It had been 2 years to Ram having met me.'},
  ];

  static const List<Map<String, String>> concept3MoreExamples = [
    {'hindi': 'दो दिन हो गये तुम्हें देखे हुए।',        'english': 'It has been 2 days having seen you.'},
    {'hindi': '7 साल हो गये हैं उसके साथ रहते हुए।',    'english': 'It has been 7 years living with him.'},
    {'hindi': 'कितने दिन हो गये हैं?',                  'english': 'How many days has it been?'},
    {'hindi': 'कितना समय हो गया था?',                   'english': 'How much time had it been?'},
    {'hindi': 'क्या 5 मिनट हो गये हैं?',               'english': 'Has it been 5 minutes?'},
    {'hindi': 'क्या सदियाँ गुजर गयी हैं?',              'english': 'Has it been centuries?'},
    {'hindi': 'उसे 10 मिनट हो गये थे।',                'english': 'It had been 10 minutes to him.'},
    {'hindi': 'मुझे बर्गर खाये एक महीना हो गया है।',    'english': 'It has been a month to me having eaten burger.'},
    {'hindi': 'मुझे तुम्हें पढ़ाते हुए महीनों हो गये हैं।','english': 'It has been months to me having taught you.'},
    {'hindi': 'लिखते हुए मुझे दस मिनट नहीं हुए हैं।',  'english': 'It has not been 10 minutes to me writing.'},
  ];

  // ─── Concept 4 — It takes ────────────────────────────────────────────────
  static const List<Map<String, String>> concept4NoSubjectExamples = [
    {'hindi': 'दो मिनट लगते हैं।',    'english': 'It takes two minutes.'},
    {'hindi': 'दो मिनट लग रहे हैं।',  'english': 'It is taking two minutes.'},
    {'hindi': 'दो मिनट लग चुके हैं।', 'english': 'It has taken two minutes.'},
    {'hindi': 'दो मिनट लगे।',         'english': 'It took two minutes.'},
    {'hindi': 'दो मिनट लग रहे थे।',   'english': 'It was taking two minutes.'},
    {'hindi': 'दो मिनट लग चुके थे।',  'english': 'It had taken two minutes.'},
    {'hindi': 'दो मिनट लगेंगे।',      'english': 'It will take two minutes.'},
    {'hindi': 'दो मिनट लग सकते हैं।', 'english': 'It can take two minutes.'},
    {'hindi': 'दो मिनट लगने चाहिए।',  'english': 'It should take two minutes.'},
    {'hindi': 'दो मिनट पक्का लगने चाहिए।', 'english': 'It must take two minutes.'},
  ];

  static const List<Map<String, String>> concept4WithSubjectExamples = [
    {'hindi': 'मुझे दो मिनट लगते हैं।',         'english': 'I take two minutes. / It takes two minutes to me.'},
    {'hindi': 'मुझे दो मिनट लग रहे हैं।',       'english': 'I am taking two minutes. / It is taking two minutes to me.'},
    {'hindi': 'राम को 10 मिनट लगने चाहिए।',    'english': 'Ram should take 10 minutes. / It should take 10 minutes to Ram.'},
  ];

  static const List<Map<String, String>> concept4WithVerbExamples = [
    {'hindi': 'पहुँचने में 2 मिनट लगते हैं।',          'english': 'It takes 2 minutes to reach.'},
    {'hindi': 'मुझे पहुँचने में 2 मिनट लगते हैं।',     'english': 'I take 2 minutes to reach. / It takes me 2 minutes to reach.'},
    {'hindi': 'राम को पहुँचने में 2 मिनट लगते हैं।',   'english': 'Ram takes 2 minutes to reach.'},
    {'hindi': 'तुमसे मिलने में कई साल लगेंगे।',        'english': 'It will take many years to meet you.'},
    {'hindi': 'तुमसे मिलने में मुझे कई साल लगेंगे।',   'english': 'I will take many years to meet you.'},
    {'hindi': 'वहाँ पहुँचने में पापा को 10 मिनट लगे।', 'english': 'Dad took 10 minutes to reach there.'},
    {'hindi': 'खाना खाने में मुझे कितना समय लगा?',    'english': 'How much time did I take to eat the food?'},
    {'hindi': 'खाना खाने में कितना समय लगा?',          'english': 'How much time did it take to eat the food?'},
    {'hindi': 'मुझे आपको पढ़ाने में काफी वक्त लगेगा।', 'english': 'I will take lots of time to teach you.'},
    {'hindi': 'ये करने में मुझे दस दिन से ज़्यादा लगे।', 'english': 'I took more than 10 days to do this.'},
  ];

  // ─── Practice Exercise — 100 sentences ───────────────────────────────────
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'आज तुम्हारा दिन है, कल मेरा होगा।',           'english': 'It is your day today, tomorrow will be mine.'},
    {'hindi': 'तुम्हें देखे हुए मुझे दस दिन हो गये हैं।',    'english': 'It has been 10 days to me having seen you.'},
    {'hindi': 'राम से मिले हुए सात साल हो गये हैं।',         'english': 'It has been 7 years having met Ram.'},
    {'hindi': 'क्या कल छुट्टी थी?',                           'english': 'Was it holiday yesterday?'},
    {'hindi': '5 दिन लगेंगे।',                                 'english': 'It will take 5 days.'},
    {'hindi': '6 साल लगे।',                                    'english': 'It took 6 years.'},
    {'hindi': 'मुझे घर पहुँचने में 5 घंटे लगते हैं।',        'english': 'It takes me 5 hours to reach home.'},
    {'hindi': 'मुझे स्कूल पहुँचने में आधा घंटा लगता है।',    'english': 'It takes me half an hour to reach school.'},
    {'hindi': 'खाना बनाने में राम को काफी समय लगता है।',      'english': 'Ram takes lots of time to prepare the food.'},
    {'hindi': 'हमें कम्प्यूटर सीखने में 3 महीने लगे।',       'english': 'We took 3 months to learn computer.'},
    {'hindi': 'तुम्हें ढूँढने में मुझे केवल 5 मिनट लगे।',    'english': 'I took only 5 minutes to find you.'},
    {'hindi': 'ये काम करने में काफी समय लगेगा।',              'english': 'It will take plenty of time to do this work.'},
    {'hindi': 'आज सोमवार नहीं है।',                           'english': 'It is not Monday today.'},
    {'hindi': 'कल छुट्टी थी।',                                 'english': 'It was holiday yesterday.'},
    {'hindi': 'आज बारिश होगी।',                                'english': 'It will rain today.'},
    {'hindi': 'कल बारिश हुई थी।',                              'english': 'It had rained yesterday.'},
    {'hindi': 'परसों छुट्टी थी।',                              'english': 'It was holiday day before yesterday.'},
    {'hindi': 'परसों छुट्टी होगी।',                            'english': 'It will be holiday day after tomorrow.'},
    {'hindi': '2 मिनट लगते हैं।',                             'english': 'It takes 2 minutes.'},
    {'hindi': '2 मिनट लग रहे हैं।',                           'english': 'It is taking 2 minutes.'},
    {'hindi': '2 मिनट लगे हैं।',                              'english': 'It has taken 2 minutes.'},
    {'hindi': '2 मिनट लगे।',                                  'english': 'It took 2 minutes.'},
    {'hindi': '2 मिनट लग रहे थे।',                            'english': 'It was taking 2 minutes.'},
    {'hindi': '2 मिनट लगे थे।',                               'english': 'It had taken 2 minutes.'},
    {'hindi': '2 मिनट लगेंगे।',                               'english': 'It will take 2 minutes.'},
    {'hindi': 'मुझे 2 मिनट लगेंगे।',                          'english': 'I will take 2 minutes.'},
    {'hindi': 'अब तुम्हारी बारी है।',                         'english': 'It/This is your turn now.'},
    {'hindi': 'यह तुम्हारा प्यार है।',                         'english': 'It/This is your love.'},
    {'hindi': 'यह क्या है?',                                   'english': 'What is it/this?'},
    {'hindi': '2 दिन हो गये हैं।',                            'english': 'It has been 2 days.'},
    {'hindi': '2 दिन हो गये थे।',                             'english': 'It had been 2 days.'},
    {'hindi': 'मुझे 2 दिन हो गये थे।',                       'english': 'It had been 2 days to me.'},
    {'hindi': 'तुमसे मिले हुए मुझे 2 दिन हो गये थे।',        'english': 'It had been 2 days to me having met you.'},
    {'hindi': 'उसे कितना समय लगेगा?',                         'english': 'How much time will he take?'},
    {'hindi': 'तुम्हें कितना समय लगता है?',                   'english': 'How much time do you take?'},
    {'hindi': 'तुम्हें इतना समय क्यों लग रहा है?',            'english': 'Why are you taking this much time?'},
    {'hindi': 'ऑफिस पहुँचने में कितना समय लगा?',             'english': 'How much time did it take to reach office?'},
    {'hindi': 'ऑफिस पहुँचने में तुम्हें कितना समय लगा?',     'english': 'How much time did you take to reach office?'},
    {'hindi': 'राम को बहुत समय लगा।',                         'english': 'Ram took lots of time.'},
    {'hindi': 'कल ओले पड़े थे।',                              'english': 'It had hailed yesterday.'},
    {'hindi': 'आज ओले पड़ेंगे।',                              'english': 'It will hail today.'},
    {'hindi': 'परसों ओले पड़ेंगे।',                           'english': 'It will hail day after tomorrow.'},
    {'hindi': 'परसों ओले पड़े थे।',                           'english': 'It had hailed day before yesterday.'},
    {'hindi': 'बारिश कब होगी?',                               'english': 'When will it rain?'},
    {'hindi': 'क्या बारिश होगी?',                             'english': 'Will it rain?'},
    {'hindi': 'क्या बारिश हो रही होगी?',                      'english': 'Will it be raining?'},
    {'hindi': 'किताब खत्म करने में मुझे 2 महीने लगे।',        'english': 'It took me 2 months to finish the book.'},
    {'hindi': 'सीता को काफी साल लगे।',                        'english': 'Seeta took lots of time.'},
    {'hindi': 'आई ए एस अधिकारी बनने में 3 साल लगे।',         'english': 'I took 3 years to become an IAS officer.'},
    {'hindi': 'ये कपड़ा सिलने में करीब 20 दिन लगेंगे।',       'english': 'It will take about 20 days to stitch this cloth.'},
    {'hindi': 'अगर तुम पेंसिल से लिखो, तो काफी समय लगेगा।', 'english': 'If you write with pencil, it will take longer time.'},
    {'hindi': 'तुम कितना समय लोगे?',                          'english': 'How much time will you take?'},
    {'hindi': 'ये खत्म करने में तुम कितना समय लोगे?',         'english': 'How much time will you take to finish this?'},
    {'hindi': 'मैं दस मिनट लूँगा।',                           'english': 'I will take 10 minutes.'},
    {'hindi': 'वो दिन एक स्पेशल दिन था।',                    'english': 'It was a special day that day.'},
    {'hindi': 'उस दिन क्या था?',                              'english': 'What was it on that day?'},
    {'hindi': 'अंधेरा हो रहा है।',                             'english': 'It is getting dark.'},
    {'hindi': 'उमस हो रही है।',                                'english': 'It is getting humid.'},
    {'hindi': 'यह मेरी ख्वाहिश है।',                          'english': 'It/This is my wish/desire.'},
    {'hindi': 'हमारी शादी की सालगिरह है आज।',                 'english': 'It is our marriage anniversary today.'},
    {'hindi': 'तुम्हें देखे हुए मुझे करीब 2 साल हो गये हैं।', 'english': 'It has been about 2 years to me having seen you.'},
    {'hindi': 'जब मैं वहाँ पहुँचा, बारिश हो रही थी।',        'english': 'When I reached there, it was raining.'},
    {'hindi': 'वहाँ बहुत बारिश होती है।',                     'english': 'It rains a lot there.'},
    {'hindi': 'आज बारिश हो सकती है।',                         'english': 'It can rain today.'},
    {'hindi': 'आज बारिश होनी है।',                             'english': 'It has to rain today.'},
    {'hindi': 'आज बारिश होनी थी।',                             'english': 'It had to rain today.'},
    {'hindi': 'ये तुम्हारी सोच है।',                           'english': 'It/This is your thinking.'},
    {'hindi': 'ये किसका पैन है?',                              'english': 'Whose pen is this/it?'},
    {'hindi': 'खाने खाये हुए मुझे कई दिन हो गये हैं।',       'english': 'It has been many days to me having had food.'},
    {'hindi': 'अच्छे कपड़े पहने हुए कई दिन हो गये हैं।',     'english': "It's been many days having worn good clothes."},
    {'hindi': 'वहाँ गये हुए मुझे कई दिन हो गये हैं।',        'english': 'It has been many days to me having gone there.'},
    {'hindi': 'खाना खाये हुए मुझे कई दिन हो गये हैं।',       'english': 'It has been many days to me having eaten.'},
    {'hindi': 'आज ओले पड़ने थे।',                             'english': 'It had to hail today.'},
    {'hindi': 'आज ओले पड़ सकते हैं।',                         'english': 'It can hail today.'},
    {'hindi': 'आज ओले पड़ सकते थे पर नहीं पड़े।',             'english': "It could have hailed today but didn't."},
    {'hindi': 'वो मेरी ज़िन्दगी का बहुत अहम दिन था।',        'english': 'It was a very important day of my life.'},
    {'hindi': 'राम को लिखने में ज़्यादा समय नहीं लगा।',       'english': "Ram didn't take much time to write."},
    {'hindi': 'राम को लिखने में थोड़ा सा ही समय लगा।',       'english': 'Ram took a little time to write.'},
    {'hindi': 'इसकी कीमत 5 रु है।',                           'english': 'It costs Rs 5. / Its cost is Rs 5.'},
    {'hindi': 'इसकी कीमत 5 रु होगी।',                         'english': 'It will cost Rs 5.'},
    {'hindi': 'उस दिन पूरे देश में छुट्टी थी।',               'english': 'It was holiday that day in whole country.'},
    {'hindi': 'सुबह से बारिश हो रही थी।',                     'english': 'It had been raining since morning.'},
    {'hindi': 'क्या आज सोमवार है?',                           'english': 'Is it Monday today?'},
    {'hindi': 'यहाँ बारिश हो रही है।',                        'english': 'It is raining here.'},
    {'hindi': 'वहाँ ओले पड़ रहे थे।',                         'english': 'It was hailing there.'},
    {'hindi': 'क्या काफी समय हो गया है?',                     'english': 'Has it been enough time?'},
    {'hindi': 'कितना समय हो गया है?',                         'english': 'How long has it been?'},
    {'hindi': 'क्या कल बारिश होगी?',                          'english': 'Will it rain tomorrow?'},
    {'hindi': 'मुझे दो घंटे लगे।',                            'english': 'It took me 2 hrs. / I took 2 hrs.'},
    {'hindi': 'चेरापुंजी में सबसे अधिक बारिश क्यों होती है?', 'english': 'Why does it rain the most in Cherapunji?'},
    {'hindi': 'बर्गर खाये हुए मुझे 4 महीने हो गये हैं।',     'english': 'It has been 4 months to me having eaten Burger.'},
    {'hindi': 'तुम्हें देखे हुए मुझे 3 दिन हो गये हैं।',      'english': 'It has been 3 days to me having seen you.'},
    {'hindi': 'क्या देहरादून में बारिश हुई?',                  'english': 'Did it rain in Dehradun?'},
    {'hindi': 'बारिश क्यों होती है?',                          'english': 'Why does it rain?'},
    {'hindi': 'उन्हें घर पहुँचने में कितना समय लगा?',         'english': 'How much time did they take to reach home?'},
    {'hindi': 'मैच का आनन्द लेते हुए 2 घंटे हो गये हैं।',    'english': 'It has been 2 hrs, enjoying the match.'},
    {'hindi': 'मुझे देखते हुए मुझे 15 मिनट हो गए हैं।',      'english': 'It has been 15 mins to me, watching this movie.'},
    {'hindi': 'यह प्यार है।',                                  'english': 'It is love. / This is love.'},
    {'hindi': 'यह एक कुर्सी है।',                              'english': 'It is a chair. / This is a chair.'},
    {'hindi': 'उस शहर में बारिश हो रही होगी।',                'english': 'It will be raining in that city.'},
  ];

  // ─── Test Paper I — 50 Hindi→English ─────────────────────────────────────
  static const List<Map<String, String>> testPaper1 = [
    {'hindi': '5 साल हो गये हैं।',                                       'english': 'It has been 5 years.'},
    {'hindi': 'उसे कई साल हो गये हैं।',                                  'english': 'It has been many years to him.'},
    {'hindi': 'राम को खत्म करने में बहुत समय लगा।',                      'english': 'Ram took a long to finish.'},
    {'hindi': 'तुम्हें कम समय लगेगा।',                                   'english': 'You will take less time.'},
    {'hindi': 'मुझे 2 दिन लगे।',                                         'english': 'I took 2 days.'},
    {'hindi': 'बच्चों की छुट्टी है आज।',                                  "english": "It's children's holiday today."},
    {'hindi': 'वहाँ पहुँचने में 2 दिन लगते हैं।',                        'english': 'It takes 2 days to reach there.'},
    {'hindi': 'तुम्हारी सालगिरह कब है?',                                 'english': 'When is your anniversary?'},
    {'hindi': 'उसे काफी समय हो गया है।',                                 'english': 'It has been a long to him.'},
    {'hindi': 'बारिश हो रही थी।',                                        'english': 'It was raining.'},
    {'hindi': 'क्या ये कोई गिफ्ट है?',                                   'english': 'Is it some/a gift?'},
    {'hindi': '8 दिन हो गये थे।',                                        'english': 'It had been 8 days.'},
    {'hindi': 'शायद कल बारिश होगी।',                                     'english': 'It may/might rain tomorrow.'},
    {'hindi': 'परसों ओले पड़े थे।',                                       'english': 'It had hailed day before yesterday.'},
    {'hindi': 'मेरा जन्मदिन था।',                                        'english': 'It was my birthday.'},
    {'hindi': 'आज कुछ है।',                                              "english": "It's something today."},
    {'hindi': 'ये किताब पढ़ते हुए मुझे 3 महीने हो चुके हैं।',            'english': 'It has been 3 months to me reading this book.'},
    {'hindi': 'कल स्कूल की छुट्टी होगी।',                               "english": "It will be school's off tomorrow."},
    {'hindi': 'आज ओले पक्का पड़ेंगे।',                                    'english': 'It must hail today.'},
    {'hindi': 'काफी समय हो गया था।',                                     'english': 'It had been a long time.'},
    {'hindi': 'क्या उस दिन कुछ था?',                                     'english': 'Was it something that day?'},
    {'hindi': 'उस दिन सोमवार था।',                                       'english': 'It was Monday that day.'},
    {'hindi': 'मुझे यहाँ रहते हुए 10 साल हो गये हैं।',                  'english': 'It has been 10 years to me living here.'},
    {'hindi': 'तुम पर निर्भर करता है।',                                  'english': 'It depends on you.'},
    {'hindi': 'कई सदियाँ बीत गई हैं।',                                  'english': 'It has been many centuries.'},
    {'hindi': 'इतनी बारिश क्यों होती है यहाँ?',                          'english': 'Why does it rain this much here?'},
    {'hindi': 'ये करते हुए हमें 2 साल हो चुके थे।',                     'english': 'It had been 2 years to us doing this.'},
    {'hindi': 'अगर बारिश हुई तो मैं भीग जाऊँगा।',                       'english': 'If it rains, I will be drenched.'},
    {'hindi': 'सोचने की बात है।',                                        'english': 'It is a matter to think.'},
    {'hindi': 'जब हम मिले थे उस दिन बारिश हो रही थी।',                  'english': 'The day we had met, it was raining.'},
    {'hindi': 'उस दिन क्या था? मंडे या संडे?',                           'english': 'What was it that day? Monday or Sunday?'},
    {'hindi': 'उसे ये बताने में समय क्यों लगा?',                         'english': 'Why did he take time to tell this?'},
    {'hindi': 'अच्छा लगता है।',                                          'english': 'It seems good. / It feels good.'},
    {'hindi': 'वहाँ अकसर बारिश होती थी।',                               'english': 'It used to rain there quite often.'},
    {'hindi': 'खाना खाये हुए हमें कई दिन हो गये थे।',                   'english': 'It had been many days to us having taken the food.'},
    {'hindi': 'कितने दिन हो गये हैं?',                                   'english': 'How many days has it been?'},
    {'hindi': 'बारिश हो सकती थी पर हुई नहीं।',                          "english": "It could have rained but didn't."},
    {'hindi': 'ये कुछ और नहीं तुम्हारी सोच है।',                        'english': 'It is nothing else but your thinking.'},
    {'hindi': 'ये अच्छी बात नहीं है।',                                   "english": "It's not good."},
    {'hindi': 'उसे मिले हुए तुम्हें कितने साल हो गये हैं?',              'english': 'How many years has it been to you having met him?'},
    {'hindi': 'बारिश वहाँ कभी नहीं होती।',                              'english': 'It never rains there.'},
    {'hindi': 'हमें कई दिन लग जायेंगे।',                                 "english": "We will take many days. / It'll take us many days."},
    {'hindi': 'ये कुछ और नहीं भ्रष्टाचार है।',                          'english': 'It is nothing else but corruption.'},
    {'hindi': 'ये नाटक देखे हुए मुझे पूरे 2 महीने हो गये हैं।',         "english": "It's been complete 2 months to me having seen this serial."},
    {'hindi': 'वहाँ गये हुए तुम्हें कितने साल हो गये?',                  'english': 'How many years has it been to you having gone there?'},
    {'hindi': 'परसों बारिश हुई थी।',                                     'english': 'It had rained day before yesterday.'},
    {'hindi': 'ये कुछ और नहीं पागलपन है।',                              'english': 'It is nothing else but obsession.'},
    {'hindi': 'उस दिन बारिश जमकर होगी।',                                'english': 'It will rain heavily that day.'},
    {'hindi': 'आज ओले पड़ सकते हैं।',                                    'english': 'It may/might hail today.'},
    {'hindi': 'आज बारिश नहीं होनी चाहिए क्योंकि मेरी बहन की शादी है।', "english": "It mustn't rain as it is my sister's marriage today."},
  ];

  // ─── Test Paper II — 50 English→Hindi ────────────────────────────────────
  static const List<Map<String, String>> testPaper2 = [
    {'english': 'It took me lots of time.',                     'hindi': 'मुझे काफी/बहुत समय लगा।'},
    {'english': 'Did it hail there?',                           'hindi': 'क्या वहाँ ओले पड़े?'},
    {'english': 'Does it make a difference?',                   'hindi': 'क्या इससे कोई फर्क पड़ता है?'},
    {'english': 'How much time will you take?',                 'hindi': 'तुम्हें कितना समय लगेगा?'},
    {'english': 'It has been about a year having seen him.',    'hindi': 'उसे देखे हुए करीब एक साल हो गया है।'},
    {'english': 'It was nothing but his vision.',               'hindi': 'ये कुछ और नहीं बल्कि उसका दृष्टिकोण था।'},
    {'english': "It's hailing continuously.",                   'hindi': 'लगातार ओले पड़ रहे हैं।'},
    {'english': "It's hailing continually.",                    'hindi': 'रुक-रुक कर ओले पड़ रहे हैं।'},
    {'english': "It didn't make any difference.",               'hindi': 'इससे कोई फर्क नहीं पड़ा।'},
    {'english': 'It was Monday that day.',                      'hindi': 'उस दिन सोमवार था।'},
    {'english': 'It might rain today.',                         'hindi': 'आज शायद बारिश हो सकती है।'},
    {'english': 'It might change your mind.',                   'hindi': 'ये बात तुम्हारा मन बदल सकती है।'},
    {'english': 'It has been years to me having seen you.',     'hindi': 'तुम्हें देखे हुए मुझे सालों हो गए हैं।'},
    {'english': 'It is nothing else but a try.',                'hindi': 'ये कुछ और नहीं, एक कोशिश है।'},
    {'english': 'It was taking long time.',                     'hindi': 'काफी समय लग रहा था।'},
    {'english': "It's holiday tomorrow.",                       'hindi': 'कल छुट्टी है।'},
    {'english': 'It takes just 2 minutes to reach home.',       'hindi': 'घर पहुँचने में बस 2 मिनट लगते हैं।'},
    {'english': 'Did I take more than 5 minutes?',             'hindi': 'क्या मुझे 5 मिनट से ज़्यादा लगे?'},
    {'english': 'Will you take much time?',                     'hindi': 'क्या तुम्हें बहुत समय लगेगा?'},
    {'english': 'He had taken 3 hours to read the whole book.','hindi': 'उसे पूरी किताब पढ़ने में 3 घंटे लगे।'},
    {'english': 'Does it matter?',                              'hindi': 'फर्क पड़ता है क्या?'},
    {'english': 'It has been centuries having someone come here.','hindi': 'सदियाँ बीत गई हैं, यहाँ कोई आये हुए।'},
    {'english': 'Will it bother you?',                          'hindi': 'क्या ये तुम्हें परेशान करेगा?'},
    {'english': 'It could have been delayed.',                  'hindi': 'देरी हो सकती थी।'},
    {'english': 'It will be better to go there.',               'hindi': 'वहाँ जाना बेहतर होगा।'},
    {'english': 'It will be raining there.',                    'hindi': 'वहाँ बारिश हो रही होगी।'},
    {'english': 'It took me a while to repair that mobile.',    'hindi': 'मुझे उस मोबाइल को ठीक करने में थोड़ा समय लगा।'},
    {'english': 'What does it do?',                             'hindi': 'ये क्या करता है?'},
    {'english': 'What is it today?',                            'hindi': 'आज क्या है?'},
    {'english': "It's my birthday.",                            'hindi': 'मेरा जन्मदिन है।'},
    {'english': "It wasn't my cup of tea.",                     'hindi': 'ये मेरे बस की बात नहीं थी।'},
    {'english': 'Did it take much of your time?',               'hindi': 'क्या इसने तुम्हारा काफी समय लिया?'},
    {'english': "It can't bother me.",                          'hindi': 'ये बात मुझे परेशान नहीं कर सकती।'},
    {'english': 'It is nothing else but a pen.',                'hindi': 'ये कुछ और नहीं, एक पैन है।'},
    {'english': 'It depends on your mentality.',                'hindi': 'ये तुम्हारी सोच पर निर्भर करता है।'},
    {'english': 'What is it in your pocket?',                   'hindi': 'तुम्हारी जेब में क्या है?'},
    {'english': "Why is it taking time? Is it because you are new?", 'hindi': 'समय क्यों लग रहा है? इसलिए क्योंकि तुम नये हो?'},
    {'english': "It's because I don't know about this.",        'hindi': 'इसलिए क्योंकि मैं इसके बारे में नहीं जानता।'},
    {'english': "It's because I had no knowledge.",             'hindi': 'इसलिए क्योंकि मुझे ज्ञान नहीं था।'},
    {'english': 'Is it a machine kind/sort of?',                'hindi': 'क्या ये कोई मशीन जैसा है?'},
    {'english': 'It is something of that sort.',                'hindi': 'ये कुछ वैसा ही है।'},
    {'english': 'Is it a mobile kind/sort of?',                 'hindi': 'क्या ये मोबाइल जैसा कुछ है?'},
    {'english': 'No, it is nothing of that sort.',              'hindi': 'नहीं, ये उस तरह का कुछ नहीं है।'},
    {'english': 'Did it really rain heavily?',                  'hindi': 'क्या वाकई में भारी बारिश हुई?'},
    {'english': 'It is not your cup of tea.',                   'hindi': 'ये तुम्हारे बस की बात नहीं है।'},
    {'english': 'How old is it?',                               'hindi': 'ये कितना पुराना है?'},
    {'english': 'It seems to be very old.',                     'hindi': 'ये बहुत पुराना लगता है।'},
    {'english': 'It seemed to be new one.',                     'hindi': 'ये नया सा लगा।'},
    {'english': 'Should it be told to him?',                    'hindi': 'क्या ये बात उसे बतायी जानी चाहिए?'},
    {'english': 'How can it be improved?',                      'hindi': 'इसे कैसे सुधारा जा सकता है?'},
  ];

  /// Motivational quotes
  static const List<Map<String, String>> motivationalQuotes = [
    {'english': 'There is only one way to avoid criticism: do nothing, say nothing, and be nothing.', 'hindi': 'आलोचना से बचने का सिर्फ एक तरीका है: कुछ मत करो, कुछ मत कहो, और कुछ मत बनो।'},
    {'english': "You can't make it big unless you try.", 'hindi': 'जब तक कोशिश न करो, बड़ा नहीं बन सकते।'},
    {'english': 'Failure is better teacher than success, because when you fail, you focus more for the next try.', 'hindi': 'असफलता सफलता से बेहतर शिक्षक है, क्योंकि जब आप असफल होते हैं तो अगली कोशिश पर ज़्यादा ध्यान देते हैं।'},
    {'english': "You can never cross the ocean until you have the courage to lose sight of the shore.", 'hindi': 'जब तक तट को छोड़ने का साहस न हो, आप कभी समंदर पार नहीं कर सकते।'},
  ];
}