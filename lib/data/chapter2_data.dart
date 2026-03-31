import '../models/lesson_model.dart';

/// Chapter 2 — Few Basics of English (अंग्रेजी की कुछ मूल बातें)
class Chapter2Data {

  static ChapterModel get chapter => ChapterModel(
        id: 2,
        title: 'Few Basics of English',
        titleHindi: 'अंग्रेजी की कुछ मूल बातें',
        description: 'Sentences, Subject-Verb-Object, Pronouns & Phrases',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Sentence Types', titleHindi: 'वाक्य के प्रकार', emoji: '📝', type: LessonType.ch02SentenceTypes, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Subject, Verb & Object', titleHindi: 'कर्ता, क्रिया और कर्म', emoji: '🔤', type: LessonType.ch02SVO, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Pronouns & This/That', titleHindi: 'सर्वनाम और This/That', emoji: '👤', type: LessonType.ch02Pronouns, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: "Apostrophe 's", titleHindi: "'s का प्रयोग", emoji: '✏️', type: LessonType.ch02Apostrophe, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Key Phrases — Both/All', titleHindi: 'Both / All / Common Phrases', emoji: '💬', type: LessonType.ch02Phrases, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Adjectives & States', titleHindi: 'Adjectives / States — विशेषण', emoji: '🎨', type: LessonType.ch02Adjectives, status: LessonStatus.inProgress),
          LessonModel(id: 7, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch02ChapterQuiz, status: LessonStatus.inProgress, totalXP: 60),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch02SentenceTypes:  return sentenceTypesQuestions;
      case LessonType.ch02SVO:            return svoQuestions;
      case LessonType.ch02Pronouns:       return pronounsQuestions;
      case LessonType.ch02Apostrophe:     return apostropheQuestions;
      case LessonType.ch02Phrases:        return phrasesQuestions;
      case LessonType.ch02Adjectives:     return adjectivesQuestions;
      case LessonType.ch02ChapterQuiz:    return chapterFinalQuestions;
      default:                            return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> sentenceTypesQuestions = [
    QuizQuestion(questionEn: '"Sit there." — Which type of sentence?', questionHi: '"Sit there." — कौन सा वाक्य?', options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'], correctIndex: 2, explanation: 'Imperative = आज्ञासूचक (command/request). "Sit there." = आदेश देना।'),
    QuizQuestion(questionEn: '"Wow!" — Which sentence type?', questionHi: '"Wow!" — कौन सा वाक्य?', options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'], correctIndex: 3, explanation: 'Exclamatory = विस्मयादिबोधक। अचानक भावनाओं की अभिव्यक्ति।'),
    QuizQuestion(questionEn: '"Aman is not at home." — Which type?', questionHi: '"Aman is not at home." — कौन सा वाक्य?', options: ['Assertive/Declarative', 'Interrogative', 'Imperative', 'Exclamatory'], correctIndex: 0, explanation: 'Assertive/Declarative = स्वीकारात्मक/कथात्मक। कोई बात बताई जा रही है।'),
    QuizQuestion(questionEn: '"Is Ram not a good boy?" — Classification 2 type?', questionHi: '"Is Ram not a good boy?" — Classification 2 में?', options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'], correctIndex: 3, explanation: 'Negative Interrogative = नकारात्मक प्रश्नवाचक। Question + "not" दोनों हैं।'),
    QuizQuestion(questionEn: '"Do you play?" — Which sentence type?', questionHi: '"Do you play?" — कौन सा वाक्य?', options: ['Assertive', 'Interrogative', 'Imperative', 'Exclamatory'], correctIndex: 1, explanation: 'Interrogative = प्रश्नवाचक। प्रश्न पूछा जा रहा है।'),
  ];

  static const List<QuizQuestion> svoQuestions = [
    QuizQuestion(questionEn: 'In "Ram is my friend." — what is the Subject?', questionHi: '"Ram is my friend." — Subject क्या है?', options: ['is', 'my friend', 'Ram', 'None'], correctIndex: 2, explanation: 'Subject = कर्ता। वाक्य जिसके बारे में है या जो काम कर रहा है। "Ram" is the subject.'),
    QuizQuestion(questionEn: '"Ayansh is sleeping." — Main Verb?', questionHi: '"Ayansh is sleeping." — मुख्य क्रिया?', options: ['Ayansh', 'is', 'sleeping', 'None'], correctIndex: 2, explanation: 'Main Verb = मुख्य क्रिया। Subject का काम बताती है। "sleeping" = सोना।'),
    QuizQuestion(questionEn: '"I miss you." — Object?', questionHi: '"I miss you." — Object (कर्म)?', options: ['I', 'miss', 'you', 'None'], correctIndex: 2, explanation: 'Object = कर्म। Subject के काम का प्रभाव जिस पर पड़े। "you" = तुम।'),
    QuizQuestion(questionEn: 'Helping verbs express ___.',questionHi: 'Helping verbs क्या व्यक्त करती हैं?', options: ['Subject\'s action', 'Subject\'s state/condition', 'Object', 'Tense only'], correctIndex: 1, explanation: 'Helping verbs (is, am, are, was, were...) = Subject की अवस्था/स्थिति बताती हैं।'),
    QuizQuestion(questionEn: '"Ayansh is 8 months old." — Verb type?', questionHi: '"Ayansh is 8 months old." — Verb type?', options: ['Main verb (action)', 'Helping verb (state)', 'Both', 'Neither'], correctIndex: 1, explanation: '"is" = Helping verb। Ayansh कोई काम नहीं कर रहा — उसकी अवस्था (age) बताई जा रही है।'),
  ];

  static const List<QuizQuestion> pronounsQuestions = [
    QuizQuestion(questionEn: '"You" is always treated as ___.',questionHi: '"You" हमेशा किस तरह treat होता है?', options: ['Singular', 'Plural', 'Both', 'Depends on context'], correctIndex: 1, explanation: '"You" = always plural। चाहे एक हो या अनेक — are/have/do के साथ। Singular form "Thou" = obsolete।'),
    QuizQuestion(questionEn: '"This" is used for ___ objects.',questionHi: '"This" किस वस्तु के लिए?', options: ['Far + Plural', 'Near + Singular', 'Far + Singular', 'Near + Plural'], correctIndex: 1, explanation: 'This = पास (Near) + एकवचन (Singular). "These" = Near + Plural. "That" = Far + Singular. "Those" = Far + Plural.'),
    QuizQuestion(questionEn: '"वो दोनों लड़के" — English (boys are far, living)?', questionHi: '"वो दोनों लड़के" — English?', options: ['These both boys', 'Those both boys / They both boys', 'That both boys', 'This both boys'], correctIndex: 1, explanation: 'Far + Plural → "Those". Living beings → "They" also possible. "Those/They both boys."'),
    QuizQuestion(questionEn: 'First Person plural = ___.',questionHi: 'First Person plural?', options: ['I', 'We', 'They', 'You'], correctIndex: 1, explanation: 'First Person: I (singular) → We (plural). मैं (I) → हम (We).'),
    QuizQuestion(questionEn: '"वो दोनों मछलियाँ" — English (near, non-living)?', questionHi: '"ये दोनों मछलियाँ" — English (near)?', options: ['Those fishes', 'These fishes', 'That fish', 'They fishes'], correctIndex: 1, explanation: 'Near + Plural = "These". Non-living → "These" (not "They"). "These fishes."'),
  ];

  static const List<QuizQuestion> apostropheQuestions = [
    QuizQuestion(questionEn: '"राम का पैन" — English?', questionHi: '"राम का पैन" — English?', options: ['Ram pen', 'Ram\'s pen / Pen of Ram', 'Pen\'s Ram', 'Pens of Ram'], correctIndex: 1, explanation: '"Ram\'s pen" OR "Pen of Ram" — दोनों सही। Apostrophe \'s = possession (स्वामित्व)।'),
    QuizQuestion(questionEn: '"लड़कियों का भाई" — Correct English?', questionHi: '"लड़कियों का भाई" — सही English?', options: ['Girl\'s brother', 'Girls\'s brother', 'Girls\' brother', 'Girles\' brother'], correctIndex: 2, explanation: 'Plural noun ending in "s" → only apostrophe, no extra "s". "girls\' brother" ✅ (NOT "girls\'s").'),
    QuizQuestion(questionEn: '"मेरे पापा के दोस्त की बेटी" — English?', questionHi: '"मेरे पापा के दोस्त की बेटी"', options: ['My father\'s friend\'s daughter', 'My father friend daughter', 'Daughter of father friend', 'My fathers friend daughter'], correctIndex: 0, explanation: '"My father\'s friend\'s daughter" — चैन में \'s का प्रयोग। Double possession.'),
    QuizQuestion(questionEn: '"मेरे भाईयों के पैन" — English?', questionHi: '"मेरे भाईयों के पैन"', options: ['My brother\'s pens', 'My brothers\'s pens', 'My brothers\' pens', 'Pens of my brother'], correctIndex: 2, explanation: '"brothers" = plural ending in "s" → apostrophe only: "brothers\' pens". ✅'),
    QuizQuestion(questionEn: 'In "Ram\'s pen" vs "Pen of Ram" — difference?', questionHi: '"Ram\'s pen" vs "Pen of Ram" — फर्क?', options: ['No difference at all', 'Ram\'s pen = Ram को ज़्यादा महत्व। Pen of Ram = Pen को ज़्यादा महत्व।', 'Pen of Ram is wrong.', 'Ram\'s pen is informal only.'], correctIndex: 1, explanation: '"Ram\'s pen" = Ram को prominence। "Pen of Ram" = Pen को prominence। Both are correct.'),
  ];

  static const List<QuizQuestion> phrasesQuestions = [
    QuizQuestion(questionEn: '"हम दोनों" — English?', questionHi: '"हम दोनों" — English?', options: ['We two', 'We both / Both of us', 'Both we', 'We all both'], correctIndex: 1, explanation: '"हम दोनों" = "We both" OR "Both of us". दोनों correct हैं।'),
    QuizQuestion(questionEn: '"अनजाने में" — English?', questionHi: '"अनजाने में" — English?', options: ['Knowingly', 'Unnecessarily', 'Unknowingly', 'Deliberately'], correctIndex: 2, explanation: '"Unknowingly" = अनजाने में। "Knowingly" = जानबूझकर। "Unnecessarily" = फालतू में।'),
    QuizQuestion(questionEn: '"किसी और की कहानी" — English?', questionHi: '"किसी और की कहानी" — English?', options: ['Someone\'s story', 'Someone else story', 'Someone else\'s story', 'Any other story'], correctIndex: 2, explanation: '"Someone else\'s story" — "else\'s" = किसी और का (possession of "someone else").'),
    QuizQuestion(questionEn: '"नदी के उस पार" — English?', questionHi: '"नदी के उस पार" — English?', options: ['Beyond the river', 'Across the river', 'Over the river', 'Through the river'], correctIndex: 1, explanation: '"Across" = उस पार। "Across the river" = नदी के उस पार। "Across the road" = सड़क के उस पार।'),
    QuizQuestion(questionEn: '"तुम्हारी वजह से" — English?', questionHi: '"तुम्हारी वजह से" — English?', options: ['Because you', 'For you', 'Due to you / Because of you', 'With you'], correctIndex: 2, explanation: '"Due to you" OR "Because of you" = तुम्हारी वजह से। दोनों correct।'),
  ];

  static const List<QuizQuestion> adjectivesQuestions = [
    QuizQuestion(questionEn: '"खोया हुआ" — English?', questionHi: '"खोया हुआ" — English?', options: ['Hidden', 'Lost', 'Tired', 'Broken'], correctIndex: 1, explanation: '"Lost" = खोया हुआ। "Hidden" = छिपा हुआ। "Tired" = थका हुआ।'),
    QuizQuestion(questionEn: '"Scared" — हिंदी?', questionHi: '"Scared" — हिंदी?', options: ['थका हुआ', 'टूटा हुआ', 'डरा हुआ', 'चौंका हुआ'], correctIndex: 2, explanation: '"Scared" = डरा हुआ। "Shocked" = चौंका हुआ। "Tired" = थका हुआ।'),
    QuizQuestion(questionEn: '"सजा हुआ" — English?', questionHi: '"सजा हुआ" — English?', options: ['Hidden', 'Kept', 'Decorated', 'Bent'], correctIndex: 2, explanation: '"Decorated" = सजा हुआ। "Kept" = रखा हुआ। "Bent" = मुड़ा हुआ।'),
    QuizQuestion(questionEn: '"Buried" — हिंदी?', questionHi: '"Buried" — हिंदी?', options: ['रुका हुआ', 'गड़ा हुआ / दफनाया हुआ', 'फटा हुआ', 'लिखा हुआ'], correctIndex: 1, explanation: '"Buried" = गड़ा हुआ / दफनाया हुआ। "Stopped" = रुका हुआ।'),
    QuizQuestion(questionEn: '"Torn" — हिंदी?', questionHi: '"Torn" — हिंदी?', options: ['टूटा हुआ', 'मुड़ा हुआ', 'फटा हुआ', 'पीटा हुआ'], correctIndex: 2, explanation: '"Torn" = फटा हुआ। "Broken" = टूटा हुआ। "Bent" = मुड़ा हुआ।'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: 'How many types of sentences (Classification 1)?', questionHi: 'Classification 1 में वाक्य के कितने प्रकार?', options: ['2', '3', '4', '5'], correctIndex: 2, explanation: '4 types: Assertive, Interrogative, Imperative, Exclamatory.'),
    QuizQuestion(questionEn: '"Ram is not a good boy." — Classification 2 type?', questionHi: '"Ram is not a good boy." — Classification 2 में?', options: ['Affirmative', 'Negative', 'Interrogative', 'Negative Interrogative'], correctIndex: 1, explanation: 'Negative = नकारात्मक। "not" है, प्रश्न नहीं। "Ram is not a good boy."'),
    QuizQuestion(questionEn: 'Object is the one ___.',questionHi: 'Object (कर्म) वह है जो ___।', options: ['performs action', 'gets affected by subject\'s action', 'describes subject', 'asks questions'], correctIndex: 1, explanation: 'Object = कर्म। Subject के कार्य का प्रभाव जिस पर पड़े। "I miss you" → you = object।'),
    QuizQuestion(questionEn: '"These" = Near + ___ .',questionHi: '"These" = पास + ___।', options: ['Singular', 'Plural', 'Any', 'Non-living'], correctIndex: 1, explanation: '"These" = Near (पास) + Plural (बहुवचन). "This" = Near + Singular.'),
    QuizQuestion(questionEn: '"girls\' brother" vs "girl\'s brother" — difference?',questionHi: '"girls\' brother" vs "girl\'s brother" — फर्क?', options: ['No difference', 'girls\' = many girls, girl\'s = one girl', 'Both wrong', 'girls\' = one girl'], correctIndex: 1, explanation: '"girl\'s" = एक लड़की। "girls\'" = अनेक लड़कियाँ (plural ending in s → only apostrophe)।'),
    QuizQuestion(questionEn: '"जानबूझकर" — English?',questionHi: '"जानबूझकर" — English?', options: ['Unknowingly', 'Unnecessarily', 'Knowingly', 'Deliberately'], correctIndex: 2, explanation: '"Knowingly" = जानबूझकर। "Unknowingly" = अनजाने में। Both are correct options but "Knowingly" is the direct match.'),
    QuizQuestion(questionEn: '"Awake" — हिंदी?',questionHi: '"Awake" — हिंदी?', options: ['सोया हुआ', 'जागा हुआ', 'थका हुआ', 'डरा हुआ'], correctIndex: 1, explanation: '"Awake" = जागा हुआ। "Asleep" = सोया हुआ।'),
    QuizQuestion(questionEn: '"मेरे सामने" — English?',questionHi: '"मेरे सामने" — English?', options: ['Behind me', 'Next to me', 'In front of me', 'Ahead of me'], correctIndex: 2, explanation: '"In front of me" = मेरे सामने। "Behind me" = मेरे पीछे। "Next to me" = मेरे बगल में।'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  // ─── Sentence Types — Classification 1 ───────────────────────────────────
  static const List<Map<String, String>> sentenceClass1 = [
    {'type': 'Assertive / Declarative', 'hindi': 'स्वीकारात्मक / कथात्मक', 'desc': 'कुछ बताया जाता है या किसी बात का वर्णन होता है।', 'descEn': 'States a fact, opinion or idea.', 'emoji': '💬', 'ex': 'Ayansh is my son.'},
    {'type': 'Interrogative', 'hindi': 'प्रश्नवाचक', 'desc': 'प्रश्न पूछा जाता है।', 'descEn': 'A question is asked.', 'emoji': '❓', 'ex': 'Is Aman not at home?'},
    {'type': 'Imperative', 'hindi': 'आज्ञासूचक', 'desc': 'आज्ञा, आदेश या प्रार्थना व्यक्त करते हैं।', 'descEn': 'Used to permit, command or request.', 'emoji': '👆', 'ex': 'Sit there. / Let me go.'},
    {'type': 'Exclamatory', 'hindi': 'विस्मयादिबोधक', 'desc': 'अचानक उत्पन्न भावनाओं की अभिव्यक्ति।', 'descEn': 'Expresses sudden emotions like joy, grief, shock.', 'emoji': '😲', 'ex': 'Wow! / Thank God!'},
  ];

  // ─── Sentence Types — Classification 2 ───────────────────────────────────
  static const List<Map<String, String>> sentenceClass2 = [
    {'type': 'Affirmative', 'hindi': 'सकारात्मक', 'example': 'Ram is a good boy.', 'hindiEx': 'राम एक अच्छा लड़का है।'},
    {'type': 'Negative', 'hindi': 'नकारात्मक', 'example': 'Ram is not a good boy.', 'hindiEx': 'राम एक अच्छा लड़का नहीं है।'},
    {'type': 'Interrogative', 'hindi': 'प्रश्नवाचक', 'example': 'Is Ram a good boy?', 'hindiEx': 'क्या राम एक अच्छा लड़का है?'},
    {'type': 'Negative Interrogative', 'hindi': 'नकारात्मक प्रश्नवाचक', 'example': 'Is Ram not a good boy?', 'hindiEx': 'क्या राम एक अच्छा लड़का नहीं है?'},
  ];

  // ─── Subject-Verb-Object Table ────────────────────────────────────────────
  static const List<Map<String, String>> svoTable = [
    {'sentence': 'राम मेरा दोस्त है।', 'subject': 'राम', 'object': 'मेरा दोस्त', 'verb': '—'},
    {'sentence': 'पापा खेलते हैं।', 'subject': 'पापा', 'object': '—', 'verb': 'खेलना'},
    {'sentence': 'पापा पार्क में खेलते हैं।', 'subject': 'पापा', 'object': 'पार्क', 'verb': 'खेलना'},
    {'sentence': 'मैं तुम्हें याद करता हूँ।', 'subject': 'मैं', 'object': 'तुम', 'verb': 'याद करना'},
    {'sentence': 'तुम मेरे दिल में रहते हो।', 'subject': 'तुम', 'object': 'मेरा दिल', 'verb': 'रहना'},
    {'sentence': 'वो स्कूल नहीं जाता था।', 'subject': 'वो', 'object': 'स्कूल', 'verb': 'जाना'},
    {'sentence': 'बच्चे क्या देखते हैं?', 'subject': 'बच्चे', 'object': '—', 'verb': 'देखना'},
    {'sentence': 'राहुल के पास पैसे नहीं हैं।', 'subject': 'राहुल', 'object': 'पैसे', 'verb': '—'},
  ];

  // ─── This/That/These/Those ────────────────────────────────────────────────
  static const List<Map<String, String>> thisThosTable = [
    {'hindi': 'यह / ये किताब (पास)', 'english': 'This book', 'rule': 'Near + Singular'},
    {'hindi': 'वह / वो किताब (दूर)', 'english': 'That book', 'rule': 'Far + Singular'},
    {'hindi': 'ये / यह किताबें (पास)', 'english': 'These books', 'rule': 'Near + Plural'},
    {'hindi': 'वो / वह / वे किताबें (दूर)', 'english': 'Those books', 'rule': 'Far + Plural'},
    {'hindi': 'वो दोनों लड़के (दूर, सजीव)', 'english': 'Those/They both boys', 'rule': 'Far + Plural + Living'},
    {'hindi': 'ये मछलियाँ (पास)', 'english': 'These fishes', 'rule': 'Near + Plural'},
  ];

  // ─── Personal Pronouns ────────────────────────────────────────────────────
  static const List<Map<String, String>> pronounsTable = [
    {'person': 'First Person', 'singular': 'I (मैं)', 'plural': 'We (हम)'},
    {'person': 'Second Person', 'singular': 'Thou / You (तुम — एक)', 'plural': 'You (तुम — अनेक)'},
    {'person': 'Third Person', 'singular': 'He (वह — लड़का)\nShe (वह — लड़की)\nIt (ये — निर्जीव)', 'plural': 'They — वे (एक से ज्यादा)'},
  ];

  // ─── Apostrophe examples ──────────────────────────────────────────────────
  static const List<Map<String, String>> apostropheExamples = [
    {'hindi': 'राम का पैन', 'english': "Ram's pen / Pen of Ram"},
    {'hindi': 'सीता का भाई', 'english': "Seeta's brother / Brother of Seeta"},
    {'hindi': 'लड़की का भाई', 'english': "Girl's brother / Brother of the girl"},
    {'hindi': 'लड़कियों के भाई', 'english': "Girls' brothers / Brothers of the girls", 'note': "plural → girls' (no extra 's')"},
    {'hindi': 'मेरे पापा के दोस्त की बेटी', 'english': "My father's friend's daughter"},
    {'hindi': 'मेरे भाईयों के पैन', 'english': "My brothers' pens", 'note': "brothers' (plural → no extra 's')"},
    {'hindi': 'शेर की दहाड़', 'english': "Lion's roar / Roar of the lion"},
    {'hindi': 'तुम्हारे मोबाइल की आवाज', 'english': "Your mobile's sound / The sound of your mobile"},
  ];

  // ─── Both / All phrases ───────────────────────────────────────────────────
  static const List<Map<String, String>> bothAllPhrases = [
    {'hindi': 'हम दोनों', 'english': 'We both / Both of us'},
    {'hindi': 'तुम दोनों', 'english': 'You both / Both of you'},
    {'hindi': 'वे/वो दोनों', 'english': 'They both / Both of them'},
    {'hindi': 'हम सभी', 'english': 'We all / All of us'},
    {'hindi': 'तुम सभी', 'english': 'You all / All of you'},
    {'hindi': 'ये सभी किताबें', 'english': 'These all books / All of these books'},
    {'hindi': 'वो सभी पैन', 'english': 'Those all pens / All of those pens'},
    {'hindi': 'वो सभी लोग', 'english': 'Those / They all people'},
    {'hindi': 'हम तीनों', 'english': 'We three / Three of us'},
    {'hindi': 'हम चारों', 'english': 'We four / Four of us'},
    {'hindi': 'वो पाँचों', 'english': 'They five / Those five'},
  ];

  // ─── Common Phrases ───────────────────────────────────────────────────────
  static const List<Map<String, String>> commonPhrases = [
    {'hindi': 'ऐसा तोहफा', 'english': 'Such a gift'},
    {'hindi': 'ऐसे लोग', 'english': 'Such people'},
    {'hindi': 'कोई और', 'english': 'Someone else'},
    {'hindi': 'किसी और के साथ', 'english': 'With someone else'},
    {'hindi': 'किसी और की कहानी', 'english': "Someone else's story"},
    {'hindi': 'फिर कभी', 'english': 'Some other time'},
    {'hindi': 'और किसी दिन', 'english': 'Some other day'},
    {'hindi': 'ऐसा ही कुछ', 'english': 'Something like this'},
    {'hindi': 'ऐसा कुछ नहीं', 'english': 'Nothing as such'},
    {'hindi': 'फालतू में', 'english': 'Unnecessarily'},
    {'hindi': 'जानबूझकर', 'english': 'Knowingly'},
    {'hindi': 'अनजाने में', 'english': 'Unknowingly'},
    {'hindi': 'दिल लगाकर', 'english': 'Whole heartedly'},
    {'hindi': 'मेरी मर्ज़ी', 'english': 'My will'},
    {'hindi': 'टूटा हुआ दिल', 'english': 'Broken heart'},
    {'hindi': 'तुम्हारी वजह से', 'english': 'Due to you / Because of you'},
    {'hindi': 'बच्चों के कारण', 'english': 'Due to children / Because of children'},
  ];

  // ─── Preposition phrases ──────────────────────────────────────────────────
  static const List<Map<String, String>> prepPhrases = [
    {'hindi': 'मेरे सामने', 'english': 'In front of me'},
    {'hindi': 'दीवार के पीछे', 'english': 'Behind the wall'},
    {'hindi': 'नदी के उस पार', 'english': 'Across the river'},
    {'hindi': 'सड़क के उस पार', 'english': 'Across the road'},
    {'hindi': 'रवि के बगल में', 'english': 'Next to Ravi / Beside Ravi'},
    {'hindi': 'हमारी तरफ', 'english': 'Towards us'},
    {'hindi': 'तुम्हारे घर की तरफ', 'english': 'Towards your home'},
    {'hindi': 'मेरे आगे', 'english': 'Ahead of me'},
    {'hindi': 'सबसे आगे', 'english': 'Ahead of all'},
    {'hindi': 'सबसे पीछे', 'english': 'Behind all'},
    {'hindi': 'टेबल के नीचे', 'english': 'Under the table'},
    {'hindi': 'मेरी हथेली पर', 'english': 'On my palm'},
    {'hindi': 'नदी के किनारे', 'english': 'At the bank of river'},
    {'hindi': 'पेड़ के पीछे', 'english': 'Behind the tree'},
    {'hindi': 'दिल्ली की तरफ', 'english': 'Towards Delhi'},
  ];

  // ─── With phrases ─────────────────────────────────────────────────────────
  static const List<Map<String, String>> withPhrases = [
    {'hindi': 'मेरे साथ', 'english': 'With me'},
    {'hindi': 'तुम्हारे साथ', 'english': 'With you'},
    {'hindi': 'उसके साथ', 'english': 'With him/her'},
    {'hindi': 'हमारे साथ', 'english': 'With us'},
    {'hindi': 'उनके साथ', 'english': 'With them'},
    {'hindi': 'किसी के साथ', 'english': 'With someone'},
    {'hindi': 'किसी और के साथ', 'english': 'With someone else'},
    {'hindi': 'तुम्हारे बिना', 'english': 'Without you'},
    {'hindi': 'उसके बिना', 'english': 'Without him'},
    {'hindi': 'तुम्हारे लिए', 'english': 'For you'},
    {'hindi': 'सिर्फ तुम्हारे लिए', 'english': 'Only for you'},
    {'hindi': 'मेरे लिए', 'english': 'For me'},
    {'hindi': 'तुम्हारे बारे में', 'english': 'About you'},
    {'hindi': 'मेरे बारे में', 'english': 'About me'},
  ];

  // ─── Adjectives / States ──────────────────────────────────────────────────
  static const List<Map<String, String>> adjectivesStates = [
    {'hindi': 'सोया हुआ', 'english': 'Asleep', 'pronunciation': 'अस्लीप'},
    {'hindi': 'जागा हुआ', 'english': 'Awake', 'pronunciation': 'अवेक'},
    {'hindi': 'थका हुआ', 'english': 'Tired', 'pronunciation': 'टायर्ड'},
    {'hindi': 'चौंका हुआ', 'english': 'Shocked', 'pronunciation': 'शॉक्ड'},
    {'hindi': 'खोया हुआ', 'english': 'Lost', 'pronunciation': 'लॉस्ट'},
    {'hindi': 'पीटा हुआ', 'english': 'Beaten', 'pronunciation': 'बीटन'},
    {'hindi': 'डरा हुआ', 'english': 'Scared / Terrified', 'pronunciation': 'स्केयर्ड'},
    {'hindi': 'टूटा हुआ', 'english': 'Broken', 'pronunciation': 'ब्रोकन'},
    {'hindi': 'मुड़ा हुआ', 'english': 'Bent', 'pronunciation': 'बेन्ट'},
    {'hindi': 'फटा हुआ', 'english': 'Torn', 'pronunciation': 'टॉर्न'},
    {'hindi': 'लिखा हुआ', 'english': 'Written', 'pronunciation': 'रिटन'},
    {'hindi': 'रुका हुआ', 'english': 'Stopped', 'pronunciation': 'स्टॉप्ड'},
    {'hindi': 'बैठा हुआ', 'english': 'Sitting', 'pronunciation': 'सिटिंग'},
    {'hindi': 'खड़ा हुआ', 'english': 'Standing', 'pronunciation': 'स्टैंडिंग'},
    {'hindi': 'गड़ा हुआ / दफनाया हुआ', 'english': 'Buried', 'pronunciation': 'बरीड'},
    {'hindi': 'छिपा हुआ', 'english': 'Hidden', 'pronunciation': 'हिडन'},
    {'hindi': 'रखा हुआ', 'english': 'Kept', 'pronunciation': 'केप्ट'},
    {'hindi': 'सजा हुआ', 'english': 'Decorated', 'pronunciation': 'डेकोरेटेड'},
  ];

  static const List<Map<String, String>> motivationalQuotes = [
    {'english': "Don't let the fear of losing be greater than the excitement of winning.", 'hindi': 'हारने के डर को जीतने की खुशी से ज्यादा मत बढ़ने दो।'},
    {'english': 'If you think of something difficult, that means you have not understood it well.', 'hindi': 'अगर आपको कुछ मुश्किल लगता है, तो इसका यही मतलब है कि आपने उसे ढंग से समझा नहीं।'},
    {"english": "What's the point of being alive if you don't try to do something remarkable.", 'hindi': 'जीवित रहने के क्या मायने अगर आप कुछ असाधारण करने का प्रयत्न न करें।'},
    {"english": "Don't wish it were easier, wish you were better.", 'hindi': 'ये मत चाहो कि काम आसान हो, बल्कि ये चाहो कि आप बेहतर हो।'},
  ];
}