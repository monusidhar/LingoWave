import '../models/lesson_model.dart';

class Chapter26Data {
  static ChapterModel get chapter => ChapterModel(
        id: 26,
        title: 'Active & Passive Voice',
        titleHindi: 'कर्तृवाच्य और कर्मवाच्य',
        description: 'Tenses, Modals & Let — Passive Rules',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Concept — Active vs Passive',
              titleHindi: 'अवधारणा — Active बनाम Passive',
              emoji: '🔄',
              type: LessonType.ch26Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Passive of Tenses',
              titleHindi: 'Tenses का Passive Voice',
              emoji: '📋',
              type: LessonType.ch26PassiveTenses,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Passive of Modals',
              titleHindi: 'Modals का Passive Voice',
              emoji: '⚙️',
              type: LessonType.ch26PassiveModals,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Passive of Let',
              titleHindi: 'Let का Passive Voice',
              emoji: '🔓',
              type: LessonType.ch26PassiveLet,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (90 sentences)',
              emoji: '✍️',
              type: LessonType.ch26Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 6,
              title: 'Test Paper I — MCQ',
              titleHindi: 'परीक्षा पत्र I — सही विकल्प',
              emoji: '📝',
              type: LessonType.ch26TestPaper1,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 7,
              title: 'Test Paper II',
              titleHindi: 'परीक्षा पत्र II (Hindi→English 50)',
              emoji: '📋',
              type: LessonType.ch26TestPaper2,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 8,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch26ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch26Intro:
        return introQuestions;
      case LessonType.ch26PassiveTenses:
        return passiveTensesQuestions;
      case LessonType.ch26PassiveModals:
        return passiveModalsQuestions;
      case LessonType.ch26PassiveLet:
        return passiveLetQuestions;
      case LessonType.ch26Practice:
        return practiceQuizQuestions;
      case LessonType.ch26TestPaper1:
        return testPaper1QuizQuestions;
      case LessonType.ch26TestPaper2:
        return testPaper2QuizQuestions;
      case LessonType.ch26ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: Intro / Concept Quiz ──────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Active Voice की पहचान क्या है?',
      questionEn: 'What identifies an Active Voice sentence?',
      options: [
        'वाक्य में Subject नहीं होता',
        'Subject दिया होता है और वो क्रिया करता है',
        'Subject "द्वारा" के साथ आता है',
        'वाक्य में Verb की 3rd form होती है',
      ],
      correctIndex: 1,
      explanation: 'Active Voice में Subject दिया होता है और वही क्रिया को करता है। जैसे: "मैं जा रहा हूँ।"',
    ),
    QuizQuestion(
      questionHi: 'Passive Voice की पहचान क्या है?',
      questionEn: 'What identifies a Passive Voice sentence?',
      options: [
        'Subject दिया होता है और वो काम करता है',
        'वाक्य बहुत लंबा होता है',
        'Subject या तो नहीं दिया होता या "द्वारा" के साथ आता है',
        'Verb की 1st form होती है',
      ],
      correctIndex: 2,
      explanation: 'Passive Voice में Subject का ज़िक्र नहीं होता या Subject "द्वारा" के साथ प्रयोग होता है।',
    ),
    QuizQuestion(
      questionHi: '"मुझे भेजा जा रहा है।" — यह किस Voice में है?',
      questionEn: '"I am being sent." — Which voice is this?',
      options: ['Active Voice', 'Passive Voice', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: 'कौन भेज रहा है, ये नहीं बताया। Subject अनुपस्थित है — इसलिए यह Passive Voice है।',
    ),
    QuizQuestion(
      questionHi: 'Passive Voice में हमेशा Verb की कौन सी form का प्रयोग होता है?',
      questionEn: 'Which form of the verb is always used in Passive Voice?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 2,
      explanation: 'Passive Voice में हमेशा Verb की 3rd form (past participle) का प्रयोग होता है।',
    ),
    QuizQuestion(
      questionHi: '"बच्चों ने पत्थर फेंके।" — यह किस Voice में है?',
      questionEn: '"Children threw the stones." — Which voice?',
      options: ['Passive Voice', 'Active Voice', 'Modal Voice', 'Let Voice'],
      correctIndex: 1,
      explanation: 'Subject "बच्चों ने" दिया है और वे क्रिया कर रहे हैं — इसलिए यह Active Voice है।',
    ),
  ];

  // ─── L2: Passive of Tenses Quiz ────────────────────────────────────────────
  static const List<QuizQuestion> passiveTensesQuestions = [
    QuizQuestion(
      questionHi: 'Present Indefinite के Passive Voice में कौन सी Helping Verb लगती है?',
      questionEn: 'Which helping verb is used in Passive of Present Indefinite?',
      options: ['Do / Does', 'Is / Am / Are', 'Was / Were', 'Has / Have'],
      correctIndex: 1,
      explanation: 'Present Indefinite में Active = Do/Does, Passive = Is/Am/Are + V3।',
    ),
    QuizQuestion(
      questionHi: '"मुझे स्कूल भेजा गया।" — कौन सा Tense और Voice?',
      questionEn: '"I was sent to school." — Tense and Voice?',
      options: [
        'Present Indefinite — Passive',
        'Past Indefinite — Active',
        'Past Indefinite — Passive',
        'Future Indefinite — Passive',
      ],
      correctIndex: 2,
      explanation: '"Was sent" = Past Indefinite Passive। Passive HV: was/were + V3।',
    ),
    QuizQuestion(
      questionHi: 'Present Continuous के Passive में Helping Verb क्या होगी?',
      questionEn: 'Helping verb for Passive of Present Continuous?',
      options: [
        'Is/Am/Are',
        'Is/Am/Are + being',
        'Has/Have been',
        'Was/Were + being',
      ],
      correctIndex: 1,
      explanation: 'Present Continuous Passive = Is/Am/Are + being + V3।',
    ),
    QuizQuestion(
      questionHi: 'किन Tenses का Passive Voice नहीं बनता?',
      questionEn: 'Which tenses do NOT have passive voice?',
      options: [
        'Present Indefinite और Past Indefinite',
        'Future Indefinite और Past Perfect',
        'Present Perfect Continuous, Past Perfect Continuous, Future Continuous, Future Perfect Continuous',
        'Past Continuous और Present Continuous',
      ],
      correctIndex: 2,
      explanation: '4 Continuous Perfect Tenses का Passive नहीं होता: PP Continuous, PPf Continuous, F Continuous, FPf Continuous।',
    ),
    QuizQuestion(
      questionHi: '"राम को बताया गया है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram was told.',
        'Ram has been told.',
        'Ram is being told.',
        'Ram will be told.',
      ],
      correctIndex: 1,
      explanation: 'Present Perfect Passive = Has/Have + been + V3। Ram has been told.',
    ),
    QuizQuestion(
      questionHi: '"पापा को बुलाया जायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Dad was called.',
        'Dad has been called.',
        'Dad will be called.',
        'Dad is being called.',
      ],
      correctIndex: 2,
      explanation: 'Future Indefinite Passive = Will + be + V3। Dad will be called.',
    ),
    QuizQuestion(
      questionHi: '"उसे डाँटा जा रहा था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is being scolded.',
        'He was being scolded.',
        'He had been scolded.',
        'He will be scolded.',
      ],
      correctIndex: 1,
      explanation: 'Past Continuous Passive = Was/Were + being + V3। He was being scolded.',
    ),
    QuizQuestion(
      questionHi: '"हमें क्यों डाँटा जाता है?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Why were we scolded?',
        'Why are we being scolded?',
        'Why are we scolded?',
        'Why had we been scolded?',
      ],
      correctIndex: 2,
      explanation: 'Present Indefinite Passive = Is/Am/Are + V3। Why are we scolded?',
    ),
  ];

  // ─── L3: Passive of Modals Quiz ────────────────────────────────────────────
  static const List<QuizQuestion> passiveModalsQuestions = [
    QuizQuestion(
      questionHi: 'जिन Modals के साथ 1st form लगती है, उनके Passive में क्या लगाते हैं?',
      questionEn: 'For modals that use 1st form, what do we add in passive?',
      options: ['been', 'be', 'being', 'been + V3'],
      correctIndex: 1,
      explanation: 'Can, could, should, must, may, might जैसे modals के साथ Passive में "be" लगाते हैं। जैसे: can be sent।',
    ),
    QuizQuestion(
      questionHi: 'जिन Modals के साथ 3rd form लगती है, उनके Passive में क्या लगाते हैं?',
      questionEn: 'For modals that use 3rd form (could have, should have), what is added in passive?',
      options: ['be', 'being', 'been', 'have been'],
      correctIndex: 2,
      explanation: 'Could have, should have, may have, might have के Passive में "been" लगाते हैं।',
    ),
    QuizQuestion(
      questionHi: '"मुझे भेजा जा सकता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I should be sent.',
        'I can be sent.',
        'I could have been sent.',
        'I must be sent.',
      ],
      correctIndex: 1,
      explanation: '"सकता है" = Can। Passive: can + be + V3। I can be sent.',
    ),
    QuizQuestion(
      questionHi: '"राम को पैसे दिए जाने चाहिए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram must be given money.',
        'Ram can be given money.',
        'Ram should be given money.',
        'Ram would be given money.',
      ],
      correctIndex: 2,
      explanation: '"चाहिए" = Should। Passive: should + be + V3। Ram should be given money.',
    ),
    QuizQuestion(
      questionHi: '"बच्चों को पढ़ाया जा सकता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Children could be taught.',
        'Children should have been taught.',
        'Children could have been taught.',
        'Children can be taught.',
      ],
      correctIndex: 2,
      explanation: '"जा सकता था" = Could have। Passive: could have + been + V3। Children could have been taught.',
    ),
    QuizQuestion(
      questionHi: '"तुम्हें अमेरिका भेजा जाना चाहिए था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You should be sent to America.',
        'You should have been sent to America.',
        'You could have been sent to America.',
        'You must be sent to America.',
      ],
      correctIndex: 1,
      explanation: '"चाहिए था" = Should have। Passive: should have + been + V3। You should have been sent to America.',
    ),
    QuizQuestion(
      questionHi: '"हमें पढ़ाया जाता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'We were taught.',
        'We used to be taught.',
        'We had been taught.',
        'We are taught.',
      ],
      correctIndex: 1,
      explanation: '"जाता था" = Used to। Passive: used to + be + V3। We used to be taught.',
    ),
  ];

  // ─── L4: Passive of Let Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> passiveLetQuestions = [
    QuizQuestion(
      questionHi: '"Let" की तीनों forms क्या हैं?',
      questionEn: 'What are all three forms of "Let"?',
      options: [
        'Let / Letted / Letted',
        'Let / Let / Let',
        'Let / Lote / Loten',
        'Let / Let / Letting',
      ],
      correctIndex: 1,
      explanation: '"Let" की तीनों forms एक जैसी हैं — Let / Let / Let।',
    ),
    QuizQuestion(
      questionHi: '"मुझे स्कूल जाने दिया गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was let go to school.',
        'I am let go to school.',
        'I had been let go to school.',
        'I will be let go to school.',
      ],
      correctIndex: 0,
      explanation: 'Past Indefinite Passive of Let = Was/Were + let + V1। I was let go to school.',
    ),
    QuizQuestion(
      questionHi: '"राम को इग्ज़ैम में बैठने नहीं दिया गया है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram was not let sit in the exam.',
        'Ram has not been let sit in the exam.',
        'Ram will not be let sit in the exam.',
        'Ram is not being let sit in the exam.',
      ],
      correctIndex: 1,
      explanation: 'Present Perfect Passive of Let = Has/Have + been + let + V1। Ram has not been let sit in the exam.',
    ),
    QuizQuestion(
      questionHi: '"पापा को आने दिया जायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Dad was let come.',
        'Dad has been let come.',
        'Dad is being let come.',
        'Dad will be let come.',
      ],
      correctIndex: 3,
      explanation: 'Future Indefinite Passive of Let = Will + be + let + V1। Dad will be let come.',
    ),
    QuizQuestion(
      questionHi: '"उसे खेलने दिया जा रहा था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is being let play.',
        'He was being let play.',
        'He had been let play.',
        'He will be let play.',
      ],
      correctIndex: 1,
      explanation: 'Past Continuous Passive of Let = Was/Were + being + let + V1। He was being let play.',
    ),
  ];

  // ─── L5: Practice Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"पत्थर फेंके जाएँगे।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Stones were thrown.',
        'Stones are thrown.',
        'Stones will be thrown.',
        'Stones are being thrown.',
      ],
      correctIndex: 2,
      explanation: 'Future Indefinite Passive = Will + be + V3। Stones will be thrown.',
    ),
    QuizQuestion(
      questionHi: '"उसे दिल्ली में देखा गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is seen in Delhi.',
        'He was seen in Delhi.',
        'He has been seen in Delhi.',
        'He will be seen in Delhi.',
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite Passive = Was/Were + V3। He was seen in Delhi.',
    ),
    QuizQuestion(
      questionHi: '"तुम्हारा नाम क्यों लिया जा रहा है?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Why was your name being taken?',
        'Why is your name being called?',
        'Why has your name been called?',
        'Why will your name be called?',
      ],
      correctIndex: 1,
      explanation: 'Present Continuous Passive = Is/Am/Are + being + V3। Why is your name being called?',
    ),
    QuizQuestion(
      questionHi: '"मुझे क्या कहा गया था?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'What was said to me?',
        'What has been said to me?',
        'What had been said to me?',
        'What will be said to me?',
      ],
      correctIndex: 2,
      explanation: 'Past Perfect Passive = Had + been + V3। What had been said to me?',
    ),
    QuizQuestion(
      questionHi: '"उसे दिल्ली बुलाया जा सकता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He could be called to Delhi.',
        'He can be called to Delhi.',
        'He could have been called to Delhi.',
        'He should be called to Delhi.',
      ],
      correctIndex: 2,
      explanation: '"जा सकता था" = Could have। Passive = could have + been + V3। He could have been called to Delhi.',
    ),
    QuizQuestion(
      questionHi: '"यशी को क्यों बुलाया गया?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Why has Yashi been called?',
        'Why is Yashi called?',
        'Why was Yashi called?',
        'Why will Yashi be called?',
      ],
      correctIndex: 2,
      explanation: 'Past Indefinite Passive = Was/Were + V3। Why was Yashi called?',
    ),
    QuizQuestion(
      questionHi: '"क्या अमन को भेजा गया होगा?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Has Aman been sent?',
        'Was Aman sent?',
        'Will Aman have been sent?',
        'Had Aman been sent?',
      ],
      correctIndex: 2,
      explanation: 'Future Perfect Passive = Will + have + been + V3। Will Aman have been sent?',
    ),
    QuizQuestion(
      questionHi: '"मुझे पढ़ने नहीं दिया जाता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am not taught.',
        'I am not let study.',
        'I am not let to study.',
        'I am not being let study.',
      ],
      correctIndex: 1,
      explanation: 'Present Indefinite Passive of Let = Is/Am/Are + let + V1। I am not let study.',
    ),
  ];

  // ─── L6: Test Paper I Quiz (MCQ-based) ─────────────────────────────────────
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionHi: '"हमें भेजा गया।" — सही अनुवाद?',
      questionEn: '"हमें भेजा गया।" — correct translation?',
      options: [
        'We were sent.',
        'We were to go.',
        'We were made go.',
        'We were let go.',
      ],
      correctIndex: 0,
      explanation: 'Past Indefinite Passive = Was/Were + V3। We were sent.',
    ),
    QuizQuestion(
      questionHi: '"राम को डाँटा जा रहा था।" — सही?',
      questionEn: '"राम को डाँटा जा रहा था।" — correct?',
      options: [
        'Ram was scolding.',
        'Ram was being scold.',
        'Ram was being scolded.',
        'Ram was made scolded.',
      ],
      correctIndex: 2,
      explanation: 'Past Continuous Passive = Was/Were + being + V3। Ram was being scolded.',
    ),
    QuizQuestion(
      questionHi: '"तुम्हें क्या सिखाया जाता है?" — सही?',
      questionEn: '"तुम्हें क्या सिखाया जाता है?" — correct?',
      options: [
        'What are you taught?',
        'What do you be taught?',
        'What are you learned?',
        'What were you taught?',
      ],
      correctIndex: 0,
      explanation: 'Present Indefinite Passive = Is/Am/Are + V3। What are you taught?',
    ),
    QuizQuestion(
      questionHi: '"उन्हें बताया गया था।" — सही?',
      questionEn: '"उन्हें बताया गया था।" — correct?',
      options: [
        'They were told.',
        'They had been told.',
        'They were informed.',
        'They were been told.',
      ],
      correctIndex: 1,
      explanation: 'Past Perfect Passive = Had + been + V3। They had been told.',
    ),
    QuizQuestion(
      questionHi: '"तुम्हें क्यों नहीं जाने दिया गया?" — सही?',
      questionEn: '"तुम्हें क्यों नहीं जाने दिया गया?" — correct?',
      options: [
        'Why did you not go?',
        'Why did you not let go?',
        'Why were you not let go?',
        'Why were you not let gone?',
      ],
      correctIndex: 2,
      explanation: 'Past Indefinite Passive of Let = Was/Were + let + V1। Why were you not let go?',
    ),
    QuizQuestion(
      questionHi: '"क्या हमें खेलने दिया जायेगा आज?" — सही?',
      questionEn: '"क्या हमें खेलने दिया जायेगा आज?" — correct?',
      options: [
        'Will we be let play today?',
        'Will we be made play today?',
        'Will we let play today?',
        'Will we get the play today?',
      ],
      correctIndex: 0,
      explanation: 'Future Indefinite Passive of Let = Will + be + let + V1। Will we be let play today?',
    ),
    QuizQuestion(
      questionHi: '"क्या तुम्हें पीटा जाता था?" — सही?',
      questionEn: '"क्या तुम्हें पीटा जाता था?" — correct?',
      options: [
        'Had you to be beaten?',
        'Were you use to beat?',
        'Did you use to be beaten?',
        'Were you use to be beaten?',
      ],
      correctIndex: 2,
      explanation: 'Used to Passive = Did + use to + be + V3। Did you use to be beaten?',
    ),
    QuizQuestion(
      questionHi: '"सबको जाने दिया जायेगा।" — सही?',
      questionEn: '"सबको जाने दिया जायेगा।" — correct?',
      options: [
        'All will let go.',
        'All will be gone.',
        'All will let be gone.',
        'All will be let go.',
      ],
      correctIndex: 3,
      explanation: 'Future Indefinite Passive of Let = Will + be + let + V1। All will be let go.',
    ),
    QuizQuestion(
      questionHi: '"हमें खाना नहीं दिया जाता था।" — सही?',
      questionEn: '"हमें खाना नहीं दिया जाता था।" — correct?',
      options: [
        'We were not given the food.',
        'We didn\'t be given the food.',
        'We didn\'t use to be given the food.',
        'We were not to be given the food.',
      ],
      correctIndex: 2,
      explanation: 'Used to Passive Negative = Didn\'t use to + be + V3। We didn\'t use to be given the food.',
    ),
    QuizQuestion(
      questionHi: '"तुम मुझे पढ़ने क्यों नहीं दे रहे?" — सही?',
      questionEn: '"तुम मुझे पढ़ने क्यों नहीं दे रहे?" — correct?',
      options: [
        'Why are you not letting me study?',
        'Why do you not let me study?',
        'Why are you not let me study?',
        'Why are you not let me studying?',
      ],
      correctIndex: 0,
      explanation: 'Present Continuous Active of Let = Is/Am/Are + letting। Why are you not letting me study?',
    ),
  ];

  // ─── L7: Test Paper II Quiz ─────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionHi: '"हमें पूछा जा रहा है कि हम कौन हैं।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'We are being asked who we are.',
        'We were being asked who we are.',
        'We are asked who we are.',
        'We have been asked who we are.',
      ],
      correctIndex: 0,
      explanation: 'Present Continuous Passive = Is/Am/Are + being + V3। We are being asked who we are.',
    ),
    QuizQuestion(
      questionHi: '"मुझे रोज पीटा जाता था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was beaten daily.',
        'I am beaten daily.',
        'I used to be beaten daily.',
        'I have been beaten daily.',
      ],
      correctIndex: 2,
      explanation: '"जाता था" = Used to Passive। I used to be beaten daily.',
    ),
    QuizQuestion(
      questionHi: '"मुझे वहाँ जाने नहीं दिया गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I did not go there.',
        'I was not let go there.',
        'I was not let to go there.',
        'I am not let go there.',
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite Passive of Let = Was/Were + let + V1। I was not let go there.',
    ),
    QuizQuestion(
      questionHi: '"राहुल को स्कूल से निकाल दिया गया होगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Rahul has been expelled from school.',
        'Rahul was expelled from school.',
        'Rahul will have been expelled from the school.',
        'Rahul had been expelled from school.',
      ],
      correctIndex: 2,
      explanation: 'Future Perfect Passive = Will + have + been + V3। Rahul will have been expelled from the school.',
    ),
    QuizQuestion(
      questionHi: '"उसे बेवजह वहाँ भिजवाया गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He was sent there needlessly.',
        'He was unnecessarily made go there.',
        'He was let go there needlessly.',
        'He had been sent there.',
      ],
      correctIndex: 1,
      explanation: '"भिजवाया" = Causative (made go)। He was unnecessarily made go there.',
    ),
    QuizQuestion(
      questionHi: '"मुझसे एक गाना गवाया गया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I was sung a song.',
        'I was made sing a song.',
        'I sang a song.',
        'I was let sing a song.',
      ],
      correctIndex: 1,
      explanation: '"गवाया" = Causative (made sing)। I was made sing a song.',
    ),
    QuizQuestion(
      questionHi: '"दिल की बात को भी पढ़ा जा सकता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Even the heart can read.',
        'Even the heart can be read.',
        'The heart should be read.',
        'Even the heart could have been read.',
      ],
      correctIndex: 1,
      explanation: '"जा सकता है" = Can Passive। Even the heart can be read.',
    ),
    QuizQuestion(
      questionHi: '"अब हमारी सैलरी बढ़ाई जानी चाहिए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Our salary should be increased.',
        'Now, our salary must be increased.',
        'Our salary will be increased.',
        'Our salary has to be increased.',
      ],
      correctIndex: 1,
      explanation: '"जानी चाहिए" = Must (strong should)। Now, our salary must be increased.',
    ),
  ];

  // ─── L8: Chapter Final Quiz ─────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'Active Voice में Subject के बारे में क्या सही है?',
      questionEn: 'What is true about the subject in Active Voice?',
      options: [
        'Subject नहीं होता',
        'Subject "द्वारा" के साथ होता है',
        'Subject दिया होता है और खुद क्रिया करता है',
        'Subject Verb की 3rd form से पहले आता है',
      ],
      correctIndex: 2,
      explanation: 'Active Voice में Subject दिया होता है और वो खुद क्रिया करता है।',
    ),
    QuizQuestion(
      questionHi: 'Passive Voice में Verb की कौन सी form होती है?',
      questionEn: 'Which verb form is used in Passive Voice?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 2,
      explanation: 'Passive Voice में हमेशा Verb की 3rd form (past participle) का प्रयोग होता है।',
    ),
    QuizQuestion(
      questionHi: 'Past Indefinite Passive में Helping Verb क्या है?',
      questionEn: 'Helping verb for Past Indefinite Passive?',
      options: ['Did', 'Was / Were', 'Had', 'Has / Have'],
      correctIndex: 1,
      explanation: 'Past Indefinite: Active = Did, Passive = Was/Were + V3।',
    ),
    QuizQuestion(
      questionHi: 'Present Perfect Passive की Helping Verb?',
      questionEn: 'Helping verb for Present Perfect Passive?',
      options: [
        'Is/Am/Are',
        'Was/Were',
        'Has been / Have been',
        'Had been',
      ],
      correctIndex: 2,
      explanation: 'Present Perfect Passive = Has been / Have been + V3।',
    ),
    QuizQuestion(
      questionHi: 'कितने Tenses का Passive Voice नहीं होता?',
      questionEn: 'How many tenses do NOT have passive voice?',
      options: ['2', '3', '4', '5'],
      correctIndex: 2,
      explanation: '4 Tenses का Passive नहीं होता: PP Continuous, PPf Continuous, F Continuous, FPf Continuous।',
    ),
    QuizQuestion(
      questionHi: '"Should" के Passive में क्या लगता है?',
      questionEn: 'What is added with "Should" in passive voice?',
      options: ['been', 'be', 'being', 'have been'],
      correctIndex: 1,
      explanation: '"Should" 1st form वाला modal है इसलिए Passive में "be" लगाते हैं। Should + be + V3।',
    ),
    QuizQuestion(
      questionHi: '"Could have" के Passive में क्या लगता है?',
      questionEn: 'What is added with "Could have" in passive voice?',
      options: ['be', 'being', 'been', 'have'],
      correctIndex: 2,
      explanation: '"Could have" 3rd form वाला modal है इसलिए Passive में "been" लगाते हैं। Could have + been + V3।',
    ),
    QuizQuestion(
      questionHi: '"Let" की 3rd form क्या है?',
      questionEn: 'What is the 3rd form of "Let"?',
      options: ['Letten', 'Letted', 'Let', 'Letting'],
      correctIndex: 2,
      explanation: '"Let" की तीनों forms एक जैसी हैं — Let/Let/Let।',
    ),
    QuizQuestion(
      questionHi: '"मुझे स्कूल भेजा जा सकता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I should be sent to school.',
        'I can be sent to school.',
        'I could have been sent to school.',
        'I must be sent to school.',
      ],
      correctIndex: 1,
      explanation: '"जा सकता है" = Can। Passive = can + be + V3। I can be sent to school.',
    ),
    QuizQuestion(
      questionHi: '"उसे खेलने दिया जा रहा था।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He is being let play.',
        'He was being let play.',
        'He had been let play.',
        'He will be let play.',
      ],
      correctIndex: 1,
      explanation: 'Past Continuous Passive of Let = Was/Were + being + let + V1। He was being let play.',
    ),
  ];

  // ─── Content Data ─────────────────────────────────────────────────────────

  static const List<Map<String, String>> tensesPassiveTable = [
    {
      'tense': 'Present Indefinite',
      'hindiHint': 'ता, ते, ती',
      'activeHV': 'Do / Does',
      'passiveHV': 'Is / Am / Are',
    },
    {
      'tense': 'Present Continuous',
      'hindiHint': 'रहा है, रही है',
      'activeHV': 'Is / Am / Are',
      'passiveHV': 'Is / Am / Are + being',
    },
    {
      'tense': 'Present Perfect',
      'hindiHint': 'चुका है, लिया है',
      'activeHV': 'Has / Have',
      'passiveHV': 'Has been / Have been',
    },
    {
      'tense': 'Past Indefinite',
      'hindiHint': 'आया, गया, लिया',
      'activeHV': 'Did',
      'passiveHV': 'Was / Were',
    },
    {
      'tense': 'Past Continuous',
      'hindiHint': 'रहा था, रही थी',
      'activeHV': 'Was / Were',
      'passiveHV': 'Was / Were + being',
    },
    {
      'tense': 'Past Perfect',
      'hindiHint': 'चुका था, लिया था',
      'activeHV': 'Had',
      'passiveHV': 'Had been',
    },
    {
      'tense': 'Future Indefinite',
      'hindiHint': 'गा, गे, गी',
      'activeHV': 'Will',
      'passiveHV': 'Will be',
    },
    {
      'tense': 'Future Perfect',
      'hindiHint': 'चुका होगा',
      'activeHV': 'Will have',
      'passiveHV': 'Will have been',
    },
  ];

  static const List<Map<String, String>> noPassiveTenses = [
    {'name': 'Present Perfect Continuous', 'hint': 'रहा है (समय के साथ)'},
    {'name': 'Past Perfect Continuous', 'hint': 'रहा था (समय के साथ)'},
    {'name': 'Future Continuous', 'hint': 'रहा होगा'},
    {'name': 'Future Perfect Continuous', 'hint': 'रहा होगा (समय के साथ)'},
  ];

  static const List<Map<String, String>> tensesExamples = [
    {'hindi': 'मुझे स्कूल भेजा गया।', 'english': 'I was sent to school.', 'tense': 'Past Indefinite', 'voice': 'Passive'},
    {'hindi': 'राम को बताया गया है।', 'english': 'Ram has been told.', 'tense': 'Present Perfect', 'voice': 'Passive'},
    {'hindi': 'पापा को बुलाया जायेगा।', 'english': 'Dad will be called.', 'tense': 'Future Indefinite', 'voice': 'Passive'},
    {'hindi': 'मैंने सोचा था।', 'english': 'I had thought.', 'tense': 'Past Perfect', 'voice': 'Active'},
    {'hindi': 'तुम्हारा नाम क्यों लिया जा रहा है?', 'english': 'Why is your name being called?', 'tense': 'Present Continuous', 'voice': 'Passive'},
    {'hindi': 'उसे दिल्ली में देखा गया।', 'english': 'He was seen in Delhi.', 'tense': 'Past Indefinite', 'voice': 'Passive'},
    {'hindi': 'बच्चों ने पत्थर फेंके।', 'english': 'Children threw the stones.', 'tense': 'Past Indefinite', 'voice': 'Active'},
    {'hindi': 'उसे डाँटा जा रहा था।', 'english': 'He was being scolded.', 'tense': 'Past Continuous', 'voice': 'Passive'},
    {'hindi': 'पत्थर फेंके जाएँगे।', 'english': 'Stones will be thrown.', 'tense': 'Future Indefinite', 'voice': 'Passive'},
    {'hindi': 'हमें क्यों डाँटा जाता है?', 'english': 'Why are we scolded?', 'tense': 'Present Indefinite', 'voice': 'Passive'},
    {'hindi': 'यशी को क्यों बुलाया गया?', 'english': 'Why was Yashi called?', 'tense': 'Past Indefinite', 'voice': 'Passive'},
    {'hindi': 'पापा को क्या कहा गया है?', 'english': 'What has Dad been told?', 'tense': 'Present Perfect', 'voice': 'Passive'},
    {'hindi': 'हमें इतना क्यों परेशान किया जा रहा है?', 'english': 'Why are we being bothered this much?', 'tense': 'Present Continuous', 'voice': 'Passive'},
    {'hindi': 'मैंने क्या कहा था?', 'english': 'What had I said?', 'tense': 'Past Perfect', 'voice': 'Active'},
    {'hindi': 'मुझे क्या कहा गया था?', 'english': 'What had been said to me?', 'tense': 'Past Perfect', 'voice': 'Passive'},
    {'hindi': 'क्या अमन को भेजा गया होगा?', 'english': 'Will Aman have been sent?', 'tense': 'Future Perfect', 'voice': 'Passive'},
  ];

  static const List<Map<String, String>> modalsPassiveTable = [
    {
      'modal': 'Can / Could / Should / Must\nMay / Might / Has to / Have to\nHad to / Will have to',
      'formUsed': '1st form',
      'passiveRule': 'Modal + be + V3',
      'example': 'I can be sent.',
    },
    {
      'modal': 'Could have / Should have\nMust have / May have / Might have',
      'formUsed': '3rd form',
      'passiveRule': 'Modal + been + V3',
      'example': 'He could have been taught.',
    },
  ];

  static const List<Map<String, String>> modalsExamples = [
    {'hindi': 'मुझे स्कूल भेजा जा सकता है।', 'english': 'I can be sent to school.', 'modal': 'Can'},
    {'hindi': 'राम को पूछा जा सकता है कि वो कहाँ था।', 'english': 'Ram can be asked where he was.', 'modal': 'Can'},
    {'hindi': 'पापा को बुलाया जाना चाहिए।', 'english': 'Dad should be called.', 'modal': 'Should'},
    {'hindi': 'तुम्हें किताब दी जानी है।', 'english': 'You have to be given a book.', 'modal': 'Have to'},
    {'hindi': 'उसे डाँटा जाना चाहिए था।', 'english': 'He should have been scolded.', 'modal': 'Should have'},
    {'hindi': 'उसे दिल्ली बुलाया जा सकता था।', 'english': 'He could have been called to Delhi.', 'modal': 'Could have'},
    {'hindi': 'हमें पढ़ाया जाता था।', 'english': 'We used to be taught.', 'modal': 'Used to'},
    {'hindi': 'हमें नहीं पढ़ाया जाता था।', 'english': "We didn't use to be taught.", 'modal': 'Used to (neg)'},
    {'hindi': 'क्या हमें पढ़ाया जाता था?', 'english': 'Did we use to be taught?', 'modal': 'Used to (Q)'},
    {'hindi': 'राम को पैसे दिए जाने चाहिए।', 'english': 'Ram should be given money.', 'modal': 'Should'},
    {'hindi': 'बच्चों को पढ़ाया जा सकता था।', 'english': 'Children could have been taught.', 'modal': 'Could have'},
    {'hindi': 'तुम्हें अमेरिका भेजा जाना चाहिए था।', 'english': 'You should have been sent to America.', 'modal': 'Should have'},
  ];

  static const List<Map<String, String>> letExamples = [
    {'hindi': 'मुझे स्कूल जाने दिया गया।', 'english': 'I was let go to school.', 'tense': 'Past Indefinite'},
    {'hindi': 'राम को इग्ज़ैम में बैठने नहीं दिया गया है।', 'english': 'Ram has not been let sit in the exam.', 'tense': 'Present Perfect'},
    {'hindi': 'पापा को आने दिया जायेगा।', 'english': 'Dad will be let come.', 'tense': 'Future Indefinite'},
    {'hindi': 'उसे खेलने दिया जा रहा था।', 'english': 'He was being let play.', 'tense': 'Past Continuous'},
  ];

  // ─── Practice Exercise — 90 sentences in 3 sets of 30 ────────────────────

  static const List<Map<String, String>> practiceSet1 = [
    {'hindi': '1. तुम्हें डाँटा जाता है।', 'english': 'You are scolded.'},
    {'hindi': '2. हमें पीटा जा रहा था।', 'english': 'We were being beaten.'},
    {'hindi': '3. मुझे एक किताब दी जायेगी।', 'english': 'I will be given a book.'},
    {'hindi': '4. इस पुरस्कार के लिए केवल एक आदमी चुना जाता है।', 'english': 'Only one person is chosen for this prize.'},
    {'hindi': '5. मुझे तुम्हारे बारे में बताया गया है।', 'english': 'I have been told about you.'},
    {'hindi': '6. भारत को शान्तिप्रिय देश के रूप में जाना जाता है।', 'english': 'India is known as a peaceful nation.'},
    {'hindi': '7. क्या उसे भेजा गया?', 'english': 'Was he sent?'},
    {'hindi': '8. तुम्हारे लिए स्पेशल खाना बनाया जा रहा है।', 'english': 'A special food is being prepared for you.'},
    {'hindi': '9. उनके साथ वहाँ बुरा बर्ताव किया गया।', 'english': 'They were treated badly there.'},
    {'hindi': '10. उसे एक महान योद्धा के रूप में जाना जाता था।', 'english': 'He was known as a great warrior.'},
    {'hindi': '11. ये लिखा जा चुका है।', 'english': 'It has been written.'},
    {'hindi': '12. क्या उसे प्यार किया जाता है?', 'english': 'Is he loved?'},
    {'hindi': '13. फिल्म के मेगा हिट होने की घोषणा हो चुकी है।', 'english': 'The movie has been declared a mega hit.'},
    {'hindi': '14. गैंग के मुखिया को 2 बजे मार्केट में देखा गया है।', 'english': 'The chief of the gang is seen in market at 2.'},
    {'hindi': '15. क्या उन्हें इस शरारत के लिए डाँटा गया?', 'english': 'Were they scolded for this mischief?'},
    {'hindi': '16. दोनों दोषियों की पहचान की जा चुकी है।', 'english': 'Both the culprits have been identified.'},
    {'hindi': '17. चाय हर सुबह पी जाती है।', 'english': 'Tea is taken every morning.'},
    {'hindi': '18. उसे किसके साथ भेजा गया?', 'english': 'With whom was he sent?'},
    {'hindi': '19. उसे मर्डर के बारे में क्यों नहीं पूछा जाता?', 'english': 'Why is he not asked about the murder?'},
    {'hindi': '20. 4 टिकटें बुक कर ली गयी हैं।', 'english': 'Tickets have been booked.'},
    {'hindi': '21. किस्मत से मुझे वहाँ भेजा गया और मैं तुमसे मिला।', 'english': 'Fortunately, I was sent there and I met you.'},
    {'hindi': '22. मुझे एक अध्यापक के रुप में जाना जाता है।', 'english': 'I am known as a teacher.'},
    {'hindi': '23. बच्चों को बाहर भेजा गया।', 'english': 'Children were sent outside.'},
    {'hindi': '24. मुझे इसके बारे में सूचित नहीं किया गया।', 'english': 'I was not informed about this.'},
    {'hindi': '25. किताबें छापी जा रही हैं।', 'english': 'Books are being printed.'},
    {'hindi': '26. इस जगह से कुछ कुर्सियाँ हटाई गई हैं।', 'english': 'Some chairs have been moved from this place.'},
    {'hindi': '27. इस इलाके में कारें नहीं चलाई जाती।', 'english': 'Cars are not driven in this area.'},
    {'hindi': '28. उसे कब तक नहीं पूछा गया?', 'english': 'Until when was he not asked?'},
    {'hindi': '29. हर जगह मिठाईयाँ बाँटी जा रही हैं।', 'english': 'Sweets are being distributed all over.'},
    {'hindi': '30. वहाँ एक बिल्डिंग बनाई जा चुकी है।', 'english': 'A building has been constructed there.'},
  ];

  static const List<Map<String, String>> practiceSet2 = [
    {'hindi': '31. वो पुलिस के द्वारा पकड़ा गया।', 'english': 'He was caught by police.'},
    {'hindi': '32. प्याज और आलू काफी अधिक मात्रा में काटे गये।', 'english': 'Onions and potatoes were cut in huge quantity.'},
    {'hindi': '33. अपराधियों को ढूँढा जा रहा है।', 'english': 'Criminals are being sought.'},
    {'hindi': '34. उसे गोली से मार दिया गया।', 'english': 'He was shot dead.'},
    {'hindi': '35. बारिश के कारण मीटिंग रद्द कर दी गयी।', 'english': 'Meeting was cancelled due to rain.'},
    {'hindi': '36. घड़ी ठीक कराई गयी।', 'english': 'Watch was repaired.'},
    {'hindi': '37. हमें ऐसा कुछ नहीं दिया गया है।', 'english': 'We have not been given anything as such.'},
    {'hindi': '38. हमें वहाँ फालतू में क्यों भेजा जाता है?', 'english': 'Why are we unnecessarily sent there?'},
    {'hindi': '39. मुझे कहीं भेजा गया है।', 'english': 'I have been sent somewhere.'},
    {'hindi': '40. क्या तुम्हें बताया गया है कि हम कहाँ हैं?', 'english': 'Have you been told where we are?'},
    {'hindi': '41. एक विद्यार्थी को उसके सहपाठी द्वारा प्रताड़ित किया गया।', 'english': 'A student was tortured by his classmate.'},
    {'hindi': '42. उसे ट्रक की ओर धक्का दिया गया ताकि वो मर जाए।', 'english': 'He was pushed towards a truck so that he dies.'},
    {'hindi': '43. दीवाली खुशी से मनाई गई।', 'english': 'Diwali was celebrated with joy.'},
    {'hindi': '44. क्या तुम्हें तुम्हारी लापरवाही के लिए दंड दिया जाएगा?', 'english': 'Will you be punished for your negligence?'},
    {'hindi': '45. हमें कहीं और भेजा जा रहा है।', 'english': 'We are being sent somewhere else.'},
    {'hindi': '46. पैन उठा लिया गया है।', 'english': 'Pen has been picked.'},
    {'hindi': '47. उसे यह क्यों दिया गया?', 'english': 'Why was he given this?'},
    {'hindi': '48. हमें क्या बताया गया?', 'english': 'What was told to us?'},
    {'hindi': '49. उन्हें कहाँ भेजा गया था?', 'english': 'Where had they been sent?'},
    {'hindi': '50. उसे घसीट कर पुलिस स्टेशन ले जाया गया।', 'english': 'He was dragged to police station.'},
    {'hindi': '51. हमारी किताबों को फाड़ा गया और कूड़ेदान में फेंक दिया गया।', 'english': 'Our books were torn & thrown into the dustbin.'},
    {'hindi': '52. हमें 6 क्लास तक अंग्रेजी नहीं पढ़ाई जाती।', 'english': 'We are not taught English up to 6th standard.'},
    {'hindi': '53. इस साल कुछ विद्यार्थियों को लैपटॉप दिये गये हैं।', 'english': 'Few students have been given laptops this year.'},
    {'hindi': '54. उसके भाई को जान से मार दिया गया।', 'english': 'His brother was killed.'},
    {'hindi': '55. 25 प्रतिशत सीटें गरीब स्टूडेन्ट्स के लिए आरक्षित हैं।', 'english': '25% seats are reserved for poor students.'},
    {'hindi': '56. इन्सान को स्वर्ग भेजा जाता है अगर वो अच्छे कर्म करें।', 'english': 'Human is sent to heaven if he does good deeds.'},
    {'hindi': '57. राम को भेजा जा सकता है।', 'english': 'Ram can be sent.'},
    {'hindi': '58. उसे पूछा जाना चाहिए था।', 'english': 'He should have been asked.'},
    {'hindi': '59. हमें भेजा जाना है।', 'english': 'We have to be sent.'},
    {'hindi': '60. तुम्हें बुलाया जाना था पर नहीं बुलाया जा सका।', 'english': 'You had to be called but couldn\'t be.'},
  ];

  static const List<Map<String, String>> practiceSet3 = [
    {'hindi': '61. ये काम हो जाना चाहिए था।', 'english': 'This work should have been done.'},
    {'hindi': '62. मम्मी को पूछा जाता था।', 'english': 'Mom used to be asked.'},
    {'hindi': '63. क्या राम को किताब दी जा सकती है?', 'english': 'Can Ram be given the book?'},
    {'hindi': '64. तुम्हें क्यों नहीं पढ़ाया जा सका?', 'english': 'Why could you not be taught?'},
    {'hindi': '65. उसे क्या दिया गया?', 'english': 'What was he given?'},
    {'hindi': '66. राम को किसके साथ भेजा जाना चाहिए?', 'english': 'With whom should Ram be sent?'},
    {'hindi': '67. मोबाइल का प्रयोग क्यों होना चाहिए?', 'english': 'Why should mobile be used?'},
    {'hindi': '68. हमें क्या पढ़ाया जाता था?', 'english': 'What did we use to be taught?'},
    {'hindi': '69. मुझे मोबाइल दिया जा सकता है।', 'english': 'I can be given a mobile.'},
    {'hindi': '70. अगला प्रश्न क्या होना चाहिए?', 'english': 'What should be the next question?'},
    {'hindi': '71. तुम्हें सजा मिलनी चाहिए।', 'english': 'You must be punished.'},
    {'hindi': '72. हमें कुछ पैसे खर्च के लिए मिलने चाहिए।', 'english': 'We should be given some money to spend.'},
    {'hindi': '73. हमारी तनख्वाह बढ़ाई जानी है।', 'english': 'Our salary has to be increased.'},
    {'hindi': '74. उसे पूछा जाना था।', 'english': 'He had to be asked.'},
    {'hindi': '75. होमवर्क जरूर करना चाहिए।', 'english': 'Homework must be done.'},
    {'hindi': '76. सारे प्रश्न हल किये जा सकते हैं।', 'english': 'All the questions can be solved.'},
    {'hindi': '77. खाने का तरीका सुधारा जा सकता है।', 'english': 'The way of eating can be improved.'},
    {'hindi': '78. उसे राम की वजह से बुलाया गया।', 'english': 'He was called due to Ram.'},
    {'hindi': '79. मुझे कंपनी से बाहर नहीं निकाला जा सका।', 'english': 'I could not be fired from the company.'},
    {'hindi': '80. किसी का भी दिल दुखाया जा सकता है।', 'english': 'Anybody can be hurt.'},
    {'hindi': '81. हर किसी का दिल नहीं जीता जा सकता।', 'english': 'Everybody\'s heart can\'t be won.'},
    {'hindi': '82. मेरे साथ किसी को भेजा नहीं जाना चाहिए।', 'english': 'Nobody should be sent with me.'},
    {'hindi': '83. उसे कहाँ भेजा जाना चाहिए।', 'english': 'Where should he be sent?'},
    {'hindi': '84. उसका नाम कुछ देर बाद पुकारा जाना है।', 'english': 'His name has to be called after a while.'},
    {'hindi': '85. यहाँ पर पैन से लिखा जाना है।', 'english': 'Pen has to be used here.'},
    {'hindi': '86. तुम्हें ये नहीं दिया जाना।', 'english': 'You have not to be given this.'},
    {'hindi': '87. मछलियों को कहीं और भेजा जा सकता है।', 'english': 'Fishes can be sent somewhere else.'},
    {'hindi': '88. ये पानी पिया नहीं जा सकता क्योंकि यह खारा है।', 'english': 'This water is not drinkable as it is saline.'},
    {'hindi': '89. इसके किसी भी हाल में बेच दिया जाना चाहिए।', 'english': 'It should be sold at any cost.'},
    {'hindi': '90. मुझे पढ़ने नहीं दिया जाता।', 'english': 'I am not let study.'},
  ];

  // ─── Test Paper I — MCQ (16 questions with options + answer + hint) ────────
  static const List<Map<String, dynamic>> testPaper1MCQ = [
    {
      'hindi': 'हमें भेजा गया।',
      'options': ['We were sent.', 'We were to go.', 'We were made go.', 'We were let go.'],
      'answer': 0,
      'hint': 'Past Indefinite Passive',
    },
    {
      'hindi': 'राम को डाँटा जा रहा था।',
      'options': ['Ram was scolding.', 'Ram was being scold.', 'Ram was being scolded.', 'Ram was made scolded.'],
      'answer': 2,
      'hint': 'Past Continuous Passive',
    },
    {
      'hindi': 'उसे मुझसे मिलवाया जायेगा।',
      'options': ['He will be meeting me.', 'He will be made meet me.', 'He will be made to meet me.', 'He will make me meet.'],
      'answer': 1,
      'hint': 'Future Indefinite Passive of causative verb (make)',
    },
    {
      'hindi': 'तुम्हें क्या सिखाया जाता है?',
      'options': ['What are you taught?', 'What do you be taught?', 'What are you learned?', 'What were you taught?'],
      'answer': 0,
      'hint': 'Present Indefinite Passive',
    },
    {
      'hindi': 'मुझे भिजवाया गया।',
      'options': ['I was sent.', 'I was made sent.', 'I was made go.', 'I made go.'],
      'answer': 2,
      'hint': 'Past Indefinite Passive of causative verb (make)',
    },
    {
      'hindi': 'उन्हें बताया गया था।',
      'options': ['They were told.', 'They had been told.', 'They were informed.', 'They were been told.'],
      'answer': 1,
      'hint': 'Past Perfect Passive',
    },
    {
      'hindi': 'तुम्हें क्यों नहीं जाने दिया गया?',
      'options': ['Why did you not go?', 'Why did you not let go?', 'Why were you not let go?', 'Why were you not let gone?'],
      'answer': 2,
      'hint': 'Past Indefinite Passive (Verb - Let)',
    },
    {
      'hindi': 'क्या हमें खेलने दिया जायेगा आज?',
      'options': ['Will we be let play today?', 'Will we be made play today?', 'Will we let play today?', 'Will we get the play today?'],
      'answer': 0,
      'hint': 'Future Indefinite Passive (Verb - Let)',
    },
    {
      'hindi': 'मुझसे काम करवाया जा सकता है।',
      'options': ['I can get the work done.', 'Work can be done by me.', 'I can made do the work.', 'I can be made do the work.'],
      'answer': 3,
      'hint': 'Modal (can) Passive of Causative verb (make)',
    },
    {
      'hindi': 'क्या तुम्हें पीटा जाता था?',
      'options': ['Had you to be beaten?', 'Were you use to beat?', 'Did you use to be beaten?', 'Were you use to be beaten?'],
      'answer': 2,
      'hint': 'Modal (use to) Passive',
    },
    {
      'hindi': 'सीता को हॉस्पिटल ले जाया गया था।',
      'options': ['Seeta was brought to hospital.', 'Seeta had been brought to hospital.', 'Seeta was made bring to hospital.', 'Seeta was got brought to hospital.'],
      'answer': 1,
      'hint': 'Past Perfect Passive',
    },
    {
      'hindi': 'आज हमें क्लास में नया टॉपिक पढ़ाया जाना है।',
      'options': ['We have to be taught a new topic in the class today.', 'We are to be taught a new topic in the class today.', 'We have been to teach a new topic in the class today.', 'We have to teach a new topic in the class today.'],
      'answer': 0,
      'hint': 'Modal (have to) Passive',
    },
    {
      'hindi': 'सबको जाने दिया जायेगा।',
      'options': ['All will let go.', 'All will be gone.', 'All will let be gone.', 'All will be let go.'],
      'answer': 3,
      'hint': 'Future Indefinite Passive (Verb - Let)',
    },
    {
      'hindi': 'हमें खाना नहीं दिया जाता था।',
      'options': ['We were not given the food.', 'We didn\'t be given the food.', 'We didn\'t use to be given the food.', 'We were not to be given the food.'],
      'answer': 2,
      'hint': 'Modal (use to) Passive Negative',
    },
    {
      'hindi': 'तुम मुझे पढ़ने क्यों नहीं दे रहे?',
      'options': ['Why are you not letting me study?', 'Why do you not let me study?', 'Why are you not let me study?', 'Why are you not let me studying?'],
      'answer': 0,
      'hint': 'Present Continuous Active (Verb - Let)',
    },
    {
      'hindi': 'ये काम किससे करवाया गया था?',
      'options': ['By whom was this work got done?', 'By whom did this work get done?', 'By whom had this work been got done?', 'By whom had this work been get done?'],
      'answer': 2,
      'hint': 'Past Perfect Passive of Causative Verb (Get)',
    },
  ];

  // ─── Test Paper II — Hindi → English (50 sentences) ──────────────────────
  static const List<Map<String, String>> testPaper2Sentences = [
    {'hindi': '1. हमें पूछा जा रहा है कि हम कौन हैं।', 'english': 'We are being asked who we are.'},
    {'hindi': '2. तुम्हें भेजा जा सकता है।', 'english': 'You may/can be sent.'},
    {'hindi': '3. मुझे रोज पीटा जाता था।', 'english': 'I used to be beaten daily.'},
    {'hindi': '4. उसे घसीट के घर से बाहर निकाला गया।', 'english': 'He was dragged out of the house.'},
    {'hindi': '5. राम को रोज हॉस्पिटल ले जाया जाता है।', 'english': 'Ram is taken to hospital daily.'},
    {'hindi': '6. हमें आज कुछ नया पढ़ाया जाना चाहिए।', 'english': 'We should be taught something new today.'},
    {'hindi': '7. तुम चोर हो। क्या तुम्हें पीटा नहीं जाना चाहिए?', 'english': 'You are a thief. Should you not be beaten?'},
    {'hindi': '8. ये काम राम के द्वारा करवाया गया।', 'english': 'This work was got done by Ram.'},
    {'hindi': '9. मुझे भी किताब दी जा सकती थी पर आप मुझे प्यार नहीं करते इसलिए आपने नहीं दी।', 'english': 'Even I could have been given the book but you don\'t love me, that\'s why you didn\'t give.'},
    {'hindi': '10. मुझे यहाँ भेजा गया है।', 'english': 'I have been sent here.'},
    {'hindi': '11. बच्चों को क्या दिया जाएगा?', 'english': 'What will children be given?'},
    {'hindi': '12. मुझे वहाँ जाने नहीं दिया गया।', 'english': 'I was not let go there.'},
    {'hindi': '13. मुझे पीटा जायेगा।', 'english': 'I will be beaten.'},
    {'hindi': '14. उसे बेवजह वहाँ भिजवाया गया।', 'english': 'He was unnecessarily made go there.'},
    {'hindi': '15. राम को डंडे से पीटा गया।', 'english': 'Ram was beaten with a stick.'},
    {'hindi': '16. तुम्हें भिजवाया जा रहा है।', 'english': 'You are being made go.'},
    {'hindi': '17. जब तुम गलत काम करते हो, क्या तुम्हें डाँटा नहीं जाता?', 'english': 'When you do wrong, are you not scolded?'},
    {'hindi': '18. उसे बताया जा रहा था।', 'english': 'He was being told.'},
    {'hindi': '19. उसे वहाँ क्यों भेजा जाता है?', 'english': 'Why is he sent there?'},
    {'hindi': '20. खूनी को तिहाड़ जेल ले जाया गया।', 'english': 'The criminal was taken to Tihar Jail.'},
    {'hindi': '21. राम को नहीं भेजा जाएगा।', 'english': 'Ram will not be sent.'},
    {'hindi': '22. तुम्हें स्कूल में क्या सिखाया जाता है?', 'english': 'What are you taught in school?'},
    {'hindi': '23. मुझसे चार प्रश्न पूछे गये।', 'english': 'I was asked four questions.'},
    {'hindi': '24. उसे कभी नहीं पीटा गया।', 'english': 'He was never beaten.'},
    {'hindi': '25. राम की मम्मी को बाजार में देखा गया था।', 'english': 'Ram\'s mother had been seen in the market.'},
    {'hindi': '26. क्या उसे बुलाया गया?', 'english': 'Was he called?'},
    {'hindi': '27. उसके पिता को जान से मार दिया गया।', 'english': 'His father was killed.'},
    {'hindi': '28. उन्हें कहाँ भेजा जा रहा है?', 'english': 'Where are they being sent?'},
    {'hindi': '29. अब हमारी सैलरी बढ़ाई जानी चाहिए।', 'english': 'Now, our salary must be increased.'},
    {'hindi': '30. राहुल को कहा गया था कि उसे 2 घंटे पढ़ना है।', 'english': 'Rahul had been told that he had to study for 2 hours.'},
    {'hindi': '31. हमें भिजवाया जायेगा।', 'english': 'We will be made go.'},
    {'hindi': '32. मुझे कुछ भी नहीं दिया गया।', 'english': 'I was not given anything.'},
    {'hindi': '33. राहुल को स्कूल से निकाल दिया गया होगा।', 'english': 'Rahul will have been expelled from the school.'},
    {'hindi': '34. बच्चों को आज कुछ नहीं पढ़ाया गया।', 'english': 'Children were not taught anything today.'},
    {'hindi': '35. राहुल को सुलाया जा रहा है।', 'english': 'Rahul is being made sleep.'},
    {'hindi': '36. मुझे सब कुछ दिया गया जो कुछ मैंने मांगा।', 'english': 'I was given everything that I demanded.'},
    {'hindi': '37. हमें किसी और के साथ भेजा गया।', 'english': 'We were sent with someone else.'},
    {'hindi': '38. उसे खाना नहीं दिया जाता था।', 'english': 'He didn\'t use to be given the food.'},
    {'hindi': '39. क्या उसे कोई अवार्ड दिया जाना है?', 'english': 'Has he to be given an award?'},
    {'hindi': '40. तुम्हें उसके साथ कहाँ भेजा गया था?', 'english': 'Where had you been sent with him?'},
    {'hindi': '41. पापा को अमेरिका भेजा जा सकता है।', 'english': 'Dad can be sent to America.'},
    {'hindi': '42. दिल की बात को भी पढ़ा जा सकता है।', 'english': 'Even the heart can be read.'},
    {'hindi': '43. सब बच्चों को चॉकलेट दी गयी है।', 'english': 'All the children have been given chocolates.'},
    {'hindi': '44. मुझसे एक गाना गवाया गया।', 'english': 'I was made sing a song.'},
    {'hindi': '45. उसे किसके साथ बिठाया गया?', 'english': 'With whom was he made sit?'},
    {'hindi': '46. पापा को मेरे बारे में गलत बताया गया।', 'english': 'Dad was told wrong about me.'},
    {'hindi': '47. वहाँ एक पुल बनाया जायेगा।', 'english': 'A bridge will be constructed there.'},
    {'hindi': '48. हमें अगले महीने सूचना दी जायेगी।', 'english': 'We will be informed next month.'},
    {'hindi': '49. क्या तुम्हें पैसे दिये जाते हैं स्कूल में?', 'english': 'Are you given money in school?'},
    {'hindi': '50. बच्चों को क्या दिया गया?', 'english': 'What were children given?'},
  ];
}