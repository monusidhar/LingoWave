import '../models/lesson_model.dart';

/// Chapter 19 — Tense (काल)
/// NOTE: This chapter is large. More lessons will be added as content arrives.
class Chapter19Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 19,
        title: 'Tense',
        titleHindi: 'काल',
        description: 'Present, Past & Future Tenses',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
              id: 1,
              title: 'Introduction to Tense',
              titleHindi: 'Tense का परिचय',
              emoji: '⏱️',
              type: LessonType.ch19Intro,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 2,
              title: 'Present Indefinite — Affirmative',
              titleHindi: 'Present Indefinite — सकारात्मक',
              emoji: '✅',
              type: LessonType.ch19PresentIndefiniteAff,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 3,
              title: 'Present Indefinite — Negative & Interrogative',
              titleHindi: 'Present Indefinite — नकारात्मक और प्रश्नवाचक',
              emoji: '❓',
              type: LessonType.ch19PresentIndefiniteNeg,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 4,
              title: 'Present Continuous Tense',
              titleHindi: 'Present Continuous Tense',
              emoji: '🔄',
              type: LessonType.ch19PresentContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 5,
              title: 'Present Perfect Tense',
              titleHindi: 'Present Perfect Tense',
              emoji: '✔️',
              type: LessonType.ch19PresentPerfect,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 6,
              title: 'Present Perfect Continuous',
              titleHindi: 'Present Perfect Continuous',
              emoji: '⏳',
              type: LessonType.ch19PresentPerfectContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 7,
              title: 'Past Indefinite Tense',
              titleHindi: 'Past Indefinite Tense',
              emoji: '⏮️',
              type: LessonType.ch19PastIndefinite,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 8,
              title: 'Past Continuous Tense',
              titleHindi: 'Past Continuous Tense',
              emoji: '🔁',
              type: LessonType.ch19PastContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 9,
              title: 'Past Perfect Tense',
              titleHindi: 'Past Perfect Tense',
              emoji: '📌',
              type: LessonType.ch19PastPerfect,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 10,
              title: 'Past Perfect Continuous',
              titleHindi: 'Past Perfect Continuous',
              emoji: '🕰️',
              type: LessonType.ch19PastPerfectContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 11,
              title: 'Future Indefinite Tense',
              titleHindi: 'Future Indefinite Tense',
              emoji: '🔮',
              type: LessonType.ch19FutureIndefinite,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 12,
              title: 'Future Continuous Tense',
              titleHindi: 'Future Continuous Tense',
              emoji: '🌀',
              type: LessonType.ch19FutureContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 13,
              title: 'Future Perfect Tense',
              titleHindi: 'Future Perfect Tense',
              emoji: '🏁',
              type: LessonType.ch19FuturePerfect,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 14,
              title: 'Future Perfect Continuous',
              titleHindi: 'Future Perfect Continuous',
              emoji: '♾️',
              type: LessonType.ch19FuturePerfectContinuous,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 15,
              title: 'Practice Exercise',
              titleHindi: 'अभ्यास — 190 वाक्य',
              emoji: '✍️',
              type: LessonType.ch19Practice,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 16,
              title: 'Test Paper — I & II',
              titleHindi: 'टेस्ट पेपर — I और II',
              emoji: '📝',
              type: LessonType.ch19TestPaper1,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 17,
              title: 'Test Paper — III & IV',
              titleHindi: 'टेस्ट पेपर — III और IV',
              emoji: '📋',
              type: LessonType.ch19TestPaper2,
              status: LessonStatus.inProgress),
          LessonModel(
              id: 18,
              title: 'Chapter Quiz',
              titleHindi: 'अध्याय क्विज़',
              emoji: '🏆',
              type: LessonType.ch19ChapterQuiz,
              status: LessonStatus.inProgress,
              totalXP: 150),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch19Intro:                       return introQuestions;
      case LessonType.ch19PresentIndefiniteAff:        return presentIndefiniteAffQuestions;
      case LessonType.ch19PresentIndefiniteNeg:        return presentIndefiniteNegQuestions;
      case LessonType.ch19PresentContinuous:           return presentContinuousQuestions;
      case LessonType.ch19PresentPerfect:              return presentPerfectQuestions;
      case LessonType.ch19PresentPerfectContinuous:    return presentPerfectContinuousQuestions;
      case LessonType.ch19PastIndefinite:              return pastIndefiniteQuestions;
      case LessonType.ch19PastContinuous:              return pastContinuousQuestions;
      case LessonType.ch19PastPerfect:                 return pastPerfectQuestions;
      case LessonType.ch19PastPerfectContinuous:       return pastPerfectContinuousQuestions;
      case LessonType.ch19FutureIndefinite:            return futureIndefiniteQuestions;
      case LessonType.ch19FutureContinuous:            return futureContinuousQuestions;
      case LessonType.ch19FuturePerfect:               return futurePerfectQuestions;
      case LessonType.ch19FuturePerfectContinuous:     return futurePerfectContinuousQuestions;
      case LessonType.ch19Practice:                    return practiceQuizQuestions;
      case LessonType.ch19TestPaper1:                  return testPaper1QuizQuestions;
      case LessonType.ch19TestPaper2:                  return testPaper2QuizQuestions;
      case LessonType.ch19ChapterQuiz:                 return chapterFinalQuestions;
      default:                                         return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 1 — Introduction to Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'How many types of Tense are there?',
      questionHi: 'Tense कितने प्रकार के होते हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 1,
      explanation: 'Tense 3 प्रकार के होते हैं: Present, Past और Future.',
    ),
    QuizQuestion(
      questionEn: 'How many sub-types does each Tense have?',
      questionHi: 'प्रत्येक Tense के कितने उप-प्रकार होते हैं?',
      options: ['2', '3', '4', '5'],
      correctIndex: 2,
      explanation: 'प्रत्येक Tense के 4 उप-प्रकार होते हैं: Indefinite, Continuous, Perfect, Perfect Continuous.',
    ),
    QuizQuestion(
      questionEn: 'Which are the Present Tense helping verbs?',
      questionHi: 'Present Tense की Helping Verbs कौन सी हैं?',
      options: [
        'did, was, were, had',
        'will, will be, will have',
        'do, does, is, am, are, has, have, has been, have been',
        'was, were, had been',
      ],
      correctIndex: 2,
      explanation: 'Present Tense Helping Verbs: do, does, is, am, are, has, have, has been, have been.',
    ),
    QuizQuestion(
      questionEn: 'Which are the Past Tense helping verbs?',
      questionHi: 'Past Tense की Helping Verbs कौन सी हैं?',
      options: [
        'do, does, is, am, are',
        'did, was, were, had, had been',
        'will, will be, will have',
        'has, have, has been',
      ],
      correctIndex: 1,
      explanation: 'Past Tense Helping Verbs: did, was, were, had, had been.',
    ),
    QuizQuestion(
      questionEn: 'Is "Shall" commonly used as a Future Tense helping verb now?',
      questionHi: 'क्या "Shall" अब Future Tense में प्रयोग किया जाता है?',
      options: [
        'Yes, always',
        'No, "Shall" is rarely used now. "Will" is preferred.',
        'Only with "I" and "We"',
        'Only in questions',
      ],
      correctIndex: 1,
      explanation: 'नोट: अब "Shall" का प्रयोग Future Tense में प्रायः नहीं किया जाता। "Will" का प्रयोग होता है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 2 — Present Indefinite: Affirmative
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentIndefiniteAffQuestions = [
    QuizQuestion(
      questionEn: '"Ram goes for a walk." — Why "goes" not "go"?',
      questionHi: '"राम घूमने जाता है।" — "goes" क्यों, "go" क्यों नहीं?',
      options: [
        'Ram is Plural subject',
        'Ram is 3rd Person Singular — s/es is added to verb',
        'Ram is 1st Person',
        'Goes is past tense',
      ],
      correctIndex: 1,
      explanation: '3rd Person Singular subject (Ram) के साथ verb में s/es लगता है। go → goes.',
    ),
    QuizQuestion(
      questionEn: 'When do we add "es" instead of "s" to the verb?',
      questionHi: 'Verb के साथ "es" कब लगाते हैं?',
      options: [
        'Always with all verbs',
        'When verb ends in o, ss, sh, x, zz, ch, or consonant+y',
        'Only when verb ends in o',
        'Never, always use s',
      ],
      correctIndex: 1,
      explanation: '"es" लगाते हैं जब verb का अंत हो: o (goes), ss/sh (misses/pushes), x/zz/ch (fixes/buzzes/catches), consonant+y (cry→cries).',
    ),
    QuizQuestion(
      questionEn: '"Play" becomes ___ for 3rd Person Singular.',
      questionHi: '"Play" का 3rd Person Singular रूप क्या होगा?',
      options: ['Playes', 'Plaies', 'Plays', 'Play'],
      correctIndex: 2,
      explanation: '"Play" ends in vowel+y (a+y) → simply add s → "plays". Consonant+y होता तो y→i+es होता।',
    ),
    QuizQuestion(
      questionEn: '"Cry" becomes ___ for 3rd Person Singular.',
      questionHi: '"Cry" का 3rd Person Singular रूप?',
      options: ['Crys', 'Cries', 'Cryes', 'Cry'],
      correctIndex: 1,
      explanation: '"Cry" ends in consonant+y (r+y) → change y to i → add es → "cries".',
    ),
    QuizQuestion(
      questionEn: '"We laugh." — Why no s/es?',
      questionHi: '"हम हँसते हैं।" — "laugh" में s/es क्यों नहीं?',
      options: [
        'We is 3rd Person Plural',
        'We is 1st Person Plural — no s/es needed',
        'Laugh is irregular verb',
        'We is 2nd Person',
      ],
      correctIndex: 1,
      explanation: '"We" is 1st Person Plural। Only 3rd Person Singular subject के साथ s/es लगता है।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 3 — Present Indefinite: Negative & Interrogative
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentIndefiniteNegQuestions = [
    QuizQuestion(
      questionEn: 'Negative rule for Present Indefinite is ___.',
      questionHi: 'Present Indefinite के Negative वाक्य का rule?',
      options: [
        'Subject + is/am/are + not + verb',
        'Subject + does/do + not + verb 1st form',
        'Subject + did + not + verb',
        'Subject + not + verb + s/es',
      ],
      correctIndex: 1,
      explanation: 'Rule: Subject + does/do + not + verb 1st form + object. 3rd Person Singular → does not; others → do not.',
    ),
    QuizQuestion(
      questionEn: '"Uncle doesn\'t meet me." — Why "doesn\'t"?',
      questionHi: '"अंकल मुझसे नहीं मिलते।" — "doesn\'t" क्यों?',
      options: [
        'Uncle is 1st Person',
        'Uncle is 3rd Person Singular',
        'Uncle is Plural',
        'Uncle is 2nd Person',
      ],
      correctIndex: 1,
      explanation: '"Uncle" is 3rd Person Singular → does not (doesn\'t). Others → do not (don\'t).',
    ),
    QuizQuestion(
      questionEn: 'Interrogative rule for Present Indefinite is ___.',
      questionHi: 'Present Indefinite के Interrogative वाक्य का rule?',
      options: [
        'Subject + verb + ?',
        'Is/Am/Are + subject + verb + ing?',
        'WH + does/do + subject + verb 1st form + object?',
        'Did + subject + verb?',
      ],
      correctIndex: 2,
      explanation: 'Rule: (WH) + does/do + subject + verb 1st form + object? — Helping verb subject से पहले आती है।',
    ),
    QuizQuestion(
      questionEn: '"Does Ram go for a walk?" — Hindi?',
      questionHi: '"Does Ram go for a walk?" — हिंदी में?',
      options: [
        'राम घूमने जाता है।',
        'राम घूमने नहीं जाता।',
        'क्या राम घूमने जाता है?',
        'क्या राम घूमने नहीं जाता?',
      ],
      correctIndex: 2,
      explanation: '"Does + subject + verb?" = Interrogative = "क्या राम घूमने जाता है?"',
    ),
    QuizQuestion(
      questionEn: '"Why does Pankaj not study with you?" — Sentence type?',
      questionHi: '"पंकज तुम्हारे साथ क्यों नहीं पढ़ता?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Why does... not..." = WH + does + subject + not + verb = Negative Interrogative.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 4 — Present Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentContinuousQuestions = [
    QuizQuestion(
      questionEn: 'Present Continuous sentences end with ___.',
      questionHi: 'Present Continuous वाक्यों के अंत में क्या होता है?',
      options: [
        'ता, ते, ती',
        'रहा है, रही है, रहे हैं, रहा हूँ',
        'था, थे, थी',
        'होगा, होगी',
      ],
      correctIndex: 1,
      explanation: 'Present Continuous की पहचान: रहा है / रही है / रहे हैं / रहा हूँ। Rule: Subject + is/am/are + verb+ing.',
    ),
    QuizQuestion(
      questionEn: '"Ram is going to school." — Why "is"?',
      questionHi: '"राम स्कूल जा रहा है।" — "is" क्यों?',
      options: [
        'Ram is Plural',
        'Ram is 3rd Person Singular',
        'Ram is 1st Person',
        'Ram is 2nd Person',
      ],
      correctIndex: 1,
      explanation: '3rd Person Singular (Ram) → is. Rule: is + verb+ing.',
    ),
    QuizQuestion(
      questionEn: '"I am coming home." — Why "am"?',
      questionHi: '"मैं घर आ रहा हूँ।" — "am" क्यों?',
      options: [
        'I is 3rd Person',
        'I is 1st Person Singular — always uses am',
        'I is Plural',
        'am is Past tense',
      ],
      correctIndex: 1,
      explanation: '"I" = 1st Person Singular → always uses "am". I + am + verb+ing.',
    ),
    QuizQuestion(
      questionEn: '"People are making fun of him." — Why "are"?',
      questionHi: '"लोग उसका मज़ाक उड़ा रहे हैं।" — "are" क्यों?',
      options: [
        'People is 3rd Person Singular',
        'People is 3rd Person Plural',
        'People is 1st Person',
        'People is 2nd Person',
      ],
      correctIndex: 1,
      explanation: '"People" is 3rd Person Plural → are. Rule: are + verb+ing.',
    ),
    QuizQuestion(
      questionEn: '"Why is Aman not talking?" — Sentence type?',
      questionHi: '"अमन बात क्यों नहीं कर रहा है?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Why is... not..." = WH + is + subject + not + verb+ing = Negative Interrogative.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// Tense types overview
  static const List<Map<String, String>> tenseTypes = [
    {'name': 'Present', 'nameHi': 'वर्तमान काल',  'emoji': '🟢', 'helpingVerbs': 'do, does, is, am, are, has, have, has been, have been'},
    {'name': 'Past',    'nameHi': 'भूत काल',       'emoji': '🔵', 'helpingVerbs': 'did, was, were, had, had been'},
    {'name': 'Future',  'nameHi': 'भविष्यत् काल',  'emoji': '🟡', 'helpingVerbs': 'will, will be, will have, will have been'},
  ];

  /// Sub-types of each tense
  static const List<Map<String, String>> tenseSubTypes = [
    {'no': '1', 'name': 'Indefinite',        'nameHi': 'सामान्य',             'emoji': '1️⃣'},
    {'no': '2', 'name': 'Continuous',        'nameHi': 'अपूर्ण/जारी',         'emoji': '2️⃣'},
    {'no': '3', 'name': 'Perfect',           'nameHi': 'पूर्ण',               'emoji': '3️⃣'},
    {'no': '4', 'name': 'Perfect Continuous','nameHi': 'पूर्ण + जारी',        'emoji': '4️⃣'},
  ];

  /// Prerequisites for learning Tense
  static const List<Map<String, String>> prerequisites = [
    {'no': '1', 'topic': 'वाक्य के 3 भाग',          'en': 'Subject, Verb & Object',              'chapter': 'Lesson 2'},
    {'no': '2', 'topic': 'Person & Number',          'en': '1st/2nd/3rd Person, Singular/Plural', 'chapter': 'Lesson 2'},
    {'no': '3', 'topic': 'Sentence Types',           'en': 'Affirmative, Negative, Interrogative','chapter': 'Lesson 2'},
    {'no': '4', 'topic': 'Verb की 3 Forms',          'en': 'V1, V2, V3',                          'chapter': 'Verbs Chapter'},
    {'no': '5', 'topic': 'WH Family',                'en': 'Who, What, Why, When, Where, How...',  'chapter': 'WH Family Chapter'},
  ];

  /// Table 1 — Sentence parts examples
  static const List<Map<String, String>> sentencePartsExamples = [
    {'sentence': 'राम घूमता है।',             'subject': 'राम',      'verb': 'घूमना',  'object': '—'},
    {'sentence': 'लोग नाच रहे हैं।',          'subject': 'लोग',      'verb': 'नाचना',  'object': '—'},
    {'sentence': 'हम लोग टीवी देख रहे हैं।', 'subject': 'हम लोग',   'verb': 'देखना',  'object': 'टीवी'},
    {'sentence': 'मुझे एक घड़ी मिली है।',     'subject': 'मुझे',     'verb': 'मिलना',  'object': 'घड़ी'},
    {'sentence': 'गिलास से पानी निकल रहा है।','subject': 'पानी',    'verb': 'निकलना', 'object': 'गिलास'},
  ];

  // ─── Present Indefinite ───────────────────────────────────────────────────

  /// s/es rules for 3rd person singular
  static const List<Map<String, String>> sEsRules = [
    {'rule': "Verb ending in 'o'",            'ruleHi': "अंत में 'o' हो",                       'examples': 'go→goes, do→does'},
    {'rule': "Verb ending in 'ss' or 'sh'",   'ruleHi': "अंत में 'ss' या 'sh' हो",              'examples': 'miss→misses, push→pushes, kiss→kisses'},
    {'rule': "Verb ending in 'x', 'zz', 'ch'",'ruleHi': "अंत में 'x', 'zz' या 'ch' हो",        'examples': 'fix→fixes, buzz→buzzes, catch→catches'},
    {'rule': "Consonant + y → change y→i + es",'ruleHi': "व्यंजन + y → y को i में बदलो + es", 'examples': 'cry→cries, marry→marries, try→tries, fly→flies'},
    {'rule': "Vowel + y → just add s",         'ruleHi': "स्वर + y → सिर्फ s लगाओ",            'examples': 'say→says, play→plays'},
  ];

  /// Present Indefinite Affirmative examples
  static const List<Map<String, String>> piAffExamples = [
    {'hindi': 'राम घूमने जाता है।',         'english': 'Ram goes for a walk.',         'reason': 'Ram = 3rd Person Singular → goes'},
    {'hindi': 'मैं खेलता हूँ।',              'english': 'I play.',                      'reason': 'I = 1st Person Singular → no s/es'},
    {'hindi': 'अमन मेरे साथ रहता है।',      'english': 'Aman lives with me.',          'reason': 'Aman = 3rd Person Singular → lives'},
    {'hindi': 'हम हँसते हैं।',               'english': 'We laugh.',                    'reason': 'We = 1st Person Plural → no s/es'},
    {'hindi': 'घाव से खून निकलता है।',       'english': 'Blood oozes from the wound.', 'reason': 'Blood = 3rd Person Singular → oozes'},
  ];

  /// Present Indefinite Negative examples
  static const List<Map<String, String>> piNegExamples = [
    {'hindi': 'राम घूमने नहीं जाता है।',        'english': 'Ram does not go for a walk.',    'reason': 'Ram = 3rd Person Singular → does not'},
    {'hindi': 'मैं नहीं खेलता हूँ।',             'english': 'I do not play.',                'reason': 'I = 1st Person Singular → do not'},
    {'hindi': 'वे लोग मेरे साथ नहीं रहते हैं।', 'english': 'They people do not live with me.','reason': 'They = 3rd Person Plural → do not'},
    {'hindi': 'अंकल मुझसे नहीं मिलते हैं।',     'english': "Uncle doesn't meet me.",        'reason': 'Uncle = 3rd Person Singular → does not'},
    {'hindi': 'उसके माता पिता उस पर भरोसा नहीं करते।','english': 'His parents do not trust him.','reason': 'His parents = 3rd Person Plural → do not'},
  ];

  /// Present Indefinite Interrogative examples
  static const List<Map<String, String>> piInterExamples = [
    {'hindi': 'क्या राम घूमने जाता है?',                'english': 'Does Ram go for a walk?'},
    {'hindi': 'क्या मैं स्कूल जाता हूँ?',               'english': 'Do I go to school?'},
    {'hindi': 'क्या वह स्टेज पर नाचती है?',             'english': 'Does she dance on the stage?'},
    {'hindi': 'अमन तुम्हारे साथ क्यों रहता है?',        'english': 'Why does Aman live with you?'},
    {'hindi': 'वे बच्चे तुम्हारे साथ कब से रहते हैं?',  'english': 'Since when do they children live with you?'},
    {'hindi': 'हम कब तक साथ खेलते हैं?',               'english': 'Until when do we play together?'},
  ];

  /// Present Indefinite Negative Interrogative examples
  static const List<Map<String, String>> piNegInterExamples = [
    {'hindi': 'क्या राम घूमने नहीं जाता है?',    'english': 'Does Ram not go for a walk?'},
    {'hindi': 'पंकज तुम्हारे साथ क्यों नहीं पढ़ता?','english': 'Why does Pankaj not study with you?'},
    {'hindi': 'तुम कौन सा खेल नहीं खेलते?',      'english': 'Which game do you not play?'},
    {'hindi': 'मम्मी उसे क्यों नहीं डाँटती?',    'english': 'Why does mom not scold him/her?'},
  ];

  // ─── Present Continuous ───────────────────────────────────────────────────

  /// Present Continuous helping verb rules
  static const List<Map<String, String>> pcHelpingVerbRules = [
    {'subject': '3rd Person Singular',   'examples': 'Ram, She, He, It, My heart...', 'verb': 'is',  'color': 'primary'},
    {'subject': 'I (1st Person Singular)','examples': 'I',                             'verb': 'am',  'color': 'success'},
    {'subject': 'All Others',            'examples': 'We, You, They, People...',       'verb': 'are', 'color': 'accent'},
  ];

  /// Present Continuous Affirmative examples
  static const List<Map<String, String>> pcAffExamples = [
    {'hindi': 'राम स्कूल जा रहा है।',            'english': 'Ram is going to school.',       'reason': 'Ram = 3rd Person Singular → is'},
    {'hindi': 'वह घूमने जा रहा है।',             'english': 'He is going for a walk.',        'reason': 'He = 3rd Person Singular → is'},
    {'hindi': 'मैं घर आ रहा हूँ।',               'english': 'I am coming home.',              'reason': 'I = 1st Person Singular → am'},
    {'hindi': 'मेरा दिल तुम्हें ढूँढ रहा है।',  'english': 'My heart is looking for you.',   'reason': 'My heart = 3rd Person Singular → is'},
    {'hindi': 'लोग उसका मज़ाक उड़ा रहे हैं।',   'english': 'People are making fun of him.',  'reason': 'People = 3rd Person Plural → are'},
  ];

  /// Present Continuous Negative examples
  static const List<Map<String, String>> pcNegExamples = [
    {'hindi': 'राम घूमने नहीं जा रहा है।',     'english': 'Ram is not going for a walk.'},
    {'hindi': 'वो कहीं नहीं जा रहा है।',       'english': 'He is not going anywhere.'},
    {'hindi': 'मैं आज नहीं पढ़ रहा हूँ।',       'english': 'I am not studying today.'},
    {'hindi': 'लोग उससे बात नहीं कर रहे हैं।', 'english': 'People are not talking to him.'},
  ];

  /// Present Continuous Interrogative examples
  static const List<Map<String, String>> pcInterExamples = [
    {'hindi': 'क्या वह घूमने जा रहा है?',                   'english': 'Is he going for a walk?'},
    {'hindi': 'क्या लोग स्टेज पर नाच रहे हैं?',             'english': 'Are people dancing on the stage?'},
    {'hindi': 'वो बच्चे तुम्हारे साथ कहाँ पर खेल रहे हैं?', 'english': 'Where are those children playing with you?'},
  ];

  /// Present Continuous Negative Interrogative examples
  static const List<Map<String, String>> pcNegInterExamples = [
    {'hindi': 'क्या राम घूमने नहीं जा रहा है?', 'english': 'Is Ram not going for a walk?'},
    {'hindi': 'अमन बात क्यों नहीं कर रहा है?',  'english': 'Why is Aman not talking?'},
    {'hindi': 'वो स्कूल क्यों नहीं जा रहा?',    'english': 'Why is he not going to school?'},
  ];

  /// Table 2 — Sentence types examples for intro
  static const List<Map<String, String>> sentenceTypesTable = [
    {
      'type': 'Affirmative', 'typeHi': 'सकारात्मक',
      'ex1': 'मुझे घड़ी मिली है।',       'ex2': 'लोग नाच रहे हैं।',       'ex3': 'राम घूमता है।',
    },
    {
      'type': 'Negative', 'typeHi': 'नकारात्मक',
      'ex1': 'मुझे घड़ी नहीं मिली है।', 'ex2': 'लोग नाच नहीं रहे हैं।', 'ex3': 'राम नहीं घूमता है।',
    },
    {
      'type': 'Interrogative', 'typeHi': 'प्रश्नवाचक',
      'ex1': 'क्या मुझे घड़ी मिली है?',  'ex2': 'क्या लोग नाच रहे हैं?',  'ex3': 'राम किसके साथ घूमता है?',
    },
    {
      'type': 'Negative Interrogative', 'typeHi': 'नकारात्मक प्रश्नवाचक',
      'ex1': 'क्या मुझे घड़ी नहीं मिली है?','ex2': 'क्या लोग नहीं नाच रहे हैं?','ex3': 'क्या राम नहीं घूमता है?',
    },
  ];

  /// Motivational quotes
  static const List<Map<String, String>> motivationalQuotes = [
    {
      'english': 'We must win the final war irrespective of how many battles we\'ve lost before.',
      'hindi': 'फर्क नहीं पड़ता कि कितनी लड़ाईयाँ हम पहले हार चुके हैं, हमें अंतिम युद्ध जीतना है।',
      'author': '',
    },
    {
      'english': 'Good things come to people who wait, but better things come to those who go out and get them.',
      'hindi': 'अच्छी चीज़ें उन लोगों के पास आती हैं जो इंतज़ार करते हैं, लेकिन बेहतर चीज़ें उनके पास जो बाहर जाकर उन्हें पाते हैं।',
      'author': '',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 5 — Present Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentPerfectQuestions = [
    QuizQuestion(
      questionEn: 'Present Perfect sentences end with ___.',
      questionHi: 'Present Perfect वाक्यों के अंत में क्या होता है?',
      options: ['ता, ते, ती', 'रहा है, रही है', 'चुका है, चुकी है, चुके हैं, लिया है, दिया है', 'था, थे, थी'],
      correctIndex: 2,
      explanation: 'Present Perfect की पहचान: चुका है / चुकी है / चुके हैं / लिया है / दिया है। Rule: Subject + has/have + V3.',
    ),
    QuizQuestion(
      questionEn: '"Ram has gone to school." — Why "has"?',
      questionHi: '"राम स्कूल जा चुका है।" — "has" क्यों?',
      options: ['Ram is Plural', 'Ram is 3rd Person Singular', 'Ram is 1st Person', 'Ram is 2nd Person'],
      correctIndex: 1,
      explanation: '3rd Person Singular (Ram) → has. Others → have. Rule: Subject + has/have + V3.',
    ),
    QuizQuestion(
      questionEn: '"We have seen you." — Why "have"?',
      questionHi: '"हमने तुम्हें देख लिया है।" — "have" क्यों?',
      options: ['We is 3rd Person Singular', 'We is 1st Person Plural', 'We is 2nd Person', 'We is 3rd Person Plural'],
      correctIndex: 1,
      explanation: '"We" is 1st Person Plural → have. Only 3rd Person Singular → has.',
    ),
    QuizQuestion(
      questionEn: '"Has Ram gone for a walk?" — Sentence type?',
      questionHi: '"क्या राम घूमने गया है?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: '"Has + subject + V3?" = Interrogative. Helping verb subject से पहले आती है।',
    ),
    QuizQuestion(
      questionEn: '"Why has Aman not purchased the book yet?" — Rule used?',
      questionHi: '"अमन ने अब तक किताब क्यों नहीं खरीदी है?" — Rule?',
      options: [
        'WH + has + subject + V3?',
        'WH + has + subject + not + V3?',
        'Subject + has + not + V3',
        'WH + have + subject + V3?',
      ],
      correctIndex: 1,
      explanation: 'Negative Interrogative: WH + has/have + subject + not + V3 + object?',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 6 — Present Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> presentPerfectContinuousQuestions = [
    QuizQuestion(
      questionEn: 'What is the difference between Present Continuous and Present Perfect Continuous?',
      questionHi: 'Present Continuous और Present Perfect Continuous में क्या फर्क है?',
      options: [
        'No difference',
        'Perfect Continuous also mentions the duration/time (since/for)',
        'Perfect Continuous uses was/were',
        'Perfect Continuous uses did',
      ],
      correctIndex: 1,
      explanation: 'Present Continuous = just action ongoing. Present Perfect Continuous = action ongoing + time mentioned (since/for).',
    ),
    QuizQuestion(
      questionEn: '"Since" is used for ___.',
      questionHi: '"Since" का प्रयोग ___ के लिए होता है?',
      options: ['Duration (अवधि)', 'Point of time (निश्चित समय)', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Since" = निश्चित समय (point of time): since morning, since Monday, since 2009. "For" = अवधि (duration): for 2 hours, for many days.',
    ),
    QuizQuestion(
      questionEn: '"I have been studying for 2 hours." — Why "for"?',
      questionHi: '"मैं 2 घंटे से पढ़ रहा हूँ।" — "for" क्यों?',
      options: [
        '2 hours is a point of time',
        '2 hours is a duration — use for',
        '2 hours needs since',
        'Always use for with hours',
      ],
      correctIndex: 1,
      explanation: '"2 hours" is a duration (अवधि) → use "for". "Morning/Monday/4 o\'clock" are points of time → use "since".',
    ),
    QuizQuestion(
      questionEn: '"Ram has been walking for 2 hours." — Why "has been"?',
      questionHi: '"राम 2 घंटे से घूम रहा है।" — "has been" क्यों?',
      options: ['Ram is Plural', 'Ram is 3rd Person Singular → has been', 'Ram is 1st Person', 'has been is wrong here'],
      correctIndex: 1,
      explanation: '3rd Person Singular (Ram) → has been + V+ing. Others → have been + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"He has been studying since 4 o\'clock." — Why "since"?',
      questionHi: '"वह 4 बजे से पढ़ रहा है।" — "since" क्यों?',
      options: ['4 o\'clock is a duration', '4 o\'clock is a point of time → since', 'Always use since with numbers', 'for is correct here'],
      correctIndex: 1,
      explanation: '"4 o\'clock" is a specific point of time → use "since". Duration जैसे "2 hours" → use "for".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 7 — Past Indefinite Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastIndefiniteQuestions = [
    QuizQuestion(
      questionEn: 'Past Indefinite sentences end with ___.',
      questionHi: 'Past Indefinite वाक्यों के अंत में क्या होता है?',
      options: ['रहा था, रही थी', 'चुका था, चुकी थी', 'गया, लिया, दिया, सोया (NO था/थे/थी)', 'होगा, होगी'],
      correctIndex: 2,
      explanation: 'Past Indefinite की पहचान: गया, लिया, दिया, सोया — इसमें है/हैं/था/थे/थी का प्रयोग नहीं होता। Rule: Subject + V2.',
    ),
    QuizQuestion(
      questionEn: '"Ram went for a walk." — What is "went"?',
      questionHi: '"राम घूमने गया।" — "went" क्या है?',
      options: ['1st form of go', '2nd form of go', '3rd form of go', 'Present form'],
      correctIndex: 1,
      explanation: '"went" is the 2nd form (V2) of "go". Past Indefinite Rule: Subject + V2 + Object.',
    ),
    QuizQuestion(
      questionEn: 'Negative rule for Past Indefinite is ___.',
      questionHi: 'Past Indefinite के Negative वाक्य का rule?',
      options: [
        'Subject + was/were + not + V1',
        'Subject + did not + V1',
        'Subject + had + not + V3',
        'Subject + does not + V1',
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite Negative: Subject + did not + V1 (1st form) + Object. Note: V1, not V2.',
    ),
    QuizQuestion(
      questionEn: '"Did Ram go for a walk?" — Hindi?',
      questionHi: '"Did Ram go for a walk?" — हिंदी में?',
      options: ['राम घूमने गया।', 'राम घूमने नहीं गया।', 'क्या राम घूमने गया?', 'क्या राम घूमने नहीं गया?'],
      correctIndex: 2,
      explanation: '"Did + subject + V1?" = Past Indefinite Interrogative = "क्या राम घूमने गया?"',
    ),
    QuizQuestion(
      questionEn: '"He wrote a letter." — What form of "write" is used?',
      questionHi: '"उसने एक पत्र लिखा।" — "write" की कौन सी form है?',
      options: ['V1 — write', 'V2 — wrote', 'V3 — written', 'V+ing — writing'],
      correctIndex: 1,
      explanation: 'Past Indefinite Affirmative → V2. "write" की V2 = "wrote". Subject + V2 + Object.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 8 — Past Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastContinuousQuestions = [
    QuizQuestion(
      questionEn: 'Past Continuous sentences end with ___.',
      questionHi: 'Past Continuous वाक्यों के अंत में क्या होता है?',
      options: ['रहा है, रही है, रहे हैं', 'रहा था, रही थी, रहे थे', 'चुका था, चुकी थी', 'गया, लिया'],
      correctIndex: 1,
      explanation: 'Past Continuous की पहचान: रहा था / रही थी / रहे थे। Rule: Subject + was/were + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"I was going for a walk." — Why "was"?',
      questionHi: '"मैं घूमने जा रहा था।" — "was" क्यों?',
      options: ['I is Plural', 'I is Singular → was', 'I is 3rd Person', 'was is wrong here'],
      correctIndex: 1,
      explanation: 'Singular Subject (I) → was + V+ing. Plural Subject → were + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"People were dancing on the stage." — Why "were"?',
      questionHi: '"लोग स्टेज पर नाच रहे थे।" — "were" क्यों?',
      options: ['People is Singular', 'People is Plural → were', 'People is 1st Person', 'were is wrong here'],
      correctIndex: 1,
      explanation: '"People" is Plural → were + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"Where was Ram going?" — Sentence type?',
      questionHi: '"राम कहाँ जा रहा था?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: 'WH + was + subject + V+ing? = Interrogative. "Where" is the WH word here.',
    ),
    QuizQuestion(
      questionEn: '"Was he not going for a walk?" — Hindi?',
      questionHi: '"Was he not going for a walk?"',
      options: ['वो घूमने जा रहा था।', 'क्या वो घूमने जा रहा था?', 'क्या वो घूमने नहीं जा रहा था?', 'वो घूमने नहीं जा रहा था।'],
      correctIndex: 2,
      explanation: '"Was + subject + not + V+ing?" = Negative Interrogative = "क्या वो घूमने नहीं जा रहा था?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 9 — Past Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastPerfectQuestions = [
    QuizQuestion(
      questionEn: 'Past Perfect sentences end with ___.',
      questionHi: 'Past Perfect वाक्यों के अंत में क्या होता है?',
      options: ['रहा था, रही थी', 'गया, लिया, दिया', 'चुका था, चुकी थी, चुके थे, लिया था, दिया था', 'होगा'],
      correctIndex: 2,
      explanation: 'Past Perfect की पहचान: चुका था / चुकी थी / चुके थे / लिया था / दिया था। Rule: Subject + had + V3.',
    ),
    QuizQuestion(
      questionEn: 'In Past Perfect, which helping verb is used for ALL subjects?',
      questionHi: 'Past Perfect में सभी Subjects के साथ कौन सी helping verb लगती है?',
      options: ['has', 'have', 'had', 'was/were'],
      correctIndex: 2,
      explanation: 'Past Perfect: Subject (Singular या Plural) + had + V3. "had" सभी के साथ।',
    ),
    QuizQuestion(
      questionEn: '"Ram had gone for a walk." — Hindi?',
      questionHi: '"Ram had gone for a walk."',
      options: ['राम घूमने जाता है।', 'राम घूमने जा रहा है।', 'राम घूमने जा चुका था।', 'राम घूमने जायेगा।'],
      correctIndex: 2,
      explanation: '"had + V3" = Past Perfect = चुका था। "Ram had gone" = "राम घूम चुका था।"',
    ),
    QuizQuestion(
      questionEn: '"Had Ram not gone for a walk?" — Sentence type?',
      questionHi: '"क्या राम घूमने नहीं गया था?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Had + subject + not + V3?" = Negative Interrogative.',
    ),
    QuizQuestion(
      questionEn: '"Students hadn\'t done the homework." — Hindi?',
      questionHi: '"Students hadn\'t done the homework."',
      options: ['बच्चों ने होमवर्क किया था।', 'बच्चों ने होमवर्क नहीं किया था।', 'क्या बच्चों ने होमवर्क किया था?', 'बच्चे होमवर्क कर रहे थे।'],
      correctIndex: 1,
      explanation: '"hadn\'t done" = had not + V3 = Negative Past Perfect = "नहीं किया था"।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 10 — Past Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> pastPerfectContinuousQuestions = [
    QuizQuestion(
      questionEn: 'Past Perfect Continuous Affirmative rule is ___.',
      questionHi: 'Past Perfect Continuous Affirmative का rule?',
      options: [
        'Subject + was/were + V+ing + since/for',
        'Subject + had + V3 + since/for',
        'Subject + had been + V+ing + since/for',
        'Subject + have been + V+ing + since/for',
      ],
      correctIndex: 2,
      explanation: 'Past Perfect Continuous: Subject + had been + V+ing + object + since/for + time. "had been" all subjects के साथ।',
    ),
    QuizQuestion(
      questionEn: '"Ram had been walking for 2 hours." — Hindi?',
      questionHi: '"Ram had been walking for 2 hours."',
      options: ['राम 2 घंटे से घूम रहा है।', 'राम 2 घंटे से घूम रहा था।', 'राम 2 घंटे से घूम चुका था।', 'राम 2 घंटे घूमेगा।'],
      correctIndex: 1,
      explanation: '"had been + V+ing" = Past Perfect Continuous = रहा था + time। "for 2 hours" = 2 घंटे से।',
    ),
    QuizQuestion(
      questionEn: '"Since when had he been waiting for me?" — Hindi?',
      questionHi: '"वो कब से मेरा इन्तजार कर रहा था?"',
      options: [
        'वो मेरा इन्तजार कर रहा था।',
        'वो कब से मेरा इन्तजार कर रहा था?',
        'क्या वो मेरा इन्तजार कर रहा था?',
        'वो मेरा इन्तजार नहीं कर रहा था।',
      ],
      correctIndex: 1,
      explanation: '"Since when + had + subject + been + V+ing?" = WH Interrogative Past Perfect Continuous.',
    ),
    QuizQuestion(
      questionEn: '"Had he not been studying since 4 o\'clock?" — Sentence type?',
      questionHi: '"क्या वह 4 बजे से नहीं पढ़ रहा था?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Had + subject + not + been + V+ing?" = Negative Interrogative Past Perfect Continuous.',
    ),
    QuizQuestion(
      questionEn: 'The key difference between Past Continuous and Past Perfect Continuous is ___.',
      questionHi: 'Past Continuous और Past Perfect Continuous में मुख्य फर्क?',
      options: [
        'No difference',
        'Past Perfect Continuous also mentions since/for (time duration)',
        'Past Perfect Continuous uses was/were',
        'Past Continuous uses had been',
      ],
      correctIndex: 1,
      explanation: 'Past Continuous = रहा था (no time). Past Perfect Continuous = रहा था + since/for + time (समय भी बताया जाता है)।',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 11 — Future Indefinite Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> futureIndefiniteQuestions = [
    QuizQuestion(
      questionEn: 'Future Indefinite sentences end with ___.',
      questionHi: 'Future Indefinite वाक्यों के अंत में क्या होता है?',
      options: ['था, थे, थी', 'रहा है, रही है', 'गा, गे, गी', 'चुका है, चुकी है'],
      correctIndex: 2,
      explanation: 'Future Indefinite की पहचान: गा / गे / गी। Rule: Subject + will + V1 + Object.',
    ),
    QuizQuestion(
      questionEn: 'In Future Indefinite, which helping verb is used for ALL subjects?',
      questionHi: 'Future Indefinite में सभी Subjects के साथ कौन सी helping verb?',
      options: ['shall', 'will', 'would', 'shall/will both'],
      correctIndex: 1,
      explanation: '"Will" सभी Subjects के साथ (Singular और Plural)। "Shall" अब rarely used है।',
    ),
    QuizQuestion(
      questionEn: '"Ram will meet you." — Hindi?',
      questionHi: '"Ram will meet you."',
      options: ['राम तुमसे मिला।', 'राम तुमसे मिल रहा है।', 'राम तुमसे मिलेगा।', 'राम तुमसे नहीं मिलेगा।'],
      correctIndex: 2,
      explanation: '"will + V1" = Future Indefinite = गा/गे/गी। "Ram will meet you." = "राम तुमसे मिलेगा।"',
    ),
    QuizQuestion(
      questionEn: '"When will Ram meet you?" — Sentence type?',
      questionHi: '"राम तुमसे कब मिलेगा?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: '"When + will + subject + V1?" = WH Interrogative Future Indefinite.',
    ),
    QuizQuestion(
      questionEn: '"Will people not go for a walk?" — Hindi?',
      questionHi: '"Will people not go for a walk?"',
      options: ['लोग घूमने गये।', 'लोग घूमने जायेंगे।', 'क्या लोग घूमने नहीं जायेंगे?', 'लोग घूमने नहीं जायेंगे।'],
      correctIndex: 2,
      explanation: '"Will + subject + not + V1?" = Negative Interrogative = "क्या लोग घूमने नहीं जायेंगे?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Present Perfect
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> ppAffExamples = [
    {'hindi': 'राम स्कूल जा चुका है।',             'english': 'Ram has gone to school.',           'reason': 'Ram = 3rd Person Singular → has'},
    {'hindi': 'मैं काम कर चुका हूँ।',              'english': 'I have done the work.',             'reason': 'I = 1st Person Singular → have'},
    {'hindi': 'हमने तुम्हें देख लिया है।',          'english': 'We have seen you.',                 'reason': 'We = 1st Person Plural → have'},
    {'hindi': 'मैंने उसे एक किताब दी है।',          'english': 'I have given him a book.',          'reason': 'I = 1st Person Singular → have'},
    {'hindi': 'उन बच्चों ने राम से पैसे लिये हैं।', 'english': 'Those children have taken money from Ram.', 'reason': 'Those children = 3rd Person Plural → have'},
    {'hindi': 'उस लड़की ने स्कूटी खरीदी है।',       'english': 'That girl has purchased a scooty.', 'reason': 'That girl = 3rd Person Singular → has'},
  ];

  static const List<Map<String, String>> ppNegExamples = [
    {'hindi': 'हमने तुम्हें नहीं देखा है।',          'english': 'We have not seen you.'},
    {'hindi': 'मैंने उसे कोई किताब नहीं दी है।',    'english': "I haven't given him any book."},
    {'hindi': 'अरनवी ने पैसे नहीं लिये हैं।',        'english': 'Arnavi has not taken the money.'},
  ];

  static const List<Map<String, String>> ppInterExamples = [
    {'hindi': 'क्या राम घूमने गया है?',        'english': 'Has Ram gone for a walk?'},
    {'hindi': 'अमन ने किताब क्यों ली है?',     'english': 'Why has Aman taken the book?'},
    {'hindi': 'वे दोनों कहाँ गये हैं?',        'english': 'Where have they both gone?'},
  ];

  static const List<Map<String, String>> ppNegInterExamples = [
    {'hindi': 'मैंने क्या किया है?',                         'english': 'What have I done?'},
    {'hindi': 'क्या तुमने आज खाना नहीं बनाया है?',           'english': 'Have you not cooked the food today?'},
    {'hindi': 'अमन ने अब तक किताब क्यों नहीं खरीदी है?',    'english': 'Why has Aman not purchased the book yet?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Present Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> sinceExamples = [
    {'example': 'Since 2 AM / 2 PM / 3 o\'clock', 'hindi': 'रात 2 / दोपहर 2 / 3 बजे से'},
    {'example': 'Since 1998 / 2005 / 2012', 'hindi': '1998 / 2005 / 2012 से'},
    {'example': 'Since Monday / Tuesday / Sunday', 'hindi': 'सोमवार / मंगलवार / रविवार से'},
    {'example': 'Since morning / evening / night', 'hindi': 'सुबह / शाम / रात से'},
    {'example': 'Since yesterday / day before yesterday', 'hindi': 'कल / परसों से'},
    {'example': 'Since childhood / birth', 'hindi': 'बचपन / जन्म से'},
    {'example': 'Since that day', 'hindi': 'उस दिन से'},
    {'example': 'Since my dad was born', 'hindi': 'मेरे पापा के जन्म से'},
  ];

  static const List<Map<String, String>> forExamples = [
    {'example': 'For 2 seconds / minutes / hours', 'hindi': '2 सेकंड / मिनट / घंटे से'},
    {'example': 'For 2 days / weeks / months / years', 'hindi': '2 दिन / हफ्ते / महीने / साल से'},
    {'example': 'For a long time', 'hindi': 'काफी देर से'},
    {'example': 'For a while', 'hindi': 'कुछ देर से'},
    {'example': 'For many days / hours / months', 'hindi': 'कई दिनों / घंटों / महीनों से'},
  ];

  static const List<Map<String, String>> ppcAffExamples = [
    {'hindi': 'राम 2 घंटे से घूम रहा है।',           'english': 'Ram has been walking for 2 hours.',         'reason': 'Ram = 3rd Person Singular → has been; 2 घंटे = duration → for'},
    {'hindi': 'वह 4 बजे से पढ़ रहा है।',              'english': 'He has been studying since 4 o\'clock.',    'reason': 'He = 3rd Person Singular → has been; 4 बजे = point of time → since'},
    {'hindi': 'मैं सुबह से गाने गा रहा हूँ।',          'english': 'I have been singing songs since morning.',  'reason': 'I = 1st Person Singular → have been; सुबह = point of time → since'},
    {'hindi': 'वो कल शाम से मुझसे लड़ रहा है।',       'english': 'He has been fighting with me since yesterday evening.', 'reason': 'He → has been; कल शाम = point of time → since'},
    {'hindi': 'बच्चे कई दिनों से ये नाटक देख रहे हैं।','english': 'Children have been watching this serial for many days.', 'reason': 'Children = Plural → have been; कई दिन = duration → for'},
  ];

  static const List<Map<String, String>> ppcNegExamples = [
    {'hindi': 'राम 2 घंटे से नहीं घूम रहा है।',       'english': 'Ram has not been walking for 2 hours.'},
    {'hindi': 'वह 4 बजे से नहीं पढ़ रहा है।',          'english': 'He has not been studying since 4 o\'clock.'},
    {'hindi': 'मैं सुबह से गाने नहीं गा रहा हूँ।',     'english': 'I have not been singing songs since morning.'},
  ];

  static const List<Map<String, String>> ppcInterExamples = [
    {'hindi': 'राम 2 घंटे से क्यों घूम रहा है?',  'english': 'Why has Ram been walking for 2 hours?'},
    {'hindi': 'मैं कब से गाने गा रहा हूँ?',        'english': 'Since when have I been singing songs?'},
  ];

  static const List<Map<String, String>> ppcNegInterExamples = [
    {'hindi': 'वो सुबह से क्यों नहीं पढ़ रहा है?',  'english': 'Why has he not been studying since morning?'},
    {'hindi': 'क्या वह 4 बजे से नहीं पढ़ रहा है?',  'english': 'Has he not been studying since 4 o\'clock?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Past Indefinite
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> piPastAffExamples = [
    {'hindi': 'राम घूमने गया।',          'english': 'Ram went for a walk.',     'comment': 'went = V2 of go'},
    {'hindi': 'उसने एक पत्र लिखा।',      'english': 'He wrote a letter.',       'comment': 'wrote = V2 of write'},
    {'hindi': 'मैंने उसे प्यार किया।',   'english': 'I loved him/her.',         'comment': 'loved = V2 of love'},
    {'hindi': 'उसने गलती की।',          'english': 'He/she made a mistake.',   'comment': 'made = V2 of make'},
    {'hindi': 'लोगों ने हमसे बात की।',   'english': 'People spoke with us.',    'comment': 'spoke = V2 of speak'},
    {'hindi': 'हमने किया।',             'english': 'We did.',                  'comment': 'did = V2 of do'},
    {'hindi': 'तुमने खाना खाया।',        'english': 'You ate the food.',        'comment': 'ate = V2 of eat'},
  ];

  static const List<Map<String, String>> piPastNegExamples = [
    {'hindi': 'राम घूमने नहीं गया।',        'english': 'Ram did not go for a walk.'},
    {'hindi': 'उसने एक पत्र नहीं लिखा।',    'english': 'He did not write a letter.'},
    {'hindi': 'मैंने उसे प्यार नहीं किया।', 'english': 'I did not love him/her.'},
    {'hindi': 'लोग स्टेज पर नहीं गये।',     'english': 'People did not go on stage.'},
    {'hindi': 'उसने गलती नहीं की।',         'english': 'He/she did not make a mistake.'},
  ];

  static const List<Map<String, String>> piPastInterExamples = [
    {'hindi': 'क्या राम घूमने गया?',   'english': 'Did Ram go for a walk?'},
    {'hindi': 'उसने पत्र क्यों लिखा?', 'english': 'Why did he write the letter?'},
    {'hindi': 'हमने गलती कब की?',      'english': 'When did we make a mistake?'},
  ];

  static const List<Map<String, String>> piPastNegInterExamples = [
    {'hindi': 'क्या मैंने उसे प्यार नहीं किया?',      'english': 'Did I not love her?'},
    {'hindi': 'लोग स्टेज पर कब तक नहीं आये?',        'english': 'Until when did people not come on stage?'},
    {'hindi': 'उसने ऐसा क्यों नहीं किया?',            'english': 'Why did he not do so?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Past Continuous
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> pcPastAffExamples = [
    {'hindi': 'मैं घूमने जा रहा था।',       'english': 'I was going for a walk.',         'reason': 'I = Singular → was'},
    {'hindi': 'लोग स्टेज पर नाच रहे थे।',   'english': 'People were dancing on the stage.','reason': 'People = Plural → were'},
    {'hindi': 'वह पत्र लिख रही थी।',        'english': 'She was writing a letter.',        'reason': 'She = Singular → was'},
  ];

  static const List<Map<String, String>> pcPastNegExamples = [
    {'hindi': 'राम घूमने नहीं जा रहा था।',           'english': 'Ram was not going for a walk.'},
    {'hindi': 'वह तुम्हारे बारे में नहीं सोच रहा था।','english': 'He was not thinking about you.'},
  ];

  static const List<Map<String, String>> pcPastInterExamples = [
    {'hindi': 'राम कहाँ जा रहा था?',          'english': 'Where was Ram going?'},
    {'hindi': 'वह क्या कर रही थी?',           'english': 'What was she doing?'},
    {'hindi': 'क्या लोग स्टेज पर नाच रहे थे?','english': 'Were People dancing on the stage?'},
  ];

  static const List<Map<String, String>> pcPastNegInterExamples = [
    {'hindi': 'मम्मी क्यों नहीं डाँट रही थी?', 'english': 'Why was Mom not scolding?'},
    {'hindi': 'क्या वह घूमने नहीं जा रहा था?', 'english': 'Was he not going for a walk?'},
    {'hindi': 'क्या यशी नहीं लिख रही थी?',     'english': 'Was Yashi not writing?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Past Perfect
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> ppPastAffExamples = [
    {'hindi': 'राम घूमने जा चुका था।',    'english': 'Ram had gone for a walk.'},
    {'hindi': 'मैं घूमने गया था।',         'english': 'I had gone for a walk.'},
    {'hindi': 'लोग स्टेज पर नाचे थे।',    'english': 'People had danced on the stage.'},
  ];

  static const List<Map<String, String>> ppPastNegExamples = [
    {'hindi': 'अभिषेक स्कूल नहीं गया था।',        'english': 'Abhishek had not gone to school.'},
    {'hindi': 'मैंने तुम्हें नहीं देखा था।',        'english': 'I had not seen you.'},
    {'hindi': 'बच्चों ने होमवर्क नहीं किया था।',   'english': "Students hadn't done the homework."},
  ];

  static const List<Map<String, String>> ppPastInterExamples = [
    {'hindi': 'क्या राम जा चुका था?',             'english': 'Had Ram left?'},
    {'hindi': 'उसने पत्र क्यों लिखा था?',          'english': 'Why had she written a letter?'},
    {'hindi': 'मैंने काम किसके लिए किया था?',      'english': 'For whom had I done the work?'},
  ];

  static const List<Map<String, String>> ppPastNegInterExamples = [
    {'hindi': 'क्या राम घूमने नहीं गया था?',        'english': 'Had Ram not gone for a walk?'},
    {'hindi': 'क्या लोग स्टेज पर नहीं नाचे थे?',   'english': 'Had people not danced on the stage?'},
    {'hindi': 'उसने पत्र कब तक नहीं लिखा था?',     'english': 'Until when had she not written the letter?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Past Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> ppcPastAffExamples = [
    {'hindi': 'राम 2 घंटे से घूम रहा था।',        'english': 'Ram had been walking for 2 hours.'},
    {'hindi': 'वह 4 बजे से पढ़ रहा था।',           'english': 'He had been studying since 4 o\'clock.'},
    {'hindi': 'मैं सुबह से गाना गा रहा था।',       'english': 'I had been singing a song since morning.'},
  ];

  static const List<Map<String, String>> ppcPastNegExamples = [
    {'hindi': 'राम 2 घंटे से नहीं घूम रहा था।',    'english': 'Ram had not been walking for 2 hours.'},
    {'hindi': 'वह 4 बजे से पढ़ नहीं रहा था।',       'english': 'He had not been studying since 4 o\'clock.'},
    {'hindi': 'मैं सुबह से गाने नहीं गा रहा था।',   'english': 'I had not been singing songs since morning.'},
  ];

  static const List<Map<String, String>> ppcPastInterExamples = [
    {'hindi': 'क्या वह सुबह से पढ़ रहा था?',         'english': 'Had he been studying since morning?'},
    {'hindi': 'वो कब से मेरा इन्तजार कर रहा था?',    'english': 'Since when had he been waiting for me?'},
  ];

  static const List<Map<String, String>> ppcPastNegInterExamples = [
    {'hindi': 'क्या वह 4 बजे से पढ़ नहीं रहा था?',          'english': 'Had he not been studying since 4 o\'clock?'},
    {'hindi': 'क्या वो पढ़ नहीं रहा था जब से पापा गये?',     'english': 'Had he not been studying since dad left?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA — Future Indefinite
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> fiAffExamples = [
    {'hindi': 'राम तुमसे मिलेगा।',        'english': 'Ram will meet you.'},
    {'hindi': 'लोग घूमने जायेंगे।',        'english': 'People will go for a walk.'},
    {'hindi': 'वह तुम्हें कॉल करेगी।',    'english': 'She will call you.'},
  ];

  static const List<Map<String, String>> fiNegExamples = [
    {'hindi': 'राम तुमसे नहीं मिलेगा।',      'english': 'Ram will not meet you.'},
    {'hindi': 'लोग घूमने नहीं जायेंगे।',      'english': 'People will not go for a walk.'},
    {'hindi': 'वह तुम्हें कॉल नहीं करेगी।',  'english': 'She will not call you.'},
  ];

  static const List<Map<String, String>> fiInterExamples = [
    {'hindi': 'राम तुमसे कब मिलेगा?',       'english': 'When will Ram meet you?'},
    {'hindi': 'लोग कहाँ जायेंगे?',           'english': 'Where will people go?'},
    {'hindi': 'वह तुम्हें कॉल कैसे करेगी?', 'english': 'How will she call you?'},
  ];

  static const List<Map<String, String>> fiNegInterExamples = [
    {'hindi': 'राम तुमसे क्यों नहीं मिलेगा?',  'english': 'Why will Ram not meet you?'},
    {'hindi': 'क्या लोग घूमने नहीं जायेंगे?',  'english': 'Will people not go for a walk?'},
    {'hindi': 'क्या वह तुम्हें कॉल नहीं करेगी?','english': 'Will she not call you?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 12 — Future Continuous Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> futureContinuousQuestions = [
    QuizQuestion(
      questionEn: 'Future Continuous sentences end with ___.',
      questionHi: 'Future Continuous वाक्यों के अंत में क्या होता है?',
      options: ['गा, गे, गी', 'रहा है, रही है', 'रहा होगा, रही होगी, रहे होंगे', 'चुका होगा'],
      correctIndex: 2,
      explanation: 'Future Continuous की पहचान: रहा होगा / रही होगी / रहे होंगे। Rule: Subject + will be + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"Ram will be going for a walk." — Hindi?',
      questionHi: '"Ram will be going for a walk." — हिंदी में?',
      options: ['राम घूमने गया।', 'राम घूमने जायेगा।', 'राम घूमने जा रहा होगा।', 'राम घूम रहा है।'],
      correctIndex: 2,
      explanation: '"will be + V+ing" = Future Continuous = रहा होगा। "Ram will be going" = "राम घूमने जा रहा होगा।"',
    ),
    QuizQuestion(
      questionEn: 'In Future Continuous, which helping verb is used for ALL subjects?',
      questionHi: 'Future Continuous में सभी Subjects के साथ?',
      options: ['is/am/are', 'was/were', 'will be', 'will have been'],
      correctIndex: 2,
      explanation: '"will be" सभी Subjects के साथ (Singular और Plural)। Rule: Subject + will be + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"Will Ram not be going to market?" — Sentence type?',
      questionHi: '"क्या राम मार्केट नहीं जा रहा होगा?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Will + subject + not + be + V+ing?" = Negative Interrogative Future Continuous.',
    ),
    QuizQuestion(
      questionEn: '"Where will Ram be sleeping?" — Hindi?',
      questionHi: '"Where will Ram be sleeping?"',
      options: ['राम कहाँ सो रहा है?', 'राम कहाँ सोयेगा?', 'राम कहाँ सो रहा होगा?', 'राम कहाँ सो रहा था?'],
      correctIndex: 2,
      explanation: '"Where + will + subject + be + V+ing?" = WH Interrogative = "राम कहाँ सो रहा होगा?"',
    ),
  ];

  static const List<Map<String, String>> fcAffExamples = [
    {'hindi': 'राम घूमने जा रहा होगा।',           'english': 'Ram will be going for a walk.'},
    {'hindi': 'वह घूम रहा होगा।',                 'english': 'He will be walking.'},
    {'hindi': 'वह प्रतियोगिता में नाच रही होगी।', 'english': 'She will be dancing in the competition.'},
  ];

  static const List<Map<String, String>> fcNegExamples = [
    {'hindi': 'वो सो नहीं रहा होगा।',               'english': 'He will not be sleeping.'},
    {'hindi': 'वह इस वक्त नहीं खेल रही होगी।',      'english': 'She will not be playing at this moment.'},
  ];

  static const List<Map<String, String>> fcInterExamples = [
    {'hindi': 'राम कहाँ सो रहा होगा?',            'english': 'Where will Ram be sleeping?'},
    {'hindi': 'क्या वह घूम रहा होगा?',             'english': 'Will he be walking?'},
    {'hindi': 'वो कुत्ते को क्या खिला रही होगी?', 'english': 'What will she be feeding the dog?'},
  ];

  static const List<Map<String, String>> fcNegInterExamples = [
    {'hindi': 'क्या राम मार्केट नहीं जा रहा होगा?',   'english': 'Will Ram not be going to market?'},
    {'hindi': 'क्या बच्चे शोर नहीं मचा रहे होंगे?',   'english': 'Will children not be making a noise?'},
    {'hindi': 'क्या मैं सो नहीं रहा हूँगा उस वक्त?',  'english': 'Will I not be sleeping at that time?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 13 — Future Perfect Tense
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> futurePerfectQuestions = [
    QuizQuestion(
      questionEn: 'Future Perfect sentences end with ___.',
      questionHi: 'Future Perfect वाक्यों के अंत में क्या होता है?',
      options: ['गा, गे, गी', 'रहा होगा, रही होगी', 'चुका होगा, चुकी होगी, चुके होंगे, लिया होगा', 'था, थे, थी'],
      correctIndex: 2,
      explanation: 'Future Perfect की पहचान: चुका होगा / चुकी होगी / चुके होंगे / लिया होगा। Rule: Subject + will have + V3.',
    ),
    QuizQuestion(
      questionEn: '"Ram will have gone to market." — Hindi?',
      questionHi: '"Ram will have gone to market." — हिंदी में?',
      options: ['राम मार्केट जायेगा।', 'राम मार्केट गया।', 'राम मार्केट जा रहा होगा।', 'राम मार्केट जा चुका होगा।'],
      correctIndex: 3,
      explanation: '"will have + V3" = Future Perfect = चुका होगा। "Ram will have gone" = "राम मार्केट जा चुका होगा।"',
    ),
    QuizQuestion(
      questionEn: 'In Future Perfect, which helping verb is used for ALL subjects?',
      questionHi: 'Future Perfect में सभी Subjects के साथ?',
      options: ['has/have', 'had', 'will have', 'will have been'],
      correctIndex: 2,
      explanation: '"will have" सभी Subjects के साथ (Singular और Plural)। Rule: Subject + will have + V3.',
    ),
    QuizQuestion(
      questionEn: '"Why will Ram have gone to market?" — Sentence type?',
      questionHi: '"राम मार्केट क्यों गया होगा?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 2,
      explanation: '"Why + will + subject + have + V3?" = WH Interrogative Future Perfect.',
    ),
    QuizQuestion(
      questionEn: '"Will she not have danced in the competition?" — Hindi?',
      questionHi: '"Will she not have danced in the competition?"',
      options: [
        'वह प्रतियोगिता में नाची।',
        'क्या वह प्रतियोगिता में नहीं नाची होगी?',
        'वह प्रतियोगिता में नाच रही होगी।',
        'क्या वह प्रतियोगिता में नाची होगी?',
      ],
      correctIndex: 1,
      explanation: '"Will + subject + not + have + V3?" = Negative Interrogative = "क्या वह प्रतियोगिता में नहीं नाची होगी?"',
    ),
  ];

  static const List<Map<String, String>> fpAffExamples = [
    {'hindi': 'राम मार्केट जा चुका होगा।',         'english': 'Ram will have gone to market.'},
    {'hindi': 'मैं इस समय तक खेल चुका हूँगा।',     'english': 'I will have played by now.'},
    {'hindi': 'लोग स्टेज पर नाच चुके होंगे।',      'english': 'People will have danced on the stage.'},
    {'hindi': 'वह प्रतियोगिता जीत चुकी होगी।',     'english': 'She will have won the competition.'},
  ];

  static const List<Map<String, String>> fpNegExamples = [
    {'hindi': 'राम मार्केट नहीं गया होगा।',         'english': 'Ram will not have gone to market.'},
    {'hindi': 'उसने तुम्हें कल नहीं देखा होगा।',    'english': 'He will not have seen you yesterday.'},
    {'hindi': 'लोग कल्पना से नहीं मिले होंगे।',     'english': 'People will not have met Kalpana.'},
    {'hindi': 'वह वहाँ नहीं गयी होगी।',             'english': 'She will not have gone there.'},
  ];

  static const List<Map<String, String>> fpInterExamples = [
    {'hindi': 'राम मार्केट क्यों गया होगा?',        'english': 'Why will Ram have gone to market?'},
    {'hindi': 'क्या उसने तुम्हें कल देखा होगा?',    'english': 'Will he have seen you yesterday?'},
    {'hindi': 'लोग कल्पना से कब मिले होंगे?',       'english': 'When will people have met Kalpana?'},
    {'hindi': 'वह वहाँ कैसे गयी होगी?',             'english': 'How will she have gone there?'},
  ];

  static const List<Map<String, String>> fpNegInterExamples = [
    {'hindi': 'क्या राम घूमने नहीं गया होगा?',          'english': 'Will Ram not have gone for a walk?'},
    {'hindi': 'क्या उसने तुम्हें कल नहीं देखा होगा?',   'english': 'Will he not have seen you yesterday?'},
    {'hindi': 'लोग कल्पना से क्यों नहीं मिले होंगे?',   'english': 'Why will people not have met Kalpana?'},
    {'hindi': 'क्या वह प्रतियोगिता में नहीं नाची होगी?','english': 'Will she not have danced in the competition?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // LESSON 14 — Future Perfect Continuous
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> futurePerfectContinuousQuestions = [
    QuizQuestion(
      questionEn: 'Future Perfect Continuous Affirmative rule is ___.',
      questionHi: 'Future Perfect Continuous Affirmative का rule?',
      options: [
        'Subject + will be + V+ing + since/for',
        'Subject + will have + V3 + since/for',
        'Subject + will have been + V+ing + since/for',
        'Subject + had been + V+ing + since/for',
      ],
      correctIndex: 2,
      explanation: 'Future Perfect Continuous: Subject + will have been + V+ing + since/for + time. सभी Subjects के साथ "will have been"।',
    ),
    QuizQuestion(
      questionEn: '"Ram will have been playing for 2 hours." — Hindi?',
      questionHi: '"Ram will have been playing for 2 hours." — हिंदी में?',
      options: [
        'राम 2 घंटे से खेल रहा है।',
        'राम 2 घंटे से खेल रहा था।',
        'राम 2 घंटे से खेल रहा होगा।',
        'राम 2 घंटे से खेल चुका होगा।',
      ],
      correctIndex: 2,
      explanation: '"will have been + V+ing + for" = Future Perfect Continuous = रहा होगा + समय। "for 2 hours" = 2 घंटे से।',
    ),
    QuizQuestion(
      questionEn: '"He will have been studying since 4 o\'clock." — Why "since"?',
      questionHi: '"वह 4 बजे से पढ़ रहा होगा।" — "since" क्यों?',
      options: ['4 o\'clock is a duration', '4 o\'clock is a point of time → since', 'Always use since with future', 'for is correct here'],
      correctIndex: 1,
      explanation: '"4 o\'clock" = specific point of time → since. Duration जैसे "2 hours" → for.',
    ),
    QuizQuestion(
      questionEn: '"Will Ram not have been playing for 2 hours?" — Sentence type?',
      questionHi: '"क्या राम 2 घंटे से नहीं खेल रहा होगा?" — Sentence type?',
      options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'],
      correctIndex: 3,
      explanation: '"Will + subject + not + have been + V+ing?" = Negative Interrogative Future Perfect Continuous.',
    ),
    QuizQuestion(
      questionEn: 'The key difference between Future Continuous and Future Perfect Continuous is ___.',
      questionHi: 'Future Continuous और Future Perfect Continuous में मुख्य फर्क?',
      options: [
        'No difference',
        'Future Perfect Continuous also mentions since/for (time)',
        'Future Perfect Continuous uses will be',
        'Future Continuous uses will have been',
      ],
      correctIndex: 1,
      explanation: 'Future Continuous = रहा होगा (no time). Future Perfect Continuous = रहा होगा + since/for + time।',
    ),
  ];

  static const List<Map<String, String>> fpcAffExamples = [
    {'hindi': 'राम 2 घंटे से खेल रहा होगा।',  'english': 'Ram will have been playing for 2 hours.'},
    {'hindi': 'वह 4 बजे से पढ़ रहा होगा।',     'english': 'He will have been studying since 4 o\'clock.'},
  ];

  static const List<Map<String, String>> fpcNegExamples = [
    {'hindi': 'राम 2 घंटे से नहीं खेल रहा होगा।', 'english': 'Ram will not have been playing for 2 hours.'},
    {'hindi': 'वह 4 बजे से नहीं पढ़ रहा होगा।',    'english': 'He will not have been studying since 4 o\'clock.'},
  ];

  static const List<Map<String, String>> fpcInterExamples = [
    {'hindi': 'क्या राम 2 घंटे से खेल रहा होगा?',  'english': 'Will Ram have been playing for 2 hours?'},
    {'hindi': 'क्या वह 4 बजे से पढ़ रहा होगा?',     'english': 'Will he have been studying since 4 o\'clock?'},
  ];

  static const List<Map<String, String>> fpcNegInterExamples = [
    {'hindi': 'क्या राम 2 घंटे से नहीं खेल रहा होगा?', 'english': 'Will Ram not have been playing for 2 hours?'},
    {'hindi': 'क्या वह 4 बजे से नहीं पढ़ रहा होगा?',    'english': 'Will he not have been studying since 4 o\'clock?'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ — 15 questions covering all 12 tenses
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Total number of Tenses in English?',
      questionHi: 'English में कुल कितने Tenses होते हैं?',
      options: ['3', '4', '12', '9'],
      correctIndex: 2,
      explanation: '3 Tenses × 4 sub-types = 12 Tenses total.',
    ),
    QuizQuestion(
      questionEn: '"राम घूमने जाता है।" — Which Tense?',
      questionHi: '"राम घूमने जाता है।" — कौन सा Tense?',
      options: ['Present Continuous', 'Present Indefinite', 'Past Indefinite', 'Future Indefinite'],
      correctIndex: 1,
      explanation: 'ता/ते/ती ending = Present Indefinite. Rule: Subject + V1 + s/es.',
    ),
    QuizQuestion(
      questionEn: '"People are making fun of him." — Which Tense?',
      questionHi: '"लोग उसका मज़ाक उड़ा रहे हैं।" — कौन सा Tense?',
      options: ['Present Indefinite', 'Present Continuous', 'Past Continuous', 'Present Perfect'],
      correctIndex: 1,
      explanation: 'रहा है/रही है/रहे हैं = Present Continuous. Rule: Subject + is/am/are + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"Ram has gone to school." — Which Tense?',
      questionHi: '"राम स्कूल जा चुका है।" — कौन सा Tense?',
      options: ['Past Indefinite', 'Present Continuous', 'Present Perfect', 'Past Perfect'],
      correctIndex: 2,
      explanation: 'चुका है/चुकी है/लिया है = Present Perfect. Rule: Subject + has/have + V3.',
    ),
    QuizQuestion(
      questionEn: '"I have been studying for 2 hours." — Which Tense?',
      questionHi: '"मैं 2 घंटे से पढ़ रहा हूँ।" — कौन सा Tense?',
      options: ['Present Continuous', 'Present Perfect', 'Present Perfect Continuous', 'Past Perfect Continuous'],
      correctIndex: 2,
      explanation: 'रहा है + time (since/for) = Present Perfect Continuous. Rule: Subject + has/have been + V+ing + since/for.',
    ),
    QuizQuestion(
      questionEn: '"Ram went for a walk." — Which Tense?',
      questionHi: '"राम घूमने गया।" — कौन सा Tense?',
      options: ['Present Indefinite', 'Past Indefinite', 'Past Continuous', 'Past Perfect'],
      correctIndex: 1,
      explanation: 'गया/लिया/दिया (no था/है) = Past Indefinite. Rule: Subject + V2.',
    ),
    QuizQuestion(
      questionEn: '"She was writing a letter." — Which Tense?',
      questionHi: '"वह पत्र लिख रही थी।" — कौन सा Tense?',
      options: ['Past Indefinite', 'Past Perfect', 'Past Continuous', 'Present Continuous'],
      correctIndex: 2,
      explanation: 'रहा था/रही थी/रहे थे = Past Continuous. Rule: Subject + was/were + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"Ram had gone for a walk." — Which Tense?',
      questionHi: '"राम घूम चुका था।" — कौन सा Tense?',
      options: ['Past Indefinite', 'Past Continuous', 'Past Perfect', 'Past Perfect Continuous'],
      correctIndex: 2,
      explanation: 'चुका था/लिया था = Past Perfect. Rule: Subject + had + V3.',
    ),
    QuizQuestion(
      questionEn: '"He had been studying since 4 o\'clock." — Which Tense?',
      questionHi: '"वह 4 बजे से पढ़ रहा था।" — कौन सा Tense?',
      options: ['Past Continuous', 'Past Perfect', 'Past Perfect Continuous', 'Present Perfect Continuous'],
      correctIndex: 2,
      explanation: 'रहा था + time = Past Perfect Continuous. Rule: Subject + had been + V+ing + since/for.',
    ),
    QuizQuestion(
      questionEn: '"Ram will meet you." — Which Tense?',
      questionHi: '"राम तुमसे मिलेगा।" — कौन सा Tense?',
      options: ['Future Continuous', 'Future Indefinite', 'Future Perfect', 'Present Indefinite'],
      correctIndex: 1,
      explanation: 'गा/गे/गी = Future Indefinite. Rule: Subject + will + V1.',
    ),
    QuizQuestion(
      questionEn: '"She will be dancing in the competition." — Which Tense?',
      questionHi: '"वह प्रतियोगिता में नाच रही होगी।" — कौन सा Tense?',
      options: ['Future Indefinite', 'Future Continuous', 'Future Perfect', 'Present Continuous'],
      correctIndex: 1,
      explanation: 'रहा होगा/रही होगी = Future Continuous. Rule: Subject + will be + V+ing.',
    ),
    QuizQuestion(
      questionEn: '"She will have won the competition." — Which Tense?',
      questionHi: '"वह प्रतियोगिता जीत चुकी होगी।" — कौन सा Tense?',
      options: ['Future Continuous', 'Future Perfect', 'Future Perfect Continuous', 'Future Indefinite'],
      correctIndex: 1,
      explanation: 'चुका होगा/चुकी होगी = Future Perfect. Rule: Subject + will have + V3.',
    ),
    QuizQuestion(
      questionEn: '"Ram will have been playing for 2 hours." — Which Tense?',
      questionHi: '"राम 2 घंटे से खेल रहा होगा।" — कौन सा Tense?',
      options: ['Future Continuous', 'Future Perfect', 'Future Perfect Continuous', 'Present Perfect Continuous'],
      correctIndex: 2,
      explanation: 'रहा होगा + time = Future Perfect Continuous. Rule: Subject + will have been + V+ing + since/for.',
    ),
    QuizQuestion(
      questionEn: 'Which helping verb is used with "I" in Present Continuous?',
      questionHi: 'Present Continuous में "I" के साथ?',
      options: ['is', 'are', 'am', 'will be'],
      correctIndex: 2,
      explanation: '"I" = 1st Person Singular → always uses "am". I am + V+ing.',
    ),
    QuizQuestion(
      questionEn: 'Negative Past Indefinite rule is ___.',
      questionHi: 'Past Indefinite Negative का rule?',
      options: [
        'Subject + was/were + not + V+ing',
        'Subject + did not + V1',
        'Subject + had + not + V3',
        'Subject + did not + V2',
      ],
      correctIndex: 1,
      explanation: 'Past Indefinite Negative: Subject + did not + V1 (1st form). Note: V1 not V2 — did already shows past.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE EXERCISE QUIZ (5 from 190 sentences)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(
      questionEn: '"मैं नहीं गया।" — English?',
      questionHi: '"मैं नहीं गया।"',
      options: ["I don't go.", "I didn't go.", "I haven't gone.", "I wasn't going."],
      correctIndex: 1,
      explanation: 'गया = Past Indefinite. Negative → Subject + did not + V1. "I didn\'t go."',
    ),
    QuizQuestion(
      questionEn: '"बच्चे आ रहे होंगे।" — English?',
      questionHi: '"बच्चे आ रहे होंगे।"',
      options: ["Children are coming.", "Children were coming.", "Children will be coming.", "Children have been coming."],
      correctIndex: 2,
      explanation: 'रहे होंगे = Future Continuous. Rule: Subject + will be + V+ing. "Children will be coming."',
    ),
    QuizQuestion(
      questionEn: '"वो घर से नहीं आया है।" — English?',
      questionHi: '"वो घर से नहीं आया है।"',
      options: ["He didn't come from home.", "He has not come from home.", "He was not coming from home.", "He will not come from home."],
      correctIndex: 1,
      explanation: 'आया है = Present Perfect. Negative → has/have + not + V3. "He has not come from home."',
    ),
    QuizQuestion(
      questionEn: '"बस चली गई होगी।" — English?',
      questionHi: '"बस चली गई होगी।"',
      options: ["Bus left.", "Bus had left.", "Bus will have left.", "Bus is leaving."],
      correctIndex: 2,
      explanation: 'चली गई होगी = Future Perfect. Rule: Subject + will have + V3. "Bus will have left."',
    ),
    QuizQuestion(
      questionEn: '"ये साँप सदियों से अपनी साथी की तलाश कर रहा है।" — English?',
      questionHi: '"ये साँप सदियों से अपनी साथी की तलाश कर रहा है।"',
      options: [
        "This snake is searching his partner for centuries.",
        "This snake has been searching his partner for centuries.",
        "This snake was searching his partner for centuries.",
        "This snake had been searching his partner for centuries.",
      ],
      correctIndex: 1,
      explanation: 'रहा है + time (centuries) = Present Perfect Continuous. "has been searching... for centuries."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER I & II QUIZ (5 questions from both tests)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(
      questionEn: 'He has been in Delhi ___ a long.',
      questionHi: 'He has been in Delhi ___ a long.',
      options: ['since', 'for', 'from', 'by'],
      correctIndex: 1,
      explanation: '"For a long" = duration (अवधि) → use "for". Since = point of time.',
    ),
    QuizQuestion(
      questionEn: 'I never ___ a lie.',
      questionHi: 'I never ___ a lie.',
      options: ['tells', 'tell', 'told', 'telling'],
      correctIndex: 1,
      explanation: 'Subject "I" = 1st Person Singular → no s/es. "I never tell a lie."',
    ),
    QuizQuestion(
      questionEn: 'I (was/were) watching you. — Correct?',
      questionHi: '"I ___ watching you." — सही?',
      options: ['were', 'was', 'am', 'be'],
      correctIndex: 1,
      explanation: '"I" = Singular → was. "I was watching you." Past Continuous.',
    ),
    QuizQuestion(
      questionEn: '"तुमने मुझे कितना प्यार किया?" — English?',
      questionHi: '"तुमने मुझे कितना प्यार किया?"',
      options: ["How much do you love me?", "How much did you love me?", "How much have you loved me?", "How much will you love me?"],
      correctIndex: 1,
      explanation: 'किया = Past Indefinite. "How much did you love me?" — WH + did + subject + V1.',
    ),
    QuizQuestion(
      questionEn: '"राम कई दिनों से तुम्हारे यहाँ जा रहा था।" — English?',
      questionHi: '"राम कई दिनों से तुम्हारे यहाँ जा रहा था।"',
      options: [
        "Ram has been going to your place for many days.",
        "Ram was going to your place for many days.",
        "Ram had been going to your place for many days.",
        "Ram will be going to your place for many days.",
      ],
      correctIndex: 2,
      explanation: 'जा रहा था + time (many days) = Past Perfect Continuous. "Ram had been going... for many days."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER III & IV QUIZ (5 questions)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(
      questionEn: '"He is walking in the park for a long." — Correct it.',
      questionHi: '"He is walking in the park for a long." — सुधारें।',
      options: [
        "He was walking in the park for a long.",
        "He has been walking in the park for a long.",
        "He had walking in the park for a long.",
        "He will be walking in the park for a long.",
      ],
      correctIndex: 1,
      explanation: '"For a long" = duration + ongoing action since some time → Present Perfect Continuous. "He has been walking..."',
    ),
    QuizQuestion(
      questionEn: '"I didn\'t went there." — Correct it.',
      questionHi: '"I didn\'t went there." — सुधारें।',
      options: ["I didn't go there.", "I didn't gone there.", "I didn't going there.", "I didn't goes there."],
      correctIndex: 0,
      explanation: 'After "did not", always use V1 (base form). "I didn\'t go there." — went is V2, wrong after did not.',
    ),
    QuizQuestion(
      questionEn: '"Life teach us thousand things." — Correct it.',
      questionHi: '"Life teach us thousand things." — सुधारें।',
      options: ["Life teaches us thousand things.", "Life teaching us thousand things.", "Life taught us thousand things.", "Life is teach us thousand things."],
      correctIndex: 0,
      explanation: '"Life" = 3rd Person Singular → teach + es = "teaches". Present Indefinite rule.',
    ),
    QuizQuestion(
      questionEn: '"कई दिनों से मुझे तुम कुछ याद दिला रही हो।" — English?',
      questionHi: '"कई दिनों से मुझे तुम कुछ याद दिला रही हो।"',
      options: [
        "You are reminding me of something for many days.",
        "You have been reminding me of something for many days.",
        "You were reminding me of something for many days.",
        "You remind me of something for many days.",
      ],
      correctIndex: 1,
      explanation: 'रही हो + time (many days) = Present Perfect Continuous. "You have been reminding me... for many days."',
    ),
    QuizQuestion(
      questionEn: '"He was sweeting when he came to me." — Correct it.',
      questionHi: '"He was sweeting..." — सही शब्द?',
      options: ['sweeting', 'sweating', 'sweeing', 'sweting'],
      correctIndex: 1,
      explanation: 'पसीना आना = "sweat" → V+ing = "sweating". "He was sweating when he came to me."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE EXERCISE — 190 sentences (Hindi → English)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'मैं नहीं गया।', 'english': "I didn't go."},
    {'hindi': 'तुम कहाँ जाते हो?', 'english': 'Where do you go?'},
    {'hindi': 'हम किस तरह आयेंगे?', 'english': 'How will we come?'},
    {'hindi': 'मैं कब तक तुम्हारा साथ दूँगा?', 'english': 'Until when will I support you?'},
    {'hindi': 'रोहित की बहन कहाँ जा रही है?', 'english': "Where is Rohit's sister going?"},
    {'hindi': 'वो किस शहर से आया था?', 'english': 'From which city had he come?'},
    {'hindi': 'राम खेलता है।', 'english': 'Ram plays.'},
    {'hindi': 'वो लड़का ऐसा क्यों सोचता है?', 'english': 'Why does that boy think so?'},
    {'hindi': 'ये बच्चे कहाँ रहते हैं?', 'english': 'Where do these children live?'},
    {'hindi': 'लड़कियाँ कल से डाँस का अभ्यास कर रही हैं।', 'english': 'Girls have been practicing dance since yesterday.'},
    {'hindi': 'राकेश नहीं समझता।', 'english': "Rakesh doesn't understand."},
    {'hindi': 'घाव से खून निकल रहा है।', 'english': 'Blood is oozing from the wound.'},
    {'hindi': 'मैं पढ़ूँगा।', 'english': 'I will study.'},
    {'hindi': 'वो सभी किसके भाई हैं?', 'english': 'Whose brothers are they/those all?'},
    {'hindi': 'वो खिड़की से झाँक रहा था।', 'english': 'He was peeping through the window.'},
    {'hindi': 'बच्चे आ रहे होंगे।', 'english': 'Children will be coming.'},
    {'hindi': 'मैं शिमला अकसर जाता हूँ।', 'english': 'I often go to Shimla.'},
    {'hindi': 'वो खूब पढ़ता है।', 'english': 'He studies a lot.'},
    {'hindi': 'वो कभी-कभी मेरे घर आता है।', 'english': 'He sometimes comes my home.'},
    {'hindi': 'बस चली गई होगी।', 'english': 'Bus will have left.'},
    {'hindi': 'तुम कब तक यहाँ ठहरोगे?', 'english': 'Until when will you stay here?'},
    {'hindi': 'माँ अपने बच्चे को दूध पिला रही होगी।', 'english': 'Mother will be feeding her child.'},
    {'hindi': 'हम बहुत देर तक सोते हैं।', 'english': 'We sleep till late.'},
    {'hindi': 'वो घर से नहीं आया है।', 'english': 'He has not come from home.'},
    {'hindi': 'वो अपने सपनों को साकार करेगा।', 'english': 'He will fulfill his dreams.'},
    {'hindi': 'मैं किसके बारे में सोचता हूँ?', 'english': 'About whom do I think?'},
    {'hindi': 'मैं और तुम किसके साथ खेल रहे थे?', 'english': 'With whom were I & you playing?'},
    {'hindi': 'हम वहाँ गये थे।', 'english': 'We had gone there.'},
    {'hindi': 'मेरा दोस्त कौन सी कार चला रहा है?', 'english': 'Which car is my friend driving?'},
    {'hindi': 'उसने उस आदमी को जान से मार दिया।', 'english': 'He killed that man.'},
    {'hindi': 'राम ने लड़की का बलात्कार नहीं किया है।', 'english': 'Ram has not raped the girl.'},
    {'hindi': 'लड़के के परिवार वालों ने उस पर आरोप लगाया है।', 'english': "Boy's family has blamed him/her."},
    {'hindi': 'उस दिन मेरे साथ कई लोग फिल्म देख रहे थे।', 'english': 'Many people were watching the movie with me that day.'},
    {'hindi': 'हमने टीवी में किसकी लड़ाई देखी?', 'english': 'Whose fight did we watch on TV?'},
    {'hindi': 'हम राम को बिल्कुल नहीं जानते।', 'english': "We don't know Ram at all."},
    {'hindi': 'ये टूटा हुआ दिल कुछ कह रहा है।', 'english': 'This broken heart is saying something.'},
    {'hindi': 'क्या वो स्कूल से आ गया होगा?', 'english': 'Will he have come from school?'},
    {'hindi': 'तुम बहुत तेज़ दौड़ रहे थे।', 'english': 'You were running very fast.'},
    {'hindi': 'कौन जायेगा?', 'english': 'Who will go?'},
    {'hindi': 'किस हीरो का दोस्त तुम्हारे पापा के साथ जॉब करता है?', 'english': "Which actor's friend works with your dad?"},
    {'hindi': 'मैं अकसर उसके घर जाता हूँ।', 'english': 'I often go his home.'},
    {'hindi': 'सीमा आये दिन तुम्हें होमवर्क लिखने के लिए बुलाती है।', 'english': 'Seema often calls you to write homework.'},
    {'hindi': 'बच्चे सुबह से टी वी देख रहे हैं।', 'english': 'Kids have been watching TV since morning.'},
    {'hindi': 'उसे किस पार्टी का साथ नहीं मिल रहा है?', 'english': "Which party's support is he not getting?"},
    {'hindi': 'वो मोबाईल में क्या देख रहा है?', 'english': 'What is he watching in Mobile?'},
    {'hindi': 'मैं किस लड़की का भाई हूँ?', 'english': "Which girl's brother am I?"},
    {'hindi': 'उसके पापा ने मुझसे बात करना पसन्द क्यों नहीं किया?', 'english': 'Why did his father not like to talk to me?'},
    {'hindi': 'राम मुश्किल से ही कभी मेरे घर आता है।', 'english': 'Ram seldom comes my home.'},
    {'hindi': 'क्या ये बातें याद आयेंगी तुम्हें?', 'english': 'Will you remember these moments?'},
    {'hindi': 'हम सभी लोग उस नेता को पसन्द नहीं करते।', 'english': "We all people don't like that leader."},
    {'hindi': 'मेरे भाई ने किसी लड़की को परेशान नहीं किया।', "english": "My brother didn't bother any girl."},
    {'hindi': 'उसने देखने की कोशिश नहीं की।', 'english': "He didn't try to see."},
    {'hindi': 'वो अधिकतर सीता के साथ खेलता है।', 'english': 'He mostly plays with Seeta.'},
    {'hindi': 'उसने मेरे लिए कभी कुछ किया?', 'english': 'Did he ever do something for me?'},
    {'hindi': 'उसने कुछ नहीं किया।', 'english': 'He did nothing.'},
    {'hindi': 'हम तुम्हारे साथ घूमने जायेंगे।', 'english': 'We will go for a walk with you.'},
    {'hindi': 'राम उसे बहुत प्यार करता है।', 'english': 'Ram loves him/her a lot.'},
    {'hindi': 'तुमने मेरा दिल दुखाया है।', 'english': 'You have hurt me.'},
    {'hindi': 'आँखें धोखा देती हैं।', 'english': 'Eyes deceive.'},
    {'hindi': 'क्या तुमने सभी को खाना परोस दिया है?', 'english': 'Have you served the food to all?'},
    {'hindi': 'किसने तुम्हें देखा था?', 'english': 'Who had seen you?'},
    {'hindi': 'ये दिल कभी-कभी प्यार के लिए तड़पता है।', 'english': 'This heart sometimes craves for love.'},
    {'hindi': 'मैंने भगवान से कुछ माँगा है।', 'english': 'I have begged something from God.'},
    {'hindi': 'उसने गलती की है।', 'english': 'He has made a mistake.'},
    {'hindi': 'हमारी आँखें उसे देख रही थीं।', 'english': 'Our eyes were searching him.'},
    {'hindi': 'किसने तुम्हें चोट पहुँचाई?', 'english': 'Who hurt you?'},
    {'hindi': 'मैंने ऐसा कभी नहीं सोचा।', 'english': 'I never thought so.'},
    {'hindi': 'राम ने मुझे मेरी जीत पर बधाई दी है।', 'english': 'Ram has congratulated me on my win.'},
    {'hindi': 'दुकानदार ने मुझे लूट लिया।', 'english': 'Shopkeeper ripped me off.'},
    {'hindi': 'क्या तुम मुझे याद दिलाओगे?', 'english': 'Will you remind me?'},
    {'hindi': 'बुरे दौर में तुम्हारा साथ किसने दिया?', 'english': 'Who supported you in bad time?'},
    {'hindi': 'माँ बच्चों को जन्म देती है व बदले में कुछ नहीं माँगती।', 'english': 'Mother bears children and demands nothing in return.'},
    {'hindi': 'हम दो बजे पार्क में घूम रहे थे।', 'english': "We were walking in the park at 2 o'clock."},
    {'hindi': 'वो किसके लिए इतनी दूर गया?', 'english': 'For whom did he go this far?'},
    {'hindi': 'तुम्हारा चेहरा मुझे किसी की याद दिलाता है।', 'english': 'Your face reminds me of someone.'},
    {'hindi': 'ये कौन करता है?', 'english': 'Who does it?'},
    {'hindi': 'ये साँप सदियों से अपनी साथी की तलाश कर रहा है।', 'english': 'This snake has been searching his partner for centuries.'},
    {'hindi': 'उसने किताब ले ली थी।', 'english': 'He had taken the book.'},
    {'hindi': 'मैं पेन से लिखूँगा।', 'english': 'I will write with pen.'},
    {'hindi': 'क्या तुम रोज हनुमान जी की पूजा नहीं करती?', 'english': 'Do you not worship Lord Hanuman daily?'},
    {'hindi': 'वो घूमने गया था।', 'english': 'He had gone for a walk.'},
    {'hindi': 'ये काम किसने किया?', 'english': 'Who did this work?'},
    {'hindi': 'ये कहानियाँ मुझे पसन्द नहीं।', 'english': "I don't like these stories."},
    {'hindi': 'हमने गलती नहीं की।', 'english': "We didn't make a mistake."},
    {'hindi': 'राम मेरे बारे में कुछ न कुछ तो बताएगा।', 'english': 'Ram will tell at least something about me.'},
    {'hindi': 'वो दोनों हमें क्या सिखाएंगे?', 'english': 'What will they both teach us?'},
    {'hindi': 'तुम सभ्य लगते हो।', 'english': 'You look civilized.'},
    {'hindi': 'वो तुम्हारे घर पहले ही आ चुका है।', 'english': 'He has already come your home.'},
    {'hindi': 'मैं तुम्हें रोज देखने आया।', 'english': 'I came to see you daily.'},
    {'hindi': 'तुम अपनी गलती स्वीकार कर चुके हो।', 'english': 'You have accepted your fault.'},
    {'hindi': 'मैं तुमसे कभी नहीं मिला।', 'english': 'I never met you.'},
    {'hindi': 'मैं किसी तरह ऑफिस पहुँचा हूँ।', 'english': 'I have reached office somehow.'},
    {'hindi': 'क्या आप हमसे कुछ कह रहे हैं।', 'english': 'Are you saying something to us?'},
    {'hindi': 'वो तुम्हारे घर क्यों आता है?', 'english': 'Why does he come towards your home?'},
    {'hindi': 'मैं दीवार के पीछे छुप गया।', 'english': 'I hid behind the wall.'},
    {'hindi': 'मैं तुमसे मिलने को पागल हो रहा था।', 'english': 'I was craving to meet you.'},
    {'hindi': 'मैं जल्द ही ऑफिस पहुँच रहा हूँ।', 'english': 'I am reaching office soon.'},
    {'hindi': 'सीता ने कम्पनी छोड़ी और चली गयी।', 'english': 'Seeta left the company and went.'},
    {'hindi': 'तुम अच्छे लग रहे हो।', 'english': 'You are looking good.'},
    {'hindi': 'तुमने ऐसा क्यों सोचा?', 'english': 'Why did you think so?'},
    {'hindi': 'उसने गाना कहाँ गाया?', 'english': 'Where did he sing the song?'},
    {'hindi': 'प्रिया मेरे दिल को समझ रही थी।', 'english': 'Priya was understanding my feelings.'},
    {'hindi': 'मैंने सब कुछ समझ लिया था।', 'english': 'I had understood everything.'},
    {'hindi': 'लोग मिठाईयाँ खा चुके थे।', 'english': 'People had eaten the sweets.'},
    {'hindi': 'मुझे उसकी याद आ रही थी।', 'english': 'I was missing him/her.'},
    {'hindi': 'यह दो साल पहले कम्पनी छोड़ चुका है।', 'english': 'He has left the company 2 years ago.'},
    {'hindi': 'वो तुम्हें धमकी क्यों देता है?', 'english': 'Why does he threaten you?'},
    {'hindi': 'मैं ऑफिस के बाहर पहले ही अच्छी तरह देख चुका हूँ।', 'english': 'I have already seen properly outside the office.'},
    {'hindi': 'क्या आप हमसे सहमत हैं?', 'english': 'Do you agree with us?'},
    {'hindi': 'राम धोखा दे रहा है।', 'english': 'Ram is cheating.'},
    {'hindi': 'वो आदमी मुझसे नहीं मिलता है।', 'english': 'That man does not meet me.'},
    {'hindi': 'तोता छत पर रो रहा था।', 'english': 'Parrot was crying on the roof.'},
    {'hindi': 'वो तुम्हारा इन्तजार 2 बजे से कर रहा था।', "english": "He had been waiting for you since 2 o'clock."},
    {'hindi': 'मैं तुम्हारे बारे में कुछ नहीं सोच रहा हूँ।', 'english': 'I am not thinking anything about you.'},
    {'hindi': 'मैं तुमसे बात करूँगा।', 'english': 'I will talk to you.'},
    {'hindi': 'लोग मुझसे मिलने नहीं आयेंगे।', 'english': 'People will not come to meet me.'},
    {'hindi': 'राम कम्प्यूटर सीखता है।', 'english': 'Ram learns computer.'},
    {'hindi': 'मेरे बाल झड़ गए थे।', 'english': 'My hair had fallen.'},
    {'hindi': 'मैं अपने माता पिता को विदा कर चुका हूँ।', 'english': 'I have seen off my parents.'},
    {'hindi': '2 घण्टे हो गये, घाव से खून निकल रहा है।', 'english': 'Blood has been oozing from the wound for 2 hrs.'},
    {'hindi': 'मैं अपने माता पिता को भेज चुका था।', 'english': 'I had sent my parents.'},
    {'hindi': 'क्या आप 3 साल से काम कर रहे हैं?', 'english': 'Have you been working for 3 years?'},
    {'hindi': 'क्या आप सुबह से बैठे हैं?', 'english': 'Have you been sitting since morning?'},
    {'hindi': 'नल देखने में अच्छा लग रहा था।', 'english': 'Tap was looking good.'},
    {'hindi': 'वो तुम्हें धमकी क्यों दी थी?', 'english': 'Why had he threatened you?'},
    {'hindi': 'तुम मुझे सुबह से क्यों ढूँढ रहे हो?', 'english': 'Why have you been searching me since morning?'},
    {'hindi': 'राम ऑफिस कब जाता है।', 'english': 'When does Ram go to office?'},
    {'hindi': 'उसने मुझे अकेला छोड़ दिया है।', 'english': 'He has left me alone.'},
    {'hindi': 'तुम ऐसा क्यों सोचते हो?', 'english': 'Why do you think so?'},
    {'hindi': 'मैं आपके पास कब आया?', 'english': 'When did I come to you?'},
    {'hindi': 'मैं तुमसे कभी नहीं मिलूँगा।', 'english': 'I will never meet you.'},
    {'hindi': 'क्या तुमने खाना खाया?', 'english': 'Did you eat the food?'},
    {'hindi': 'सीता भगवान की पूजा कब से कर रही है?', 'english': 'Since when has Seeta been worshipping God?'},
    {'hindi': 'तुमने हाल ही में कौन सी फिल्म देखी है?', 'english': 'Which movie have you recently seen?'},
    {'hindi': 'मैं घूमने गया।', 'english': 'I went for a walk.'},
    {'hindi': 'मैं 2 घंटे से ठंड से काँप रहा हूँ।', 'english': 'I have been shivering with cold for 2 hours.'},
    {'hindi': 'वह दो साल पहले कम्पनी छोड़ चुका है।', 'english': 'He has left the company 2 years ago.'},
    {'hindi': 'तुमने मेरा मूड खराब किया।', 'english': 'You spoiled my mood.'},
    {'hindi': 'मैं 2008 से इस कम्पनी में काम रहा हूँ।', 'english': 'I have been working with this company since 2008.'},
    {'hindi': 'क्या सीता वहाँ बैठी?', 'english': 'Did Seeta sit there?'},
    {'hindi': 'वो गाना कहाँ गाता है?', 'english': 'Where does he sing the song?'},
    {'hindi': 'क्या तुम्हारे घर में खाना खा चुका है।', 'english': 'He has eaten the food at your home.'},
    {'hindi': 'जब मैं आऊँगा, तुम जा रहे होगे।', 'english': 'When I come, you will be going.'},
    {'hindi': 'उसने मुझे माफ किया।', 'english': 'He forgave me.'},
    {'hindi': 'मैं ऑफिस परिसर में सिगरेट नहीं पीता।', 'english': "I don't smoke in the office premises."},
    {'hindi': 'मैं अपनी गलती महसूस कर चुका हूँ।', 'english': 'I have realized my mistake.'},
    {'hindi': 'मैंने ये पहेली सुलझा दी।', 'english': 'I solved this puzzle.'},
    {'hindi': 'मैं कभी गाना नहीं गाता।', 'english': 'I never sing a song.'},
    {'hindi': 'मैं आपके पास कब आऊँगा?', 'english': 'When will I come to you?'},
    {'hindi': 'दूल्हा अच्छा लगता है।', 'english': 'Groom looks good.'},
    {'hindi': 'यह सुनने में अच्छा लगता है।', 'english': 'It sounds good.'},
    {'hindi': 'क्या सीता वहाँ बैठेगी?', 'english': 'Will Seeta sit there?'},
    {'hindi': 'सचिन ने पुराने सभी रिकार्ड्स तोड़े।', 'english': 'Sachin broke all the previous records.'},
    {'hindi': 'मैं आपका प्रस्ताव स्वीकार करता हूँ।', 'english': 'I accept your proposal.'},
    {'hindi': 'राम अगले महीने कम्प्यूटर सीखेगा।', 'english': 'Ram will learn computer next month.'},
    {'hindi': 'क्या सीता वहाँ बैठती है?', 'english': 'Does Seeta sit there?'},
    {'hindi': 'तुम ऐसा क्यों सोच रहे हो?', 'english': 'Why are you thinking so?'},
    {'hindi': 'तुम अच्छे लगते हो।', 'english': 'You look good.'},
    {'hindi': 'बच्चा छत पर रो रहा होगा।', 'english': 'Child will be weeping on the roof.'},
    {'hindi': 'मैं तुम्हारे बारे में क्या सोचता हूँ?', 'english': 'What do I think about you?'},
    {'hindi': 'राम और आदित्य किस ऑफिस से आ रहे हैं?', 'english': 'From which office are Ram & Aditya coming?'},
    {'hindi': 'क्या आप उनसे मिले हो?', 'english': 'Have you met them?'},
    {'hindi': 'मैंने तुम्हारे लिए प्रार्थना की थी।', 'english': 'I had prayed for you.'},
    {'hindi': 'राम अच्छी तरह से तैयारी कर चुका है।', 'english': 'Ram has prepared well.'},
    {'hindi': 'ये किसने किया?', 'english': 'Who did it?'},
    {'hindi': 'उसने अनजाने में मुझे दुख पहुँचाया।', 'english': 'He unknowingly hurt me.'},
    {'hindi': 'मैंने लोगों से पैसे इकट्ठे कर लिए हैं।', 'english': 'I have collected the money from people.'},
    {'hindi': 'मैं कसम खाता हूँ कि मैं वहाँ कभी नहीं जाऊँगा।', 'english': 'I swear that I will never go there again.'},
    {'hindi': 'तुम्हारी किताब किसने ली?', 'english': 'Who took your book?'},
    {'hindi': 'क्या हुआ?', 'english': 'What happened?'},
    {'hindi': 'तुम्हारे दिमाग को किसने परेशान किया?', 'english': 'What disturbed your mind?'},
    {'hindi': 'हम बेवजह एक दूसरे के साथ लड़ रहे थे।', 'english': 'We were unnecessarily fighting with each other.'},
    {'hindi': 'तुम क्या ढूँढ रहे हो?', 'english': 'What are you looking for?'},
    {'hindi': 'उन्होंने पूरे कमरे की सजावट बदल दी।', 'english': 'They changed the entire room decoration.'},
    {'hindi': 'मैंने उसकी आवाज पहचान ली।', 'english': 'I recognized his voice.'},
    {'hindi': 'उसने मुझे पूरी तरह से सहयोग का आश्वासन दिया।', 'english': 'He assured me of full cooperation.'},
    {'hindi': 'उसने बर्तन धो लिए हैं।', 'english': 'He has washed the utensils.'},
    {'hindi': 'उसने इतने सारे लोगों को कैसे सँभाला?', 'english': 'How did he handle these many people?'},
    {'hindi': 'जो कोई मेरे पास आया, मैंने मदद की।', 'english': 'Whoever came to me, I helped.'},
    {'hindi': 'खेल के दौरान, वो खोया खोया सा लगा।', 'english': 'During the game, he seemed to be lost.'},
    {'hindi': 'तुम कहीं खोये से लगते हो।', 'english': 'You seem to be lost somewhere.'},
    {'hindi': 'मैंने उसे उतना पैसा नहीं दिया।', 'english': "I didn't give him that much money."},
    {'hindi': 'हज़ारों लोग सड़क पर विद्रोह कर रहे हैं।', 'english': 'Thousands of people are protesting on roads.'},
    {'hindi': 'हस्त रेखा विज्ञान ने उसे पागल कर दिया है।', 'english': 'Palmistry has made him crazy.'},
    {'hindi': 'मेरा भाई किसी तरह घर पहुँचा।', 'english': 'My brother somehow reached home.'},
    {'hindi': 'मैं अपनी सफलता का श्रेय तुम्हें देता हूँ।', 'english': 'I ascribe my success to you.'},
    {'hindi': 'क्या तुममें से कोई पूजा करता है?', 'english': 'Does any of you worship?'},
    {'hindi': 'तुम इतनी सारी किताबें कैसे लाओगे?', 'english': 'How will you bring these many books?'},
    {'hindi': 'तुममें से कितने ताजमहल गये हो?', 'english': 'How many of you have visited the Taj?'},
    {'hindi': 'उसने षड़यंत्र का भांडा फोड़ दिया।', 'english': 'He unearthed the conspiracy.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER I — Q1 (English → Hindi translation) 20 sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaper1Q1 = [
    {'english': 'Do you really feel the pain of those who are poor and hungry?', 'hindi': 'क्या तुम वाकई उन लोगों का दर्द महसूस करते हो जो गरीब और भूखे हैं?'},
    {'english': 'Will he ever realize that he was in the wrong?', 'hindi': 'क्या वो कभी महसूस करेगा कि वो गलत था?'},
    {'english': 'Which one are you looking for at the moment?', 'hindi': 'इस समय तुम कौन सा वाला ढूँढ रहे हो?'},
    {'english': 'How many times have I told you not to disturb me?', 'hindi': 'मैंने तुम्हें कितनी बार कहा है कि मुझे परेशान मत किया करो?'},
    {'english': 'Why did you back out of your promise?', 'hindi': 'तुम अपने वादे से क्यों मुकरे?'},
    {'english': 'Sometimes, he takes things pretty lightly.', 'hindi': 'कभी-कभी वो चीजों को बहुत हल्के में लेता है।'},
    {'english': 'I will seldom go to the US because I feel myself an alien there.', 'hindi': 'मैं शायद ही कभी अमेरिका जाऊँगा क्योंकि मैं वहाँ अपने आप को अजनबी महसूस करता हूँ।'},
    {'english': 'Have you ever been in Agra?', 'hindi': 'क्या तुम कभी आगरा में रहे हो?'},
    {'english': "I don't know what to do.", 'hindi': 'मैं नहीं जानता कि क्या करूँ?'},
    {'english': 'He has not been working for money since beginning.', 'hindi': 'वो शुरू से ही पैसों के लिए काम नहीं कर रहा है।'},
    {'english': 'For how long have you been waiting for me in the airport?', 'hindi': 'तुम एअरपोर्ट पर मेरा इन्तजार कब से कर रहे हो?'},
    {'english': "It sounded good but I know it's not worthwhile.", 'hindi': 'सुनने में अच्छा लगा लेकिन मैं जानता हूँ कि ये फायदे का सौदा नहीं है।'},
    {'english': 'I will sue you in court.', 'hindi': 'मैं तुम्हें कोर्ट में घसीटूँगा।'},
    {'english': 'Prime Minister addressed the gathering.', 'hindi': 'प्रधानमंत्री ने भीड़ को सम्बोधित किया।'},
    {'english': 'Shyam unnecessarily elongates the matter.', 'hindi': 'श्याम फालतू में मामले को लम्बा कर देता है।'},
    {'english': 'Most of the People are traveling by metro these days.', 'hindi': 'इन दिनों अधिकतर लोग मैट्रो से यात्रा कर रहे हैं।'},
    {'english': 'He feeds his animals thrice a day.', 'hindi': 'वो अपने जानवरों को दिन में तीन बार खिलाता है।'},
    {'english': 'Are you feeling like going there?', 'hindi': 'क्या तुम्हारा वहाँ जाने का मन कर रहा है?'},
    {'english': 'These two are not looking to be twins as their faces are different altogether.', 'hindi': 'ये दोनों जुड़वा नहीं लग रहे हैं क्योंकि इनके चेहरे बिल्कुल अलग हैं।'},
    {'english': 'He is fighting for his self respect and dignity.', 'hindi': 'वो अपने आत्म सम्मान और प्रतिष्ठा के लिए लड़ रहा है।'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER I — Q2 (correct the alternative)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaper1Q2 = [
    {'question': 'He has been in delhi (since/for) a long.', 'answer': 'FOR', 'explanation': 'For = duration. Since = point of time.'},
    {'question': 'I never (tells/tell) a lie.', 'answer': 'TELL', 'explanation': 'Subject "I" = 1st Person → no s/es.'},
    {'question': 'He didn\'t go (somewhere/anywhere).', 'answer': 'ANYWHERE', 'explanation': 'Negative sentences → anywhere (not somewhere).'},
    {'question': 'Do you love (to watch/watching) TV?', 'answer': 'WATCHING', 'explanation': 'love + watching (gerund preferred).'},
    {'question': 'I like (to play/playing) cricket.', 'answer': 'PLAYING', 'explanation': 'like + playing (gerund preferred).'},
    {'question': 'He (founded/found) peace nowhere.', 'answer': 'FOUND', 'explanation': 'found = V2 of find. founded = established.'},
    {'question': 'I (was/were) watching you.', 'answer': 'WAS', 'explanation': 'I = Singular → was.'},
    {'question': 'Shalini (does/do) not go to parties.', 'answer': 'DOES', 'explanation': 'Shalini = 3rd Person Singular → does not.'},
    {'question': 'Rahul (looks/looked) tired that day.', 'answer': 'LOOKED', 'explanation': '"that day" = past → looked.'},
    {'question': '(Do/Does) you know how to speak in English?', 'answer': 'DO', 'explanation': '"You" → do (not does).'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER I — Q3 (Hindi → English)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaper1Q3 = [
    {'hindi': 'तुम वहाँ किस रास्ते से होते हुए जाते हो?', 'english': 'From which way do you go there?'},
    {'hindi': 'इतने सारे गिले शिकवे लेकर कहाँ जाओगे तुम?', 'english': 'Where will you go with these many differences?'},
    {'hindi': 'रहते कहाँ हो दोस्त? अकसर दिखते नहीं।', 'english': 'Where are you mate? Not seen very often.'},
    {'hindi': 'दवाई खाने के बाद अच्छा महसूस हो रहा है मुझे।', 'english': 'I am feeling good after having medicine.'},
    {'hindi': 'मैं काफी देर से उसे ढूँढ रहा था।', 'english': 'I had been searching him for a long.'},
    {'hindi': 'सरकार गरीबों के लिए सही मायनों में क्या कर रही है?', 'english': 'What is government ideally doing for the poor?'},
    {'hindi': 'सच कहूँ तो मुझे नहीं पता कि मैं आगे क्या करने वाला हूँ।', 'english': "To be honest I don't know what I am going to do further."},
    {'hindi': 'क्या वो मुझे जानता था?', 'english': 'Did he know me?'},
    {'hindi': 'मैंने उसे इतना प्यार किया जितना कोई उसे कभी नहीं करेगा।', 'english': 'I loved her so much that nobody will ever do.'},
    {'hindi': 'बातों से पेट नहीं भरता।', 'english': "Words can't feed. / Action is better than the words."},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER II — Q1 (Hindi → English) 35 sentences
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaper2Q1 = [
    {'hindi': 'तुमने मुझे कितना प्यार किया?', 'english': 'How much did you love me?'},
    {'hindi': 'मैं कैसे जानूँ कि तुम्हारे लिए मैं कौन था।', 'english': 'How do I know, who I was for you.'},
    {'hindi': 'जब मैं तुमसे मिलने आऊँगा, मुझे लगता है कि तुम सो रहे होगे।', 'english': 'When I come to meet you, I think you will be sleeping.'},
    {'hindi': 'तुम कल 6 बजे आना, तब तक तो मैं तुम्हारा काम कर चुका हूँगा।', 'english': "You come at 6 o'clock; I will have finished your work."},
    {'hindi': 'तुम्हें ऐसा क्यों लगता है कि मेरे पास बहुत पैसा है।', 'english': 'Why do you think that I have lots of money?'},
    {'hindi': 'जिन्दगी हमें बहुत कुछ सिखाती है।', 'english': 'Life teaches us a lot.'},
    {'hindi': 'आज हमारे पास कुछ नहीं है।', 'english': "We have nothing today."},
    {'hindi': 'तुम कब तक वहाँ रहोगे?', 'english': 'Until when will you be there?'},
    {'hindi': 'हम कहीं नहीं जा रहे थे।', 'english': 'We were not going anywhere.'},
    {'hindi': 'वो आदमी एक बच्चे को काफी देर से मार रहा है।', 'english': 'That man has been beating a kid for a long.'},
    {'hindi': 'राम कई दिनों से तुम्हारे यहाँ जा रहा था।', 'english': 'Ram had been going to your place for many days.'},
    {'hindi': 'मैं क्रिकेट खेलना कैसे सिखूँगा?', 'english': 'How will I learn to play cricket?'},
    {'hindi': 'वो बच्चे तुम्हारे घर कैसे आये?', 'english': 'How did those children come to your house?'},
    {'hindi': 'मैं सभी लोगों से मिल चुका हूँ।', 'english': 'I have met all the people.'},
    {'hindi': 'तुम्हारे सभी दोस्त मुझसे मिल चुके थे।', 'english': 'All of your friends had met me.'},
    {'hindi': 'तुम कब तक मेरे घर रुकोगे?', 'english': 'Until when will you stay at my home?'},
    {'hindi': 'राम कब से कम्प्यूटर पर बैठा हुआ है?', 'english': 'Since when has Ram been sitting on the computer?'},
    {'hindi': 'मैंने तुम्हारे बारे में बहुत कुछ सोचा।', 'english': 'I thought a lot about you.'},
    {'hindi': 'मुझे एक प्यारी सी घड़ी मिली है।', 'english': 'I have found a nice watch.'},
    {'hindi': 'तुम्हारे कितने भाई हैं?', 'english': 'How many brothers do you have?'},
    {'hindi': 'मेरे चारों भाई खाना खा चुके हैं।', 'english': 'All of my 4 brothers have eaten the food.'},
    {'hindi': 'मैंने सारे दिन गाडी चलाई।', 'english': 'I drove the car throughout the day.'},
    {'hindi': 'तुमने मुझे हर जगह ढूँढा।', 'english': 'You searched me everywhere.'},
    {'hindi': 'तुम मेरे पीछे क्यों छुप रहे हो?', 'english': 'Why are you hiding behind me?'},
    {'hindi': 'वो तुम्हारा क्या है?', 'english': 'What/Who is he to you?'},
    {'hindi': 'मैं मम्मी को कई दिनों से याद कर रहा था।', 'english': 'I had been missing mom for many days.'},
    {'hindi': 'तुम्हारा नाम मेरे दिल की धड़कनों पर लिखा है।', 'english': 'Your name is written on my heartbeats.'},
    {'hindi': 'तुमने हमेशा मुझे गलत समझा।', 'english': 'You always took me wrong.'},
    {'hindi': 'मैं तुमसे सच कह रहा हूँ।', 'english': 'I am telling you the truth.'},
    {'hindi': 'मुझे बिल्कुल नहीं पता कि तुम कौन हो?', 'english': "I really don't know who you are."},
    {'hindi': 'क्या तुमने कभी किताबें खरीदी?', 'english': 'Did you ever buy books?'},
    {'hindi': 'मुझे तुम्हारे बारे में सब कुछ पता है।', 'english': 'I know everything about you.'},
    {'hindi': 'राम ने सभी किताबें टेबल पर रखी।', 'english': 'Ram put all the books on the table.'},
    {'hindi': 'तुम क्यों सोच रहे हो कि मैं नहीं आऊँगा।', 'english': 'Why are you thinking that I will not come?'},
    {'hindi': 'तुम जब से आये हो, सिर्फ उसके बारे में बात कर रहे हो।', 'english': 'Ever since you have come, you are only talking about him/her.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST PAPER III — Q2 (correct the sentences)
  // ══════════════════════════════════════════════════════════════════════════
  static const List<Map<String, String>> testPaper3Q2 = [
    {'wrong': 'He is walking in the park for a long.', 'correct': 'He has been walking in the park for a long.', 'fix': 'is walking → has been walking'},
    {'wrong': 'My friend did not found peace anywhere.', 'correct': 'My friend did not find peace anywhere.', 'fix': 'found → find (V1 after did not)'},
    {'wrong': "I didn't went there.", 'correct': "I didn't go there.", 'fix': 'went → go (V1 after did not)'},
    {'wrong': 'Ram worked with me never.', 'correct': 'Ram never worked with me.', 'fix': 'Word order — never before verb'},
    {'wrong': 'Life teach us thousand things.', 'correct': 'Life teaches us thousand things.', 'fix': 'teach → teaches (3rd Person Singular)'},
    {'wrong': 'I looked at the calender for the dates.', 'correct': 'I looked at the calendar for the dates.', 'fix': 'calender → calendar (spelling)'},
    {'wrong': 'He is not walking because he is so week.', 'correct': 'He is not walking because he is so weak.', 'fix': 'week → weak (spelling)'},
    {'wrong': 'Have you seen my 3 story building?', 'correct': 'Have you seen my 3 storey building?', 'fix': 'story → storey (floor of building)'},
    {'wrong': 'He was sweeting when he came to me.', 'correct': 'He was sweating when he came to me.', 'fix': 'sweeting → sweating (spelling)'},
    {'wrong': 'There were 5 students. There parents had also come.', 'correct': 'There were 5 students. Their parents had also come.', 'fix': 'There → Their (possessive)'},
  ];

  /// Motivational quotes for practice/test lessons
  static const List<Map<String, String>> practiceMotivationalQuotes = [
    {'english': 'Every time you lose, you gain experience.', 'hindi': 'हर बार जब तुम हारते हो, तुम अनुभव प्राप्त करते हो।'},
    {'english': "Unless you try, you can't say whether you'll succeed or not. So go ahead and try your best.", 'hindi': 'जब तक कोशिश न करो, नहीं कह सकते कि सफल होगे या नहीं। तो आगे बढ़ो और पूरी कोशिश करो।'},
    {'english': 'Twenty years from now you will be more disappointed by the things that you didn\'t do than by the ones you did do.', 'hindi': 'बीस साल बाद तुम उन चीज़ों से ज़्यादा निराश होगे जो तुमने नहीं कीं, बजाय उनके जो तुमने कीं।'},
  ];
}