import '../models/lesson_model.dart';

class Chapter44Data {
  static ChapterModel get chapter => ChapterModel(
        id: 44,
        title: 'Written Interviews',
        titleHindi: 'इंटरव्यू की तैयारी',
        description: 'Real interview samples — call center & BPO',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Interview Tips & Intro',
              titleHindi: 'इंटरव्यू टिप्स',
              emoji: '💼',
              type: LessonType.ch44Tips,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Interview I & II — Rahul & Aditya',
              titleHindi: 'इंटरव्यू I और II',
              emoji: '🎙️',
              type: LessonType.ch44Interview1,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Interview III & IV — Pooja & Renu',
              titleHindi: 'इंटरव्यू III और IV',
              emoji: '🎙️',
              type: LessonType.ch44Interview2,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Interview V & VI — Priya & Pankaj',
              titleHindi: 'इंटरव्यू V और VI',
              emoji: '🎙️',
              type: LessonType.ch44Interview3,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'Interview VII & VIII — Puneet & Arun',
              titleHindi: 'इंटरव्यू VII और VIII',
              emoji: '🎙️',
              type: LessonType.ch44Interview4,
              totalXP: 20),
          LessonModel(
              id: 6,
              title: 'Interview IX & X — Arpit & Saleem',
              titleHindi: 'इंटरव्यू IX और X',
              emoji: '🎙️',
              type: LessonType.ch44Interview5,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 7,
              title: 'Interview XI & XII — Telephonic',
              titleHindi: 'टेलीफोनिक इंटरव्यू',
              emoji: '📞',
              type: LessonType.ch44Interview6,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 8,
              title: 'Key Phrases & Smart Answers',
              titleHindi: 'ज़रूरी वाक्यांश',
              emoji: '✨',
              type: LessonType.ch44Phrases,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 9,
              title: 'Mock Interview Practice',
              titleHindi: 'मॉक इंटरव्यू',
              emoji: '🎭',
              type: LessonType.ch44Mock,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 10,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch44ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch44Tips:
        return tipsQuestions;
      case LessonType.ch44Interview1:
        return interview1Questions;
      case LessonType.ch44Interview2:
        return interview2Questions;
      case LessonType.ch44Interview3:
        return interview3Questions;
      case LessonType.ch44Interview4:
        return interview4Questions;
      case LessonType.ch44Interview5:
        return interview5Questions;
      case LessonType.ch44Interview6:
        return interview6Questions;
      case LessonType.ch44Phrases:
        return phrasesQuestions;
      case LessonType.ch44Mock:
        return mockQuizQuestions;
      case LessonType.ch44ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return tipsQuestions;
    }
  }

  // ─── L1: Tips ─────────────────────────────────────────────────────────────
  static const List<QuizQuestion> tipsQuestions = [
    QuizQuestion(
      questionHi: 'इंटरव्यू में अगर कुछ नहीं पता हो तो क्या करें?',
      questionEn: 'What should you do if you don\'t know something in an interview?',
      options: [
        'चुप रहें',
        'बहाना बनाएं',
        'बेझिझक "नहीं जानता" कहें',
        'विषय बदल दें'
      ],
      correctIndex: 2,
      explanation: 'Accepting ignorance honestly is better than pretending. Never hesitate to say "I don\'t know."',
    ),
    QuizQuestion(
      questionHi: 'इंटरव्यू में कमज़ोरी बताते समय क्या करना चाहिए?',
      questionEn: 'When stating your weakness in an interview, you should:',
      options: [
        'कमज़ोरी छुपाएं',
        'कमज़ोरी के साथ उसे सुधारने के प्रयास भी बताएं',
        'कोई कमज़ोरी नहीं है कहें',
        'विषय बदल दें'
      ],
      correctIndex: 1,
      explanation: 'Always mention your efforts to overcome your weakness. It shows self-awareness.',
    ),
    QuizQuestion(
      questionHi: '"May I come in?" का सही प्रयोग कब होता है?',
      questionEn: 'When is "May I come in?" correctly used?',
      options: [
        'कमरे से बाहर जाते समय',
        'किसी के कमरे में प्रवेश माँगते समय',
        'बैठने की अनुमति माँगते समय',
        'फोन उठाते समय'
      ],
      correctIndex: 1,
      explanation: '"May I come in?" is used to seek permission to enter a room.',
    ),
    QuizQuestion(
      questionHi: '"How are you doing?" का सही जवाब?',
      questionEn: 'Correct reply to "How are you doing?"',
      options: [
        'I am doing nothing.',
        'I am fine.',
        'I am doing well.',
        'Both B & C'
      ],
      correctIndex: 3,
      explanation: '"I am fine" or "I am doing well" — both are correct. "I am doing nothing" is wrong.',
    ),
    QuizQuestion(
      questionHi: 'Resume देते समय क्या कहना चाहिए?',
      questionEn: 'What should you say while handing over your resume?',
      options: [
        'Take this.',
        'Here it is.',
        'This is yours.',
        'Give me a minute.'
      ],
      correctIndex: 1,
      explanation: '"Here it is." is polite and professional. "Take this" sounds rude.',
    ),
  ];

  // ─── L2: Interview I & II ──────────────────────────────────────────────────
  static const List<QuizQuestion> interview1Questions = [
    QuizQuestion(
      questionHi: 'Rahul ने BPO industry के बारे में क्या कहा?',
      questionEn: 'What did Rahul say about the BPO industry?',
      options: [
        'It is a dying industry.',
        'It is a booming industry with good opportunities.',
        'It has no growth.',
        'It is only for graduates.'
      ],
      correctIndex: 1,
      explanation: 'Rahul said BPO is a booming industry where 75% of IT revenue comes from.',
    ),
    QuizQuestion(
      questionHi: 'BPO का full form क्या है?',
      questionEn: 'What does BPO stand for?',
      options: [
        'Business Process Organization',
        'Business Professional Outsourcing',
        'Business Process Outsourcing',
        'Basic Process Outsourcing'
      ],
      correctIndex: 2,
      explanation: 'BPO = Business Process Outsourcing.',
    ),
    QuizQuestion(
      questionHi: 'Aditya ने किस biography को favorite बताया?',
      questionEn: 'Which biography did Aditya mention as his all-time favorite?',
      options: [
        'Wings of Fire',
        'A Beautiful Mind',
        'My Experiments with Truth',
        'Steve Jobs'
      ],
      correctIndex: 1,
      explanation: '"A Beautiful Mind" — based on mathematician John Nash.',
    ),
    QuizQuestion(
      questionHi: 'John Nash को Nobel किस क्षेत्र में मिला?',
      questionEn: 'John Nash received Nobel Prize for contribution in which field?',
      options: ['Physics', 'Medicine', 'Economics', 'Mathematics'],
      correctIndex: 2,
      explanation: 'John Nash received the Nobel Prize for his contribution in Economics.',
    ),
    QuizQuestion(
      questionHi: 'Team Leader में क्या qualities होनी चाहिए? (Aditya के अनुसार)',
      questionEn: 'What quality must a Team Leader have? (as per Aditya)',
      options: [
        'Should never listen to team members',
        'Should be partial',
        'Should welcome ideas from team members',
        'Should avoid feedback'
      ],
      correctIndex: 2,
      explanation: 'Aditya said a TL must welcome ideas from team members as an insightful idea can come from anyone.',
    ),
  ];

  // ─── L3: Interview III & IV ────────────────────────────────────────────────
  static const List<QuizQuestion> interview2Questions = [
    QuizQuestion(
      questionHi: 'Pooja ने Dehradun के बारे में क्या कहा?',
      questionEn: 'What did Pooja say about Dehradun?',
      options: [
        'It is a polluted city.',
        'It is a beautiful, green & clean city known for quality education.',
        'It has no facilities.',
        'It is the capital of Himachal Pradesh.'
      ],
      correctIndex: 1,
      explanation: 'Pooja described Dehradun as beautiful, green, clean and known for quality education.',
    ),
    QuizQuestion(
      questionHi: 'Pooja के पिताजी ने कहाँ काम किया?',
      questionEn: 'Where did Pooja\'s father work?',
      options: [
        'Government school',
        'Private Bank as Manager',
        'Army',
        'University'
      ],
      correctIndex: 1,
      explanation: 'Pooja\'s father worked in a Private Bank as a Manager.',
    ),
    QuizQuestion(
      questionHi: '"3 months without salary" पर Sarita का जवाब कैसा था?',
      questionEn: 'How did Sarita respond to working 3 months without salary?',
      options: [
        'Flatly refused',
        'Said it was fine without thinking',
        'Honestly said it would be difficult but would manage per company policy',
        'Walked out of interview'
      ],
      correctIndex: 2,
      explanation: 'Sarita gave an honest, balanced answer — difficult personally but will manage if it\'s company policy.',
    ),
    QuizQuestion(
      questionHi: 'Renu ने MBA को call center के लिए कैसे justify किया?',
      questionEn: 'How did Renu justify her MBA for a call center job?',
      options: [
        'MBA has nothing to do with call centers',
        'MBA teaches communication & convincing skills useful in customer service',
        'MBA guarantees promotion',
        'She said it was irrelevant'
      ],
      correctIndex: 1,
      explanation: 'Renu said MBA teaches communication and convincing skills which benefit customer service.',
    ),
    QuizQuestion(
      questionHi: 'Renu की salary expectation क्या थी?',
      questionEn: 'What were Renu\'s salary expectations?',
      options: [
        'Very high — she demanded specific amount',
        'As per company norms since she is a fresher',
        'She refused to discuss salary',
        'Double of market rate'
      ],
      correctIndex: 1,
      explanation: 'As a fresher, Renu said she was open to whatever the company norms are.',
    ),
  ];

  // ─── L4: Interview V & VI ─────────────────────────────────────────────────
  static const List<QuizQuestion> interview3Questions = [
    QuizQuestion(
      questionHi: 'Priya ने Delhi के बारे में क्या कहा?',
      questionEn: 'What did Priya say about Delhi?',
      options: [
        'She hates Delhi completely.',
        'Delhi is beautiful with monuments but has high pollution.',
        'Delhi has no monuments.',
        'Delhi is the cleanest city.'
      ],
      correctIndex: 1,
      explanation: 'Priya said Delhi is beautiful with monuments like Qutub Minar and Lal Qila but has pollution issues.',
    ),
    QuizQuestion(
      questionHi: '2-year bond के बारे में Priya का जवाब?',
      questionEn: 'Priya\'s response to signing a 2-year bond?',
      options: [
        'Refused directly',
        'Said she had no issues',
        'Asked for more salary',
        'Asked to think about it'
      ],
      correctIndex: 1,
      explanation: 'Priya confidently said she had no issues signing the bond.',
    ),
    QuizQuestion(
      questionHi: 'Pankaj ने "how are you doing" का गलत जवाब क्या दिया?',
      questionEn: 'What wrong answer did Pankaj give to "How are you doing?"',
      options: [
        'I am fine.',
        'I am doing well.',
        'I am doing nothing.',
        'I am good.'
      ],
      correctIndex: 2,
      explanation: '"I am doing nothing" is incorrect. "How are you doing" means "How are you" — answer should be "I am fine/doing well."',
    ),
    QuizQuestion(
      questionHi: 'Pankaj को interviewer ने क्या सुधारने को कहा?',
      questionEn: 'What did the interviewer ask Pankaj to improve?',
      options: [
        'Grammar',
        'Vocabulary',
        'Pronunciation',
        'Attitude'
      ],
      correctIndex: 2,
      explanation: 'The interviewer said Pankaj\'s grammar was good but pronunciation needed improvement.',
    ),
    QuizQuestion(
      questionHi: 'Priya ने teaching छोड़ BPO क्यों join किया?',
      questionEn: 'Why did Priya choose BPO over teaching?',
      options: [
        'Teaching pays less',
        'She couldn\'t get through teaching job selection',
        'She hates teaching',
        'Her parents forced her'
      ],
      correctIndex: 1,
      explanation: 'Priya applied for teaching but couldn\'t get through, so she tried BPO.',
    ),
  ];

  // ─── L5: Interview VII & VIII ──────────────────────────────────────────────
  static const List<QuizQuestion> interview4Questions = [
    QuizQuestion(
      questionHi: 'Puneet ने Spectrastics क्यों छोड़ा?',
      questionEn: 'Why did Puneet leave Spectrastics?',
      options: [
        'Bad salary',
        'Family relocated from South Delhi to Noida — long commute, no cabs',
        'Company shut down',
        'Personal reasons'
      ],
      correctIndex: 1,
      explanation: 'Puneet\'s family relocated to Noida and the company didn\'t provide cabs there.',
    ),
    QuizQuestion(
      questionHi: 'Customer service में communication की क्या भूमिका है? (Puneet के अनुसार)',
      questionEn: 'Role of communication in customer service? (per Puneet)',
      options: [
        'Not important',
        'Only for managers',
        'Vital — helps handle irate customers politely and confidently',
        'Only for outbound calls'
      ],
      correctIndex: 2,
      explanation: 'Puneet said communication plays a vital role — especially in handling irate customers.',
    ),
    QuizQuestion(
      questionHi: 'Arun ने call center shift के बारे में क्या कहा?',
      questionEn: 'What did Arun say about rotational shifts?',
      options: [
        'He refused rotational shifts',
        'He said it is a big problem',
        'He said one must sacrifice something to achieve something better, he is comfortable',
        'He ignored the question'
      ],
      correctIndex: 2,
      explanation: 'Arun said every job has pros and cons, and one must sacrifice something to achieve something better.',
    ),
    QuizQuestion(
      questionHi: 'Ashoka के पिता का नाम? (Arun ने क्या कहा)',
      questionEn: 'Name of Ashoka\'s father? (what did Arun say)',
      options: [
        'He was confident it was Chandragupta',
        'He said Bindusar (not 100% sure)',
        'He said Samudragupta',
        'He refused to answer'
      ],
      correctIndex: 1,
      explanation: 'Arun said "I think it was Bindusar" — honestly admitting uncertainty. (Correct answer is Bindusara.)',
    ),
    QuizQuestion(
      questionHi: 'Arun ने cab न मिलने पर क्या solution दिया?',
      questionEn: 'What solution did Arun give when told cabs aren\'t provided to East Delhi?',
      options: [
        'He said he would buy a bike',
        'He offered to relocate and share his friend\'s room in South Delhi',
        'He asked for special allowance',
        'He ended the interview'
      ],
      correctIndex: 1,
      explanation: 'Arun proactively offered to relocate to South Delhi and share his friend\'s room.',
    ),
  ];

  // ─── L6: Interview IX & X ─────────────────────────────────────────────────
  static const List<QuizQuestion> interview5Questions = [
    QuizQuestion(
      questionHi: 'Arpit को interviewer ने क्या सिखाया?',
      questionEn: 'What important lesson did the interviewer teach Arpit?',
      options: [
        'Always lie in interviews',
        'If not sure about something, never raise that topic in an interview',
        'Always talk about cricket',
        'Don\'t answer any questions'
      ],
      correctIndex: 1,
      explanation: 'The interviewer advised: if you\'re not sure about something, don\'t raise that topic yourself.',
    ),
    QuizQuestion(
      questionHi: 'Cricket pitch की लंबाई कितनी होती है?',
      questionEn: 'How long is a cricket pitch?',
      options: ['18 yards', '20 yards', '22 yards', '25 yards'],
      correctIndex: 2,
      explanation: 'A cricket pitch is 22 yards long — Arpit answered this correctly.',
    ),
    QuizQuestion(
      questionHi: 'Saleem की strength क्या थी?',
      questionEn: 'What was Saleem\'s stated strength?',
      options: [
        'Computer skills',
        'Dedication towards responsibilities',
        'Communication skills',
        'Leadership'
      ],
      correctIndex: 1,
      explanation: 'Saleem said his strength was his dedication towards responsibilities.',
    ),
    QuizQuestion(
      questionHi: 'Saleem की weakness क्या थी और उसने क्या किया?',
      questionEn: 'What was Saleem\'s weakness and what was he doing about it?',
      options: [
        'Poor communication — he was practicing speaking',
        'Poor computer skills — he joined computer coaching',
        'Poor time management — he was using a planner',
        'Poor English — he was reading books'
      ],
      correctIndex: 1,
      explanation: 'Saleem\'s weakness was poor computer skills and he had joined computer coaching to overcome it.',
    ),
    QuizQuestion(
      questionHi: '"Castles in the air" का अर्थ?',
      questionEn: 'Meaning of "castles in the air"?',
      options: [
        'Real achievements',
        'Beautiful buildings',
        'Unrealistic dreams / empty words',
        'Hard work'
      ],
      correctIndex: 2,
      explanation: '"Castles in the air" means unrealistic dreams or empty words without action.',
    ),
  ];

  // ─── L7: Interview XI & XII ────────────────────────────────────────────────
  static const List<QuizQuestion> interview6Questions = [
    QuizQuestion(
      questionHi: 'Telephonic interview में सबसे पहले क्या पूछना चाहिए?',
      questionEn: 'What should you first confirm in a telephonic interview?',
      options: [
        'Salary details',
        'Whether it\'s a convenient time to talk',
        'Company location',
        'Job role'
      ],
      correctIndex: 1,
      explanation: 'Priya\'s interviewer first asked "Is it a convenient time to talk?" — always confirm this.',
    ),
    QuizQuestion(
      questionHi: 'Priya (Interview XI) ने company के बारे में क्या कहा?',
      questionEn: 'What did Priya say about the company in Interview XI?',
      options: [
        'She knew everything about the company',
        'She honestly said she didn\'t have much idea but heard they deal in UK outbound',
        'She refused to answer',
        'She made up details'
      ],
      correctIndex: 1,
      explanation: 'Priya honestly admitted limited knowledge — "to be honest, I don\'t have much idea." Honesty is valued.',
    ),
    QuizQuestion(
      questionHi: 'Sarita की favorite movie कौन सी थी?',
      questionEn: 'What was Sarita\'s favorite movie?',
      options: ['Dilwale', 'Titanic', '3 Idiots', 'Lagaan'],
      correctIndex: 1,
      explanation: 'Sarita\'s favorite movie was Titanic. She narrated the story very well.',
    ),
    QuizQuestion(
      questionHi: 'Call center में inbound process क्या होता है?',
      questionEn: 'What is an inbound process in a call center?',
      options: [
        'Making calls to customers',
        'Receiving calls from customers to resolve their queries',
        'Sending emails to customers',
        'Training new employees'
      ],
      correctIndex: 1,
      explanation: 'In inbound, we receive calls from customers to resolve queries.',
    ),
    QuizQuestion(
      questionHi: 'Outbound process में calls क्यों की जाती हैं?',
      questionEn: 'Why are calls made in an outbound process?',
      options: [
        'Only for complaints',
        'For selling products or conducting surveys',
        'Only for salary discussion',
        'For training purposes'
      ],
      correctIndex: 1,
      explanation: 'In outbound, calls are made for selling products or for survey purposes.',
    ),
  ];

  // ─── L8: Key Phrases ──────────────────────────────────────────────────────
  static const List<QuizQuestion> phrasesQuestions = [
    QuizQuestion(
      questionHi: '"Tell me about yourself" में क्या शामिल करना चाहिए?',
      questionEn: 'What should "Tell me about yourself" include?',
      options: [
        'Only your name',
        'Name, education, family, experience & hobby',
        'Only your hobbies',
        'Only work experience'
      ],
      correctIndex: 1,
      explanation: 'A complete self-introduction includes: name, city, education, family background, experience, and hobby.',
    ),
    QuizQuestion(
      questionHi: '"What is your strength?" का best answer?',
      questionEn: 'Best answer to "What is your strength?"',
      options: [
        'Give a strength relevant to the job role',
        'Say you have no weaknesses',
        'Say money motivates you',
        'Say you work slowly but accurately'
      ],
      correctIndex: 0,
      explanation: 'Always give a strength that is relevant to the job you are applying for.',
    ),
    QuizQuestion(
      questionHi: '"Why do you want to join this company?" का smart answer?',
      questionEn: 'Smart answer to "Why do you want to join this company?"',
      options: [
        'Because I need money',
        'Because my friend works here',
        'Mention growth opportunities, good environment & how your skills match',
        'Because it is close to my home'
      ],
      correctIndex: 2,
      explanation: 'Always connect the company\'s strengths with your skills and career goals.',
    ),
    QuizQuestion(
      questionHi: 'Interview में "Extempore" क्या होता है?',
      questionEn: 'What is "Extempore" in an interview?',
      options: [
        'A written test',
        'Speaking continuously on a given word/topic without stopping',
        'A group discussion',
        'A technical test'
      ],
      correctIndex: 1,
      explanation: 'Extempore = speaking continuously on a given topic without pause. Tests fluency and confidence.',
    ),
    QuizQuestion(
      questionHi: '"Comfortable with rotational shifts?" का best answer?',
      questionEn: 'Best answer to "Are you comfortable with rotational shifts?"',
      options: [
        'No, I prefer day shifts only',
        'Yes, every job has pros & cons and I am prepared for it',
        'I will think about it',
        'Only if you pay extra'
      ],
      correctIndex: 1,
      explanation: 'Show flexibility and a positive attitude. Mention you understand the nature of the job.',
    ),
  ];

  // ─── L9: Mock Interview Quiz ───────────────────────────────────────────────
  static const List<QuizQuestion> mockQuizQuestions = [
    QuizQuestion(
      questionHi: 'इंटरव्यू room में enter करने का सही तरीका?',
      questionEn: 'Correct way to enter an interview room?',
      options: [
        'सीधे अंदर चले जाएं',
        '"May I come in sir/ma\'am?" कहकर permission लें',
        'दरवाज़ा खटखटाकर अंदर आ जाएं',
        'कोई ज़रूरी नहीं'
      ],
      correctIndex: 1,
      explanation: 'Always say "May I come in sir/ma\'am?" before entering.',
    ),
    QuizQuestion(
      questionHi: 'Interview में बैठने से पहले क्या करें?',
      questionEn: 'What should you do before sitting in an interview?',
      options: [
        'सीधे बैठ जाएं',
        '"May I sit?" या "Thank you" (जब कहा जाए) — permission के बाद',
        'खड़े रहें पूरे interview में',
        'पूछें कि कहाँ बैठें'
      ],
      correctIndex: 1,
      explanation: 'Wait to be offered a seat. Say "May I sit?" or "Thank you" when offered.',
    ),
    QuizQuestion(
      questionHi: 'अगर interviewer कुछ पूछे जो आपको नहीं पता, तो?',
      questionEn: 'If asked something you don\'t know, you should:',
      options: [
        'कुछ भी बोल दें',
        'Honestly say "I\'m sorry, I don\'t know" or "I\'m not sure"',
        'Topic बदल दें',
        'चुप रहें'
      ],
      correctIndex: 1,
      explanation: 'Honesty is always better. Say "I\'m sorry, I don\'t know" — interviewers respect honesty.',
    ),
    QuizQuestion(
      questionHi: 'Interview खत्म होने पर क्या कहें?',
      questionEn: 'What should you say when the interview ends?',
      options: [
        'Okay bye.',
        'Thank you sir/ma\'am. It was a pleasure talking to you.',
        'चुपचाप चले जाएं',
        'See you later.'
      ],
      correctIndex: 1,
      explanation: '"Thank you, it was a pleasure talking to you." — professional and polite closing.',
    ),
    QuizQuestion(
      questionHi: '"Give me reasons to hire you." — best approach?',
      questionEn: '"Give me reasons to hire you." — best approach?',
      options: [
        'Say you need the job badly',
        'Mention your relevant skills, dedication & how you can add value',
        'Compare yourself to other candidates',
        'Say you have no reason'
      ],
      correctIndex: 1,
      explanation: 'Connect your skills and attitude to the company\'s needs. Show confidence without arrogance.',
    ),
    QuizQuestion(
      questionHi: 'अगर customer call पर abuse करे, तो?',
      questionEn: 'If a customer abuses you on call, what should you do?',
      options: [
        'Call disconnect कर दें',
        'Politely but confidently handle — customer is like God for business',
        'Abuse back',
        'Transfer to manager immediately'
      ],
      correctIndex: 1,
      explanation: 'Handle calmly and politely. Customer is key to the business — patience is essential.',
    ),
    QuizQuestion(
      questionHi: 'Telephonic interview में "convenient time" क्यों पूछते हैं?',
      questionEn: 'Why is "Is it a convenient time?" asked in telephonic interviews?',
      options: [
        'Just formality',
        'To check if candidate is free and can give full attention',
        'To know the candidate\'s location',
        'It is not asked'
      ],
      correctIndex: 1,
      explanation: 'It ensures the candidate is in a suitable environment to speak without distractions.',
    ),
    QuizQuestion(
      questionHi: 'Hobby बताते समय क्या ध्यान रखें?',
      questionEn: 'What should you keep in mind while mentioning a hobby?',
      options: [
        'Don\'t mention any hobby',
        'Mention a hobby you know well — interviewer may ask related questions',
        'Say "I have no hobbies"',
        'Always say reading books'
      ],
      correctIndex: 1,
      explanation: 'Only mention hobbies you genuinely know — Arpit\'s cricket fielding positions example shows the risk.',
    ),
  ];

  // ─── L10: Chapter Final Quiz ──────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'BPO का full form?',
      questionEn: 'Full form of BPO?',
      options: [
        'Business Process Organization',
        'Business Process Outsourcing',
        'Business Professional Operations',
        'Basic Process Outsourcing'
      ],
      correctIndex: 1,
      explanation: 'BPO = Business Process Outsourcing.',
    ),
    QuizQuestion(
      questionHi: '"How are you doing?" का गलत जवाब?',
      questionEn: 'Wrong reply to "How are you doing?"',
      options: [
        'I am doing well.',
        'I am fine.',
        'I am doing nothing.',
        'I am good.'
      ],
      correctIndex: 2,
      explanation: '"I am doing nothing" is incorrect. Pankaj made this mistake in Interview VI.',
    ),
    QuizQuestion(
      questionHi: 'Resume देते समय सही phrase?',
      questionEn: 'Correct phrase while handing resume?',
      options: ['Take this.', 'Here it is.', 'Take it.', 'For you.'],
      correctIndex: 1,
      explanation: '"Here it is." is polite and professional.',
    ),
    QuizQuestion(
      questionHi: '"Lest" के बाद helping verb?',
      questionEn: 'Helping verb after "lest"?',
      options: ['Will', 'Would', 'Should', 'Shall'],
      correctIndex: 2,
      explanation: '"Lest" must always be followed by "should".',
    ),
    QuizQuestion(
      questionHi: 'Inbound process में क्या होता है?',
      questionEn: 'What happens in an inbound process?',
      options: [
        'Calls are made to customers',
        'Calls are received from customers',
        'Emails are sent',
        'Training sessions happen'
      ],
      correctIndex: 1,
      explanation: 'Inbound = receiving calls from customers to resolve their queries.',
    ),
    QuizQuestion(
      questionHi: '"Castles in the air" का अर्थ?',
      questionEn: 'Meaning of "castles in the air"?',
      options: [
        'Real plans',
        'Beautiful architecture',
        'Empty/unrealistic words without action',
        'Great achievements'
      ],
      correctIndex: 2,
      explanation: '"Castles in the air" = unrealistic dreams or empty promises.',
    ),
    QuizQuestion(
      questionHi: 'Weakness बताते समय क्या करें?',
      questionEn: 'When stating a weakness, you should:',
      options: [
        'Hide it completely',
        'Say you have no weakness',
        'State it and mention your efforts to overcome it',
        'Blame others'
      ],
      correctIndex: 2,
      explanation: 'Always pair your weakness with the steps you are taking to overcome it.',
    ),
    QuizQuestion(
      questionHi: 'Cricket pitch की लम्बाई?',
      questionEn: 'Length of a cricket pitch?',
      options: ['18 yards', '20 yards', '22 yards', '24 yards'],
      correctIndex: 2,
      explanation: 'A cricket pitch is 22 yards long.',
    ),
    QuizQuestion(
      questionHi: 'John Nash को Nobel किस क्षेत्र में मिला?',
      questionEn: 'John Nash received Nobel in which field?',
      options: ['Physics', 'Chemistry', 'Economics', 'Literature'],
      correctIndex: 2,
      explanation: 'John Nash received the Nobel Prize for Economics.',
    ),
    QuizQuestion(
      questionHi: 'Interview में hobby raise करने पर क्या ध्यान रखें?',
      questionEn: 'Caution while mentioning a hobby in interview?',
      options: [
        'Always say reading books',
        'Never mention hobbies',
        'Only mention hobbies you know deeply — interviewer may ask related questions',
        'Mention as many hobbies as possible'
      ],
      correctIndex: 2,
      explanation: 'Arpit raised cricket but couldn\'t answer about fielding positions — only mention what you truly know.',
    ),
  ];

  // ─── Content data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> interviewTips = [
    {
      'emoji': '😌',
      'tip': 'Be Confident & Natural',
      'detail': 'Don\'t hurry. Speak calmly and naturally.',
    },
    {
      'emoji': '🤷',
      'tip': 'Accept Ignorance Honestly',
      'detail': 'If you don\'t know something, say so. There\'s nothing wrong in saying "I don\'t know."',
    },
    {
      'emoji': '💪',
      'tip': 'State Efforts to Overcome Weakness',
      'detail': 'When your weak area is highlighted, mention what you are doing to improve it.',
    },
    {
      'emoji': '🙏',
      'tip': 'Use Polite Phrases',
      'detail': '"May I come in?", "Thank you", "Here it is", "It was a pleasure talking to you."',
    },
    {
      'emoji': '🏏',
      'tip': 'Don\'t Raise Unknown Topics',
      'detail': 'If you\'re not sure about something, don\'t bring it up yourself (Arpit & cricket positions).',
    },
    {
      'emoji': '🎯',
      'tip': 'Practice Mock Interviews',
      'detail': 'Practice with friends. Remember — Practice makes a man perfect.',
    },
  ];

  static const List<Map<String, String>> keyPhrases = [
    {'phrase': 'May I come in sir/ma\'am?', 'use': 'कमरे में enter करते समय'},
    {'phrase': 'May I sit?', 'use': 'बैठने की permission माँगते समय'},
    {'phrase': 'Here it is.', 'use': 'Resume देते समय ("Take this" मत कहें)'},
    {'phrase': 'I am doing well. / I am fine.', 'use': '"How are you doing?" का जवाब'},
    {'phrase': 'I\'m sorry, I don\'t know.', 'use': 'जब उत्तर नहीं पता हो'},
    {'phrase': 'As far as I know,', 'use': 'जहाँ तक जानते हैं, वो बताएं'},
    {'phrase': 'To be honest with you,', 'use': 'ईमानदारी से जवाब देते समय'},
    {'phrase': 'I have no issues with that.', 'use': 'Flexibility दिखाने के लिए'},
    {'phrase': 'It was a pleasure talking to you.', 'use': 'Interview खत्म होने पर'},
    {'phrase': 'Thank you so much.', 'use': 'Interview के अंत में'},
  ];

  static const List<Map<String, String>> mockQA = [
    {
      'q': 'Tell me something about yourself.',
      'a': 'Include: Name → City → Education → Family → Experience → Hobby. Keep it 60–90 seconds.',
    },
    {
      'q': 'What is your strength?',
      'a': 'Give a strength relevant to the job. E.g., "My strength is my communication skills and dedication."',
    },
    {
      'q': 'What is your weakness?',
      'a': 'State a real weakness + what you are doing to overcome it. E.g., "My weakness is computer skills but I have joined coaching."',
    },
    {
      'q': 'Why do you want to join this company?',
      'a': 'Mention growth, good environment, and how your skills match their requirements.',
    },
    {
      'q': 'Give me reasons to hire you.',
      'a': 'Connect your skills, attitude and dedication to the company\'s needs. Show confidence.',
    },
    {
      'q': 'Are you comfortable with rotational shifts?',
      'a': '"Yes, every job has its pros and cons. I am fully prepared and comfortable."',
    },
    {
      'q': 'What are your salary expectations?',
      'a': 'If fresher: "As per company norms." If experienced: mention a range based on market.',
    },
    {
      'q': 'Where do you see yourself in 5 years?',
      'a': 'Show ambition + alignment with company growth. E.g., "I see myself in a leadership role, contributing to the company\'s success."',
    },
  ];
}