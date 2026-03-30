import '../models/lesson_model.dart';

/// Chapter 33 — One Word Substitution (पूरा वाक्य सिर्फ एक शब्द में)
class Chapter33Data {

  static ChapterModel get chapter => ChapterModel(
        id: 33,
        title: 'One Word Substitution',
        titleHindi: 'एक शब्द में पूरा वाक्य',
        description: 'Part A (1–30), Part B (31–58) & Quiz',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Part A — Words 1–30', titleHindi: 'शब्द 1–30 (हिंदी अर्थ)', emoji: '📖', type: LessonType.ch33PartA, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Part B — Words 31–58', titleHindi: 'शब्द 31–58 (हिंदी अर्थ)', emoji: '📝', type: LessonType.ch33PartB, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch33ChapterQuiz, status: LessonStatus.inProgress, totalXP: 80),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch33PartA:        return partAQuestions;
      case LessonType.ch33PartB:        return partBQuestions;
      case LessonType.ch33ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // STORY — Akbar & Birbal intro
  // ══════════════════════════════════════════════════════════════════════════

  static const String storyHindi =
      'एक बार अकबर को पूछा गया — "आप कौन हैं?" अकबर ने जवाब दिया — "मैं वो हूँ जिसे आज तक कोई हरा नहीं पाया।" बीरबल ने कहा — महाराज, इतना लम्बा वाक्य बोलने से अच्छा एक शब्द कह दीजिए — "अजय"।';

  static const String storyEnglish =
      'Once Akbar was asked — "Who are you?" Akbar replied — "I am the one who has never been defeated." Birbal said — Your Majesty, instead of such a long sentence, just say one word — "Invincible".';

  // ══════════════════════════════════════════════════════════════════════════
  // WORD LIST — Part A (words 1–30)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> partAWords = [
    {'no': '1',  'word': 'Centenary',     'hindi': 'शताब्दी',           'def': 'Celebration of a hundredth year.'},
    {'no': '2',  'word': 'Contemporary',  'hindi': 'समकालीन',           'def': 'One who lives with the trend.'},
    {'no': '3',  'word': 'Celibacy',      'hindi': 'ब्रह्मचर्य',        'def': 'To abstain from sex.'},
    {'no': '4',  'word': 'Democracy',     'hindi': 'लोकतंत्र',          'def': 'Government of the people, for the people, by the people.'},
    {'no': '5',  'word': 'Epicure',       'hindi': 'भोगवादी',           'def': 'A person fond of enjoyment.'},
    {'no': '6',  'word': 'Exonerate',     'hindi': 'दोषमुक्त करना',     'def': 'To free a person from all the blames.'},
    {'no': '7',  'word': 'Fastidious',    'hindi': 'नखरेदार',           'def': 'A person difficult to please.'},
    {'no': '8',  'word': 'Fatalist',      'hindi': 'भाग्यवादी',         'def': 'One, who just believes in luck.'},
    {'no': '9',  'word': 'Incorrigible',  'hindi': 'असुधार्य',          'def': "Something that can't be corrected."},
    {'no': '10', 'word': 'Invincible',    'hindi': 'अजय',               'def': 'One who can never be beaten/defeated.'},
    {'no': '11', 'word': 'Indispensable', 'hindi': 'अपरिहार्य',         'def': "Something which can't be ignored."},
    {'no': '12', 'word': 'Inevitable',    'hindi': 'अवश्यम्भावी',       'def': "Something which can't be avoided."},
    {'no': '13', 'word': 'Irrevocable',   'hindi': 'अपरिवर्तनीय',       'def': "That can't be changed at any cost."},
    {'no': '14', 'word': 'Inflammable',   'hindi': 'ज्वलनशील',          'def': 'That can catch fire easily.'},
    {'no': '15', 'word': 'Medieval',      'hindi': 'मध्यकालीन',         'def': 'Belonging to the middle ages.'},
    {'no': '16', 'word': 'Omnipotent',    'hindi': 'सर्वशक्तिमान',      'def': 'One who is all powerful.'},
    {'no': '17', 'word': 'Omniscient',    'hindi': 'सर्वज्ञ',           'def': 'One who knows everything.'},
    {'no': '18', 'word': 'Polyandry',     'hindi': 'बहुपतित्व',         'def': 'Practice of having more than one husband at a time.'},
    {'no': '19', 'word': 'Polygamy',      'hindi': 'बहुविवाह',          'def': 'Practice of having more than one wife at a time.'},
    {'no': '20', 'word': 'Red-tapism',    'hindi': 'लालफीताशाही',       'def': 'Too much official formality.'},
    {'no': '21', 'word': 'Venial',        'hindi': 'क्षम्य',            'def': 'A pardonable fault.'},
    {'no': '22', 'word': 'Theist',        'hindi': 'आस्तिक',            'def': 'Who believes in God.'},
    {'no': '23', 'word': 'Atheist',       'hindi': 'नास्तिक',           'def': "Who doesn't believe in God."},
    {'no': '24', 'word': 'Ascetic',       'hindi': 'सन्यासी',           'def': 'A person who renounces the world and devotes himself to a strictly devout life.'},
    {'no': '25', 'word': 'Connoisseur',   'hindi': 'पारखी',             'def': 'Who is well versed in any subject.'},
    {'no': '26', 'word': 'Philologist',   'hindi': 'भाषाशास्त्री',      'def': 'Who studies about the language.'},
    {'no': '27', 'word': 'Archaeologist', 'hindi': 'पुरातत्ववेत्ता',    'def': 'Who studies ancient buildings and monuments.'},
    {'no': '28', 'word': 'Gullible',      'hindi': 'भोला-भाला',         'def': 'Who is easily fooled.'},
    {'no': '29', 'word': 'Bellicose',     'hindi': 'युद्धप्रिय',        'def': 'Who is fond of fighting.'},
    {'no': '30', 'word': 'Hygienist',     'hindi': 'स्वास्थ्यप्रेमी',  'def': 'Who is very health conscious.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // WORD LIST — Part B (words 31–58)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> partBWords = [
    {'no': '31', 'word': 'Omnivorous',     'hindi': 'सर्वभक्षी',         'def': 'Who eats everything.'},
    {'no': '32', 'word': 'Cannibal',       'hindi': 'नरभक्षी',           'def': 'Who eats human flesh.'},
    {'no': '33', 'word': 'Philanthropist', 'hindi': 'परोपकारी',          'def': 'Who is a lover of humanity.'},
    {'no': '34', 'word': 'Feminist',       'hindi': 'नारीवादी',          'def': 'Who is devoted to the welfare of women.'},
    {'no': '35', 'word': 'Parasite',       'hindi': 'परजीवी',            'def': 'Who depends on others.'},
    {'no': '36', 'word': 'Credulous',      'hindi': 'विश्वासशील',        'def': 'Who easily believes whatever is told.'},
    {'no': '37', 'word': 'Bigot',          'hindi': 'कट्टरपंथी',         'def': 'Who strongly holds an opinion or belief.'},
    {'no': '38', 'word': 'Mercenary',      'hindi': 'किराए का सैनिक',    'def': 'Who only works for money or reward.'},
    {'no': '39', 'word': 'Orthodox',       'hindi': 'रूढ़िवादी',          'def': 'Who holds conventional beliefs.'},
    {'no': '40', 'word': 'Foster child',   'hindi': 'पालक बच्चा',        'def': 'Who is brought up by persons who are not his parents.'},
    {'no': '41', 'word': 'Autocracy',      'hindi': 'तानाशाही',          'def': 'Government by one person.'},
    {'no': '42', 'word': 'Bureaucracy',    'hindi': 'नौकरशाही',          'def': 'Government by officials.'},
    {'no': '43', 'word': 'Monarchy',       'hindi': 'राजतंत्र',          'def': 'Government by a monarch.'},
    {'no': '44', 'word': 'Antidote',       'hindi': 'मारक',              'def': 'A medicine which counteracts poison.'},
    {'no': '45', 'word': 'Aesthetics',     'hindi': 'सौंदर्यशास्त्र',   'def': 'Study of the nature of beauty.'},
    {'no': '46', 'word': 'Prologue',       'hindi': 'प्रस्तावना',        'def': 'Introductory Preface of a drama.'},
    {'no': '47', 'word': 'Polyglot',       'hindi': 'बहुभाषाविद्',       'def': 'Multilingual — one who speaks many languages.'},
    {'no': '48', 'word': 'Philology',      'hindi': 'भाषाशास्त्र',       'def': 'Science of languages.'},
    {'no': '49', 'word': 'Phonology',      'hindi': 'स्वरविज्ञान',       'def': 'Science of speech sounds.'},
    {'no': '50', 'word': 'Genocide',       'hindi': 'नरसंहार',           'def': 'Extermination of a race.'},
    {'no': '51', 'word': 'Morphology',     'hindi': 'रूपविज्ञान',        'def': 'Science of animal body structure.'},
    {'no': '52', 'word': 'Cartography',    'hindi': 'मानचित्रकला',       'def': 'Science of map making.'},
    {'no': '53', 'word': 'Calligraphy',    'hindi': 'सुलेखन',            'def': 'Art of beautiful writing.'},
    {'no': '54', 'word': 'Ideology',       'hindi': 'विचारधारा',         'def': 'Idea of a group of people.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // MOTIVATIONAL QUOTES
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'A man is a product of his thoughts — what he thinks, he becomes.',
      'hindi': 'व्यक्ति अपने विचारों का एक प्राणी है, वह जैसा सोचता है वैसा ही बन जाता है।',
      'author': 'Mahatma Gandhi',
    },
    {
      'english': 'Our dream can come true if we have a firm desire to materialize them.',
      'hindi': 'हमारा सपना साकार हो सकता है अगर हमारे अन्दर उन्हें पूरा करने की प्रबल इच्छा हो।',
      'author': '',
    },
    {
      'english': 'Be the change that you want to see in the world.',
      'hindi': 'पहले खुद में ये बदलाव कीजिए जो बदलाव आप दुनिया में देखना चाहते हैं।',
      'author': 'Mahatma Gandhi',
    },
    {
      'english': 'Your talent is nothing without opportunity.',
      'hindi': 'बिना मौके के आपकी प्रतिभा कुछ भी नहीं है।',
      'author': '',
    },
    {
      'english': 'Education is the weapon that can be used to change the world.',
      'hindi': 'शिक्षा वह हथियार है जिसका प्रयोग कर दुनिया को बदला जा सकता है।',
      'author': '',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Part A
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> partAQuestions = [
    QuizQuestion(
      questionEn: '"Invincible" means ___.',
      questionHi: '"Invincible" का अर्थ?',
      options: ['भाग्यवादी', 'अजय', 'सर्वज्ञ', 'ज्वलनशील'],
      correctIndex: 1,
      explanation: '"Invincible" = अजय — One who can never be beaten/defeated.',
    ),
    QuizQuestion(
      questionEn: 'Who is an "Atheist"?',
      questionHi: '"Atheist" कौन होता है?',
      options: ['जो ईश्वर में विश्वास रखे', 'जो ईश्वर में विश्वास न रखे', 'जो सब कुछ जानता हो', 'जो सन्यासी हो'],
      correctIndex: 1,
      explanation: '"Atheist" = नास्तिक। "Theist" = आस्तिक।',
    ),
    QuizQuestion(
      questionEn: '"Omnipotent" means ___.',
      questionHi: '"Omnipotent" का अर्थ?',
      options: ['सर्वज्ञ', 'सर्वभक्षी', 'सर्वशक्तिमान', 'समकालीन'],
      correctIndex: 2,
      explanation: '"Omnipotent" = सर्वशक्तिमान — One who is all powerful.',
    ),
    QuizQuestion(
      questionEn: 'A person difficult to please is called ___.',
      questionHi: 'जिसे खुश करना मुश्किल हो?',
      options: ['Epicure', 'Fatalist', 'Fastidious', 'Ascetic'],
      correctIndex: 2,
      explanation: '"Fastidious" = नखरेदार — A person difficult to please.',
    ),
    QuizQuestion(
      questionEn: '"Celibacy" means ___.',
      questionHi: '"Celibacy" का अर्थ?',
      options: ['ब्रह्मचर्य', 'बहुविवाह', 'लोकतंत्र', 'शताब्दी'],
      correctIndex: 0,
      explanation: '"Celibacy" = ब्रह्मचर्य — To abstain from sex.',
    ),
    QuizQuestion(
      questionEn: '"Irrevocable" means ___.',
      questionHi: '"Irrevocable" का अर्थ?',
      options: ['ज्वलनशील', 'असुधार्य', 'अपरिवर्तनीय', 'अवश्यम्भावी'],
      correctIndex: 2,
      explanation: '"Irrevocable" = अपरिवर्तनीय — That cannot be changed at any cost.',
    ),
    QuizQuestion(
      questionEn: '"Gullible" means ___.',
      questionHi: '"Gullible" का अर्थ?',
      options: ['युद्धप्रिय', 'भोला-भाला', 'पारखी', 'सन्यासी'],
      correctIndex: 1,
      explanation: '"Gullible" = भोला-भाला — Who is easily fooled.',
    ),
    QuizQuestion(
      questionEn: 'Who is a "Connoisseur"?',
      questionHi: '"Connoisseur" कौन होता है?',
      options: ['भाषाशास्त्री', 'पुरातत्ववेत्ता', 'पारखी', 'भाग्यवादी'],
      correctIndex: 2,
      explanation: '"Connoisseur" = पारखी — Who is well versed in any subject.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Part B
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> partBQuestions = [
    QuizQuestion(
      questionEn: '"Cannibal" means ___.',
      questionHi: '"Cannibal" का अर्थ?',
      options: ['सर्वभक्षी', 'नरभक्षी', 'परोपकारी', 'परजीवी'],
      correctIndex: 1,
      explanation: '"Cannibal" = नरभक्षी — Who eats human flesh.',
    ),
    QuizQuestion(
      questionEn: '"Cartography" is the science of ___.',
      questionHi: '"Cartography" किसका विज्ञान है?',
      options: ['भाषाएँ', 'मानचित्र बनाना', 'सुंदर लिखावट', 'शरीर की संरचना'],
      correctIndex: 1,
      explanation: '"Cartography" = मानचित्रकला — Science of map making.',
    ),
    QuizQuestion(
      questionEn: '"Philanthropist" means ___.',
      questionHi: '"Philanthropist" का अर्थ?',
      options: ['नारीवादी', 'कट्टरपंथी', 'परोपकारी', 'रूढ़िवादी'],
      correctIndex: 2,
      explanation: '"Philanthropist" = परोपकारी — Who is a lover of humanity.',
    ),
    QuizQuestion(
      questionEn: '"Autocracy" is ___.',
      questionHi: '"Autocracy" क्या है?',
      options: ['लोकतंत्र', 'राजतंत्र', 'तानाशाही', 'नौकरशाही'],
      correctIndex: 2,
      explanation: '"Autocracy" = तानाशाही — Government by one person.',
    ),
    QuizQuestion(
      questionEn: '"Calligraphy" means ___.',
      questionHi: '"Calligraphy" का अर्थ?',
      options: ['स्वरविज्ञान', 'रूपविज्ञान', 'सुलेखन', 'विचारधारा'],
      correctIndex: 2,
      explanation: '"Calligraphy" = सुलेखन — Art of beautiful writing.',
    ),
    QuizQuestion(
      questionEn: '"Bigot" means ___.',
      questionHi: '"Bigot" का अर्थ?',
      options: ['विश्वासशील', 'कट्टरपंथी', 'रूढ़िवादी', 'किराए का सैनिक'],
      correctIndex: 1,
      explanation: '"Bigot" = कट्टरपंथी — Who strongly holds an opinion or belief.',
    ),
    QuizQuestion(
      questionEn: '"Antidote" is ___.',
      questionHi: '"Antidote" क्या है?',
      options: ['प्रस्तावना', 'मारक (जहर का इलाज)', 'सौंदर्यशास्त्र', 'बहुभाषाविद्'],
      correctIndex: 1,
      explanation: '"Antidote" = मारक — A medicine which counteracts poison.',
    ),
    QuizQuestion(
      questionEn: '"Genocide" means ___.',
      questionHi: '"Genocide" का अर्थ?',
      options: ['नरसंहार', 'नरभक्षी', 'परजीवी', 'तानाशाही'],
      correctIndex: 0,
      explanation: '"Genocide" = नरसंहार — Extermination of a race.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"Invincible" means ___.',
      questionHi: '"Invincible" का अर्थ?',
      options: ['भाग्यवादी', 'अजय', 'सर्वज्ञ', 'ज्वलनशील'],
      correctIndex: 1,
      explanation: '"Invincible" = अजय — One who can never be beaten/defeated.',
    ),
    QuizQuestion(
      questionEn: '"Omniscient" means ___.',
      questionHi: '"Omniscient" का अर्थ?',
      options: ['सर्वशक्तिमान', 'सर्वभक्षी', 'सर्वज्ञ', 'समकालीन'],
      correctIndex: 2,
      explanation: '"Omniscient" = सर्वज्ञ — One who knows everything.',
    ),
    QuizQuestion(
      questionEn: 'Government by the people is called ___.',
      questionHi: 'जनता का शासन?',
      options: ['Autocracy', 'Monarchy', 'Bureaucracy', 'Democracy'],
      correctIndex: 3,
      explanation: '"Democracy" = लोकतंत्र — Government of, for and by the people.',
    ),
    QuizQuestion(
      questionEn: '"Inflammable" means ___.',
      questionHi: '"Inflammable" का अर्थ?',
      options: ['असुधार्य', 'अपरिवर्तनीय', 'ज्वलनशील', 'अपरिहार्य'],
      correctIndex: 2,
      explanation: '"Inflammable" = ज्वलनशील — That can catch fire easily.',
    ),
    QuizQuestion(
      questionEn: '"Archaeologist" studies ___.',
      questionHi: '"Archaeologist" क्या पढ़ता है?',
      options: ['भाषाएँ', 'पुरानी इमारतें और स्मारक', 'आवाजें', 'मानचित्र'],
      correctIndex: 1,
      explanation: '"Archaeologist" = पुरातत्ववेत्ता — Studies ancient buildings and monuments.',
    ),
    QuizQuestion(
      questionEn: '"Parasite" is ___.',
      questionHi: '"Parasite" होता है?',
      options: ['जो खुद पर निर्भर हो', 'जो दूसरों पर निर्भर हो', 'जो सबको खाए', 'जो सबकी मदद करे'],
      correctIndex: 1,
      explanation: '"Parasite" = परजीवी — Who depends on others.',
    ),
    QuizQuestion(
      questionEn: '"Phonology" is the science of ___.',
      questionHi: '"Phonology" किसका विज्ञान है?',
      options: ['भाषाएँ', 'मानचित्र', 'बोलने की आवाजें', 'शरीर की संरचना'],
      correctIndex: 2,
      explanation: '"Phonology" = स्वरविज्ञान — Science of speech sounds.',
    ),
    QuizQuestion(
      questionEn: '"Ascetic" is ___.',
      questionHi: '"Ascetic" क्या होता है?',
      options: ['भोगवादी', 'सन्यासी', 'पारखी', 'नास्तिक'],
      correctIndex: 1,
      explanation: '"Ascetic" = सन्यासी — Who renounces the world for a devout life.',
    ),
    QuizQuestion(
      questionEn: '"Calligraphy" is ___.',
      questionHi: '"Calligraphy" क्या है?',
      options: ['मानचित्रकला', 'विचारधारा', 'सुलेखन', 'सौंदर्यशास्त्र'],
      correctIndex: 2,
      explanation: '"Calligraphy" = सुलेखन — Art of beautiful writing.',
    ),
    QuizQuestion(
      questionEn: '"Credulous" means ___.',
      questionHi: '"Credulous" का अर्थ?',
      options: ['कट्टरपंथी', 'रूढ़िवादी', 'विश्वासशील', 'भोला-भाला'],
      correctIndex: 2,
      explanation: '"Credulous" = विश्वासशील — Who easily believes whatever is told.',
    ),
  ];
}