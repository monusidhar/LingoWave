import '../models/lesson_model.dart';

/// Chapter 4 — Vocabulary & Pronunciation Exercises (शब्दावली एवं उच्चारण अभ्यास)
class Chapter4Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 4,
        title: 'Vocabulary & Pronunciation',
        titleHindi: 'शब्दावली एवं उच्चारण अभ्यास',
        description: 'Words, Phrases, Idioms & Body Parts',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Exercise I — Basic Words',
              titleHindi: 'बुनियादी शब्द (क्रिया और संज्ञा)',
              emoji: '📝', type: LessonType.ch4Ex1, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Exercise II — Common Words',
              titleHindi: 'सामान्य शब्द और वाक्यांश',
              emoji: '📖', type: LessonType.ch4Ex2, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Exercise III — Idioms & Phrases',
              titleHindi: 'मुहावरे और वाक्यांश',
              emoji: '💬', type: LessonType.ch4Ex3, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Exercise IV — Body Parts',
              titleHindi: 'शरीर के अंग',
              emoji: '🧍', type: LessonType.ch4Ex4, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Exercise V — Advanced Words',
              titleHindi: 'उन्नत शब्दावली',
              emoji: '🎓', type: LessonType.ch4Ex5, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch4ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch4Ex1:         return ex1Questions;
      case LessonType.ch4Ex2:         return ex2Questions;
      case LessonType.ch4Ex3:         return ex3Questions;
      case LessonType.ch4Ex4:         return ex4Questions;
      case LessonType.ch4Ex5:         return ex5Questions;
      case LessonType.ch4ChapterQuiz: return chapterFinalQuestions;
      default:                        return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Exercise I
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> ex1Questions = [
    QuizQuestion(
      questionEn: '"Look" vs "Watch" — what is the difference?',
      questionHi: '"Look" और "Watch" में क्या अंतर है?',
      options: [
        'दोनों एक ही हैं',
        'Look = ध्यान से देखना, Watch = हिलती चीज़ देखना',
        'Look = हिलती चीज़, Watch = ध्यान से',
        'Look = पढ़ना, Watch = सुनना',
      ],
      correctIndex: 1,
      explanation: 'Look = ध्यान से देखना। Watch = किसी हिलती चीज़ / व्यक्ति को देखना।',
    ),
    QuizQuestion(
      questionEn: '"Deaf" means ___.',
      questionHi: '"Deaf" का मतलब ___ है।',
      options: ['गूँगा', 'अंधा', 'बहरा', 'लंगड़ा'],
      correctIndex: 2,
      explanation: '"Deaf" (डेफ) = बहरा। "Dumb" = गूँगा। "Lame" = लंगड़ा।',
    ),
    QuizQuestion(
      questionEn: '"Close" (क्लोस) vs "Close" (क्लोज़) — difference?',
      questionHi: '"Close" के दो उच्चारण अलग-अलग अर्थ देते हैं — सही जोड़ी कौन सी है?',
      options: [
        'क्लोस = बंद करना, क्लोज़ = करीबी',
        'क्लोस = करीबी, क्लोज़ = बंद करना',
        'दोनों = बंद करना',
        'दोनों = करीबी',
      ],
      correctIndex: 1,
      explanation: '"Close" (क्लोस) = खास/करीबी (adjective)। "Close" (क्लोज़) = बंद करना (verb)।',
    ),
    QuizQuestion(
      questionEn: '"Loose" vs "Lose" vs "Loss" — "Loose" means ___.',
      questionHi: '"Loose" का मतलब ___ है।',
      options: ['खोना', 'नुकसान', 'ढीला', 'हारना'],
      correctIndex: 2,
      explanation: '"Loose" (लूस) = ढीला। "Lose" (लूज़) = खोना। "Loss" (लॉस) = नुकसान।',
    ),
    QuizQuestion(
      questionEn: '"Perhaps", "Maybe" and "Probably" all mean ___.',
      questionHi: '"Perhaps", "Maybe" और "Probably" तीनों का मतलब ___ है।',
      options: ['ज़रूर', 'शायद', 'कभी नहीं', 'हमेशा'],
      correctIndex: 1,
      explanation: 'तीनों का मतलब "शायद" है। "Probably" में ज़्यादा संभावना होती है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Exercise II
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> ex2Questions = [
    QuizQuestion(
      questionEn: '"Few" vs "Some" — "Few" is used for ___.',
      questionHi: '"Few" किसके लिए प्रयोग होता है?',
      options: [
        'अगणनीय चीज़ें (Uncountable)',
        'गिनती योग्य चीज़ें (Countable)',
        'दोनों के लिए',
        'कोई नहीं',
      ],
      correctIndex: 1,
      explanation: '"Few" = गिनती योग्य चीज़ें (countable)। "Some" = गणनीय और अगणनीय दोनों।',
    ),
    QuizQuestion(
      questionEn: '"Roof" vs "Terrace" — what is the difference?',
      questionHi: '"Roof" और "Terrace" में क्या अंतर है?',
      options: [
        'दोनों एक ही हैं',
        'Roof = भवन की ऊपरी सतह, Terrace = सपाट छत',
        'Roof = सपाट छत, Terrace = ऊपरी सतह',
        'दोनों = फर्श',
      ],
      correctIndex: 1,
      explanation: '"Roof" = भवन की ऊपरी सतह। "Terrace" = सपाट (walkable) छत।',
    ),
    QuizQuestion(
      questionEn: '"Remind" means ___.',
      questionHi: '"Remind" का मतलब ___ है।',
      options: ['याद करना', 'याद दिलाना', 'भूलना', 'सोचना'],
      correctIndex: 1,
      explanation: '"Remind" = याद दिलाना। "Remember" = याद करना।',
    ),
    QuizQuestion(
      questionEn: '"Mouse" vs "Rat" — the difference is ___.',
      questionHi: '"Mouse" और "Rat" में क्या अंतर है?',
      options: [
        'Mouse = बड़ा चूहा, Rat = छोटा चूहा',
        'Mouse = छोटा चूहा, Rat = बड़ा चूहा',
        'दोनों एक ही हैं',
        'Mouse = कंप्यूटर, Rat = जानवर',
      ],
      correctIndex: 1,
      explanation: '"Mouse" = छोटा चूहा (या computer device)। "Rat" = बड़ा चूहा।',
    ),
    QuizQuestion(
      questionEn: '"Lonely" means ___.',
      questionHi: '"Lonely" का मतलब ___ है।',
      options: ['खुश अकेला', 'उदासी भरा अकेला', 'भीड़ में', 'व्यस्त'],
      correctIndex: 1,
      explanation: '"Lonely" = अकेला (उदासी भरा)। "Alone" = अकेला (neutral)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Exercise III
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> ex3Questions = [
    QuizQuestion(
      questionEn: '"Cup of tea" means ___.',
      questionHi: '"Cup of tea" का मतलब ___ है।',
      options: ['चाय का कप', 'बस की बात होना', 'पसंदीदा काम', 'मुश्किल काम'],
      correctIndex: 1,
      explanation: '"It\'s not my cup of tea" = यह मेरे बस की बात नहीं है।',
    ),
    QuizQuestion(
      questionEn: '"Pass away" means ___.',
      questionHi: '"Pass away" का मतलब ___ है।',
      options: ['गुज़र जाना (मृत्यु)', 'गुजरना (रास्ते से)', 'पास करना', 'छोड़ना'],
      correctIndex: 0,
      explanation: '"Pass away" = मृत्यु हो जाना। "Pass by" = बगल से गुज़रना।',
    ),
    QuizQuestion(
      questionEn: '"Stand by" means ___.',
      questionHi: '"Stand by" का मतलब ___ है।',
      options: ['खड़े रहना', 'साथ देना', 'रुकना', 'खड़े होना'],
      correctIndex: 1,
      explanation: '"Stand by" = साथ देना। जैसे: "I always stand by you."',
    ),
    QuizQuestion(
      questionEn: '"Bring up" means ___.',
      questionHi: '"Bring up" का मतलब ___ है।',
      options: ['ऊपर लाना', 'पालन-पोषण करना', 'उठाना', 'बड़ा करना'],
      correctIndex: 1,
      explanation: '"Bring up" = पालन-पोषण करना। जैसे: "My uncle brought me up."',
    ),
    QuizQuestion(
      questionEn: '"At large" means ___.',
      questionHi: '"At large" का मतलब ___ है।',
      options: ['बड़े आकार में', 'पकड़ से बाहर', 'बड़ा समूह', 'खुलकर'],
      correctIndex: 1,
      explanation: '"At large" = पकड़ से बाहर। जैसे: "The criminal is at large."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Exercise IV (Body Parts)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> ex4Questions = [
    QuizQuestion(
      questionEn: '"Forehead" means ___.',
      questionHi: '"Forehead" का मतलब ___ है।',
      options: ['चेहरा', 'माथा', 'ठोड़ी', 'गाल'],
      correctIndex: 1,
      explanation: '"Forehead" = माथा। "Face" = चेहरा। "Chin" = ठोड़ी। "Cheek" = गाल।',
    ),
    QuizQuestion(
      questionEn: '"Wrist" means ___.',
      questionHi: '"Wrist" का मतलब ___ है।',
      options: ['कोहनी', 'उंगली', 'कलाई', 'हथेली'],
      correctIndex: 2,
      explanation: '"Wrist" = कलाई। "Elbow" = कोहनी। "Palm" = हथेली। "Finger" = उंगली।',
    ),
    QuizQuestion(
      questionEn: '"Eyelash" means ___.',
      questionHi: '"Eyelash" का मतलब ___ है।',
      options: ['आँखें', 'भौंह', 'पलक', 'बरौनी (पलक का बाल)'],
      correctIndex: 3,
      explanation: '"Eyelash" = बरौनी (पलक का बाल)। "Eyelid" = पलक। "Eyebrow" = भौंह।',
    ),
    QuizQuestion(
      questionEn: '"Abdomen" means ___.',
      questionHi: '"Abdomen" का मतलब ___ है।',
      options: ['छाती', 'कमर', 'उदर (पेट)', 'जाँघ'],
      correctIndex: 2,
      explanation: '"Abdomen" = उदर। "Waist" = कमर। "Chest" = छाती। "Thigh" = जाँघ।',
    ),
    QuizQuestion(
      questionEn: '"Mustache" vs "Beard" — "Beard" means ___.',
      questionHi: '"Beard" का मतलब ___ है।',
      options: ['मूंछ', 'दाढ़ी', 'बाल', 'भौंह'],
      correctIndex: 1,
      explanation: '"Beard" = दाढ़ी। "Mustache" = मूंछ।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Exercise V (Advanced)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> ex5Questions = [
    QuizQuestion(
      questionEn: '"Futile" means ___.',
      questionHi: '"Futile" का मतलब ___ है।',
      options: ['उपयोगी', 'बेकार/निरर्थक', 'महत्वपूर्ण', 'सुंदर'],
      correctIndex: 1,
      explanation: '"Futile" (फ्यूटाइल) = बेकार, निरर्थक।',
    ),
    QuizQuestion(
      questionEn: '"Waist" vs "West" — both pronounced "वेस्ट" but mean ___.',
      questionHi: '"Waist" और "West" दोनों "वेस्ट" हैं पर अर्थ?',
      options: [
        'दोनों = कमर',
        'दोनों = पश्चिम',
        'Waist = कमर, West = पश्चिम',
        'Waist = पश्चिम, West = कमर',
      ],
      correctIndex: 2,
      explanation: '"Waist" = कमर। "West" = पश्चिम दिशा। Same pronunciation, different meaning!',
    ),
    QuizQuestion(
      questionEn: '"Stammer" means ___.',
      questionHi: '"Stammer" का मतलब ___ है।',
      options: ['तुतलाना', 'हकलाना', 'फुसफुसाना', 'चिल्लाना'],
      correctIndex: 1,
      explanation: '"Stammer" = हकलाना। "Lisp" = तुतलाना। "Whisper" = फुसफुसाना।',
    ),
    QuizQuestion(
      questionEn: '"Credulous" means ___.',
      questionHi: '"Credulous" का मतलब ___ है।',
      options: ['चालाक', 'भोला-भाला (विश्वास करने वाला)', 'क्रूर', 'लालची'],
      correctIndex: 1,
      explanation: '"Credulous" (क्रेड्युलस) = भोला-भाला, आसानी से विश्वास करने वाला।',
    ),
    QuizQuestion(
      questionEn: '"Mist" vs "Fog" — the difference is ___.',
      questionHi: '"Mist" और "Fog" में क्या अंतर है?',
      options: [
        'दोनों = घना कोहरा',
        'Mist = हल्का कोहरा, Fog = घना कोहरा',
        'Mist = घना, Fog = हल्का',
        'दोनों = ओले',
      ],
      correctIndex: 1,
      explanation: '"Mist" = हल्का कोहरा/कुहासा। "Fog" = घना कोहरा। "Hail" = ओले।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ (12 mixed questions)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"Deaf", "Dumb", "Lame" — "Dumb" means ___.',
      questionHi: '"Dumb" का मतलब ___ है।',
      options: ['बहरा', 'गूँगा', 'अंधा', 'लंगड़ा'],
      correctIndex: 1,
      explanation: '"Deaf" = बहरा। "Dumb" = गूँगा। "Lame" = लंगड़ा।',
    ),
    QuizQuestion(
      questionEn: '"Loose" means ___ and "Lose" means ___.',
      questionHi: '"Loose" का मतलब ___ और "Lose" का मतलब ___.',
      options: ['खोना / ढीला', 'ढीला / खोना', 'दोनों = खोना', 'दोनों = ढीला'],
      correctIndex: 1,
      explanation: '"Loose" (लूस) = ढीला। "Lose" (लूज़) = खोना। "Loss" = नुकसान।',
    ),
    QuizQuestion(
      questionEn: '"Forehead" means ___.',
      questionHi: '"Forehead" का मतलब ___ है।',
      options: ['चेहरा', 'माथा', 'ठोड़ी', 'गाल'],
      correctIndex: 1,
      explanation: '"Forehead" = माथा।',
    ),
    QuizQuestion(
      questionEn: '"Cup of tea" means ___.',
      questionHi: '"Cup of tea" का मतलब ___।',
      options: ['चाय', 'बस की बात', 'मुश्किल काम', 'आसान काम'],
      correctIndex: 1,
      explanation: '"Not my cup of tea" = मेरे बस की बात नहीं।',
    ),
    QuizQuestion(
      questionEn: '"Wrist" means ___.',
      questionHi: '"Wrist" का मतलब ___।',
      options: ['कोहनी', 'उंगली', 'कलाई', 'हथेली'],
      correctIndex: 2,
      explanation: '"Wrist" = कलाई।',
    ),
    QuizQuestion(
      questionEn: '"Pass away" means ___.',
      questionHi: '"Pass away" का मतलब ___।',
      options: ['गुज़र जाना (मृत्यु)', 'पास होना', 'गुज़रना', 'बगल से जाना'],
      correctIndex: 0,
      explanation: '"Pass away" = मृत्यु होना।',
    ),
    QuizQuestion(
      questionEn: '"Futile" means ___.',
      questionHi: '"Futile" का मतलब ___।',
      options: ['उपयोगी', 'बेकार', 'महत्वपूर्ण', 'आसान'],
      correctIndex: 1,
      explanation: '"Futile" = बेकार, निरर्थक।',
    ),
    QuizQuestion(
      questionEn: '"Mist" means ___.',
      questionHi: '"Mist" का मतलब ___।',
      options: ['घना कोहरा', 'ओले', 'हल्का कोहरा', 'बारिश'],
      correctIndex: 2,
      explanation: '"Mist" = हल्का कोहरा। "Fog" = घना कोहरा।',
    ),
    QuizQuestion(
      questionEn: '"Stand by" means ___.',
      questionHi: '"Stand by" का मतलब ___।',
      options: ['खड़े होना', 'साथ देना', 'रुकना', 'इंतज़ार करना'],
      correctIndex: 1,
      explanation: '"Stand by" = साथ देना।',
    ),
    QuizQuestion(
      questionEn: '"Stammer" means ___.',
      questionHi: '"Stammer" का मतलब ___।',
      options: ['तुतलाना', 'हकलाना', 'फुसफुसाना', 'चिल्लाना'],
      correctIndex: 1,
      explanation: '"Stammer" = हकलाना। "Lisp" = तुतलाना।',
    ),
    QuizQuestion(
      questionEn: '"Eyelash" means ___.',
      questionHi: '"Eyelash" का मतलब ___।',
      options: ['पलक', 'भौंह', 'बरौनी', 'आँखें'],
      correctIndex: 2,
      explanation: '"Eyelash" = बरौनी (पलक का बाल)।',
    ),
    QuizQuestion(
      questionEn: '"Bring up" means ___.',
      questionHi: '"Bring up" का मतलब ___।',
      options: ['ऊपर लाना', 'पालन-पोषण करना', 'उठाना', 'याद दिलाना'],
      correctIndex: 1,
      explanation: '"Bring up" = पालन-पोषण करना।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ── Exercise I — Basic Verbs & Words ──────────────────────────────────────
  static const List<Map<String, String>> ex1Verbs = [
    {'en': 'Move', 'pronunciation': 'मूव', 'hi': 'हिलना या हिलाना'},
    {'en': 'Go', 'pronunciation': 'गो', 'hi': 'जाना'},
    {'en': 'Eat', 'pronunciation': 'ईट', 'hi': 'खाना'},
    {'en': 'Walk', 'pronunciation': 'वॉक', 'hi': 'घूमना, पैदल चलना'},
    {'en': 'Drink', 'pronunciation': 'ड्रिंक', 'hi': 'पीना'},
    {'en': 'See', 'pronunciation': 'सी', 'hi': 'देखना'},
    {'en': 'Look', 'pronunciation': 'लुक', 'hi': 'देखना (ध्यान से)'},
    {'en': 'Watch', 'pronunciation': 'वॉच', 'hi': 'देखना (हिलती चीज़)'},
    {'en': 'Write', 'pronunciation': 'राइट', 'hi': 'लिखना'},
    {'en': 'Read', 'pronunciation': 'रीड', 'hi': 'पढ़ना'},
    {'en': 'Think', 'pronunciation': 'थिंक', 'hi': 'सोचना'},
    {'en': 'Speak', 'pronunciation': 'स्पीक', 'hi': 'बात करना'},
    {'en': 'Talk', 'pronunciation': 'टॉक', 'hi': 'बात करना'},
    {'en': 'Get Up', 'pronunciation': 'गेट अप', 'hi': 'उठना या जागना'},
    {'en': 'Sleep', 'pronunciation': 'स्लीप', 'hi': 'सोना'},
    {'en': 'Stand', 'pronunciation': 'स्टैंड', 'hi': 'खड़े होना'},
    {'en': 'Sit', 'pronunciation': 'सिट', 'hi': 'बैठना'},
    {'en': 'Come', 'pronunciation': 'कम', 'hi': 'आना'},
    {'en': 'Laugh', 'pronunciation': 'लाफ', 'hi': 'हँसना'},
    {'en': 'Learn', 'pronunciation': 'लर्न', 'hi': 'सीखना'},
    {'en': 'Ask', 'pronunciation': 'आस्क', 'hi': 'पूछना'},
    {'en': 'Say', 'pronunciation': 'से', 'hi': 'कहना'},
    {'en': 'Tell', 'pronunciation': 'टेल', 'hi': 'बताना'},
    {'en': 'Cheat', 'pronunciation': 'चीट', 'hi': 'धोखा देना'},
    {'en': 'Push', 'pronunciation': 'पुश', 'hi': 'धक्का देना'},
    {'en': 'Pull', 'pronunciation': 'पुल', 'hi': 'खींचना'},
    {'en': 'Play', 'pronunciation': 'प्ले', 'hi': 'खेलना'},
    {'en': 'Find', 'pronunciation': 'फाइन्ड', 'hi': 'पाना, ढूँढना'},
    {'en': 'Buy', 'pronunciation': 'बाय', 'hi': 'खरीदना'},
    {'en': 'Give', 'pronunciation': 'गिव', 'hi': 'देना'},
    {'en': 'Take', 'pronunciation': 'टेक', 'hi': 'लेना, ले जाना'},
    {'en': 'Beat', 'pronunciation': 'बीट', 'hi': 'पीटना'},
    {'en': 'Win', 'pronunciation': 'विन', 'hi': 'जीतना'},
    {'en': 'Scold', 'pronunciation': 'स्कोल्ड', 'hi': 'डाँटना'},
    {'en': 'Cut', 'pronunciation': 'कट', 'hi': 'काटना'},
    {'en': 'Bite', 'pronunciation': 'बाइट', 'hi': 'दाँत से काटना'},
    {'en': 'Open', 'pronunciation': 'ओपन', 'hi': 'खोलना'},
    {'en': 'Smile', 'pronunciation': 'स्माइल', 'hi': 'मुस्कुराना'},
    {'en': 'Stay', 'pronunciation': 'स्टे', 'hi': 'ठहरना'},
    {'en': 'Bring', 'pronunciation': 'ब्रिंग', 'hi': 'लाना'},
    {'en': 'Keep', 'pronunciation': 'कीप', 'hi': 'रखना'},
    {'en': 'Send', 'pronunciation': 'सेंड', 'hi': 'भेजना'},
    {'en': 'Miss', 'pronunciation': 'मिस', 'hi': 'याद करना / चूक जाना'},
    {'en': 'Break', 'pronunciation': 'ब्रेक', 'hi': 'तोड़ना'},
    {'en': 'Succeed', 'pronunciation': 'सक्सीड', 'hi': 'सफल होना'},
    {'en': 'Blame', 'pronunciation': 'ब्लेम', 'hi': 'दोष देना'},
    {'en': 'Threaten', 'pronunciation': 'थ्रेटन', 'hi': 'धमकी देना'},
    {'en': 'Enter', 'pronunciation': 'एंटर', 'hi': 'घुसना, प्रवेश करना'},
    {'en': 'Postpone', 'pronunciation': 'पोस्टपोन', 'hi': 'स्थगित करना'},
    {'en': 'Remind', 'pronunciation': 'रिमाइन्ड', 'hi': 'याद दिलाना'},
    {'en': 'Remember', 'pronunciation': 'रिमेम्बर', 'hi': 'याद करना'},
  ];

  static const List<Map<String, String>> ex1Nouns = [
    {'en': 'Game', 'pronunciation': 'गेम', 'hi': 'खेल'},
    {'en': 'Home', 'pronunciation': 'होम', 'hi': 'घर'},
    {'en': 'Knife', 'pronunciation': 'नाइफ', 'hi': 'चाकू'},
    {'en': 'Sword', 'pronunciation': 'सोर्ड', 'hi': 'तलवार'},
    {'en': 'Bow', 'pronunciation': 'बो', 'hi': 'धनुष'},
    {'en': 'Arrow', 'pronunciation': 'ऐरो', 'hi': 'तीर'},
    {'en': 'Spoon', 'pronunciation': 'स्पून', 'hi': 'चम्मच'},
    {'en': 'Radish', 'pronunciation': 'रैडिश', 'hi': 'मूली'},
    {'en': 'Carrot', 'pronunciation': 'कैरट', 'hi': 'गाजर'},
    {'en': 'Lion', 'pronunciation': 'लायन', 'hi': 'शेर'},
    {'en': 'Tiger', 'pronunciation': 'टाइगर', 'hi': 'बाघ'},
    {'en': 'Fox', 'pronunciation': 'फॉक्स', 'hi': 'लोमड़ी'},
    {'en': 'Mosquito', 'pronunciation': 'मस्कीटो', 'hi': 'मच्छर'},
    {'en': 'Mouse', 'pronunciation': 'माउस', 'hi': 'छोटा चूहा'},
    {'en': 'Rat', 'pronunciation': 'रैट', 'hi': 'बड़ा चूहा'},
    {'en': 'Blanket', 'pronunciation': 'ब्लैंकेट', 'hi': 'कम्बल'},
    {'en': 'Bunch', 'pronunciation': 'बंच', 'hi': 'गुच्छा'},
    {'en': 'Cage', 'pronunciation': 'केज', 'hi': 'पिंजरा'},
    {'en': 'Cave', 'pronunciation': 'केव', 'hi': 'गुफा'},
    {'en': 'Den', 'pronunciation': 'डेन', 'hi': 'मांद (जानवरों की)'},
    {'en': 'Roof', 'pronunciation': 'रूफ', 'hi': 'छत (भवन की ऊपरी सतह)'},
    {'en': 'Terrace', 'pronunciation': 'टेरेस', 'hi': 'छत (सपाट)'},
    {'en': 'Buyer', 'pronunciation': 'बायर', 'hi': 'खरीददार'},
    {'en': 'Seller', 'pronunciation': 'सेलर', 'hi': 'विक्रेता'},
  ];

  static const List<Map<String, String>> ex1Adjectives = [
    {'en': 'Deaf', 'pronunciation': 'डेफ', 'hi': 'बहरा'},
    {'en': 'Dumb', 'pronunciation': 'डम', 'hi': 'गूँगा'},
    {'en': 'Lame', 'pronunciation': 'लेम', 'hi': 'लंगड़ा'},
    {'en': 'Alive', 'pronunciation': 'अलाइव', 'hi': 'जीवित'},
    {'en': 'Brave', 'pronunciation': 'ब्रेव', 'hi': 'बहादुर'},
    {'en': 'Coward', 'pronunciation': 'कावर्ड', 'hi': 'कायर'},
    {'en': 'Tall', 'pronunciation': 'टॉल', 'hi': 'लम्बा'},
    {'en': 'Short', 'pronunciation': 'शॉर्ट', 'hi': 'छोटा'},
    {'en': 'Sour', 'pronunciation': 'सावर', 'hi': 'खट्टा'},
    {'en': 'Bitter', 'pronunciation': 'बिटर', 'hi': 'कड़वा'},
    {'en': 'Loose', 'pronunciation': 'लूस', 'hi': 'ढीला'},
    {'en': 'Lonely', 'pronunciation': 'लोन्ली', 'hi': 'अकेला (उदासी)'},
    {'en': 'Tired', 'pronunciation': 'टायर्ड', 'hi': 'थका हुआ'},
    {'en': 'Deep', 'pronunciation': 'डीप', 'hi': 'गहरा'},
    {'en': 'Gorgeous', 'pronunciation': 'गॉर्जेस', 'hi': 'बहुत सुन्दर'},
  ];

  // ── Tricky pairs from Ex I ─────────────────────────────────────────────────
  static const List<Map<String, String>> trickyPairs = [
    {'word1': 'Loose (लूस)', 'mean1': 'ढीला', 'word2': 'Lose (लूज़)', 'mean2': 'खोना', 'word3': 'Loss (लॉस)', 'mean3': 'नुकसान'},
    {'word1': 'Close (क्लोस)', 'mean1': 'करीबी/खास', 'word2': 'Close (क्लोज़)', 'mean2': 'बंद करना', 'word3': '', 'mean3': ''},
    {'word1': 'Perhaps (परहैप्स)', 'mean1': 'शायद', 'word2': 'Maybe (मेबी)', 'mean2': 'शायद', 'word3': 'Probably (प्रॉबब्ली)', 'mean3': 'शायद (प्रबल)'},
    {'word1': 'Remind (रिमाइन्ड)', 'mean1': 'याद दिलाना', 'word2': 'Remember (रिमेम्बर)', 'mean2': 'याद करना', 'word3': '', 'mean3': ''},
    {'word1': 'Mouse (माउस)', 'mean1': 'छोटा चूहा', 'word2': 'Rat (रैट)', 'mean2': 'बड़ा चूहा', 'word3': '', 'mean3': ''},
    {'word1': 'Roof (रूफ)', 'mean1': 'ऊपरी सतह', 'word2': 'Terrace (टेरेस)', 'mean2': 'सपाट छत', 'word3': '', 'mean3': ''},
    {'word1': 'Say (से)', 'mean1': 'कहना', 'word2': 'Tell (टेल)', 'mean2': 'बताना', 'word3': 'Speak (स्पीक)', 'mean3': 'बात करना'},
    {'word1': 'See (सी)', 'mean1': 'देखना (सामान्य)', 'word2': 'Look (लुक)', 'mean2': 'ध्यान से देखना', 'word3': 'Watch (वॉच)', 'mean3': 'हिलती चीज़ देखना'},
  ];

  // ── Exercise II — Common Words ─────────────────────────────────────────────
  static const List<Map<String, String>> ex2Words = [
    {'en': 'Wherever', 'hi': 'जहाँ कहीं'},
    {'en': 'When', 'hi': 'जब या कब'},
    {'en': 'Then', 'hi': 'तब'},
    {'en': 'Above', 'hi': 'ऊपर'},
    {'en': 'Below', 'hi': 'नीचे'},
    {'en': 'Few', 'hi': 'कुछ (गिनती योग्य)'},
    {'en': 'Some', 'hi': 'कुछ (गणनीय/अगणनीय)'},
    {'en': 'Able', 'hi': 'योग्य, समर्थ'},
    {'en': 'Anywhere', 'hi': 'कहीं भी'},
    {'en': 'Nowhere', 'hi': 'कहीं नहीं'},
    {'en': 'Somewhere', 'hi': 'कहीं'},
    {'en': 'In front of', 'hi': 'के सामने'},
    {'en': 'Behind', 'hi': 'पीछे'},
    {'en': 'Hang', 'hi': 'लटकाना, लटकना'},
    {'en': 'Hold', 'hi': 'पकड़ना'},
    {'en': 'Fist', 'hi': 'मुट्ठी'},
    {'en': 'Enough', 'hi': 'काफी'},
    {'en': 'Much', 'hi': 'ज्यादा'},
    {'en': 'Many', 'hi': 'कई'},
    {'en': 'Not at all', 'hi': 'बिल्कुल नहीं'},
    {'en': 'Achieve', 'hi': 'हासिल करना'},
    {'en': 'Whatever', 'hi': 'जो कुछ भी'},
    {'en': 'Whenever', 'hi': 'जब कभी'},
    {'en': 'Little', 'hi': 'थोड़ा'},
    {'en': 'Ever', 'hi': 'कभी'},
    {'en': 'Rainbow', 'hi': 'इंद्रधनुष'},
    {'en': 'Bark', 'hi': 'भौंकना'},
    {'en': 'Right now', 'hi': 'अभी'},
    {'en': 'Something', 'hi': 'कुछ'},
    {'en': 'Hair fall', 'hi': 'बाल झड़ना'},
    {'en': 'Tremble', 'hi': 'काँपना'},
    {'en': 'Escape', 'hi': 'भाग निकलना'},
    {'en': 'Extremely', 'hi': 'अत्यधिक'},
    {'en': 'Lack', 'hi': 'कमी'},
    {'en': 'Light', 'hi': 'हल्का'},
    {'en': 'All around', 'hi': 'चारों तरफ'},
    {'en': 'Absolutely', 'hi': 'बिल्कुल, पूरी तरह से'},
    {'en': 'Hence', 'hi': 'इसलिए'},
    {'en': 'Regret', 'hi': 'खेद होना'},
    {'en': 'Already', 'hi': 'पहले से ही'},
    {'en': 'Ever since', 'hi': 'जब से'},
    {'en': 'By the time', 'hi': 'जब तक'},
    {'en': 'However', 'hi': 'फिर भी'},
    {'en': 'Almost', 'hi': 'लगभग'},
    {'en': 'Childhood', 'hi': 'बचपन'},
    {'en': 'Away', 'hi': 'दूर'},
    {'en': 'Forgive', 'hi': 'माफ करना'},
    {'en': 'Incredible', 'hi': 'अविश्वसनीय'},
    {'en': 'Alternative', 'hi': 'विकल्प'},
    {'en': 'Kind', 'hi': 'दयालु / प्रकार'},
    {'en': 'Keen', 'hi': 'उत्सुक / तीक्ष्ण'},
  ];

  // ── Exercise III — Idioms & Phrasal Verbs ──────────────────────────────────
  static const List<Map<String, dynamic>> ex3Idioms = [
    {'phrase': 'At once', 'hi': 'एक साथ', 'example': 'We shouted at once.', 'exHi': 'हम एक साथ चिल्लाये।'},
    {'phrase': 'In a while', 'hi': 'थोड़ी देर में', 'example': 'I will come in a while.', 'exHi': 'मैं थोड़ी देर में आ जाऊँगा।'},
    {'phrase': 'For a while', 'hi': 'थोड़ी देर के लिए', 'example': 'Give me your mobile for a while.', 'exHi': 'थोड़ी देर के लिए मोबाइल दो।'},
    {'phrase': 'Quite often', 'hi': 'अक्सर', 'example': 'I go there quite often.', 'exHi': 'मैं अक्सर वहाँ जाता हूँ।'},
    {'phrase': 'Cup of tea', 'hi': 'बस की बात', 'example': 'It is not my cup of tea.', 'exHi': 'यह मेरे बस की बात नहीं।'},
    {'phrase': 'All the while', 'hi': 'पूरे वक्त', 'example': 'I kept studying all the while.', 'exHi': 'मैं पूरे वक्त पढ़ता रहा।'},
    {'phrase': 'Rip off', 'hi': 'लूटना', 'example': 'The seller was ripping me off.', 'exHi': 'विक्रेता मुझे लूट रहा था।'},
    {'phrase': 'At large', 'hi': 'पकड़ से बाहर', 'example': 'The criminal is at large.', 'exHi': 'अपराधी पकड़ से बाहर है।'},
    {'phrase': 'Stand by', 'hi': 'साथ देना', 'example': 'I always stand by you.', 'exHi': 'मैं हमेशा तुम्हारा साथ देता हूँ।'},
    {'phrase': 'Bring up', 'hi': 'पालन-पोषण करना', 'example': 'My uncle brought me up.', 'exHi': 'मेरे मामा ने मुझे पाला।'},
    {'phrase': 'Pass away', 'hi': 'मृत्यु होना', 'example': 'His father passed away.', 'exHi': 'उनके पिता गुजर गए।'},
    {'phrase': 'Chill out', 'hi': 'टेंशन न लेना', 'example': 'I am chilling out these days.', 'exHi': 'आजकल कोई टेंशन नहीं।'},
    {'phrase': 'Go on', 'hi': 'जारी रहना', 'example': 'What is going on?', 'exHi': 'क्या चल रहा है?'},
    {'phrase': 'Pass by', 'hi': 'बगल से गुज़रना', 'example': 'She passed by me.', 'exHi': 'वो मेरे बगल से गुज़री।'},
    {'phrase': 'Put out', 'hi': 'बुझाना', 'example': 'Put out the fire.', 'exHi': 'आग बुझा दो।'},
    {'phrase': 'Get in/on', 'hi': 'वाहन में चढ़ना', 'example': 'I got on the bus.', 'exHi': 'मैं बस में चढ़ा।'},
    {'phrase': 'Get off', 'hi': 'वाहन से उतरना', 'example': 'I got off the bus.', 'exHi': 'मैं बस से उतरा।'},
    {'phrase': 'Sigh of relief', 'hi': 'चैन की साँस', 'example': 'I sighed of relief.', 'exHi': 'मैंने चैन की साँस ली।'},
    {'phrase': 'Fond of', 'hi': 'शौकीन', 'example': 'I am fond of cars.', 'exHi': 'मैं कारों का शौकीन हूँ।'},
    {'phrase': 'Knowingly', 'hi': 'जानबूझकर', 'example': 'He hurt me knowingly.', 'exHi': 'उसने जानबूझकर दुख दिया।'},
    {'phrase': 'Unknowingly', 'hi': 'अनजाने में', 'example': 'He hurt me unknowingly.', 'exHi': 'उसने अनजाने में दुख दिया।'},
    {'phrase': 'Of no use', 'hi': 'कोई फायदा नहीं', 'example': 'This is of no use.', 'exHi': 'इसका कोई फायदा नहीं।'},
    {'phrase': 'Worthwhile', 'hi': 'फायदे का', 'example': 'Is it worthwhile going there?', 'exHi': 'क्या वहाँ जाना फायदेमंद है?'},
    {'phrase': 'At least', 'hi': 'कम से कम', 'example': 'Come at least once.', 'exHi': 'कम से कम एक बार तो आओ।'},
  ];

  // ── Exercise IV — Body Parts ───────────────────────────────────────────────
  static const List<Map<String, String>> bodyParts = [
    {'en': 'Hair', 'hi': 'बाल', 'region': 'head'},
    {'en': 'Head', 'hi': 'सिर', 'region': 'head'},
    {'en': 'Forehead', 'hi': 'माथा', 'region': 'head'},
    {'en': 'Skull', 'hi': 'खोपड़ी', 'region': 'head'},
    {'en': 'Eyebrow', 'hi': 'भौंह', 'region': 'face'},
    {'en': 'Eyelid', 'hi': 'पलक', 'region': 'face'},
    {'en': 'Eyelash', 'hi': 'बरौनी', 'region': 'face'},
    {'en': 'Eyeball', 'hi': 'नेत्र गोलक', 'region': 'face'},
    {'en': 'Eyes', 'hi': 'आँखें', 'region': 'face'},
    {'en': 'Ear', 'hi': 'कान', 'region': 'face'},
    {'en': 'Nose', 'hi': 'नाक', 'region': 'face'},
    {'en': 'Mouth', 'hi': 'मुँह', 'region': 'face'},
    {'en': 'Tooth', 'hi': 'दाँत', 'region': 'face'},
    {'en': 'Face', 'hi': 'चेहरा', 'region': 'face'},
    {'en': 'Tongue', 'hi': 'जीभ', 'region': 'face'},
    {'en': 'Lips', 'hi': 'होंठ', 'region': 'face'},
    {'en': 'Cheek', 'hi': 'गाल', 'region': 'face'},
    {'en': 'Jaw', 'hi': 'जबड़ा', 'region': 'face'},
    {'en': 'Chin', 'hi': 'ठोड़ी', 'region': 'face'},
    {'en': 'Mustache', 'hi': 'मूंछ', 'region': 'face'},
    {'en': 'Beard', 'hi': 'दाढ़ी', 'region': 'face'},
    {'en': 'Neck', 'hi': 'गर्दन', 'region': 'upper'},
    {'en': 'Throat', 'hi': 'गला', 'region': 'upper'},
    {'en': 'Shoulders', 'hi': 'कंधे', 'region': 'upper'},
    {'en': 'Arms', 'hi': 'भुजाएँ, बाँहें', 'region': 'upper'},
    {'en': 'Hand', 'hi': 'हाथ', 'region': 'upper'},
    {'en': 'Elbow', 'hi': 'कोहनी', 'region': 'upper'},
    {'en': 'Wrist', 'hi': 'कलाई', 'region': 'upper'},
    {'en': 'Palm', 'hi': 'हथेली', 'region': 'upper'},
    {'en': 'Fist', 'hi': 'मुट्ठी', 'region': 'upper'},
    {'en': 'Finger', 'hi': 'उंगली', 'region': 'upper'},
    {'en': 'Thumb', 'hi': 'अंगूठा', 'region': 'upper'},
    {'en': 'Nail', 'hi': 'नाखून', 'region': 'upper'},
    {'en': 'Chest', 'hi': 'छाती (पुरुष)', 'region': 'body'},
    {'en': 'Stomach', 'hi': 'पेट', 'region': 'body'},
    {'en': 'Abdomen', 'hi': 'उदर', 'region': 'body'},
    {'en': 'Waist', 'hi': 'कमर', 'region': 'body'},
    {'en': 'Leg', 'hi': 'पैर (कूल्हे से)', 'region': 'lower'},
    {'en': 'Thigh', 'hi': 'जाँघ', 'region': 'lower'},
  ];

  // ── Exercise V — Advanced Words ────────────────────────────────────────────
  static const List<Map<String, String>> ex5Words = [
    {'en': 'Futile', 'pronunciation': 'फ्यूटाइल', 'hi': 'बेकार, निरर्थक'},
    {'en': 'Credulous', 'pronunciation': 'क्रेड्युलस', 'hi': 'भोला-भाला'},
    {'en': 'Momentous', 'pronunciation': 'मोमेंटस', 'hi': 'बहुत महत्वपूर्ण'},
    {'en': 'Exonerate', 'pronunciation': 'इग्ज़ॉनरेट', 'hi': 'निर्दोष करार देना'},
    {'en': 'Confluence', 'pronunciation': 'कॉन्फ्लुएन्स', 'hi': 'संगम'},
    {'en': 'Conquer', 'pronunciation': 'कॉन्कर', 'hi': 'जीतना, कब्जा करना'},
    {'en': 'Consequence', 'pronunciation': 'कॉन्सिक्वेन्स', 'hi': 'परिणाम'},
    {'en': 'Retaliate', 'pronunciation': 'रिटैलिएट', 'hi': 'बदला लेना'},
    {'en': 'Proximity', 'pronunciation': 'प्रॉक्सिमिटी', 'hi': 'निकटता'},
    {'en': 'Accomplish', 'pronunciation': 'अकम्प्लिश', 'hi': 'पूरा करना'},
    {'en': 'Rapture', 'pronunciation': 'रैप्चर', 'hi': 'अत्यधिक खुशी'},
    {'en': 'Tribute', 'pronunciation': 'ट्रिब्यूट', 'hi': 'श्रद्धांजलि'},
    {'en': 'Admire', 'pronunciation': 'अड्मायर', 'hi': 'प्रशंसा करना'},
    {'en': 'Corrupt', 'pronunciation': 'करप्ट', 'hi': 'भ्रष्ट, बेईमान'},
    {'en': 'Genuine', 'pronunciation': 'जेन्युइन', 'hi': 'असली, वास्तविक'},
    {'en': 'Ridiculous', 'pronunciation': 'रिडिक्युलस', 'hi': 'हास्यास्पद'},
    {'en': 'Spendthrift', 'pronunciation': 'स्पेंडथ्रिफ्ट', 'hi': 'खर्चीला व्यक्ति'},
    {'en': 'Mist', 'pronunciation': 'मिस्ट', 'hi': 'हल्का कोहरा'},
    {'en': 'Fog', 'pronunciation': 'फॉग', 'hi': 'घना कोहरा'},
    {'en': 'Hail', 'pronunciation': 'हेल', 'hi': 'ओले'},
    {'en': 'Brutal', 'pronunciation': 'ब्रूटल', 'hi': 'निर्दयी, क्रूर'},
    {'en': 'Sneeze', 'pronunciation': 'स्नीज़', 'hi': 'छींकना'},
    {'en': 'Lisp', 'pronunciation': 'लिस्प', 'hi': 'तुतलाना'},
    {'en': 'Stammer', 'pronunciation': 'स्टैमर', 'hi': 'हकलाना'},
    {'en': 'Whisper', 'pronunciation': 'विस्पर', 'hi': 'फुसफुसाना'},
    {'en': 'Totter', 'pronunciation': 'टॉटर', 'hi': 'लड़खड़ाना'},
    {'en': 'Fumble', 'pronunciation': 'फम्बल', 'hi': 'टटोलना'},
    {'en': 'Imitate', 'pronunciation': 'इमिटेट', 'hi': 'नकल करना'},
    {'en': 'Protest', 'pronunciation': 'प्रोटेस्ट', 'hi': 'विरोध प्रदर्शन'},
    {'en': 'Destroy', 'pronunciation': 'डिस्ट्रॉय', 'hi': 'नष्ट करना'},
    {'en': 'Worship', 'pronunciation': 'वर्शिप', 'hi': 'पूजा करना'},
    {'en': 'Enhance', 'pronunciation': 'एन्हान्स', 'hi': 'बढ़ाना'},
    {'en': 'Prefer', 'pronunciation': 'प्रिफर', 'hi': 'प्राथमिकता देना'},
    {'en': 'Shy', 'pronunciation': 'शाय', 'hi': 'शर्मीला'},
    {'en': 'Shameless', 'pronunciation': 'शेमलेस', 'hi': 'बेशर्म'},
    {'en': 'Extraordinary', 'pronunciation': 'एक्स्ट्रॉर्डिनरी', 'hi': 'असाधारण'},
    {'en': 'Absolutely', 'pronunciation': 'ऐब्सलूटली', 'hi': 'बिल्कुल'},
    {'en': 'Literacy', 'pronunciation': 'लिटरेसी', 'hi': 'साक्षरता'},
    {'en': 'Poverty', 'pronunciation': 'पॉवर्टी', 'hi': 'गरीबी'},
    {'en': 'Harass', 'pronunciation': 'हरास/हरैस', 'hi': 'परेशान करना'},
    {'en': 'Melt', 'pronunciation': 'मेल्ट', 'hi': 'पिघलना'},
    {'en': 'Gasp', 'pronunciation': 'गैस्प', 'hi': 'हाँफना'},
  ];

  // ── Motivational Quotes ────────────────────────────────────────────────────
  static const List<Map<String, String>> quotes = [
    {
      'en': 'Definiteness of purpose is the starting point of all achievement.',
      'hi': 'उद्देश्य का प्रबल होना सभी उपलब्धियों की पहली सीढ़ी है।',
      'by': 'W. Clement Stone',
    },
    {
      'en': 'Fortune favors the brave.',
      'hi': 'किस्मत बहादुरों का साथ देती है।',
      'by': 'Latin Proverb',
    },
    {
      'en': 'In most cases, you will have to fight a battle more than once to win it.',
      'hi': 'अधिकांशतः किसी लड़ाई को जीतने के लिए एक से अधिक बार लड़ना होगा।',
      'by': '',
    },
  ];
}