import '../models/lesson_model.dart';

/// Chapter 14 — Prepositions (सम्बन्ध सूचक अव्यय)
class Chapter14Data {

  static ChapterModel get chapter => ChapterModel(
        id: 14, title: 'Prepositions', titleHindi: 'सम्बन्ध सूचक अव्यय',
        description: 'From, In, At, By, On, Through & 40+ more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What is a Preposition?', titleHindi: 'Preposition क्या है?',
              emoji: '🔗', type: LessonType.ch14Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'From / Off / Since / For', titleHindi: 'From / Off / Since / For',
              emoji: '📌', type: LessonType.ch14Part1, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'In / Into / Before / After', titleHindi: 'In / Into / Before / After',
              emoji: '📌', type: LessonType.ch14Part2, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'By / With / At', titleHindi: 'By / With / At',
              emoji: '📌', type: LessonType.ch14Part3, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Through / Beyond / Via / Opposite / Above', titleHindi: 'Through / Beyond / Via / Opposite / Above',
              emoji: '📌', type: LessonType.ch14Part4, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Under / Below / On / Between / Among', titleHindi: 'Under / Below / On / Between / Among',
              emoji: '📌', type: LessonType.ch14Part5, status: LessonStatus.inProgress),
          LessonModel(id: 7, title: 'Over / Within / Than / Without / Around & more', titleHindi: 'Over / Within + और भी',
              emoji: '📌', type: LessonType.ch14Part6, status: LessonStatus.inProgress),
          LessonModel(id: 8, title: 'Except / During / Till / Across & more', titleHindi: 'Except / During / Till / Across + और भी',
              emoji: '📌', type: LessonType.ch14Part7, status: LessonStatus.inProgress),
          LessonModel(id: 9, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch14ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch14Intro:       return introQuestions;
      case LessonType.ch14Part1:       return part1Questions;
      case LessonType.ch14Part2:       return part2Questions;
      case LessonType.ch14Part3:       return part3Questions;
      case LessonType.ch14Part4:       return part4Questions;
      case LessonType.ch14Part5:       return part5Questions;
      case LessonType.ch14Part6:       return part6Questions;
      case LessonType.ch14Part7:       return part7Questions;
      case LessonType.ch14ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ── Quizzes ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(questionEn: 'What is a Preposition?', questionHi: 'Preposition किसे कहते हैं?',
      options: ['Noun की विशेषता बताने वाला शब्द', 'Noun/Pronoun और वाक्य के दूसरे भाग के सम्बन्ध को दर्शाने वाला शब्द', 'Verb की विशेषता बताने वाला शब्द', 'दो वाक्यों को जोड़ने वाला शब्द'],
      correctIndex: 1, explanation: 'Preposition = Noun/Pronoun और वाक्य के दूसरे भाग के बीच सम्बन्ध दर्शाता है।'),
    QuizQuestion(questionEn: '"I am coming from Delhi." — Preposition is ___.', questionHi: '"I am coming from Delhi." — Preposition कौन सा है?',
      options: ['Delhi', 'coming', 'from', 'am'], correctIndex: 2,
      explanation: '"From" Preposition है। "Delhi" इसका Object है।'),
    QuizQuestion(questionEn: '"Ram depends on you." — Object of preposition is ___.', questionHi: '"Ram depends on you." — Preposition का Object कौन सा है?',
      options: ['Ram', 'on', 'depends', 'you'], correctIndex: 3,
      explanation: '"On" Preposition है और "you" इसका Object है।'),
    QuizQuestion(questionEn: 'A Preposition is generally placed ___.', questionHi: 'Preposition सामान्यतः कहाँ रखा जाता है?',
      options: ['Sentence के अंत में', 'Verb के बाद', 'Noun/Pronoun से पहले', 'Verb से पहले'],
      correctIndex: 2, explanation: 'Preposition आमतौर पर Noun या Pronoun से पहले रखा जाता है।'),
    QuizQuestion(questionEn: 'The Noun/Pronoun used with a Preposition is called its ___.', questionHi: 'Preposition के साथ प्रयुक्त Noun/Pronoun को उसका ___ कहते हैं।',
      options: ['Subject', 'Verb', 'Object', 'Complement'], correctIndex: 2,
      explanation: 'Preposition के साथ प्रयुक्त Noun/Pronoun = Object of the Preposition।'),
  ];

  static const List<QuizQuestion> part1Questions = [
    QuizQuestion(questionEn: '"I am coming from Dehradun." — "from" means ___.', questionHi: '"from" यहाँ क्या बताता है?',
      options: ['समय से', 'किसी जगह से', 'किसी के द्वारा', 'के लिए'],
      correctIndex: 1, explanation: '"From" = किसी जगह से। "From Dehradun" = देहरादून से।'),
    QuizQuestion(questionEn: '"Monkey jumped off the tree." — "off" means ___.', questionHi: '"off" का अर्थ यहाँ?',
      options: ['ऊपर', 'के लिए', 'सतह से अलग होना', 'के पास'],
      correctIndex: 2, explanation: '"Off" = किसी सतह को छोड़ना। बन्दर पेड़ की सतह से कूदा।'),
    QuizQuestion(questionEn: '"I have been working since morning." — "since" is used with ___.', questionHi: '"since" किसके साथ प्रयोग होता है?',
      options: ['समय की अवधि (duration)', 'निश्चित समय (point of time) + continuous form', 'किसी जगह', 'exchange'],
      correctIndex: 1, explanation: '"Since" = निश्चित समय के साथ जब वाक्य में "रहा/रही/रहे" हो (continuous form)।'),
    QuizQuestion(questionEn: '"I have been studying for 2 hours." — "for" means ___.', questionHi: '"I have been studying for 2 hours." — "for" यहाँ क्या बताता है?',
      options: ['निश्चित समय से', 'समय की अवधि से', 'के लिए', 'के बदले'],
      correctIndex: 1, explanation: '"For" = समय की अवधि के साथ (duration) — 2 hours, many days, a long time etc.'),
    QuizQuestion(questionEn: '"He bought a pen for Rs. 5." — "for" means ___.', questionHi: '"for" यहाँ क्या बताता है?',
      options: ['के लिए (purpose)', 'के बदले (exchange)', 'समय की अवधि', 'निश्चित समय'],
      correctIndex: 1, explanation: '"For" = के बदले (exchange) — 5 रु के बदले पैन लिया।'),
  ];

  static const List<QuizQuestion> part2Questions = [
    QuizQuestion(questionEn: '"I was born in January." — "in" with month means ___.', questionHi: '"in January" — "in" यहाँ क्या बताता है?',
      options: ['छोटी जगह', 'समय के साथ — महीने में', 'के अन्दर', 'गतिशील अवस्था'],
      correctIndex: 1, explanation: '"In" = समय के साथ — महीने, साल, season, morning/evening के साथ।'),
    QuizQuestion(questionEn: '"I live in Delhi." — "in" with Delhi means ___.', questionHi: '"in Delhi" — "in" यहाँ क्या बताता है?',
      options: ['छोटी जगह', 'बड़ी जगह — शहर/देश', 'किसी वस्तु के अन्दर', 'गतिशील'],
      correctIndex: 1, explanation: '"In" = बड़ी जगहों के साथ — country, city, town।'),
    QuizQuestion(questionEn: '"He is going into the room." — "into" vs "in"?', questionHi: '"into" और "in" में क्या फर्क है?',
      options: ['कोई फर्क नहीं', '"Into" गतिशील अवस्था (motion) के लिए', '"Into" static position के लिए', '"Into" समय के साथ'],
      correctIndex: 1, explanation: '"Into" = गतिशील अवस्था (motion) — अन्दर घुसते वक्त। "In" = already inside।'),
    QuizQuestion(questionEn: '"I will come before you leave." — "before" means ___.', questionHi: '"before" यहाँ?',
      options: ['बाद में', 'पहले', 'सामने', 'पीछे'],
      correctIndex: 1, explanation: '"Before" = पहले। "Before you leave" = तुम्हारे जाने से पहले।'),
    QuizQuestion(questionEn: '"He was after that girl unnecessarily." — "after" means ___.', questionHi: '"after" यहाँ क्या बताता है?',
      options: ['बाद में', 'किसी के पीछे पड़ना', 'सामने', 'से पहले'],
      correctIndex: 1, explanation: '"After" = किसी के पीछे पड़ना (to chase/pursue persistently)।'),
  ];

  static const List<QuizQuestion> part3Questions = [
    QuizQuestion(questionEn: '"I was stopped by someone." — "by" in passive voice means ___.', questionHi: 'Passive voice में "by" का अर्थ?',
      options: ['से (vehicle)', 'तक (time)', 'द्वारा', 'बगल में'],
      correctIndex: 2, explanation: '"By" = द्वारा — Passive voice में agent बताता है।'),
    QuizQuestion(questionEn: '"I travelled by bus." — "by" means ___.', questionHi: '"by bus" में "by" का अर्थ?',
      options: ['द्वारा', 'किसी वाहन से यात्रा', 'तक (समय)', 'बगल में'],
      correctIndex: 1, explanation: '"By" = किसी वाहन से सफर करना — by bus, by car, by plane।'),
    QuizQuestion(questionEn: '"I will leave by 4 o\'clock." — "by" means ___.', questionHi: '"by 4 o\'clock" में "by" का अर्थ?',
      options: ['द्वारा', 'वाहन से', 'तक (Future में)', 'बगल में'],
      correctIndex: 2, explanation: '"By" = तक — समय के साथ, सिर्फ Future Indefinite Tense में।'),
    QuizQuestion(questionEn: '"I cut the cake with a knife." — "with" means ___.', questionHi: '"with a knife" में "with" का अर्थ?',
      options: ['साथ में', 'किसी चीज़ की मदद से (instrument)', 'के द्वारा', 'के बदले'],
      correctIndex: 1, explanation: '"With" = किसी चीज़ का प्रयोग करके — with a knife, with a pen।'),
    QuizQuestion(questionEn: '"I was born at 2." — "at" means ___.', questionHi: '"at 2" में "at" का अर्थ?',
      options: ['दोपहर में', 'छोटी जगह', 'निश्चित समय (point of time)', 'मूल्य'],
      correctIndex: 2, explanation: '"At" = निश्चित समय के साथ — at 2 o\'clock, at 10 AM।'),
  ];

  static const List<QuizQuestion> part4Questions = [
    QuizQuestion(questionEn: '"I can see through the glass." — "through" means ___.', questionHi: '"through" यहाँ?',
      options: ['के पास', 'के आर-पार देखना', 'के ऊपर', 'से बाहर'],
      correctIndex: 1, explanation: '"Through" = किसी चीज़ के आर-पार देखना — transparent object के पार।'),
    QuizQuestion(questionEn: '"There is a temple beyond this mountain." — "beyond" means ___.', questionHi: '"beyond" यहाँ?',
      options: ['के ऊपर', 'के नीचे', 'के पार (जो दिख न रहा हो)', 'के अन्दर'],
      correctIndex: 2, explanation: '"Beyond" = के पार — जो दिखाई न दे, बहुत दूर।'),
    QuizQuestion(questionEn: '"This train will go to Delhi via Kanpur." — "via" means ___.', questionHi: '"via" यहाँ?',
      options: ['तक', 'के पार', 'के रास्ते से / होते हुए', 'के द्वारा'],
      correctIndex: 2, explanation: '"Via" = के रास्ते से / होते हुए — via Kanpur = कानपुर से होते हुए।'),
    QuizQuestion(questionEn: '"My home is opposite your shop." — "opposite" means ___.', questionHi: '"opposite" यहाँ?',
      options: ['पीछे', 'ठीक सामने दूसरी तरफ', 'बगल में', 'आगे'],
      correctIndex: 1, explanation: '"Opposite" = ठीक सामने दूसरी तरफ। In front of / before / opposite = same meaning।'),
    QuizQuestion(questionEn: '"Only his eyes were above water." — "above" means ___.', questionHi: '"above water" में "above" का अर्थ?',
      options: ['नीचे', 'किसी सतह के स्तर से ऊपर', 'के अन्दर', 'के पास'],
      correctIndex: 1, explanation: '"Above" = किसी सतह के स्तर से ऊपर।'),
  ];

  static const List<QuizQuestion> part5Questions = [
    QuizQuestion(questionEn: '"Ram is hidden under the bed." — "under" means ___.', questionHi: '"under the bed" में "under" का अर्थ?',
      options: ['पूरी तरह छूते हुए नीचे', 'बिना पूरी तरह छुए नीचे', 'ऊपर', 'के पास'],
      correctIndex: 1, explanation: '"Under" = बिना पूरी तरह छुए नीचे (not fully touching)।'),
    QuizQuestion(questionEn: '"Her photograph is beneath my book." — use "beneath" because ___.', questionHi: '"beneath" क्यों?',
      options: ['वे दूर हैं', 'तस्वीर किताब को पूरी तरह छू रही है', 'गतिशील है', 'समय का प्रयोग'],
      correctIndex: 1, explanation: '"Beneath/Underneath" = पूरी तरह छूते हुए नीचे (fully touching)।'),
    QuizQuestion(questionEn: '"Pen is kept on the table." — "on" means ___.', questionHi: '"on the table" में "on"?',
      options: ['के अन्दर', 'छोटे object का बड़े object के ऊपर रखा होना', 'गतिशील', 'के पार'],
      correctIndex: 1, explanation: '"On" = एक बड़े object के ऊपर छोटे object का रखा होना।'),
    QuizQuestion(questionEn: '"She is sitting between Yash & Vaibhav." — "between" means ___.', questionHi: '"between" का प्रयोग?',
      options: ['दो से अधिक के बीच', 'दो के बीच में', 'चारों ओर', 'बाहर'],
      correctIndex: 1, explanation: '"Between" = सिर्फ दो के बीच में।'),
    QuizQuestion(questionEn: '"I was among 50 people." — "among" vs "amongst"?', questionHi: '"among" का प्रयोग कब?',
      options: ['दो के बीच', 'दो से अधिक — संख्या बताई गई हो', 'दो से अधिक — संख्या न बताई हो', 'एक के पास'],
      correctIndex: 1, explanation: '"Among" = दो से अधिक + संख्या बताई गई हो (50 people, 3 items)।'),
  ];

  static const List<QuizQuestion> part6Questions = [
    QuizQuestion(questionEn: '"There is a bridge over the river." — "over" means ___.', questionHi: '"over" यहाँ?',
      options: ['छूते हुए ऊपर', 'बिना छुए ऊपर (above without touch)', 'के नीचे', 'के अन्दर'],
      correctIndex: 1, explanation: '"Over" = बिना छुए ऊपर (above without touch)।'),
    QuizQuestion(questionEn: '"I will come within 5 minutes." — "within" means ___.', questionHi: '"within 5 minutes" में "within"?',
      options: ['5 मिनट के बाद', 'समयावधि के अन्दर', 'तक', 'से'],
      correctIndex: 1, explanation: '"Within" = समयावधि के अन्दर — 5 मिनट में (not after 5 minutes)।'),
    QuizQuestion(questionEn: '"I am better than you." — "than" is used for ___.', questionHi: '"than" का प्रयोग?',
      options: ['समय', 'जगह', 'तुलना (comparison)', 'साथ में'],
      correctIndex: 2, explanation: '"Than" = तुलना के लिए — better than, taller than।'),
    QuizQuestion(questionEn: '"I am nothing without you." — "without" means ___.', questionHi: '"without" का अर्थ?',
      options: ['साथ में', 'के बाद', 'बिना', 'के अन्दर'],
      correctIndex: 2, explanation: '"Without" = बिना।'),
    QuizQuestion(questionEn: '"The Earth is revolving around the Sun." — "around" means ___.', questionHi: '"around" यहाँ?',
      options: ['के अन्दर', 'चारों ओर', 'के पास', 'के पीछे'],
      correctIndex: 1, explanation: '"Around" = चारों ओर (covered in all directions)।'),
  ];

  static const List<QuizQuestion> part7Questions = [
    QuizQuestion(questionEn: '"This shop opens every day except Sunday." — "except" means ___.', questionHi: '"except" का अर्थ?',
      options: ['के साथ', 'के अलावा / को छोड़कर', 'के दौरान', 'तक'],
      correctIndex: 1, explanation: '"Except" = को छोड़कर / के अलावा।'),
    QuizQuestion(questionEn: '"I was in Delhi during vacations." — "during" means ___.', questionHi: '"during" का अर्थ?',
      options: ['के बाद', 'के दौरान (in a particular duration)', 'से', 'तक'],
      correctIndex: 1, explanation: '"During" = के दौरान — during vacations, during the break।'),
    QuizQuestion(questionEn: '"I will work till 9." — "till/until" means ___.', questionHi: '"till/until" का अर्थ?',
      options: ['से', 'के दौरान', 'तक', 'के लिए'],
      correctIndex: 2, explanation: '"Till/Until" = तक — 9 बजे तक, Monday तक।'),
    QuizQuestion(questionEn: '"I was behind Ram in the queue." — "behind" means ___.', questionHi: '"behind" का अर्थ?',
      options: ['आगे', 'सामने', 'पीछे', 'बगल में'],
      correctIndex: 2, explanation: '"Behind" = पीछे।'),
    QuizQuestion(questionEn: '"Can you swim across the river?" — "across" means ___.', questionHi: '"across" का अर्थ?',
      options: ['के साथ', 'के पार (किसी चीज़ के पार)', 'के अन्दर', 'के ऊपर'],
      correctIndex: 1, explanation: '"Across" = के पार — नदी/सड़क के उस पार।'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: '"I have been studying for 2 hours." — "for" means ___.',
      questionHi: '"for 2 hours" में "for"?', options: ['निश्चित समय','समय की अवधि','के लिए','के बदले'],
      correctIndex: 1, explanation: '"For" = duration of time — 2 hours, many days etc.'),
    QuizQuestion(questionEn: '"I have been working since morning." — "since" is used with ___.',
      questionHi: '"since morning" में "since"?', options: ['duration + continuous','point of time + continuous','place','purpose'],
      correctIndex: 1, explanation: '"Since" = point of time + continuous form (रहा/रही/रहे)।'),
    QuizQuestion(questionEn: '"I travelled by bus." — "by" means ___.',
      questionHi: '"by bus" में "by"?', options: ['द्वारा','वाहन से यात्रा','तक','बगल में'],
      correctIndex: 1, explanation: '"By" = किसी वाहन से यात्रा।'),
    QuizQuestion(questionEn: '"He is going into the room." — "into" vs "in"?',
      questionHi: '"into" का प्रयोग?', options: ['static position','motion — अन्दर घुसते वक्त','time','place'],
      correctIndex: 1, explanation: '"Into" = motion/movement — अन्दर घुसते वक्त।'),
    QuizQuestion(questionEn: '"Pen is kept on the table." — "on" means ___.',
      questionHi: '"on the table" में "on"?', options: ['के अन्दर','छोटे object का बड़े के ऊपर रखा होना','गतिशील','दो के बीच'],
      correctIndex: 1, explanation: '"On" = smaller object placed on bigger object।'),
    QuizQuestion(questionEn: '"I was born at 2." — "at" is used for ___.',
      questionHi: '"at 2" में "at"?', options: ['बड़ी जगह','समय की अवधि','निश्चित समय','के बदले'],
      correctIndex: 2, explanation: '"At" = exact/specific point of time।'),
    QuizQuestion(questionEn: '"She is sitting between Yash & Vaibhav." — "between" means ___.',
      questionHi: '"between" का प्रयोग?', options: ['दो से अधिक के बीच','दो के बीच','चारों ओर','के पास'],
      correctIndex: 1, explanation: '"Between" = exactly two के बीच।'),
    QuizQuestion(questionEn: '"I will come within 5 minutes." — "within" means ___.',
      questionHi: '"within" का अर्थ?', options: ['5 min बाद','समयावधि के अन्दर','तक','से'],
      correctIndex: 1, explanation: '"Within" = समयावधि के अन्दर।'),
    QuizQuestion(questionEn: '"This shop opens every day except Sunday." — "except" means ___.',
      questionHi: '"except" का अर्थ?', options: ['के साथ','को छोड़कर','के दौरान','तक'],
      correctIndex: 1, explanation: '"Except" = को छोड़कर।'),
    QuizQuestion(questionEn: '"The Earth revolves around the Sun." — "around" means ___.',
      questionHi: '"around" का अर्थ?', options: ['के अन्दर','के पास','चारों ओर','के पार'],
      correctIndex: 2, explanation: '"Around" = चारों ओर।'),
    QuizQuestion(questionEn: '"I was behind Ram in the queue." — "behind" means ___.',
      questionHi: '"behind" का अर्थ?', options: ['आगे','सामने','पीछे','बगल में'],
      correctIndex: 2, explanation: '"Behind" = पीछे।'),
    QuizQuestion(questionEn: '"I will work till 9." — "till/until" means ___.',
      questionHi: '"till/until" का अर्थ?', options: ['से','के दौरान','तक','के लिए'],
      correctIndex: 2, explanation: '"Till/Until" = तक।'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — All prepositions with usages and examples
  // ══════════════════════════════════════════════════════════════════════════

  /// Each preposition entry:
  /// 'prep' = preposition word, 'hindi' = Hindi meaning
  /// 'usages' = List of {'rule', 'ruleHi', 'examples': [{'en','hi'}]}

  static const List<Map<String, dynamic>> prepositionsPart1 = [
    {
      'prep': 'From', 'hindi': 'से',
      'usages': [
        {'rule': 'From some place', 'ruleHi': 'किसी जगह से', 'examples': [
          {'en': 'I am coming from Dehradun.', 'hi': 'मैं देहरादून से आ रहा हूँ।'},
          {'en': 'They came from park.', 'hi': 'वे पार्क से आये।'},
        ]},
        {'rule': 'Point of time', 'ruleHi': 'किसी समय से', 'examples': [
          {'en': 'I will work from tomorrow.', 'hi': 'मैं कल से काम करूँगा।'},
          {'en': 'Ram will work from 10 o\'clock.', 'hi': 'राम दस बजे से काम करेगा।'},
        ]},
        {'rule': 'From any source', 'ruleHi': 'किसी स्रोत से', 'examples': [
          {'en': 'I heard it from Ram.', 'hi': 'मैंने राम से ये सुना।'},
          {'en': 'I wrote it from the book.', 'hi': 'मैंने ये किताब से लिखा।'},
        ]},
      ]
    },
    {
      'prep': 'Off', 'hindi': 'से (सतह से अलग)',
      'usages': [
        {'rule': 'Leaving a surface', 'ruleHi': 'किसी सतह से अलग होना', 'note': 'Get off = वाहन से उतरना | Take off = हवाई जहाज़ का उड़ना', 'examples': [
          {'en': 'I picked the mobile off the bed.', 'hi': 'मैंने मोबाइल को बिस्तर से उठाया।'},
          {'en': 'I am wiping the dust off the screen.', 'hi': 'मैं स्क्रीन से धूल हटा रहा हूँ।'},
          {'en': 'Monkey jumped off the tree.', 'hi': 'बन्दर पेड़ से कूदा।'},
          {'en': 'Move the cup off the table.', 'hi': 'टेबल से कप हटा दो।'},
        ]},
      ]
    },
    {
      'prep': 'Since', 'hindi': 'से (निश्चित समय)',
      'usages': [
        {'rule': 'Point of time + Continuous form', 'ruleHi': 'निश्चित समय के साथ — जब वाक्य में रहा/रही/रहे हो', 'note': 'Since: 2 AM, 1998, Monday, morning, yesterday, childhood, birth', 'examples': [
          {'en': 'I have been working since morning.', 'hi': 'मैं सुबह से काम कर रहा हूँ।'},
          {'en': 'He has been trying since Monday.', 'hi': 'वो सोमवार से कोशिश कर रहा है।'},
        ]},
      ]
    },
    {
      'prep': 'For', 'hindi': 'से / के लिए / के बदले',
      'usages': [
        {'rule': 'Duration of time + Continuous form', 'ruleHi': 'समय की अवधि के साथ — for 2 hours, for many days, for a long', 'examples': [
          {'en': 'I have been studying for 2 hours.', 'hi': 'मैं 2 घंटे से पढ़ रहा हूँ।'},
          {'en': 'He has been trying for many days.', 'hi': 'वो कई दिनों से कोशिश कर रहा है।'},
        ]},
        {'rule': 'For any purpose', 'ruleHi': 'के लिए (purpose)', 'examples': [
          {'en': 'I did it for you.', 'hi': 'मैंने ये तुम्हारे लिए किया।'},
          {'en': 'He came to me for money.', 'hi': 'वो मेरे पास पैसे के लिए आया।'},
        ]},
        {'rule': 'For exchange', 'ruleHi': 'किसी चीज़ के बदले', 'examples': [
          {'en': 'I gave a mobile for Rs. 500.', 'hi': 'मैंने 500 रु में मोबाइल दिया।'},
          {'en': 'He bought a pen for Rs. 5.', 'hi': 'उसने 5 रु में एक पैन खरीदा।'},
        ]},
      ]
    },
  ];

  static const List<Map<String, dynamic>> prepositionsPart2 = [
    {
      'prep': 'In', 'hindi': 'में',
      'usages': [
        {'rule': 'With time', 'ruleHi': 'समय के साथ — साल, महीना, मौसम, सुबह/शाम', 'examples': [
          {'en': 'I was born in January.', 'hi': 'मैं जनवरी में पैदा हुआ था।'},
          {'en': 'He will come home in 2015.', 'hi': 'वो 2015 में घर आयेगा।'},
          {'en': 'I left the company in June 2009.', 'hi': 'मैंने जून 2009 में कम्पनी छोड़ी।'},
          {'en': 'I will leave in half an hour.', 'hi': 'मैं आधे घंटे में निकलूँगा।'},
        ]},
        {'rule': 'Large places (country, city, town)', 'ruleHi': 'बड़ी जगह — देश, शहर के साथ', 'examples': [
          {'en': 'I live in Delhi.', 'hi': 'मैं दिल्ली में रहता हूँ।'},
          {'en': 'He will study in America.', 'hi': 'वो अमेरिका में पढ़ाई करेगा।'},
        ]},
        {'rule': 'In some object', 'ruleHi': 'किसी वस्तु के अन्दर', 'examples': [
          {'en': 'I found no songs in this mobile.', 'hi': 'मुझे इस मोबाइल में गाने नहीं मिले।'},
          {'en': 'We have read it in book.', 'hi': 'हमने ये किताब में पढ़ा है।'},
        ]},
      ]
    },
    {
      'prep': 'Into', 'hindi': 'में (गतिशील)',
      'usages': [
        {'rule': 'Motion — entering something', 'ruleHi': 'गतिशील अवस्था में — अन्दर जाते वक्त', 'note': '"In" = already inside | "Into" = moving inside (motion)', 'examples': [
          {'en': 'Pour the coffee into the cup.', 'hi': 'कॉफी को कप में डालो।'},
          {'en': 'He is going into the room.', 'hi': 'वो कमरे में जा रहा है।'},
        ]},
      ]
    },
    {
      'prep': 'Before', 'hindi': 'पहले / सामने',
      'usages': [
        {'rule': 'Before (time)', 'ruleHi': 'पहले — समय से पहले', 'examples': [
          {'en': 'This train will reach before time.', 'hi': 'यह ट्रेन समय से पहले पहुँचेगी।'},
          {'en': 'I will come before you leave.', 'hi': 'मैं तुम्हारे निकलने से पहले आऊँगा।'},
        ]},
        {'rule': 'Before = in front of (सामने)', 'ruleHi': 'सामने — in front of / before / opposite तीनों = same', 'examples': [
          {'en': 'Now I am standing before you.', 'hi': 'अब मैं आपके सामने खड़ा हूँ।'},
          {'en': 'He was sitting before his dad.', 'hi': 'वो अपने पापा के सामने बैठा था।'},
        ]},
      ]
    },
    {
      'prep': 'After', 'hindi': 'बाद में / पीछे पड़ना',
      'usages': [
        {'rule': 'After (time)', 'ruleHi': 'बाद में', 'examples': [
          {'en': 'I will meet you after 10.', 'hi': 'मैं तुमसे 10 बजे के बाद मिलूँगा।'},
          {'en': 'I reached after them.', 'hi': 'मैं उनके बाद पहुँचा।'},
        ]},
        {'rule': 'Chasing / pursuing persistently', 'ruleHi': 'किसी के पीछे पड़ना', 'examples': [
          {'en': 'I was after my professor for getting some help.', 'hi': 'मैं मदद के लिए अपने प्रोफेसर के पीछे पड़ गया था।'},
          {'en': 'He was unnecessarily after that girl.', 'hi': 'वो बेवजह उस लड़की के पीछे पड़ा हुआ था।'},
          {'en': 'My father denied thrice but I am still after him.', 'hi': 'मेरे पापा ने तीन बार मना किया पर मैं अभी भी उनके पीछे पड़ा हूँ।'},
        ]},
      ]
    },
  ];

  static const List<Map<String, dynamic>> prepositionsPart3 = [
    {
      'prep': 'By', 'hindi': 'द्वारा / से / तक / बगल में',
      'usages': [
        {'rule': 'By (passive voice) — द्वारा', 'ruleHi': 'द्वारा — Passive voice में', 'examples': [
          {'en': 'I was stopped by someone.', 'hi': 'मुझे किसी के द्वारा रोका गया।'},
          {'en': 'He can be sent by his father.', 'hi': 'उसे अपने पापा द्वारा भेजा जा सकता है।'},
        ]},
        {'rule': 'Travel by vehicle', 'ruleHi': 'किसी वाहन से यात्रा करना', 'examples': [
          {'en': 'I travelled by bus.', 'hi': 'मैंने बस से यात्रा की।'},
          {'en': 'He is coming by noon flight.', 'hi': 'वो दोपहर की फ्लाइट से आ रहा है।'},
        ]},
        {'rule': 'By + time (Future Indefinite only)', 'ruleHi': 'तक — Future Indefinite Tense में ही', 'examples': [
          {'en': 'I will leave by 4 o\'clock.', 'hi': 'मैं 4 बजे तक निकल जाऊँगा।'},
          {'en': 'We will finish it by morning.', 'hi': 'हम सुबह तक ये खत्म कर देंगे।'},
        ]},
        {'rule': 'Next to / Beside (बगल में)', 'ruleHi': 'बगल में (= beside / next to / adjacent)', 'examples': [
          {'en': 'I was standing by him.', 'hi': 'मैं उसके बगल में खड़ा था।'},
        ]},
      ]
    },
    {
      'prep': 'With', 'hindi': 'से / साथ',
      'usages': [
        {'rule': 'Perform task using something', 'ruleHi': 'किसी चीज़ का प्रयोग करके कुछ करना', 'examples': [
          {'en': 'I cut the cake with a knife.', 'hi': 'मैंने चाकू से केक काटा।'},
          {'en': 'He wrote the letter with a blue pen.', 'hi': 'उसने नीले पैन से पत्र लिखा।'},
          {'en': 'He killed the bird with a stone.', 'hi': 'उसने पत्थर से चिड़िया मारी।'},
        ]},
        {'rule': 'Accompany someone', 'ruleHi': 'किसी के साथ', 'examples': [
          {'en': 'I am with Ram in this matter.', 'hi': 'इस मामले में मैं राम के साथ हूँ।'},
          {'en': 'We will be with you.', 'hi': 'हम आपके साथ रहेंगे।'},
          {'en': 'My dad went to his office with the laptop.', 'hi': 'मेरे पापा अपने ऑफिस लैपटॉप ले के गये।'},
        ]},
      ]
    },
    {
      'prep': 'At', 'hindi': 'में/पर/बजे',
      'usages': [
        {'rule': 'Point of time', 'ruleHi': 'निश्चित समय के साथ', 'examples': [
          {'en': 'I was born at 2.', 'hi': 'मैं 2 बजे पैदा हुआ था।'},
          {'en': 'He will come home at 10 AM.', 'hi': 'वो सुबह 10 बजे घर आयेगा।'},
        ]},
        {'rule': 'Small places', 'ruleHi': 'छोटी जगह के साथ — Note: small+at, big+in', 'examples': [
          {'en': 'I stayed at a hotel.', 'hi': 'मैं एक होटल में रुका।'},
          {'en': 'He was standing at the bus stop.', 'hi': 'वो बस स्टाप पर खड़ा था।'},
          {'en': 'Rahul works at a store.', 'hi': 'राहुल एक स्टोर में/पर काम करता है।'},
        ]},
        {'rule': 'With night/noon', 'ruleHi': 'रात और दोपहर के साथ', 'examples': [
          {'en': 'I was there at noon.', 'hi': 'मैं दोपहर में वहाँ था।'},
          {'en': 'We study at night.', 'hi': 'हम रात में पढ़ते हैं।'},
        ]},
        {'rule': 'Price / Cost', 'ruleHi': 'मूल्य बताने में', 'examples': [
          {'en': 'This fruit is selling at Rs. 10 per kg.', 'hi': 'यह फल 10 रु किलो बिक रहा है।'},
        ]},
        {'rule': 'Festival / Event', 'ruleHi': 'किसी त्योहार या खास अवसर पर', 'examples': [
          {'en': 'I will come home at Holi.', 'hi': 'मैं होली पर घर आऊँगा।'},
          {'en': 'He will go there at his birthday.', 'hi': 'वो उसके जन्मदिन पर वहाँ जायेगा।'},
        ]},
      ]
    },
  ];

  static const List<Map<String, dynamic>> prepositionsPart4 = [
    {
      'prep': 'Through', 'hindi': 'से (आर-पार)',
      'usages': [
        {'rule': 'See through (transparent)', 'ruleHi': 'किसी चीज़ के आर-पार देखना', 'examples': [
          {'en': 'I can see through the glass as it is transparent.', 'hi': 'मैं ग्लास से देख सकता हूँ क्योंकि ये पारदर्शी है।'},
          {'en': 'I can see inside through this hole.', 'hi': 'मैं इस छेद के ज़रिये अन्दर देख सकता हूँ।'},
        ]},
        {'rule': 'Pass through enclosed structure', 'ruleHi': 'ऊपर-नीचे-किनारे बन्द रास्ते से गुजरना', 'examples': [
          {'en': 'I was passing through a street.', 'hi': 'मैं एक गली से गुजर रहा था।'},
          {'en': 'We went through the underground way.', 'hi': 'हम भूमिगत रास्ते से गये।'},
          {'en': 'Water is passing through this pipe.', 'hi': 'पानी इस पाइप से गुजर रहा है।'},
        ]},
      ]
    },
    {
      'prep': 'Beyond', 'hindi': 'के पार (दिखाई न दे)',
      'usages': [
        {'rule': 'Very far; not visible', 'ruleHi': 'के पार — जो दिख न रहा हो', 'examples': [
          {'en': 'There is a temple beyond this mountain.', 'hi': 'इस पहाड़ के उस पार एक मन्दिर है।'},
          {'en': 'What is there beyond that river?', 'hi': 'उस नदी के पार क्या है?'},
        ]},
        {'rule': 'Beyond abstract (cannot touch/see)', 'ruleHi': 'ऐसी चीज़ के पार जिसे छू या देख न सकें', 'examples': [
          {'en': 'There is something beyond this universe.', 'hi': 'इस ब्रह्माण्ड के पार कुछ है।'},
          {'en': 'There is nothing beyond love.', 'hi': 'प्यार के पार कुछ नहीं है।'},
        ]},
      ]
    },
    {
      'prep': 'Via', 'hindi': 'के रास्ते / होते हुए',
      'usages': [
        {'rule': 'Via (route)', 'ruleHi': 'विया/वाया — के रास्ते से, से होते हुए', 'examples': [
          {'en': 'This train will go to Delhi via Kanpur.', 'hi': 'यह ट्रेन कानपुर से होते हुए दिल्ली जायेगी।'},
          {'en': 'I sent him my picture via bluetooth.', 'hi': 'मैंने उसे अपनी फोटो ब्लूटूथ से भेजी।'},
          {'en': 'He came to Delhi via Bijnor.', 'hi': 'वो बिजनौर के रास्ते दिल्ली आया।'},
        ]},
      ]
    },
    {
      'prep': 'Opposite', 'hindi': 'ठीक सामने / विपरीत',
      'usages': [
        {'rule': 'Directly facing (सामने)', 'ruleHi': 'ठीक सामने दूसरी तरफ — = in front of = before', 'examples': [
          {'en': 'My home is opposite your shop.', 'hi': 'मेरा घर तुम्हारी दुकान के ठीक सामने है।'},
          {'en': 'He was standing opposite you.', 'hi': 'वो तुम्हारे सामने खड़ा था।'},
        ]},
        {'rule': 'Opposite (विपरीत/उल्टा)', 'ruleHi': 'विपरीत — उल्टा', 'examples': [
          {'en': 'Ram does opposite what you say.', 'hi': 'जो तुम कहते हो राम उसका उल्टा करता है।'},
          {'en': 'His thinking is opposite yours.', 'hi': 'उसकी सोच तुम्हारी सोच से ठीक उल्टी है।'},
        ]},
      ]
    },
    {
      'prep': 'Above', 'hindi': 'ऊपर',
      'usages': [
        {'rule': '1. Up in a list  2. Above abstract noun  3. Above surface level', 'ruleHi': '1. लिस्ट में ऊपर  2. Abstract चीज़ से ऊपर  3. सतह के स्तर से ऊपर', 'examples': [
          {'en': 'My name is above your name in the list.', 'hi': 'मेरा नाम लिस्ट में तुम्हारे नाम के ऊपर है।'},
          {'en': 'Money is above love.', 'hi': 'पैसा प्यार से ऊपर है — पैसा पहले, प्यार बाद में।'},
          {'en': 'Only his eyes were above water.', 'hi': 'केवल उसकी आँखें पानी के ऊपर थीं।'},
        ]},
      ]
    },
  ];

  static const List<Map<String, dynamic>> prepositionsPart5 = [
    {
      'prep': 'Under', 'hindi': 'नीचे (बिना पूरी तरह छुए)',
      'usages': [
        {'rule': 'Subject & object NOT fully touching', 'ruleHi': 'किसी के नीचे — बिना पूरी तरह छुए', 'note': 'पत्र तकिये के नीचे → fully touching → beneath/underneath', 'examples': [
          {'en': 'Ram is hidden under the bed.', 'hi': 'राम बिस्तर के नीचे छिपा हुआ है।'},
          {'en': 'Ram lives under the roof but Shyam doesn\'t even have a house.', 'hi': 'राम छत के नीचे रहता है पर श्याम के पास तो घर ही नहीं है।'},
          {'en': 'Mom is sitting under the tree.', 'hi': 'मम्मी जी पेड़ के नीचे बैठी हैं।'},
        ]},
      ]
    },
    {
      'prep': 'Beneath / Underneath', 'hindi': 'नीचे (पूरी तरह छूते हुए)',
      'usages': [
        {'rule': 'Subject & object FULLY touching', 'ruleHi': 'किसी के नीचे — पूरी तरह छूते हुए', 'examples': [
          {'en': 'My house is underneath your house.', 'hi': 'मेरा घर आपके घर के नीचे है।'},
          {'en': 'Her photograph is beneath my book.', 'hi': 'उसकी तस्वीर मेरी किताब के नीचे है।'},
        ]},
      ]
    },
    {
      'prep': 'Below', 'hindi': 'नीचे (list/abstract/level)',
      'usages': [
        {'rule': '1. Below in a list  2. Abstract  3. Below surface level', 'ruleHi': '1. लिस्ट में नीचे  2. Abstract से नीचे  3. सतह से नीचे', 'examples': [
          {'en': 'My name is below your name in the list.', 'hi': 'मेरा नाम लिस्ट में तुम्हारे नाम के नीचे है।'},
          {'en': 'Money is below love.', 'hi': 'पैसा प्यार से नीचे है — प्यार पहले, पैसा बाद में।'},
          {'en': 'His mouth was below water but nose was above.', 'hi': 'उसका मुँह पानी के नीचे था पर नाक ऊपर।'},
        ]},
      ]
    },
    {
      'prep': 'Down', 'hindi': 'नीचे की दिशा में',
      'usages': [
        {'rule': 'Downward movement', 'ruleHi': 'नीचे की दिशा को दर्शाना', 'examples': [
          {'en': 'Prices are going down.', 'hi': 'कीमतें नीचे जा रही हैं।'},
          {'en': 'Water level is going down.', 'hi': 'पानी का स्तर नीचे जा रहा है।'},
        ]},
      ]
    },
    {
      'prep': 'On', 'hindi': 'पर / ऊपर / को',
      'usages': [
        {'rule': 'Smaller object on bigger object', 'ruleHi': 'एक बड़े object के ऊपर छोटे object का रखा होना', 'examples': [
          {'en': 'Pen is kept on the table.', 'hi': 'पैन टेबल पर रखा हुआ है।'},
          {'en': 'Rohit is sitting on the Elephant.', 'hi': 'रोहित हाथी के ऊपर बैठा हुआ है।'},
        ]},
        {'rule': 'Day and Date', 'ruleHi': 'Day और Date के साथ', 'examples': [
          {'en': 'I went on Sunday.', 'hi': 'मैं सण्डे को गया।'},
          {'en': 'He came on 20th Dec\'12.', 'hi': 'वो 20 दिसम्बर 2012 को आया।'},
        ]},
        {'rule': 'Certain side', 'ruleHi': 'किसी तरफ — on the right / on the left', 'examples': [
          {'en': 'I was standing on the right.', 'hi': 'मैं दाँयी ओर खड़ा था।'},
          {'en': 'I was standing on the left.', 'hi': 'मैं बाँयी ओर खड़ा था।'},
        ]},
      ]
    },
    {
      'prep': 'Upon / Onto', 'hindi': 'ऊपर (गतिशील)',
      'usages': [
        {'rule': 'Upward motion onto a bigger object', 'ruleHi': 'ऊपर की दिशा में गतिशील होकर बड़े object के ऊपर आना', 'examples': [
          {'en': 'I jumped onto the horse.', 'hi': 'मैं कूद कर घोड़े पर बैठ गया।'},
          {'en': 'Broom came upon the table by itself.', 'hi': 'झाड़ू अपने आप टेबल पर आ गया।'},
        ]},
      ]
    },
    {
      'prep': 'Between', 'hindi': 'बीच में (दो के बीच)',
      'usages': [
        {'rule': 'Between two objects only', 'ruleHi': 'सिर्फ दो के बीच में', 'examples': [
          {'en': 'She is sitting between Yash & Vaibhav.', 'hi': 'वो यश और वैभव के बीच में बैठी है।'},
          {'en': 'Pen is lying between two computers.', 'hi': 'पैन दो कम्प्यूटरों के बीच में पड़ा हुआ है।'},
        ]},
      ]
    },
    {
      'prep': 'Among', 'hindi': 'बीच में (संख्या बताई हो)',
      'usages': [
        {'rule': 'More than two — count given', 'ruleHi': 'दो से अधिक के बीच — कितनों के बीच बताया गया हो', 'examples': [
          {'en': 'I was among 50 people.', 'hi': 'मैं 50 लोगों के बीच में था।'},
          {'en': 'Her photograph was kept among 3 other items.', 'hi': 'उसकी तस्वीर तीन और चीज़ों के बीच रखी हुई थी।'},
        ]},
      ]
    },
    {
      'prep': 'Amongst', 'hindi': 'बीच में (संख्या न बताई हो)',
      'usages': [
        {'rule': 'More than two — count NOT given', 'ruleHi': 'दो से अधिक के बीच — कितने यह नहीं बताया गया', 'examples': [
          {'en': 'I was amongst the crowd.', 'hi': 'मैं भीड़ के बीच था।'},
          {'en': 'My dad was amongst many people.', 'hi': 'मेरे पापा कई लोगों के बीच थे।'},
        ]},
      ]
    },
    {
      'prep': 'Out of', 'hindi': 'बाहर / में से',
      'usages': [
        {'rule': 'To go out / leave a place', 'ruleHi': 'बाहर निकलना, किसी जगह को छोड़ना', 'examples': [
          {'en': 'I am getting out of my home.', 'hi': 'मैं घर से बाहर निकल रहा हूँ।'},
          {'en': 'He has gone out of Delhi.', 'hi': 'वह दिल्ली से बाहर जा चुका है।'},
        ]},
        {'rule': 'Out of certain numbers', 'ruleHi': 'इतनी संख्या में से', 'examples': [
          {'en': 'Rahul scored 90 out of 100.', 'hi': 'राहुल ने 100 में से 90 नम्बर प्राप्त किये।'},
          {'en': 'There are only 2 students out of 15.', 'hi': '15 में से केवल 2 ही विद्यार्थी हैं।'},
        ]},
      ]
    },
  ];

  static const List<Map<String, dynamic>> prepositionsPart6 = [
    {'prep': 'Against', 'hindi': 'विरुद्ध / विरोध में', 'usages': [
      {'rule': 'Against (opposite/opposing)', 'ruleHi': 'विरुद्ध, विरोध में', 'examples': [
        {'en': 'Why is Ram against you?', 'hi': 'राम तुम्हारे विरुद्ध क्यों है?'},
      ]},
    ]},
    {'prep': 'About', 'hindi': 'बारे में', 'usages': [
      {'rule': 'About something/someone', 'ruleHi': 'बारे में', 'examples': [
        {'en': 'He is talking about me.', 'hi': 'वो मेरे बारे में बात कर रहा है।'},
      ]},
    ]},
    {'prep': 'Of', 'hindi': 'का (सम्बन्ध)', 'usages': [
      {'rule': 'Show relation', 'ruleHi': 'का — सम्बन्ध दर्शाना', 'examples': [
        {'en': 'He is the brother of Ram.', 'hi': 'वो राम का भाई है।'},
      ]},
    ]},
    {'prep': 'To', 'hindi': 'को (किसी जगह को)', 'usages': [
      {'rule': 'From one place to another', 'ruleHi': 'एक जगह से दूसरी जगह को', 'examples': [
        {'en': 'I am going to school.', 'hi': 'मैं स्कूल जा रहा हूँ।'},
        {'en': 'Seeta is coming to our home.', 'hi': 'सीता हमारे घर आ रही है।'},
      ]},
    ]},
    {'prep': 'Towards', 'hindi': 'की तरफ', 'usages': [
      {'rule': 'Direction towards (not necessarily reaching)', 'ruleHi': 'की तरफ — पहुँचना ज़रूरी नहीं', 'examples': [
        {'en': 'I am going towards school.', 'hi': 'मैं स्कूल की तरफ जा रहा हूँ।'},
        {'en': 'He was coming towards you.', 'hi': 'वो तुम्हारी तरफ आ रहा था।'},
      ]},
    ]},
    {'prep': 'Over', 'hindi': 'ऊपर (बिना छुए)', 'usages': [
      {'rule': 'Above without touching', 'ruleHi': 'ऊपर — बिना छुए', 'examples': [
        {'en': 'I jumped over the rope.', 'hi': 'मैं रस्सी के ऊपर से कूदा।'},
        {'en': 'There is a roof over our heads.', 'hi': 'हमारे सिर के ऊपर छत है।'},
        {'en': 'There is a bridge over the river.', 'hi': 'नदी के ऊपर एक पुल है।'},
      ]},
    ]},
    {'prep': 'Within', 'hindi': 'समयावधि के अन्दर', 'usages': [
      {'rule': 'Within a time period', 'ruleHi': 'समयावधि के अन्दर', 'examples': [
        {'en': 'I will come within 5 minutes.', 'hi': 'मैं 5 मिनट में आ जाऊँगा।'},
        {'en': 'He has come back within just 2 days.', 'hi': 'वो 2 दिन में ही वापस आ गया है।'},
      ]},
    ]},
    {'prep': 'Than', 'hindi': 'से (तुलना)', 'usages': [
      {'rule': 'Used for comparison', 'ruleHi': 'तुलना के लिए', 'examples': [
        {'en': 'I am better than you.', 'hi': 'मैं तुमसे बेहतर हूँ।'},
        {'en': 'We are taller than he.', 'hi': 'हम उससे लम्बे हैं।'},
      ]},
    ]},
    {'prep': 'Throughout', 'hindi': 'सारा / पूरा', 'usages': [
      {'rule': 'Entire duration', 'ruleHi': 'सारा/पूरा — throughout the day, throughout the life', 'examples': [
        {'en': 'I loved him/her throughout my life.', 'hi': 'मैंने ज़िन्दगी भर उसे प्यार किया।'},
        {'en': 'We worked throughout the night.', 'hi': 'हमने रात भर काम किया।'},
      ]},
    ]},
    {'prep': 'Without', 'hindi': 'बिना', 'usages': [
      {'rule': 'Without', 'ruleHi': 'बिना', 'examples': [
        {'en': 'I am nothing without you.', 'hi': 'मैं तुम्हारे बिना कुछ नहीं हूँ।'},
      ]},
    ]},
    {'prep': 'Up', 'hindi': 'ऊपर', 'usages': [
      {'rule': 'Upward direction', 'ruleHi': 'ऊपर', 'examples': [
        {'en': 'Prices are rising up.', 'hi': 'कीमतें बढ़ रही हैं।'},
        {'en': 'Balloon is going up.', 'hi': 'गुब्बारा ऊपर जा रहा है।'},
      ]},
    ]},
    {'prep': 'Upwards', 'hindi': 'ऊपर की तरफ', 'usages': [
      {'rule': 'Upwards direction', 'ruleHi': 'ऊपर की तरफ', 'examples': [
        {'en': 'He threw the stone upwards.', 'hi': 'उसने पत्थर ऊपर की तरफ फेंका।'},
      ]},
    ]},
    {'prep': 'Downwards', 'hindi': 'नीचे की तरफ', 'usages': [
      {'rule': 'Downwards direction', 'ruleHi': 'नीचे की तरफ', 'examples': [
        {'en': 'He threw the stone downwards.', 'hi': 'उसने पत्थर नीचे की तरफ फेंका।'},
      ]},
    ]},
    {'prep': 'Around', 'hindi': 'चारों ओर', 'usages': [
      {'rule': 'Covered in all directions', 'ruleHi': 'चारों ओर', 'examples': [
        {'en': 'People were around me, yet I was lonely.', 'hi': 'लोग मेरे चारों ओर थे, फिर भी मैं तन्हा था।'},
        {'en': 'The Earth is revolving around the Sun.', 'hi': 'पृथ्वी सूर्य के चारों ओर घूम रही है।'},
      ]},
    ]},
  ];

  static const List<Map<String, dynamic>> prepositionsPart7 = [
    {'prep': 'Ago', 'hindi': 'पहले (समय के साथ)', 'usages': [
      {'rule': 'Time in the past', 'ruleHi': 'पहले — समय के साथ', 'examples': [
        {'en': 'He came 2 years ago.', 'hi': 'वो 2 साल पहले आया।'},
        {'en': 'Ram had done B. Tech 6 years ago.', 'hi': 'राम ने बी टेक 6 साल पहले किया था।'},
      ]},
    ]},
    {'prep': 'Inside', 'hindi': 'अन्दर', 'usages': [
      {'rule': 'Inside an enclosed structure', 'ruleHi': 'किसी बन्द आकृति के अन्दर', 'examples': [
        {'en': 'What is inside the computer?', 'hi': 'कम्प्यूटर के अन्दर क्या है?'},
        {'en': 'He was inside and I was outside.', 'hi': 'वो अन्दर था और मैं बाहर था।'},
      ]},
    ]},
    {'prep': 'Outside', 'hindi': 'बाहर', 'usages': [
      {'rule': 'Outside an enclosed structure', 'ruleHi': 'किसी बन्द आकृति से बाहर', 'examples': [
        {'en': 'He was standing outside the home.', 'hi': 'वो घर के बाहर खड़ा था।'},
        {'en': 'He was outside the school premises.', 'hi': 'वो स्कूल परिसर के बाहर था।'},
      ]},
    ]},
    {'prep': 'Next to / Adjacent / Beside / By', 'hindi': 'बगल में', 'usages': [
      {'rule': 'All mean: next to / beside', 'ruleHi': 'बगल में — चारों synonyms हैं', 'examples': [
        {'en': 'He was standing next to me.', 'hi': 'वो मेरे बगल में खड़ा था।'},
        {'en': 'He was standing beside/by me.', 'hi': 'वो मेरे बगल में खड़ा था।'},
      ]},
    ]},
    {'prep': 'Behind', 'hindi': 'पीछे', 'usages': [
      {'rule': 'Behind', 'ruleHi': 'पीछे', 'examples': [
        {'en': 'I was behind Ram in the queue.', 'hi': 'मैं लाइन में राम के पीछे था।'},
        {'en': 'There is nobody standing behind him.', 'hi': 'उसके पीछे कोई नहीं खड़ा है।'},
      ]},
    ]},
    {'prep': 'Ahead of', 'hindi': 'आगे (queue में)', 'usages': [
      {'rule': 'In front (in a queue/race)', 'ruleHi': 'आगे — लाइन या दौड़ में | Ahead ≠ In front of: पीठ सामने हो → ahead | सामने मुँह हो → in front of', 'examples': [
        {'en': 'I was ahead of Ram in the queue.', 'hi': 'मैं लाइन में राम के आगे था।'},
        {'en': 'There is no one standing ahead of him.', 'hi': 'उसके आगे कोई नहीं खड़ा है।'},
      ]},
    ]},
    {'prep': 'Except', 'hindi': 'को छोड़कर / के अलावा', 'usages': [
      {'rule': 'Except / excluding', 'ruleHi': 'को छोड़कर, के अलावा', 'examples': [
        {'en': 'This shop opens every day except Sunday.', 'hi': 'यह दुकान रविवार को छोड़कर सभी दिन खुलती है।'},
        {'en': 'I can scold anyone except you.', 'hi': 'तुम्हारे अलावा मैं किसी को भी डाँट सकता हूँ।'},
      ]},
    ]},
    {'prep': 'Besides', 'hindi': 'के अतिरिक्त (Extra)', 'usages': [
      {'rule': 'In addition to (extra)', 'ruleHi': 'के अतिरिक्त — इसके अलावा भी', 'note': 'Beside = बगल में | Besides = के अतिरिक्त (different meanings!)', 'examples': [
        {'en': 'Do you eat anything else besides this?', 'hi': 'इसके अतिरिक्त कुछ और खाते हो क्या?'},
      ]},
    ]},
    {'prep': 'During', 'hindi': 'के दौरान', 'usages': [
      {'rule': 'During a particular duration', 'ruleHi': 'किसी समयावधि के दौरान', 'examples': [
        {'en': 'I was in Delhi during vacations.', 'hi': 'छुट्टियों के दौरान मैं दिल्ली में था।'},
        {'en': 'We can meet Sachin during the break.', 'hi': 'हम ब्रेक के दौरान सचिन से मिल सकते हैं।'},
      ]},
    ]},
    {'prep': 'Till / Until', 'hindi': 'तक', 'usages': [
      {'rule': 'Until / till (time, day)', 'ruleHi': 'तक — समय, दिन के साथ', 'examples': [
        {'en': 'I will work till 9.', 'hi': 'मैं 9 बजे तक काम करूँगा।'},
        {'en': 'We stayed till Monday.', 'hi': 'हम सोमवार तक ठहरे।'},
        {'en': 'I was there until Saturday.', 'hi': 'मैं शनिवार तक वहाँ था।'},
      ]},
    ]},
    {'prep': 'Up to', 'hindi': 'तक (दूरी/जगह/उम्र)', 'usages': [
      {'rule': 'Up to (distance, place, age)', 'ruleHi': 'तक — किसी दूरी, जगह या उम्र तक', 'examples': [
        {'en': 'I just went up to Dehradun.', 'hi': 'मैं बस देहरादून तक गया।'},
        {'en': 'Seeta ran up to 5 kms.', 'hi': 'सीता 5 किलोमीटर तक दौड़ी।'},
        {'en': 'You shouldn\'t keep mobile up to 18.', 'hi': 'तुम्हें 18 की उम्र तक मोबाइल नहीं रखना चाहिए।'},
      ]},
    ]},
    {'prep': 'Along', 'hindi': 'साथ में', 'usages': [
      {'rule': 'Along with a person/thing', 'ruleHi': 'साथ में', 'examples': [
        {'en': 'Will you come along?', 'hi': 'क्या तुम साथ आओगे?'},
        {'en': 'You will get this pen along the mobile.', 'hi': 'तुम्हें ये पैन मोबाइल के साथ मिलेगा।'},
      ]},
    ]},
    {'prep': 'Alongside', 'hindi': 'किनारे साथ में', 'usages': [
      {'rule': 'Running alongside (edge/side)', 'ruleHi': 'किनारे साथ में — along the edge', 'examples': [
        {'en': 'There is a road alongside the river.', 'hi': 'नदी के साथ-साथ एक रोड है।'},
        {'en': 'A truck is parked alongside the road.', 'hi': 'रोड के किनारे एक ट्रक खड़ा है।'},
      ]},
    ]},
    {'prep': 'Across', 'hindi': 'के पार', 'usages': [
      {'rule': 'Across something (crossing)', 'ruleHi': 'किसी चीज़ के पार — नदी/सड़क पार करना', 'examples': [
        {'en': 'Can you swim across the river?', 'hi': 'क्या तुम नदी तैर कर पार कर सकते हो?'},
        {'en': 'There was a man standing across the road.', 'hi': 'एक आदमी सड़क के पार खड़ा था।'},
        {'en': 'My shop is across the road.', 'hi': 'मेरी दुकान सड़क के उस पार है।'},
      ]},
    ]},
  ];
}