import '../models/lesson_model.dart';

class Chapter38Data {
  static ChapterModel get chapter => ChapterModel(
        id: 38,
        title: 'Mixed Practice Exercise',
        titleHindi: 'मिश्रित अभ्यास',
        description: 'Hindi → English — 90 sentences covering all concepts',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Set 1 — Passive & Tenses',
              titleHindi: 'सेट 1 — Passive & Tenses (Q 1–30)',
              emoji: '🔄',
              type: LessonType.ch38Set1,
              status: LessonStatus.inProgress,
              totalXP: 25),
          LessonModel(
              id: 2,
              title: 'Set 2 — Mixed Concepts',
              titleHindi: 'सेट 2 — मिश्रित (Q 31–60)',
              emoji: '🧩',
              type: LessonType.ch38Set2,
              status: LessonStatus.inProgress,
              totalXP: 25),
          LessonModel(
              id: 3,
              title: 'Set 3 — Advanced',
              titleHindi: 'सेट 3 — Advanced (Q 61–90)',
              emoji: '🎯',
              type: LessonType.ch38Set3,
              status: LessonStatus.inProgress,
              totalXP: 25),
          LessonModel(
              id: 4,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch38ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch38Set1:         return set1Questions;
      case LessonType.ch38Set2:         return set2Questions;
      case LessonType.ch38Set3:         return set3Questions;
      case LessonType.ch38ChapterQuiz:  return chapterFinalQuestions;
      default:                          return set1Questions;
    }
  }

  // ─── Set 1 Quiz (Q 1–30) ──────────────────────────────────────────────────
  static const List<QuizQuestion> set1Questions = [
    QuizQuestion(
      questionHi: '"उसे घर लाया गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He brought home.',
        'He was brought home.',
        'He has been brought home.',
        'He is brought home.',
      ],
      correctIndex: 1,
      explanation: 'Passive Past Simple: Subject + was/were + V3। He was brought home।',
    ),
    QuizQuestion(
      questionHi: '"मुझे 2 मिनट दिये गये थे।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was given 2 minutes.',
        'I had been given 2 minutes.',
        'I have been given 2 minutes.',
        'I am given 2 minutes.',
      ],
      correctIndex: 1,
      explanation: 'Passive Past Perfect: Sub + had been + V3। I had been given 2 minutes।',
    ),
    QuizQuestion(
      questionHi: '"ये लोग तुमसे कब मिले?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'When did these people meet you?',
        'When these people met you?',
        'When will these people meet you?',
        'When have these people met you?',
      ],
      correctIndex: 0,
      explanation: 'Past Simple interrogative: When did + subject + V1। When did these people meet you?',
    ),
    QuizQuestion(
      questionHi: '"तुम लोगों को पैसे नहीं दिये जा सकते।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You can\'t give money to people.',
        'You people can\'t be given money.',
        'Money won\'t be given to you.',
        'People can\'t receive money.',
      ],
      correctIndex: 1,
      explanation: 'Passive Modal Negative: Sub + can\'t be + V3। You people can\'t be given money।',
    ),
    QuizQuestion(
      questionHi: '"उसने बच्चों को बैठने दिया था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He let children sit.',
        'He has let children sit.',
        'He had let children sit.',
        'He would let children sit.',
      ],
      correctIndex: 2,
      explanation: 'Past Perfect + Let: Sub + had + let + Object + V1। He had let children sit।',
    ),
    QuizQuestion(
      questionHi: '"मैं बहुत देर से उसे ढूँढ़ रहा हूँ।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am searching him for a long.',
        'I was searching him for a long.',
        'I have been searching him for a long.',
        'I searched him for a long.',
      ],
      correctIndex: 2,
      explanation: 'Present Perfect Continuous: Sub + have/has been + V-ing। I have been searching him for a long।',
    ),
    QuizQuestion(
      questionHi: '"इस देश में दीपावली कब मनाई जाती है?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'When do people celebrate Diwali in this country?',
        'When is Diwali celebrated in this country?',
        'When was Diwali celebrated in this country?',
        'When did Diwali celebrate in this country?',
      ],
      correctIndex: 1,
      explanation: 'Passive Present Simple: When + is/are + Sub + V3? When is Diwali celebrated?',
    ),
    QuizQuestion(
      questionHi: '"क्या तुम्हें ऐसा कहना चाहिए था?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Should you say so?',
        'Should you have said so?',
        'Did you should say so?',
        'You should not have said so.',
      ],
      correctIndex: 1,
      explanation: 'Past obligation interrogative: Should + you + have + V3? Should you have said so?',
    ),
    QuizQuestion(
      questionHi: '"तुमसे मिले हुए कई साल हो गये हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Many years have passed since I met you.',
        'It has been many years having met you.',
        'I have met you many years ago.',
        'Both A and B are correct.',
      ],
      correctIndex: 3,
      explanation: 'Both are acceptable। It has been many years having met you। OR Many years have passed since I met you।',
    ),
    QuizQuestion(
      questionHi: '"शायद वो स्कूल गया होगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Maybe he went to school.',
        'He might have gone to school.',
        'He should have gone to school.',
        'He must have gone to school.',
      ],
      correctIndex: 1,
      explanation: '"शायद + गया होगा" = Past possibility → might have + V3। He might have gone to school।',
    ),
  ];

  // ─── Set 2 Quiz (Q 31–60) ─────────────────────────────────────────────────
  static const List<QuizQuestion> set2Questions = [
    QuizQuestion(
      questionHi: '"ज्यादा टी.वी. देखना आँखों के लिए ठीक नहीं है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'To watch TV a lot is not good for eyes.',
        'Watching TV a lot is not good for eyes.',
        'Watch TV a lot is not good for eyes.',
        'Both A and B.',
      ],
      correctIndex: 1,
      explanation: 'Gerund as subject: Watching TV a lot is not good for eyes।',
    ),
    QuizQuestion(
      questionHi: '"सभी को कुछ दिया जा रहा था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'All were being given something.',
        'All are being given something.',
        'All had been given something.',
        'All will be given something.',
      ],
      correctIndex: 0,
      explanation: 'Passive Past Continuous: Sub + were/was being + V3। All were being given something।',
    ),
    QuizQuestion(
      questionHi: '"अगर मैं आता तो तुमसे मिलता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'If I come, I will meet you.',
        'If I came, I would meet you.',
        'If I had come, I would have met you.',
        'If I was coming, I met you.',
      ],
      correctIndex: 1,
      explanation: 'Present unreal conditional: If + Past Simple...would + V1। If I came, I would meet you।',
    ),
    QuizQuestion(
      questionHi: '"मुझे अंदर नहीं दिया जा रहा था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was not being let enter.',
        'I was not let enter.',
        'I was not given to enter.',
        'I am not being let enter.',
      ],
      correctIndex: 0,
      explanation: 'Passive Past Continuous + Let: I was not being let enter।',
    ),
    QuizQuestion(
      questionHi: '"राम को भेजा जाना चाहिए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram must be sent.',
        'Ram should be sent.',
        'Ram would be sent.',
        'Ram shall be sent.',
      ],
      correctIndex: 1,
      explanation: 'Passive Modal "should": Sub + should be + V3। Ram should be sent।',
    ),
    QuizQuestion(
      questionHi: '"वो मुझे कभी हारने नहीं देगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He will never let me lose.',
        'He will never let me to lose.',
        'He will never make me lose.',
        'He never lets me lose.',
      ],
      correctIndex: 0,
      explanation: 'Let + object + V1 (no "to"): He will never let me lose।',
    ),
    QuizQuestion(
      questionHi: '"जीतना उसकी आदत बन गयी है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'To win has become his habit.',
        'Winning has become his habit.',
        'Win has become his habit.',
        'Both A and B.',
      ],
      correctIndex: 3,
      explanation: 'Gerund/Infinitive as subject: Winning has become his habit। (Both gerund and infinitive work here)',
    ),
    QuizQuestion(
      questionHi: '"मुझे स्कूल पहुँचने में 10 मिनट लगते हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I take 10 minutes to reach school.',
        'It takes me 10 minutes to reach school.',
        'I need 10 minutes for school.',
        'Both A and B.',
      ],
      correctIndex: 3,
      explanation: '"लगना" = It takes (impersonal) या I take। Both correct।',
    ),
    QuizQuestion(
      questionHi: '"शायद उसने देखा हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He saw maybe.',
        'He might/may have seen.',
        'He should have seen.',
        'He must have seen.',
      ],
      correctIndex: 1,
      explanation: '"शायद + हो" (past possibility) = might/may have + V3। He might have seen।',
    ),
    QuizQuestion(
      questionHi: '"हमें सुबह से पढ़ाया जा रहा है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'We have been taught since morning.',
        'We are being taught since morning.',
        'We were being taught since morning.',
        'We have been being taught since morning.',
      ],
      correctIndex: 1,
      explanation: 'Passive Present Continuous: Sub + are being + V3। We are being taught since morning।',
    ),
  ];

  // ─── Set 3 Quiz (Q 61–90) ─────────────────────────────────────────────────
  static const List<QuizQuestion> set3Questions = [
    QuizQuestion(
      questionHi: '"ये मोबाइल तुम्हारे मोबाइल से ज्यादा पुराना है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'This mobile is older than your mobile.',
        'This mobile is more older than your mobile.',
        'This mobile is old than your mobile.',
        'This mobile is oldest of yours.',
      ],
      correctIndex: 0,
      explanation: 'Comparative: older than। This mobile is older than your mobile।',
    ),
    QuizQuestion(
      questionHi: '"क्या पता, उसने कहा हो!" — English?',
      questionEn: 'Correct translation?',
      options: [
        'What to say, he said.',
        'He might/may have said.',
        'Maybe he said it.',
        'Who knows, he said.',
      ],
      correctIndex: 1,
      explanation: '"क्या पता + कहा हो" = past possibility → might/may have said।',
    ),
    QuizQuestion(
      questionHi: '"मुझे चैन से जीने दो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Let me live in peace.',
        'Let me live peacefully.',
        'Allow me to live peacefully.',
        'All are correct.',
      ],
      correctIndex: 3,
      explanation: 'All three are correct। Let me live peacefully = Imperative Let।',
    ),
    QuizQuestion(
      questionHi: '"तुम मुझसे कम पैसे वाले हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You are less rich than I.',
        'You are poorer than I.',
        'You have less money than me.',
        'Both B and C.',
      ],
      correctIndex: 3,
      explanation: '"कम पैसे वाले" = poorer (comparative) या less money। Both B and C work।',
    ),
    QuizQuestion(
      questionHi: '"वो काफी देर से सोया हुआ है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is sleeping for a long.',
        'He has been sleeping for a long.',
        'He is asleep for a long.',
        'He was asleep for a long.',
      ],
      correctIndex: 2,
      explanation: '"सोया हुआ है" = state (asleep) not action → is asleep। He is asleep for a long।',
    ),
    QuizQuestion(
      questionHi: '"मैं कल से यहाँ बैठा हूँ।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am sitting here since yesterday.',
        'I have been sitting here since yesterday.',
        'I was sitting here since yesterday.',
        'I sat here since yesterday.',
      ],
      correctIndex: 1,
      explanation: '"कल से" + action continuing = Present Perfect Continuous। I have been sitting here since yesterday।',
    ),
    QuizQuestion(
      questionHi: '"सरकार हमें विद्रोह क्यों नहीं करने देती?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Why government doesn\'t let us revolt?',
        'Why does Government not let us protest?',
        'Why is Government not letting us revolt?',
        'Both A and B.',
      ],
      correctIndex: 1,
      explanation: 'Let + us + V1। Why does Government not let us protest?',
    ),
    QuizQuestion(
      questionHi: '"मुझे कहा गया था कि मुझे अमेरिका भेजा जाएगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was said that I will be sent to America.',
        'I was told that I would be sent to America.',
        'It was told to me that I will be sent.',
        'I had been said about America.',
      ],
      correctIndex: 1,
      explanation: '"कहा गया था" = was told। Reported speech: will → would। I was told that I would be sent to America।',
    ),
    QuizQuestion(
      questionHi: '"उसकी कुछ नहीं है, सब मेरा है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He has nothing, all is mine.',
        'His is nothing, all is mine.',
        'Nothing is his, everything is mine.',
        'Both B and C.',
      ],
      correctIndex: 3,
      explanation: '"उसकी" = possessive → His is nothing। OR Nothing is his। Both B and C correct।',
    ),
    QuizQuestion(
      questionHi: '"भाई पक्का स्कूल के लिए निकल गया होगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Brother might have left for school.',
        'Brother should have left for school.',
        'Brother must have left for school.',
        'Brother would have left for school.',
      ],
      correctIndex: 2,
      explanation: '"पक्का + गया होगा" = certainty → must have + V3। Brother must have left for school।',
    ),
  ];

  // ─── Chapter Final Quiz ────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: '"बाबर को अकबर से मिलने दिया जायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Babar will be let meet Akbar.',
        'Babar will be allowed to meet Akbar.',
        'Akbar will be let meet Babar.',
        'Both A and B.',
      ],
      correctIndex: 3,
      explanation: 'Passive Let Future: will be let + V1। OR will be allowed to + V1। Both are correct।',
    ),
    QuizQuestion(
      questionHi: '"भगवान कृष्ण को मारा नहीं जा सकता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Lord Krishna can\'t kill.',
        'Lord Krishna can\'t be killed.',
        'Lord Krishna wasn\'t killed.',
        'Lord Krishna is not killed.',
      ],
      correctIndex: 1,
      explanation: 'Passive Modal Negative: Sub + can\'t be + V3। Lord Krishna can\'t be killed।',
    ),
    QuizQuestion(
      questionHi: '"मैं अक्सर तुम्हारे घर आता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I often came your home.',
        'I used to often come your home.',
        'I would often come to your home.',
        'Both B and C.',
      ],
      correctIndex: 3,
      explanation: '"आता था" = used to / would (past habit)। Both "used to" and "would" are correct।',
    ),
    QuizQuestion(
      questionHi: '"परसों छुट्टी थी।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Yesterday it was holiday.',
        'It was holiday day before yesterday.',
        'Day before yesterday was holiday.',
        'Both B and C.',
      ],
      correctIndex: 3,
      explanation: '"परसों" = day before yesterday। Both B and C are acceptable।',
    ),
    QuizQuestion(
      questionHi: '"मेरे पास किसी का पेन नहीं है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I don\'t have anyone\'s pen.',
        'I don\'t have somebody\'s pen.',
        'We don\'t have anybody\'s pen.',
        'Both A and C.',
      ],
      correctIndex: 3,
      explanation: '"मेरे पास" → I don\'t have। OR "हमारे पास" → We don\'t have। Both A and C are correct per book answer.',
    ),
    QuizQuestion(
      questionHi: '"वो शायद मुझे याद कर रहा हो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is maybe missing me.',
        'He might be missing me.',
        'He should be missing me.',
        'He must be missing me.',
      ],
      correctIndex: 1,
      explanation: '"शायद + रहा हो" = Present possibility → might be + V-ing। He might be missing me।',
    ),
    QuizQuestion(
      questionHi: '"शायद कल ओले पड़े।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'It might hail tomorrow.',
        'It may hail tomorrow.',
        'It will hail tomorrow.',
        'Both A and B.',
      ],
      correctIndex: 3,
      explanation: '"शायद" + future = might/may। It might hail OR It may hail — both correct।',
    ),
    QuizQuestion(
      questionHi: '"मैं चारों भाइयों में सबसे बड़ा हूँ।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am the biggest of 4 brothers.',
        'I am the eldest among 4 brothers.',
        'I am the oldest of all 4 brothers.',
        'Both B and C.',
      ],
      correctIndex: 1,
      explanation: '"सबसे बड़ा" (age) = eldest। Among = के बीच। I am the eldest among 4 brothers।',
    ),
    QuizQuestion(
      questionHi: '"उसके चेहरे ने मुझे एक आदमी की याद दिला दी जिसे मैं 1985 में मिला था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'His face reminded me of a man who I had met in 1985.',
        'His face reminded me of a man whom I had met in 1985.',
        'His face reminded me about a man I met in 1985.',
        'Both A and B.',
      ],
      correctIndex: 3,
      explanation: '"whom" (object) या "who" (informal) — both acceptable। reminded me of ✓',
    ),
    QuizQuestion(
      questionHi: '"मेरा दिल उससे ज्यादा मजबूत है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'My heart is stronger than him.',
        'My heart is stronger than his.',
        'My heart is more strong than his.',
        'My heart is the strongest.',
      ],
      correctIndex: 1,
      explanation: 'Comparative: stronger than + possessive। My heart is stronger than his।',
    ),
  ];

  // ─── All 90 sentences ─────────────────────────────────────────────────────

  static const List<Map<String, String>> set1Sentences = [
    {'hindi': '1. उसे घर लाया गया।', 'english': 'He was brought home.'},
    {'hindi': '2. मुझे 2 मिनट दिये गये थे।', 'english': 'I had been given 2 minutes.'},
    {'hindi': '3. ये लोग तुमसे कब मिले?', 'english': 'When did these people meet you?'},
    {'hindi': '4. ये काम कौन करता है?', 'english': 'Who does this work?'},
    {'hindi': '5. मैं अक्सर तुम्हारे घर आता था।', 'english': 'I used to often come your home.'},
    {'hindi': '6. तुम लोगों को पैसे नहीं दिये जा सकते।', 'english': 'You people can\'t be given money.'},
    {'hindi': '7. उसने बच्चों को बैठने दिया था।', 'english': 'He had let children sit.'},
    {'hindi': '8. मैं बहुत देर से उसे ढूँढ़ रहा हूँ।', 'english': 'I have been searching him for a long.'},
    {'hindi': '9. बाबर को अकबर से मिलने दिया जायेगा।', 'english': 'Babar will be let meet Akbar.'},
    {'hindi': '10. इस देश में दीपावली कब मनाई जाती है?', 'english': 'When is Diwali celebrated in this country?'},
    {'hindi': '11. तुम्हें किसके घर जाना है?', 'english': 'Whose home have you to go?'},
    {'hindi': '12. क्या तुम्हें ऐसा कहना चाहिए था?', 'english': 'Should you have said so?'},
    {'hindi': '13. राम के भाई के पास क्या नहीं है?', 'english': 'What does Ram\'s brother not have?'},
    {'hindi': '14. तुमसे मिले हुए कई साल हो गये हैं।', 'english': 'It has been many years having met you.'},
    {'hindi': '15. शायद वो स्कूल गया होगा।', 'english': 'He might have gone to school.'},
    {'hindi': '16. लोग ऐसे क्यों होते हैं?', 'english': 'Why are people so?'},
    {'hindi': '17. उसने ऐसा कभी नहीं किया।', 'english': 'He never did so.'},
    {'hindi': '18. लोगों को घर जाना पड़ा।', 'english': 'People had to go home.'},
    {'hindi': '19. तुमसे कोई शादी नहीं करना चाहेगा।', 'english': 'Nobody would like to marry you.'},
    {'hindi': '20. मोबाइल में क्या है?', 'english': 'What is there in mobile?'},
    {'hindi': '21. वो किसी और के सपनों में खोया हुआ था।', 'english': 'He was lost in someone else\'s dreams.'},
    {'hindi': '22. इसे पढ़ने क्यों नहीं दिया जा रहा है?', 'english': 'Why are we not letting study?'},
    {'hindi': '23. क्या तुम यहाँ सो पाओगे?', 'english': 'Will you be able to sleep here?'},
    {'hindi': '24. उसके कितने भाई थे?', 'english': 'How many brothers did he have?'},
    {'hindi': '25. ज्यादा टी.वी. देखना आँखों के लिए ठीक नहीं है।', 'english': 'Watching TV a lot is not good for eyes.'},
    {'hindi': '26. वो शायद मुझे याद कर रहा हो।', 'english': 'He might be missing me.'},
    {'hindi': '27. उसने आने दिया।', 'english': 'He let come.'},
    {'hindi': '28. शायद कल ओले पड़े।', 'english': 'It might hail tomorrow.'},
    {'hindi': '29. वो मुझे अक्सर याद आता था।', 'english': 'He used to often miss me.'},
    {'hindi': '30. राम ने कहा है।', 'english': 'Ram has said.'},
  ];

  static const List<Map<String, String>> set2Sentences = [
    {'hindi': '31. बर्गर खाये हुए तुम्हें कितने दिन हो गये हैं?', 'english': 'How many days has it been to you having eaten burger?'},
    {'hindi': '32. सभी को कुछ दिया जा रहा था।', 'english': 'All were being given something.'},
    {'hindi': '33. भगवान कृष्ण को मारा नहीं जा सकता।', 'english': 'Lord Krishna can\'t be killed.'},
    {'hindi': '34. अगर मैं आता तो तुमसे मिलता।', 'english': 'If I came, I would meet you.'},
    {'hindi': '35. यहाँ बारिश क्यों नहीं होती?', 'english': 'Why does it not rain here?'},
    {'hindi': '36. मुझे अंदर नहीं दिया जा रहा था।', 'english': 'I was not being let enter.'},
    {'hindi': '37. वो मेरे आगे खड़ा था।', 'english': 'He was standing ahead of me.'},
    {'hindi': '38. परसों छुट्टी थी।', 'english': 'It was holiday day before yesterday.'},
    {'hindi': '39. किस अभिनेता का भाई दिल्ली में है?', 'english': 'Which actor\'s brother is in Delhi?'},
    {'hindi': '40. उसे रोज हॉस्पिटल क्यों ले जाया जाता था?', 'english': 'Why did he use to be taken to hospital every day?'},
    {'hindi': '41. ज्यादा सोचना बेकार है।', 'english': 'Thinking a lot is a waste.'},
    {'hindi': '42. बच्चों को भेजा जाएगा।', 'english': 'Children will be sent.'},
    {'hindi': '43. उसके चेहरे ने मुझे एक आदमी की याद दिला दी जिसे मैं 1985 में मिला था।', 'english': 'His face reminded me of a man whom I had met in 1985.'},
    {'hindi': '44. भाई पक्का स्कूल के लिए निकल गया होगा।', 'english': 'Brother must have left for school.'},
    {'hindi': '45. मैंने कहा था कि मैं जाऊँगा।', 'english': 'I had said that I would go.'},
    {'hindi': '46. मैं चारों भाइयों में सबसे बड़ा हूँ।', 'english': 'I am the eldest among 4 brothers.'},
    {'hindi': '47. वो कब से खेल रहा है?', 'english': 'Since when has he been playing?'},
    {'hindi': '48. हमने उसे दिखाया था।', 'english': 'We had shown him.'},
    {'hindi': '49. ये किस पेड़ का आम है?', 'english': 'Which tree\'s mango is it?'},
    {'hindi': '50. राम उन दिनों हमसे मिलता था।', 'english': 'Ram used to meet us those days.'},
    {'hindi': '51. तुम्हें हॉस्पिटल क्यों ले जाया गया?', 'english': 'Why were you brought to hospital?'},
    {'hindi': '52. राम को भेजा जाना चाहिए।', 'english': 'Ram should be sent.'},
    {'hindi': '53. वो मेरा क्या लगता है?', 'english': 'What is he to me?'},
    {'hindi': '54. उसे खाना नहीं दिया जायेगा।', 'english': 'He will not be given the food.'},
    {'hindi': '55. हमें भेजा जा रहा है।', 'english': 'We are being sent.'},
    {'hindi': '56. मैं तुम्हें जाने नहीं देता।', 'english': 'I don\'t let you go.'},
    {'hindi': '57. जीतना उसकी आदत बन गयी है।', 'english': 'Winning has become his habit.'},
    {'hindi': '58. उसे किसने नहीं देखा?', 'english': 'Who didn\'t see him?'},
    {'hindi': '59. वो किसके साथ पढ़ता था?', 'english': 'With whom did he use to study?'},
    {'hindi': '60. मेरे पास किसी का पेन नहीं है।', 'english': 'We don\'t have anybody\'s pen.'},
  ];

  static const List<Map<String, String>> set3Sentences = [
    {'hindi': '61. मेरा दिल उससे ज्यादा मजबूत है।', 'english': 'My heart is stronger than his.'},
    {'hindi': '62. आज ओले नहीं पड़े।', 'english': 'It didn\'t hail today.'},
    {'hindi': '63. तुमसे मिले हुए मुझे कई साल हो गये हैं।', 'english': 'It has been many years having met you.'},
    {'hindi': '64. मुझे स्कूल पहुँचने में 10 मिनट लगते हैं।', 'english': 'It takes me 10 minutes to reach school.'},
    {'hindi': '65. 25 साल लगे।', 'english': 'It took 25 years.'},
    {'hindi': '66. ये बच्चा किस औरत का है?', 'english': 'Of which woman is this child?'},
    {'hindi': '67. क्या ये उस लड़की का है?', 'english': 'Is it of that girl? / Is it that girl\'s?'},
    {'hindi': '68. वो मुझे कभी हारने नहीं देगा।', 'english': 'He will never let me lose.'},
    {'hindi': '69. कितने दिन लगे?', 'english': 'How many days did it take?'},
    {'hindi': '70. वहाँ कौन छिपा हुआ है?', 'english': 'Who is hidden there?'},
    {'hindi': '71. किस लड़के की बहन वहाँ खड़ी थी?', 'english': 'Which boy\'s sister was standing there?'},
    {'hindi': '72. मैं कब से जगा हुआ हूँ?', 'english': 'Since when / From when am I awake?'},
    {'hindi': '73. शायद उसने देखा हो।', 'english': 'He might/may have seen.'},
    {'hindi': '74. मुझे कहा गया था कि मुझे अमेरिका भेजा जाएगा।', 'english': 'I was told that I would be sent to America.'},
    {'hindi': '75. ये कब हुआ?', 'english': 'When did it happen?'},
    {'hindi': '76. तुम मुझसे कम पैसे वाले हो।', 'english': 'You are poorer than I.'},
    {'hindi': '77. हमें सुबह से पढ़ाया जा रहा है।', 'english': 'We are being taught since morning.'},
    {'hindi': '78. वो काफी देर से सोया हुआ है।', 'english': 'He is asleep for a long.'},
    {'hindi': '79. उसे भेजा जाना चाहिए।', 'english': 'He should be sent.'},
    {'hindi': '80. मैं कल से यहाँ बैठा हूँ।', 'english': 'I have been sitting here since yesterday.'},
    {'hindi': '81. ये मोबाइल तुम्हारे मोबाइल से ज्यादा पुराना है।', 'english': 'This mobile is older than your mobile.'},
    {'hindi': '82. उसके पास किसी और का पेन था।', 'english': 'He had somebody else\'s pen.'},
    {'hindi': '83. क्या मैं उससे ज्यादा बुरा हूँ?', 'english': 'Am I worse than he?'},
    {'hindi': '84. बारिश कितने बजे हुई?', 'english': 'At what time did it rain?'},
    {'hindi': '85. क्या तुम्हें नहीं जाना?', 'english': 'Have you not to go?'},
    {'hindi': '86. क्या पता, उसने कहा हो!', 'english': 'He might/may have said.'},
    {'hindi': '87. सरकार हमें विद्रोह क्यों नहीं करने देती?', 'english': 'Why does Government not let us protest?'},
    {'hindi': '88. मुझे चैन से जीने दो।', 'english': 'Let me live peacefully.'},
    {'hindi': '89. उसका कुछ नहीं है, सब मेरा है।', 'english': 'His is nothing, all is mine.'},
    {'hindi': '90. मेरी है ये किताब?', 'english': 'Mine is this book?'},
  ];

  // Concept tags for each sentence (for badge display)
  static const List<String> set1ConceptTags = [
    'Passive Past', 'Passive Past Perfect', 'Past Interrogative',
    'Present Simple Q', 'Used to', 'Passive Modal',
    'Let + Past Perfect', 'Present Perfect Continuous', 'Passive Future Let',
    'Passive Present Q', 'WH + have to', 'Should have',
    'WH + Present', 'Having met', 'Might have',
    'Why + Present', 'Past Simple', 'Had to',
    'Would + like', 'What is there', 'Passive Past',
    'Why + Passive Continuous', 'Will be able to', 'How many + Past',
    'Gerund subject', 'Might + Continuous', 'Let + Past',
    'Might hail', 'Used to miss', 'Present Perfect',
  ];

  static const List<String> set2ConceptTags = [
    'Having eaten', 'Passive Past Continuous', 'Passive Modal',
    'Conditional Present', 'Why + Present', 'Passive Past Continuous',
    'Ahead of', 'Day before yesterday', 'Which + Possessive',
    'Passive used to', 'Gerund waste', 'Passive Future',
    'Reminded + whom', 'Must have', 'Reported speech',
    'Eldest among', 'Since when', 'Past Perfect',
    'Which + Possessive', 'Used to meet', 'Why + Passive Past',
    'Passive Should', 'What is to', 'Passive Future neg',
    'Passive Present Continuous', 'Don\'t let', 'Gerund subject',
    'Who + Past neg', 'With whom', 'Nobody\'s pen',
  ];

  static const List<String> set3ConceptTags = [
    'Comparative heart', 'It + hail', 'Having met',
    'It takes me', 'It took', 'Of which',
    'That girl\'s', 'Let + lose', 'How many + took',
    'Who + hidden', 'Which + Possessive', 'Since when awake',
    'Might have seen', 'Was told + would', 'When did happen',
    'Poorer than', 'Passive + since', 'Asleep for',
    'Should be sent', 'Since yesterday', 'Older than',
    'Somebody else\'s', 'Worse than he', 'At what time',
    'Have you not to', 'Might have said', 'Let us protest',
    'Let me live', 'His is nothing', 'Mine is this',
  ];
}