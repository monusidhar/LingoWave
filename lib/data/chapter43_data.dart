import '../models/lesson_model.dart';

class Chapter43Data {
  static ChapterModel get chapter => ChapterModel(
        id: 43,
        title: 'Idioms & Proverbs',
        titleHindi: 'मुहावरे और कहावतें',
        description: '59 Idioms + 25 Proverbs for Fluent English',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Introduction',
              titleHindi: 'परिचय',
              emoji: '💡',
              type: LessonType.ch43Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Idioms — Part A (1–20)',
              titleHindi: 'मुहावरे — भाग A',
              emoji: '📖',
              type: LessonType.ch43IdiomsA,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 3,
              title: 'Idioms — Part B (21–40)',
              titleHindi: 'मुहावरे — भाग B',
              emoji: '📗',
              type: LessonType.ch43IdiomsB,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 4,
              title: 'Idioms — Part C (41–59)',
              titleHindi: 'मुहावरे — भाग C',
              emoji: '📘',
              type: LessonType.ch43IdiomsC,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 5,
              title: 'Proverbs (1–25)',
              titleHindi: 'कहावतें',
              emoji: '🌿',
              type: LessonType.ch43Proverbs,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 6,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch43ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch43Intro:        return introQuestions;
      case LessonType.ch43IdiomsA:      return idiomsAQuestions;
      case LessonType.ch43IdiomsB:      return idiomsBQuestions;
      case LessonType.ch43IdiomsC:      return idiomsCQuestions;
      case LessonType.ch43Proverbs:     return proverbsQuestions;
      case LessonType.ch43ChapterQuiz:  return chapterFinalQuestions;
      default:                          return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Idioms (मुहावरे) क्या होते हैं?',
      questionEn: 'What are Idioms?',
      options: [
        'Grammar rules जो हम सीखते हैं।',
        'ऐसे phrases जिनका literal meaning अलग और actual meaning अलग होता है।',
        'नये शब्द जो dictionary में हैं।',
        'Proverbs का दूसरा नाम।',
      ],
      correctIndex: 1,
      explanation: 'Idioms = fixed phrases जिनका अर्थ शब्दों के सीधे मतलब से अलग होता है। जैसे "break the ice" का मतलब चुप्पी तोड़ना है, बर्फ तोड़ना नहीं।',
    ),
    QuizQuestion(
      questionHi: '"Abide by" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Abide by"?',
      options: ['अलग रहना', 'पालन करना', 'छोड़ देना', 'बदलना'],
      correctIndex: 1,
      explanation: '"Abide by" = पालन करना। जैसे: I always abide by the rules.',
    ),
    QuizQuestion(
      questionHi: '"By leaps and bounds" का अर्थ?',
      questionEn: 'Meaning of "By leaps and bounds"?',
      options: ['धीरे-धीरे', 'रुक-रुककर', 'बहुत तेजी से', 'बिना रुके'],
      correctIndex: 2,
      explanation: '"By leaps and bounds" = बहुत तेजी से। जैसे: India is growing by leaps and bounds.',
    ),
    QuizQuestion(
      questionHi: '"Break the ice" का अर्थ?',
      questionEn: 'Meaning of "Break the ice"?',
      options: [
        'बर्फ तोड़ना',
        'चुप्पी तोड़ना',
        'किसी से लड़ना',
        'कुछ खत्म करना',
      ],
      correctIndex: 1,
      explanation: '"Break the ice" = चुप्पी तोड़ना — uncomfortable silence को खत्म करना।',
    ),
    QuizQuestion(
      questionHi: '"A friend in need is a friend indeed." — यह किस category में आता है?',
      questionEn: '"A friend in need is a friend indeed." — this is a:',
      options: ['Idiom', 'Proverb (कहावत)', 'Quote', 'Grammar rule'],
      correctIndex: 1,
      explanation: 'यह एक Proverb (कहावत) है — एक सीख देने वाला वाक्य।',
    ),
  ];

  // ─── L2: Idioms A Quiz (1–20) ──────────────────────────────────────────────
  static const List<QuizQuestion> idiomsAQuestions = [
    QuizQuestion(
      questionHi: '"Above board" का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Above board"?',
      options: ['ऊपर की तरफ', 'सच्चा व ईमानदार', 'प्रसिद्ध', 'बोर्ड के ऊपर'],
      correctIndex: 1,
      explanation: '"Above board" = सच्चा व ईमानदार। जैसे: He is above board in the employee selection.',
    ),
    QuizQuestion(
      questionHi: '"Black sheep" का अर्थ?',
      questionEn: 'Meaning of "Black sheep"?',
      options: ['काली भेड़', 'कलंक / परिवार की बदनामी', 'काला घोड़ा', 'बुरा व्यक्ति'],
      correctIndex: 1,
      explanation: '"Black sheep" = कलंक — वो व्यक्ति जो परिवार/group की बदनामी का कारण हो।',
    ),
    QuizQuestion(
      questionHi: '"At a loss" का अर्थ?',
      questionEn: 'Meaning of "At a loss"?',
      options: ['घाटे में', 'असमंजस में होना', 'थका हुआ', 'खो जाना'],
      correctIndex: 1,
      explanation: '"At a loss" = असमंजस में होना — क्या करें समझ न आना।',
    ),
    QuizQuestion(
      questionHi: '"Bury the hatchet" का अर्थ?',
      questionEn: 'Meaning of "Bury the hatchet"?',
      options: [
        'कुल्हाड़ी छुपाना',
        'विवाद को खत्म कर देना',
        'किसी से लड़ना',
        'कुछ ढूँढना',
      ],
      correctIndex: 1,
      explanation: '"Bury the hatchet" = विवाद/झगड़ा खत्म करना और शांति बनाना।',
    ),
    QuizQuestion(
      questionHi: '"Capital punishment" का अर्थ?',
      questionEn: 'Meaning of "Capital punishment"?',
      options: ['राजधानी की सजा', 'मृत्युदंड', 'जेल', 'जुर्माना'],
      correctIndex: 1,
      explanation: '"Capital punishment" = मृत्युदंड (death penalty)।',
    ),
  ];

  // ─── L3: Idioms B Quiz (21–40) ─────────────────────────────────────────────
  static const List<QuizQuestion> idiomsBQuestions = [
    QuizQuestion(
      questionHi: '"Cut no ice" का अर्थ?',
      questionEn: 'Meaning of "Cut no ice"?',
      options: ['बर्फ काटना', 'कोई प्रभाव न पड़ना', 'कुछ न करना', 'चुप रहना'],
      correctIndex: 1,
      explanation: '"Cut no ice" = कोई असर/प्रभाव न पड़ना।',
    ),
    QuizQuestion(
      questionHi: '"Fall flat" का अर्थ?',
      questionEn: 'Meaning of "Fall flat"?',
      options: ['अचानक गिरना / असफल होना', 'समतल होना', 'धीरे जाना', 'थक जाना'],
      correctIndex: 0,
      explanation: '"Fall flat" = गिरना / असफल हो जाना — जैसे share market या कोई plan।',
    ),
    QuizQuestion(
      questionHi: '"To grease the palm" का अर्थ?',
      questionEn: 'Meaning of "To grease the palm"?',
      options: ['हाथ साफ करना', 'रिश्वत देना', 'मेहनत करना', 'दोस्त बनाना'],
      correctIndex: 1,
      explanation: '"Grease the palm" = रिश्वत देना (bribe)।',
    ),
    QuizQuestion(
      questionHi: '"Hard up" का अर्थ?',
      questionEn: 'Meaning of "Hard up"?',
      options: ['कठिन परिश्रम', 'पैसे की किल्लत / तंगी', 'ऊपर जाना', 'कठोर होना'],
      correctIndex: 1,
      explanation: '"Hard up" = पैसे की तंगी होना।',
    ),
    QuizQuestion(
      questionHi: '"In the guise of" का अर्थ?',
      questionEn: 'Meaning of "In the guise of"?',
      options: ['की वजह से', 'की याद में', 'वेष/भेष में', 'के साथ'],
      correctIndex: 2,
      explanation: '"In the guise of" = वेष/रूप में (disguised as)।',
    ),
  ];

  // ─── L4: Idioms C Quiz (41–59) ─────────────────────────────────────────────
  static const List<QuizQuestion> idiomsCQuestions = [
    QuizQuestion(
      questionHi: '"Point blank" का अर्थ?',
      questionEn: 'Meaning of "Point blank"?',
      options: ['बिंदु पर', 'बिना हिचकिचाहट के', 'सीधे निशाना', 'पास से'],
      correctIndex: 1,
      explanation: '"Point blank" = बिना हिचकिचाहट / सीधे मुँह पर।',
    ),
    QuizQuestion(
      questionHi: '"A bosom friend" का अर्थ?',
      questionEn: 'Meaning of "A bosom friend"?',
      options: ['पुराना दोस्त', 'खास/करीबी दोस्त', 'बचपन का दोस्त', 'दोस्त जो मदद करे'],
      correctIndex: 1,
      explanation: '"Bosom friend" = सबसे खास और करीबी दोस्त।',
    ),
    QuizQuestion(
      questionHi: '"In vain" का अर्थ?',
      questionEn: 'Meaning of "In vain"?',
      options: ['व्यर्थ / बेकार', 'घमंड से', 'ख़ुशी से', 'आसानी से'],
      correctIndex: 0,
      explanation: '"In vain" = निरर्थक / बेकार — जैसे: Our efforts went in vain.',
    ),
    QuizQuestion(
      questionHi: '"Look down upon" का अर्थ?',
      questionEn: 'Meaning of "Look down upon"?',
      options: ['नीचे देखना', 'नफरत करना / नीचा समझना', 'उदास होना', 'झुकना'],
      correctIndex: 1,
      explanation: '"Look down upon" = किसी को नीचा समझना / contempt करना।',
    ),
    QuizQuestion(
      questionHi: '"To win laurels" का अर्थ?',
      questionEn: 'Meaning of "To win laurels"?',
      options: ['पुरस्कार जीतना', 'मशहूर हो जाना', 'competition जीतना', 'A और B दोनों'],
      correctIndex: 3,
      explanation: '"Win laurels" = fame/recognition पाना, मशहूर होना।',
    ),
  ];

  // ─── L5: Proverbs Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> proverbsQuestions = [
    QuizQuestion(
      questionHi: '"A burnt child dreads the fire." — हिंदी कहावत?',
      questionEn: 'Equivalent Hindi proverb?',
      options: [
        'लोहा लोहे को काटता है।',
        'दूध का जला छाछ भी फूँक-फूँक कर पीता है।',
        'अन्त भला तो सब भला।',
        'बूँद बूँद से घड़ा भरता है।',
      ],
      correctIndex: 1,
      explanation: '"Burnt child dreads fire" = एक बार जो जल जाता है वो आगे से सावधान रहता है।',
    ),
    QuizQuestion(
      questionHi: '"All that glitters is not gold." — हिंदी?',
      questionEn: 'Hindi equivalent?',
      options: [
        'सोना खूबसूरत होता है।',
        'हर चमकने वाली चीज़ सोना नहीं होती।',
        'सोना बहुत कीमती है।',
        'चाँदनी चार दिन की।',
      ],
      correctIndex: 1,
      explanation: 'दिखावे पर मत जाओ — हर चमकदार चीज़ valuable नहीं होती।',
    ),
    QuizQuestion(
      questionHi: '"Barking dogs seldom bite." — हिंदी?',
      questionEn: 'Hindi equivalent?',
      options: [
        'कुत्ते भौंकते हैं।',
        'जो दिखते हैं वो होते नहीं।',
        'भौंकने वाले कुत्ते काटते नहीं।',
        'शेर कभी भौंकता नहीं।',
      ],
      correctIndex: 2,
      explanation: 'जो बहुत बड़बड़ाते हैं वो usually कुछ करते नहीं।',
    ),
    QuizQuestion(
      questionHi: '"Many a little makes a mickle." — हिंदी?',
      questionEn: 'Hindi equivalent?',
      options: [
        'थोड़ा-थोड़ा काफी होता है।',
        'बूँद बूँद से घड़ा भरता है।',
        'कम में जियो।',
        'ज़्यादा मत खर्चो।',
      ],
      correctIndex: 1,
      explanation: '"Many a little makes a mickle" = छोटे-छोटे प्रयास मिलकर बड़ा result देते हैं।',
    ),
    QuizQuestion(
      questionHi: '"Limit your spendings to your earnings." — हिंदी कहावत?',
      questionEn: 'Hindi equivalent proverb?',
      options: [
        'पैसे बचाओ।',
        'जितनी लम्बी चादर हो उतने ही पैर फैलाने चाहिए।',
        'कम खर्चो ज़्यादा कमाओ।',
        'खर्च कम income ज़्यादा।',
      ],
      correctIndex: 1,
      explanation: 'अपनी कमाई के अनुसार खर्च करो — ज़्यादा मत खर्चो।',
    ),
  ];

  // ─── Chapter Final Quiz ────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: '"Close shave" का अर्थ?',
      questionEn: 'Meaning of "Close shave"?',
      options: ['दाढ़ी बनाना', 'बाल-बाल बच निकलना', 'करीबी दोस्त', 'खतरे में होना'],
      correctIndex: 1,
      explanation: '"Close shave" = बाल-बाल बच निकलना — जैसे accident से बचना।',
    ),
    QuizQuestion(
      questionHi: '"For good" का अर्थ?',
      questionEn: 'Meaning of "For good"?',
      options: ['अच्छे के लिए', 'हमेशा के लिए', 'कुछ समय के लिए', 'जल्दी'],
      correctIndex: 1,
      explanation: '"For good" = हमेशा के लिए (permanently)। जैसे: He left the city for good.',
    ),
    QuizQuestion(
      questionHi: '"A rough diamond" का अर्थ?',
      questionEn: 'Meaning of "A rough diamond"?',
      options: [
        'कच्चा हीरा',
        'अनपढ़ लेकिन गुणी व्यक्ति',
        'कठिन इंसान',
        'खुरदुरा हीरा',
      ],
      correctIndex: 1,
      explanation: '"Rough diamond" = वो व्यक्ति जो शिक्षित नहीं पर बहुत talented/गुणी है।',
    ),
    QuizQuestion(
      questionHi: '"A rotten apple injures its companions." — हिंदी?',
      questionEn: 'Hindi equivalent?',
      options: [
        'सड़ा सेब मत खाओ।',
        'एक गन्दी मछली सारे तालाब को गन्दा कर देती है।',
        'संगति बुरी है।',
        'बुरे लोगों से दूर रहो।',
      ],
      correctIndex: 1,
      explanation: 'एक बुरा साथी पूरे group को बर्बाद कर देता है।',
    ),
    QuizQuestion(
      questionHi: '"Hale & hearty" का अर्थ?',
      questionEn: 'Meaning of "Hale and hearty"?',
      options: ['खुश और उत्साहित', 'पूरी तरह स्वस्थ', 'मज़बूत और ताकतवर', 'A और B दोनों'],
      correctIndex: 1,
      explanation: '"Hale and hearty" = पूरी तरह स्वस्थ और तंदुरुस्त।',
    ),
    QuizQuestion(
      questionHi: '"In a nut shell" का अर्थ?',
      questionEn: 'Meaning of "In a nut shell"?',
      options: ['अखरोट में', 'सारांश में / अन्त में', 'छोटे में', 'शुरू में'],
      correctIndex: 1,
      explanation: '"In a nut shell" = सारांश में / संक्षेप में।',
    ),
    QuizQuestion(
      questionHi: '"Tit for tat" — हिंदी कहावत?',
      questionEn: 'Hindi equivalent of "Tit for tat"?',
      options: ['आँख के बदले आँख।', 'जैसे को तैसा।', 'बदला लेना।', 'लड़ाई करना।'],
      correctIndex: 1,
      explanation: '"Tit for tat" = जैसे को तैसा — बराबर का जवाब देना।',
    ),
    QuizQuestion(
      questionHi: '"Nook and corner" का अर्थ?',
      questionEn: 'Meaning of "Nook and corner"?',
      options: ['कोना', 'कोना-कोना / चप्पा-चप्पा', 'कहीं कहीं', 'एक कोना'],
      correctIndex: 1,
      explanation: '"Nook and corner" = हर जगह / कोना-कोना।',
    ),
    QuizQuestion(
      questionHi: '"A man is known by the company he keeps." — अर्थ?',
      questionEn: 'Meaning?',
      options: [
        'अच्छी company में रहो।',
        'मनुष्य अपनी संगति से पहचाना जाता है।',
        'दोस्त ध्यान से चुनो।',
        'B और C दोनों।',
      ],
      correctIndex: 3,
      explanation: 'आप जैसी संगति में रहते हो, वैसे ही पहचाने जाते हो — इसलिए संगति सोच-समझकर चुनो।',
    ),
    QuizQuestion(
      questionHi: '"Let bygones be bygones." — अर्थ?',
      questionEn: 'Meaning?',
      options: [
        'पुरानी बातें याद रखो।',
        'जो बीत गया सो बीत गया — भूल जाओ।',
        'पुराने दोस्तों से मिलो।',
        'कल की चिन्ता करो।',
      ],
      correctIndex: 1,
      explanation: '"Let bygones be bygones" = पुरानी बातें भूल जाओ और आगे बढ़ो।',
    ),
  ];

  // ─── Idioms Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> idiomsPartA = [
    {'n': '1',  'idiom': 'Abide by',                   'hindi': 'पालन करना',                    'example': 'I always abide by the rules.'},
    {'n': '2',  'idiom': 'Above board',                'hindi': 'सच्चा व ईमानदार',              'example': 'He is above board in the employee selection.'},
    {'n': '3',  'idiom': 'An axe to grind',            'hindi': 'स्वार्थी',                     'example': 'Ram has his own axe to grind.'},
    {'n': '4',  'idiom': 'Apple pie order',            'hindi': 'सलीके से, अच्छी तरीके से',    'example': 'Everything in this room is in apple pie order.'},
    {'n': '5',  'idiom': 'At a loss',                  'hindi': 'असमंजस में होना',              'example': 'I am at a loss due to having so many things mixed up.'},
    {'n': '6',  'idiom': 'At finger tips',             'hindi': 'एक्सपर्ट होना',               'example': 'English grammar rules are at my finger tips.'},
    {'n': '7',  'idiom': 'Black sheep',                'hindi': 'कलंक',                         'example': 'He is a black sheep for his family.'},
    {'n': '8',  'idiom': 'Blue blood',                 'hindi': 'शाही खून',                    'example': 'I have a blue blood.'},
    {'n': '9',  'idiom': 'Break in',                   'hindi': 'चोरी के उद्देश्य से घुसना',   'example': 'He broke in the house.'},
    {'n': '10', 'idiom': 'Burning Question',           'hindi': 'महत्वपूर्ण प्रश्न',           'example': 'It is a burning question of the day.'},
    {'n': '11', 'idiom': 'By leaps and bounds',        'hindi': 'बहुत तेजी से',                'example': 'I am preparing this book by leaps and bounds.'},
    {'n': '12', 'idiom': 'By virtue of',              'hindi': 'के कारण',                     'example': 'By virtue of his power, the guard didn\'t stop him.'},
    {'n': '13', 'idiom': 'To bank upon',              'hindi': 'निर्भर होना',                  'example': 'I bank upon my Dad for everything.'},
    {'n': '14', 'idiom': 'To bring to book',          'hindi': 'खतरा मोल लेना',              'example': 'His name is brought to book now.'},
    {'n': '15', 'idiom': 'Burn the candle in both ends', 'hindi': 'सब कुछ नष्ट कर देना',    'example': 'He had lots of money but burnt the candle in both ends.'},
    {'n': '16', 'idiom': 'Bury the hatchet',          'hindi': 'विवाद को खत्म कर देना',      'example': 'I have buried the hatchet.'},
    {'n': '17', 'idiom': 'Capital punishment',         'hindi': 'मृत्युदंड',                   'example': 'That terrorist has got capital punishment.'},
    {'n': '18', 'idiom': 'Close shave',               'hindi': 'बाल-बाल बच निकलना',          'example': 'It was a close shave; otherwise I would have died.'},
    {'n': '19', 'idiom': 'To catch a tarter',         'hindi': 'शेर को सवाशेर मिलना',        'example': 'You will also catch a tarter some or the other day.'},
    {'n': '20', 'idiom': 'Break the ice',             'hindi': 'चुप्पी तोड़ना',               'example': 'I asked a question to Ram and broke the ice.'},
  ];

  static const List<Map<String, String>> idiomsPartB = [
    {'n': '21', 'idiom': 'Cut no ice',                'hindi': 'कोई प्रभाव न पड़ना',          'example': 'Your flattery can\'t cut any ice as he is a professional.'},
    {'n': '22', 'idiom': 'A dead letter',             'hindi': 'प्रयोग होना बन्द हो जाना',   'example': 'Radio is a dead letter now.'},
    {'n': '23', 'idiom': 'Dark horse',                'hindi': 'अज्ञात प्रतियोगी',            'example': 'He might turn out to be a dark horse so be cautious.'},
    {'n': '24', 'idiom': 'Eye wash',                  'hindi': 'धोखा देना',                   'example': 'He washed my eyes and escaped in the guise of an old man.'},
    {'n': '25', 'idiom': 'By fits & starts',          'hindi': 'अनियमित तरीके से',            'example': 'The project is being prepared by fits and starts.'},
    {'n': '26', 'idiom': 'Fall flat',                 'hindi': 'टूटना, गिरना / असफल होना',   'example': 'Share market has suddenly fallen flat.'},
    {'n': '27', 'idiom': 'For good',                  'hindi': 'हमेशा के लिए',               'example': 'You can take this book for good.'},
    {'n': '28', 'idiom': 'To grease the palm',        'hindi': 'रिश्वत देना',                 'example': 'I greased the palm of that waiter.'},
    {'n': '29', 'idiom': 'Hale & hearty',             'hindi': 'स्वस्थ',                      'example': 'All members of my family are hale and hearty.'},
    {'n': '30', 'idiom': 'Hard up',                   'hindi': 'पैसे की किल्लत',             'example': 'I am hard up at this time.'},
    {'n': '31', 'idiom': 'In a nut shell',            'hindi': 'अन्त में, सारांश में',        'example': 'In a nut shell, corruption is the root cause of slowdown.'},
    {'n': '32', 'idiom': 'In the guise of',           'hindi': 'वेष में',                     'example': 'He escaped in the guise of a politician.'},
    {'n': '33', 'idiom': 'In vogue',                  'hindi': 'फैशन में',                   'example': 'This kind of shirt is in vogue.'},
    {'n': '34', 'idiom': 'Look blue',                 'hindi': 'नर्वस दिखना',                'example': 'Don\'t look blue. Be confident.'},
    {'n': '35', 'idiom': 'Lead a cat & dog life',     'hindi': 'झगड़ालू जिन्दगी',            'example': 'I don\'t want to lead a cat & dog life.'},
    {'n': '36', 'idiom': 'Let bygones be bygones',    'hindi': 'जो बीत गया सो बीत गया',      'example': 'Forget the past. Let bygones be bygones.'},
    {'n': '37', 'idiom': 'Man of street',             'hindi': 'आम आदमी',                    'example': 'We are men of street so we shouldn\'t forget our limitations.'},
    {'n': '38', 'idiom': 'Man of letters',            'hindi': 'विद्वान',                     'example': 'Pt. Nehru was a man of letters.'},
    {'n': '39', 'idiom': 'Make a mountain of mole hill', 'hindi': 'बात को बढ़ा चढ़ाकर बताना', 'example': 'Whatever you appreciate, you make a mountain of mole hill.'},
    {'n': '40', 'idiom': 'Nook and corner',           'hindi': 'कोना-कोना, चप्पा-चप्पा',     'example': 'Betel sellers are at every nook and corner these days.'},
  ];

  static const List<Map<String, String>> idiomsPartC = [
    {'n': '41', 'idiom': 'Once for all',              'hindi': 'अन्त में',                    'example': 'Once for all, I conclude "Love is something without which we are incomplete."'},
    {'n': '42', 'idiom': 'Point blank',               'hindi': 'बिना हिचकिचाहट के',          'example': 'He replied to me point blank.'},
    {'n': '43', 'idiom': 'A rough diamond',           'hindi': 'अनपढ़ लेकिन गुणी',           'example': 'He is a rough diamond — illiterate but reached great amplitude in business.'},
    {'n': '44', 'idiom': 'Red tapism',               'hindi': 'बहुत सारी औपचारिकता',        'example': 'The problem with government departments is too much red tapism.'},
    {'n': '45', 'idiom': 'To run down',              'hindi': 'तबियत खराब होना',             'example': 'He is run down in health these days.'},
    {'n': '46', 'idiom': 'A sharp tongue',           'hindi': 'कड़वा बोलने वाला',            'example': 'He speaks only truth — that\'s why he is said to have a sharp tongue.'},
    {'n': '47', 'idiom': 'A stumbling block',        'hindi': 'रोड़ा, रास्ते का काँटा',      'example': 'Financial hard up is a stumbling block for us.'},
    {'n': '48', 'idiom': 'Sink differences',         'hindi': 'मनमुटाव खत्म कर देना',       'example': 'I have sunk differences a long back.'},
    {'n': '49', 'idiom': 'To split hairs',           'hindi': 'बारीकी तक घुसना',             'example': 'Don\'t split hairs of this matter.'},
    {'n': '50', 'idiom': 'To stand by',              'hindi': 'साथ देना',                   'example': 'I will always stand by you; be it happy time or grief.'},
    {'n': '51', 'idiom': 'A white lie',              'hindi': 'झूठ जो नुकसान न पहुँचाये',   'example': 'Sometimes in life, you have to tell a white lie.'},
    {'n': '52', 'idiom': 'To win laurels',           'hindi': 'फेमस हो जाना',               'example': 'Rahul has won laurels due to this social welfare organization.'},
    {'n': '53', 'idiom': 'To wind up',               'hindi': 'समाप्त करना',                'example': 'I am going to wind up the discussion now.'},
    {'n': '54', 'idiom': 'A bosom friend',           'hindi': 'खास दोस्त',                  'example': 'He has been a bosom friend of mine since childhood.'},
    {'n': '55', 'idiom': 'En route',                 'hindi': 'रास्ते में',                 'example': 'Dehradun is en route when you go to Shimla from Delhi.'},
    {'n': '56', 'idiom': 'Hither and thither',       'hindi': 'यहाँ वहाँ',                  'example': 'Why are your clothes lying hither and thither?'},
    {'n': '57', 'idiom': 'In vain',                  'hindi': 'निरर्थक, बेकार',             'example': 'Our endeavor will not go in vain.'},
    {'n': '58', 'idiom': 'Rank and file',            'hindi': 'आम आदमी',                    'example': 'Luxury is mostly not for rank and file people.'},
    {'n': '59', 'idiom': 'Look down upon',           'hindi': 'नफरत करना / नीचा समझना',     'example': 'I never look down upon the poor.'},
  ];

  // ─── Proverbs Data ─────────────────────────────────────────────────────────

  static const List<Map<String, String>> proverbs = [
    {'n': '1',  'english': 'A bad man is better than a bad name.',              'hindi': 'बद अच्छा बदनाम बुरा।'},
    {'n': '2',  'english': 'A burnt child dreads the fire.',                    'hindi': 'दूध का जला छाछ भी फूँक-फूँक कर पीता है।'},
    {'n': '3',  'english': 'A diamond cuts a diamond.',                         'hindi': 'लोहा लोहे को काटता है।'},
    {'n': '4',  'english': 'A friend in need is a friend indeed.',              'hindi': 'जरूरत में जो काम आये, वही असली दोस्त है।'},
    {'n': '5',  'english': 'A honey tongue, a heart of gale.',                  'hindi': 'मधुर वाणी, दगाबाज की निशानी।'},
    {'n': '6',  'english': 'A little knowledge is a dangerous thing.',          'hindi': 'अधूरा ज्ञान खतरनाक होता है।'},
    {'n': '7',  'english': 'A man is known by the company he keeps.',           'hindi': 'मनुष्य अपनी संगति से पहचाना जाता है।'},
    {'n': '8',  'english': "A nine day's wonder.",                              'hindi': 'चार दिन की चाँदनी।'},
    {'n': '9',  'english': 'A rotten apple injures its companions.',            'hindi': 'एक गन्दी मछली सारे तालाब को गन्दा कर देती है।'},
    {'n': '10', 'english': 'All is well that ends well.',                       'hindi': 'अन्त भला तो सब भला।'},
    {'n': '11', 'english': 'All that glitters is not gold.',                    'hindi': 'हर चमकने वाली चीज़ सोना नहीं होती।'},
    {'n': '12', 'english': 'Barking dogs seldom bite.',                         'hindi': 'भौंकने वाले कुत्ते काटते नहीं।'},
    {'n': '13', 'english': 'Beauty needs no ornaments.',                        'hindi': 'सौन्दर्य को आभूषणों की जरूरत नहीं।'},
    {'n': '14', 'english': 'Beggars are not choosers.',                         'hindi': 'दान की बछिया के दाँत नहीं गिने जाते।'},
    {'n': '15', 'english': 'Beauty is in the eyes of beholder.',                'hindi': 'खूबसूरती देखने वाले की आँखों में होती है।'},
    {'n': '16', 'english': 'Between two stools, we come to the ground.',        'hindi': 'धोबी का कुत्ता घर का न घाट का।'},
    {'n': '17', 'english': 'Fool to others, to himself a sage.',                'hindi': 'अपने मुँह मियाँ मिट्टू बनना।'},
    {'n': '18', 'english': 'Let bygones be bygones.',                           'hindi': 'जो बीत गया सो बीत गया।'},
    {'n': '19', 'english': 'Many a little makes a mickle.',                     'hindi': 'बूँद बूँद से घड़ा भरता है।'},
    {'n': '20', 'english': 'Tit for tat / word for word / measure for measure.','hindi': 'जैसे को तैसा।'},
    {'n': '21', 'english': 'To make a mountain of a mole hill.',                'hindi': 'राई का पहाड़ बनाना।'},
    {'n': '22', 'english': 'Too much courtesy, too much craft.',                'hindi': 'मधुर वाणी, दगाबाज की निशानी।'},
    {'n': '23', 'english': 'Prosperity gains friends and Adversity tries them.','hindi': 'अमीरी दोस्त बनाती है और गरीबी उन्हें परखती है।'},
    {'n': '24', 'english': 'Poverty breeds contempt. / Poverty breeds strife.', 'hindi': 'गरीबी झगड़े की जड़ होती है।'},
    {'n': '25', 'english': 'Limit your spendings to your earnings.',            'hindi': 'जितनी लम्बी चादर हो उतने ही पैर फैलाने चाहिए।'},
  ];

  // Category groups for quick reference display
  static const List<Map<String, dynamic>> categories = [
    {
      'label': 'Positive Traits & Success',
      'labelHindi': 'सकारात्मक और सफलता',
      'emoji': '🌟',
      'idioms': ['Above board', 'At finger tips', 'Hale & hearty', 'Man of letters', 'To win laurels'],
    },
    {
      'label': 'Negative Traits',
      'labelHindi': 'नकारात्मक गुण',
      'emoji': '⚠️',
      'idioms': ['An axe to grind', 'Black sheep', 'A sharp tongue', 'Look down upon', 'Lead a cat & dog life'],
    },
    {
      'label': 'Danger & Risk',
      'labelHindi': 'खतरा और जोखिम',
      'emoji': '⚡',
      'idioms': ['Close shave', 'Capital punishment', 'To bring to book', 'A stumbling block'],
    },
    {
      'label': 'Deception & Dishonesty',
      'labelHindi': 'धोखा और बेईमानी',
      'emoji': '🎭',
      'idioms': ['Eye wash', 'To grease the palm', 'A white lie', 'In the guise of'],
    },
    {
      'label': 'Relationships',
      'labelHindi': 'रिश्ते',
      'emoji': '🤝',
      'idioms': ['A bosom friend', 'Bury the hatchet', 'Sink differences', 'To stand by', 'Let bygones be bygones'],
    },
    {
      'label': 'Speed & Progress',
      'labelHindi': 'गति और प्रगति',
      'emoji': '🚀',
      'idioms': ['By leaps and bounds', 'By fits & starts', 'Once for all'],
    },
    {
      'label': 'Money & Difficulty',
      'labelHindi': 'पैसा और मुश्किल',
      'emoji': '💰',
      'idioms': ['Hard up', 'At a loss', 'To run down', 'Red tapism'],
    },
  ];
}