import '../models/lesson_model.dart';

/// Chapter 30 — Phrasal Verbs (Phrasal क्रियाएं)
class Chapter30Data {

  static ChapterModel get chapter => ChapterModel(
        id: 30,
        title: 'Phrasal Verbs',
        titleHindi: 'Phrasal क्रियाएं',
        description: 'Get, Run, Turn, Put, Go, Break, Come, Look & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Get', titleHindi: 'Get — 8 phrasal verbs', emoji: '🚀', type: LessonType.ch30Get, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Run / Turn', titleHindi: 'Run — 5 / Turn — 5', emoji: '🏃', type: LessonType.ch30RunTurn, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Put / Go', titleHindi: 'Put — 5 / Go — 8', emoji: '📌', type: LessonType.ch30PutGo, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Break / Come / Look', titleHindi: 'Break — 6 / Come — 6 / Look — 5', emoji: '🔍', type: LessonType.ch30BreakComeLook, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Others — Take off / Abide by…', titleHindi: 'Other Phrasal Verbs (21)', emoji: '📋', type: LessonType.ch30Others, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch30ChapterQuiz, status: LessonStatus.inProgress, totalXP: 80),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch30Get:             return getQuestions;
      case LessonType.ch30RunTurn:         return runTurnQuestions;
      case LessonType.ch30PutGo:           return putGoQuestions;
      case LessonType.ch30BreakComeLook:   return breakComeLookQuestions;
      case LessonType.ch30Others:          return othersQuestions;
      case LessonType.ch30ChapterQuiz:     return chapterFinalQuestions;
      default:                             return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> getQuestions = [
    QuizQuestion(questionEn: '"Get in / Get on" means ___.',questionHi: '"Get in / Get on" का अर्थ?',options: ['To leave a vehicle','To board a vehicle','To recover','To escape'],correctIndex: 1,explanation: '"Get in / Get on" = किसी वाहन में चढ़ना (To board a vehicle). "I got on the bus."'),
    QuizQuestion(questionEn: '"Get off / Get down" means ___.',questionHi: '"Get off / Get down" का अर्थ?',options: ['To board','To wake up','To leave a vehicle','To escape'],correctIndex: 2,explanation: '"Get off / Get down" = किसी वाहन से उतरना (To leave a vehicle). "He was getting off the car."'),
    QuizQuestion(questionEn: '"राम सजा से बच निकला।" — Phrasal verb?',questionHi: '"राम सजा से बच निकला।"',options: ['Get up','Get over','Get away with','Get through'],correctIndex: 2,explanation: '"Get away with" = बच निकलना (To escape). "Ram got away with the punishment."'),
    QuizQuestion(questionEn: '"I couldn\'t get through the exam." — Hindi?',questionHi: '"I couldn\'t get through the exam."',options: ['मैं परीक्षा नहीं लिख पाया।','मैं परीक्षा में पास नहीं हो पाया।','मैं परीक्षा दे नहीं पाया।','मैं परीक्षा छोड़ गया।'],correctIndex: 1,explanation: '"Get through" = किसी परीक्षा में पास होना. "I couldn\'t get through the exam." = "मैं परीक्षा में पास नहीं हो पाया।"'),
    QuizQuestion(questionEn: '"Get along with" means ___.',questionHi: '"Get along with" का अर्थ?',options: ['To leave together','To develop good terms with someone','To go together','To chase someone'],correctIndex: 1,explanation: '"Get along with" = किसी के साथ अच्छे संबंध बनाना. "I get along with all my colleagues."'),
  ];

  static const List<QuizQuestion> runTurnQuestions = [
    QuizQuestion(questionEn: '"Run after" means ___.',questionHi: '"Run after" का अर्थ?',options: ['To escape','To chase / run behind','To study quickly','To feel weak'],correctIndex: 1,explanation: '"Run after" = पीछा करना / पीछे भागना (To chase). "Does he run after money?"'),
    QuizQuestion(questionEn: '"I am run down in health today." — Hindi?',questionHi: '"I am run down in health today."',options: ['मैं आज दौड़ा।','मेरी तबीयत ठीक नहीं है।','मैं आज थका हुआ हूँ।','मैं आज बीमार हो गया।'],correctIndex: 1,explanation: '"Run down" = शरीर में कमजोरी महसूस करना. "I am run down in health today." = "मेरी तबीयत ठीक नहीं है।"'),
    QuizQuestion(questionEn: '"Turn on" and "Turn off" are opposites. "Turn on" means ___.',questionHi: '"Turn on" का अर्थ?',options: ['Switch off','Switch on (light/tap/switch)','To turn around','To turn the page'],correctIndex: 1,explanation: '"Turn on" = ऑन करना / खोलना. "Turn off" = ऑफ करना / बंद करना. "I turned on the tap."'),
    QuizQuestion(questionEn: '"Turn around" means ___.',questionHi: '"Turn around" का अर्थ?',options: ['To turn the page','To turn upside down','To turn / पलटना','To switch on'],correctIndex: 2,explanation: '"Turn around" = पलटना. "He turned around, the moment I called out his name."'),
    QuizQuestion(questionEn: '"Run away / Run off" means ___.',questionHi: '"Run away / Run off" का अर्थ?',options: ['To chase','To study quickly','To escape / flee (बच निकलना / भाग जाना)','To feel weakness'],correctIndex: 2,explanation: '"Run away / Run off" = बच निकलना / भाग जाना. "I ran away from there the moment I saw him."'),
  ];

  static const List<QuizQuestion> putGoQuestions = [
    QuizQuestion(questionEn: '"Put up" means ___.',questionHi: '"Put up" का अर्थ?',options: ['To write','To extinguish','To propose','To live / रहना'],correctIndex: 3,explanation: '"Put up" = रहना. "I put up in Delhi." = "मैं दिल्ली में रहता हूँ।"'),
    QuizQuestion(questionEn: '"Put out / Put off" means ___.',questionHi: '"Put out / Put off" का अर्थ?',options: ['To write','To extinguish (बुझाना)','To live','To present'],correctIndex: 1,explanation: '"Put out / Put off" = बुझाना (light/fire/gas). "Kindly put out the fire."'),
    QuizQuestion(questionEn: '"Go through" has two meanings. Which is NOT one of them?',questionHi: '"Go through" के दो अर्थ हैं। कौन सा इसका अर्थ नहीं है?',options: ['To read (पढ़ना)','To suffer (झेलना)','To escape (भाग जाना)','Both reading and suffering'],correctIndex: 2,explanation: '"Go through" = 1) To read. 2) To suffer. "To escape" is "Run away / Break out". Not "go through".'),
    QuizQuestion(questionEn: '"Prices of mobiles are going down day by day." — Hindi?',questionHi: '"Prices of mobiles are going down day by day."',options: ['मोबाइलों की कीमतें दिन ब दिन बढ़ रही हैं।','मोबाइलों के मूल्य दिन ब दिन गिर रहे हैं।','मोबाइल सस्ते हो गये।','मोबाइलों की कीमतें नहीं बदलीं।'],correctIndex: 1,explanation: '"Go down" = कीमत घटना. "Go up" = कीमत बढ़ना. "Prices of mobiles are going down day by day."'),
    QuizQuestion(questionEn: '"Go ahead" means ___.',questionHi: '"Go ahead" का अर्थ?',options: ['To go in front','To continue','To start / आगे बढ़ना','To oppose'],correctIndex: 2,explanation: '"Go ahead" = आगे बढ़ना / शुरू करना. "Now you can go ahead." = "अब आप काम शुरू कर सकते हैं।"'),
  ];

  static const List<QuizQuestion> breakComeLookQuestions = [
    QuizQuestion(questionEn: '"Break in / Break into" means ___.',questionHi: '"Break in / Break into" का अर्थ?',options: ['To break something','To end a relationship','Enter with aim of theft (चोरी के इरादे से घुसना)','To escape from prison'],correctIndex: 2,explanation: '"Break in / Break into" = चोरी के इरादे से घुसना. "The thief broke in my house."'),
    QuizQuestion(questionEn: '"Break up" vs "Break off" — what do both mean?',questionHi: '"Break up" और "Break off" दोनों का अर्थ?',options: ['To collapse','To end a relationship (रिश्ता खत्म करना)','To escape from prison','To spread'],correctIndex: 1,explanation: 'Both "Break up" and "Break off" = रिश्ता खत्म करना / होना. "I broke up with her." / "I broke off with her."'),
    QuizQuestion(questionEn: '"Come across" means ___.',questionHi: '"Come across" का अर्थ?',options: ['To come across the road','To face / meet (रुबरू होना / मिलना)','To produce an idea','To pass'],correctIndex: 1,explanation: '"Come across" = मिलना / रुबरू होना. "I came across her brother last year."'),
    QuizQuestion(questionEn: '"Look into" means ___.',questionHi: '"Look into" का अर्थ?',options: ['To search in dictionary','To take care of','To investigate (जाँच पड़ताल करना)','To treat someone nothing'],correctIndex: 2,explanation: '"Look into" = जाँच पड़ताल करना (To investigate). "Police is looking into the matter."'),
    QuizQuestion(questionEn: '"Look down upon" means ___.',questionHi: '"Look down upon" का अर्थ?',options: ['To look at something below','To investigate','To take care of','To treat someone as inferior / तुच्छ समझना'],correctIndex: 3,explanation: '"Look down upon" = किसी को कम / तुच्छ समझना. "Don\'t look down upon the poor."'),
  ];

  static const List<QuizQuestion> othersQuestions = [
    QuizQuestion(questionEn: '"Back out of" means ___.',questionHi: '"Back out of" का अर्थ?',options: ['To go back','Not to keep one\'s words / वादे से मुकरना','To follow rules','To cancel'],correctIndex: 1,explanation: '"Back out of" = अपनी बात या वादे से मुकरना. "I never back out of my promises."'),
    QuizQuestion(questionEn: '"Give up" means ___.',questionHi: '"Give up" का अर्थ?',options: ['To give something','To accept defeat','To abandon / छोड़ देना / त्यागना','To continue'],correctIndex: 2,explanation: '"Give up" = त्यागना / छोड़ देना (To abandon). "I had given up bad habits." Note: "Give in" = हार मान लेना.'),
    QuizQuestion(questionEn: '"Bring up" means ___.',questionHi: '"Bring up" का अर्थ?',options: ['To bring something up','To raise / foster (पालना)','To cancel','To call someone'],correctIndex: 1,explanation: '"Bring up" = पालना / पालन पोषण करना. "They brought me up." = "उन्होंने मुझे पाला।"'),
    QuizQuestion(questionEn: '"Stand by" means ___.',questionHi: '"Stand by" का अर्थ?',options: ['To stand near','To be with / साथ देना','To prove to be','To reduce'],correctIndex: 1,explanation: '"Stand by" = साथ देना. "He stood by me in good or bad." = "उसने मेरा साथ दिया, अच्छे में, बुरे में।"'),
    QuizQuestion(questionEn: '"Turn out" means ___.',questionHi: '"Turn out" का अर्थ?',options: ['To turn off','To turn upside down','Prove to be (साबित होना)','To abandon'],correctIndex: 2,explanation: '"Turn out" = साबित होना. "This project will turn out to be a master piece."'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: '"Get over" means ___.',questionHi: '"Get over" का अर्थ?',options: ['To board a vehicle','To wake up','Recover from trouble (परेशानी से बाहर निकलना)','To pass an exam'],correctIndex: 2,explanation: '"Get over" = किसी परेशानी से बाहर निकलना. "Ram could somehow get over his problems."'),
    QuizQuestion(questionEn: '"Run over" has two meanings. One is "study quickly". The other is ___.',questionHi: '"Run over" के दो अर्थ। एक है "जल्दी पढ़ना", दूसरा?',options: ['To escape','To knock down / हरा देना','To chase','To feel weak'],correctIndex: 1,explanation: '"Run over" = 1) Study quickly (जल्दी जल्दी पढ़ना). 2) To knock down (हरा देना). "He ran over the defending champion."'),
    QuizQuestion(questionEn: '"Put forward" means ___.',questionHi: '"Put forward" का अर्थ?',options: ['To write','To live','To present / propose (पेश करना)','To extinguish'],correctIndex: 2,explanation: '"Put forward" = पेश करना / प्रस्ताव रखना. "I put forward my report."'),
    QuizQuestion(questionEn: '"Break out" has two meanings. Which pair is correct?',questionHi: '"Break out" के दो अर्थ कौन से हैं?',options: ['To escape from prison + To spread (फैलना)','To end relationship + To collapse','To quarrel + To enter for theft','To escape + To end relationship'],correctIndex: 0,explanation: '"Break out" = 1) Escape from prison (जेल से भागना). 2) To spread (फैलना). "That criminal broke out the jail." / "This disease has broken out in the city."'),
    QuizQuestion(questionEn: '"Come up with" means ___.',questionHi: '"Come up with" का अर्थ?',options: ['To come up in price','To face someone','To produce an idea (कोई विचार आना)','To pass by'],correctIndex: 2,explanation: '"Come up with" = कोई विचार आना. "He came up with a unique idea."'),
    QuizQuestion(questionEn: '"Look for" vs "Look up" — difference?',questionHi: '"Look for" vs "Look up" — अंतर?',options: ['Both mean to search','Look for = search in dictionary, Look up = general search','Look for = general search, Look up = search in dictionary/book','Both mean to investigate'],correctIndex: 2,explanation: '"Look for" = ढूँढना (general search). "Look up" = dictionary/book में ढूँढना. "Are you looking for a room?" vs "I am looking up a word in the dictionary."'),
    QuizQuestion(questionEn: '"Abide by" means ___.',questionHi: '"Abide by" का अर्थ?',options: ['To live near','To abandon','To adhere to rules (नियमों का पालन करना)','To cancel'],correctIndex: 2,explanation: '"Abide by" = नियमों का पालन करना. "We must abide by the company policy."'),
    QuizQuestion(questionEn: '"Call off" means ___.',questionHi: '"Call off" का अर्थ?',options: ['To call someone','To continue','To cancel (रद्द करना)','To abandon'],correctIndex: 2,explanation: '"Call off" = रद्द करना. "He called off the meeting." Note: "Call out/in" = किसी को पुकारना.'),
    QuizQuestion(questionEn: '"Give in" vs "Give up" — difference?',questionHi: '"Give in" और "Give up" में अंतर?',options: ['Both mean to abandon','Give in = हार मान लेना, Give up = त्यागना/छोड़ना','Give up = हार मान लेना, Give in = त्यागना','No difference'],correctIndex: 1,explanation: '"Give in" = हार मान लेना (accept defeat). "Give up" = त्यागना / छोड़ देना (abandon). "Don\'t give in till the last breath." vs "I gave up bad habits."'),
    QuizQuestion(questionEn: '"Take off" has two meanings. Which pair is correct?',questionHi: '"Take off" के दो अर्थ?',options: ['Remove clothes + airplane departure','Remove clothes + to land','Wear clothes + airplane departure','Airplane departure + to board'],correctIndex: 0,explanation: '"Take off" = 1) कपड़े उतारना. 2) Airplane departure. "Take off the dirty clothes." / "Plane took off at 8."'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> getPhrasals = [
    {'phrasal': 'Get in / Get on',   'meaning': 'To board a vehicle',               'hindi': 'किसी वाहन में चढ़ना',         'example': 'I got on the bus.',                                          'exHindi': 'मैं बस में चढ़ा।'},
    {'phrasal': 'Get off / Get down','meaning': 'To leave a vehicle',               'hindi': 'किसी वाहन से उतरना',         'example': 'He was getting off the car.',                                'exHindi': 'वो कार से उतर रहा था।'},
    {'phrasal': 'Get away with',     'meaning': 'To escape',                        'hindi': 'बच निकलना',                  'example': 'Ram got away with the punishment.',                          'exHindi': 'राम सजा से बच निकला।'},
    {'phrasal': 'Get up',            'meaning': 'To wake up / To stand up',         'hindi': 'उठना / जागना / खड़े होना',   'example': 'She gets up at 6.',                                          'exHindi': 'वो 6 बजे उठती है।'},
    {'phrasal': 'Get along with',    'meaning': 'Develop good terms with someone',  'hindi': 'किसी के साथ अच्छे संबंध बनाना','example': 'I get along with all my colleagues.',                      'exHindi': 'सभी साथियों के साथ मेरे अच्छे संबंध हैं।'},
    {'phrasal': 'Get out of',        'meaning': 'To leave for outside',             'hindi': 'बाहर निकलना',                'example': 'I want you to get out of my home.',                          'exHindi': 'मैं चाहता हूँ कि तुम मेरे घर से बाहर निकल जाओ।'},
    {'phrasal': 'Get over',          'meaning': 'To recover from some trouble',     'hindi': 'किसी परेशानी से बाहर निकलना', 'example': 'Ram could somehow get over his problems.',                  'exHindi': 'राम किसी तरह अपनी परेशानियों से बाहर निकल पाया।'},
    {'phrasal': 'Get through',       'meaning': 'To pass an exam/test',             'hindi': 'किसी परीक्षा में पास होना',   "example": "I couldn't get through the exam.",                          'exHindi': 'मैं परीक्षा में पास नहीं हो पाया।'},
  ];

  static const List<Map<String, String>> runPhrasals = [
    {'phrasal': 'Run after',    'meaning': 'To chase',                           'hindi': 'पीछा करना / पीछे भागना',       'example': 'Does he run after money?',                              'exHindi': 'क्या वो पैसे के पीछे भागता है?'},
    {'phrasal': 'Run away/off', 'meaning': 'To escape, flee',                    'hindi': 'बच निकलना / भाग जाना',         'example': 'I ran away from there, the moment I saw him.',          'exHindi': 'मैं वहाँ से भाग गया जैसे ही मैंने उसे देखा।'},
    {'phrasal': 'Run down',     'meaning': 'To feel weakness in body',           'hindi': 'शरीर में कमजोरी महसूस करना',   'example': 'I am run down in health today.',                        'exHindi': 'मेरी तबीयत ठीक नहीं है।'},
    {'phrasal': 'Run over',     'meaning': 'Study quickly / To knock down',      'hindi': 'जल्दी जल्दी पढ़ना / हरा देना', 'example': "Don't run over the lesson. / He ran over the defending champion.", 'exHindi': 'पाठ को जल्दी जल्दी मत पढ़ो। / उसने पिछले साल के विजेता को हरा दिया।'},
  ];

  static const List<Map<String, String>> turnPhrasals = [
    {'phrasal': 'Turn on',          'meaning': 'Switch on (light/tap/switch)',      'hindi': 'ऑन करना / खोलना',      'example': 'I turned on the tap.',                            'exHindi': 'मैंने नल खोला।'},
    {'phrasal': 'Turn off',         'meaning': 'Switch off (light/tap/switch)',     'hindi': 'ऑफ करना / बंद करना',   "example": "Don't turn off the computer.",                    'exHindi': 'कम्प्यूटर को बन्द मत करो।'},
    {'phrasal': 'Turn around',      'meaning': 'To turn / पलटना',                  'hindi': 'पलटना',                 'example': 'He turned around the moment I called his name.',  'exHindi': 'जैसे ही मैंने उसका नाम पुकारा, वो पलट गया।'},
    {'phrasal': 'Turn over',        'meaning': 'To turn the page',                 'hindi': 'पेज पलटना',             'example': 'Stop turning over the page.',                     'exHindi': 'पेज पलटना बन्द करो।'},
    {'phrasal': 'Turn upside down', 'meaning': 'To turn something opposite',       'hindi': 'उलट कर पूरी तरह पलट देना', 'example': 'If I turn it upside down, it would form a conical shape.', 'exHindi': 'अगर मैं इसे पलट कर उल्टा कर दूँ तो यह एक शंकु का आकार बन जाएगा।'},
  ];

  static const List<Map<String, String>> putPhrasals = [
    {'phrasal': 'Put out / off', 'meaning': 'Extinguish (light/fire/gas)',         'hindi': 'बुझाना',                'example': 'Kindly put out the fire.',                             'exHindi': 'कृपया आग बुझा दो।'},
    {'phrasal': 'Put down',      'meaning': 'To write',                            'hindi': 'लिखना',                 'example': 'All students are requested to put down their ideas.',  'exHindi': 'सभी विद्यार्थियों से अनुरोध है कि वे अपने विचार लिखें।'},
    {'phrasal': 'Put forward',   'meaning': 'To present / propose',               'hindi': 'पेश करना / प्रस्ताव रखना','example': 'I put forward my report.',                            'exHindi': 'मैंने अपनी रिपोर्ट पेश की।'},
    {'phrasal': 'Put up',        'meaning': 'To live',                             'hindi': 'रहना',                  'example': 'I put up in Delhi.',                                   'exHindi': 'मैं दिल्ली में रहता हूँ।'},
    {'phrasal': 'Put on',        'meaning': 'To gain weight / To wear',            'hindi': 'वजन बढ़ना / पहनना',    'example': 'She puts on Saree even at home.',                       'exHindi': 'वो घर पर भी साड़ी पहनती है।'},
  ];

  static const List<Map<String, String>> goPhrasals = [
    {'phrasal': 'Go away',    'meaning': 'To depart',                'hindi': 'निकल जाना',          'example': 'Just go away from my life.',                          'exHindi': 'बस मेरी जिन्दगी से चले जाओ।'},
    {'phrasal': 'Go down',    'meaning': 'Decrease in price',        'hindi': 'कीमत घटना',          'example': 'Prices of mobiles are going down day by day.',        'exHindi': 'मोबाइलों के मूल्य दिन ब दिन गिर रहे हैं।'},
    {'phrasal': 'Go on',      'meaning': 'To continue',              'hindi': 'जारी रखना',          'example': 'Go on with your story please.',                       'exHindi': 'कृपया अपनी कहानी जारी रखिए।'},
    {'phrasal': 'Go around',  'meaning': 'In an affair',             'hindi': 'किसी के साथ अफेयर में होना', 'example': 'Priya is going around with him.',             'exHindi': 'प्रिया का उसके साथ अफेयर चल रहा है।'},
    {'phrasal': 'Go against', 'meaning': 'To be contrary to',        'hindi': 'विरोध करना',         "example": "I am not going against you.",                         'exHindi': 'मैं तुम्हारा विरोध नहीं कर रहा हूँ।'},
    {'phrasal': 'Go through', 'meaning': 'To read / To suffer',      'hindi': 'पढ़ना / झेलना',      'example': 'I have gone through this book many a time.',          'exHindi': 'मैंने ये किताब कई बार पढ़ी है।'},
    {'phrasal': 'Go up',      'meaning': 'Increase in price',        'hindi': 'कीमत बढ़ना',         'example': 'Prices of food grains are increasing.',               'exHindi': 'अनाज की कीमतें बढ़ रही हैं।'},
    {'phrasal': 'Go ahead',   'meaning': 'To start',                 'hindi': 'आगे बढ़ना / शुरू करना', 'example': 'Now, you can go ahead.',                          'exHindi': 'अब आप काम शुरू कर सकते हैं।'},
  ];

  static const List<Map<String, String>> breakPhrasals = [
    {'phrasal': 'Break in/into', 'meaning': 'Enter with aim of theft',          'hindi': 'चोरी के इरादे से घुसना',   'example': 'The thief broke in my house.',                       'exHindi': 'चोर मेरे घर में घुस गया।'},
    {'phrasal': 'Break off',     'meaning': 'To end a relationship',             'hindi': 'रिश्ता खत्म करना',          'example': 'I broke off with her.',                              'exHindi': 'मैंने उसके साथ रिश्ता खत्म कर दिया।'},
    {'phrasal': 'Break up',      'meaning': 'To end a relationship',             'hindi': 'रिश्ता खत्म होना/करना',    'example': 'I broke up with her.',                               'exHindi': 'मेरा उसके साथ रिश्ता खत्म हो गया।'},
    {'phrasal': 'Break out',     'meaning': 'To escape from prison / To spread', 'hindi': 'जेल से भागना / फैलना',    'example': 'That criminal broke out the jail.',                  'exHindi': 'उस अपराधी ने जेल तोड़ दी।'},
    {'phrasal': 'Break with',    'meaning': 'To quarrel',                        'hindi': 'झगड़ना',                    'example': 'Why do you break with me?',                          'exHindi': 'तुम मुझसे क्यों झगड़ते हो?'},
    {'phrasal': 'Break down',    'meaning': 'To collapse',                       'hindi': 'ढह जाना / खराब हो जाना',   'example': 'All the poorly constructed houses broke down.',      'exHindi': 'सभी खराब तरीके से बने घर ढह गये।'},
  ];

  static const List<Map<String, String>> comePhrasals = [
    {'phrasal': 'Come across', 'meaning': 'To face / meet',          'hindi': 'मिलना / रुबरू होना',  'example': 'I came across her brother last year.',                'exHindi': 'मैं उसके भाई से पिछले साल रुबरू हुआ।'},
    {'phrasal': 'Come up with','meaning': 'Produce an idea',         'hindi': 'कोई विचार आना',       'example': 'He came up with a unique idea.',                      'exHindi': 'उसके दिमाग में एक अनोखा विचार आया।'},
    {'phrasal': 'Come to',     'meaning': 'Amount to (total)',        'hindi': 'कुल मिलाकर कितना',   'example': 'Rs 20 for onion and Rs 10 for pen, it comes to 30.',  'exHindi': '20 रु का प्याज और 10 रु का पेन, कुल मिलाकर हुआ 30।'},
    {'phrasal': 'Come up',     'meaning': 'Increase in price',        'hindi': 'कीमत बढ़ना',          'example': 'Prices are coming up.',                               'exHindi': 'कीमतें बढ़ रही हैं।'},
    {'phrasal': 'Come down',   'meaning': 'Decrease in price',        'hindi': 'कीमत घटना',           'example': 'Prices are coming down.',                             'exHindi': 'कीमतें घट रही हैं।'},
    {'phrasal': 'Come by',     'meaning': 'To pass by',               'hindi': 'गुजरना',              'example': 'He just came by me but I ignored.',                   'exHindi': 'वो बस मेरे पास से गुजरा पर मैंने नजरअंदाज किया।'},
  ];

  static const List<Map<String, String>> lookPhrasals = [
    {'phrasal': 'Look after/out',  'meaning': 'Take care of',                 'hindi': 'ख्याल रखना / देखभाल करना',  'example': 'I am looking after my parents.',                     'exHindi': 'मैं अपने मम्मी पापा की देखभाल कर रहा हूँ।'},
    {'phrasal': 'Look up',         'meaning': 'Search in dictionary/book',    'hindi': 'डिक्शनरी/किताब में ढूँढना',  'example': 'I am looking up a word in the dictionary.',          'exHindi': 'मैं शब्दकोश में एक शब्द ढूँढ रहा हूँ।'},
    {'phrasal': 'Look for',        'meaning': 'To search',                    'hindi': 'ढूँढना',                     'example': 'Are you looking for a room?',                        'exHindi': 'क्या तुम कमरा ढूँढ रहे हो?'},
    {'phrasal': 'Look into',       'meaning': 'To investigate',               'hindi': 'जाँच पड़ताल करना',            'example': 'Police is looking into the matter.',                 'exHindi': 'पुलिस मामले की जाँच पड़ताल कर रही है।'},
    {'phrasal': 'Look down upon',  'meaning': 'Treat as inferior',           'hindi': 'किसी को कम / तुच्छ समझना',  "example": "Don't look down upon the poor.",                     'exHindi': 'गरीबों को नीच / कम मत समझो।'},
  ];

  static const List<Map<String, String>> otherPhrasals = [
    {'phrasal': 'Take off',    'meaning': 'Remove clothes / Airplane departure', 'hindi': 'कपड़े उतारना / जहाज का उड़ान भरना', 'example': 'Take off the dirty clothes. / Plane took off at 8.', 'exHindi': 'गन्दे कपड़े उतार दो। / जहाज ने ठीक 8 बजे उड़ान भरी।'},
    {'phrasal': 'Abide by',    'meaning': 'Adhere to rules',                     'hindi': 'नियमों का पालन करना',          'example': 'We must abide by the company policy.',              'exHindi': 'हमें कम्पनी की नीति का पालन करना चाहिए।'},
    {'phrasal': 'Back out of', 'meaning': 'Not to keep one\'s words',            'hindi': 'वादे से मुकरना',               'example': 'I never back out of my promises.',                  'exHindi': 'मैं अपने वादों से कभी नहीं मुकरता।'},
    {'phrasal': 'Blow out',    'meaning': 'To extinguish',                       'hindi': 'बुझाना',                        'example': 'He blew out the candle.',                           'exHindi': 'उसने मोमबत्ती बुझा दी।'},
    {'phrasal': 'Act upon',    'meaning': 'To follow',                           'hindi': 'अमल करना / पालन करना',         'example': 'Ram always acts upon my advice.',                   'exHindi': 'राम हमेशा मेरी सलाह पर अमल करता है।'},
    {'phrasal': 'Bring up',    'meaning': 'To foster',                           'hindi': 'पालना / पालन पोषण करना',       'example': 'They brought me up.',                               'exHindi': 'उन्होंने मुझे पाला।'},
    {'phrasal': 'Call off',    'meaning': 'To cancel',                           'hindi': 'रद्द करना',                     'example': 'He called off the meeting.',                        'exHindi': 'उन्होंने मीटिंग रद्द की।'},
    {'phrasal': 'Call out/in', 'meaning': 'To call someone',                     'hindi': 'किसी को पुकारना',               'example': 'I was calling out for help but no one turned up.',  'exHindi': 'मैं सहायता के लिए पुकार रहा था पर कोई नहीं आया।'},
    {'phrasal': 'Carry on',    'meaning': 'To continue',                         'hindi': 'जारी रखना',                     "example": "He couldn't carry on his project due to not having enough money.", 'exHindi': 'वो जरूरत मुताबिक पैसा न होने की वजह से अपना प्रोजेक्ट जारी नहीं रख पाया।'},
    {'phrasal': 'Cast off',    'meaning': 'To abandon',                          'hindi': 'त्यागना / अलग कर देना',        'example': 'Snake casts off the outer skin.',                   'exHindi': 'साँप केंचुली को अलग कर देता है।'},
    {'phrasal': 'Cut down',    'meaning': 'To reduce',                           'hindi': 'कम कर देना',                    'example': 'Prices are cut down by a great extent.',            'exHindi': 'कीमतें काफी हद तक कम कर दी गयी हैं।'},
    {'phrasal': 'Cut off',     'meaning': 'To end',                              'hindi': 'समाप्त करना',                   'example': 'He cuts off the phone.',                            'exHindi': 'वो फोन काट देता है।'},
    {'phrasal': 'Get rid of',  'meaning': 'To free yourself from something',     'hindi': 'छुटकारा पाना',                  'example': 'I just want to get rid of this trouble.',           'exHindi': 'मैं बस इस परेशानी से छुटकारा पाना चाहता हूँ।'},
    {'phrasal': 'Give up',     'meaning': 'To abandon',                          'hindi': 'त्यागना / छोड़ देना',           'example': 'I had given up bad habits.',                        'exHindi': 'मैंने बुरी आदतें छोड़ दी थी।'},
    {'phrasal': 'Keep up',     'meaning': 'To continue',                         'hindi': 'जारी रखना',                     'example': 'Keep up the good work.',                            'exHindi': 'अच्छा काम जारी रखिए।'},
    {'phrasal': 'Hold on',     'meaning': 'To stop',                             'hindi': 'रोकना',                         'example': 'I held on the project due to not receiving money.', 'exHindi': 'मैंने प्रोजेक्ट को पैसे न मिलने की वजह से रोक दिया।'},
    {'phrasal': 'Give in',     'meaning': 'To accept defeat',                    'hindi': 'हार मान लेना',                  "example": "Don't give in till the last breath of yours.",      'exHindi': 'आखिरी साँस तक हार मत मानो।'},
    {'phrasal': 'Pull up',     'meaning': 'To take out (information)',            'hindi': 'कोई जानकारी निकालना',           'example': 'I pulled up the data of all the employees.',        'exHindi': 'मैंने सभी कर्मचारियों का डेटा निकाल लिया है।'},
    {'phrasal': 'See after',   'meaning': 'Look after',                          'hindi': 'देखभाल करना',                   "example": "I can't see after them unless I go there.",         'exHindi': 'मैं उनकी देखभाल नहीं कर सकता जब तक मैं वहाँ न जाऊँ।'},
    {'phrasal': 'Stand by',    'meaning': 'To be with',                          'hindi': 'साथ देना',                      'example': 'He stood by me in good and bad.',                   'exHindi': 'उसने मेरा साथ दिया, अच्छे में, बुरे में।'},
    {'phrasal': 'Turn out',    'meaning': 'Prove to be',                         'hindi': 'साबित होना',                    'example': 'This project will turn out to be a master piece.',  'exHindi': 'यह प्रोजेक्ट एक मास्टर पीस साबित होगा।'},
  ];

  static const List<Map<String, String>> motivationalQuotes = [
    {'english': 'It does not matter how slowly you go as long as you do not stop.', 'hindi': 'इससे कोई फर्क नहीं पड़ता कि तुम कितनी धीरे जाते हो, जब तक रुकते नहीं।'},
    {'english': 'The secret of getting ahead is getting started.', 'hindi': 'आगे बढ़ने का रहस्य है शुरुआत करना।'},
  ];
}