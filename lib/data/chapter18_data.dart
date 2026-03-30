import '../models/lesson_model.dart';

/// Chapter 18 — Position Sense (स्थिति का ज्ञान)
class Chapter18Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 18,
        title: 'Position Sense',
        titleHindi: 'स्थिति का ज्ञान',
        description: 'Ahead, Behind, Beside, In front of & Directions',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Position Words',
              titleHindi: 'दिशा और स्थिति के शब्द',
              emoji: '🧭',
              type: LessonType.ch18PositionWords,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 2,
              title: 'Ahead vs In Front Of',
              titleHindi: 'आगे बनाम सामने का अंतर',
              emoji: '🔄',
              type: LessonType.ch18AheadVsFront,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 3,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास — 50 वाक्य',
              emoji: '✍️',
              type: LessonType.ch18Practice,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 4,
              title: 'Test Paper — Class Layout',
              titleHindi: 'टेस्ट पेपर — क्लास लेआउट',
              emoji: '📝',
              type: LessonType.ch18TestPaper,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 5,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch18ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 50),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch18PositionWords:  return positionWordsQuestions;
      case LessonType.ch18AheadVsFront:   return aheadVsFrontQuestions;
      case LessonType.ch18Practice:       return practiceQuizQuestions;
      case LessonType.ch18TestPaper:      return testPaperQuizQuestions;
      case LessonType.ch18ChapterQuiz:    return chapterFinalQuestions;
      default:                            return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Position Words Quiz
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> positionWordsQuestions = [
    QuizQuestion(
      questionEn: '"बगल में" in English is ___.',
      questionHi: '"बगल में" को English में क्या कहते हैं?',
      options: ['Ahead of', 'Behind', 'Next to / Beside / Adjacent', 'In front of'],
      correctIndex: 2,
      explanation: '"बगल में" = "next to" / "beside" / "adjacent" — all three mean the same.',
    ),
    QuizQuestion(
      questionEn: '"Immediate right to" means ___.',
      questionHi: '"Immediate right to" का मतलब?',
      options: ['दाँयी ओर', 'बाँयी ओर', 'बगल में दाँयी ओर', 'बगल में बाँयी ओर'],
      correctIndex: 2,
      explanation: '"Immediate right to" = "बगल में दाँयी ओर" — the person sitting directly next to you on the right side.',
    ),
    QuizQuestion(
      questionEn: '"Rashmi is sitting immediate right to Divya." — What does this mean?',
      questionHi: '"Rashmi is sitting immediate right to Divya."',
      options: [
        'Rashmi दिव्या के पीछे है।',
        'Rashmi दिव्या के बगल में दाँयी ओर है।',
        'Rashmi दिव्या के सामने है।',
        'Rashmi दिव्या के बगल में बाँयी ओर है।',
      ],
      correctIndex: 1,
      explanation: '"Immediate right to" = "बगल में दाँयी ओर" — directly to the right, not further away.',
    ),
    QuizQuestion(
      questionEn: '"पीछे" in English is ___.',
      questionHi: '"पीछे" को English में क्या कहते हैं?',
      options: ['Ahead of', 'Behind', 'Next to', 'In front of'],
      correctIndex: 1,
      explanation: '"पीछे" = "behind". "आगे" = "ahead of". "सामने" = "in front of". "बगल में" = "next to".',
    ),
    QuizQuestion(
      questionEn: '"Masood is sitting between Rashmi and Junaid." — Hindi?',
      questionHi: '"Masood is sitting between Rashmi and Junaid."',
      options: [
        'मसूद रश्मि और जुनेद के पीछे बैठा है।',
        'मसूद रश्मि और जुनेद के बीच में बैठा है।',
        'मसूद रश्मि और जुनेद के सामने बैठा है।',
        'मसूद रश्मि के बाँयी ओर बैठा है।',
      ],
      correctIndex: 1,
      explanation: '"Between" = "बीच में". "Masood is sitting between Rashmi and Junaid." = "मसूद रश्मि और जुनेद के बीच में बैठा है।"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Ahead vs In Front Of Quiz
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> aheadVsFrontQuestions = [
    QuizQuestion(
      questionEn: 'In a queue, the person with his back to you is ___.',
      questionHi: 'लाइन में, जिसकी पीठ तुम्हारी तरफ है वो तुम्हारे ___ है।',
      options: ['In front of you', 'Ahead of you', 'Behind you', 'Beside you'],
      correctIndex: 1,
      explanation:
          '"Ahead of" = जिसकी पीठ आपकी तरफ है (like in a queue). "In front of" = जो आपके सामने मुँह करके हो (face to face).',
    ),
    QuizQuestion(
      questionEn: '"Teacher is sitting in front of students." — Why "in front of"?',
      questionHi: '"Teacher is sitting in front of students." — "in front of" क्यों?',
      options: [
        'Teacher is behind students',
        'Teacher faces the students (face to face)',
        "Teacher's back is towards students",
        'Teacher is beside students',
      ],
      correctIndex: 1,
      explanation:
          '"In front of" is used when the person is facing you. Teacher faces the students → "in front of".',
    ),
    QuizQuestion(
      questionEn: '"Before" has how many meanings?',
      questionHi: '"Before" के कितने अर्थ होते हैं?',
      options: ['1', '2', '3', '4'],
      correctIndex: 1,
      explanation: '"Before" has 2 meanings: (1) पहले (time), (2) सामने (position/place).',
    ),
    QuizQuestion(
      questionEn: '"मसूद तरुण के आगे बैठा है।" — English?',
      questionHi: '"मसूद तरुण के आगे बैठा है।"',
      options: [
        'Masood is sitting in front of Tarun.',
        'Masood is sitting behind Tarun.',
        'Masood is sitting ahead of Tarun.',
        'Masood is sitting beside Tarun.',
      ],
      correctIndex: 2,
      explanation:
          '"आगे" (back facing) = "ahead of". Masood is sitting ahead of Tarun — Tarun can see Masood\'s back.',
    ),
    QuizQuestion(
      questionEn: '"मेरे घर के सामने तुम्हारा घर है।" — English?',
      questionHi: '"मेरे घर के सामने तुम्हारा घर है।"',
      options: [
        'Your house is ahead of my house.',
        'Your house is behind my house.',
        'Your house is in front of my house.',
        'Your house is beside my house.',
      ],
      correctIndex: 2,
      explanation: '"सामने" = "in front of" (facing). "Your house is in front of my house."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE QUIZ — 5 from 50-sentence exercise
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionEn: '"मेरे बगल में दाँयी ओर सीता बैठी है।" — English?',
      questionHi: '"मेरे बगल में दाँयी ओर सीता बैठी है।"',
      options: [
        'Seeta is sitting immediate left to me.',
        'Seeta is sitting immediate right to me.',
        'Seeta is sitting right to me.',
        'Seeta is sitting beside me.',
      ],
      correctIndex: 1,
      explanation: '"बगल में दाँयी ओर" = "immediate right to". "Seeta is sitting immediate right to me."',
    ),
    QuizQuestion(
      questionEn: '"दिल्ली भारत के उत्तर में है।" — English?',
      questionHi: '"दिल्ली भारत के उत्तर में है।"',
      options: [
        'Delhi is to the South of India.',
        'Delhi is to the East of India.',
        'Delhi is to the North of India.',
        'Delhi is to the West of India.',
      ],
      correctIndex: 2,
      explanation: '"उत्तर" = North. "Delhi is to the North of India."',
    ),
    QuizQuestion(
      questionEn: '"मेरे पीछे लाइन में कितने थे?" — English?',
      questionHi: '"मेरे पीछे लाइन में कितने थे?"',
      options: [
        'How many were there ahead of me in the queue?',
        'How many were there beside me in the queue?',
        'How many were there behind me in the queue?',
        'How many were there in front of me in the queue?',
      ],
      correctIndex: 2,
      explanation: '"पीछे" = "behind". "How many were there behind me in the queue?"',
    ),
    QuizQuestion(
      questionEn: '"Ram is sitting in a corner." — Hindi?',
      questionHi: '"Ram is sitting in a corner." — हिंदी में?',
      options: [
        'राम एक लाइन में बैठा है।',
        'राम एक कोने में बैठा है।',
        'राम बीच में बैठा है।',
        'राम सामने बैठा है।',
      ],
      correctIndex: 1,
      explanation: '"In a corner" = "एक कोने में". "Ram is sitting in a corner." = "राम एक कोने में बैठा है।"',
    ),
    QuizQuestion(
      questionEn: '"हमारे बीच 2 लड़कियाँ हैं।" — English?',
      questionHi: '"हमारे बीच 2 लड़कियाँ हैं।"',
      options: [
        'There are 2 girls behind us.',
        'There are 2 girls ahead of us.',
        'There are 2 girls between us.',
        'There are 2 girls beside us.',
      ],
      correctIndex: 2,
      explanation: '"बीच में" = "between". "There are 2 girls between us."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER QUIZ — 5 questions from the class-layout test
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaperQuizQuestions = [
    QuizQuestion(
      questionEn: 'Who is sitting immediate right to Kalpana? (see class layout)',
      questionHi: 'Kalpana के बगल में दाँयी ओर कौन बैठा है?',
      options: ['Abhishek', 'Ayushi', 'Nobody', 'Dimpal'],
      correctIndex: 2,
      explanation: 'Kalpana is at the extreme right of the last row — nobody is to her immediate right.',
    ),
    QuizQuestion(
      questionEn: 'Who is sitting behind Archana? (see class layout)',
      questionHi: 'Archana के पीछे कौन बैठा है?',
      options: ['Anjali', 'Kuldeep', 'Bikrant', 'Amit'],
      correctIndex: 1,
      explanation: 'Archana is in row 1, column 4. Behind her (row 2, column 4) is Kuldeep.',
    ),
    QuizQuestion(
      questionEn: 'Who are sitting at the corners? (see class layout)',
      questionHi: 'कोनों में कौन बैठा है?',
      options: [
        'Anjali, Yashi, Seema & Kalpana',
        'Anjali, Bikrant, Seema & Soni',
        'Yashi, Dimpal, Kalpana & Seema',
        'Anjali, Binita, Seema & Dimpal',
      ],
      correctIndex: 0,
      explanation: 'The 4 corner seats are: Anjali (row1 left), Yashi (row1 right), Seema (row3 left), Kalpana (row3 right).',
    ),
    QuizQuestion(
      questionEn: 'Who is sitting immediate left to Yashi?',
      questionHi: 'Yashi के बगल में बाँयी ओर कौन बैठा है?',
      options: ['Junaid', 'Masood', 'Archana', 'Aditya'],
      correctIndex: 2,
      explanation: 'Yashi is in row 1, column 5. Immediate left (column 4) is Archana.',
    ),
    QuizQuestion(
      questionEn: 'Who is sitting adjacent to Kuldeep?',
      questionHi: 'Kuldeep के बगल में कौन बैठा है?',
      options: [
        'Aman & Dimpal',
        'Amit & Dimpal',
        'Binita & Aman',
        'Archana & Dimpal',
      ],
      correctIndex: 1,
      explanation: 'Kuldeep is in row 2, column 4. Adjacent = Amit (column 3) and Dimpal (column 5).',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 10 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"बगल में" has how many English equivalents?',
      questionHi: '"बगल में" के लिए कितने English शब्द हैं?',
      options: ['1', '2', '3', '4'],
      correctIndex: 2,
      explanation: '"बगल में" = next to / beside / adjacent — 3 equivalents.',
    ),
    QuizQuestion(
      questionEn: '"Nitin is sitting immediate left to Tarun." — Hindi?',
      questionHi: '"Nitin is sitting immediate left to Tarun." — हिंदी में?',
      options: [
        'नितिन तरुण के दाँयी ओर बैठा है।',
        'नितिन तरुण के बाँयी ओर बैठा है।',
        'नितिन तरुण के बगल में बाँयी ओर बैठा है।',
        'नितिन तरुण के आगे बैठा है।',
      ],
      correctIndex: 2,
      explanation: '"Immediate left to" = "बगल में बाँयी ओर".',
    ),
    QuizQuestion(
      questionEn: '"Ahead of" is used when ___.',
      questionHi: '"Ahead of" का प्रयोग कब होता है?',
      options: [
        'The person is facing you',
        "The person's back is towards you (like in a queue)",
        'The person is beside you',
        'The person is behind you',
      ],
      correctIndex: 1,
      explanation:
          '"Ahead of" = जिसकी पीठ आपकी तरफ हो (queue/line scenario). "In front of" = जो आमने-सामने हो।',
    ),
    QuizQuestion(
      questionEn: '"Shalini is sitting left to Ram." — Hindi?',
      questionHi: '"Shalini is sitting left to Ram." — हिंदी में?',
      options: [
        'शालिनी राम के दाँयी ओर बैठी है।',
        'शालिनी राम के बाँयी ओर बैठी है।',
        'शालिनी राम के बगल में बैठी है।',
        'शालिनी राम के पीछे बैठी है।',
      ],
      correctIndex: 1,
      explanation: '"Left to" = "बाँयी ओर". "Shalini is sitting left to Ram." = "शालिनी राम के बाँयी ओर बैठी है।"',
    ),
    QuizQuestion(
      questionEn: '"केरल भारत के दक्षिण में है।" — English?',
      questionHi: '"केरल भारत के दक्षिण में है।"',
      options: [
        'Kerala is to the North of India.',
        'Kerala is to the East of India.',
        'Kerala is to the West of India.',
        'Kerala is to the South of India.',
      ],
      correctIndex: 3,
      explanation: '"दक्षिण" = South. "Kerala is to the South of India."',
    ),
    QuizQuestion(
      questionEn: '"Before" can mean ___.',
      questionHi: '"Before" के कितने अर्थ होते हैं?',
      options: [
        'Only पहले (time)',
        'Only सामने (position)',
        'Both पहले (time) and सामने (position)',
        'Neither of these',
      ],
      correctIndex: 2,
      explanation: '"Before" has 2 meanings: पहले (e.g. before Monday) and सामने (e.g. standing before the judge).',
    ),
    QuizQuestion(
      questionEn: '"Divya, Shalini, Sandeep and Mayank are sitting in extreme corners." — Hindi?',
      questionHi: '"Divya, Shalini, Sandeep and Mayank are sitting in extreme corners."',
      options: [
        'वे सब बीच में बैठे हैं।',
        'दिव्या, शालिनी, संदीप और मयंक बिल्कुल कोनों में बैठे हैं।',
        'वे सब लाइन में बैठे हैं।',
        'वे सब सामने बैठे हैं।',
      ],
      correctIndex: 1,
      explanation: '"Extreme corners" = "बिल्कुल कोनों में".',
    ),
    QuizQuestion(
      questionEn: '"You are going towards north at the moment." — Hindi?',
      questionHi: '"You are going towards north at the moment."',
      options: [
        'तुम इस वक्त दक्षिण की ओर जा रहे हो।',
        'तुम इस वक्त पश्चिम की ओर जा रहे हो।',
        'तुम इस वक्त उत्तर की ओर जा रहे हो।',
        'तुम इस वक्त पूरब की ओर जा रहे हो।',
      ],
      correctIndex: 2,
      explanation: '"North" = उत्तर. "Towards north" = उत्तर की ओर.',
    ),
    QuizQuestion(
      questionEn: '"राम के बगल में बैठा हूँ।" — Which words can replace "बगल में"?',
      questionHi: '"बगल में" की जगह कौन से शब्द आ सकते हैं?',
      options: [
        'Ahead of / Behind',
        'In front of / Before',
        'Next to / Beside / Adjacent',
        'Right to / Left to',
      ],
      correctIndex: 2,
      explanation: '"बगल में" = next to / beside / adjacent — all three are interchangeable.',
    ),
    QuizQuestion(
      questionEn: '"Teacher is sitting in front of the students." — Why NOT "ahead of"?',
      questionHi: '"Teacher is sitting in front of the students." — "ahead of" क्यों नहीं?',
      options: [
        'Because teacher is behind students',
        'Because teacher faces students (face to face), not back to them',
        'Because teacher is beside students',
        'Because "ahead of" is wrong grammar',
      ],
      correctIndex: 1,
      explanation:
          '"Ahead of" = पीठ की तरफ (back facing). Teacher faces students → "in front of" is correct, not "ahead of".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// Position vocabulary list
  static const List<Map<String, String>> positionWords = [
    {'hindi': 'बगल में',          'english': 'next to / beside / adjacent',        'pronunciation': 'नैक्स्ट टु / बिसाइड / ऐजासेन्ट', 'emoji': '↔️'},
    {'hindi': 'आगे',              'english': 'ahead of',                           'pronunciation': 'अहैड ऑफ',                         'emoji': '⬆️'},
    {'hindi': 'पीछे',             'english': 'behind',                             'pronunciation': 'बिहाइन्ड',                        'emoji': '⬇️'},
    {'hindi': 'सामने',            'english': 'in front of / before',               'pronunciation': 'इन फ्रन्ट ऑफ / बिफोर',            'emoji': '👁️'},
    {'hindi': 'दाँयी ओर',         'english': 'right to / to the right of',         'pronunciation': 'राइट टु',                         'emoji': '➡️'},
    {'hindi': 'बाँयी ओर',         'english': 'left to / to the left of',           'pronunciation': 'लैफ्ट टु',                        'emoji': '⬅️'},
    {'hindi': 'बगल में दाँयी ओर', 'english': 'immediate right to',                 'pronunciation': 'इमीडिएट राइट टु',                 'emoji': '↪️'},
    {'hindi': 'बगल में बाँयी ओर', 'english': 'immediate left to',                  'pronunciation': 'इमीडिएट लैफ्ट टु',                'emoji': '↩️'},
    {'hindi': 'बीच में',          'english': 'between',                            'pronunciation': 'बिटवीन',                          'emoji': '⬛'},
    {'hindi': 'कोने में',         'english': 'in a corner / in extreme corner',    'pronunciation': 'इन अ कॉर्नर',                     'emoji': '📐'},
  ];

  /// Direction vocabulary
  static const List<Map<String, String>> directions = [
    {'hindi': 'उत्तर',  'english': 'North', 'emoji': '🧭'},
    {'hindi': 'दक्षिण', 'english': 'South', 'emoji': '🧭'},
    {'hindi': 'पूरब',   'english': 'East',  'emoji': '🧭'},
    {'hindi': 'पश्चिम', 'english': 'West',  'emoji': '🧭'},
  ];

  /// Classroom layout for concept explanation (row 1 and row 2)
  /// Teacher faces the students
  static const List<List<String>> classLayoutLesson = [
    ['Divya', 'Rashmi', 'Masood', 'Junaid', 'Sandeep'],
    ['Shalini', 'Nitin', 'Tarun', 'Ram', 'Mayank'],
  ];

  /// Classroom layout for test paper (3 rows)
  static const List<List<String>> classLayoutTest = [
    ['Anjali', 'Bikrant', 'Aditya', 'Archana', 'Yashi'],
    ['Binita', 'Aman', 'Amit', 'Kuldeep', 'Dimpal'],
    ['Seema', 'Soni', 'Ayushi', 'Abhishek', 'Kalpana'],
  ];

  /// 10 example sentences from lesson
  static const List<Map<String, String>> lessonExamples = [
    {'hindi': 'टीचर बच्चों के सामने बैठे हैं।',               'english': 'Teacher is sitting in front of the students.'},
    {'hindi': 'रश्मि दिव्या के बगल में दाँयी ओर बैठी है।',     'english': 'Rashmi is sitting immediate right to Divya.'},
    {'hindi': 'मसूद तरुण के आगे बैठा है।',                    'english': 'Masood is sitting ahead of Tarun.'},
    {'hindi': 'राम मयंक के बगल में बैठा है।',                  'english': 'Ram is sitting adjacent/next to/beside Mayank.'},
    {'hindi': 'नितिन तरुण के बगल में बाँयी ओर बैठा है।',       'english': 'Nitin is sitting immediate left to Tarun.'},
    {'hindi': 'शालिनी राम के बाँयी ओर बैठी है।',               'english': 'Shalini is sitting left to Ram. / Shalini is sitting to the left of Ram.'},
    {'hindi': 'मयंक सन्दीप के पीछे बैठा है।',                  'english': 'Mayank is sitting behind Sandeep.'},
    {'hindi': 'राम तरुण और मयंक के बगल में बैठा है।',           'english': 'Ram is sitting beside Tarun & Mayank.'},
    {'hindi': 'मसूद रश्मि और जुनेद के बीच में बैठा है।',        'english': 'Masood is sitting between Rashmi and Junaid.'},
    {'hindi': 'दिव्या, शालिनी, संदीप और मयंक बिल्कुल कोनों में बैठे हैं।', 'english': 'Divya, Shalini, Sandeep & Mayank are sitting in extreme corners.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE EXERCISE — 50 sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'तुम मेरे दाँयी ओर हो।',                          'english': 'You are right to me.'},
    {'hindi': 'क्या राम तुम्हारे सामने था?',                     'english': 'Was Ram in front of you?'},
    {'hindi': 'मैं उसके आगे खड़ा था।',                          'english': 'I was standing ahead of him.'},
    {'hindi': 'राम के आगे कितने लोग हैं?',                      'english': 'How many people are there ahead of Ram?'},
    {'hindi': 'बच्चों के ठीक सामने अध्यापक खड़े हैं।',           'english': 'Teacher is standing just in front of the students.'},
    {'hindi': 'तुम्हारे बाँयी ओर कौन है?',                      'english': 'Who is to the left of you? / Who is left to you?'},
    {'hindi': 'मेरे बगल में दाँयी ओर सीता बैठी है।',             'english': 'Seeta is sitting immediate right to me.'},
    {'hindi': 'सीता के बगल में बाँयी ओर एक लड़का है।',           'english': 'A boy is immediate left to Seeta.'},
    {'hindi': 'मैं तुम्हारे पीछे था।',                           'english': 'I was behind you.'},
    {'hindi': 'उसके पीछे कितने लोग खड़े हैं?',                   'english': 'How many people are standing behind him?'},
    {'hindi': 'राम एक कोने में बैठा है।',                        'english': 'Ram is sitting in a corner.'},
    {'hindi': 'मेरे बाँयी ओर कोई खड़ा नहीं था।',                 'english': 'Nobody was standing to the left of me.'},
    {'hindi': 'राहुल मेरे ठीक सामने था क्या?',                   'english': 'Was Rahul exactly in front of me?'},
    {'hindi': 'मेरे घर के सामने तुम्हारा घर है।',                 'english': 'Your house is in front of my house.'},
    {'hindi': 'मेरा घर तुम्हारे घर से ठीक आगे वाला है।',          'english': 'My house is just ahead of yours.'},
    {'hindi': 'मेरा घर तुम्हारे घर से ठीक पीछे वाला है।',         'english': 'My house is just behind yours.'},
    {'hindi': 'रोहित के दाँयी ओर कितने लोग हैं?',                 'english': 'How many people are there to the right of Rohit?'},
    {'hindi': 'सीता के बाँयी ओर कितने लड़के हैं?',                'english': 'How many boys are there to the left of Seeta?'},
    {'hindi': 'मेरे दाँयी ओर कोई नहीं है।',                      'english': 'Nobody is to the right of me.'},
    {'hindi': 'क्या तुम्हारे दाँयी ओर कोई है?',                   'english': 'Is there someone to the right of you?'},
    {'hindi': 'क्या तुम्हारे बाँयी ओर कोई नहीं है?',              'english': 'Is there no one to the left of you?'},
    {'hindi': 'क्या तुम्हारे आगे कोई है?',                       'english': 'Is there someone ahead of you?'},
    {'hindi': 'क्या तुम्हारे पीछे कोई नहीं है?',                  'english': 'Is there no one behind you?'},
    {'hindi': 'क्या तुम्हारे सामने कोई है?',                      'english': 'Is there someone in front of you?'},
    {'hindi': 'क्या तुम्हारे बगल में कोई है?',                    'english': 'Is there someone next to you?'},
    {'hindi': 'हम बाँयी ओर खड़े थे।',                            'english': 'We were standing on the left.'},
    {'hindi': 'हम दाँयी ओर खड़े थे।',                            'english': 'We were standing on the right.'},
    {'hindi': 'सीता क्लास में अकेली थी।',                         'english': 'Seeta was alone in the class.'},
    {'hindi': 'राम वहाँ पर नहीं था।',                            'english': "Ram wasn't there."},
    {'hindi': 'दिल्ली भारत के उत्तर में है।',                     'english': 'Delhi is to the North of India.'},
    {'hindi': 'केरल भारत के दक्षिण में है।',                      'english': 'Kerala is to the South of India.'},
    {'hindi': 'बंगाल भारत के पूरब में है।',                       'english': 'Bengal is to the East of India.'},
    {'hindi': 'उसके सामने कौन था?',                               'english': 'Who was in front of him/her?'},
    {'hindi': 'मेरे आगे लाइन में तीन लोग खड़े थे।',               'english': 'There were three people standing ahead of me in the queue.'},
    {'hindi': 'राम के आगे 2 आदमी थे।',                           'english': 'There were 2 men ahead of Ram.'},
    {'hindi': 'मेरे पीछे लाइन में कितने थे?',                     'english': 'How many were there behind me in the queue?'},
    {'hindi': 'मेरे जूते कमरे के एक कोने में पड़े थे।',            'english': 'My shoes were lying in a corner of the room.'},
    {'hindi': 'तुम्हारे जूते के सामने वाले जूते मेरे हैं।',        'english': 'The shoes in front of your shoes are mine.'},
    {'hindi': 'वो तुम्हारे किस तरफ है?',                          'english': 'In which direction from you is he?'},
    {'hindi': 'वो मेरे दाँयी ओर है।',                             'english': 'He is to the right of me.'},
    {'hindi': 'दाँयी ओर तो ठीक है पर वो क्या बगल में है?',        'english': 'Right side is fine but is he adjacent?'},
    {'hindi': 'हमारे बीच 2 लड़कियाँ हैं।',                        'english': 'There are 2 girls between us.'},
    {'hindi': 'सीता और गीता के बीच कितने हैं?',                   'english': 'How many are there between Seeta & Geeta?'},
    {'hindi': 'रोहन के बगल में कौन है?',                          'english': 'Who is beside Rohan?'},
    {'hindi': 'सीता के बगल में कोई नहीं है।',                      'english': 'Nobody is beside Seeta.'},
    {'hindi': 'राम आगे है और मैं पीछे।',                          'english': 'Ram is ahead of me. / I am behind Ram.'},
    {'hindi': 'तुम दाँयी ओर थे।',                                 'english': 'You were on the right.'},
    {'hindi': 'तुम्हारे पीछे कौन है? कोई नहीं।',                   'english': 'Who is behind you? No one.'},
    {'hindi': 'मैं किस दिशा में हूँ?',                            'english': 'In which direction am I?'},
    {'hindi': 'तुम इस वक्त उत्तर की ओर जा रहे हो।',               'english': 'You are going towards north at the moment.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER — Q1–20 with answers
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaperQA = [
    {'q': 'Who is sitting next to Ayushi?',              'a': 'Soni and Abhishek.'},
    {'q': 'Who is sitting next to Seema?',               'a': 'Soni.'},
    {'q': 'Who is sitting immediate right to Kalpana?',  'a': 'Nobody.'},
    {'q': 'Who is sitting adjacent Kuldeep?',            'a': 'Amit and Dimpal.'},
    {'q': 'Where is Pooja Madam standing?',              'a': 'In front of students.'},
    {'q': 'How many people are sitting right to Bikrant?','a': 'Aditya, Archana and Yashi.'},
    {'q': 'Who is sitting behind Archana?',              'a': 'Kuldeep.'},
    {'q': 'Who is sitting right to Binita?',             'a': 'Aman, Amit, Kuldeep and Dimpal.'},
    {'q': 'Who is sitting immediate left to Yashi?',     'a': 'Archana.'},
    {'q': 'Who is sitting beside Aman?',                 'a': 'Binita and Amit.'},
    {'q': 'Who are sitting at corners?',                 'a': 'Anjali, Yashi, Seema & Kalpana.'},
    {'q': 'Who are sitting at the extreme right?',       'a': 'Yashi, Dimpal and Kalpana.'},
    {'q': 'Who are sitting at the extreme left?',        'a': 'Anjali, Binita and Seema.'},
    {'q': 'Where is Anjali sitting?',                    'a': '1st row extreme left corner.'},
    {'q': 'Who is sitting right to Dimpal?',             'a': 'Nobody.'},
    {'q': 'Who is sitting immediate left to Abhishek?',  'a': 'Ayushi.'},
    {'q': 'Who is sitting left to Soni?',                'a': 'Seema.'},
    {'q': 'Who are sitting in row number 2?',            'a': 'Binita, Aman, Amit, Kuldeep & Dimpal.'},
    {'q': 'Who are sitting in column number 4?',         'a': 'Archana, Kuldeep & Abhishek.'},
    {'q': 'Who are sitting in column number 1?',         'a': 'Anjali, Binita and Seema.'},
  ];

  /// Motivational quotes
  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'Success does not consist in never making mistakes but in never making the same one a second time.',
      'hindi': 'सफलता इस बात में नहीं है कि कभी गलती न करो, बल्कि इसमें है कि एक ही गलती दोबारा न करो।',
      'author': '',
    },
    {
      'english': 'Times wait for none.',
      'hindi': 'समय किसी का इंतज़ार नहीं करता।',
      'author': '',
    },
    {
      'english': 'To succeed in your mission, you must have single-minded devotion to your goal.',
      'hindi': 'अपने मिशन में सफल होने के लिए, आपको अपने लक्ष्य के प्रति एकनिष्ठ समर्पण होना चाहिए।',
      'author': '',
    },
    {
      'english': 'Be nice to people on your way up, because you meet them on your way down.',
      'hindi': 'उपलब्धियों की तरफ बढ़ते हुए जो भी मिले उसे इज्जत दो क्योंकि अगर कभी नीचे आना पड़ा तो आप उन्हीं से मिलोगे।',
      'author': '',
    },
  ];
}