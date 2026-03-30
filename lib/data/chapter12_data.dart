import '../models/lesson_model.dart';

/// Chapter 12 — Interjection (विस्मयादिबोधक)
class Chapter12Data {

  static ChapterModel get chapter => ChapterModel(
        id: 12, title: 'Interjection', titleHindi: 'विस्मयादिबोधक',
        description: 'Express emotions: Joy, Grief, Surprise & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What is an Interjection?', titleHindi: 'Interjection क्या है?',
              emoji: '😲', type: LessonType.ch12Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Joy & Grief', titleHindi: 'खुशी और दुख',
              emoji: '😄', type: LessonType.ch12JoyGrief, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Surprise, Consent & Mistake', titleHindi: 'चौंकना, सहमति और गलती',
              emoji: '😮', type: LessonType.ch12SurpriseConsent, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Everyday Interjections', titleHindi: 'रोज़मर्रा के Interjections',
              emoji: '💬', type: LessonType.ch12Everyday, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch12ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 50),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch12Intro:         return introQuestions;
      case LessonType.ch12JoyGrief:      return joyGriefQuestions;
      case LessonType.ch12SurpriseConsent: return surpriseConsentQuestions;
      case LessonType.ch12Everyday:      return everydayQuestions;
      case LessonType.ch12ChapterQuiz:   return chapterFinalQuestions;
      default:                           return [];
    }
  }

  // ── L1 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'What is an Interjection?',
      questionHi: 'Interjection (विस्मयादिबोधक) किसे कहते हैं?',
      options: ['Noun की जगह प्रयोग होने वाला शब्द', 'अचानक भावनाओं को व्यक्त करने वाला शब्द', 'क्रिया की विशेषता बताने वाला शब्द', 'दो वाक्यों को जोड़ने वाला शब्द'],
      correctIndex: 1,
      explanation: 'Interjections = अचानक खुशी, दुख, चौंकना, शाबाशी आदि भावनाओं को व्यक्त करने वाले शब्द।'),
    QuizQuestion(
      questionEn: 'What punctuation mark follows an Interjection?',
      questionHi: 'Interjection के बाद कौन सा चिह्न लगाते हैं?',
      options: ['Full Stop (.)', 'Comma (,)', 'Exclamation Mark (!)', 'Question Mark (?)'],
      correctIndex: 2,
      explanation: 'Interjections के बाद Exclamation Mark (!) लगाया जाता है।'),
    QuizQuestion(
      questionEn: 'Which of these is an Interjection expressing JOY?',
      questionHi: 'इनमें से कौन सा खुशी वाला Interjection है?',
      options: ['Alas!', 'Hurrah!', 'Oops!', 'Oh no!'],
      correctIndex: 1,
      explanation: '"Hurrah!" खुशी व्यक्त करता है। "Alas!" और "Oh no!" दुख व्यक्त करते हैं।'),
    QuizQuestion(
      questionEn: 'Which expresses GRIEF?',
      questionHi: 'इनमें से कौन सा दुख व्यक्त करता है?',
      options: ['Wow!', 'Bravo!', 'Alas!', 'Hurrah!'],
      correctIndex: 2,
      explanation: '"Alas!" दुख (grief) व्यक्त करता है।'),
    QuizQuestion(
      questionEn: 'Interjections can express how many types of emotions?',
      questionHi: 'Interjections कितने प्रकार की भावनाएँ व्यक्त कर सकते हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 3,
      explanation: 'Interjections 5 types: Joy, Grief, Surprise, Consent, Mistake।'),
  ];

  // ── L2 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> joyGriefQuestions = [
    QuizQuestion(
      questionEn: '"Hurrah!" expresses ___.',
      questionHi: '"Hurrah!" किस भावना को व्यक्त करता है?',
      options: ['Grief', 'Surprise', 'Joy', 'Mistake'],
      correctIndex: 2,
      explanation: '"Hurrah!" = खुशी (Joy) — जीत की खुशी में।'),
    QuizQuestion(
      questionEn: '"Alas!" expresses ___.',
      questionHi: '"Alas!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Consent'],
      correctIndex: 1,
      explanation: '"Alas!" = दुख (Grief) — हाय!, अफसोस!'),
    QuizQuestion(
      questionEn: '"Wow!" can express both ___.',
      questionHi: '"Wow!" किन दो भावनाओं को व्यक्त कर सकता है?',
      options: ['Joy और Grief', 'Joy और Surprise', 'Grief और Surprise', 'Mistake और Consent'],
      correctIndex: 1,
      explanation: '"Wow!" Joy (खुशी) और Surprise (चौंकना) दोनों के लिए प्रयोग होता है।'),
    QuizQuestion(
      questionEn: '"How sad!" means ___.',
      questionHi: '"How sad!" का हिंदी अर्थ?',
      options: ['कितने खुशी की बात!', 'कितने दुख की बात!', 'कितना चौंकाने वाला!', 'शाबास!'],
      correctIndex: 1,
      explanation: '"How sad!" = कितने दुख की बात! — Grief expression।'),
    QuizQuestion(
      questionEn: '"Thanks!" is an interjection of ___.',
      questionHi: '"Thanks!" किस प्रकार का Interjection है?',
      options: ['Grief', 'Surprise', 'Mistake', 'Joy'],
      correctIndex: 3,
      explanation: '"Thanks!" = Joy/Gratitude (खुशी और कृतज्ञता) expression।'),
  ];

  // ── L3 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> surpriseConsentQuestions = [
    QuizQuestion(
      questionEn: '"My Goodness!" expresses ___.',
      questionHi: '"My Goodness!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Mistake'],
      correctIndex: 2,
      explanation: '"My Goodness!" = Surprise (चौंकते हुए भावना)।'),
    QuizQuestion(
      questionEn: '"Well done!" expresses ___.',
      questionHi: '"Well done!" किस भावना को व्यक्त करता है?',
      options: ['Grief', 'On Consent (सहमति)', 'Surprise', 'Mistake'],
      correctIndex: 1,
      explanation: '"Well done!" / "Bravo!" = Consent/Approval — शाबाशी देना।'),
    QuizQuestion(
      questionEn: '"Oops!" expresses ___.',
      questionHi: '"Oops!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'On Mistake (गलती)'],
      correctIndex: 3,
      explanation: '"Oops!" = Mistake (गलती) — अपनी गलती पर बोलते हैं।'),
    QuizQuestion(
      questionEn: '"Certainly!" is an interjection of ___.',
      questionHi: '"Certainly!" किस प्रकार का Interjection है?',
      options: ['Grief', 'Consent (सहमति)', 'Surprise', 'Mistake'],
      correctIndex: 1,
      explanation: '"Certainly!", "Sure!", "Of course!" = Consent (सहमति देना)।'),
    QuizQuestion(
      questionEn: '"Is it!" expresses ___.',
      questionHi: '"Is it!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Consent'],
      correctIndex: 2,
      explanation: '"Is it!" = Surprise (चौंकना) — सच में!'),
  ];

  // ── L4 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> everydayQuestions = [
    QuizQuestion(
      questionEn: '"Congratulations!" means ___.',
      questionHi: '"Congratulations!" का हिंदी अर्थ?',
      options: ['माफ़ करना!', 'बधाई हो!', 'धन्यवाद!', 'शाबास!'],
      correctIndex: 1,
      explanation: '"Congratulations!" = बधाई हो!'),
    QuizQuestion(
      questionEn: '"Touch wood!" means ___.',
      questionHi: '"Touch wood!" का हिंदी अर्थ?',
      options: ['भगवान का शुक्र है!', 'नज़र न लगे!', 'बहुत बढ़िया!', 'सच में!'],
      correctIndex: 1,
      explanation: '"Touch wood!" = नज़र न लगे! (Good luck charm)'),
    QuizQuestion(
      questionEn: '"Thank God!" means ___.',
      questionHi: '"Thank God!" का हिंदी अर्थ?',
      options: ['भगवान की दुहाई!', 'भगवान का शुक्र है!', 'भगवान आपको आशीर्वाद दे!', 'भगवान की मार!'],
      correctIndex: 1,
      explanation: '"Thank God!" = भगवान का शुक्र है!'),
    QuizQuestion(
      questionEn: '"Why not!" means ___.',
      questionHi: '"Why not!" का हिंदी अर्थ?',
      options: ['क्यों?', 'क्यों नहीं!', 'पक्का नहीं!', 'नहीं!'],
      correctIndex: 1,
      explanation: '"Why not!" = क्यों नहीं! (showing agreement)'),
    QuizQuestion(
      questionEn: '"Really!" expresses ___.',
      questionHi: '"Really!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Consent'],
      correctIndex: 2,
      explanation: '"Really!" = Surprise (चौंकते हुए) — सच में!'),
  ];

  // ── Chapter Final Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Interjections express sudden ___.',
      questionHi: 'Interjections अचानक ___ व्यक्त करते हैं।',
      options: ['Verbs', 'Facts', 'Feelings / Emotions', 'Questions'],
      correctIndex: 2,
      explanation: 'Interjections = अचानक खुशी, दुख, चौंकना आदि भावनाएँ व्यक्त करते हैं।'),
    QuizQuestion(
      questionEn: '"Hurrah!" expresses ___.',
      questionHi: '"Hurrah!" किस भावना को व्यक्त करता है?',
      options: ['Grief', 'Surprise', 'Joy', 'Mistake'],
      correctIndex: 2,
      explanation: '"Hurrah!" = खुशी (Joy)।'),
    QuizQuestion(
      questionEn: '"Alas!" expresses ___.',
      questionHi: '"Alas!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Consent'],
      correctIndex: 1,
      explanation: '"Alas!" = दुख (Grief)।'),
    QuizQuestion(
      questionEn: '"Well done!" expresses ___.',
      questionHi: '"Well done!" किस भावना को व्यक्त करता है?',
      options: ['Grief', 'Consent / Approval', 'Surprise', 'Mistake'],
      correctIndex: 1,
      explanation: '"Well done!" = Consent/Approval — शाबाशी देना।'),
    QuizQuestion(
      questionEn: '"Oops!" expresses ___.',
      questionHi: '"Oops!" किस भावना को व्यक्त करता है?',
      options: ['Joy', 'Grief', 'Surprise', 'Mistake'],
      correctIndex: 3,
      explanation: '"Oops!" = Mistake (गलती)।'),
    QuizQuestion(
      questionEn: '"Congratulations!" means ___.',
      questionHi: '"Congratulations!" का हिंदी अर्थ?',
      options: ['माफ़ करना!', 'बधाई हो!', 'धन्यवाद!', 'शाबास!'],
      correctIndex: 1,
      explanation: '"Congratulations!" = बधाई हो!'),
    QuizQuestion(
      questionEn: '"Touch wood!" means ___.',
      questionHi: '"Touch wood!" का हिंदी अर्थ?',
      options: ['भगवान का शुक्र है!', 'नज़र न लगे!', 'बहुत बढ़िया!', 'सच में!'],
      correctIndex: 1,
      explanation: '"Touch wood!" = नज़र न लगे!'),
    QuizQuestion(
      questionEn: '"How dare he!" means ___.',
      questionHi: '"How dare he!" का हिंदी अर्थ?',
      options: ['वो कितना डरपोक है!', 'उसकी इतनी हिम्मत!', 'वो बहुत अच्छा है!', 'वो बहुत दूर है!'],
      correctIndex: 1,
      explanation: '"How dare he!" = उसकी इतनी हिम्मत!'),
    QuizQuestion(
      questionEn: '"Thank God!" means ___.',
      questionHi: '"Thank God!" का हिंदी अर्थ?',
      options: ['भगवान की दुहाई!', 'भगवान का शुक्र है!', 'भगवान आपको आशीर्वाद दे!', 'भगवान की मार!'],
      correctIndex: 1,
      explanation: '"Thank God!" = भगवान का शुक्र है!'),
    QuizQuestion(
      questionEn: '"God bless you!" means ___.',
      questionHi: '"God bless you!" का हिंदी अर्थ?',
      options: ['भगवान का शुक्र है!', 'भगवान से डरो!', 'भगवान आपको आशीर्वाद दे!', 'भगवान की दुहाई!'],
      correctIndex: 2,
      explanation: '"God bless you!" = भगवान आपको आशीर्वाद दे!'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> emotionTypes = [
    {'type': 'Joy',     'typeHi': 'खुशी',    'emoji': '😄', 'color': 'success',  'examples': 'Hurrah!, Great!, Wow!, Thanks!'},
    {'type': 'Grief',   'typeHi': 'दुख',     'emoji': '😢', 'color': 'error',    'examples': 'Alas!, Oh my God!, So sorry!, What a tragedy!, How sad!'},
    {'type': 'Surprise','typeHi': 'चौंकना',  'emoji': '😲', 'color': 'accent',   'examples': "What!, Ha!, Oh my God!, Amazing!, Wow!, Is it!"},
    {'type': 'Consent', 'typeHi': 'सहमति',  'emoji': '👍', 'color': 'primary',  'examples': 'Bravo!, Please!, Certainly!, Well done!, Sure!'},
    {'type': 'Mistake', 'typeHi': 'गलती',   'emoji': '😬', 'color': 'warning',  'examples': 'Oh!, Oops!, My God!, No!'},
  ];

  static const List<Map<String, String>> joyExamples = [
    {'en': 'Hurrah!',      'hi': 'ये हुई न बात! / जीत की खुशी!',   'pronun': 'हुरे!'},
    {'en': 'Great!',       'hi': 'बहुत बढ़िया!',                     'pronun': 'ग्रेट!'},
    {'en': 'Wow!',         'hi': 'वाह! / गज़ब!',                     'pronun': 'वाव!'},
    {'en': 'Wonderful!',   'hi': 'बहुत बढ़िया! / शानदार!',           'pronun': 'वन्डरफुल!'},
    {'en': 'Thanks!',      'hi': 'धन्यवाद!',                         'pronun': 'थैंक्स!'},
    {'en': 'Thanks a lot!','hi': 'बहुत-बहुत धन्यवाद!',               'pronun': 'थैंक्स अ लॉट!'},
    {'en': "That's it!",   'hi': 'बस यही तो है! / यही चाहिए था!',   'pronun': 'दैट्स इट!'},
  ];

  static const List<Map<String, String>> griefExamples = [
    {'en': 'Alas!',           'hi': 'हाय! / अफसोस!',               'pronun': 'अलास!'},
    {'en': 'Oh my God!',      'hi': 'हे भगवान!',                    'pronun': 'ओह माय गॉड!'},
    {'en': 'So sorry!',       'hi': 'बहुत दुख हुआ! / माफ करना!',   'pronun': 'सो सॉरी!'},
    {'en': 'What a tragedy!', 'hi': 'कितना दुखद!',                  'pronun': 'वट अ ट्रैजिडी!'},
    {'en': 'How tragic!',     'hi': 'कितना दुखद!',                  'pronun': 'हाव ट्रैजिक!'},
    {'en': 'How sad!',        'hi': 'कितने दुख की बात!',            'pronun': 'हाव सैड!'},
    {'en': 'Oh no!',          'hi': 'ओह नहीं! / हाय राम!',          'pronun': 'ओह नो!'},
  ];

  static const List<Map<String, String>> surpriseExamples = [
    {'en': 'What!',         'hi': 'क्या!',                           'pronun': 'वट!'},
    {'en': 'Ha!',           'hi': 'वाह! (चौंककर)',                   'pronun': 'हा!'},
    {'en': 'Oh my God!',    'hi': 'हे भगवान! (चौंककर)',              'pronun': 'ओह माय गॉड!'},
    {'en': 'My Goodness!',  'hi': 'अरे बाप रे!',                     'pronun': 'माय गुडनेस!'},
    {'en': 'Amazing!',      'hi': 'विश्वास नहीं होता!',              'pronun': 'अमेजिंग!'},
    {'en': 'Fantastic!',    'hi': 'ये तो कमाल है!',                  'pronun': 'फेन्टेस्टिक!'},
    {'en': 'Incredible!',   'hi': 'अविश्वसनीय!',                     'pronun': 'इन्क्रेडिबल!'},
    {'en': 'Awesome!',      'hi': 'जबरदस्त!',                        'pronun': 'ऑसम!'},
    {'en': 'Really!',       'hi': 'सच में!',                         'pronun': 'रियली!'},
    {'en': 'Is it!',        'hi': 'क्या सच में!',                    'pronun': 'इज़ इट!'},
  ];

  static const List<Map<String, String>> consentExamples = [
    {'en': 'Bravo!',       'hi': 'शाबास!',                          'pronun': 'ब्रावो!'},
    {'en': 'Well done!',   'hi': 'शाबास! / बहुत अच्छा!',            'pronun': 'वैल डन!'},
    {'en': 'Please!',      'hi': 'कृपया!',                          'pronun': 'प्लीज़!'},
    {'en': 'Certainly!',   'hi': 'ज़रूर! / पक्का!',                 'pronun': 'सर्टेनली!'},
    {'en': 'Sure!',        'hi': 'पक्का! / ज़रूर!',                 'pronun': 'श्योर!'},
    {'en': 'True!',        'hi': 'सच है! / बिल्कुल!',               'pronun': 'ट्रू!'},
    {'en': 'Why not!',     'hi': 'क्यों नहीं!',                     'pronun': 'वाय नॉट!'},
    {'en': 'Of course!',   'hi': 'बिल्कुल! / अफ कोर्स!',           'pronun': 'अफ कोर्स!'},
  ];

  static const List<Map<String, String>> mistakeExamples = [
    {'en': 'Oh!',          'hi': 'ओह! / अरे!',                      'pronun': 'ओह!'},
    {'en': 'Oops!',        'hi': 'उफ्फ! / गलती हो गई!',             'pronun': 'उप्स!'},
    {'en': 'My God!',      'hi': 'हे भगवान! (गलती पर)',             'pronun': 'माय गॉड!'},
    {'en': 'No!',          'hi': 'नहीं!',                           'pronun': 'नो!'},
  ];

  static const List<Map<String, String>> everydayPhrases = [
    {'en': 'God bless you!',         'hi': 'भगवान आपको आशीर्वाद दे!',     'pronun': 'गॉड ब्लैस यू!'},
    {'en': 'By God\'s grace!',       'hi': 'भगवान की दया से!',             'pronun': 'बाय गॉड्स ग्रेस!'},
    {'en': 'How dare he!',           'hi': 'उसकी इतनी हिम्मत!',           'pronun': 'हाव डेअर ही!'},
    {'en': 'Oh honey!, Oh dear!',    'hi': 'ओह प्यारे! (प्यार उमड़े)',      'pronun': 'ओह हनी!, ओह डियर!'},
    {'en': 'Terrible mistake!',      'hi': 'बहुत बड़ी गलती!',              'pronun': 'टैरिबल मिस्टेक!'},
    {'en': 'Absurd!, Nonsense!',     'hi': 'बकवास!',                       'pronun': 'ऐब्ज़र्ड!, नानसेंस!'},
    {'en': 'Thank God!',             'hi': 'भगवान का शुक्र है!',           'pronun': 'थैंक गॉड!'},
    {'en': 'Touch wood!',            'hi': 'नज़र न लगे!',                  'pronun': 'टच वुड!'},
    {'en': 'Finger crossed!',        'hi': 'नज़र न लगे! / उम्मीद है!',     'pronun': 'फिनगर क्रॉस्ड!'},
    {'en': 'Congratulations!',       'hi': 'बधाई हो!',                     'pronun': 'कॉन्ग्रैचुलेशन्स!'},
    {'en': 'What an idea!',          'hi': 'क्या आइडिया है!',              'pronun': 'वट ऐन आइडिया!'},
    {'en': 'What a news!',           'hi': 'क्या खबर है! (खुशी से)',        'pronun': 'वट अ न्यूज़!'},
  ];
}