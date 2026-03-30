import '../models/lesson_model.dart';

class Chapter25Data {
  static ChapterModel get chapter => ChapterModel(
        id: 25,
        title: 'Causative Verbs',
        titleHindi: 'Get & Make (करवाना)',
        description: 'Get & Make — Non-living vs Living',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Concept — Get vs Make',
              titleHindi: 'अवधारणा — Get बनाम Make',
              emoji: '⚙️',
              type: LessonType.ch25Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Get — Non-living Things',
              titleHindi: 'Get — निर्जीव चीज़ों के साथ',
              emoji: '📦',
              type: LessonType.ch25Get,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Make — Living Beings',
              titleHindi: 'Make — सजीव के साथ',
              emoji: '👤',
              type: LessonType.ch25Make,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Special Make Words',
              titleHindi: 'Make — smile, cry, happy...',
              emoji: '😊',
              type: LessonType.ch25Special,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (85 sentences)',
              emoji: '✍️',
              type: LessonType.ch25Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 6,
              title: 'Test Paper I',
              titleHindi: 'परीक्षा पत्र I (English→Hindi)',
              emoji: '📝',
              type: LessonType.ch25TestPaper1,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 7,
              title: 'Test Paper II',
              titleHindi: 'परीक्षा पत्र II (English→Hindi)',
              emoji: '📋',
              type: LessonType.ch25TestPaper2,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 8,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch25ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch25Intro:
        return introQuestions;
      case LessonType.ch25Get:
        return getQuestions;
      case LessonType.ch25Make:
        return makeQuestions;
      case LessonType.ch25Special:
        return specialQuestions;
      case LessonType.ch25Practice:
        return practiceQuizQuestions;
      case LessonType.ch25TestPaper1:
        return testPaper1QuizQuestions;
      case LessonType.ch25TestPaper2:
        return testPaper2QuizQuestions;
      case LessonType.ch25ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Causative Verbs का प्रयोग कब होता है?',
      questionEn: 'When are Causative Verbs used?',
      options: [
        'जब Subject खुद काम करे',
        'जब Subject किसी से काम करवाए',
        'जब Object काम करे',
        'जब Verb past हो',
      ],
      correctIndex: 1,
      explanation: 'Causative Verbs तब प्रयोग होती हैं जब Subject काम खुद नहीं करता बल्कि किसी तीसरे से करवाता है।',
    ),
    QuizQuestion(
      questionHi: 'अंग्रेज़ी में कितनी Causative Verbs हैं?',
      questionEn: 'How many Causative Verbs are there in English?',
      options: ['1', '2', '3', '4'],
      correctIndex: 1,
      explanation: 'English में 2 Causative Verbs हैं — Get और Make।',
    ),
    QuizQuestion(
      questionHi: '"राम ने पत्र लिखवाया" — यहाँ राम ने क्या किया?',
      questionEn: '"Ram got the letter written" — what did Ram do?',
      options: [
        'राम ने खुद पत्र लिखा',
        'राम ने किसी और से पत्र लिखवाया',
        'राम ने पत्र पढ़ा',
        'राम ने पत्र फेंका',
      ],
      correctIndex: 1,
      explanation: 'राम ने खुद नहीं लिखा — किसी और से लिखवाया। यही Causative का अर्थ है।',
    ),
    QuizQuestion(
      questionHi: '"Get" का Causative प्रयोग किसके साथ होता है?',
      questionEn: '"Get" as a causative verb is used with?',
      options: ['Living beings', 'Non-living things', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Get" का प्रयोग निर्जीव चीज़ों (non-living) के साथ होता है।',
    ),
    QuizQuestion(
      questionHi: '"Make" का Causative प्रयोग किसके साथ होता है?',
      questionEn: '"Make" as a causative verb is used with?',
      options: ['Non-living things', 'Living beings', 'Animals only', 'Objects only'],
      correctIndex: 1,
      explanation: '"Make" का प्रयोग सजीव (living beings) के साथ होता है।',
    ),
  ];

  // ─── L2: Get Quiz ──────────────────────────────────────────────────────────
  static const List<QuizQuestion> getQuestions = [
    QuizQuestion(
      questionHi: '"Get" के साथ दूसरी verb की कौन सी form लगती है?',
      questionEn: 'Which form of the second verb is used with "Get"?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 2,
      explanation: 'Get वाले वाक्यों में दूसरी Main Verb की 3rd form (past participle) लगती है।',
    ),
    QuizQuestion(
      questionHi: '"राम पत्र लिखवाता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram writes the letter.',
        'Ram gets the letter written.',
        'Ram makes the letter written.',
        'Ram got the letter write.',
      ],
      correctIndex: 1,
      explanation: 'पत्र = non-living → Get। दूसरी verb written (3rd form)। Ram gets the letter written.',
    ),
    QuizQuestion(
      questionHi: '"राम पत्र लिखवा चुका है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram got the letter written.',
        'Ram has got the letter written.',
        'Ram is getting the letter written.',
        'Ram will get the letter written.',
      ],
      correctIndex: 1,
      explanation: 'Present Perfect: Sub + has/have + got + Object + V3rd।',
    ),
    QuizQuestion(
      questionHi: '"राम पत्र लिखवा रहा है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram gets the letter written.',
        'Ram got the letter written.',
        'Ram is getting the letter written.',
        'Ram had got the letter written.',
      ],
      correctIndex: 2,
      explanation: 'Present Continuous: Sub + is/am/are + getting + Object + V3rd।',
    ),
    QuizQuestion(
      questionHi: '"राम पत्र लिखवायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram gets the letter written.',
        'Ram is getting the letter written.',
        'Ram had got the letter written.',
        'Ram will get the letter written.',
      ],
      correctIndex: 3,
      explanation: 'Future Indefinite: Sub + will + get + Object + V3rd।',
    ),
  ];

  // ─── L3: Make Quiz ─────────────────────────────────────────────────────────
  static const List<QuizQuestion> makeQuestions = [
    QuizQuestion(
      questionHi: '"Make" के साथ दूसरी verb की कौन सी form लगती है?',
      questionEn: 'Which form of the second verb is used with "Make"?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 0,
      explanation: 'Make वाले वाक्यों में दूसरी Main Verb की 1st form (bare infinitive) लगती है।',
    ),
    QuizQuestion(
      questionHi: '"राम मुझसे लिखवाता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram gets me written.',
        'Ram makes me write.',
        'Ram makes me writing.',
        'Ram made me write.',
      ],
      correctIndex: 1,
      explanation: 'मैं = living → Make। Ram makes me write. (write = 1st form)',
    ),
    QuizQuestion(
      questionHi: '"तुम मुझे भिजवाते हो।" — यहाँ दूसरी verb क्या है?',
      questionEn: '"You make me go." — what is the 2nd verb?',
      options: ['Send', 'Go', 'Make', 'Get'],
      correctIndex: 1,
      explanation: 'भेजने का काम राम करेगा पर जाने का काम "मैं" करूँगा। इसलिए 2nd verb = go।',
    ),
    QuizQuestion(
      questionHi: '"मैं राम को तुमसे पिटवाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will make Ram beat you.',
        'I will make you beat Ram.',
        'I will get Ram beaten.',
        'I will make Ram be beaten.',
      ],
      correctIndex: 1,
      explanation: 'पीटने का काम तुम करोगे → you beat। Ram = object who gets beaten। I will make you beat Ram.',
    ),
    QuizQuestion(
      questionHi: '"मैं तुम्हें पिटवाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will make you beat.',
        'I will make you be beaten.',
        'I will get you beaten.',
        'Both B and C',
      ],
      correctIndex: 3,
      explanation: 'तुम पिटोगे = you will be beaten। I will make you be beaten। OR I will get you beaten।',
    ),
  ];

  // ─── L4: Special Words Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> specialQuestions = [
    QuizQuestion(
      questionHi: '"मैं तुम्हें खुश करूँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will get you happy.',
        'I will make you happy.',
        'I will make you happiness.',
        'I will make you be happy.',
      ],
      correctIndex: 1,
      explanation: '"Happy" के साथ हमेशा Make प्रयोग होता है। I will make you happy।',
    ),
    QuizQuestion(
      questionHi: '"मैं तुम्हें हँसाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will get you laugh.',
        'I will make you laugh.',
        'I will make you laughing.',
        'I will get you smiled.',
      ],
      correctIndex: 1,
      explanation: '"Laugh/Smile" के साथ Make। I will make you laugh/smile।',
    ),
    QuizQuestion(
      questionHi: '"मैं तुम्हें रुलाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will get you cry.',
        'I will make you weep.',
        'I will make you crying.',
        'I will get you weeping.',
      ],
      correctIndex: 1,
      explanation: '"Cry/Weep" के साथ Make। I will make you weep/cry।',
    ),
    QuizQuestion(
      questionHi: '"मैं तुम्हें समझाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will make you understand.',
        'I will get you understood.',
        'I will make you understanding.',
        'I will get you understand.',
      ],
      correctIndex: 0,
      explanation: '"Understand" के साथ Make। I will make you understand।',
    ),
    QuizQuestion(
      questionHi: 'इनमें से किस word के साथ हमेशा "Make" लगता है?',
      questionEn: 'Which of these words always uses "Make"?',
      options: ['Letter', 'Car', 'Smile', 'Book'],
      correctIndex: 2,
      explanation: 'Smile, laugh, cry, weep, understand, happy, sad — इन सब के साथ हमेशा Make।',
    ),
  ];

  // ─── L5: Practice Quiz ────────────────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"वो मुझसे लिखवाता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'He gets me written.',
        'He makes me write.',
        'He made me write.',
        'He is making me written.',
      ],
      correctIndex: 1,
      explanation: 'मैं = living → Make। He makes me write।',
    ),
    QuizQuestion(
      questionHi: '"मैं उसे भिजवा चुका होऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will make him go.',
        'I will have made him go.',
        'I had made him go.',
        'I have made him go.',
      ],
      correctIndex: 1,
      explanation: 'Future Perfect: I will have made him go।',
    ),
    QuizQuestion(
      questionHi: '"पैसा तुम्हें प्यार नहीं दिलवा सकता।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Money can\'t make you love.',
        'Money can\'t get you love.',
        'Money doesn\'t get love.',
        'Money can\'t make love.',
      ],
      correctIndex: 1,
      explanation: 'प्यार = non-living thing → Get। Money can\'t get you love।',
    ),
    QuizQuestion(
      questionHi: '"क्या तुम मुझे इग्जाम में पास करवा सकते हो?" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Can you get me pass the exam?',
        'Can you make me pass the exam?',
        'Can you make me passed the exam?',
        'Can you get me passing?',
      ],
      correctIndex: 1,
      explanation: 'मैं = living → Make। Can you make me pass the exam?',
    ),
    QuizQuestion(
      questionHi: '"मैंने बाल कटवाए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I made the hair cut.',
        'I cut the hair.',
        'I got the hair cut.',
        'I have made the hair cut.',
      ],
      correctIndex: 2,
      explanation: 'बाल = non-living → Get। I got the hair cut। (cut = 3rd form)',
    ),
    QuizQuestion(
      questionHi: '"वो मुझे बेवकूफ बना रही है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'She is getting me fool.',
        'She is making me fool.',
        'She makes me fooled.',
        'She got me fool.',
      ],
      correctIndex: 1,
      explanation: 'मैं = living → Make। She is making me fool।',
    ),
    QuizQuestion(
      questionHi: '"राहुल मुझसे अपना होमवर्क करवायेगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Rahul will get his homework done by me.',
        'Rahul will make me write his homework.',
        'Both A and B are correct.',
        'Rahul gets his homework written.',
      ],
      correctIndex: 2,
      explanation: 'Both are correct! Get (non-living homework) or Make (living me) — both work here।',
    ),
    QuizQuestion(
      questionHi: '"मेरा प्यार मुझे रुला रहा है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'My love is getting me cry.',
        'My love is making me cry.',
        'My love made me cry.',
        'My love makes me crying.',
      ],
      correctIndex: 1,
      explanation: 'Cry → always Make। Present Continuous: My love is making me cry।',
    ),
  ];

  // ─── L6: Test Paper I Quiz ─────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionHi: '"I got it done myself." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैंने ये खुद किया।',
        'मैंने ये खुद करवाया।',
        'मैंने इसे करवा दिया।',
        'ये खुद हो गया।',
      ],
      correctIndex: 1,
      explanation: '"Got it done myself" = खुद करवाया। I got it done myself = मैंने ये खुद करवाया।',
    ),
    QuizQuestion(
      questionHi: '"People make you fool." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'लोग तुम्हें बेवकूफ नहीं समझते।',
        'लोग तुम्हें बेवकूफ बनाते हैं।',
        'तुम लोगों को बेवकूफ बनाते हो।',
        'लोग बेवकूफ हैं।',
      ],
      correctIndex: 1,
      explanation: 'Make + you (living) + fool। People make you fool = लोग तुम्हें बेवकूफ बनाते हैं।',
    ),
    QuizQuestion(
      questionHi: '"My circumstances made me work there." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं वहाँ काम करना चाहता था।',
        'मेरे हालातों ने मुझसे वहाँ काम करवाया।',
        'मैंने वहाँ काम किया।',
        'हालात बहुत मुश्किल थे।',
      ],
      correctIndex: 1,
      explanation: 'Circumstances = subject (living force); made me work = मुझसे काम करवाया।',
    ),
    QuizQuestion(
      questionHi: '"I made him beat Rahul." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैंने राहुल को उससे पिटवाया।',
        'मैंने उसको राहुल से पिटवाया।',
        'राहुल ने उसे पीटा।',
        'मैंने राहुल को पीटा।',
      ],
      correctIndex: 0,
      explanation: '"him" is beating Rahul → राहुल को उससे पिटवाया।',
    ),
    QuizQuestion(
      questionHi: '"I am getting the hair cut." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैंने बाल कटवाए।',
        'मैं बाल कटवा रहा हूँ।',
        'मैं बाल कटवाऊँगा।',
        'बाल कट गए।',
      ],
      correctIndex: 1,
      explanation: 'Present Continuous + Get: I am getting the hair cut = मैं बाल कटवा रहा हूँ।',
    ),
    QuizQuestion(
      questionHi: '"Life is making me go where I don\'t want to." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं जहाँ चाहता हूँ वहाँ जा रहा हूँ।',
        'ज़िन्दगी मुझे वहाँ भिजवा रही है जहाँ मैं जाना नहीं चाहता।',
        'ज़िन्दगी बहुत मुश्किल है।',
        'मैं नहीं जाना चाहता।',
      ],
      correctIndex: 1,
      explanation: 'Life is making me go = ज़िन्दगी मुझे भिजवा रही है।',
    ),
    QuizQuestion(
      questionHi: '"Nobody can make you fool." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम किसी को बेवकूफ नहीं बना सकते।',
        'तुम्हें कोई भी बेवकूफ नहीं बना सकता।',
        'कोई भी बेवकूफ नहीं है।',
        'तुम बेवकूफ नहीं हो।',
      ],
      correctIndex: 1,
      explanation: 'Nobody = no one can; make you fool = तुम्हें बेवकूफ बनाना।',
    ),
    QuizQuestion(
      questionHi: '"Seeta makes Ram cry." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'राम सीता को रुलाता है।',
        'सीता राम को रुलाती है।',
        'सीता और राम रोते हैं।',
        'राम रोता है।',
      ],
      correctIndex: 1,
      explanation: 'Seeta = subject, makes Ram (living) cry। सीता राम को रुलाती है।',
    ),
  ];

  // ─── L7: Test Paper II Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionHi: '"Child made me come." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'बच्चा आया।',
        'बच्चे ने मुझे बुलवाया।',
        'मैं बच्चे को लाया।',
        'बच्चा मेरे साथ आया।',
      ],
      correctIndex: 1,
      explanation: 'Made me come = मुझे बुलवाया (आने के लिए कहा)।',
    ),
    QuizQuestion(
      questionHi: '"I wanted to make you meet Seeta." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं सीता से मिलना चाहता था।',
        'मैं तुम्हें सीता से मिलवाना चाहता था।',
        'सीता तुमसे मिलना चाहती थी।',
        'हम सब मिले।',
      ],
      correctIndex: 1,
      explanation: 'Make you meet Seeta = तुम्हें सीता से मिलवाना।',
    ),
    QuizQuestion(
      questionHi: '"Get the food cooked." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'खाना खाओ।',
        'खाना पकाओ।',
        'खाना बनवा लो।',
        'खाना मँगवाओ।',
      ],
      correctIndex: 2,
      explanation: 'Get + food (non-living) + cooked (3rd form) = खाना बनवा लो।',
    ),
    QuizQuestion(
      questionHi: '"Don\'t make me fool." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मुझे बेवकूफ समझो।',
        'मुझे बेवकूफ मत बनाओ।',
        'मैं बेवकूफ नहीं हूँ।',
        'मुझे मत रोको।',
      ],
      correctIndex: 1,
      explanation: 'Don\'t make me fool = मुझे बेवकूफ मत बनाओ।',
    ),
    QuizQuestion(
      questionHi: '"They were making us fight each other." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'हम लड़ रहे थे।',
        'वो हमें एक दूसरे से लड़वा रहे थे।',
        'उन्होंने हमें लड़वाया।',
        'हम लड़ना नहीं चाहते थे।',
      ],
      correctIndex: 1,
      explanation: 'Were making us fight each other = हमें एक दूसरे से लड़वा रहे थे।',
    ),
    QuizQuestion(
      questionHi: '"Papa got me a watch." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'पापा ने घड़ी खरीदी।',
        'पापा ने मुझे घड़ी दिलवाई।',
        'पापा की घड़ी मेरे पास है।',
        'मैंने घड़ी ली।',
      ],
      correctIndex: 1,
      explanation: 'Got me a watch = मुझे घड़ी दिलवाई।',
    ),
    QuizQuestion(
      questionHi: '"I got my heart broken." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'मेरा दिल टूट गया।',
        'मैंने अपना दिल तुड़वा लिया।',
        'किसी ने मेरा दिल तोड़ा।',
        'मेरा दिल दुखा।',
      ],
      correctIndex: 1,
      explanation: 'Got + heart (non-living) + broken (3rd form) = मैंने अपना दिल तुड़वा लिया।',
    ),
    QuizQuestion(
      questionHi: '"Make us listen to this story once." — Hindi?',
      questionEn: 'Hindi meaning?',
      options: [
        'हम कहानी सुनेंगे।',
        'हमें ये कहानी एक बार सुनवा दो।',
        'एक बार कहानी सुनो।',
        'कहानी मत सुनाओ।',
      ],
      correctIndex: 1,
      explanation: 'Make us listen = हमें सुनवाओ। Once = एक बार।',
    ),
  ];

  // ─── L8: Chapter Final Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'Causative Verb कौन सी है?',
      questionEn: 'Which is a Causative Verb?',
      options: ['Run / Walk', 'Get / Make', 'Is / Are', 'Have / Has'],
      correctIndex: 1,
      explanation: 'English में 2 Causative Verbs हैं — Get और Make।',
    ),
    QuizQuestion(
      questionHi: '"Get" किसके साथ प्रयोग होता है?',
      questionEn: '"Get" is used with?',
      options: ['Living beings', 'Non-living things', 'Both equally', 'Verbs only'],
      correctIndex: 1,
      explanation: '"Get" = non-living things के साथ। "Make" = living beings के साथ।',
    ),
    QuizQuestion(
      questionHi: '"Get" के बाद दूसरी verb की कौन सी form?',
      questionEn: 'After "Get" + object, which verb form follows?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 2,
      explanation: 'Get + Object + V3 (3rd form/past participle)। जैसे: get the letter written।',
    ),
    QuizQuestion(
      questionHi: '"Make" के बाद दूसरी verb की कौन सी form?',
      questionEn: 'After "Make" + object, which verb form follows?',
      options: ['1st form', '2nd form', '3rd form', 'ing form'],
      correctIndex: 0,
      explanation: 'Make + Object + V1 (1st form/bare infinitive)। जैसे: make me write।',
    ),
    QuizQuestion(
      questionHi: '"राम पत्र लिखवाता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram makes the letter written.',
        'Ram gets the letter written.',
        'Ram writes the letter.',
        'Ram get the letter write.',
      ],
      correctIndex: 1,
      explanation: 'पत्र = non-living → Get + letter + written (V3)। Ram gets the letter written।',
    ),
    QuizQuestion(
      questionHi: '"राम मुझसे लिखवाता है।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Ram gets me written.',
        'Ram makes me write.',
        'Ram makes me written.',
        'Ram gets me write.',
      ],
      correctIndex: 1,
      explanation: 'मैं = living → Make + me + write (V1)। Ram makes me write।',
    ),
    QuizQuestion(
      questionHi: '"smile, laugh, cry, happy, sad, understand" — किस verb के साथ?',
      questionEn: 'Words like smile, laugh, cry, happy, sad use which causative verb?',
      options: ['Always Get', 'Always Make', 'Either Get or Make', 'Neither'],
      correctIndex: 1,
      explanation: 'ये सभी feelings/emotions हैं और इनके साथ हमेशा "Make" प्रयोग होता है।',
    ),
    QuizQuestion(
      questionHi: '"मैं तुमसे पत्र लिखवाऊँगा।" — दोनों forms सही हैं?',
      questionEn: '"I will make you write a letter" AND "I will get the letter written by you" — both correct?',
      options: [
        'केवल Make वाला सही है',
        'केवल Get वाला सही है',
        'दोनों सही हैं',
        'दोनों गलत हैं',
      ],
      correctIndex: 2,
      explanation: 'जब living (तुमसे) और non-living (पत्र) दोनों हों, तो Get और Make दोनों चलते हैं।',
    ),
    QuizQuestion(
      questionHi: '"मैं राम से तुम्हें पिटवाऊँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I will make you beat Ram.',
        'I will make Ram beat you.',
        'I will get you beaten by Ram.',
        'Both B and C',
      ],
      correctIndex: 3,
      explanation: 'पीटने का काम राम करेगा। I will make Ram beat you। OR I will get you beaten by Ram।',
    ),
    QuizQuestion(
      questionHi: '"मैंने बाल कटवाए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I cut the hair.',
        'I made the hair cut.',
        'I got the hair cut.',
        'I have made hair cut.',
      ],
      correctIndex: 2,
      explanation: 'बाल = non-living → Get। cut = 3rd form। I got the hair cut।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> normalVsCausative = [
    {'normal': 'मैंने किया।', 'causative': 'मैंने करवाया।'},
    {'normal': 'राम ने भेजा।', 'causative': 'राम ने भिजवाया।'},
    {'normal': 'बच्चा पढ़ता है।', 'causative': 'बच्चा पढ़वाता है।'},
    {'normal': 'मैंने पत्र लिखा।', 'causative': 'मैंने पत्र लिखवाया।'},
    {'normal': 'तुमने बुलाया था।', 'causative': 'तुमने बुलवाया था।'},
    {'normal': 'मैंने कार सजाई।', 'causative': 'मैंने कार सजवाई।'},
    {'normal': 'वो भेज सकता है।', 'causative': 'वो भिजवा सकता है।'},
  ];

  static const List<Map<String, String>> getExamples = [
    {'hindi': 'राम पत्र लिखवाता है।', 'english': 'Ram gets the letter written.', 'tense': 'Present Indefinite'},
    {'hindi': 'मैं पत्र लिखवाता हूँ।', 'english': 'I get the letter written.', 'tense': 'Present Indefinite'},
    {'hindi': 'राम पत्र लिखवा रहा है।', 'english': 'Ram is getting the letter written.', 'tense': 'Present Continuous'},
    {'hindi': 'राम पत्र लिखवा चुका है।', 'english': 'Ram has got the letter written.', 'tense': 'Present Perfect'},
    {'hindi': 'राम ने पत्र लिखवाया।', 'english': 'Ram got the letter written.', 'tense': 'Past Indefinite'},
    {'hindi': 'राम पत्र लिखवा रहा था।', 'english': 'Ram was getting the letter written.', 'tense': 'Past Continuous'},
    {'hindi': 'राम पत्र लिखवा चुका था।', 'english': 'Ram had got the letter written.', 'tense': 'Past Perfect'},
    {'hindi': 'राम पत्र लिखवायेगा।', 'english': 'Ram will get the letter written.', 'tense': 'Future Indefinite'},
    {'hindi': 'राम पत्र लिखवा सकता है।', 'english': 'Ram can get the letter written.', 'tense': 'Modal: Can'},
    {'hindi': 'राम को पत्र लिखवाना चाहिए।', 'english': 'Ram should get the letter written.', 'tense': 'Modal: Should'},
  ];

  static const List<Map<String, String>> makeExamples = [
    {'hindi': 'राम मुझसे लिखवाता है।', 'english': 'Ram makes me write.', 'note': 'मैं = living'},
    {'hindi': 'मैं तुमसे लिखवाता हूँ।', 'english': 'I make you write.', 'note': 'तुम = living'},
    {'hindi': 'तुम मुझे भिजवाते हो।', 'english': 'You make me go.', 'note': '2nd verb = go (not send)'},
    {'hindi': 'सीता हमसे किताब पढ़वा रही है।', 'english': 'Seeta is making us read the book.', 'note': 'Continuous'},
    {'hindi': 'तुम मुझसे पैसे खर्च करवाओगे।', 'english': 'You will make me spend the money.', 'note': 'Future'},
    {'hindi': 'मैं राम को तुमसे पिटवाऊँगा।', 'english': 'I will make you beat Ram.', 'note': 'तुम पीटोगे'},
    {'hindi': 'मैं राम से तुम्हें पिटवाऊँगा।', 'english': 'I will make Ram beat you.', 'note': 'राम पीटेगा'},
    {'hindi': 'मैं तुम्हें पिटवाऊँगा।', 'english': 'I will make you be beaten.', 'note': 'तुम पिटोगे'},
  ];

  static const List<Map<String, String>> specialMakeWords = [
    {'hindi': 'मैं तुम्हें खुश करूँगा।', 'english': 'I will make you happy.', 'word': 'happy'},
    {'hindi': 'मैं तुम्हें हँसाऊँगा।', 'english': 'I will make you smile/laugh.', 'word': 'smile/laugh'},
    {'hindi': 'मैं तुम्हें रुलाऊँगा।', 'english': 'I will make you weep/cry.', 'word': 'weep/cry'},
    {'hindi': 'मैं तुम्हें दुख दूँगा।', 'english': 'I will make you sad.', 'word': 'sad'},
    {'hindi': 'मैं तुम्हें समझाऊँगा।', 'english': 'I will make you understand.', 'word': 'understand'},
  ];

  static const List<Map<String, String>> getBothExamples = [
    {'hindi': 'मैं लिखूँगा।', 'english': 'I will write.', 'type': 'Normal'},
    {'hindi': 'मैं लिखवाऊँगा।', 'english': 'I will make write.', 'type': 'Make (no object)'},
    {'hindi': 'मैं तुमसे लिखवाऊँगा।', 'english': 'I will make you write.', 'type': 'Make (living)'},
    {'hindi': 'मैं तुमसे पत्र लिखवाऊँगा।', 'english': 'I will make you write a letter.\nI will get the letter written by you.', 'type': 'Both possible'},
    {'hindi': 'मैं पत्र लिखवाऊँगा।', 'english': 'I will get the letter written.', 'type': 'Get (non-living)'},
  ];

  // ─── Practice sentences 1–85 ──────────────────────────────────────────────
  static const List<Map<String, String>> practiceSet1 = [
    {'hindi': '1. वो मुझसे लिखवाता है।', 'english': 'He makes me write.'},
    {'hindi': '2. वो मुझे भिजवाता है।', 'english': 'He makes me go.'},
    {'hindi': '3. वो मुझे भिजवाता है जहाँ मैं जाना नहीं चाहता।', 'english': 'He makes me go where I really don\'t want to.'},
    {'hindi': '4. वो मुझसे काम करवाती है।', 'english': 'She makes me work.'},
    {'hindi': '5. वो मुझसे पत्र लिखवाती है।', 'english': 'She makes me write the letter.'},
    {'hindi': '6. वो मुझे भिजवा रही है।', 'english': 'She is making me go.'},
    {'hindi': '7. वो मुझे बेवकूफ बना रही है।', 'english': 'She is making me fool.'},
    {'hindi': '8. उसने मुझे समझाया।', 'english': 'She made me understand.'},
    {'hindi': '9. मैं तुमसे काम करवाऊँगा।', 'english': 'I will make you work.'},
    {'hindi': '10. मैं उसे भिजवा चुका होऊँगा।', 'english': 'I will have made him go.'},
    {'hindi': '11. तुम मुझे उससे लड़वा रहे हो।', 'english': 'You are making me fight with him.'},
    {'hindi': '12. तुम मुझे महसूस करवा रही हो कि तुम मुझसे प्यार नहीं करती।', 'english': 'You are making me realize that you don\'t love me, rather you love my money.'},
    {'hindi': '13. बच्चे मुझे बेवकूफ बना रहे हैं।', 'english': 'Children are making me fool.'},
    {'hindi': '14. मेरा प्यार मुझे रुला रहा है।', 'english': 'My love is making me cry.'},
    {'hindi': '15. तुम हमें हँसाते थे।', 'english': 'You used to make us laugh.'},
    {'hindi': '16. मैं तुम्हें जाने दे सकता था।', 'english': 'I could have let you go.'},
    {'hindi': '17. राम ये किसी से भी करवा सकते हैं।', 'english': 'Ram can get it done by anyone.'},
    {'hindi': '18. मैं तुम्हें खाने को कुछ दिलवा सकता हूँ।', 'english': 'I can get you something to eat.'},
    {'hindi': '19. राम मुझे पानी दिलवा सकता है।', 'english': 'Ram can get me water.'},
    {'hindi': '20. क्या तुम मुझे इग्जाम में पास करवा सकते हो?', 'english': 'Can you make me pass the exam?'},
    {'hindi': '21. मैं तुम्हें पास करवा सकता हूँ।', 'english': 'I can make you pass.'},
    {'hindi': '22. पैसा तुम्हें प्यार नहीं दिलवा सकता।', 'english': 'Money can\'t get you love.'},
    {'hindi': '23. मेरे पापा ने मुझे महसूस करवाया कि पैसा बचाना ही सब कुछ नहीं है।', 'english': 'My dad made me realize that saving money is not everything.'},
    {'hindi': '24. समय मुझे मेरी गलतियों का अहसास करवा रहा है।', 'english': 'Time is making me realize my mistakes that I made in past.'},
    {'hindi': '25. तुम हर किसी को खुश नहीं कर सकते।', 'english': 'You can\'t make everyone happy.'},
  ];

  static const List<Map<String, String>> practiceSet2 = [
    {'hindi': '26. पापा आपको कार नहीं दिलवा सकते।', 'english': 'Dad can\'t get you a car as he doesn\'t have money at all.'},
    {'hindi': '27. मैं तुमसे नहीं खरीदवा सकता।', 'english': 'I can\'t make you purchase.'},
    {'hindi': '28. क्या वो उसे हँसा सका?', 'english': 'Could he make her laugh?'},
    {'hindi': '29. उसे मुझे अहसास दिलवाना होगा कि वो सबसे अच्छा है।', 'english': 'He will have to make me realize, he is the best.'},
    {'hindi': '30. तुम्हें ये काम करवाना पड़ेगा।', 'english': 'You will have to get this work done.'},
    {'hindi': '31. वो मुझे बर्गर खिलाता है।', 'english': 'He makes me eat Burger.'},
    {'hindi': '32. वो मुझे अच्छा खाना खिलाता है।', 'english': 'He makes me eat good food.'},
    {'hindi': '33. तुम मुझे अमेरिका कब भिजवाओगे?', 'english': 'When will you make me go America?'},
    {'hindi': '34. राम हमें पानी पिलवा रहा था।', 'english': 'Ram was making us drink water.'},
    {'hindi': '35. उस बच्चे ने हर किसी को हँसाया।', 'english': 'That child made everyone laugh.'},
    {'hindi': '36. तुमने मुझे रुलाया।', 'english': 'You have made me cry.'},
    {'hindi': '37. वो हास्य कलाकार है। वो लोगों को हँसाता है।', 'english': 'He is a comedian. He makes people laugh.'},
    {'hindi': '38. मैं तुमसे गाना नहीं गवा सकता।', 'english': 'I can\'t make you sing as your voice is not fine.'},
    {'hindi': '39. राहुल मुझसे अपना होमवर्क करवायेगा।', 'english': 'Rahul will make me write his homework.'},
    {'hindi': '40. तुम उससे अपना होमवर्क क्यों करवाते हो?', 'english': 'Why do you make him write your homework?'},
    {'hindi': '41. उसने तुमसे किसे कॉल करवाई?', 'english': 'Whom did he make you call?'},
    {'hindi': '42. उसने ये पैन तुम्हें कैसे दिलवाया?', 'english': 'How did he get you this pen?'},
    {'hindi': '43. तुम्हारे प्यार ने मुझे महसूस करवाया।', 'english': 'Your love made me realize.'},
    {'hindi': '44. तुमने मुझे प्यार की कीमत समझाई।', 'english': 'You made me understand the value of love.'},
    {'hindi': '45. तुम्हारे भाषण ने मुझे प्रेरित किया।', 'english': 'Your lecture motivated me.'},
    {'hindi': '46. तुम राम को उससे नहीं पिटवा सकते।', 'english': 'You can\'t make him beat Ram.'},
    {'hindi': '47. तुम राम से उसे नहीं पिटवा सकते।', 'english': 'You can\'t make Ram beat him.'},
    {'hindi': '48. मैं तुम्हें समझा नहीं सकता।', 'english': 'I can\'t make you understand.'},
    {'hindi': '49. मैंने तुमसे बाल्टी भरवाई।', 'english': 'I made you fill the bucket.'},
    {'hindi': '50. उसने तुमसे पैसे क्यों खर्च करवाये?', 'english': 'Why did he make you spend the money?'},
  ];

  static const List<Map<String, String>> practiceSet3 = [
    {'hindi': '51. मैं क्या करवाता हूँ?', 'english': 'What do I get done?'},
    {'hindi': '52. लोग जबरदस्ती तुम्हें वहाँ भिजवाते हैं।', 'english': 'People will forcefully make you go there.'},
    {'hindi': '53. मैं केवल उससे ही किताब पढ़वाऊँगा।', 'english': 'I will make only him read the book.'},
    {'hindi': '54. राम तुमसे ये काम करवायेगा।', 'english': 'Ram will make you do this work.'},
    {'hindi': '55. मैं बाल कटवाने जा चुका था।', 'english': 'I had gone to get the hair cut.'},
    {'hindi': '56. तुमने बाल कहाँ से कटवाये?', 'english': 'From where did you get the hair cut?'},
    {'hindi': '57. मुझे ये काम करवाना है।', 'english': 'I have to get this work done.'},
    {'hindi': '58. राम मुझसे काम करवा सकता था।', 'english': 'Ram could have got the work done by me.'},
    {'hindi': '59. हम राम से गाना गवा सकते हैं।', 'english': 'We can make Ram sing the song.'},
    {'hindi': '60. वो मुझे पिटवायेगा।', 'english': 'He will make me be beaten.'},
    {'hindi': '61. मैं तुम्हें क्या समझा रहा हूँ?', 'english': 'What am I making you understand?'},
    {'hindi': '62. वो मुझसे अपने 2 बैच पढ़वा रहा है।', 'english': 'He is making me teach his 2 batches.'},
    {'hindi': '63. हमने उसे बाहर भिजवाया।', 'english': 'We made him go out.'},
    {'hindi': '64. तुम ये किससे करवाओगे?', 'english': 'From whom will you get this done?'},
    {'hindi': '65. जब कोई नहीं आया, तब पापा ने हमसे ये करवाया।', 'english': 'When nobody came, then Dad made us do it.'},
    {'hindi': '66. मैंने हर किसी को उस होटल में खाना खिलवाया।', 'english': 'I made everyone eat the food in that hotel.'},
    {'hindi': '67. तुमने मुझसे झूठ बुलवाया।', 'english': 'You made me tell a lie.'},
    {'hindi': '68. राम मुझे रोज रुलाता है।', 'english': 'Ram makes me cry every day.'},
    {'hindi': '69. तुम कब तक ये काम खत्म करवा दोगे?', 'english': 'Until when will you get this work finished?'},
    {'hindi': '70. क्या तुम मुझे डांस सिखवा सकते हो?', 'english': 'Can you make me learn dance?'},
    {'hindi': '71. हमने उसे भिजवाया पर उसने वहाँ काम नहीं किया।', 'english': 'We made him go but he didn\'t work there.'},
    {'hindi': '72. वे तुम्हें अमेरिका भिजवाएंगे बशर्ते तुम उन्हें साबित करो।', 'english': 'They will make you go America provided you prove them to be the best.'},
    {'hindi': '73. भले ही आज वो मुझसे काम करवाये पर भविष्य में मैं साबित कर दूँगा।', 'english': 'Even if he makes me work for him today, but in future I will show him what actually I am.'},
    {'hindi': '74. बॉबी ने मुझे अच्छा खाना खिलवाया।', 'english': 'Bobby made me eat the delicious food, which his mom had cooked.'},
    {'hindi': '75. तुमने मुझे कम्प्यूटर सिखवाया।', 'english': 'You made me learn computer.'},
  ];

  static const List<Map<String, String>> practiceSet4 = [
    {'hindi': '76. तुम्हारे प्यार ने मुझे तुम्हारे पास वापस बुलवाया।', 'english': 'Your love made me come back to you.'},
    {'hindi': '77. उसने हमें कोक पिलाई।', 'english': 'He made us drink coke.'},
    {'hindi': '78. राहुल ने हमें एक्सरसाइज करवाई।', 'english': 'Rahul made us exercise.'},
    {'hindi': '79. तुमने मुझे पिटवाया।', 'english': 'You made me be beaten.'},
    {'hindi': '80. तुमने उसे मुझसे पिटवाया।', 'english': 'You made me beat him.'},
    {'hindi': '81. राहुल ने उससे मुझे कुछ पैसे दिलवाये।', 'english': 'Rahul made me get some money from him.'},
    {'hindi': '82. मैंने बाल कटवाए।', 'english': 'I got the hair cut.'},
    {'hindi': '83. राहुल यहीं से बाल कटवाता है।', 'english': 'Rahul gets the hair cut from here.'},
    {'hindi': '84. क्या तुम बाल कटवाओगे?', 'english': 'Will you get the hair cut?'},
    {'hindi': '85. मैं ये काम कैसे करवा सकता हूँ?', 'english': 'How can I get this work done?'},
  ];

  // ─── Test Paper I sentences ────────────────────────────────────────────────
  static const List<Map<String, String>> testPaper1Sentences = [
    {'english': '1. I got it done myself.', 'hindi': 'मैंने ये खुद करवाया।'},
    {'english': '2. Can you make him come?', 'hindi': 'क्या तुम उसे बुलवा सकते हो?'},
    {'english': '3. Ram made him go.', 'hindi': 'राम ने उसे भिजवाया।'},
    {'english': '4. People make you fool.', 'hindi': 'लोग तुम्हें बेवकूफ बनाते हैं।'},
    {'english': '5. Pen made me remember you.', 'hindi': 'पैन ने मुझे तुम्हारी याद दिलाई।'},
    {'english': '6. They should not make you work in place of study.', 'hindi': 'उन्हें तुमसे पढ़ाई के बजाय काम नहीं करवाना चाहिए।'},
    {'english': '7. Get me something to read.', 'hindi': 'मुझे पढ़ने को कुछ दिलवा दो।'},
    {'english': '8. He got me nothing to eat.', 'hindi': 'उसने मुझे खाने को कुछ नहीं दिलवाया।'},
    {'english': '9. Rohit is making me understand.', 'hindi': 'रोहित मुझे समझा रहा है।'},
    {'english': '10. He used to make me eat the food.', 'hindi': 'वो मुझे खाना खिलवाता था।'},
    {'english': '11. By whom will you get this done?', 'hindi': 'तुम ये किससे करवाओगे?'},
    {'english': '12. Rahul got the bucket filled by me.', 'hindi': 'राहुल ने मुझसे बाल्टी भरवाई।'},
    {'english': '13. He makes only me write his homework.', 'hindi': 'वो केवल मुझसे अपना होमवर्क लिखवाता है।'},
    {'english': '14. My circumstances made me work there.', 'hindi': 'मेरे हालातों ने मुझसे वहाँ काम करवाया।'},
    {'english': '15. Your thinking got you good money.', 'hindi': 'तुम्हारी सोच ने तुम्हें अच्छा पैसा दिलवाया।'},
    {'english': '16. He makes you smile.', 'hindi': 'वो तुम्हें हँसाता है।'},
    {'english': '17. I made him join there.', 'hindi': 'मैंने उसे वहाँ जॉइन करवाया।'},
    {'english': '18. Computer was got repaired.', 'hindi': 'कम्प्यूटर ठीक करवाया गया।'},
    {'english': '19. He made me drink coke.', 'hindi': 'उसने मुझे कोक पिलाई।'},
    {'english': '20. Do you want to get this done by me?', 'hindi': 'क्या ये तुम मुझसे करवाना चाहते हो?'},
    {'english': '21. I made him beat Rahul.', 'hindi': 'मैंने राहुल को उससे पिटवाया।'},
    {'english': '22. I made Rahul beat him.', 'hindi': 'मैंने उसको राहुल से पिटवाया।'},
    {'english': '23. I am getting the hair cut.', 'hindi': 'मैं बाल कटवा रहा हूँ।'},
    {'english': '24. I couldn\'t make you feel happy.', 'hindi': 'मैं तुम्हें खुश नहीं कर पाया।'},
    {'english': '25. Seeta makes Ram cry.', 'hindi': 'सीता राम को रुलाती है।'},
    {'english': '26. He can never make me go there.', 'hindi': 'वो मुझे वहाँ कभी नहीं भिजवा सकता।'},
    {'english': '27. I got this mobile repaired by Sagar.', 'hindi': 'मैंने ये मोबाइल सागर से ठीक करवाया।'},
    {'english': '28. He was making me understand.', 'hindi': 'वो मुझे समझा रहा था।'},
    {'english': '29. Saleem made Sagar call Rahul.', 'hindi': 'सलीम ने राहुल को सागर से कॉल करवाई।'},
    {'english': '30. Saleem made Sagar come.', 'hindi': 'सलीम ने सागर को बुलवाया।'},
    {'english': '31. Why are you making us fool?', 'hindi': 'तुम हमें बेवकूफ क्यों बना रहे हो?'},
    {'english': '32. I will make him fool.', 'hindi': 'मैं उसे बेवकूफ बनाऊँगा।'},
    {'english': '33. They both make her do their homework.', 'hindi': 'वो दोनों उससे अपना होमवर्क करवाते हैं।'},
    {'english': '34. Aren\'t you getting food prepared?', 'hindi': 'क्या तुम खाना नहीं बनवा रहे?'},
    {'english': '35. Life is making me go where I don\'t want to.', 'hindi': 'ज़िन्दगी मुझे वहाँ भिजवा रही है जहाँ मैं जाना नहीं चाहता।'},
    {'english': '36. As soon as Dad came, he made us work.', 'hindi': 'जैसे ही पापा आये, उन्होंने हमसे काम करवाया।'},
    {'english': '37. Mom makes us feel comfortable.', 'hindi': 'माँ हमें आराम महसूस करवाती है।'},
    {'english': '38. His personality makes us feel that we should also work on our personality.', 'hindi': 'उसकी पर्सनैलिटी हमें महसूस करवाती है कि हमें भी अपनी पर्सनैलिटी पर काम करना चाहिए।'},
    {'english': '39. Ram made us realize how important money is.', 'hindi': 'राम ने हमें महसूस करवाया कि पैसा क्या मायने रखता है।'},
    {'english': '40. You make me realize how bad I am.', 'hindi': 'तुम मुझे अहसास दिलाते हो कि मैं कितना बुरा हूँ।'},
    {'english': '41. I am trying to make you understand.', 'hindi': 'मैं तुम्हें समझाने की कोशिश कर रहा हूँ।'},
    {'english': '42. I have to get this work done.', 'hindi': 'मुझे ये काम करवाना है।'},
    {'english': '43. From where did you get the hair cut?', 'hindi': 'तुमने बाल कहाँ से कटवाये?'},
    {'english': '44. Life will make you realize one day.', 'hindi': 'ज़िन्दगी तुम्हें एक दिन महसूस करवायेगी।'},
    {'english': '45. That boy makes me angry.', 'hindi': 'वो लड़का मुझे गुस्सा दिलाता है।'},
    {'english': '46. I was in exam. She got me answers.', 'hindi': 'मैं इग्जाम में था। उसने मुझे उत्तर दिलवाये।'},
    {'english': '47. Such incidences make us realize.', 'hindi': 'ऐसी घटनाएँ हमें महसूस करवाती हैं।'},
    {'english': '48. Nobody can make you fool.', 'hindi': 'तुम्हें कोई भी बेवकूफ नहीं बना सकता।'},
    {'english': '49. How can you make him go there?', 'hindi': 'तुम उसे वहाँ कैसे भिजवाओगे?'},
    {'english': '50. You made me tell a lie.', 'hindi': 'तुमने मुझसे झूठ बुलवाया।'},
  ];

  // ─── Test Paper II sentences ───────────────────────────────────────────────
  static const List<Map<String, String>> testPaper2Sentences = [
    {'english': '1. Child made me come.', 'hindi': 'बच्चे ने मुझे बुलवाया।'},
    {'english': '2. Rahul had got the work done.', 'hindi': 'राहुल ने काम करवाया था।'},
    {'english': '3. I wanted to make you meet Seeta.', 'hindi': 'मैं तुम्हें सीता से मिलवाना चाहता था।'},
    {'english': '4. I must get the work done by you.', 'hindi': 'मुझे तुमसे काम जरूर करवाना चाहिए।'},
    {'english': '5. You can make me do this.', 'hindi': 'तुम मुझसे ये करवा सकते हो।'},
    {'english': '6. I will make them go somewhere else.', 'hindi': 'मैं उन्हें कहीं और भिजवा दूँगा।'},
    {'english': '7. We have to get the hair cut.', 'hindi': 'हमें बाल कटवाने हैं।'},
    {'english': '8. Ram used to make me go.', 'hindi': 'राम मुझे भिजवाता था।'},
    {'english': '9. I have to get mom a saree.', 'hindi': 'मुझे मम्मी को एक साड़ी दिलवानी है।'},
    {'english': '10. Ram will get it done himself.', 'hindi': 'राम ये खुद करवायेगा।'},
    {'english': '11. Children will make you happy.', 'hindi': 'बच्चे तुम्हें खुश करेंगे।'},
    {'english': '12. Papa got me a watch.', 'hindi': 'पापा ने मुझे घड़ी दिलवाई।'},
    {'english': '13. Friend made me meet his family members.', 'hindi': 'दोस्त ने मुझे अपने घरवालों से मिलवाया।'},
    {'english': '14. I had made Rahul purchase a pen.', 'hindi': 'राहुल को मैंने एक पैन खरीदवाया था।'},
    {'english': '15. Why did he get the hair cut from there?', 'hindi': 'उसने बाल वहाँ से क्यों कटवाये?'},
    {'english': '16. I made my mom apply Mahendi onto my hair.', 'hindi': 'मैंने अपनी मम्मी से बालों में मेहंदी लगवाई।'},
    {'english': '17. He made me spend money.', 'hindi': 'उसने मुझसे पैसे खर्च करवाये।'},
    {'english': '18. You always make me cry.', 'hindi': 'तुम हमेशा मुझे रुलाते हो।'},
    {'english': '19. I can make him laugh.', 'hindi': 'मैं उसे हँसा सकता हूँ।'},
    {'english': '20. Meet him lest he should make you go America.', 'hindi': 'उससे मिलो ऐसा न हो वो तुम्हें अमेरिका भिजवा दे।'},
    {'english': '21. Get the food cooked.', 'hindi': 'खाना बनवा लो।'},
    {'english': '22. Get the poor few clothes.', 'hindi': 'गरीबों को कुछ कपड़े दिलवा दो।'},
    {'english': '23. You must get us something.', 'hindi': 'तुम्हें हमें कुछ तो दिलवाना ही चाहिए।'},
    {'english': '24. Make me meet him once.', 'hindi': 'मुझे उससे एक बार मिलवा दो।'},
    {'english': '25. Make us listen to this story once.', 'hindi': 'हमें ये कहानी एक बार सुनवा दो।'},
    {'english': '26. Make Ram come from there lest he should die.', 'hindi': 'राम को वहाँ से वापस बुलवा लो कहीं वो मर न जाए।'},
    {'english': '27. I got my heart broken.', 'hindi': 'मैंने अपना दिल तुड़वा लिया।'},
    {'english': '28. Don\'t make me fool.', 'hindi': 'मुझे बेवकूफ मत बनाओ।'},
    {'english': '29. He is making us laugh.', 'hindi': 'वो हमें हँसा रहा है।'},
    {'english': '30. They were making us fight each other.', 'hindi': 'वो हमें एक दूसरे से लड़वा रहे थे।'},
  ];
}