import '../models/lesson_model.dart';

/// Chapter 31 — Prepositional Phrases (Prepositional वाक्यांश)
class Chapter31Data {

  static ChapterModel get chapter => ChapterModel(
        id: 31,
        title: 'Prepositional Phrases',
        titleHindi: 'Prepositional वाक्यांश',
        description: 'According to, At the risk of, Because of & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Group A', titleHindi: 'According to — In the hope of', emoji: '📖', type: LessonType.ch31GroupA, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Group B', titleHindi: 'In lieu of — Anything at all', emoji: '📝', type: LessonType.ch31GroupB, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch31ChapterQuiz, status: LessonStatus.inProgress, totalXP: 80),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch31GroupA:       return groupAQuestions;
      case LessonType.ch31GroupB:       return groupBQuestions;
      case LessonType.ch31ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> groupAPhrases = [
    {
      'phrase':   'According to',
      'hindi':    'के अनुसार',
      'example1': 'According to my sisters, I am the best brother in the world.',
      'ex1Hi':    'मेरी बहनों के अनुसार, मैं दुनिया का सबसे अच्छा भाई हूँ।',
      'example2': 'According to Aman, Life is beautiful.',
      'ex2Hi':    'अमन के अनुसार, ज़िन्दगी खूबसूरत है।',
    },
    {
      'phrase':   'At the risk of',
      'hindi':    'खतरा मोल लेकर',
      'example1': 'I came to your house at the risk of my life but you didn\'t even open the door.',
      'ex1Hi':    'मैं अपनी जान का खतरा मोल लेकर तुम्हारे घर आया पर तुमने दरवाज़ा तक नहीं खोला।',
      'example2': 'At the risk of his life, he saved me.',
      'ex2Hi':    'अपनी जान का खतरा मोल लेकर उसने मुझे बचाया।',
    },
    {
      'phrase':   'At the top of one\'s voice',
      'hindi':    'दम लगाकर आवाज़ लगाना या चिल्लाना',
      'example1': 'He shouted at the top of his voice when his elder brother slapped him.',
      'ex1Hi':    'जब उसके बड़े भाई ने उसे थप्पड़ मारा तो वो दम लगाकर चिल्लाया।',
      'example2': 'Why are you shouting at the top of your voice?',
      'ex2Hi':    'तुम इतने दम से क्यों चिल्ला रहे हो?',
    },
    {
      'phrase':   'Because of / Due to',
      'hindi':    'के कारण, की वजह से',
      'example1': 'I started playing cricket due to my father\'s enormous support.',
      'ex1Hi':    'मैंने क्रिकेट खेलना शुरू किया अपने पिताजी के भरपूर सहयोग की वजह से।',
      'example2': 'Because of poverty, many people die every year.',
      'ex2Hi':    'गरीबी की वजह से हर साल बहुत सारे लोग मरते हैं।',
    },
    {
      'phrase':   'By all means / At anyhow',
      'hindi':    'किसी भी तरह, किसी भी कीमत पर, चाहे जैसे भी',
      'example1': 'Just complete this chapter today by all means.',
      'ex1Hi':    'बस आज इस अध्याय को किसी भी तरह पूरा करो।',
      'example2': 'I have to meet her today at anyhow.',
      'ex2Hi':    'मुझे आज किसी भी कीमत पर उससे मिलना है।',
    },
    {
      'phrase':   'For the sake of / For one\'s sake',
      'hindi':    'के खातिर',
      'example1': 'For your mom\'s sake, please open the door right now.',
      'ex1Hi':    'अपनी माँ के खातिर, कृपया अभी दरवाज़ा खोलो।',
      'example2': 'For God sake, do exactly what I am saying.',
      'ex2Hi':    'भगवान के खातिर, वही करो जो मैं कह रहा हूँ।',
    },
    {
      'phrase':   'In favor of',
      'hindi':    'के पक्ष में',
      'example1': 'Don\'t take the decision in favor of your brother otherwise people will doubt you.',
      'ex1Hi':    'अपने भाई के पक्ष में फैसला मत लो वरना लोग तुम पर शक करेंगे।',
      'example2': 'I did it in favor of you because I loved you.',
      'ex2Hi':    'मैंने यह तुम्हारे पक्ष में किया क्योंकि मुझे तुमसे प्यार था।',
    },
    {
      'phrase':   'In the hope of',
      'hindi':    'उम्मीद में',
      'example1': 'I studied hard in the hope of scoring good marks but all in vein.',
      'ex1Hi':    'मैंने अच्छे अंक लाने की उम्मीद में खूब पढ़ाई की पर सब व्यर्थ।',
      'example2': 'In the hope of success, he wasted his teenage but eventually he achieved what he desired for.',
      'ex2Hi':    'सफलता की उम्मीद में उसने अपनी जवानी गँवा दी पर आखिरकार उसने वो हासिल किया जो वो चाहता था।',
    },
  ];

  static const List<Map<String, String>> groupBPhrases = [
    {
      'phrase':   'In lieu of / In the place of / Instead of',
      'hindi':    'के बदले में',
      'example1': 'I purchased a mobile instead of wasting money on laptop.',
      'ex1Hi':    'मैंने लैपटॉप पर पैसा बर्बाद करने के बदले मोबाइल खरीदा।',
      'example2': 'In lieu of tears, I preferred to smile.',
      'ex2Hi':    'आँसुओं के बदले मैंने मुस्कुराना पसंद किया।',
    },
    {
      'phrase':   'In order to',
      'hindi':    'के लिए / के उद्देश्य से',
      'example1': 'I sacrificed my whole life in order to provide you better education.',
      'ex1Hi':    'मैंने तुम्हें बेहतर शिक्षा दिलाने के लिए अपनी पूरी ज़िन्दगी कुर्बान कर दी।',
      'example2': 'In order to find peace, he roamed the world but he ended up his journey back to his country itself.',
      'ex2Hi':    'शान्ति ढूँढने के लिए वो दुनिया घूमा पर उसकी यात्रा वापस उसके अपने देश पर ही खत्म हुई।',
    },
    {
      'phrase':   'On behalf of / On one\'s behalf',
      'hindi':    'की तरफ से',
      'example1': 'Please say sorry to him on behalf of me.',
      'ex1Hi':    'कृपया मेरी तरफ से उससे माफी माँगो।',
      'example2': 'I wrote a letter to Mr Ram on behalf of you.',
      'ex2Hi':    'मैंने तुम्हारी तरफ से श्री राम को पत्र लिखा।',
    },
    {
      'phrase':   'With reference to',
      'hindi':    'के संदर्भ में',
      'example1': 'With reference to our conversation last week, I am sending my brother to your home.',
      'ex1Hi':    'पिछले हफ्ते हुई हमारी बातचीत के संदर्भ में, मैं अपने भाई को तुम्हारे घर भेज रहा हूँ।',
      'example2': 'With reference to my application, I want to talk to you.',
      'ex2Hi':    'मेरे आवेदन के संदर्भ में, मैं आपसे बात करना चाहता हूँ।',
    },
    {
      'phrase':   'Not at all',
      'hindi':    'बिल्कुल नहीं',
      'example1': 'Not at all! I can never come with you.',
      'ex1Hi':    'बिल्कुल नहीं! मैं तुम्हारे साथ कभी नहीं आ सकता।',
      'example2': 'He can\'t read at all.',
      'ex2Hi':    'वो बिल्कुल भी पढ़ नहीं सकता।',
    },
    {
      'phrase':   'Anything at all',
      'hindi':    'कुछ भी — ज़ोर देते हुए कहना',
      'example1': 'I can do anything at all for you.',
      'ex1Hi':    'मैं तुम्हारे लिए कुछ भी कर सकता हूँ।',
      'example2': 'He loved doing anything at all to pass the exam.',
      'ex2Hi':    'उसे परीक्षा पास करने के लिए कुछ भी करना अच्छा लगता था।',
    },
  ];

  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'The only way to do great work is to love what you do.',
      'hindi':   'महान कार्य करने का सिर्फ एक ही तरीका है, आप जो भी करो उसे दिल से करो।',
      'author':  'Steve Jobs',
    },
    {
      'english': 'People will forget what you said, people will forget what you did, but people will never forget how you made them feel.',
      'hindi':   'लोग भूल जायेंगे आपने क्या कहा, लोग भूल जायेंगे आपने क्या किया, पर लोग कभी नहीं भूलेंगे कि आपने उन्हें कैसा महसूस करवाया।',
      'author':  '',
    },
    {
      'english': 'I am not a product of circumstances. I am a product of my decisions.',
      'hindi':   'मैं हालातों से निर्मित प्राणी नहीं, मेरा निर्माण मेरे फैसलों से हुआ है।',
      'author':  '',
    },
    {
      'english': 'When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.',
      'hindi':   'जब सब कुछ आपके खिलाफ हो रहा हो, तो ये बात याद करना कि हवाईजहाज भी हवा के विरुद्ध ही उड़ान भरता है, उसके साथ नहीं।',
      'author':  'Henry Ford',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> groupAQuestions = [
    QuizQuestion(
      questionEn: '"According to" means ___.',
      questionHi: '"According to" का अर्थ?',
      options: ['की वजह से', 'के अनुसार', 'के खातिर', 'के पक्ष में'],
      correctIndex: 1,
      explanation: '"According to" = के अनुसार। "According to Aman, Life is beautiful."',
    ),
    QuizQuestion(
      questionEn: '"At the risk of his life, he saved me." — Hindi?',
      questionHi: '"At the risk of his life, he saved me."',
      options: [
        'उसने मुझे डुबो दिया।',
        'उसने जान बचाई।',
        'अपनी जान का खतरा मोल लेकर उसने मुझे बचाया।',
        'उसने मेरी मदद की।',
      ],
      correctIndex: 2,
      explanation: '"At the risk of" = खतरा मोल लेकर। "At the risk of his life, he saved me."',
    ),
    QuizQuestion(
      questionEn: '"At the top of one\'s voice" means ___.',
      questionHi: '"At the top of one\'s voice" का अर्थ?',
      options: [
        'धीरे बोलना',
        'दम लगाकर आवाज़ लगाना / चिल्लाना',
        'गाना गाना',
        'सोचते हुए बोलना',
      ],
      correctIndex: 1,
      explanation: '"At the top of one\'s voice" = दम लगाकर चिल्लाना। "Why are you shouting at the top of your voice?"',
    ),
    QuizQuestion(
      questionEn: '"Because of / Due to" means ___.',
      questionHi: '"Because of / Due to" का अर्थ?',
      options: ['के अनुसार', 'उम्मीद में', 'के कारण / की वजह से', 'के पक्ष में'],
      correctIndex: 2,
      explanation: '"Because of / Due to" = के कारण / की वजह से। "Because of poverty, many people die every year."',
    ),
    QuizQuestion(
      questionEn: '"By all means / At anyhow" means ___.',
      questionHi: '"By all means / At anyhow" का अर्थ?',
      options: [
        'बिल्कुल नहीं',
        'किसी भी तरह / किसी भी कीमत पर',
        'के बदले में',
        'के संदर्भ में',
      ],
      correctIndex: 1,
      explanation: '"By all means / At anyhow" = किसी भी तरह। "Just complete this chapter today by all means."',
    ),
    QuizQuestion(
      questionEn: '"For the sake of" means ___.',
      questionHi: '"For the sake of" का अर्थ?',
      options: ['के कारण', 'के खातिर', 'के पक्ष में', 'के अनुसार'],
      correctIndex: 1,
      explanation: '"For the sake of / For one\'s sake" = के खातिर। "For your mom\'s sake, please open the door."',
    ),
    QuizQuestion(
      questionEn: '"In favor of" means ___.',
      questionHi: '"In favor of" का अर्थ?',
      options: ['के खिलाफ', 'की वजह से', 'के पक्ष में', 'उम्मीद में'],
      correctIndex: 2,
      explanation: '"In favor of" = के पक्ष में। "I did it in favor of you because I loved you."',
    ),
    QuizQuestion(
      questionEn: '"In the hope of scoring good marks, I studied hard." — "In the hope of" means ___.',
      questionHi: '"In the hope of" का अर्थ?',
      options: ['डर में', 'उम्मीद में', 'के बदले में', 'की तरफ से'],
      correctIndex: 1,
      explanation: '"In the hope of" = उम्मीद में। "I studied hard in the hope of scoring good marks."',
    ),
  ];

  static const List<QuizQuestion> groupBQuestions = [
    QuizQuestion(
      questionEn: '"In lieu of / Instead of" means ___.',
      questionHi: '"In lieu of / Instead of" का अर्थ?',
      options: ['के कारण', 'के बदले में', 'की तरफ से', 'के अनुसार'],
      correctIndex: 1,
      explanation: '"In lieu of / Instead of" = के बदले में। "In lieu of tears, I preferred to smile."',
    ),
    QuizQuestion(
      questionEn: '"In order to" means ___.',
      questionHi: '"In order to" का अर्थ?',
      options: ['के बदले में', 'के संदर्भ में', 'के लिए / के उद्देश्य से', 'की वजह से'],
      correctIndex: 2,
      explanation: '"In order to" = के लिए / के उद्देश्य से। "I sacrificed my whole life in order to provide you better education."',
    ),
    QuizQuestion(
      questionEn: '"On behalf of" means ___.',
      questionHi: '"On behalf of" का अर्थ?',
      options: ['के अनुसार', 'के पक्ष में', 'की तरफ से', 'उम्मीद में'],
      correctIndex: 2,
      explanation: '"On behalf of / On one\'s behalf" = की तरफ से। "Please say sorry to him on behalf of me."',
    ),
    QuizQuestion(
      questionEn: '"With reference to our conversation, I am sending my brother." — "With reference to" means ___.',
      questionHi: '"With reference to" का अर्थ?',
      options: ['के बदले में', 'के संदर्भ में', 'के खातिर', 'की वजह से'],
      correctIndex: 1,
      explanation: '"With reference to" = के संदर्भ में। "With reference to my application, I want to talk to you."',
    ),
    QuizQuestion(
      questionEn: '"Not at all! I can never come with you." — "Not at all" means ___.',
      questionHi: '"Not at all" का अर्थ?',
      options: ['थोड़ा नहीं', 'बिल्कुल नहीं', 'कभी-कभी', 'शायद नहीं'],
      correctIndex: 1,
      explanation: '"Not at all" = बिल्कुल नहीं। "He can\'t read at all."',
    ),
    QuizQuestion(
      questionEn: '"Anything at all" is used to ___.',
      questionHi: '"Anything at all" किस लिए उपयोग होता है?',
      options: [
        'नकारात्मक अर्थ देने के लिए',
        'कुछ भी कहने पर ज़ोर देने के लिए',
        'बिल्कुल नहीं कहने के लिए',
        'उम्मीद जताने के लिए',
      ],
      correctIndex: 1,
      explanation: '"Anything at all" = कुछ भी — ज़ोर देते हुए कहना। "I can do anything at all for you."',
    ),
    QuizQuestion(
      questionEn: 'Which phrase means "की तरफ से"?',
      questionHi: '"की तरफ से" के लिए कौन सा phrase सही है?',
      options: ['In lieu of', 'In order to', 'On behalf of', 'With reference to'],
      correctIndex: 2,
      explanation: '"On behalf of / On one\'s behalf" = की तरफ से। "I wrote a letter to Mr Ram on behalf of you."',
    ),
    QuizQuestion(
      questionEn: '"Instead of" is the same as ___.',
      questionHi: '"Instead of" का समानार्थी phrase कौन सा है?',
      options: ['In order to', 'In lieu of', 'In the hope of', 'In favor of'],
      correctIndex: 1,
      explanation: '"In lieu of / In the place of / Instead of" — तीनों का अर्थ है "के बदले में".',
    ),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"According to my sisters, I am the best brother." — "According to" means ___.',
      questionHi: '"According to" का अर्थ?',
      options: ['की वजह से', 'के अनुसार', 'के खातिर', 'के पक्ष में'],
      correctIndex: 1,
      explanation: '"According to" = के अनुसार।',
    ),
    QuizQuestion(
      questionEn: '"At the risk of" means ___.',
      questionHi: '"At the risk of" का अर्थ?',
      options: ['उम्मीद में', 'के बदले में', 'खतरा मोल लेकर', 'के संदर्भ में'],
      correctIndex: 2,
      explanation: '"At the risk of" = खतरा मोल लेकर। "At the risk of his life, he saved me."',
    ),
    QuizQuestion(
      questionEn: '"Because of poverty, many people die every year." — Choose the correct Hindi.',
      questionHi: '"Because of poverty, many people die every year." — सही हिंदी चुनें।',
      options: [
        'गरीबी के बावजूद कई लोग मरते हैं।',
        'गरीबी की वजह से हर साल बहुत सारे लोग मरते हैं।',
        'गरीबी के पक्ष में लोग मरते हैं।',
        'गरीबी की उम्मीद में लोग मरते हैं।',
      ],
      correctIndex: 1,
      explanation: '"Because of / Due to" = के कारण / की वजह से।',
    ),
    QuizQuestion(
      questionEn: '"In lieu of tears, I preferred to smile." — "In lieu of" means ___.',
      questionHi: '"In lieu of" का अर्थ?',
      options: ['के लिए', 'के बदले में', 'की तरफ से', 'के संदर्भ में'],
      correctIndex: 1,
      explanation: '"In lieu of / Instead of" = के बदले में।',
    ),
    QuizQuestion(
      questionEn: '"I sacrificed my life in order to provide you better education." — "In order to" means ___.',
      questionHi: '"In order to" का अर्थ?',
      options: ['की उम्मीद में', 'के बदले में', 'के लिए / के उद्देश्य से', 'की तरफ से'],
      correctIndex: 2,
      explanation: '"In order to" = के लिए / के उद्देश्य से।',
    ),
    QuizQuestion(
      questionEn: '"Please say sorry to him on behalf of me." — "On behalf of me" means ___.',
      questionHi: '"On behalf of me" का अर्थ?',
      options: ['मेरे कारण', 'मेरी तरफ से', 'मेरे अनुसार', 'मेरे पक्ष में'],
      correctIndex: 1,
      explanation: '"On behalf of" = की तरफ से।',
    ),
    QuizQuestion(
      questionEn: '"With reference to" means ___.',
      questionHi: '"With reference to" का अर्थ?',
      options: ['के खातिर', 'के संदर्भ में', 'की वजह से', 'किसी भी तरह'],
      correctIndex: 1,
      explanation: '"With reference to" = के संदर्भ में।',
    ),
    QuizQuestion(
      questionEn: '"Not at all" means ___.',
      questionHi: '"Not at all" का अर्थ?',
      options: ['थोड़ा-सा', 'बिल्कुल नहीं', 'कभी-कभी', 'ज़रूर'],
      correctIndex: 1,
      explanation: '"Not at all" = बिल्कुल नहीं। "He can\'t read at all."',
    ),
    QuizQuestion(
      questionEn: '"For God sake, do exactly what I am saying." — "For God sake" means ___.',
      questionHi: '"For God sake" का अर्थ?',
      options: ['भगवान के कारण', 'भगवान के खातिर', 'भगवान के अनुसार', 'भगवान के पक्ष में'],
      correctIndex: 1,
      explanation: '"For the sake of / For one\'s sake" = के खातिर।',
    ),
    QuizQuestion(
      questionEn: '"Just complete this chapter today by all means." — "By all means" means ___.',
      questionHi: '"By all means" का अर्थ?',
      options: [
        'बिल्कुल नहीं',
        'किसी भी तरह / किसी भी कीमत पर',
        'के बदले में',
        'उम्मीद में',
      ],
      correctIndex: 1,
      explanation: '"By all means / At anyhow" = किसी भी तरह / किसी भी कीमत पर।',
    ),
  ];
}