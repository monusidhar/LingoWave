import '../models/lesson_model.dart';

/// Chapter 7 — Noun (संज्ञा)
class Chapter7Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 7,
        title: 'Noun',
        titleHindi: 'संज्ञा',
        description: '5 Types, Gerund, Gender & Number',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Proper & Common Noun',
              titleHindi: 'व्यक्तिवाचक और जातिवाचक संज्ञा',
              emoji: '🏷️', type: LessonType.ch7NounProper, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Collective, Material & Abstract Noun',
              titleHindi: 'समूहवाचक, पदार्थवाचक और भाववाचक संज्ञा',
              emoji: '🧩', type: LessonType.ch7NounCollective, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Gerund & Countable/Uncountable',
              titleHindi: 'जेरन्ड और गणनीय/अगणनीय संज्ञा',
              emoji: '🔢', type: LessonType.ch7NounGerund, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Gender, Number & Special Nouns',
              titleHindi: 'लिंग, वचन और विशेष संज्ञाएँ',
              emoji: '⚖️', type: LessonType.ch7NounGender, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch7ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  // ─── Router ───────────────────────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch7NounProper:     return properCommonQuestions;
      case LessonType.ch7NounCollective: return collectiveAbstractQuestions;
      case LessonType.ch7NounGerund:     return gerundCountableQuestions;
      case LessonType.ch7NounGender:     return genderNumberQuestions;
      case LessonType.ch7ChapterQuiz:    return chapterFinalQuestions;
      default:                           return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Proper & Common Noun
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> properCommonQuestions = [
    QuizQuestion(
      questionEn: 'Proper Noun is the name of a specific ___.',
      questionHi: 'Proper Noun किसी विशेष ___ का नाम होता है।',
      options: ['क्रिया', 'प्राणी / जगह / वस्तु', 'भावना', 'समूह'],
      correctIndex: 1,
      explanation: 'Proper Noun (व्यक्तिवाचक संज्ञा) किसी विशेष प्राणी, जगह या वस्तु का नाम होता है। जैसे: Ram, Dehradun, Parker Pen।',
    ),
    QuizQuestion(
      questionEn: '"Tuffy" (name of a dog) is a ___.',
      questionHi: '"Tuffy" (एक कुत्ते का नाम) ___ है।',
      options: ['Common Noun', 'Abstract Noun', 'Proper Noun', 'Collective Noun'],
      correctIndex: 2,
      explanation: 'किसी भी प्राणी का नाम (चाहे इंसान हो या जानवर) Proper Noun होता है। "Tuffy" एक कुत्ते का नाम है — Proper Noun।',
    ),
    QuizQuestion(
      questionEn: '"Mobile" (as in Nokia mobile or Samsung mobile) is a ___.',
      questionHi: '"Mobile" (Nokia या Samsung दोनों में common) ___ है।',
      options: ['Proper Noun', 'Common Noun', 'Abstract Noun', 'Material Noun'],
      correctIndex: 1,
      explanation: 'Common Noun (जातिवाचक संज्ञा) किसी प्राणी/जगह/वस्तु की जाति बताता है। "Mobile" Nokia और Samsung दोनों की जाति है।',
    ),
    QuizQuestion(
      questionEn: '"State" (Delhi, Haryana, Bihar are all states) is a ___.',
      questionHi: '"State" (Delhi, Haryana, Bihar — तीनों राज्य हैं) ___ है।',
      options: ['Proper Noun', 'Abstract Noun', 'Common Noun', 'Collective Noun'],
      correctIndex: 2,
      explanation: '"State" इन तीनों की जाति (class) बताता है → Common Noun। जबकि "Delhi", "Haryana" खुद Proper Nouns हैं।',
    ),
    QuizQuestion(
      questionEn: 'Which is a Proper Noun?',
      questionHi: 'कौन सा Proper Noun है?',
      options: ['Boy', 'City', 'Dehradun', 'Fan'],
      correctIndex: 2,
      explanation: '"Dehradun" एक विशेष जगह का नाम है → Proper Noun। "Boy", "City", "Fan" सभी जाति बताते हैं → Common Nouns।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Collective, Material & Abstract Noun
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> collectiveAbstractQuestions = [
    QuizQuestion(
      questionEn: '"Team" is a ___ because it denotes a group of players.',
      questionHi: '"Team" ___ है क्योंकि यह खिलाड़ियों के समूह को दर्शाता है।',
      options: ['Proper Noun', 'Abstract Noun', 'Collective Noun', 'Material Noun'],
      correctIndex: 2,
      explanation: 'Collective Noun (समूहवाचक संज्ञा) समूह को दर्शाता है। Team = खिलाड़ियों का समूह।',
    ),
    QuizQuestion(
      questionEn: '"Gold" and "Silver" are examples of ___.',
      questionHi: '"Gold" और "Silver" किसके उदाहरण हैं?',
      options: ['Proper Noun', 'Collective Noun', 'Abstract Noun', 'Material Noun'],
      correctIndex: 3,
      explanation: 'Material Noun (पदार्थवाचक संज्ञा) किसी पदार्थ का नाम होता है। Gold, Silver, Wood, Glass सभी Material Nouns हैं।',
    ),
    QuizQuestion(
      questionEn: '"Love" (प्यार) is an Abstract Noun because ___.',
      questionHi: '"Love" (प्यार) Abstract Noun है क्योंकि ___।',
      options: [
        'यह एक व्यक्ति का नाम है',
        'इसे छू या देख नहीं सकते, सिर्फ महसूस कर सकते हैं',
        'यह एक समूह को दर्शाता है',
        'यह एक पदार्थ है',
      ],
      correctIndex: 1,
      explanation: 'Abstract Noun (भाववाचक संज्ञा) वो होती है जिसे हम छू या देख नहीं सकते — सिर्फ महसूस कर सकते हैं। Love, Honesty, Hope सभी Abstract Nouns हैं।',
    ),
    QuizQuestion(
      questionEn: 'In "I love you" — "love" is a ___. In "Love is life" — "love" is a ___.',
      questionHi: '"I love you" में "love" ___ है। "Love is life" में "love" ___ है।',
      options: ['Verb / Noun', 'Noun / Verb', 'दोनों Verb', 'दोनों Noun'],
      correctIndex: 0,
      explanation: '"I love you" — love = Verb (क्रिया)। "Love is life" — love = Abstract Noun (Subject के रूप में)।',
    ),
    QuizQuestion(
      questionEn: 'Which of these is a Collective Noun?',
      questionHi: 'इनमें से कौन सा Collective Noun है?',
      options: ['Gold', 'Honesty', 'Crowd', 'Ram'],
      correctIndex: 2,
      explanation: '"Crowd" (भीड़) = कई लोगों का समूह → Collective Noun। Gold = Material, Honesty = Abstract, Ram = Proper।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Gerund + Countable/Uncountable + Subject rule
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> gerundCountableQuestions = [
    QuizQuestion(
      questionEn: 'In "Reading is a good habit" — "Reading" is a ___.',
      questionHi: '"Reading is a good habit" में "Reading" ___ है।',
      options: ['Verb', 'Gerund (क्रियावाचक संज्ञा)', 'Adjective', 'Pronoun'],
      correctIndex: 1,
      explanation: 'जब किसी Verb में ing लगाकर उसे Subject/Noun की तरह प्रयोग किया जाए → Gerund (जेरन्ड)। "Reading" यहाँ Subject है।',
    ),
    QuizQuestion(
      questionEn: 'In a sentence, Subject is always a Noun or ___.',
      questionHi: 'किसी भी वाक्य में Subject हमेशा Noun या ___ होता है।',
      options: ['Verb', 'Adjective', 'Pronoun', 'Adverb'],
      correctIndex: 2,
      explanation: 'वाक्य में Subject या तो Noun होगा या Pronoun। "He is my brother" — He = Pronoun as Subject।',
    ),
    QuizQuestion(
      questionEn: '"Star" and "Hair" are ___ nouns.',
      questionHi: '"Star" और "Hair" ___ nouns हैं।',
      options: ['Uncountable', 'Abstract', 'Collective', 'Countable'],
      correctIndex: 3,
      explanation: '"Star" और "Hair" गिने जा सकते हैं (1 star, 2 stars, 1 hair, 2 hairs) → Countable। भले ही अनगिनत हों, गिनना असंभव नहीं।',
    ),
    QuizQuestion(
      questionEn: '"Money" is Uncountable because ___.',
      questionHi: '"Money" Uncountable है क्योंकि ___।',
      options: [
        'इसे छू नहीं सकते',
        'हम "1 money, 2 money" नहीं कह सकते',
        'यह एक समूह है',
        'यह एक पदार्थ है',
      ],
      correctIndex: 1,
      explanation: '"Money" को "1 money, 2 money" नहीं कह सकते → Uncountable। पैसे गिनने के लिए "notes" या "coins" कहते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Which is a Gerund sentence?',
      questionHi: 'कौन सा वाक्य Gerund का उदाहरण है?',
      options: [
        'I run every day.',
        'Running daily is good for health.',
        'He runs fast.',
        'She loves to run.',
      ],
      correctIndex: 1,
      explanation: '"Running daily is good for health" — Running = Verb(run) + ing, Subject के रूप में प्रयोग → Gerund।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Gender, Number & Always-'s' Nouns
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> genderNumberQuestions = [
    QuizQuestion(
      questionEn: '"Book", "Pen", "Mobile" are ___ Gender.',
      questionHi: '"Book", "Pen", "Mobile" ___ Gender हैं।',
      options: ['Masculine', 'Feminine', 'Neuter', 'Common'],
      correctIndex: 2,
      explanation: 'Neuter Gender (नपुंसकलिंग) — निर्जीव चीज़ें। Book, Pen, Mobile, Laptop सभी निर्जीव हैं → Neuter Gender।',
    ),
    QuizQuestion(
      questionEn: '"Actress", "Aunt", "Cow" are ___ Gender.',
      questionHi: '"Actress", "Aunt", "Cow" ___ Gender हैं।',
      options: ['Masculine', 'Feminine', 'Neuter', 'Collective'],
      correctIndex: 1,
      explanation: 'Feminine Gender (स्त्रीलिंग) — स्त्री जाति। Actress, Aunt, Cow, Girl, Sister सभी Feminine Gender हैं।',
    ),
    QuizQuestion(
      questionEn: 'The plural of "Tooth" is ___.',
      questionHi: '"Tooth" का बहुवचन ___ है।',
      options: ['Tooths', 'Teeths', 'Teeth', 'Toth'],
      correctIndex: 2,
      explanation: '"Tooth" → "Teeth" (irregular plural)। ऐसे ही: Man→Men, Woman→Women, Mouse→Mice।',
    ),
    QuizQuestion(
      questionEn: '"Scissors" always ends with "s" but it is ___.',
      questionHi: '"Scissors" में हमेशा "s" रहता है पर यह ___ है।',
      options: ['Plural (बहुवचन)', 'Singular (एकवचन)', 'Neither plural nor singular — always "s"', 'Abstract Noun'],
      correctIndex: 2,
      explanation: 'Scissors, Trousers, Spectacles, Binoculars — इनमें हमेशा "s" रहता है पर ये बहुवचन नहीं होते। ये always-"s" nouns हैं।',
    ),
    QuizQuestion(
      questionEn: '"Mathematics" and "News" always end with "s" but are ___.',
      questionHi: '"Mathematics" और "News" में "s" है पर ये ___ हैं।',
      options: ['Plural', 'Not plural — always end with s', 'Abstract Nouns', 'Collective Nouns'],
      correctIndex: 1,
      explanation: 'Mathematics, News — इनके अंत में "s" है पर ये Plural नहीं हैं। ये singular nouns हैं जो हमेशा "s" के साथ लिखे जाते हैं।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 12 mixed questions
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'How many types of Nouns are discussed?',
      questionHi: 'कितने प्रकार की संज्ञाएँ बताई गई हैं?',
      options: ['3', '4', '5', '6'],
      correctIndex: 2,
      explanation: '5 types: Proper, Common, Collective, Material, Abstract Noun।',
    ),
    QuizQuestion(
      questionEn: '"Parker Pen" is a ___.',
      questionHi: '"Parker Pen" ___ है।',
      options: ['Common Noun', 'Proper Noun', 'Abstract Noun', 'Collective Noun'],
      correctIndex: 1,
      explanation: '"Parker Pen" एक विशेष वस्तु का नाम है → Proper Noun।',
    ),
    QuizQuestion(
      questionEn: '"Fan" (Usha/Khaitan/Havells सभी fan हैं) is a ___.',
      questionHi: '"Fan" (Usha/Khaitan/Havells की जाति) ___ है।',
      options: ['Proper Noun', 'Common Noun', 'Collective Noun', 'Abstract Noun'],
      correctIndex: 1,
      explanation: '"Fan" इन सबकी जाति (class) बताता है → Common Noun।',
    ),
    QuizQuestion(
      questionEn: '"Army" is a ___.',
      questionHi: '"Army" ___ है।',
      options: ['Abstract Noun', 'Proper Noun', 'Collective Noun', 'Material Noun'],
      correctIndex: 2,
      explanation: '"Army" = सैनिकों का समूह → Collective Noun।',
    ),
    QuizQuestion(
      questionEn: '"Wood" and "Stone" are ___.',
      questionHi: '"Wood" और "Stone" ___ हैं।',
      options: ['Collective Nouns', 'Abstract Nouns', 'Material Nouns', 'Proper Nouns'],
      correctIndex: 2,
      explanation: '"Wood" (लकड़ी), "Stone" (पत्थर) — पदार्थ हैं → Material Nouns।',
    ),
    QuizQuestion(
      questionEn: '"Honesty is in my blood" — "Honesty" is ___.',
      questionHi: '"Honesty is in my blood" — "Honesty" ___ है।',
      options: ['Common Noun', 'Proper Noun', 'Abstract Noun', 'Collective Noun'],
      correctIndex: 2,
      explanation: '"Honesty" को छू या देख नहीं सकते → Abstract Noun। यहाँ Subject भी है।',
    ),
    QuizQuestion(
      questionEn: '"Smoking is injurious to health" — "Smoking" is a ___.',
      questionHi: '"Smoking is injurious to health" — "Smoking" ___ है।',
      options: ['Verb', 'Adjective', 'Gerund', 'Pronoun'],
      correctIndex: 2,
      explanation: 'Smoke + ing = Subject के रूप में → Gerund (क्रियावाचक संज्ञा)।',
    ),
    QuizQuestion(
      questionEn: '"Milk" and "Sugar" are ___ nouns.',
      questionHi: '"Milk" और "Sugar" ___ nouns हैं।',
      options: ['Countable', 'Collective', 'Uncountable', 'Proper'],
      correctIndex: 2,
      explanation: '"1 milk, 2 milks" नहीं कहते → Uncountable Nouns। Milk, Sugar, Honesty, Money सभी Uncountable हैं।',
    ),
    QuizQuestion(
      questionEn: 'The plural of "Woman" is ___.',
      questionHi: '"Woman" का बहुवचन ___ है।',
      options: ['Womans', 'Womens', 'Women', 'Woman'],
      correctIndex: 2,
      explanation: '"Woman" → "Women" (irregular plural)। ऐसे ही: Man→Men, Tooth→Teeth।',
    ),
    QuizQuestion(
      questionEn: '"Boy", "Uncle", "Actor" are ___ Gender.',
      questionHi: '"Boy", "Uncle", "Actor" ___ Gender हैं।',
      options: ['Feminine', 'Neuter', 'Masculine', 'Collective'],
      correctIndex: 2,
      explanation: 'Masculine Gender (पुल्लिंग) — पुरुष जाति। Boy, Uncle, Brother, Actor सभी Masculine Gender हैं।',
    ),
    QuizQuestion(
      questionEn: '"Trousers" always ends with "s" — it is ___.',
      questionHi: '"Trousers" में हमेशा "s" रहता है — यह ___ है।',
      options: ['Plural', 'Always-s noun (not plural)', 'Abstract Noun', 'Collective Noun'],
      correctIndex: 1,
      explanation: 'Scissors, Trousers, Spectacles — इनमें हमेशा "s" रहता है पर ये Plural नहीं होते।',
    ),
    QuizQuestion(
      questionEn: 'In a sentence, Subject is always a ___.',
      questionHi: 'वाक्य में Subject हमेशा ___ होता है।',
      options: ['Verb या Adjective', 'Noun या Pronoun', 'Adverb या Noun', 'Preposition या Verb'],
      correctIndex: 1,
      explanation: 'वाक्य में Subject या तो Noun होगा या Pronoun — यह एक बहुत महत्वपूर्ण नियम है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // 5 Types overview
  static const List<Map<String, dynamic>> nounTypes = [
    {
      'number': '1', 'nameEn': 'Proper Noun', 'nameHi': 'व्यक्तिवाचक संज्ञा',
      'defHi': 'किसी भी प्राणी, जगह या वस्तु का नाम।',
      'defEn': 'Name of a specific creature, place or thing.',
      'emoji': '🏷️', 'color': 'primary',
      'examples': ['Ram', 'Tuffy (dog)', 'Dehradun', 'Parker Pen', 'Usha Fan'],
    },
    {
      'number': '2', 'nameEn': 'Common Noun', 'nameHi': 'जातिवाचक संज्ञा',
      'defHi': 'किसी भी प्राणी, जगह या वस्तु की जाति के बारे में बताता है।',
      'defEn': 'Denotes the class of a creature, place or thing.',
      'emoji': '👥', 'color': 'success',
      'examples': ['Mobile', 'Boy', 'Fan', 'State', 'City'],
    },
    {
      'number': '3', 'nameEn': 'Collective Noun', 'nameHi': 'समूहवाचक संज्ञा',
      'defHi': 'प्राणियों, जगहों या वस्तुओं के समूह को दर्शाता है।',
      'defEn': 'Denotes a group of creatures, places or things.',
      'emoji': '🫂', 'color': 'accent',
      'examples': ['People', 'Crowd', 'Team', 'Batch', 'Army', 'Family'],
    },
    {
      'number': '4', 'nameEn': 'Material Noun', 'nameHi': 'पदार्थवाचक संज्ञा',
      'defHi': 'किसी भी पदार्थ का नाम।',
      'defEn': 'Denotes the name of a material.',
      'emoji': '⚗️', 'color': 'warning',
      'examples': ['Gold', 'Silver', 'Copper', 'Wood', 'Stone', 'Glass'],
    },
    {
      'number': '5', 'nameEn': 'Abstract Noun', 'nameHi': 'भाववाचक संज्ञा',
      'defHi': 'जिसे छू या देख नहीं सकते — सिर्फ महसूस किया जा सकता है।',
      'defEn': 'Cannot be touched or seen — only felt.',
      'emoji': '💭', 'color': 'primary',
      'examples': ['Love', 'Honesty', 'Hope', 'Hate', 'Time', 'Thinking', 'Success', 'Mathematics'],
    },
  ];

  // Collective Noun examples
  static const List<Map<String, String>> collectiveExamples = [
    {'noun': 'People', 'hi': 'लोग', 'group': 'group of persons'},
    {'noun': 'Crowd', 'hi': 'भीड़', 'group': 'group of persons'},
    {'noun': 'Batch', 'hi': 'बैच', 'group': 'group of students'},
    {'noun': 'Team', 'hi': 'टीम', 'group': 'group of players'},
    {'noun': 'Bunch', 'hi': 'गुच्छा', 'group': 'group of grapes/things'},
    {'noun': 'Family', 'hi': 'परिवार', 'group': 'group of members'},
    {'noun': 'Army', 'hi': 'सेना', 'group': 'group of soldiers'},
    {'noun': 'Class', 'hi': 'कक्षा', 'group': 'group of students'},
    {'noun': 'Committee', 'hi': 'समिति', 'group': 'group of members'},
    {'noun': 'Jury', 'hi': 'जूरी', 'group': 'group of judges'},
    {'noun': 'Audience', 'hi': 'दर्शक', 'group': 'group of listeners'},
    {'noun': 'Company', 'hi': 'कंपनी', 'group': 'group of people'},
  ];

  // Gerund examples
  static const List<Map<String, String>> gerundExamples = [
    {'verb': 'Love → Loving', 'sentence': 'Loving you is a part of my life.', 'hi': 'तुमसे प्यार करना मेरी जिंदगी का हिस्सा है।'},
    {'verb': 'Think → Thinking', 'sentence': 'Thinking so much is not good for health.', 'hi': 'इतना सोचना सेहत के लिए अच्छा नहीं।'},
    {'verb': 'Read → Reading', 'sentence': 'Reading is a good habit.', 'hi': 'पढ़ना एक अच्छी आदत है।'},
    {'verb': 'Run → Running', 'sentence': 'Running daily is good for health.', 'hi': 'रोज़ दौड़ना सेहत के लिए अच्छा है।'},
    {'verb': 'Smoke → Smoking', 'sentence': 'Smoking is injurious to health.', 'hi': 'धूम्रपान स्वास्थ्य के लिए हानिकारक है।'},
  ];

  // Subject examples (Noun or Pronoun)
  static const List<Map<String, String>> subjectExamples = [
    {'sentence': 'Success is very important.', 'hi': 'सफलता बहुत जरूरी है।', 'subject': 'Success', 'type': 'Abstract Noun'},
    {'sentence': 'Ram is my friend.', 'hi': 'राम मेरा दोस्त है।', 'subject': 'Ram', 'type': 'Proper Noun'},
    {'sentence': 'He is my brother.', 'hi': 'वो मेरा भाई है।', 'subject': 'He', 'type': 'Pronoun'},
    {'sentence': 'Honesty is in my blood.', 'hi': 'ईमानदारी मेरे खून में है।', 'subject': 'Honesty', 'type': 'Abstract Noun'},
    {'sentence': 'Reading is a good habit.', 'hi': 'पढ़ना एक अच्छी आदत है।', 'subject': 'Reading', 'type': 'Gerund'},
  ];

  // Countable vs Uncountable
  static const List<Map<String, String>> countableExamples = [
    {'word': 'Pen', 'hi': 'कलम', 'type': 'countable', 'reason': '1 pen, 2 pens ✓'},
    {'word': 'Boy', 'hi': 'लड़का', 'type': 'countable', 'reason': '1 boy, 2 boys ✓'},
    {'word': 'Star', 'hi': 'तारा', 'type': 'countable', 'reason': '1 star, 2 stars ✓'},
    {'word': 'Hair', 'hi': 'बाल', 'type': 'countable', 'reason': '1 hair, 2 hairs ✓'},
    {'word': 'Milk', 'hi': 'दूध', 'type': 'uncountable', 'reason': '1 milk ✗'},
    {'word': 'Sugar', 'hi': 'चीनी', 'type': 'uncountable', 'reason': '1 sugar ✗'},
    {'word': 'Money', 'hi': 'पैसा', 'type': 'uncountable', 'reason': '1 money ✗'},
    {'word': 'Love', 'hi': 'प्यार', 'type': 'uncountable', 'reason': '1 love ✗'},
    {'word': 'Honesty', 'hi': 'ईमानदारी', 'type': 'uncountable', 'reason': '1 honesty ✗'},
    {'word': 'Delhi', 'hi': 'दिल्ली', 'type': 'uncountable', 'reason': '1 Delhi ✗'},
  ];

  // Gender examples
  static const List<Map<String, String>> genderExamples = [
    {'gender': 'Masculine', 'hi': 'पुल्लिंग', 'examples': 'Boy, Uncle, Brother, Actor, Gents, Man', 'emoji': '👨'},
    {'gender': 'Feminine', 'hi': 'स्त्रीलिंग', 'examples': 'Girl, Aunt, Sister, Actress, Woman, Cow, Cat', 'emoji': '👩'},
    {'gender': 'Neuter', 'hi': 'नपुंसकलिंग', 'examples': 'Book, Pen, Mobile, Laptop, Chair, Table', 'emoji': '📱'},
  ];

  // Irregular plurals
  static const List<Map<String, String>> irregularPlurals = [
    {'singular': 'Rat', 'plural': 'Rats', 'hi': 'चूहा → चूहे'},
    {'singular': 'Mouse', 'plural': 'Mice', 'hi': 'चुहिया → चुहियाँ'},
    {'singular': 'Tooth', 'plural': 'Teeth', 'hi': 'दाँत → दाँत (pl.)'},
    {'singular': 'Man', 'plural': 'Men', 'hi': 'आदमी → आदमी (pl.)'},
    {'singular': 'Woman', 'plural': 'Women', 'hi': 'औरत → औरतें'},
    {'singular': 'Girl', 'plural': 'Girls', 'hi': 'लड़की → लड़कियाँ'},
  ];

  // Always-'s' nouns
  static const List<Map<String, String>> alwaysSNouns = [
    {'noun': 'Scissors', 'pronunciation': 'सिज़र्स', 'hi': 'कैंची'},
    {'noun': 'Trousers', 'pronunciation': 'ट्राउज़र्स', 'hi': 'पैंट'},
    {'noun': 'Binoculars', 'pronunciation': 'बाइनॉक्युलर्स', 'hi': 'दूरबीन'},
    {'noun': 'Spectacles', 'pronunciation': 'स्पेक्टकल्स', 'hi': 'चश्मा'},
    {'noun': 'Mathematics', 'pronunciation': 'मैथेमैटिक्स', 'hi': 'गणित'},
    {'noun': 'News', 'pronunciation': 'न्यूज़', 'hi': 'समाचार'},
  ];
}