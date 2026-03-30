import '../models/lesson_model.dart';

/// Chapter 2 — Few Basics of English (अंग्रेज़ी की कुछ मूल बातें)
class Chapter2Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 2,
        title: 'Few Basics of English',
        titleHindi: 'अंग्रेज़ी की कुछ मूल बातें',
        description: 'Sentences, Types & Structure',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: "What is a Sentence?", titleHindi: "वाक्य क्या होता है?",
              emoji: '💬', type: LessonType.ch2Sentences, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: "Assertive & Interrogative", titleHindi: "स्वीकारात्मक और प्रश्नवाचक",
              emoji: '📢', type: LessonType.ch2SentenceTypes1, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: "Imperative & Exclamatory", titleHindi: "आज्ञासूचक और विस्मयादिबोधक",
              emoji: '❗', type: LessonType.ch2SentenceTypes2, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: "Affirmative & Negative", titleHindi: "सकारात्मक और नकारात्मक",
              emoji: '🔄', type: LessonType.ch2ThreeParts, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: "Apostrophe 's & Three Parts", titleHindi: "'s का प्रयोग और वाक्य के तीन भाग",
              emoji: '✏️', type: LessonType.ch2VerbTypes, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: "Subject, Verb & Object", titleHindi: "कर्ता, क्रिया और कारक",
              emoji: '🔠', type: LessonType.ch2SubjectTypes, status: LessonStatus.inProgress),
          LessonModel(id: 7, title: "Singular, Plural & Pronouns", titleHindi: "एकवचन, बहुवचन और सर्वनाम",
              emoji: '👥', type: LessonType.ch2ThisThat, status: LessonStatus.inProgress),
          LessonModel(id: 8, title: "This, That, These, Those", titleHindi: "यह, वह, ये, वे",
              emoji: '👆', type: LessonType.ch2LivingNonLiving, status: LessonStatus.inProgress),
          LessonModel(id: 9, title: "Both & All Phrases", titleHindi: "दोनों और सभी",
              emoji: '🤝', type: LessonType.ch2BothAll, status: LessonStatus.inProgress),
          LessonModel(id: 10, title: "Useful Phrases", titleHindi: "उपयोगी वाक्यांश",
              emoji: '🗂️', type: LessonType.ch2Phrases, status: LessonStatus.inProgress),
          LessonModel(id: 11, title: "States & Adjectives", titleHindi: "अवस्थाएँ और विशेषण",
              emoji: '🎭', type: LessonType.ch2States, status: LessonStatus.inProgress),
          LessonModel(id: 12, title: "Chapter Quiz", titleHindi: "अध्याय क्विज़",
              emoji: '🏆', type: LessonType.ch2ChapterQuiz, status: LessonStatus.inProgress, totalXP: 120),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch2Sentences:       return sentenceQuestions;
      case LessonType.ch2SentenceTypes1:  return sentenceTypes1Questions;
      case LessonType.ch2SentenceTypes2:  return sentenceTypes2Questions;
      case LessonType.ch2ThreeParts:      return affirmativeNegativeQuestions;
      case LessonType.ch2VerbTypes:       return apostropheQuestions;
      case LessonType.ch2SubjectTypes:    return subjectVerbObjectQuestions;
      case LessonType.ch2ThisThat:        return singularPluralQuestions;
      case LessonType.ch2LivingNonLiving: return thisThatQuestions;
      case LessonType.ch2BothAll:         return bothAllQuestions;
      case LessonType.ch2Phrases:         return phrasesQuestions;
      case LessonType.ch2States:          return statesQuestions;
      case LessonType.ch2ChapterQuiz:     return chapterFinalQuestions;
      default: return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — What is a Sentence?
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> sentenceQuestions = [
    QuizQuestion(
      questionEn: 'What is a sentence?',
      questionHi: 'वाक्य किसे कहते हैं?',
      options: ['A single word', 'A group of words giving a complete message', 'A group of letters', 'A paragraph'],
      correctIndex: 1,
      explanation: 'A sentence is a group of words that communicates a complete message or idea.',
    ),
    QuizQuestion(
      questionEn: 'Which of these is a complete sentence?',
      questionHi: 'इनमें से कौन सा पूरा वाक्य है?',
      options: ['Running fast', 'Ayansh is my son.', 'Big house', 'Very good'],
      correctIndex: 1,
      explanation: '"Ayansh is my son." has a subject and gives a complete idea.',
    ),
    QuizQuestion(
      questionEn: 'Can a single word be a sentence?',
      questionHi: 'क्या एक शब्द भी वाक्य हो सकता है?',
      options: ['Never', 'Yes, if it gives a complete message', 'Only in Hindi', 'Only 2+ words'],
      correctIndex: 1,
      explanation: '"नहीं" is a 1-word complete sentence — it gives a full message.',
    ),
    QuizQuestion(
      questionEn: 'Letters → Words → ___ → Paragraphs',
      questionHi: 'अक्षर → शब्द → ___ → पैराग्राफ',
      options: ['Chapters', 'Sentences', 'Alphabets', 'Lines'],
      correctIndex: 1,
      explanation: 'The correct order is: Letters → Words → Sentences → Paragraphs.',
    ),
    QuizQuestion(
      questionEn: 'How many sentences in: "He is good. I love him."?',
      questionHi: '"He is good. I love him." — इसमें कितने वाक्य हैं?',
      options: ['1', '2', '3', '4'],
      correctIndex: 1,
      explanation: 'There are 2 sentences, each ending with a full stop.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Assertive & Interrogative
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> sentenceTypes1Questions = [
    QuizQuestion(
      questionEn: '"Ayansh is my son." — What type of sentence?',
      questionHi: '"Ayansh is my son." — यह किस प्रकार का वाक्य है?',
      options: ['Interrogative', 'Assertive / Declarative', 'Imperative', 'Exclamatory'],
      correctIndex: 1,
      explanation: 'Assertive sentences state a fact or opinion.',
    ),
    QuizQuestion(
      questionEn: 'Which sentence is Interrogative?',
      questionHi: 'कौन सा वाक्य प्रश्नवाचक है?',
      options: ['Sit there.', 'Aman is at home.', 'Is Aman not at home?', 'Wow!'],
      correctIndex: 2,
      explanation: 'Interrogative sentences ask a question and end with "?".',
    ),
    QuizQuestion(
      questionEn: 'Assertive sentences are also called ___.',
      questionHi: 'Assertive वाक्यों को ___ भी कहते हैं।',
      options: ['Exclamatory', 'Declarative', 'Imperative', 'Negative'],
      correctIndex: 1,
      explanation: 'Assertive = Declarative sentences (स्वीकारात्मक या कथनात्मक वाक्य).',
    ),
    QuizQuestion(
      questionEn: 'Which is an Assertive sentence?',
      questionHi: 'Assertive वाक्य का उदाहरण कौन सा है?',
      options: ['Do you play?', 'Sit there.', 'Aman is not at home.', 'Wow!'],
      correctIndex: 2,
      explanation: '"Aman is not at home." states a fact — Assertive sentence.',
    ),
    QuizQuestion(
      questionEn: 'Interrogative sentences end with ___.',
      questionHi: 'Interrogative वाक्य किस चिह्न से समाप्त होते हैं?',
      options: ['.', '!', '?', ','],
      correctIndex: 2,
      explanation: 'Interrogative sentences (questions) always end with a Question Mark (?).',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Imperative & Exclamatory + Classification 2
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> sentenceTypes2Questions = [
    QuizQuestion(
      questionEn: '"Sit there." — What type of sentence?',
      questionHi: '"Sit there." — यह किस प्रकार का वाक्य है?',
      options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'],
      correctIndex: 2,
      explanation: '"Sit there." is Imperative — it gives a command.',
    ),
    QuizQuestion(
      questionEn: '"Wow!" — What type of sentence?',
      questionHi: '"Wow!" — यह किस प्रकार का वाक्य है?',
      options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'],
      correctIndex: 3,
      explanation: '"Wow!" is Exclamatory — it expresses sudden emotion.',
    ),
    QuizQuestion(
      questionEn: 'Imperative sentences are used to ___.',
      questionHi: 'Imperative वाक्यों का प्रयोग ___ के लिए होता है।',
      options: ['Ask questions', 'State facts', 'Give commands/requests', 'Express emotions'],
      correctIndex: 2,
      explanation: 'Imperative sentences give commands, orders or requests.',
    ),
    QuizQuestion(
      questionEn: '"Ram is a good boy." — In Classification 2, this is ___.',
      questionHi: '"Ram is a good boy." — Classification 2 में यह ___ वाक्य है।',
      options: ['Negative', 'Affirmative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 1,
      explanation: 'Affirmative sentences do NOT use "not" and are not questions.',
    ),
    QuizQuestion(
      questionEn: '"Ram is not a good boy." — This is a ___ sentence.',
      questionHi: '"Ram is not a good boy." — यह ___ वाक्य है।',
      options: ['Affirmative', 'Interrogative', 'Negative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: 'Negative sentences use "not" but do not ask a question.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Affirmative, Negative, Interrogative, Neg. Interrogative
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> affirmativeNegativeQuestions = [
    QuizQuestion(
      questionEn: 'Which sentence is Affirmative?',
      questionHi: 'कौन सा वाक्य Affirmative (सकारात्मक) है?',
      options: ['Ram is not a good boy.', 'Is Ram a good boy?', 'Ram is a good boy.', 'Is Ram not a good boy?'],
      correctIndex: 2,
      explanation: 'Affirmative: no "not", not a question → "Ram is a good boy." ✅',
    ),
    QuizQuestion(
      questionEn: '"Is Ram a good boy?" — This is ___.',
      questionHi: '"Is Ram a good boy?" — यह ___ है।',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: 'Interrogative: no "not" but IS a question.',
    ),
    QuizQuestion(
      questionEn: '"Is Ram not a good boy?" — This is ___.',
      questionHi: '"Is Ram not a good boy?" — यह ___ है।',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: 'Negative Interrogative: has "not" AND is a question.',
    ),
    QuizQuestion(
      questionEn: 'Classification 2 has how many types?',
      questionHi: 'Classification 2 में वाक्यों के कितने प्रकार हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 2,
      explanation: '4 types: Affirmative, Negative, Interrogative, Negative Interrogative.',
    ),
    QuizQuestion(
      questionEn: 'A Negative sentence has "not" but is NOT a ___.',
      questionHi: 'Negative वाक्य में "not" होता है पर ___ नहीं होता।',
      options: ['Subject', 'Question', 'Verb', 'Word'],
      correctIndex: 1,
      explanation: 'Negative sentences have "not" but are NOT questions.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Apostrophe 's & Three Parts of Sentence
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> apostropheQuestions = [
    QuizQuestion(
      questionEn: '"Ram\'s pen" means ___.',
      questionHi: '"Ram\'s pen" का मतलब क्या है?',
      options: ['Pen of Ram', 'Ram and pen', 'Ram is a pen', 'Pen for Ram'],
      correctIndex: 0,
      explanation: '"Ram\'s pen" = "Pen of Ram". Apostrophe \'s shows possession.',
    ),
    QuizQuestion(
      questionEn: 'What does "Girls\' brother" mean?',
      questionHi: '"Girls\' brother" का मतलब क्या है?',
      options: ['One girl\'s brother', 'Brothers of girls', 'Brother of many girls', 'Girl and brother'],
      correctIndex: 2,
      explanation: 'Girls\' (without extra s) = more than one girl. Girls\' brother = Brother of many girls.',
    ),
    QuizQuestion(
      questionEn: 'For a plural word ending in "s", apostrophe is placed ___.',
      questionHi: '"s" से समाप्त होने वाले बहुवचन शब्द में apostrophe ___ लगाते हैं।',
      options: ['Before s (\'s)', 'After s (s\')', 'No apostrophe needed', 'In the middle'],
      correctIndex: 1,
      explanation: 'For plural words ending in "s" (like girls, boys), apostrophe comes AFTER the s: girls\'.',
    ),
    QuizQuestion(
      questionEn: 'How many parts does a sentence have?',
      questionHi: 'वाक्य के कितने भाग होते हैं?',
      options: ['1', '2', '3', '4'],
      correctIndex: 2,
      explanation: 'A sentence has 3 parts: Subject (कर्ता), Verb (क्रिया), Object (कारक).',
    ),
    QuizQuestion(
      questionEn: '"My brother\'s pen" — Which form shows ONE brother?',
      questionHi: '"My brother\'s pen" — यह कितने भाइयों की बात करता है?',
      options: ['Many brothers', 'One brother', 'No brother', 'Two brothers'],
      correctIndex: 1,
      explanation: '"Brother\'s" with \'s = one brother. "Brothers\'" = more than one brother.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Subject, Verb, Object
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> subjectVerbObjectQuestions = [
    QuizQuestion(
      questionEn: 'In "Ayansh is sleeping", what is the Subject?',
      questionHi: '"Ayansh is sleeping" में Subject कौन है?',
      options: ['sleeping', 'is', 'Ayansh', 'None'],
      correctIndex: 2,
      explanation: 'Subject is the one performing the action or being talked about. Here, Ayansh is the subject.',
    ),
    QuizQuestion(
      questionEn: 'Verb describes the ___ or state of the subject.',
      questionHi: 'Verb, Subject के ___ या अवस्था की जानकारी देती है।',
      options: ['Color', 'Action', 'Name', 'Size'],
      correctIndex: 1,
      explanation: 'Verb (क्रिया) describes the action or state of the subject.',
    ),
    QuizQuestion(
      questionEn: 'In "Papa plays in the park", what is the Object?',
      questionHi: '"Papa plays in the park" में Object क्या है?',
      options: ['Papa', 'plays', 'park', 'None'],
      correctIndex: 2,
      explanation: 'Object is the one affected by the action. Here, "park" is the object.',
    ),
    QuizQuestion(
      questionEn: '"Is, am, are, was, were" are examples of ___.',
      questionHi: '"Is, am, are, was, were" किसके उदाहरण हैं?',
      options: ['Main Verbs', 'Helping Verbs', 'Objects', 'Subjects'],
      correctIndex: 1,
      explanation: '"Is, am, are, was, were, has, have, do, does" are Helping Verbs (सहायक क्रिया).',
    ),
    QuizQuestion(
      questionEn: '"To dance, to sing, to read" are examples of ___.',
      questionHi: '"नाचना, गाना, पढ़ना" किसके उदाहरण हैं?',
      options: ['Helping Verbs', 'Subjects', 'Main Verbs', 'Objects'],
      correctIndex: 2,
      explanation: '"To dance, to sing, to read" are Main Verbs (मुख्य क्रिया) — they describe action.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 7 — Singular & Plural + Personal Pronouns
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> singularPluralQuestions = [
    QuizQuestion(
      questionEn: '"People" and "Crowd" are ___ subjects.',
      questionHi: '"People" और "Crowd" ___ subject हैं।',
      options: ['Singular', 'Plural', 'Neutral', 'Personal'],
      correctIndex: 1,
      explanation: '"People" and "Crowd" refer to more than one person — they are Plural subjects.',
    ),
    QuizQuestion(
      questionEn: '"I" belongs to which person?',
      questionHi: '"I" (मैं) किस Person से है?',
      options: ['First Person', 'Second Person', 'Third Person', 'Fourth Person'],
      correctIndex: 0,
      explanation: '"I" (मैं) is First Person Singular — the one who is speaking.',
    ),
    QuizQuestion(
      questionEn: '"You" is always treated as ___ in English.',
      questionHi: 'English में "You" को हमेशा ___ की तरह प्रयोग किया जाता है।',
      options: ['Singular', 'Plural', 'Neutral', 'Third person'],
      correctIndex: 1,
      explanation: '"You" is always treated as Plural — even for one person. That\'s why "are/have/do" are used with You.',
    ),
    QuizQuestion(
      questionEn: 'If I talk to you about Ram, Ram is ___.',
      questionHi: 'अगर मैं आपसे राम के बारे में बात करूँ, तो राम ___ है।',
      options: ['First Person', 'Second Person', 'Third Person', 'No person'],
      correctIndex: 2,
      explanation: 'I = First Person, You = Second Person, Ram (the one being talked about) = Third Person.',
    ),
    QuizQuestion(
      questionEn: '"They" is used for ___.',
      questionHi: '"They" का प्रयोग ___ के लिए होता है।',
      options: ['One male', 'One female', 'One thing', 'More than one person'],
      correctIndex: 3,
      explanation: '"They" (वे) is Third Person Plural — used for more than one person.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — This, That, These, Those
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> thisThatQuestions = [
    QuizQuestion(
      questionEn: 'For one book that is NEAR you, you say ___.',
      questionHi: 'पास की एक किताब के लिए ___ बोलेंगे।',
      options: ['That book', 'These books', 'Those books', 'This book'],
      correctIndex: 3,
      explanation: 'Near + Singular = "This". So "This book" is correct.',
    ),
    QuizQuestion(
      questionEn: 'For many pens that are FAR, you say ___.',
      questionHi: 'दूर के कई पेनों के लिए ___ बोलेंगे।',
      options: ['This pen', 'These pens', 'That pen', 'Those pens'],
      correctIndex: 3,
      explanation: 'Far + Plural = "Those". So "Those pens" is correct.',
    ),
    QuizQuestion(
      questionEn: 'Which word is used for something NEAR and PLURAL?',
      questionHi: 'पास और बहुवचन के लिए कौन सा शब्द प्रयोग होता है?',
      options: ['This', 'That', 'These', 'Those'],
      correctIndex: 2,
      explanation: 'Near + Plural = "These". e.g. "These books" (पास की किताबें).',
    ),
    QuizQuestion(
      questionEn: '"Those children" — children are ___ and ___.',
      questionHi: '"Those children" — बच्चे ___ और ___ हैं।',
      options: ['Near, Singular', 'Near, Plural', 'Far, Singular', 'Far, Plural'],
      correctIndex: 3,
      explanation: '"Those" = Far + Plural. Children are far away and more than one.',
    ),
    QuizQuestion(
      questionEn: 'Living things that are far and plural can use ___ OR "They".',
      questionHi: 'दूर के सजीव बहुवचन के लिए ___ या "They" प्रयोग कर सकते हैं।',
      options: ['This', 'That', 'These', 'Those'],
      correctIndex: 3,
      explanation: '"Those" or "They" — both can be used for living beings that are far and plural.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> sentenceExamples = [
    {'en': 'Ayansh is my son.', 'hi': 'अयंश मेरा बेटा है।'},
    {'en': 'Aman is not at home.', 'hi': 'अमन घर पर नहीं है।'},
    {'en': "Arnavi doesn't go to school.", 'hi': 'अर्नवी स्कूल नहीं जाती है।'},
    {'en': 'Mom scolds me.', 'hi': 'मम्मी जी मुझे डाँटती हैं।'},
  ];

  static const List<Map<String, dynamic>> classification1Types = [
    {
      'number': '1', 'nameEn': 'Assertive / Declarative', 'nameHi': 'स्वीकारात्मक या कथनात्मक वाक्य',
      'descHi': 'ऐसे वाक्य जिनमें कुछ बताया जाए या किसी बात का वर्णन हो।',
      'descEn': 'Sentences that state a fact, opinion or idea.',
      'emoji': '📝', 'colorKey': 'success',
      'examples': [
        {'en': 'Ayansh is my son.', 'hi': 'अयंश मेरा बेटा है।'},
        {'en': 'Aman is not at home.', 'hi': 'अमन घर पर नहीं है।'},
      ],
    },
    {
      'number': '2', 'nameEn': 'Interrogative', 'nameHi': 'प्रश्नवाचक वाक्य',
      'descHi': 'ऐसे वाक्य जिनमें कोई प्रश्न पूछा जाता है।',
      'descEn': 'Sentences where a question is asked.',
      'emoji': '❓', 'colorKey': 'primary',
      'examples': [
        {'en': 'Is Aman not at home?', 'hi': 'क्या अमन घर पर नहीं है?'},
        {'en': 'Do you play?', 'hi': 'क्या तुम खेलते हो?'},
      ],
    },
    {
      'number': '3', 'nameEn': 'Imperative', 'nameHi': 'आज्ञासूचक वाक्य',
      'descHi': 'ऐसे वाक्य जो आज्ञा, आदेश या प्रार्थना व्यक्त करें।',
      'descEn': 'Sentences that give permission, command or request.',
      'emoji': '👉', 'colorKey': 'warning',
      'examples': [
        {'en': 'Sit there.', 'hi': 'वहाँ बैठो।'},
        {'en': 'Let me go.', 'hi': 'मुझे जाने दो।'},
      ],
    },
    {
      'number': '4', 'nameEn': 'Exclamatory', 'nameHi': 'विस्मयादिबोधक वाक्य',
      'descHi': 'ऐसे वाक्य जिनमें अचानक उत्पन्न भावनाएँ व्यक्त हों।',
      'descEn': 'Sentences expressing sudden emotions — joy, grief, shock, fear.',
      'emoji': '😲', 'colorKey': 'accent',
      'examples': [
        {'en': 'Wow!', 'hi': 'वाह! / बहुत बढ़िया!'},
        {'en': 'Thank God!', 'hi': 'भगवान का शुक्र है!'},
      ],
    },
  ];

  static const List<Map<String, String>> classification2Types = [
    {'typeEn': 'Affirmative', 'typeHi': 'सकारात्मक', 'descHi': '"not" नहीं, प्रश्न नहीं', 'descEn': 'No "not", not a question', 'example': 'Ram is a good boy.', 'emoji': '✅'},
    {'typeEn': 'Negative', 'typeHi': 'नकारात्मक', 'descHi': '"not" है, प्रश्न नहीं', 'descEn': 'Has "not", not a question', 'example': 'Ram is not a good boy.', 'emoji': '❌'},
    {'typeEn': 'Interrogative', 'typeHi': 'प्रश्नवाचक', 'descHi': '"not" नहीं, प्रश्न है', 'descEn': 'No "not", IS a question', 'example': 'Is Ram a good boy?', 'emoji': '❓'},
    {'typeEn': 'Negative Interrogative', 'typeHi': 'नकारात्मक प्रश्नवाचक', 'descHi': '"not" भी है, प्रश्न भी है', 'descEn': 'Has "not" AND is a question', 'example': 'Is Ram not a good boy?', 'emoji': '🔄'},
  ];

  // Apostrophe examples
  static const List<Map<String, String>> apostropheExamples = [
    {'hindi': 'सीता का भाई', 'en1': "Seeta's brother", 'en2': 'Brother of Seeta'},
    {'hindi': 'राहुल की माँ', 'en1': "Rahul's mother", 'en2': 'Mother of Rahul'},
    {'hindi': 'लड़की का भाई (एक लड़की)', 'en1': "Girl's brother", 'en2': 'Brother of the girl'},
    {'hindi': 'लड़कियों के भाई (कई लड़कियाँ)', 'en1': "Girls' brothers", 'en2': 'Brothers of the girls'},
    {'hindi': 'मेरे भाई का पेन (एक भाई)', 'en1': "My brother's pen", 'en2': 'The pen of my brother'},
    {'hindi': 'मेरे भाइयों के पेन (कई भाई)', 'en1': "My brothers' pen", 'en2': 'The pens of my brothers'},
    {'hindi': 'शेर की दहाड़', 'en1': "Lion's roar", 'en2': 'Roar of the lion'},
    {'hindi': 'गीता की आवाज़', 'en1': "Geeta's voice", 'en2': 'Voice of Geeta'},
  ];

  // Subject-Verb-Object examples
  static const List<Map<String, String>> svoExamples = [
    {'sentence': 'Ayansh is sleeping.', 'hi': 'अयंश सो रहा है।', 'subject': 'Ayansh', 'verb': 'is sleeping', 'object': '—'},
    {'sentence': 'Ayansh is 8 months old.', 'hi': 'अयंश 8 महीने का है।', 'subject': 'Ayansh', 'verb': 'is', 'object': '8 months old'},
    {'sentence': 'Ram is my friend.', 'hi': 'राम मेरा दोस्त है।', 'subject': 'Ram', 'verb': 'is', 'object': 'my friend'},
    {'sentence': 'Papa plays in the park.', 'hi': 'पापा पार्क में खेलते हैं।', 'subject': 'Papa', 'verb': 'plays', 'object': 'park'},
    {'sentence': 'I miss you.', 'hi': 'मैं तुम्हें याद करता हूँ।', 'subject': 'I', 'verb': 'miss', 'object': 'you'},
    {'sentence': 'She does not go to school.', 'hi': 'वो स्कूल नहीं जाती।', 'subject': 'She', 'verb': 'goes', 'object': 'school'},
  ];

  // Main Verb examples
  static const List<Map<String, String>> mainVerbExamples = [
    {'en': 'To dance', 'hi': 'नाचना'},
    {'en': 'To sing', 'hi': 'गाना'},
    {'en': 'To think', 'hi': 'सोचना'},
    {'en': 'To read', 'hi': 'पढ़ना'},
    {'en': 'To write', 'hi': 'लिखना'},
    {'en': 'To see', 'hi': 'देखना'},
    {'en': 'To beat', 'hi': 'पीटना'},
    {'en': 'To miss', 'hi': 'याद करना'},
    {'en': 'To move', 'hi': 'हिलना'},
    {'en': 'To play', 'hi': 'खेलना'},
  ];

  // Helping verb examples
  static const List<String> helpingVerbs = ['is', 'am', 'are', 'was', 'were', 'has', 'have', 'had', 'do', 'does', 'did', 'will'];

  // Personal pronouns table
  static const List<Map<String, String>> pronounTable = [
    {'person': 'First Person', 'personHi': 'वक्ता (बोलने वाला)', 'singular': 'I (मैं)', 'plural': 'We (हम)'},
    {'person': 'Second Person', 'personHi': 'श्रोता (सुनने वाला)', 'singular': 'You (तुम/आप)', 'plural': 'You (तुम/आप)'},
    {'person': 'Third Person', 'personHi': 'जिसके बारे में बात हो', 'singular': 'He / She / It', 'plural': 'They (वे)'},
  ];

  // This That These Those table
  static const List<Map<String, String>> thisThatTable = [
    {'distance': 'Near (पास)', 'singular': 'This (यह/ये)', 'plural': 'These (ये/यह)'},
    {'distance': 'Far (दूर)', 'singular': 'That (वह/वो)', 'plural': 'Those (वह/वो/वे)'},
  ];

  // This That examples
  static const List<Map<String, String>> thisThatExamples = [
    {'hindi': 'यह/ये किताब (पास, एक)', 'english': 'This book', 'rule': 'Near + Singular = This'},
    {'hindi': 'यह/वो किताब (दूर, एक)', 'english': 'That book', 'rule': 'Far + Singular = That'},
    {'hindi': 'ये/यह किताबें (पास, कई)', 'english': 'These books', 'rule': 'Near + Plural = These'},
    {'hindi': 'वो/वह/वे किताबें (दूर, कई)', 'english': 'Those books', 'rule': 'Far + Plural = Those'},
    {'hindi': 'ये बच्चे (दूर, कई, सजीव)', 'english': 'Those / They children', 'rule': 'Living + Far + Plural = Those / They'},
    {'hindi': 'ये मछलियाँ (पास, कई)', 'english': 'These fishes', 'rule': 'Near + Plural = These'},
  ];

  // Living vs Non-Living
  static const List<Map<String, String>> livingExamples = [
    {'category': 'Living (सजीव)', 'examples': 'Human (इन्सान), Animals (जानवर), Plants (पेड़-पौधे)', 'emoji': '🌿'},
    {'category': 'Non-Living (निर्जीव)', 'examples': 'Pen (पेन), Book (किताब), Stone (पत्थर), Chair (कुर्सी)', 'emoji': '📦'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 9 QUIZ — Both & All Phrases
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> bothAllQuestions = [
    QuizQuestion(
      questionEn: '"हम दोनों" in English is ___.',
      questionHi: '"हम दोनों" को English में क्या कहते हैं?',
      options: ['We all', 'We both / Both of us', 'We two', 'Both we'],
      correctIndex: 1,
      explanation: '"हम दोनों" = "We both" या "Both of us".',
    ),
    QuizQuestion(
      questionEn: '"ये सभी किताबें" in English is ___.',
      questionHi: '"ये सभी किताबें" को English में क्या कहते हैं?',
      options: ['Those all books', 'These all books / All of these books', 'All books', 'These books all'],
      correctIndex: 1,
      explanation: '"ये सभी किताबें" = "These all books" या "All of these books" (पास + plural).',
    ),
    QuizQuestion(
      questionEn: '"They both" means ___.',
      questionHi: '"They both" का मतलब क्या है?',
      options: ['वे सभी', 'वे दोनों', 'वे तीनों', 'हम दोनों'],
      correctIndex: 1,
      explanation: '"They both" = "वे दोनों" — both of them.',
    ),
    QuizQuestion(
      questionEn: '"हम तीनों" in English is ___.',
      questionHi: '"हम तीनों" को English में क्या कहते हैं?',
      options: ['We all three', 'We both', 'We three / Three of us', 'All of us three'],
      correctIndex: 2,
      explanation: '"हम तीनों" = "We three" या "Three of us".',
    ),
    QuizQuestion(
      questionEn: 'For living beings that are far and plural, "वे सभी" = ___.',
      questionHi: 'दूर के सजीव बहुवचन के लिए "वे सभी" = ___',
      options: ['These all', 'We all', 'Those / They all', 'All of these'],
      correctIndex: 2,
      explanation: '"वे सभी" (सजीव, दूर) = "Those all" या "They all".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 10 QUIZ — Useful Phrases
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> phrasesQuestions = [
    QuizQuestion(
      questionEn: '"सड़क के उस पार" in English is ___.',
      questionHi: '"सड़क के उस पार" को English में क्या कहते हैं?',
      options: ['Behind the road', 'On the road', 'Across the road', 'Under the road'],
      correctIndex: 2,
      explanation: '"सड़क के उस पार" = "Across the road".',
    ),
    QuizQuestion(
      questionEn: '"तुम्हारे साथ" in English is ___.',
      questionHi: '"तुम्हारे साथ" को English में क्या कहते हैं?',
      options: ['With me', 'With him', 'With you', 'With us'],
      correctIndex: 2,
      explanation: '"तुम्हारे साथ" = "With you".',
    ),
    QuizQuestion(
      questionEn: '"तुम्हारे बिना" in English is ___.',
      questionHi: '"तुम्हारे बिना" को English में क्या कहते हैं?',
      options: ['For you', 'Without you', 'With you', 'About you'],
      correctIndex: 1,
      explanation: '"तुम्हारे बिना" = "Without you".',
    ),
    QuizQuestion(
      questionEn: '"जानबूझकर" in English is ___.',
      questionHi: '"जानबूझकर" को English में क्या कहते हैं?',
      options: ['Unknowingly', 'Unnecessarily', 'Knowingly', 'Wholeheartedly'],
      correctIndex: 2,
      explanation: '"जानबूझकर" = "Knowingly". "अनजाने में" = "Unknowingly".',
    ),
    QuizQuestion(
      questionEn: '"मेरे लिए" in English is ___.',
      questionHi: '"मेरे लिए" को English में क्या कहते हैं?',
      options: ['About me', 'With me', 'For me', 'Like me'],
      correctIndex: 2,
      explanation: '"मेरे लिए" = "For me". "तुम्हारे लिए" = "For you".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 11 QUIZ — States & Adjectives
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> statesQuestions = [
    QuizQuestion(
      questionEn: '"सोया हुआ" in English is ___.',
      questionHi: '"सोया हुआ" को English में क्या कहते हैं?',
      options: ['Awake', 'Tired', 'Asleep', 'Hidden'],
      correctIndex: 2,
      explanation: '"सोया हुआ" = "Asleep". "जागा हुआ" = "Awake".',
    ),
    QuizQuestion(
      questionEn: '"टूटा हुआ" in English is ___.',
      questionHi: '"टूटा हुआ" को English में क्या कहते हैं?',
      options: ['Bent', 'Torn', 'Broken', 'Lost'],
      correctIndex: 2,
      explanation: '"टूटा हुआ" = "Broken". "मुड़ा हुआ" = "Bent". "फटा हुआ" = "Torn".',
    ),
    QuizQuestion(
      questionEn: '"छिपा हुआ" in English is ___.',
      questionHi: '"छिपा हुआ" को English में क्या कहते हैं?',
      options: ['Buried', 'Stopped', 'Decorated', 'Hidden'],
      correctIndex: 3,
      explanation: '"छिपा हुआ" = "Hidden". "दफनाया हुआ" = "Buried".',
    ),
    QuizQuestion(
      questionEn: '"थका हुआ" in English is ___.',
      questionHi: '"थका हुआ" को English में क्या कहते हैं?',
      options: ['Shocked', 'Scared', 'Tired', 'Standing'],
      correctIndex: 2,
      explanation: '"थका हुआ" = "Tired". "चौंका हुआ" = "Shocked".',
    ),
    QuizQuestion(
      questionEn: '"लिखा हुआ" in English is ___.',
      questionHi: '"लिखा हुआ" को English में क्या कहते हैं?',
      options: ['Sitting', 'Written', 'Kept', 'Standing'],
      correctIndex: 1,
      explanation: '"लिखा हुआ" = "Written". "बैठा हुआ" = "Sitting". "रखा हुआ" = "Kept".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 12 — Updated Chapter Final Quiz (12 mixed questions)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'What is a sentence?',
      questionHi: 'वाक्य किसे कहते हैं?',
      options: ['A single word', 'A group of words giving a complete message', 'Letters', 'A paragraph'],
      correctIndex: 1,
      explanation: 'A sentence is a group of words that gives a complete message.',
    ),
    QuizQuestion(
      questionEn: '"Do you play?" is a ___ sentence.',
      questionHi: '"Do you play?" ___ वाक्य है।',
      options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'],
      correctIndex: 1,
      explanation: 'It asks a question → Interrogative sentence.',
    ),
    QuizQuestion(
      questionEn: '"Ram\'s pen" means ___.',
      questionHi: '"Ram\'s pen" का मतलब ___.',
      options: ['Ram and Pen', 'Pen of Ram', 'Ram is Pen', 'Pen for Ram'],
      correctIndex: 1,
      explanation: 'Apostrophe \'s shows possession.',
    ),
    QuizQuestion(
      questionEn: '"Is, am, are" are ___ verbs.',
      questionHi: '"Is, am, are" ___ क्रियाएँ हैं।',
      options: ['Main', 'Object', 'Helping', 'Subject'],
      correctIndex: 2,
      explanation: 'Is, am, are are Helping Verbs (सहायक क्रिया).',
    ),
    QuizQuestion(
      questionEn: 'For NEAR + PLURAL, use ___.',
      questionHi: 'पास + बहुवचन के लिए ___ प्रयोग करते हैं।',
      options: ['That', 'This', 'Those', 'These'],
      correctIndex: 3,
      explanation: 'Near + Plural = "These".',
    ),
    QuizQuestion(
      questionEn: '"हम दोनों" in English is ___.',
      questionHi: '"हम दोनों" = ___',
      options: ['We all', 'We both / Both of us', 'We two', 'Both we'],
      correctIndex: 1,
      explanation: '"हम दोनों" = "We both" या "Both of us".',
    ),
    QuizQuestion(
      questionEn: '"तुम्हारे बिना" = ___',
      questionHi: '"तुम्हारे बिना" = ___',
      options: ['For you', 'Without you', 'With you', 'About you'],
      correctIndex: 1,
      explanation: '"तुम्हारे बिना" = "Without you".',
    ),
    QuizQuestion(
      questionEn: '"सोया हुआ" = ___',
      questionHi: '"सोया हुआ" = ___',
      options: ['Awake', 'Tired', 'Asleep', 'Hidden'],
      correctIndex: 2,
      explanation: '"सोया हुआ" = "Asleep".',
    ),
    QuizQuestion(
      questionEn: '"Is Ram not a good boy?" is ___.',
      questionHi: '"Is Ram not a good boy?" ___ है।',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: 'Has "not" AND is a question → Negative Interrogative.',
    ),
    QuizQuestion(
      questionEn: '"जानबूझकर" = ___',
      questionHi: '"जानबूझकर" = ___',
      options: ['Unknowingly', 'Unnecessarily', 'Knowingly', 'Wholeheartedly'],
      correctIndex: 2,
      explanation: '"जानबूझकर" = "Knowingly".',
    ),
    QuizQuestion(
      questionEn: '"टूटा हुआ" = ___',
      questionHi: '"टूटा हुआ" = ___',
      options: ['Bent', 'Torn', 'Broken', 'Lost'],
      correctIndex: 2,
      explanation: '"टूटा हुआ" = "Broken".',
    ),
    QuizQuestion(
      questionEn: '"You" is always treated as ___.',
      questionHi: '"You" को हमेशा ___ की तरह प्रयोग करते हैं।',
      options: ['Singular', 'Plural', 'Third Person', 'First Person'],
      correctIndex: 1,
      explanation: '"You" is always Plural in English.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Both & All
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> bothPhrases = [
    {'hindi': 'हम दोनों', 'english': 'We both / Both of us', 'pronunciation': 'वी बोथ / बोथ आँफ अस'},
    {'hindi': 'तुम दोनों', 'english': 'You both / Both of you', 'pronunciation': 'यू बोथ / बोथ आँफ यू'},
    {'hindi': 'वे/वो दोनों', 'english': 'They both / Both of them', 'pronunciation': 'दे बोथ / बोथ आँफ दैम'},
    {'hindi': 'हम तीनों', 'english': 'We three / Three of us', 'pronunciation': 'वी थ्री / थ्री आँफ अस'},
    {'hindi': 'हम चारों', 'english': 'We four / Four of us', 'pronunciation': 'वी फोर / फोर आँफ अस'},
    {'hindi': 'वे पाँचों', 'english': 'They five / Those five', 'pronunciation': 'दे फाइव / दोज़ फाइव'},
  ];

  static const List<Map<String, String>> allPhrases = [
    {'hindi': 'हम सभी', 'english': 'We all / All of us', 'pronunciation': 'वी ऑल / ऑल आँफ अस'},
    {'hindi': 'तुम सभी', 'english': 'You all / All of you', 'pronunciation': 'यू ऑल / ऑल आँफ यू'},
    {'hindi': 'ये सभी (पास, सजीव/निर्जीव)', 'english': 'These all', 'pronunciation': 'दीज़ ऑल'},
    {'hindi': 'वो सभी (दूर, सजीव/निर्जीव)', 'english': 'Those all', 'pronunciation': 'दोज़ ऑल'},
    {'hindi': 'वे/वो सभी (सजीव)', 'english': 'Those / They all', 'pronunciation': 'दोज़ / दे ऑल'},
    {'hindi': 'ये सभी किताबें', 'english': 'These all books / All of these books', 'pronunciation': 'दीज़ ऑल बुक्स'},
    {'hindi': 'वो सभी पेन', 'english': 'Those all pens / All of those pens', 'pronunciation': 'दोज़ ऑल पेन्ज़'},
    {'hindi': 'वो सभी लोग', 'english': 'Those / They all people', 'pronunciation': 'दोज़ / दे ऑल पीपल'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Useful Phrases (grouped)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> possessivePhrases = [
    {'hindi': 'तुम्हारी आवाज़', 'english': 'Your voice'},
    {'hindi': 'राम की आवाज़', 'english': "Ram's voice"},
    {'hindi': 'तुम्हारे मोबाइल की आवाज़', 'english': "Your mobile's sound"},
    {'hindi': 'उस लड़के के पैसे', 'english': "That boy's money"},
    {'hindi': 'हम दोनों की किताबें', 'english': 'Books of we both'},
    {'hindi': 'कमरे की खिड़कियाँ', 'english': "Room's windows"},
    {'hindi': 'मछलियों का खाना', 'english': "Fishes' food"},
    {'hindi': 'माँ का दिल', 'english': "Mother's heart"},
    {'hindi': 'दिल का दर्द', 'english': 'The pain of heart'},
  ];

  static const List<Map<String, String>> prepositionPhrases = [
    {'hindi': 'सड़क के उस पार', 'english': 'Across the road'},
    {'hindi': 'पेड़ के पीछे', 'english': 'Behind the tree'},
    {'hindi': 'हमारी तरफ', 'english': 'Towards us'},
    {'hindi': 'मेरे आगे', 'english': 'Ahead of me'},
    {'hindi': 'मेरे सामने', 'english': 'In front of me'},
    {'hindi': 'रवि के बगल में', 'english': 'Next to Ravi / Beside Ravi'},
    {'hindi': 'टेबल के नीचे', 'english': 'Under the table'},
    {'hindi': 'मेरी हथेली पर', 'english': 'On my palm'},
    {'hindi': 'दिल्ली की तरफ', 'english': 'Towards Delhi'},
    {'hindi': 'सबसे आगे', 'english': 'Ahead of all'},
    {'hindi': 'सबसे पीछे', 'english': 'Behind all'},
    {'hindi': 'मेरे सिर के ऊपर', 'english': 'On my head'},
  ];

  static const List<Map<String, String>> withPhrases = [
    {'hindi': 'मेरे साथ', 'english': 'With me'},
    {'hindi': 'तुम्हारे साथ', 'english': 'With you'},
    {'hindi': 'उसके साथ', 'english': 'With him/her'},
    {'hindi': 'हमारे साथ', 'english': 'With us'},
    {'hindi': 'उनके साथ', 'english': 'With them'},
    {'hindi': 'किसी के साथ', 'english': 'With someone'},
    {'hindi': 'किसी और के साथ', 'english': 'With someone else'},
    {'hindi': 'राम के साथ', 'english': 'With Ram'},
  ];

  static const List<Map<String, String>> causePhrases = [
    {'hindi': 'तुम्हारी वजह से', 'english': 'Due to you / Because of you'},
    {'hindi': 'राम की वजह से', 'english': 'Due to Ram / Because of Ram'},
    {'hindi': 'बच्चों के कारण', 'english': 'Due to children / Because of children'},
    {'hindi': 'पैसे के कारण', 'english': 'Due to money / Because of money'},
    {'hindi': 'बच्चे की वजह से', 'english': 'Due to the kid / Because of the kid'},
  ];

  static const List<Map<String, String>> miscPhrases = [
    {'hindi': 'जानबूझकर', 'english': 'Knowingly'},
    {'hindi': 'अनजाने में', 'english': 'Unknowingly'},
    {'hindi': 'दिल लगाकर', 'english': 'Wholeheartedly'},
    {'hindi': 'फालतू में', 'english': 'Unnecessarily'},
    {'hindi': 'तुम्हारे बिना', 'english': 'Without you'},
    {'hindi': 'उसकी बिना', 'english': 'Without him'},
    {'hindi': 'मेरे लिए', 'english': 'For me'},
    {'hindi': 'तुम्हारे लिए', 'english': 'For you'},
    {'hindi': 'सिर्फ़ तुम्हारे लिए', 'english': 'Only for you'},
    {'hindi': 'तुम्हारे बारे में', 'english': 'About you'},
    {'hindi': 'मेरे बारे में', 'english': 'About me'},
    {'hindi': 'फिर कभी', 'english': 'Some other time'},
    {'hindi': 'ऐसा ही कुछ', 'english': 'Something like this'},
    {'hindi': 'ऐसा कुछ नहीं', 'english': 'Nothing as such'},
  ];

  static const List<Map<String, String>> suchPhrases = [
    {'hindi': 'ऐसा तोहफ़ा', 'english': 'Such a gift'},
    {'hindi': 'ऐसे तोहफ़े', 'english': 'Such gifts'},
    {'hindi': 'ऐसी कहानी', 'english': 'Such a story'},
    {'hindi': 'ऐसी कहानियाँ', 'english': 'Such stories'},
    {'hindi': 'ऐसा दिन', 'english': 'Such a day'},
    {'hindi': 'ऐसे दिन', 'english': 'Such days'},
    {'hindi': 'ऐसे लोग', 'english': 'Such people'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — States & Adjectives
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> statesContent = [
    {'hindi': 'सोया हुआ', 'english': 'Asleep', 'pronunciation': 'असलीप'},
    {'hindi': 'जागा हुआ', 'english': 'Awake', 'pronunciation': 'अवेक'},
    {'hindi': 'थका हुआ', 'english': 'Tired', 'pronunciation': 'टायर्ड'},
    {'hindi': 'चौंका हुआ', 'english': 'Shocked', 'pronunciation': 'शॉक्ड'},
    {'hindi': 'खोया हुआ', 'english': 'Lost', 'pronunciation': 'लॉस्ट'},
    {'hindi': 'पिटा हुआ', 'english': 'Beaten', 'pronunciation': 'बीटन'},
    {'hindi': 'डरा हुआ', 'english': 'Scared / Terrified', 'pronunciation': 'स्केयर्ड / टैरीफाइड'},
    {'hindi': 'टूटा हुआ', 'english': 'Broken', 'pronunciation': 'ब्रोकन'},
    {'hindi': 'मुड़ा हुआ', 'english': 'Bent', 'pronunciation': 'बेन्ट'},
    {'hindi': 'फटा हुआ', 'english': 'Torn', 'pronunciation': 'टॉर्न'},
    {'hindi': 'लिखा हुआ', 'english': 'Written', 'pronunciation': 'रिटन'},
    {'hindi': 'रुका हुआ', 'english': 'Stopped', 'pronunciation': 'स्टॉप्ड'},
    {'hindi': 'बैठा हुआ', 'english': 'Sitting', 'pronunciation': 'सिटिंग'},
    {'hindi': 'खड़ा हुआ', 'english': 'Standing', 'pronunciation': 'स्टैन्डिंग'},
    {'hindi': 'दफनाया हुआ', 'english': 'Buried', 'pronunciation': 'बरीड'},
    {'hindi': 'छिपा हुआ', 'english': 'Hidden', 'pronunciation': 'हिडन'},
    {'hindi': 'रखा हुआ', 'english': 'Kept', 'pronunciation': 'कैप्ट'},
    {'hindi': 'सजा हुआ', 'english': 'Decorated', 'pronunciation': 'डेकोरेटेड'},
  ];
}