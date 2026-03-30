import '../models/lesson_model.dart';

/// Chapter 13 — Articles (A/An, The)
class Chapter13Data {

  static ChapterModel get chapter => ChapterModel(
        id: 13, title: 'Articles', titleHindi: 'आर्टिकल (A/An, The)',
        description: 'Definite & Indefinite Articles — A, An, The',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What are Articles?', titleHindi: 'Articles क्या हैं?',
              emoji: '📰', type: LessonType.ch13Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'A vs An — The Sound Rule', titleHindi: 'A vs An — ध्वनि का नियम',
              emoji: '🔤', type: LessonType.ch13AvsAn, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: '"The" — द vs दी', titleHindi: '"The" — कब "द" कब "दी"',
              emoji: '🔊', type: LessonType.ch13ThePronun, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Where to use "The"', titleHindi: '"The" कहाँ लगाएँ',
              emoji: '✅', type: LessonType.ch13TheUse, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Where NOT to use "The"', titleHindi: '"The" कहाँ न लगाएँ',
              emoji: '❌', type: LessonType.ch13TheNotUse, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़',
              emoji: '🏆', type: LessonType.ch13ChapterQuiz,
              status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch13Intro:       return introQuestions;
      case LessonType.ch13AvsAn:       return aVsAnQuestions;
      case LessonType.ch13ThePronun:   return thePronunQuestions;
      case LessonType.ch13TheUse:      return theUseQuestions;
      case LessonType.ch13TheNotUse:   return theNotUseQuestions;
      case LessonType.ch13ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ── L1 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(
      questionEn: 'How many Articles are there in English?',
      questionHi: 'अंग्रेज़ी में कितने Articles होते हैं?',
      options: ['1', '2', '3', '4'], correctIndex: 2,
      explanation: '3 Articles: A, An, और The।'),
    QuizQuestion(
      questionEn: 'Articles are classified as which Part of Speech?',
      questionHi: 'Articles किस Parts of Speech में आते हैं?',
      options: ['Noun', 'Verb', 'Adjective', 'Adverb'], correctIndex: 2,
      explanation: 'Articles (A, An, The) Adjectives होते हैं — ये Noun के बारे में अतिरिक्त सूचना देते हैं।'),
    QuizQuestion(
      questionEn: '"The" is a ___ Article.',
      questionHi: '"The" एक ___ Article है।',
      options: ['Indefinite', 'Definite', 'Plural', 'None'], correctIndex: 1,
      explanation: '"The" = Definite Article — किसी विशेष व्यक्ति/वस्तु के लिए।'),
    QuizQuestion(
      questionEn: '"A/An" is a ___ Article.',
      questionHi: '"A/An" एक ___ Article है।',
      options: ['Definite', 'Specific', 'Indefinite', 'Plural'], correctIndex: 2,
      explanation: '"A/An" = Indefinite Article — किसी अनजान/पहली बार उल्लेखित वस्तु के लिए।'),
    QuizQuestion(
      questionEn: '"Dad, a boy is at the door." — Why "a"?',
      questionHi: '"पापा, दरवाजे पर एक लड़का है।" — "A/एक" क्यों?',
      options: ['लड़का पहले से जाना-पहचाना है', 'पापा को उस लड़के के बारे में पहले से पता नहीं था', 'लड़का बहुत छोटा है', 'दरवाजा खुला था'],
      correctIndex: 1,
      explanation: 'जब किसी के बारे में पहली बार बात हो — Indefinite Article "A/An" प्रयोग होता है।'),
  ];

  // ── L2 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> aVsAnQuestions = [
    QuizQuestion(
      questionEn: 'Which article before "hour"?',
      questionHi: '"hour" से पहले कौन सा Article?',
      options: ['A hour', 'An hour', 'The hour', 'No article'], correctIndex: 1,
      explanation: '"Hour" की शुरुआत स्वर ध्वनि (अ/आवर) से होती है → "An hour"।'),
    QuizQuestion(
      questionEn: 'Which article before "university"?',
      questionHi: '"university" से पहले कौन सा Article?',
      options: ['An university', 'A university', 'The university', 'No article'], correctIndex: 1,
      explanation: '"University" की शुरुआत व्यंजन ध्वनि (य/यूनिवर्सिटी) से होती है → "A university"।'),
    QuizQuestion(
      questionEn: 'Which article before "honest"?',
      questionHi: '"honest" से पहले कौन सा Article?',
      options: ['A honest', 'An honest', 'The honest', 'No article'], correctIndex: 1,
      explanation: '"Honest" की शुरुआत स्वर ध्वनि (ऑ/ऑनैस्ट) से होती है → "An honest"।'),
    QuizQuestion(
      questionEn: 'Which article before "MLA"?',
      questionHi: '"MLA" से पहले कौन सा Article?',
      options: ['A MLA', 'An MLA', 'The MLA', 'No article'], correctIndex: 1,
      explanation: '"MLA" = एम एल ए — शुरुआत स्वर ध्वनि (ए) से होती है → "An MLA"।'),
    QuizQuestion(
      questionEn: 'Rule: "A" or "An" depends on ___.',
      questionHi: '"A" या "An" का प्रयोग किस पर निर्भर करता है?',
      options: ['अगले शब्द की Spelling पर', 'अगले शब्द की शुरुआत की ध्वनि (sound) पर', 'Noun के singular/plural पर', 'Sentence की length पर'],
      correctIndex: 1,
      explanation: 'A/An का चुनाव अगले शब्द की SOUND (ध्वनि) पर निर्भर है, Spelling पर नहीं।'),
  ];

  // ── L3 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> thePronunQuestions = [
    QuizQuestion(
      questionEn: '"The ear" is pronounced as ___.',
      questionHi: '"The ear" को कैसे बोलेंगे?',
      options: ['द इअर', 'दी इअर', 'ए इअर', 'एन इअर'], correctIndex: 1,
      explanation: '"Ear" स्वर ध्वनि (इ) से शुरू → "The" को "दी" बोलेंगे।'),
    QuizQuestion(
      questionEn: '"The university" is pronounced as ___.',
      questionHi: '"The university" को कैसे बोलेंगे?',
      options: ['दी युनिवर्सिटी', 'द युनिवर्सिटी', 'ए युनिवर्सिटी', 'एन युनिवर्सिटी'], correctIndex: 1,
      explanation: '"University" व्यंजन ध्वनि (य) से शुरू → "The" को "द" बोलेंगे।'),
    QuizQuestion(
      questionEn: '"The MLA" is pronounced as ___.',
      questionHi: '"The MLA" को कैसे बोलेंगे?',
      options: ['द एम एल ए', 'दी एम एल ए', 'ए एम एल ए', 'एन एम एल ए'], correctIndex: 1,
      explanation: '"MLA" = एम एल ए — स्वर ध्वनि (ए) से शुरू → "दी एम एल ए"।'),
    QuizQuestion(
      questionEn: '"The boy" is pronounced as ___.',
      questionHi: '"The boy" को कैसे बोलेंगे?',
      options: ['दी बॉय', 'द बॉय', 'ए बॉय', 'एन बॉय'], correctIndex: 1,
      explanation: '"Boy" व्यंजन ध्वनि (ब) से शुरू → "The" को "द" बोलेंगे।'),
    QuizQuestion(
      questionEn: 'When to pronounce "The" as "thee" (दी)?',
      questionHi: '"The" को "दी" कब बोलते हैं?',
      options: ['जब अगला शब्द व्यंजन से शुरू हो', 'जब अगला शब्द स्वर ध्वनि से शुरू हो', 'हमेशा', 'कभी नहीं'],
      correctIndex: 1,
      explanation: 'अगला शब्द vowel sound से शुरू हो → "The" को "दी" बोलते हैं।'),
  ];

  // ── L4 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> theUseQuestions = [
    QuizQuestion(
      questionEn: '"___ Sun rises in the east." — Fill in the blank.',
      questionHi: '"___ सूरज पूर्व में उगता है।" — रिक्त स्थान भरें।',
      options: ['A', 'An', 'The', 'No article'], correctIndex: 2,
      explanation: '"Sun" unique है (एक ही सूरज है) → "The Sun"।'),
    QuizQuestion(
      questionEn: '"He is ___ oldest in the family."',
      questionHi: '"वो परिवार में ___ सबसे बड़ा है।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 2,
      explanation: 'Superlative degree के साथ "The" लगाते हैं → "the oldest"।'),
    QuizQuestion(
      questionEn: '"___ rich should help the poor."',
      questionHi: '"___ अमीरों को गरीबों की मदद करनी चाहिए।"',
      options: ['A', 'An', 'The', 'No article'], correctIndex: 2,
      explanation: 'Adjective से पूरे group का बोध हो → "The rich", "The poor"।'),
    QuizQuestion(
      questionEn: '"I am reading ___ whole book."',
      questionHi: '"मैं ___ पूरी किताब पढ़ रहा हूँ।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 2,
      explanation: '"The" का प्रयोग "whole" से पहले होता है।'),
    QuizQuestion(
      questionEn: '"___ Taj Mahal is in Agra."',
      questionHi: '"___ ताज महल आगरा में है।"',
      options: ['A', 'An', 'The', 'No article'], correctIndex: 2,
      explanation: 'Famous buildings/monuments के साथ "The" लगाता है।'),
  ];

  // ── L5 Quiz ────────────────────────────────────────────────────────────────
  static const List<QuizQuestion> theNotUseQuestions = [
    QuizQuestion(
      questionEn: '"He is suffering from ___ fever."',
      questionHi: '"उसे ___ बुखार है।"',
      options: ['a', 'an', 'the', 'no article (कोई Article नहीं)'], correctIndex: 3,
      explanation: 'बीमारी के नाम से पहले "The" नहीं लगाते → "suffering from fever"।'),
    QuizQuestion(
      questionEn: '"I live in ___ India."',
      questionHi: '"मैं ___ भारत में रहता हूँ।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 3,
      explanation: 'Country के नाम से पहले "The" नहीं लगाते → "live in India"।'),
    QuizQuestion(
      questionEn: '"I speak ___ Hindi."',
      questionHi: '"मैं ___ हिंदी बोलता हूँ।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 3,
      explanation: 'Language के नाम से पहले "The" नहीं लगाते → "speak Hindi"।'),
    QuizQuestion(
      questionEn: '"I had ___ breakfast at 7."',
      questionHi: '"मैंने 7 बजे ___ नाश्ता किया।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 3,
      explanation: 'Breakfast/Lunch/Dinner से पहले "The" नहीं लगाते।'),
    QuizQuestion(
      questionEn: '"___ Ram is a good boy." — Which is correct?',
      questionHi: '"___ राम एक अच्छा लड़का है।" — कौन सा सही है?',
      options: ['The Ram', 'A Ram', 'An Ram', 'Ram (no article)'], correctIndex: 3,
      explanation: 'Proper Noun (व्यक्तिवाचक संज्ञा) से पहले "The" नहीं लगाते।'),
  ];

  // ── Chapter Final Quiz ─────────────────────────────────────────────────────
  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Articles are a type of ___.',
      questionHi: 'Articles किस Part of Speech के अंतर्गत आते हैं?',
      options: ['Noun', 'Verb', 'Adjective', 'Adverb'], correctIndex: 2,
      explanation: 'Articles = Adjectives क्योंकि ये Noun के बारे में जानकारी देते हैं।'),
    QuizQuestion(
      questionEn: '"A/An" depends on the ___ of the next word.',
      questionHi: '"A/An" का प्रयोग अगले शब्द की ___ पर निर्भर है।',
      options: ['Spelling', 'Length', 'Starting Sound (ध्वनि)', 'Meaning'], correctIndex: 2,
      explanation: 'Sound (ध्वनि) पर निर्भर है — spelling पर नहीं।'),
    QuizQuestion(
      questionEn: 'Which is correct?',
      questionHi: 'कौन सा सही है?',
      options: ['A hour', 'An hour', 'The hour', 'Hours'], correctIndex: 1,
      explanation: '"Hour" स्वर ध्वनि (आ) से शुरू → "An hour"।'),
    QuizQuestion(
      questionEn: 'Which is correct?',
      questionHi: 'कौन सा सही है?',
      options: ['An university', 'A university', 'The university', 'Universitys'], correctIndex: 1,
      explanation: '"University" व्यंजन ध्वनि (य) से शुरू → "A university"।'),
    QuizQuestion(
      questionEn: '"The ear" — how do you pronounce "the"?',
      questionHi: '"The ear" में "the" को कैसे बोलेंगे?',
      options: ['द', 'दी', 'ए', 'एन'], correctIndex: 1,
      explanation: '"Ear" स्वर ध्वनि से शुरू → "दी इअर"।'),
    QuizQuestion(
      questionEn: '"___ Sun is a star." Fill in.',
      questionHi: '"___ सूरज एक तारा है।"',
      options: ['A', 'An', 'The', 'No article'], correctIndex: 2,
      explanation: 'Unique objects → "The Sun"।'),
    QuizQuestion(
      questionEn: '"He is suffering from ___ malaria."',
      questionHi: '"उसे ___ मलेरिया है।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 3,
      explanation: 'Disease के नाम से पहले "The" नहीं।'),
    QuizQuestion(
      questionEn: '"I am reading ___ whole book."',
      questionHi: '"मैं ___ पूरी किताब पढ़ रहा हूँ।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 2,
      explanation: '"Whole" से पहले "the" लगाते हैं।'),
    QuizQuestion(
      questionEn: '"All ___ books are on the table."',
      questionHi: '"सभी ___ किताबें टेबल पर हैं।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 2,
      explanation: '"All" के बाद "the" लगाते हैं → "All the books"।'),
    QuizQuestion(
      questionEn: '"I speak ___ English."',
      questionHi: '"मैं ___ अंग्रेज़ी बोलता हूँ।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 3,
      explanation: 'Language के नाम से पहले "The" नहीं।'),
    QuizQuestion(
      questionEn: '"___ Nile is a famous river."',
      questionHi: '"___ नील एक प्रसिद्ध नदी है।"',
      options: ['A', 'An', 'The', 'No article'], correctIndex: 2,
      explanation: 'Rivers के नाम के साथ "The" लगाते हैं → "The Nile"।'),
    QuizQuestion(
      questionEn: '"He is ___ best player in the team."',
      questionHi: '"वो टीम का ___ सबसे अच्छा खिलाड़ी है।"',
      options: ['a', 'an', 'the', 'no article'], correctIndex: 2,
      explanation: 'Superlative degree के साथ "The" → "the best"।'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> articleTypes = [
    {'type': 'Indefinite Article', 'typeHi': 'अनिश्चित Article', 'articles': 'A / An',
     'use': 'किसी अनजान या पहली बार उल्लेखित व्यक्ति/वस्तु के लिए।',
     'useEn': 'Used when talking about an unknown or first-mentioned person/thing.',
     'example': 'A boy is at the door.', 'exampleHi': 'दरवाजे पर एक/कोई लड़का है।', 'emoji': '❓'},
    {'type': 'Definite Article', 'typeHi': 'निश्चित Article', 'articles': 'The',
     'use': 'किसी विशेष या पहले से ज्ञात व्यक्ति/वस्तु के लिए।',
     'useEn': 'Used when talking about a specific or already known person/thing.',
     'example': 'The boy is at the door.', 'exampleHi': 'वो लड़का दरवाजे पर है।', 'emoji': '👆'},
  ];

  static const List<Map<String, String>> aVsAnExamples = [
    {'word': 'A boy',        'sound': 'ब (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (ब)'},
    {'word': 'A pen',        'sound': 'प (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (प)'},
    {'word': 'A university', 'sound': 'य (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (य) — not (उ)'},
    {'word': 'A year',       'sound': 'य (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (य)'},
    {'word': 'A union',      'sound': 'य (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (य)'},
    {'word': 'A bucket',     'sound': 'ब (व्यंजन)',  'article': 'A',  'reason': 'Consonant sound (ब)'},
    {'word': 'An ear',       'sound': 'इ (स्वर)',    'article': 'An', 'reason': 'Vowel sound (इ)'},
    {'word': 'An honest',    'sound': 'ऑ (स्वर)',    'article': 'An', 'reason': 'Vowel sound (ऑ) — h is silent'},
    {'word': 'An hour',      'sound': 'आ (स्वर)',    'article': 'An', 'reason': 'Vowel sound (आ) — h is silent'},
    {'word': 'An MLA',       'sound': 'ए (स्वर)',    'article': 'An', 'reason': 'Vowel sound (ए) — reads as "em"'},
    {'word': 'An orange',    'sound': 'ऑ (स्वर)',    'article': 'An', 'reason': 'Vowel sound (ऑ)'},
  ];

  static const List<Map<String, String>> thePronunExamples = [
    {'word': 'the boy',        'sound': 'ब (व्यंजन)', 'pronun': 'द',  'example': 'द बॉय'},
    {'word': 'the pen',        'sound': 'प (व्यंजन)', 'pronun': 'द',  'example': 'द पैन'},
    {'word': 'the university', 'sound': 'य (व्यंजन)', 'pronun': 'द',  'example': 'द युनिवर्सिटी'},
    {'word': 'the year',       'sound': 'य (व्यंजन)', 'pronun': 'द',  'example': 'द यीयर'},
    {'word': 'the bucket',     'sound': 'ब (व्यंजन)', 'pronun': 'द',  'example': 'द बकैट'},
    {'word': 'the ear',        'sound': 'इ (स्वर)',   'pronun': 'दी', 'example': 'दी इअर'},
    {'word': 'the hour',       'sound': 'आ (स्वर)',   'pronun': 'दी', 'example': 'दी आवर'},
    {'word': 'the MLA',        'sound': 'ए (स्वर)',   'pronun': 'दी', 'example': 'दी एम एल ए'},
    {'word': 'the orange',     'sound': 'ऑ (स्वर)',   'pronun': 'दी', 'example': 'दी ऑरेन्ज'},
    {'word': 'the end',        'sound': 'ए (स्वर)',   'pronun': 'दी', 'example': 'दी एन्ड'},
  ];

  static const List<Map<String, String>> theUseRules = [
    {'rule': 'Unique objects', 'ruleHi': 'यूनीक वस्तुएँ — जो सिर्फ एक हैं', 'emoji': '☀️',
     'examples': 'The Sun, The Moon, The Earth, The Sky, The President, The CEO'},
    {'rule': 'Adjective for whole group', 'ruleHi': 'पूरे ग्रुप/जाति का बोध', 'emoji': '👥',
     'examples': 'The old, The young, The rich, The poor'},
    {'rule': 'Famous places & monuments', 'ruleHi': 'प्रसिद्ध भवन और स्मारक', 'emoji': '🏛️',
     'examples': 'The Taj Mahal, The Qutub Minar, The Eiffel Tower'},
    {'rule': 'Superlative degrees', 'ruleHi': 'Superlative degree के साथ', 'emoji': '🏆',
     'examples': 'The highest, The most, The youngest, The poorest'},
    {'rule': 'Ordinal numbers', 'ruleHi': 'क्रमवाचक संख्याओं से पहले', 'emoji': '1️⃣',
     'examples': 'The first time, The second chance, The last chapter'},
    {'rule': 'Countries with kingdom/states/republic', 'ruleHi': 'Kingdom/States/Republic वाले देश', 'emoji': '🌍',
     'examples': 'The United States, The United Kingdom, The Republic of Ireland'},
    {'rule': 'Rivers, canals & oceans', 'ruleHi': 'नदी, नहर और सागर', 'emoji': '🌊',
     'examples': 'The Ganga, The Nile, The Atlantic, The Pacific'},
    {'rule': 'Plural country names', 'ruleHi': 'बहुवचन देशों के नाम (अंत में S)', 'emoji': '🗺️',
     'examples': 'The Netherlands, The Philippines'},
    {'rule': 'Family names', 'ruleHi': 'परिवारों के नाम', 'emoji': '👨‍👩‍👧‍👦',
     'examples': 'The Ranas, The Khans, The Guptas, The Jacksons'},
    {'rule': '"Only" meaning "only one"', 'ruleHi': '"Only" का मतलब "इकलौता" हो तो', 'emoji': '☝️',
     'examples': 'The only son, The only friend, The only batsman'},
    {'rule': 'Before "whole" / After "all"', 'ruleHi': '"Whole" से पहले / "All" के बाद', 'emoji': '📚',
     'examples': 'The whole book, All the books, All the students'},
  ];

  static const List<Map<String, String>> theNotUseRules = [
    {'rule': 'Disease names', 'ruleHi': 'बीमारियों के नाम', 'emoji': '🤒',
     'wrong': 'He has the fever.', 'correct': 'He has fever.',
     'note': 'the ❌ before disease names'},
    {'rule': 'Country names', 'ruleHi': 'देशों के नाम', 'emoji': '🇮🇳',
     'wrong': 'I live in the India.', 'correct': 'I live in India.',
     'note': 'the ❌ before country names'},
    {'rule': 'Language names', 'ruleHi': 'भाषाओं के नाम', 'emoji': '🗣️',
     'wrong': 'I speak the Hindi.', 'correct': 'I speak Hindi.',
     'note': 'the ❌ before language names'},
    {'rule': 'Breakfast / Lunch / Dinner', 'ruleHi': 'नाश्ता / खाना / रात का खाना', 'emoji': '🍽️',
     'wrong': 'I had the breakfast.', 'correct': 'I had breakfast.',
     'note': 'the ❌ before meal names'},
    {'rule': 'Proper nouns', 'ruleHi': 'व्यक्तिवाचक संज्ञा — नाम', 'emoji': '👤',
     'wrong': 'The Ram / The Delhi / The Rahul', 'correct': 'Ram / Delhi / Rahul',
     'note': 'the ❌ before proper nouns'},
  ];
}