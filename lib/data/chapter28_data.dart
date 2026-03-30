import '../models/lesson_model.dart';

class Chapter28Data {
  static ChapterModel get chapter => ChapterModel(
        id: 28,
        title: 'Fillers',
        titleHindi: 'अटकाव के शब्द',
        description: 'Um, Like, You know, I mean, Actually & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'What are Fillers?',
              titleHindi: 'Fillers क्या होते हैं?',
              emoji: '💬',
              type: LessonType.ch28Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Common Fillers',
              titleHindi: 'सामान्य Fillers',
              emoji: '🗣️',
              type: LessonType.ch28CommonFillers,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Fillers in Sentences',
              titleHindi: 'वाक्यों में Fillers',
              emoji: '📝',
              type: LessonType.ch28InSentences,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Quotations',
              titleHindi: 'महान व्यक्तियों के वचन',
              emoji: '✨',
              type: LessonType.ch28Quotations,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 5,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch28ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch28Intro:
        return introQuestions;
      case LessonType.ch28CommonFillers:
        return commonFillersQuestions;
      case LessonType.ch28InSentences:
        return inSentencesQuestions;
      case LessonType.ch28Quotations:
        return quotationQuestions;
      case LessonType.ch28ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: 'Fillers क्या होते हैं?',
      questionEn: 'What are Fillers?',
      options: [
        'वो शब्द जो वाक्य का मुख्य अर्थ देते हैं',
        'वो शब्द जो बोलते वक्त अटकाव के दौरान प्रयोग होते हैं',
        'वो शब्द जो हमेशा वाक्य के अंत में आते हैं',
        'वो शब्द जो केवल formal बातचीत में प्रयोग होते हैं',
      ],
      correctIndex: 1,
      explanation: 'Fillers ऐसे शब्द हैं जो बोलते वक्त अटकाव के दौरान प्रयोग होते हैं ताकि बातचीत की fluency न टूटे।',
    ),
    QuizQuestion(
      questionHi: 'Fillers का प्रयोग कब करना चाहिए?',
      questionEn: 'When should you use Fillers?',
      options: [
        'हमेशा, हर बातचीत में',
        'कभी नहीं, ये गलत हैं',
        'Informal बातचीत में, formal में कम से कम',
        'केवल अंग्रेजी में',
      ],
      correctIndex: 2,
      explanation: 'Fillers informal बातचीत में ठीक हैं। Interview, professional conversation या seniors से बात करते वक्त इनका प्रयोग कम से कम करें।',
    ),
    QuizQuestion(
      questionHi: 'नीचे दिए गए में से कौन सा Filler है?',
      questionEn: 'Which of the following is a Filler?',
      options: ['Hello', 'Um', 'Please', 'Thank you'],
      correctIndex: 1,
      explanation: '"Um" एक classic filler है जो अटकाव के दौरान प्रयोग होता है।',
    ),
    QuizQuestion(
      questionHi: '"Ram is um….. illiterate." — यहाँ "um" क्यों लगा?',
      questionEn: '"Ram is um….. illiterate." — why is "um" used here?',
      options: [
        'यह verb है',
        'अगला सही शब्द याद नहीं आया, थोड़ा समय लेने के लिए',
        'यह grammar rule है',
        'sentence को पूरा करने के लिए',
      ],
      correctIndex: 1,
      explanation: '"illiterate" शब्द अचानक याद नहीं आया, इसलिए "um" filler का प्रयोग हुआ।',
    ),
    QuizQuestion(
      questionHi: 'Formal conversation में Fillers के बारे में क्या सही है?',
      questionEn: 'What is true about Fillers in formal conversation?',
      options: [
        'Formal में ज़्यादा fillers इस्तेमाल करने चाहिए',
        'Formal में fillers का प्रयोग कम से कम करना चाहिए',
        'Formal में fillers mandatory हैं',
        'Formal में fillers से fluency बढ़ती है',
      ],
      correctIndex: 1,
      explanation: 'Interview, professional या formal conversation में fillers का प्रयोग avoid करें — इससे unprofessional लगता है।',
    ),
  ];

  // ─── L2: Common Fillers Quiz ───────────────────────────────────────────────
  static const List<QuizQuestion> commonFillersQuestions = [
    QuizQuestion(
      questionHi: '"You know" filler का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of the filler "You know"?',
      options: ['तुम जानते हो (question)', 'माने / जैसे कि (अटकाव में)', 'क्या तुम जानते हो?', 'मुझे पता नहीं'],
      correctIndex: 1,
      explanation: 'Filler के रूप में "you know" = माने / मतलब / जैसे कि — actual question नहीं।',
    ),
    QuizQuestion(
      questionHi: '"I mean" filler का क्या मतलब है?',
      questionEn: 'What does "I mean" as a filler mean?',
      options: ['मेरा मतलब है / माने', 'मैं कहना चाहता हूँ (literal)', 'मेरी राय अलग है', 'मैं नहीं जानता'],
      correctIndex: 0,
      explanation: '"I mean" filler = मेरा मतलब है / माने — अटकाव को fill करता है।',
    ),
    QuizQuestion(
      questionHi: '"Actually" filler का प्रयोग कब होता है?',
      questionEn: 'When is "Actually" used as a filler?',
      options: [
        'केवल सच बोलते वक्त',
        'अटकाव के दौरान, बात शुरू करते वक्त',
        'केवल negative sentences में',
        'हमेशा वाक्य के अंत में',
      ],
      correctIndex: 1,
      explanation: '"Actually" filler = दरअसल / असल में — बात शुरू करते वक्त अटकाव fill करने के लिए।',
    ),
    QuizQuestion(
      questionHi: '"Well" filler का हिंदी अर्थ?',
      questionEn: 'Hindi meaning of "Well" as a filler?',
      options: ['कुआँ', 'अच्छा / हाँ तो / देखो', 'स्वस्थ', 'पानी'],
      correctIndex: 1,
      explanation: '"Well" filler = अच्छा / हाँ तो / देखो — बात शुरू करने से पहले।',
    ),
    QuizQuestion(
      questionHi: '"Basically" filler का प्रयोग किस लिए होता है?',
      questionEn: 'What is "Basically" used for as a filler?',
      options: [
        'Technical explanation के लिए',
        'बात summarize करते वक्त अटकाव fill करना',
        'केवल questions में',
        'Past tense में',
      ],
      correctIndex: 1,
      explanation: '"Basically" filler = मूल रूप से / दरअसल — explanation या summary देते वक्त।',
    ),
  ];

  // ─── L3: Fillers in Sentences Quiz ────────────────────────────────────────
  static const List<QuizQuestion> inSentencesQuestions = [
    QuizQuestion(
      questionHi: '"Ummm, I think he is a genuine guy." — यहाँ filler कौन सा है?',
      questionEn: '"Ummm, I think he is a genuine guy." — which is the filler?',
      options: ['I think', 'genuine', 'Ummm', 'guy'],
      correctIndex: 2,
      explanation: '"Ummm" यहाँ filler है — बात शुरू करने से पहले अटकाव।',
    ),
    QuizQuestion(
      questionHi: '"Well, I don\'t know about him." — "Well" यहाँ क्या है?',
      questionEn: '"Well, I don\'t know about him." — what is "Well" here?',
      options: ['Adjective', 'Noun', 'Filler', 'Verb'],
      correctIndex: 2,
      explanation: '"Well" यहाँ filler है — "अच्छा / हाँ तो" — answer शुरू करने से पहले।',
    ),
    QuizQuestion(
      questionHi: '"I mean, he is not trustworthy." — "I mean" कहाँ लगा?',
      questionEn: '"I mean, he is not trustworthy." — where is "I mean" placed?',
      options: ['वाक्य के अंत में', 'वाक्य के बीच में', 'वाक्य के शुरू में', 'Verb के बाद'],
      correctIndex: 2,
      explanation: '"I mean" filler वाक्य के शुरू में लगा — बात को rephrase करते हुए।',
    ),
    QuizQuestion(
      questionHi: '"She is, you know, she is not trustworthy." — "you know" कहाँ लगा?',
      questionEn: '"She is, you know, she is not trustworthy." — where is "you know" placed?',
      options: ['वाक्य के शुरू में', 'वाक्य के बीच में (commas के साथ)', 'वाक्य के अंत में', 'Subject के पहले'],
      correctIndex: 1,
      explanation: '"You know" filler वाक्य के बीच में commas के साथ लगा।',
    ),
    QuizQuestion(
      questionHi: 'Fillers को underline क्यों किया जाता है?',
      questionEn: 'Why are Fillers underlined in examples?',
      options: [
        'क्योंकि वो important words हैं',
        'ताकि पहचान हो सके कि ये fillers हैं',
        'Grammar rule है',
        'Pronunciation guide के लिए',
      ],
      correctIndex: 1,
      explanation: 'Examples में fillers को underline इसलिए किया जाता है ताकि reader आसानी से पहचान सके।',
    ),
  ];

  // ─── L4: Quotations Quiz ───────────────────────────────────────────────────
  static const List<QuizQuestion> quotationQuestions = [
    QuizQuestion(
      questionHi: '"Live as if you were to die tomorrow. Learn as if you were to live forever." — किसने कहा?',
      questionEn: 'Who said "Live as if you were to die tomorrow. Learn as if you were to live forever."?',
      options: ['Einstein', 'Mahatma Gandhi', 'Napoleon', 'Oprah Winfrey'],
      correctIndex: 1,
      explanation: 'यह Mahatma Gandhi का प्रसिद्ध quote है।',
    ),
    QuizQuestion(
      questionHi: '"as if you were to die tomorrow" — "as if" का अर्थ?',
      questionEn: '"as if you were to die tomorrow" — meaning of "as if"?',
      options: ['जैसे ही', 'जहाँ तक', 'मानो / जैसे कि (imaginary)', 'जब तक'],
      correctIndex: 2,
      explanation: '"As if" = मानो / जैसे कि — imaginary/hypothetical situation।',
    ),
    QuizQuestion(
      questionHi: 'Fillers का सबसे बड़ा नुकसान क्या है?',
      questionEn: 'What is the biggest disadvantage of Fillers?',
      options: [
        'Grammar गलत हो जाती है',
        'Formal/professional बातचीत में unprofessional लगते हैं',
        'Vocabulary कम हो जाती है',
        'Pronunciation खराब होती है',
      ],
      correctIndex: 1,
      explanation: 'Formal settings जैसे Interview में fillers unprofessional impression देते हैं।',
    ),
    QuizQuestion(
      questionHi: 'नीचे दिए गए में कौन से दो fillers हैं?',
      questionEn: 'Which two of the following are Fillers?',
      options: ['Hello & Bye', 'Um & Like', 'Please & Thanks', 'Yes & No'],
      correctIndex: 1,
      explanation: '"Um" और "Like" दोनों classic fillers हैं।',
    ),
    QuizQuestion(
      questionHi: '"It\'s like, she doesn\'t care at all." — filler कौन सा है?',
      questionEn: '"It\'s like, she doesn\'t care at all." — which is the filler?',
      options: ["doesn't", 'all', 'like', 'care'],
      correctIndex: 2,
      explanation: '"like" यहाँ filler है — "It\'s like" = ऐसा है कि / माने।',
    ),
  ];

  // ─── L5: Chapter Final Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: 'Fillers की सही परिभाषा?',
      questionEn: 'Correct definition of Fillers?',
      options: [
        'Verbs जो tense बताते हैं',
        'ऐसे शब्द जो बोलते वक्त अटकाव के दौरान अगला शब्द याद आने तक fill करते हैं',
        'Articles जैसे a, an, the',
        'Conjunctions जो clauses जोड़ते हैं',
      ],
      correctIndex: 1,
      explanation: 'Fillers बोलते वक्त अटकाव भरते हैं ताकि fluency न टूटे।',
    ),
    QuizQuestion(
      questionHi: 'नीचे में से सभी Fillers कौन से हैं?',
      questionEn: 'Which set contains only Fillers?',
      options: [
        'Um, Like, You know, I mean',
        'Please, Sorry, Thanks, Welcome',
        'And, But, Or, So',
        'Was, Were, Has, Have',
      ],
      correctIndex: 0,
      explanation: '"Um, Like, You know, I mean" — ये सब fillers हैं।',
    ),
    QuizQuestion(
      questionHi: '"Ummm, I think he is a genuine guy." — sentence में filler?',
      questionEn: 'The filler in this sentence?',
      options: ['I think', 'genuine', 'Ummm', 'guy'],
      correctIndex: 2,
      explanation: '"Ummm" filler है — sentence शुरू करने से पहले अटकाव।',
    ),
    QuizQuestion(
      questionHi: 'Fillers का प्रयोग कहाँ avoid करना चाहिए?',
      questionEn: 'Where should Fillers be avoided?',
      options: [
        'Friendly casual chat में',
        'Interview, professional या formal conversation में',
        'Phone calls में दोस्तों से बात करते वक्त',
        'Story telling में',
      ],
      correctIndex: 1,
      explanation: 'Interview, professional conversation और seniors से बात करते वक्त fillers avoid करें।',
    ),
    QuizQuestion(
      questionHi: '"Well, I don\'t know about him." — "Well" किस type का शब्द है?',
      questionEn: '"Well, I don\'t know about him." — "Well" is a:',
      options: ['Noun', 'Verb', 'Filler', 'Adjective'],
      correctIndex: 2,
      explanation: '"Well" यहाँ filler है — अच्छा / हाँ तो।',
    ),
    QuizQuestion(
      questionHi: '"It\'s like she is ignoring me." — "like" यहाँ क्या है?',
      questionEn: '"It\'s like she is ignoring me." — "like" is:',
      options: ['Verb (पसंद करना)', 'Filler', 'Preposition', 'Conjunction'],
      correctIndex: 1,
      explanation: '"like" यहाँ filler है — "ऐसा है कि / माने"।',
    ),
    QuizQuestion(
      questionHi: '"basically" filler का Hindi अर्थ?',
      questionEn: 'Hindi meaning of "basically" as a filler?',
      options: ['बिल्कुल नहीं', 'मूल रूप से / दरअसल', 'शायद', 'हमेशा'],
      correctIndex: 1,
      explanation: '"basically" = मूल रूप से / दरअसल।',
    ),
    QuizQuestion(
      questionHi: 'Fillers कितने प्रकार के हो सकते हैं?',
      questionEn: 'Fillers can be:',
      options: [
        'केवल single words',
        'Single words या short phrases दोनों',
        'केवल phrases',
        'केवल 2-letter words',
      ],
      correctIndex: 1,
      explanation: 'Fillers single words (um, well) या short phrases (you know, I mean, it\'s like) दोनों हो सकते हैं।',
    ),
    QuizQuestion(
      questionHi: '"I mean, he is not trustworthy." — "I mean" कहाँ है?',
      questionEn: '"I mean, he is not trustworthy." — placement of "I mean"?',
      options: ['वाक्य के अंत में', 'वाक्य के बीच में', 'वाक्य के शुरू में', 'Verb के बाद'],
      correctIndex: 2,
      explanation: '"I mean" वाक्य के शुरू में है — comma के बाद main sentence आती है।',
    ),
    QuizQuestion(
      questionHi: '"Live as if you were to die tomorrow." — किसने कहा?',
      questionEn: 'Who said "Live as if you were to die tomorrow."?',
      options: ['Einstein', 'Mahatma Gandhi', 'Lincoln', 'Shakespeare'],
      correctIndex: 1,
      explanation: 'यह Mahatma Gandhi का प्रसिद्ध quote है।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> fillersData = [
    {
      'filler': 'Um / Umm / Ummm',
      'hindi': 'अं... / हाँ...',
      'use': 'सबसे common filler — कुछ सोचते वक्त',
      'emoji': '🤔',
    },
    {
      'filler': 'Like',
      'hindi': 'माने / ऐसा है कि',
      'use': 'बात को describe करते वक्त',
      'emoji': '👉',
    },
    {
      'filler': 'You know',
      'hindi': 'माने / जैसे कि',
      'use': 'जब लगे सामने वाला समझ रहा है',
      'emoji': '😊',
    },
    {
      'filler': 'It\'s like',
      'hindi': 'ऐसा है कि / मतलब',
      'use': 'Example या comparison देते वक्त',
      'emoji': '💡',
    },
    {
      'filler': 'I mean',
      'hindi': 'मेरा मतलब है / माने',
      'use': 'बात को clarify या rephrase करते वक्त',
      'emoji': '🗣️',
    },
    {
      'filler': 'Actually',
      'hindi': 'दरअसल / असल में',
      'use': 'बात शुरू करते वक्त या correction करते वक्त',
      'emoji': '💬',
    },
    {
      'filler': 'Basically',
      'hindi': 'मूल रूप से / दरअसल',
      'use': 'Summary या explanation देते वक्त',
      'emoji': '📋',
    },
    {
      'filler': 'Well',
      'hindi': 'अच्छा / हाँ तो / देखो',
      'use': 'Answer शुरू करते वक्त, hesitation में',
      'emoji': '🤷',
    },
  ];

  static const List<Map<String, String>> examplesData = [
    {
      'sentence': 'Ummm, I think he is a genuine guy.',
      'filler': 'Ummm',
      'hindi': 'अं... मुझे लगता है वो एक honest आदमी है।',
    },
    {
      'sentence': 'Well, I don\'t know about him.',
      'filler': 'Well',
      'hindi': 'हाँ तो, मुझे उसके बारे में नहीं पता।',
    },
    {
      'sentence': 'I mean, he is not trustworthy.',
      'filler': 'I mean',
      'hindi': 'मेरा मतलब है, वो भरोसेमंद नहीं है।',
    },
    {
      'sentence': 'She is, you know, she is not trustworthy.',
      'filler': 'you know',
      'hindi': 'वो, माने, वो भरोसेमंद नहीं है।',
    },
    {
      'sentence': 'It\'s like, she doesn\'t care at all.',
      'filler': 'It\'s like',
      'hindi': 'ऐसा है कि, उसे बिल्कुल परवाह नहीं।',
    },
    {
      'sentence': 'Actually, I was not there that day.',
      'filler': 'Actually',
      'hindi': 'दरअसल, मैं उस दिन वहाँ नहीं था।',
    },
    {
      'sentence': 'Basically, he doesn\'t want to work.',
      'filler': 'Basically',
      'hindi': 'मूल रूप से, वो काम नहीं करना चाहता।',
    },
    {
      'sentence': 'Ram is um….. illiterate.',
      'filler': 'um',
      'hindi': 'राम है अं... अनपढ़।',
    },
    {
      'sentence': 'Ram is like….. illiterate.',
      'filler': 'like',
      'hindi': 'राम है, माने... अनपढ़।',
    },
    {
      'sentence': 'Ram is you know….. illiterate.',
      'filler': 'you know',
      'hindi': 'राम है, जैसे कि... अनपढ़।',
    },
    {
      'sentence': 'Ram is I mean….. illiterate.',
      'filler': 'I mean',
      'hindi': 'राम है, मेरा मतलब... अनपढ़।',
    },
    {
      'sentence': 'Ram is actually….. illiterate.',
      'filler': 'actually',
      'hindi': 'राम है दरअसल... अनपढ़।',
    },
    {
      'sentence': 'Ram is basically….. illiterate.',
      'filler': 'basically',
      'hindi': 'राम है मूल रूप से... अनपढ़।',
    },
  ];

  static const List<Map<String, String>> quotations = [
    {
      'english': 'Live as if you were to die tomorrow. Learn as if you were to live forever.',
      'hindi': 'ऐसे जियो जैसे कल मरना हो। ऐसे सीखो जैसे हमेशा जीना हो।',
      'author': 'Mahatma Gandhi',
    },
    {
      'english': 'The secret of getting ahead is getting started.',
      'hindi': 'आगे बढ़ने का रहस्य शुरुआत करना है।',
      'author': 'Mark Twain',
    },
    {
      'english': 'It always seems impossible until it\'s done.',
      'hindi': 'जब तक हो न जाए, सब कुछ असंभव लगता है।',
      'author': 'Nelson Mandela',
    },
    {
      'english': 'In the middle of every difficulty lies opportunity.',
      'hindi': 'हर मुश्किल के बीच में एक मौका छुपा होता है।',
      'author': 'Albert Einstein',
    },
    {
      'english': 'Speak clearly if you speak at all. Carve every word before you let it fall.',
      'hindi': 'अगर बोलो तो साफ बोलो। हर शब्द को कहने से पहले तराशो।',
    },
    {
      'english': 'The most important thing in communication is hearing what isn\'t said.',
      'hindi': 'बातचीत में सबसे ज़रूरी है वो सुनना जो कहा नहीं गया।',
      'author': 'Peter Drucker',
    },
  ];
}