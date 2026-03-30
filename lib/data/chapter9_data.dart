import '../models/lesson_model.dart';

/// Chapter 9 — Adjective (विशेषण)
class Chapter9Data {

  static ChapterModel get chapter => ChapterModel(
        id: 9, title: 'Adjective', titleHindi: 'विशेषण',
        description: 'Degrees: Positive, Comparative & Superlative',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'What is an Adjective?', titleHindi: 'विशेषण क्या है?', emoji: '🎨', type: LessonType.ch9Intro, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Degrees of Adjectives', titleHindi: 'विशेषण की तीन अवस्थाएँ', emoji: '📊', type: LessonType.ch9Degrees, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: '-er / -est Adjectives', titleHindi: '-er / -est वाले विशेषण', emoji: '🔼', type: LessonType.ch9ErEst, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'More / Most Adjectives', titleHindi: 'More / Most वाले विशेषण', emoji: '⭐', type: LessonType.ch9MoreMost, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Irregular Adjectives', titleHindi: 'अनियमित विशेषण', emoji: '🔀', type: LessonType.ch9Irregular, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch9ChapterQuiz, status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch9Intro:        return introQuestions;
      case LessonType.ch9Degrees:      return degreesQuestions;
      case LessonType.ch9ErEst:        return erEstQuestions;
      case LessonType.ch9MoreMost:     return moreMotQuestions;
      case LessonType.ch9Irregular:    return irregularQuestions;
      case LessonType.ch9ChapterQuiz:  return chapterFinalQuestions;
      default:                         return [];
    }
  }

  static const List<QuizQuestion> introQuestions = [
    QuizQuestion(questionEn: 'What is an Adjective?', questionHi: 'Adjective (विशेषण) किसे कहते हैं?',
      options: ['Noun की जगह प्रयोग होने वाला शब्द','Noun/Pronoun की विशेषता बताने वाला शब्द','क्रिया बताने वाला शब्द','दो वाक्यों को जोड़ने वाला शब्द'], correctIndex: 1,
      explanation: 'Adjective = विशेषण — Noun या Pronoun की विशेषता बताने वाले शब्द।'),
    QuizQuestion(questionEn: '"Ram is brave." — "Brave" is an adjective because ___.', questionHi: '"Ram is brave." — "Brave" विशेषण है क्योंकि ___.',
      options: ['Ram एक Verb है','यह Ram (Noun) की विशेषता बताता है','यह एक Pronoun है','यह Subject है'], correctIndex: 1,
      explanation: '"Brave" Ram की विशेषता बताता है और Ram एक Noun है।'),
    QuizQuestion(questionEn: '"He was brave." — "Brave" describes ___.', questionHi: '"He was brave." — "Brave" ___ की विशेषता बताता है।',
      options: ['Noun की','Pronoun "He" की','Verb की','Sentence की'], correctIndex: 1,
      explanation: '"He" एक Pronoun है और "Brave" उसकी विशेषता बताता है।'),
    QuizQuestion(questionEn: '"I have some water." — "some" is adjective because ___.', questionHi: '"I have some water." — "some" विशेषण है क्योंकि ___.',
      options: ['यह एक Verb है','यह water (Noun) की मात्रा की अतिरिक्त सूचना देता है','यह Subject है','यह Pronoun है'], correctIndex: 1,
      explanation: '"Some" water की मात्रा के बारे में अतिरिक्त सूचना देता है।'),
    QuizQuestion(questionEn: '"Aman is my brother who plays with you." — Adjective clause is ___.', questionHi: 'Adjective clause कौन सा है?',
      options: ['Aman is my brother','who plays with you','my brother','plays with you'], correctIndex: 1,
      explanation: '"who plays with you" Aman (Noun) के बारे में अतिरिक्त सूचना देता है — Adjective Clause।'),
  ];

  static const List<QuizQuestion> degreesQuestions = [
    QuizQuestion(questionEn: 'How many degrees do adjectives generally have?', questionHi: 'Adjectives की सामान्यतः कितनी degrees होती हैं?',
      options: ['1','2','3','4'], correctIndex: 2, explanation: '3 degrees: Positive, Comparative और Superlative।'),
    QuizQuestion(questionEn: 'Positive degree is used when ___.', questionHi: 'Positive degree का प्रयोग कब होता है?',
      options: ['दो चीज़ों की तुलना','सबसे ज़्यादा बताना','सामान्य विशेषता बतानी हो — बिना तुलना के','कम बताना'],
      correctIndex: 2, explanation: 'Positive degree — सामान्य विशेषता बताती है, बिना किसी से तुलना किए।'),
    QuizQuestion(questionEn: 'Comparative degree is used when ___.', questionHi: 'Comparative degree का प्रयोग कब होता है?',
      options: ['सामान्य विशेषता','दो चीज़ों या व्यक्तियों की तुलना करनी हो','सबसे ज़्यादा बताना','Noun की विशेषता'],
      correctIndex: 1, explanation: 'Comparative degree — दो चीज़ों या व्यक्तियों की तुलना करते वक्त।'),
    QuizQuestion(questionEn: 'Superlative degree is used when ___.', questionHi: 'Superlative degree का प्रयोग कब होता है?',
      options: ['दो चीज़ों की तुलना','सामान्य विशेषता','तीन या अधिक में से सबसे ज़्यादा/कम बताना हो','अतिरिक्त सूचना'],
      correctIndex: 2, explanation: 'Superlative — तीन या अधिक में से सबसे ज़्यादा/कम बताती है।'),
    QuizQuestion(questionEn: '"I am taller than you." — which degree?', questionHi: '"I am taller than you." — कौन सी degree?',
      options: ['Positive','Comparative','Superlative','Irregular'], correctIndex: 1,
      explanation: '"Taller" Comparative degree है — दो व्यक्तियों की तुलना हो रही है।'),
  ];

  static const List<QuizQuestion> erEstQuestions = [
    QuizQuestion(questionEn: 'Comparative of "Tall" is ___.', questionHi: '"Tall" की Comparative degree क्या है?',
      options: ['Tallest','Most Tall','Taller','More Tall'], correctIndex: 2, explanation: 'Tall → Taller → Tallest।'),
    QuizQuestion(questionEn: 'Superlative of "Strong" is ___.', questionHi: '"Strong" की Superlative degree क्या है?',
      options: ['Stronger','Most Strong','More Strong','Strongest'], correctIndex: 3, explanation: 'Strong → Stronger → Strongest।'),
    QuizQuestion(questionEn: 'Comparative of "Hot" is ___.', questionHi: '"Hot" की Comparative degree क्या है?',
      options: ['Hoter','Hottest','Hotter','Most Hot'], correctIndex: 2, explanation: 'Short words: ending consonant doubles — Hotter, Hottest।'),
    QuizQuestion(questionEn: 'Superlative of "Heavy" is ___.', questionHi: '"Heavy" की Superlative degree क्या है?',
      options: ['Heavier','Most Heavy','Heavyest','Heaviest'], correctIndex: 3, explanation: 'Heavy → -y को -i से बदलें → Heavier, Heaviest।'),
    QuizQuestion(questionEn: '"Old" Comparative forms: ___.', questionHi: '"Old" के Comparative forms: ___.',
      options: ['Older और Eldest','Older / Elder','Elder और Eldest','Oldest और Eldest'], correctIndex: 1,
      explanation: 'Old → Older / Elder → Oldest / Eldest।'),
  ];

  static const List<QuizQuestion> moreMotQuestions = [
    QuizQuestion(questionEn: 'Comparative of "Beautiful" is ___.', questionHi: '"Beautiful" की Comparative degree क्या है?',
      options: ['Beautifuler','Beautifulest','More Beautiful','Most Beautiful'], correctIndex: 2,
      explanation: 'लम्बे adjectives में More/Most लगाते हैं: More Beautiful।'),
    QuizQuestion(questionEn: 'Superlative of "Dangerous" is ___.', questionHi: '"Dangerous" की Superlative degree क्या है?',
      options: ['Dangerouser','More Dangerous','Most Dangerous','Dangerousest'], correctIndex: 2,
      explanation: 'Dangerous → More Dangerous → Most Dangerous।'),
    QuizQuestion(questionEn: 'Comparative of "Intelligent" is ___.', questionHi: '"Intelligent" की Comparative degree क्या है?',
      options: ['Intelligenter','Most Intelligent','More Intelligent','Intelligentest'], correctIndex: 2,
      explanation: '"Intelligent" एक लम्बा adjective है — More Intelligent।'),
    QuizQuestion(questionEn: '"Honest" uses More/Most because ___.', questionHi: '"Honest" के साथ More/Most क्यों?',
      options: ['यह एक Noun है','यह एक बहु-अक्षरीय adjective है','-er/-est किसी में नहीं लगते','यह irregular है'], correctIndex: 1,
      explanation: 'लम्बे / बहु-अक्षरीय adjectives में More/Most लगाते हैं।'),
    QuizQuestion(questionEn: 'Superlative of "Useful" is ___.', questionHi: '"Useful" की Superlative degree क्या है?',
      options: ['Usefulest','More Useful','Usefuller','Most Useful'], correctIndex: 3,
      explanation: 'Useful → More Useful → Most Useful।'),
  ];

  static const List<QuizQuestion> irregularQuestions = [
    QuizQuestion(questionEn: 'Comparative of "Good" is ___.', questionHi: '"Good" की Comparative degree क्या है?',
      options: ['Gooder','Most Good','Better','Best'], correctIndex: 2,
      explanation: 'Good/Well → Better → Best — Irregular pattern।'),
    QuizQuestion(questionEn: 'Superlative of "Bad" is ___.', questionHi: '"Bad" की Superlative degree क्या है?',
      options: ['Badder','Worse','More Bad','Worst'], correctIndex: 3,
      explanation: 'Bad/Ill → Worse → Worst — Irregular।'),
    QuizQuestion(questionEn: 'Comparative of "Much/Many" is ___.', questionHi: '"Much/Many" की Comparative degree क्या है?',
      options: ['Mucher','More','Most','Morer'], correctIndex: 1,
      explanation: 'Much/Many → More → Most।'),
    QuizQuestion(questionEn: 'Comparative of "Little" is ___.', questionHi: '"Little" की Comparative degree क्या है?',
      options: ['Littler','Least','Less / Lesser','More Little'], correctIndex: 2,
      explanation: 'Little → Less / Lesser → Least।'),
    QuizQuestion(questionEn: '"Well" has same degrees as ___.', questionHi: '"Well" की degrees किसके समान?',
      options: ['Bad','Good','Much','Little'], correctIndex: 1,
      explanation: 'Good / Well → Better → Best।'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: 'Adjective describes a ___.', questionHi: 'Adjective (विशेषण) किसकी विशेषता बताता है?',
      options: ['Verb की','Adverb की','Noun या Pronoun की','Conjunction की'], correctIndex: 2,
      explanation: 'Adjective = Noun या Pronoun की विशेषता बताता है।'),
    QuizQuestion(questionEn: 'How many degrees of adjectives?', questionHi: 'Adjective की कितनी degrees होती हैं?',
      options: ['2','3','4','5'], correctIndex: 1, explanation: '3 Degrees: Positive, Comparative, Superlative।'),
    QuizQuestion(questionEn: 'Comparative of "Tall" is ___.', questionHi: '"Tall" की Comparative ___.',
      options: ['Tallest','More Tall','Taller','Most Tall'], correctIndex: 2, explanation: 'Tall → Taller → Tallest।'),
    QuizQuestion(questionEn: 'Superlative of "Beautiful" is ___.', questionHi: '"Beautiful" की Superlative ___.',
      options: ['Beautifulest','Beautifuler','More Beautiful','Most Beautiful'], correctIndex: 3,
      explanation: 'Beautiful → More Beautiful → Most Beautiful।'),
    QuizQuestion(questionEn: 'Comparative of "Good" is ___.', questionHi: '"Good" की Comparative ___.',
      options: ['Gooder','Best','Better','More Good'], correctIndex: 2, explanation: 'Good/Well → Better → Best (Irregular)।'),
    QuizQuestion(questionEn: 'Superlative of "Bad" is ___.', questionHi: '"Bad" की Superlative ___.',
      options: ['Badder','Worse','Baddest','Worst'], correctIndex: 3, explanation: 'Bad/Ill → Worse → Worst (Irregular)।'),
    QuizQuestion(questionEn: 'Superlative of "Strong" is ___.', questionHi: '"Strong" की Superlative ___.',
      options: ['Stronger','More Strong','Strongest','Most Strong'], correctIndex: 2, explanation: 'Strong → Stronger → Strongest।'),
    QuizQuestion(questionEn: 'Comparative of "Little" is ___.', questionHi: '"Little" की Comparative ___.',
      options: ['Littler','Least','Less / Lesser','Most Little'], correctIndex: 2, explanation: 'Little → Less / Lesser → Least (Irregular)।'),
    QuizQuestion(questionEn: '"Intelligent" uses which pattern?', questionHi: '"Intelligent" की degrees के लिए कौन सा pattern?',
      options: ['-er / -est','More / Most','Irregular','None'], correctIndex: 1, explanation: 'लम्बे adjectives → More Intelligent, Most Intelligent।'),
    QuizQuestion(questionEn: 'Superlative of "Heavy" is ___.', questionHi: '"Heavy" की Superlative ___.',
      options: ['Heavyer','Most Heavy','Heavyest','Heaviest'], correctIndex: 3, explanation: 'Heavy → Heavier → Heaviest (-y → -i rule)।'),
    QuizQuestion(questionEn: '"Much/Many" → ___ → Most', questionHi: '"Much/Many" → ___ → Most',
      options: ['Mucher','More','Most','Morer'], correctIndex: 1, explanation: 'Much/Many → More → Most (Irregular)।'),
    QuizQuestion(questionEn: '"She is a very nice girl." — "nice" is ___.', questionHi: '"nice" एक ___ है।',
      options: ['Noun','Verb','Adjective','Pronoun'], correctIndex: 2, explanation: '"Nice" girl (Noun) की विशेषता बताता है — Adjective।'),
  ];

  // ── Content Data ──────────────────────────────────────────────────────────

  static const List<Map<String, String>> introExamples = [
    {'no':'1','hindi':'राम बहादुर है।','english':'Ram is brave.','adjective':'Brave','describes':'Ram (Noun)','note':'"बहादुर" होना राम की विशेषता है।'},
    {'no':'2','hindi':'वह बहादुर था।','english':'He was brave.','adjective':'Brave','describes':'He (Pronoun)','note':'"Brave" pronoun "He" की विशेषता बताता है।'},
    {'no':'3','hindi':'मेरे पास थोड़ा/बहुत पानी है।','english':'I have some/much water.','adjective':'Some / Much','describes':'Water (Noun)','note':'"Some/Much" पानी की मात्रा की अतिरिक्त सूचना देता है।'},
    {'no':'4','hindi':'अमन मेरा भाई है जो तुम्हारे साथ खेलता है।','english':'Aman is my brother who plays with you.','adjective':'who plays with you','describes':'Aman (Noun) — Adjective Clause','note':'"who plays with you" Aman के बारे में अतिरिक्त सूचना देता है।'},
    {'no':'5','hindi':'वो राम है जो मुझसे बड़ा है।','english':'He is Ram who is older than I.','adjective':'who is older than I','describes':'Ram (Noun) — Adjective Clause','note':'"who is older than I" Ram के बारे में अतिरिक्त सूचना देता है।'},
  ];

  static const List<Map<String, String>> sentenceExamples = [
    {'en':'It is a bright day.','hi':'यह एक चमकीला दिन है।','adj':'bright'},
    {'en':'Dehradun is a huge city.','hi':'देहरादून एक बड़ा शहर है।','adj':'huge'},
    {'en':'She is a very nice girl.','hi':'वह बहुत अच्छी लड़की है।','adj':'nice'},
    {'en':'They are cute.','hi':'वे प्यारे हैं।','adj':'cute'},
    {'en':'They both are in a difficult situation.','hi':'वे दोनों मुश्किल हालात में हैं।','adj':'difficult'},
    {'en':'I am taller than you.','hi':'मैं तुमसे लम्बा हूँ।','adj':'taller'},
  ];

  static const List<Map<String, String>> degreesExplanation = [
    {'degree':'Positive','degreeHi':'सामान्य अवस्था','desc':'सामान्य विशेषता बताता है — बिना किसी से तुलना किए।','descEn':'Describes a quality without any comparison.','example':'Ram is tall.','exampleHi':'राम लम्बा है।','emoji':'1️⃣','color':'primary'},
    {'degree':'Comparative','degreeHi':'तुलनात्मक अवस्था','desc':'दो चीज़ों या व्यक्तियों की आपस में तुलना करता है।','descEn':'Compares two things or persons.','example':'Ram is taller than Shyam.','exampleHi':'राम श्याम से ज़्यादा लम्बा है।','emoji':'2️⃣','color':'accent'},
    {'degree':'Superlative','degreeHi':'उत्तमावस्था','desc':'तीन या अधिक में से सबसे ज़्यादा/कम बताता है।','descEn':'Shows the highest/lowest degree among 3 or more.','example':'Ram is the tallest in the class.','exampleHi':'राम कक्षा में सबसे लम्बा है।','emoji':'3️⃣','color':'success'},
  ];

  static const List<Map<String, String>> erEstAdjectives = [
    {'positive':'Tall','positiveHi':'कद में लम्बा','comparative':'Taller','superlative':'Tallest'},
    {'positive':'Short','positiveHi':'कद में छोटा','comparative':'Shorter','superlative':'Shortest'},
    {'positive':'Big','positiveHi':'बड़ा','comparative':'Bigger','superlative':'Biggest'},
    {'positive':'Small','positiveHi':'छोटा','comparative':'Smaller','superlative':'Smallest'},
    {'positive':'Great','positiveHi':'महान','comparative':'Greater','superlative':'Greatest'},
    {'positive':'Lengthy','positiveHi':'लम्बा','comparative':'Lengthier','superlative':'Lengthiest'},
    {'positive':'Long','positiveHi':'लम्बा','comparative':'Longer','superlative':'Longest'},
    {'positive':'Wide','positiveHi':'चौड़ा','comparative':'Wider','superlative':'Widest'},
    {'positive':'High','positiveHi':'ऊँचा','comparative':'Higher','superlative':'Highest'},
    {'positive':'Deep','positiveHi':'गहरा','comparative':'Deeper','superlative':'Deepest'},
    {'positive':'Black','positiveHi':'काला','comparative':'Blacker','superlative':'Blackest'},
    {'positive':'White','positiveHi':'सफेद','comparative':'Whiter','superlative':'Whitest'},
    {'positive':'Bitter','positiveHi':'कड़वा','comparative':'Bitterer','superlative':'Bitterest'},
    {'positive':'Sweet','positiveHi':'मीठा','comparative':'Sweeter','superlative':'Sweetest'},
    {'positive':'Sour','positiveHi':'खट्टा','comparative':'Sourer','superlative':'Sourest'},
    {'positive':'Clean','positiveHi':'साफ','comparative':'Cleaner','superlative':'Cleanest'},
    {'positive':'Dirty','positiveHi':'गंदा','comparative':'Dirtier','superlative':'Dirtiest'},
    {'positive':'Cold','positiveHi':'ठंडा','comparative':'Colder','superlative':'Coldest'},
    {'positive':'Hot','positiveHi':'गर्म','comparative':'Hotter','superlative':'Hottest'},
    {'positive':'Fast','positiveHi':'तेज','comparative':'Faster','superlative':'Fastest'},
    {'positive':'Slow','positiveHi':'धीमा','comparative':'Slower','superlative':'Slowest'},
    {'positive':'Hard','positiveHi':'कठोर','comparative':'Harder','superlative':'Hardest'},
    {'positive':'Tough','positiveHi':'कठोर','comparative':'Tougher','superlative':'Toughest'},
    {'positive':'Soft','positiveHi':'मुलायम / कोमल','comparative':'Softer','superlative':'Softest'},
    {'positive':'Rich','positiveHi':'अमीर','comparative':'Richer','superlative':'Richest'},
    {'positive':'Poor','positiveHi':'गरीब','comparative':'Poorer','superlative':'Poorest'},
    {'positive':'Strong','positiveHi':'मजबूत','comparative':'Stronger','superlative':'Strongest'},
    {'positive':'Weak','positiveHi':'कमजोर','comparative':'Weaker','superlative':'Weakest'},
    {'positive':'Heavy','positiveHi':'भारी','comparative':'Heavier','superlative':'Heaviest'},
    {'positive':'Light','positiveHi':'हल्का','comparative':'Lighter','superlative':'Lightest'},
    {'positive':'Young','positiveHi':'जवान / उम्र में छोटा','comparative':'Younger','superlative':'Youngest'},
    {'positive':'Old','positiveHi':'उम्र में बड़ा / पुराना','comparative':'Older/Elder','superlative':'Oldest/Eldest'},
    {'positive':'Bright','positiveHi':'चमकीला','comparative':'Brighter','superlative':'Brightest'},
    {'positive':'Clever','positiveHi':'चालाक','comparative':'Cleverer','superlative':'Cleverest'},
    {'positive':'Dear','positiveHi':'प्यारा','comparative':'Dearer','superlative':'Dearest'},
    {'positive':'Loud','positiveHi':'ऊँची आवाज','comparative':'Louder','superlative':'Loudest'},
    {'positive':'Near','positiveHi':'करीब','comparative':'Nearer','superlative':'Nearest'},
    {'positive':'Soon','positiveHi':'जल्दी','comparative':'Sooner','superlative':'Soonest'},
    {'positive':'Wise','positiveHi':'बुद्धिमान','comparative':'Wiser','superlative':'Wisest'},
    {'positive':'Pure','positiveHi':'पवित्र / साफ','comparative':'Purer','superlative':'Purest'},
    {'positive':'Brave','positiveHi':'बहादुर','comparative':'Braver','superlative':'Bravest'},
  ];

  static const List<Map<String, String>> moreAdjectives = [
    {'positive':'Active','positiveHi':'तेजतर्रार','comparative':'More Active','superlative':'Most Active'},
    {'positive':'Beautiful','positiveHi':'सुन्दर','comparative':'More Beautiful','superlative':'Most Beautiful'},
    {'positive':'Careful','positiveHi':'सावधान','comparative':'More Careful','superlative':'Most Careful'},
    {'positive':'Cheerful','positiveHi':'खुश','comparative':'More Cheerful','superlative':'Most Cheerful'},
    {'positive':'Dangerous','positiveHi':'खतरनाक','comparative':'More Dangerous','superlative':'Most Dangerous'},
    {'positive':'Difficult','positiveHi':'मुश्किल','comparative':'More Difficult','superlative':'Most Difficult'},
    {'positive':'Diligent','positiveHi':'मेहनती','comparative':'More Diligent','superlative':'Most Diligent'},
    {'positive':'Famous','positiveHi':'प्रसिद्ध','comparative':'More Famous','superlative':'Most Famous'},
    {'positive':'Foolish','positiveHi':'मूर्ख','comparative':'More Foolish','superlative':'Most Foolish'},
    {'positive':'Harmful','positiveHi':'हानिकारक','comparative':'More Harmful','superlative':'Most Harmful'},
    {'positive':'Honest','positiveHi':'ईमानदार','comparative':'More Honest','superlative':'Most Honest'},
    {'positive':'Important','positiveHi':'महत्वपूर्ण','comparative':'More Important','superlative':'Most Important'},
    {'positive':'Industrious','positiveHi':'मेहनती','comparative':'More Industrious','superlative':'Most Industrious'},
    {'positive':'Intelligent','positiveHi':'बुद्धिमान','comparative':'More Intelligent','superlative':'Most Intelligent'},
    {'positive':'Interesting','positiveHi':'रोचक','comparative':'More Interesting','superlative':'Most Interesting'},
    {'positive':'Popular','positiveHi':'प्रसिद्ध','comparative':'More Popular','superlative':'Most Popular'},
    {'positive':'Powerful','positiveHi':'शक्तिशाली','comparative':'More Powerful','superlative':'Most Powerful'},
    {'positive':'Patient','positiveHi':'धैर्यवान','comparative':'More Patient','superlative':'Most Patient'},
    {'positive':'Urgent','positiveHi':'जरूरी','comparative':'More Urgent','superlative':'Most Urgent'},
    {'positive':'Useful','positiveHi':'उपयोगी','comparative':'More Useful','superlative':'Most Useful'},
  ];

  static const List<Map<String, String>> irregularAdjectives = [
    {'positive':'Good / Well','positiveHi':'अच्छा / ठीक','comparative':'Better','comparativeHi':'बेहतर','superlative':'Best','superlativeHi':'सबसे ज़्यादा अच्छा'},
    {'positive':'Bad / Ill','positiveHi':'बुरा','comparative':'Worse','comparativeHi':'ज़्यादा बुरा','superlative':'Worst','superlativeHi':'सबसे ज़्यादा बुरा'},
    {'positive':'Much / Many','positiveHi':'ज़्यादा / कई','comparative':'More','comparativeHi':'और ज़्यादा','superlative':'Most','superlativeHi':'सबसे ज़्यादा'},
    {'positive':'Little','positiveHi':'थोड़ा / कम','comparative':'Less / Lesser','comparativeHi':'और थोड़ा कम','superlative':'Least','superlativeHi':'सबसे ज़्यादा कम'},
  ];
}