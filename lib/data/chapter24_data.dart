import '../models/lesson_model.dart';

class Chapter24Data {
  static ChapterModel get chapter => ChapterModel(
        id: 24,
        title: 'Let (करने देना)',
        titleHindi: 'अनुमति देना',
        description: 'Let, Doesn\'t Let, Will Let & all Tenses',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Let — Concept & Rules',
              titleHindi: 'Let — अवधारणा और नियम',
              emoji: '🔓',
              type: LessonType.ch24Intro,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 2,
              title: 'Let — All Tenses Table',
              titleHindi: 'Let — सभी Tenses की तालिका',
              emoji: '📊',
              type: LessonType.ch24Tenses,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 3,
              title: 'Quotations',
              titleHindi: 'महान व्यक्तियों के वचन',
              emoji: '💬',
              type: LessonType.ch24Quotations,
              status: LessonStatus.inProgress,
              totalXP: 20),
          LessonModel(
              id: 4,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास (96 sentences)',
              emoji: '✍️',
              type: LessonType.ch24Practice,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 5,
              title: 'Test Paper I',
              titleHindi: 'परीक्षा पत्र I (English→Hindi)',
              emoji: '📝',
              type: LessonType.ch24TestPaper1,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 6,
              title: 'Test Paper II',
              titleHindi: 'परीक्षा पत्र II (Hindi→English)',
              emoji: '📋',
              type: LessonType.ch24TestPaper2,
              status: LessonStatus.inProgress,
              totalXP: 30),
          LessonModel(
              id: 7,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch24ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch24Intro:
        return introQuestions;
      case LessonType.ch24Tenses:
        return tensesQuestions;
      case LessonType.ch24Quotations:
        return quotationQuestions;
      case LessonType.ch24Practice:
        return practiceQuizQuestions;
      case LessonType.ch24TestPaper1:
        return testPaper1QuizQuestions;
      case LessonType.ch24TestPaper2:
        return testPaper2QuizQuestions;
      case LessonType.ch24ChapterQuiz:
        return chapterFinalQuestions;
      default:
        return introQuestions;
    }
  }

  // ─── L1: Intro Quiz ────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionHi: '"Let" का हिंदी अर्थ क्या है?',
      questionEn: 'What is the Hindi meaning of "Let"?',
      options: ['करना', 'करने देना', 'करवाना', 'न करना'],
      correctIndex: 1,
      explanation: '"Let" = करने देना। Subject काम खुद नहीं करता, करने देता है।',
    ),
    QuizQuestion(
      questionHi: '"Let" की तीन forms क्या हैं?',
      questionEn: 'What are the three forms of "Let"?',
      options: ['Let / Lets / Letting', 'Let / Let / Let', 'Let / Leted / Leting', 'Let / Lett / Letted'],
      correctIndex: 1,
      explanation: '"Let" की तीनों forms एक ही हैं — Let, Let, Let।',
    ),
    QuizQuestion(
      questionHi: '"Ram lets me sleep." — यहाँ मुख्य क्रिया कौन सी है?',
      questionEn: '"Ram lets me sleep." — which is the main verb?',
      options: ['Sleep (सोना)', 'Lets (करने देना)', 'Ram', 'Me'],
      correctIndex: 1,
      explanation: '"Let/Lets" मुख्य क्रिया है। "Sleep" दूसरी क्रिया है जो object के बाद आती है।',
    ),
    QuizQuestion(
      questionHi: '"मैं तुम्हें किताब पढ़ने दूँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I let you read the book.',
        'I will let you read the book.',
        'I am letting you read.',
        'I have let you read.'
      ],
      correctIndex: 1,
      explanation: 'Future Indefinite: Sub + Will + Let + Object + Verb 1st form.',
    ),
    QuizQuestion(
      questionHi: '"Ram lets me sleep." में "lets" क्यों लगा?',
      questionEn: 'Why is "lets" used (not "let") in "Ram lets me sleep."?',
      options: [
        'Past tense है',
        'Ram 3rd person singular है → Let + s',
        'Future tense है',
        'Plural subject है'
      ],
      correctIndex: 1,
      explanation: 'Present Indefinite में 3rd person singular (Ram/he/she/it) के साथ Let + s = Lets।',
    ),
  ];

  // ─── L2: Tenses Quiz ──────────────────────────────────────────────────────
  static const List<QuizQuestion> tensesQuestions = [
    QuizQuestion(
      questionHi: '"पापा ने मुझे जाने दिया।" — English?',
      questionEn: 'Correct translation of "पापा ने मुझे जाने दिया"?',
      options: [
        'Dad lets me go.',
        'Dad let me go.',
        'Dad will let me go.',
        'Dad is letting me go.'
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite: Sub + Let (2nd form = Let) + Object + Verb 1st. "Let" की 2nd form भी "Let" है।',
    ),
    QuizQuestion(
      questionHi: '"Ram is not letting go." — हिंदी?',
      questionEn: 'Hindi meaning of "Ram is not letting go."?',
      options: [
        'राम नहीं जा रहा है।',
        'राम जाने नहीं दे रहा है।',
        'राम जाने देगा।',
        'राम ने जाने नहीं दिया।'
      ],
      correctIndex: 1,
      explanation: 'Present Continuous + Let: Sub + is/am/are + letting + Object + Verb 1st।',
    ),
    QuizQuestion(
      questionHi: '"Will you let me go?" — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'क्या तुम जाओगे?',
        'क्या तुम मुझे जाने दोगे?',
        'मैं जाने दूँगा।',
        'वो जाने देगा।'
      ],
      correctIndex: 1,
      explanation: 'Future Interrogative with Let: Will + Sub + Let + Object + Verb?',
    ),
    QuizQuestion(
      questionHi: '"I can let you go." — हिंदी?',
      questionEn: 'Hindi meaning of "I can let you go."?',
      options: [
        'मैं जा सकता हूँ।',
        'तुम जा सकते हो।',
        'मैं तुम्हें जाने दे सकता हूँ।',
        'मैं तुम्हें जाने दूँगा।'
      ],
      correctIndex: 2,
      explanation: 'Modal + Let: Sub + Modal (can) + Let + Object + Verb 1st।',
    ),
    QuizQuestion(
      questionHi: '"I let Ram take the book." — दो क्रियाएँ कौन सी हैं?',
      questionEn: '"I let Ram take the book." — what are the two verbs?',
      options: [
        'I और Ram',
        'Let (मुख्य) और Take (दूसरी)',
        'Book और Ram',
        'Let और Book'
      ],
      correctIndex: 1,
      explanation: '"Let" = मुख्य क्रिया। "Take" = दूसरी क्रिया जो object (Ram) के बाद आती है।',
    ),
  ];

  // ─── L3: Quotations Quiz ───────────────────────────────────────────────────
  static const List<QuizQuestion> quotationQuestions = [
    QuizQuestion(
      questionHi: '"Never interrupt your enemy when he is making a mistake." — किसने कहा?',
      questionEn: '"Never interrupt your enemy when he is making a mistake." — who said this?',
      options: ['Gandhi', 'Napoleon Bonaparte', 'Oprah Winfrey', 'Einstein'],
      correctIndex: 1,
      explanation: 'Napoleon Bonaparte का यह प्रसिद्ध quote है।',
    ),
    QuizQuestion(
      questionHi: '"If you want to lift yourself up, lift up someone else." — इसका अर्थ?',
      questionEn: 'Meaning of "If you want to lift yourself up, lift up someone else."?',
      options: [
        'अकेले आगे बढ़ो।',
        'अगर खुद उठना है, तो दूसरों को उठाओ।',
        'दूसरों से मत सीखो।',
        'किसी की मदद मत करो।'
      ],
      correctIndex: 1,
      explanation: 'दूसरों की मदद करने से खुद भी ऊपर उठते हैं।',
    ),
    QuizQuestion(
      questionHi: '"Good people don\'t need laws to act responsibly." — अर्थ?',
      questionEn: 'Meaning?',
      options: [
        'कानून हमेशा ज़रूरी है।',
        'अच्छे लोगों को जिम्मेदारी के लिए कानून की ज़रूरत नहीं।',
        'बुरे लोग कानून मानते हैं।',
        'कानून बदलना चाहिए।'
      ],
      correctIndex: 1,
      explanation: 'अच्छे इंसान अपने अंदर से जिम्मेदार होते हैं — कानून नहीं चाहिए।',
    ),
    QuizQuestion(
      questionHi: '"To live a creative life, we must lose our fear of being wrong." — इसका अर्थ?',
      questionEn: 'Meaning?',
      options: [
        'गलती से डरो।',
        'रचनात्मक जीवन के लिए गलत होने का डर छोड़ना होगा।',
        'हमेशा सही रहो।',
        'कोशिश मत करो।'
      ],
      correctIndex: 1,
      explanation: 'Creative बनने के लिए गलत होने के डर से मुक्त होना जरूरी है।',
    ),
    QuizQuestion(
      questionHi: '"Let whatever happens, happen." — हिंदी?',
      questionEn: 'Hindi meaning of "Let whatever happens, happen."?',
      options: [
        'कुछ होने दो।',
        'जो होता है, होने दो।',
        'कुछ मत होने दो।',
        'सब रोको।'
      ],
      correctIndex: 1,
      explanation: '"Let + whatever happens + happen" = जो होता है, होने दो।',
    ),
  ];

  // ─── L4: Practice Quiz ────────────────────────────────────────────────────
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionHi: '"Ram doesn\'t let me sleep." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'राम मुझे सोने देता है।',
        'राम मुझे सोने नहीं देता।',
        'राम सोता नहीं।',
        'राम को नींद नहीं आती।'
      ],
      correctIndex: 1,
      explanation: '"Doesn\'t let" = नहीं देता (Present Indefinite negative).',
    ),
    QuizQuestion(
      questionHi: '"I will not let you study." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं तुम्हें पढ़ने दूँगा।',
        'मैं तुम्हें पढ़ने नहीं दूँगा।',
        'तुम पढ़ोगे नहीं।',
        'मैं पढ़ूँगा नहीं।'
      ],
      correctIndex: 1,
      explanation: '"Will not let" = नहीं देना (Future Indefinite negative).',
    ),
    QuizQuestion(
      questionHi: '"Why did you let him go?" — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुमने उसे क्यों रोका?',
        'तुमने उसे जाने क्यों दिया?',
        'वो क्यों गया?',
        'तुम क्यों गये?'
      ],
      correctIndex: 1,
      explanation: 'Past Interrogative: Why + did + Sub + let + Obj + Verb?',
    ),
    QuizQuestion(
      questionHi: '"I am letting you go to market." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं बाजार जा रहा हूँ।',
        'मैं तुम्हें बाजार जाने दे रहा हूँ।',
        'तुम बाजार जाओ।',
        'मैं बाजार जाने देता हूँ।'
      ],
      correctIndex: 1,
      explanation: '"Am letting" = Present Continuous: Sub + is/am/are + letting + Obj + Verb।',
    ),
    QuizQuestion(
      questionHi: '"We should let children play." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'बच्चे खेलते हैं।',
        'हमें बच्चों को खेलने देना चाहिए।',
        'बच्चों को मत खेलने दो।',
        'हम खेलते हैं।'
      ],
      correctIndex: 1,
      explanation: '"Should let" = चाहिए। Modal + Let + Obj + Verb।',
    ),
    QuizQuestion(
      questionHi: '"I can\'t let you write with a pen." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं पेन से लिखता हूँ।',
        'मैं तुम्हें पैन से लिखने नहीं दे सकता।',
        'तुम पेन से लिखो।',
        'मैं पेन नहीं लिखने दे सकता।'
      ],
      correctIndex: 1,
      explanation: '"Can\'t let" = नहीं दे सकता। Modal negative + Let।',
    ),
    QuizQuestion(
      questionHi: '"You neither sleep nor let me sleep." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम सोते हो और मुझे सोने देते हो।',
        'तुम न सोते हो न मुझे सोने देते हो।',
        'मैं नहीं सोता।',
        'तुम मुझे जगाते हो।'
      ],
      correctIndex: 1,
      explanation: '"Neither...nor" = न...न। Neither sleep nor let me sleep।',
    ),
    QuizQuestion(
      questionHi: '"Let the night pass." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'रात को रोको।',
        'रात को गुजर जाने दो।',
        'रात हो जाने दो।',
        'रात में जाओ।'
      ],
      correctIndex: 1,
      explanation: '"Let + subject + Verb" (Imperative Let) = रात को गुजर जाने दो।',
    ),
  ];

  // ─── L5: Test Paper I Quiz ─────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionHi: '"They don\'t let you work." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'वे काम करते हैं।',
        'वे तुम्हें काम नहीं करने देते।',
        'तुम काम नहीं करते।',
        'वे काम नहीं करते।'
      ],
      correctIndex: 1,
      explanation: '"Don\'t let" + you + work = नहीं करने देते।',
    ),
    QuizQuestion(
      questionHi: '"Dad wasn\'t letting me go." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'पापा मुझे जाने देते हैं।',
        'पापा मुझे जाने नहीं दे रहे थे।',
        'पापा गये नहीं।',
        'पापा ने जाने दिया।'
      ],
      correctIndex: 1,
      explanation: '"Wasn\'t letting" = Past Continuous negative: was/were + not + letting।',
    ),
    QuizQuestion(
      questionHi: '"Mom didn\'t let dad scold me." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मम्मी ने पापा को डाँटा।',
        'मम्मी ने पापा को मुझे डाँटने नहीं दिया।',
        'पापा ने मुझे डाँटा।',
        'मम्मी ने मुझे डाँटा।'
      ],
      correctIndex: 1,
      explanation: '"Didn\'t let" + Dad + scold + me = पापा को मुझे डाँटने नहीं दिया।',
    ),
    QuizQuestion(
      questionHi: '"I\'ll neither let you write nor read." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं तुम्हें लिखने और पढ़ने दूँगा।',
        'न मैं तुम्हें लिखने दूँगा न पढ़ने।',
        'मैं पढ़ूँगा नहीं।',
        'तुम लिखो या पढ़ो।'
      ],
      correctIndex: 1,
      explanation: '"Neither let...nor let" = न...दूँगा न...दूँगा।',
    ),
    QuizQuestion(
      questionHi: '"My financial problem doesn\'t let me do business." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं व्यवसाय करता हूँ।',
        'मेरी आर्थिक परेशानी मुझे व्यवसाय नहीं करने देती।',
        'पैसे की कमी है।',
        'मेरा व्यवसाय बंद है।'
      ],
      correctIndex: 1,
      explanation: 'Subject = Financial problem; Verb = doesn\'t let; Object = me; 2nd Verb = do business।',
    ),
    QuizQuestion(
      questionHi: '"Ram will never let you earn profit." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'राम मुनाफा कमाएगा।',
        'राम आपको मुनाफा कभी नहीं कमाने देगा।',
        'राम ने मुनाफा नहीं कमाने दिया।',
        'तुम मुनाफा कमाओगे।'
      ],
      correctIndex: 1,
      explanation: '"Will never let" = कभी नहीं देगा (Future negative)।',
    ),
    QuizQuestion(
      questionHi: '"Either you do yourself or let me do." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम करो और मैं भी करूँ।',
        'या तो तुम खुद करो या मुझे करने दो।',
        'मैं करूँगा।',
        'तुम करोगे।'
      ],
      correctIndex: 1,
      explanation: '"Either...or let me do" = या तो...या मुझे करने दो।',
    ),
    QuizQuestion(
      questionHi: '"Government can never let us do this." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'सरकार ये करेगी।',
        'सरकार हमें ये कभी नहीं करने दे सकती।',
        'हम ये करेंगे।',
        'सरकार ने ये किया।'
      ],
      correctIndex: 1,
      explanation: '"Can never let" = कभी नहीं करने दे सकती (Modal negative)।',
    ),
  ];

  // ─── L6: Test Paper II Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionHi: '"राहुल ने किसी को भी उसकी लाश को छूने नहीं दिया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Rahul let everyone touch his body.',
        'Rahul didn\'t let anyone touch his dead body.',
        'Nobody touched Rahul.',
        'Rahul touched the dead body.'
      ],
      correctIndex: 1,
      explanation: '"Didn\'t let + anyone + touch" = किसी को छूने नहीं दिया।',
    ),
    QuizQuestion(
      questionHi: '"हमें बच्चों को खेलने देना चाहिए।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Children should play.',
        'We should let children play.',
        'Let children not play.',
        'Children let us play.'
      ],
      correctIndex: 1,
      explanation: '"Should let" = देना चाहिए। We should let + children + play।',
    ),
    QuizQuestion(
      questionHi: '"एक बार मेरे सपने को सच हो जाने दो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'My dream came true.',
        'Let my dream come true once.',
        'Don\'t let my dream come true.',
        'My dream will come true.'
      ],
      correctIndex: 1,
      explanation: 'Imperative Let: Let + subject + Verb = सपने को सच होने दो।',
    ),
    QuizQuestion(
      questionHi: '"जो होता है, होने दो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Nothing happens.',
        'Don\'t let anything happen.',
        'Let whatever happens, happen.',
        'What happened?'
      ],
      correctIndex: 2,
      explanation: '"Let whatever happens, happen" = जो होता है, होने दो।',
    ),
    QuizQuestion(
      questionHi: '"मेरी बात पूरी होने दो, फिर तुम अपनी बात रखना।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'You talk first.',
        'Let me finish what I am saying, then you put forth your point.',
        'Don\'t let me talk.',
        'My talk is over.'
      ],
      correctIndex: 1,
      explanation: '"Let me finish..." = मेरी बात पूरी होने दो।',
    ),
    QuizQuestion(
      questionHi: '"वक्त ने कभी मुझे इस बारे में सोचने नहीं दिया।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I never thought about it.',
        'Time never let me think about it.',
        'Time will not let me think.',
        'I let time pass.'
      ],
      correctIndex: 1,
      explanation: 'Subject = Time; "Never let" = कभी नहीं दिया; Object = me; 2nd Verb = think।',
    ),
    QuizQuestion(
      questionHi: '"मुझे उस लड़की से शादी करने दो।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'Don\'t let me marry that girl.',
        'Let me marry that girl.',
        'I will marry that girl.',
        'She let me marry.'
      ],
      correctIndex: 1,
      explanation: 'Imperative Let: Let + me + marry + that girl।',
    ),
    QuizQuestion(
      questionHi: '"मैं वादा करता हूँ, मैं अपने जीते जी तुम्हें कभी रोने नहीं दूँगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I promise, I will let you cry always.',
        'I promise, I will never let you cry in my life.',
        'Don\'t cry.',
        'I cried for you.'
      ],
      correctIndex: 1,
      explanation: '"Will never let + you + cry" = कभी रोने नहीं दूँगा।',
    ),
  ];

  // ─── L7: Chapter Final Quiz ────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionHi: '"Let" की तीनों forms क्या हैं?',
      questionEn: 'All three forms of "Let"?',
      options: ['Let/Lets/Letting', 'Let/Let/Let', 'Let/Leted/Let', 'Let/Lett/Letted'],
      correctIndex: 1,
      explanation: '"Let" की तीनों forms Let, Let, Let ही हैं।',
    ),
    QuizQuestion(
      questionHi: '"I let you sleep." — यहाँ तुम्हें क्या समझ आया?',
      questionEn: '"I let you sleep." — what does this mean?',
      options: [
        'मैं सोता हूँ।',
        'मैं तुम्हें सोने देता हूँ।',
        'तुम सोते हो।',
        'हम दोनों सोते हैं।'
      ],
      correctIndex: 1,
      explanation: '"I let you sleep" = मैं तुम्हें सोने देता हूँ। Subject = I, Verb = let, Object = you, 2nd Verb = sleep।',
    ),
    QuizQuestion(
      questionHi: '"Dad let me go." — Tense?',
      questionEn: '"Dad let me go." — which tense?',
      options: ['Present Indefinite', 'Past Indefinite', 'Future Indefinite', 'Present Continuous'],
      correctIndex: 1,
      explanation: '"Let" की 2nd form भी "Let" है — तो Past Indefinite में भी "let" ही लिखेंगे।',
    ),
    QuizQuestion(
      questionHi: '"मेरा अकेलापन मुझे जीने नहीं देगा।" — English?',
      questionEn: 'Correct translation?',
      options: [
        'I am lonely.',
        'My loneliness will not let me live.',
        'I won\'t let loneliness.',
        'Loneliness let me live.'
      ],
      correctIndex: 1,
      explanation: 'Subject = My loneliness; "will not let" = नहीं देगा; Object = me; 2nd Verb = live।',
    ),
    QuizQuestion(
      questionHi: '"I am letting you go to market." — Tense?',
      questionEn: '"I am letting you go to market." — which tense?',
      options: ['Present Indefinite', 'Past Continuous', 'Present Continuous', 'Future Indefinite'],
      correctIndex: 2,
      explanation: '"am letting" = Present Continuous। Sub + is/am/are + letting + Obj + Verb।',
    ),
    QuizQuestion(
      questionHi: '"Can you let me live peacefully?" — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'मैं चैन से जी सकता हूँ।',
        'क्या तुम मुझे चैन से जीने दे सकते हो?',
        'वो चैन से जीता है।',
        'क्या तुम जी सकते हो?'
      ],
      correctIndex: 1,
      explanation: '"Can you let me live" = Modal Interrogative: Can + Sub + let + Obj + Verb?',
    ),
    QuizQuestion(
      questionHi: '"Let the passengers reach there first." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'यात्री पहुँच गये।',
        'यात्रियों को वहाँ पहुँचने तो दो।',
        'यात्री मत पहुँचने दो।',
        'यात्रियों को रोको।'
      ],
      correctIndex: 1,
      explanation: 'Imperative Let: Let + passengers + reach + there।',
    ),
    QuizQuestion(
      questionHi: '"Rahul never let me do any work alone." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'राहुल हमेशा अकेला काम करता है।',
        'राहुल ने मुझे कोई भी काम कभी अकेले नहीं करने दिया।',
        'मैं अकेले काम करता हूँ।',
        'राहुल ने मुझे काम दिया।'
      ],
      correctIndex: 1,
      explanation: '"Never let me do any work alone" = कोई भी काम अकेले नहीं करने दिया।',
    ),
    QuizQuestion(
      questionHi: '"I\'ll not let your pain increase." — हिंदी?',
      questionEn: 'Hindi meaning?',
      options: [
        'तुम्हारा दर्द बढ़ेगा।',
        'मैं तुम्हारे दुख को बढ़ने नहीं दूँगा।',
        'मैं दर्द नहीं झेलूँगा।',
        'दर्द बढ़ नहीं सकता।'
      ],
      correctIndex: 1,
      explanation: '"Will not let + your pain + increase" = दुख को बढ़ने नहीं दूँगा।',
    ),
    QuizQuestion(
      questionHi: '"We should let children play." — इसमें "let" के बाद क्या आता है?',
      questionEn: '"We should let children play." — what comes after "let"?',
      options: [
        'Object + Verb+ing',
        'Object + Verb 1st form',
        'Object + Verb 2nd form',
        'Object + to + Verb'
      ],
      correctIndex: 1,
      explanation: 'Let + Object + Verb 1st form (bare infinitive). "Let children play" — not "to play"।',
    ),
  ];

  // ─── Content Data ──────────────────────────────────────────────────────────

  /// Key concept examples
  static const List<Map<String, String>> conceptExamples = [
    {
      'hindi': 'मैं तुम्हें सोने देता हूँ।',
      'english': 'I let you sleep.',
      'subject': 'मैं (I)',
      'tense': 'Present Indefinite',
      'note': 'Let 1st form used',
    },
    {
      'hindi': 'राम मुझे सोने देता है।',
      'english': 'Ram lets me sleep.',
      'subject': 'राम (Ram)',
      'tense': 'Present Indefinite',
      'note': 'Let + s = Lets (3rd person singular)',
    },
    {
      'hindi': 'पापा ने मुझे जाने दिया।',
      'english': 'Dad let me go.',
      'subject': 'पापा (Dad)',
      'tense': 'Past Indefinite',
      'note': 'Let 2nd form = Let (same)',
    },
    {
      'hindi': 'मैं तुम्हें किताब पढ़ने दूँगा।',
      'english': 'I will let you read the book.',
      'subject': 'मैं (I)',
      'tense': 'Future Indefinite',
      'note': 'Will + Let + Object + Verb',
    },
  ];

  /// Full tenses table data
  static const List<Map<String, String>> tensesTable = [
    {'hindi': 'राम जाता है।', 'english': 'Ram goes.', 'verb': 'Go', 'note': 'Normal'},
    {'hindi': 'राम जाने देता है।', 'english': 'Ram lets go.', 'verb': 'Let+Go', 'note': 'Let'},
    {'hindi': 'राम मुझे जाने देता है।', 'english': 'Ram lets me go.', 'verb': 'Let+Go', 'note': 'Let+Obj'},
    {'hindi': 'राम ने तुम्हें जाने दिया।', 'english': 'Ram let you go.', 'verb': 'Let+Go', 'note': 'Past'},
    {'hindi': 'राम नहीं जा रहा है।', 'english': 'Ram is not going.', 'verb': 'Go', 'note': 'Continuous'},
    {'hindi': 'राम नहीं जाने दे रहा है।', 'english': 'Ram is not letting go.', 'verb': 'Letting+Go', 'note': 'Cont+Let'},
    {'hindi': 'मैंने किताब ली।', 'english': 'I took the book.', 'verb': 'Take', 'note': 'Normal'},
    {'hindi': 'मैंने किताब लेने दी।', 'english': 'I let take the book.', 'verb': 'Let+Take', 'note': 'Let'},
    {'hindi': 'मैंने राम को किताब लेने दी।', 'english': 'I let Ram take the book.', 'verb': 'Let+Take', 'note': 'Let+Obj'},
    {'hindi': 'क्या तुम मुझे जाने दोगे।', 'english': 'Will you let me go?', 'verb': 'Let+Go', 'note': 'Future Q'},
    {'hindi': 'मैं जाने दे सकता हूँ।', 'english': 'I can let go.', 'verb': 'Let+Go', 'note': 'Modal'},
    {'hindi': 'मैं तुम्हें जाने दे सकता हूँ।', 'english': 'I can let you go.', 'verb': 'Let+Go', 'note': 'Modal+Obj'},
  ];

  /// Quotations — all from both sets
  static const List<Map<String, String>> quotations = [
    {
      'english': 'Try to learn something about everything and everything about something.',
      'hindi': 'सब चीजों के बारे में कुछ जानने और कुछ चीजों के बारे में सब जानने की कोशिश करो।',
    },
    {
      'english': 'Good people don\'t need laws to tell them to act responsibly, while bad people will find a way around the laws.',
      'hindi': 'अच्छे लोगों को जिम्मेदारी से कार्य करने के लिए कानून की जरूरत नहीं, जबकि बुरे लोग कानून का तोड़ निकाल लेते हैं।',
    },
    {
      'english': 'Never interrupt your enemy when he is making a mistake.',
      'hindi': 'अपने दुश्मन को तब कभी न रोको जब वो गलती कर रहा हो।',
      'author': 'Napoleon Bonaparte',
    },
    {
      'english': 'Nothing in the world is more dangerous than sincere ignorance and conscientious stupidity.',
      'hindi': 'दुनिया में कुछ भी ईमानदारी की अज्ञानता और जानबूझकर की मूर्खता से ज़्यादा खतरनाक नहीं।',
    },
    {
      'english': 'To succeed in your mission, you must have single-minded devotion to your goal.',
      'hindi': 'अपने मिशन में सफल होने के लिए, आपको अपने लक्ष्य के प्रति एकाग्र समर्पण होना चाहिए।',
    },
    {
      'english': 'To live a creative life, we must lose our fear of being wrong.',
      'hindi': 'रचनात्मक जीवन जीने के लिए, हमें गलत होने का डर छोड़ना होगा।',
    },
    {
      'english': 'If you want to lift yourself up, lift up someone else.',
      'hindi': 'अगर तुम खुद को ऊपर उठाना चाहते हो, तो किसी और को ऊपर उठाओ।',
    },
    {
      'english': 'If you look at what you have in life, you\'ll always have more. If you look at what you don\'t have in life, you\'ll never have enough.',
      'hindi': 'अगर तुम देखो कि तुम्हारे पास क्या है, तो हमेशा ज़्यादा लगेगा। अगर देखो कि क्या नहीं है, तो कभी पर्याप्त नहीं लगेगा।',
      'author': 'Oprah Winfrey',
    },
    {
      'english': 'If you don\'t go after what you want, you will never have it.',
      'hindi': 'अगर तुम वो नहीं पाने की कोशिश करते जो तुम चाहते हो, तो तुम्हें कभी नहीं मिलेगा।',
    },
    {
      'english': 'A man can be as great as he wants to be. If you believe in yourself and have the courage, the determination and dedication, it can be done.',
      'hindi': 'एक इंसान उतना महान बन सकता है जितना वो बनना चाहे। अगर खुद पर यकीन हो, हिम्मत हो, दृढ़ता हो — तो हो सकता है।',
    },
    {
      'english': 'Always have dreams, because there is no achievement without a dream and an action to materialize the dream.',
      'hindi': 'हमेशा सपने रखो, क्योंकि सपने और उन्हें साकार करने की क्रिया के बिना कोई उपलब्धि नहीं।',
    },
    {
      'english': 'People will always doubt your success but it\'s not about them, it\'s all about you; what you dream, what you plan, what you put in & what you believe.',
      'hindi': 'लोग हमेशा तुम्हारी सफलता पर शक करेंगे पर वो मायने नहीं — मायने रखता है तुम्हारा सपना, तुम्हारी योजना और तुम्हारा विश्वास।',
    },
    {
      'english': 'The measure of who we are is what we do with what we have.',
      'hindi': 'हम कौन हैं इसकी पहचान इससे है कि हम जो है उससे क्या करते हैं।',
    },
    {
      'english': 'You can avoid reality but you can never avoid the consequences of avoiding reality.',
      'hindi': 'तुम हकीकत से बच सकते हो पर हकीकत से बचने के अंजाम से कभी नहीं।',
    },
    {
      'english': 'I can write better than anybody who can write faster, and I can write faster than anybody who can write better.',
      'hindi': 'मैं उससे बेहतर लिख सकता हूँ जो तेज लिखता है, और उससे तेज जो बेहतर लिखता है।',
    },
  ];

  // ─── Practice Sentences — 96 sentences in 4 sets ─────────────────────────

  static const List<Map<String, String>> practiceSet1 = [
    {'hindi': '1. राम मुझे सोने नहीं देता।', 'english': 'Ram doesn\'t let me sleep.'},
    {'hindi': '2. तुम मुझे सोने देते हो।', 'english': 'You let me sleep.'},
    {'hindi': '3. बच्चे मुझे पढ़ने नहीं देते।', 'english': 'Children don\'t let me study.'},
    {'hindi': '4. बच्चे पढ़ने नहीं देते।', 'english': 'Children don\'t let study.'},
    {'hindi': '5. क्या राम तुम्हें जाने देता है?', 'english': 'Does Ram let you go?'},
    {'hindi': '6. उसे जाने क्यों नहीं दिया गया?', 'english': 'Why did you not let him go?'},
    {'hindi': '7. मैं उसे मेरे घर आने दूँगा।', 'english': 'I will let him come to my home.'},
    {'hindi': '8. मैं पढ़ने नहीं दूँगा।', 'english': 'I will not let study.'},
    {'hindi': '9. मैं तुम्हें पढ़ने नहीं दूँगा।', 'english': 'I will not let you study.'},
    {'hindi': '10. मैं किसी को भी पढ़ने नहीं दूँगा।', 'english': 'I will not let anybody study.'},
    {'hindi': '11. मैं हर किसी को पढ़ने दूँगा।', 'english': 'I will let everyone study.'},
    {'hindi': '12. राम श्याम को आने देगा।', 'english': 'Ram will let Shyam come.'},
    {'hindi': '13. उसने मुझे कुछ नहीं करने दिया।', 'english': 'He didn\'t let me do anything.'},
    {'hindi': '14. तुमने मुझे खाने नहीं दिया।', 'english': 'You didn\'t let me eat.'},
    {'hindi': '15. सरकार ने हमें बिल्डिंग नहीं बनाने दी।', 'english': 'Government didn\'t let us construct a building.'},
    {'hindi': '16. माँ ने बच्चे को पिटने नहीं दिया।', 'english': 'Mom didn\'t let child be beaten.'},
    {'hindi': '17. मम्मी मुझे टी.वी. देखने देती है।', 'english': 'Mom lets me watch the TV.'},
    {'hindi': '18. मम्मी मुझे टी.वी. नहीं देखने देती।', 'english': 'Mom doesn\'t let me watch the TV.'},
    {'hindi': '19. क्या तुम मुझे जाने दोगे अगर मैं तुम्हें 10 रु० दूँ तो।', 'english': 'Will you let me go if I give you Rs 10?'},
    {'hindi': '20. पापा सोचने नहीं देते और फिर डाँटते हैं।', 'english': 'Dad doesn\'t let think and then scolds.'},
    {'hindi': '21. मैं तुम्हें गाने सुनने दूँगा पर पहले पैसे दो।', 'english': 'I will let you listen to songs but first, you give me money.'},
    {'hindi': '22. यहाँ हमें घर में नहीं घुसने देगा।', 'english': 'He\'ll not let us enter the house.'},
    {'hindi': '23. पापा हमें पेड़ पर नहीं चढ़ने देते।', 'english': 'Dad doesn\'t let us climb upon the tree.'},
    {'hindi': '24. बच्चे मम्मी पापा को सोने नहीं देगे।', 'english': 'Children will not let mom and dad sleep.'},
    {'hindi': '25. मैं तुम्हें पैन से लिखने नहीं दे सकता।', 'english': 'I can\'t let you write with a pen.'},
  ];

  static const List<Map<String, String>> practiceSet2 = [
    {'hindi': '26. मैं तुम्हें आम तोड़ने दूँगा।', 'english': 'I\'ll let you pluck the mangoes.'},
    {'hindi': '27. उस लड़के ने मुझे वहाँ खेलने नहीं दिया।', 'english': 'That boy didn\'t let me play there.'},
    {'hindi': '28. इस आदमी ने राम को यहाँ बैठने नहीं दिया।', 'english': 'This man didn\'t let Ram sit here.'},
    {'hindi': '29. मैं तुम्हें ये नहीं करने दूँगा।', 'english': 'I will not let you do this.'},
    {'hindi': '30. ये अक्सर मुझे जाने देता है।', 'english': 'He often lets me go.'},
    {'hindi': '31. हम कभी-कभी उसे खेलने देते थे।', 'english': 'We used to sometimes let him play.'},
    {'hindi': '32. पापा मुझे स्कूल जाने नहीं देते।', 'english': 'Dad doesn\'t let me go to school.'},
    {'hindi': '33. मेरा अकेलापन मुझे जीने नहीं देगा।', 'english': 'My loneliness won\'t let me live.'},
    {'hindi': '34. मैं तुम्हारे दुख को बढ़ने नहीं दूँगा।', 'english': 'I\'ll not let your pain increase.'},
    {'hindi': '35. उसने मुझे कार नहीं चलाने दी।', 'english': 'He didn\'t let me drive the car.'},
    {'hindi': '36. उसने मुझे बाइक नहीं चलाने दी।', 'english': 'He didn\'t let me ride the bike.'},
    {'hindi': '37. उसने मुझे मोबाइल नहीं खरीदने दिया।', 'english': 'He didn\'t let me purchase the mobile.'},
    {'hindi': '38. उसने मुझे कम्प्यूटर नहीं चलाने दिया।', 'english': 'He didn\'t let me operate the computer.'},
    {'hindi': '39. उसने मुझे पानी नहीं पीने दिया।', 'english': 'He didn\'t let me drink water.'},
    {'hindi': '40. उसने मुझे खाना नहीं खाने दिया।', 'english': 'He didn\'t let me eat the food.'},
    {'hindi': '41. क्या तुमने उसे बैठने दिया?', 'english': 'Did you let him sit?'},
    {'hindi': '42. क्या उसने मुझे फोन करने दिया?', 'english': 'Did he let me call/phone?'},
    {'hindi': '43. तुमने उसे जाने क्यों दिया?', 'english': 'Why did you let him go?'},
    {'hindi': '44. तुमने उसे खेलने क्यों दिया?', 'english': 'Why did you let him play?'},
    {'hindi': '45. उसकी मम्मी ने उसे घर से निकलने नहीं दिया।', 'english': 'His mother didn\'t let him go out of home.'},
    {'hindi': '46. ये गरीब था इसलिए लोगों ने उसे जीने नहीं दिया।', 'english': 'He was poor that\'s why people didn\'t let him live.'},
    {'hindi': '47. क्या तुम मुझे चैन से जीने दे सकते हो।', 'english': 'Can you let me live peacefully?'},
    {'hindi': '48. ये राम को लड़ने देगी।', 'english': 'She will let Ram fight.'},
    {'hindi': '49. तुम मुझे शायद न जाने दो।', 'english': 'You might not let me go.'},
    {'hindi': '50. ये पक्का मुझे जाने देगा।', 'english': 'He must let me go. / He\'ll definitely let me go.'},
  ];

  static const List<Map<String, String>> practiceSet3 = [
    {'hindi': '51. भगवान आज बारिश होने देगे।', 'english': 'God will let it rain today.'},
    {'hindi': '52. कोई मुझे पढ़ने नहीं देता।', 'english': 'Nobody lets me study.'},
    {'hindi': '53. मैं तुम्हें बाजार जाने दे रहा हूँ।', 'english': 'I am letting you go to market.'},
    {'hindi': '54. हम सब उसे जीने नहीं देते।', 'english': 'We all don\'t let him live.'},
    {'hindi': '55. मुझे बर्गर क्यों नहीं खाने देते तुम?', 'english': 'Why do you not let me eat Burger?'},
    {'hindi': '56. ये मेरा दोस्त है इसलिए मैं उसे गलत नहीं करने देता।', 'english': 'He is my friend hence I don\'t let him do wrong.'},
    {'hindi': '57. पापा मुझे 18 साल से पहले कार नहीं चलाने देगे।', 'english': 'Dad will not let me drive the car before 18.'},
    {'hindi': '58. तुम हमें जाने दो।', 'english': 'You let us go.'},
    {'hindi': '59. मैं तुम्हें जाने क्यों दूँ?', 'english': 'Why do I let you go?'},
    {'hindi': '60. उसने मुझे कभी रोने नहीं दिया।', 'english': 'He never let me cry.'},
    {'hindi': '61. तुमने मुझे कभी हँसने नहीं दिया।', 'english': 'You never let me laugh.'},
    {'hindi': '62. तुम न सोते हो न मुझे सोने देते हो।', 'english': 'You neither sleep nor let me sleep.'},
    {'hindi': '63. या तो मुझे जाने दो या फिर तुम जाओ।', 'english': 'Either you let me go or you go.'},
    {'hindi': '64. मैंने उस दिन उसे फोन नहीं करने दिया।', 'english': 'I didn\'t let him call/phone that day.'},
    {'hindi': '65. मैंने भी आने नहीं दिया।', 'english': 'Even I didn\'t let come.'},
    {'hindi': '66. तुमने मुझे सोचने तक नहीं दिया।', 'english': 'You didn\'t even let me think.'},
    {'hindi': '67. ये मुझे भी सोने नहीं देता।', 'english': 'He doesn\'t let me sleep either.'},
    {'hindi': '68. मैं न तुम्हें खेलने दूँगा न टी.वी. देखने दूँगा।', 'english': 'I\'ll neither let you play nor watch TV.'},
    {'hindi': '69. हम तुम्हें एक सेकंड भी सोचने नहीं देगे।', 'english': 'We\'ll not let you think even for a second.'},
    {'hindi': '70. मैं तुम्हें मिठाई खाने दूँगा पर तब जब तुम मुझे भी दो।', 'english': 'I\'ll let you eat sweets provided you give me too.'},
    {'hindi': '71. मैडम ने क्लास में सिर्फ मुझे बैठने दिया।', 'english': 'Madam let only me sit in the class.'},
    {'hindi': '72. ये राम को जीने नहीं देता और तुम उसे मरने नहीं देते।', 'english': 'He doesn\'t let Ram live & you don\'t let him die.'},
    {'hindi': '73. मैं तुम्हें एक्सरसाइज़ नहीं करने दूँगा।', 'english': 'I\'ll not let you exercise.'},
    {'hindi': '74. मम्मी और पापा हमें खेलने देगे।', 'english': 'Mom and dad will let us play.'},
    {'hindi': '75. क्या आप मेरे भाई को जाने दोगे?', 'english': 'Will you let my brother go?'},
  ];

  static const List<Map<String, String>> practiceSet4 = [
    {'hindi': '76. राहुल ने मुझे कोई भी काम कभी अकेले नहीं करने दिया।', 'english': 'Rahul never let me do any work alone.'},
    {'hindi': '77. ये हम बच्चों को मोबाइल नहीं छेड़ने देते हैं।', 'english': 'He doesn\'t let we kids touch his mobile.'},
    {'hindi': '78. बॉस मुझे सोचने तक नहीं देते।', 'english': 'Boss doesn\'t even let me think.'},
    {'hindi': '79. मैं सोचने क्यों दूँ?', 'english': 'Why do I let think?'},
    {'hindi': '80. राम उसे क्यों जाने दे?', 'english': 'Why does Ram let him go?'},
    {'hindi': '81. मम्मी मुझे पढ़ने जरूर देगी।', 'english': 'Mom must let me study.'},
    {'hindi': '82. ये मुझे पढ़ने देता है।', 'english': 'He lets me study.'},
    {'hindi': '83. यहाँ लोग मुझे चैन से जीने नहीं देते।', 'english': 'People here don\'t let me live peacefully.'},
    {'hindi': '84. बच्चे पढ़ने नहीं देते।', 'english': 'Children don\'t let study.'},
    {'hindi': '85. क्या उसने तुम्हें आने दिया?', 'english': 'Did he let you come?'},
    {'hindi': '86. हमें क्यों नहीं बोलने दिया तुमने?', 'english': 'Why did you not let us speak?'},
    {'hindi': '87. राम ने सीता को जहर क्यों खाने दिया?', 'english': 'Why did Ram let Seeta eat poison?'},
    {'hindi': '88. सरकार हमें अपनी बात नहीं कहने देती।', 'english': 'Government doesn\'t let us say what we want.'},
    {'hindi': '89. मैं तुम्हें उस बच्चे को नहीं पीटने दूँगा।', 'english': 'I will not let you beat that child.'},
    {'hindi': '90. राम तुम्हें कभी जीतने नहीं देगा।', 'english': 'Ram will never let you win.'},
    {'hindi': '91. सीता का भाई मुझे अपने घर में नहीं घुसने देता।', 'english': 'Seeta\'s brother doesn\'t let me enter his home.'},
    {'hindi': '92. क्या तुम मुझे मिलने दोगे?', 'english': 'Will you let me meet?'},
    {'hindi': '93. राम उसे जाने नहीं देता।', 'english': 'Ram doesn\'t let him go.'},
    {'hindi': '94. लोग उसे मुझसे मिलने नहीं देते।', 'english': 'People don\'t let him meet me.'},
    {'hindi': '95. मेरे पापा मुझे आने नहीं देते।', 'english': 'My father doesn\'t let me come.'},
    {'hindi': '96. सीता राम को वहाँ जाने क्यों नहीं देती?', 'english': 'Why does Seeta not let Ram go there?'},
  ];

  // ─── Test Paper I — English → Hindi (30 sentences) ───────────────────────
  static const List<Map<String, String>> testPaper1Sentences = [
    {'english': '1. I will let him meet her.', 'hindi': 'मैं उसे उससे मिलने दूँगा।'},
    {'english': '2. They don\'t let you work.', 'hindi': 'वे तुम्हें काम नहीं करने देते।'},
    {'english': '3. She doesn\'t let you write.', 'hindi': 'वो तुम्हें लिखने नहीं देती।'},
    {'english': '4. Dad wasn\'t letting me go.', 'hindi': 'पापा मुझे जाने नहीं दे रहे थे।'},
    {'english': '5. Will you please let us play?', 'hindi': 'क्या तुम प्लीज हमें खेलने दोगे?'},
    {'english': '6. I will let you take this book provided you give money.', 'hindi': 'मैं तुम्हें ये किताब लेने दूँगा बशर्ते तुम पैसे दे दो।'},
    {'english': '7. Then, I might let you go there.', 'hindi': 'तब शायद मैं तुम्हें वहाँ जाने दूँ।'},
    {'english': '8. Dad doesn\'t let me sing.', 'hindi': 'पापा मुझे गाने नहीं देते।'},
    {'english': '9. I will not let you do this.', 'hindi': 'मैं तुम्हें ये नहीं करने दूँगा।'},
    {'english': '10. Why did you let me go?', 'hindi': 'तुमने मुझे जाने क्यों दिया?'},
    {'english': '11. You never let us go.', 'hindi': 'तुम हमें कभी जाने नहीं देते। / तुमने हमें कभी जाने नहीं दिया।'},
    {'english': '12. I will not let you beat my brother.', 'hindi': 'मैं तुम्हें अपने भाई को पीटने नहीं दूँगा।'},
    {'english': '13. They will never let you win.', 'hindi': 'वे तुम्हें कभी जीतने नहीं देगे।'},
    {'english': '14. You didn\'t let him study that\'s why he failed.', 'hindi': 'तुमने उसे पढ़ने नहीं दिया इसलिए वो फेल हो गया।'},
    {'english': '15. Government can never let us do this.', 'hindi': 'सरकार हमें ये कभी नहीं करने दे सकती।'},
    {'english': '16. Mom didn\'t let dad scold me.', 'hindi': 'मम्मी ने पापा को मुझे डाँटने नहीं दिया।'},
    {'english': '17. Mom lets me eat whatever I want.', 'hindi': 'मम्मी मुझे खाने देती है जो कुछ मैं चाहता हूँ।'},
    {'english': '18. You didn\'t even let us talk.', 'hindi': 'तुमने हमें बात तक नहीं करने दी।'},
    {'english': '19. Ram doesn\'t let me go either.', 'hindi': 'राम भी मुझे जाने नहीं देता।'},
    {'english': '20. I\'ll neither let you write nor read.', 'hindi': 'न मैं तुम्हें लिखने दूँगा न पढ़ने।'},
    {'english': '21. We\'ll not let you enter even once.', 'hindi': 'हम तुम्हें एक बार भी नहीं घुसने देगे।'},
    {'english': '22. I\'ll let you purchase, provided you don\'t tell dad.', 'hindi': 'मैं तुम्हें खरीदने दूँगा पर तब जब तुम पापा को न बताओ।'},
    {'english': '23. She lets only Ram eat in the class.', 'hindi': 'वो क्लास में केवल राम को खाने देती है।'},
    {'english': '24. He doesn\'t let me eat.', 'hindi': 'वो मुझे खाने नहीं देता।'},
    {'english': '25. Let me go with people.', 'hindi': 'मुझे लोगों के साथ जाने दो।'},
    {'english': '26. Ram will never let you earn profit.', 'hindi': 'राम आपको मुनाफा कभी नहीं कमाने देगा।'},
    {'english': '27. Why did he let me do this?', 'hindi': 'उसने मुझे ये क्यों करने दिया?'},
    {'english': '28. He doesn\'t let go.', 'hindi': 'वो जाने नहीं देता।'},
    {'english': '29. Either you do yourself or let me do.', 'hindi': 'या तो तुम खुद करो या मुझे करने दो।'},
    {'english': '30. My financial problem doesn\'t let me do business.', 'hindi': 'मेरी आर्थिक परेशानी मुझे व्यवसाय नहीं करने देती।'},
  ];

  // ─── Test Paper II — Hindi → English (30 sentences) ──────────────────────
  static const List<Map<String, String>> testPaper2Sentences = [
    {'hindi': '1. राहुल ने किसी को भी उसकी लाश को छूने नहीं दिया।', 'english': 'Rahul didn\'t let anyone touch his dead body.'},
    {'hindi': '2. मेरे अपनों ने कभी मुझे ये महसूस नहीं होने दिया कि मैं अकेला हूँ।', 'english': 'My real ones never let me feel that I was alone.'},
    {'hindi': '3. उसने तुम्हें मुझसे क्यों नहीं मिलने दिया?', 'english': 'Why did he not let you meet me?'},
    {'hindi': '4. वक्त ने कभी मुझे इस बारे में सोचने नहीं दिया।', 'english': 'Time never let me think about it.'},
    {'hindi': '5. पापा मुझे कार नहीं खरीदने देगे।', 'english': 'Dad will not let me buy a car.'},
    {'hindi': '6. मैं वादा करता हूँ, मैं अपने जीते जी तुम्हें कभी रोने नहीं दूँगा।', 'english': 'I promise, I will never let you cry in my life.'},
    {'hindi': '7. हम सब उसे जाने नहीं देगे।', 'english': 'We all will not let him go.'},
    {'hindi': '8. हमें बच्चों को खेलने देना चाहिए।', 'english': 'We should let children play.'},
    {'hindi': '9. हमें वहाँ जाने दो।', 'english': 'Let us go there.'},
    {'hindi': '10. मुझे ये कहने दो।', 'english': 'Let me say this.'},
    {'hindi': '11. उसे राहुल के साथ बिल्कुल मत जाने दो।', 'english': 'Don\'t let him go with Rahul at all.'},
    {'hindi': '12. मुझे घड़ी देखने दो।', 'english': 'Let me see the watch.'},
    {'hindi': '13. मामाजी को घर वापस आने दो, तब बात करेंगे।', 'english': 'Let uncle come back home, then we will talk.'},
    {'hindi': '14. लोगों को जो कहना है, कहने दो।', 'english': 'Let people say what they want.'},
    {'hindi': '15. रात को गुजर जाने दो।', 'english': 'Let the night pass.'},
    {'hindi': '16. सभी को आ जाने दो।', 'english': 'Let everyone come.'},
    {'hindi': '17. एक बार मेरे सपने को सच हो जाने दो।', 'english': 'Let my dream come true once.'},
    {'hindi': '18. मुझे उस लड़की से शादी करने दो।', 'english': 'Let me marry that girl.'},
    {'hindi': '19. हमें उसके घर जाने दो।', 'english': 'Let us go to his/her home.'},
    {'hindi': '20. मुझे कम्प्यूटर सीख लेने दो।', 'english': 'Let me learn computer.'},
    {'hindi': '21. बच्चों को आ जाने दो।', 'english': 'Let the children come.'},
    {'hindi': '22. पापा को ऑफिस चले जाने दो। फिर हम खेलेंगे।', 'english': 'Let dad go to office. Then we will play.'},
    {'hindi': '23. मुझे उससे मिल लेने दो।', 'english': 'Let me meet him/her.'},
    {'hindi': '24. उन्हें तैयार हो जाने दो।', 'english': 'Let them get ready.'},
    {'hindi': '25. मैंने तुम्हें उस दिन आने नहीं दिया। मुझे बेहद अफसोस है।', 'english': 'I didn\'t let you come that day. I am extremely sorry.'},
    {'hindi': '26. बाल्टी में पानी भरने दो।', 'english': 'Let the bucket fill with water.'},
    {'hindi': '27. बाल्टी को पूरा भरने दो।', 'english': 'Let the bucket fill completely.'},
    {'hindi': '28. जो होता है, होने दो।', 'english': 'Let whatever happens, happen.'},
    {'hindi': '29. यात्रियों को वहाँ पहुँचने तो दो।', 'english': 'Let the passengers reach there first.'},
    {'hindi': '30. मेरी बात पूरी होने दो, फिर तुम अपनी बात रखना।', 'english': 'Let me finish what I am saying, then you put forth your point.'},
  ];
}