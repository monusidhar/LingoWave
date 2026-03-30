import '../models/lesson_model.dart';

/// Chapter 32 — Confusing Similar Words (भ्रमित करने वाले एक जैसे शब्द)
class Chapter32Data {

  static ChapterModel get chapter => ChapterModel(
        id: 32,
        title: 'Confusing Similar Words',
        titleHindi: 'भ्रमित करने वाले शब्द',
        description: 'Exercise 1 (Hindi), Exercise 2 (English) & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Exercise 1 — Part A', titleHindi: 'शब्द 1–20 (हिंदी अर्थ)', emoji: '📖', type: LessonType.ch32Ex1A, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Exercise 1 — Part B', titleHindi: 'शब्द 21–40 (हिंदी अर्थ)', emoji: '📝', type: LessonType.ch32Ex1B, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Exercise 1 — Part C', titleHindi: 'शब्द 41–60 (हिंदी अर्थ)', emoji: '🔤', type: LessonType.ch32Ex1C, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Exercise 2', titleHindi: 'English-only pairs (54 groups)', emoji: '🇬🇧', type: LessonType.ch32Ex2, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch32ChapterQuiz, status: LessonStatus.inProgress, totalXP: 80),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch32Ex1A:        return ex1AQuestions;
      case LessonType.ch32Ex1B:        return ex1BQuestions;
      case LessonType.ch32Ex1C:        return ex1CQuestions;
      case LessonType.ch32Ex2:         return ex2Questions;
      case LessonType.ch32ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // EXERCISE 1 — Hindi meanings (pairs 1–60)
  // ══════════════════════════════════════════════════════════════════════════

  /// Each map: word, pronunciation, meaning (Hindi + English note if any)
  static const List<Map<String, dynamic>> exercise1 = [
    // 1
    {'group': 1, 'pairs': [
      {'word': 'Cast',   'pron': 'कास्ट', 'hi': 'किसी नाटक या फिल्म के पात्रों की सूची', 'en': 'list of characters in a drama/movie'},
      {'word': 'Caste',  'pron': 'कास्ट', 'hi': 'जाति',                                   'en': ''},
    ]},
    // 2
    {'group': 2, 'pairs': [
      {'word': 'Story',  'pron': 'स्टोरी', 'hi': 'कहानी', 'en': ''},
      {'word': 'Storey', 'pron': 'स्टोरी', 'hi': 'मंजिल (इमारत की)', 'en': 'horizontal division of building'},
    ]},
    // 3
    {'group': 3, 'pairs': [
      {'word': 'Suit',   'pron': 'सूट',  'hi': 'कोट पैन्ट, कपड़े', 'en': ''},
      {'word': 'Suite',  'pron': 'स्वीट', 'hi': 'होटल का कमरा',     'en': ''},
      {'word': 'Sweet',  'pron': 'स्वीट', 'hi': 'मीठा',             'en': ''},
    ]},
    // 4
    {'group': 4, 'pairs': [
      {'word': 'Currant', 'pron': 'करैन्ट', 'hi': 'किशमिश',                       'en': ''},
      {'word': 'Current', 'pron': 'करन्ट',  'hi': 'नदी की धारा, वर्तमान की घटनाएँ', 'en': ''},
    ]},
    // 5
    {'group': 5, 'pairs': [
      {'word': 'Tasty', 'pron': 'टेस्टी', 'hi': 'स्वादिष्ट',                              'en': 'Good in taste'},
      {'word': 'Testy', 'pron': 'टेस्टी', 'hi': 'गुस्सैल (जिसे जल्दी गुस्सा आता हो)', 'en': 'Short tempered'},
    ]},
    // 6
    {'group': 6, 'pairs': [
      {'word': 'Lightening', 'pron': 'लाइटनिंग', 'hi': 'रोशनी',                'en': ''},
      {'word': 'Lightning',  'pron': 'लाइटनिंग', 'hi': 'आकाश में बिजली का चमकना', 'en': ''},
    ]},
    // 7
    {'group': 7, 'pairs': [
      {'word': 'Heat', 'pron': 'हीट', 'hi': 'गर्म करना', 'en': ''},
      {'word': 'Hit',  'pron': 'हिट', 'hi': 'मारना',     'en': ''},
    ]},
    // 8
    {'group': 8, 'pairs': [
      {'word': 'Weak', 'pron': 'वीक', 'hi': 'कमजोर', 'en': ''},
      {'word': 'Week', 'pron': 'वीक', 'hi': 'सप्ताह', 'en': ''},
    ]},
    // 9
    {'group': 9, 'pairs': [
      {'word': 'Fond',  'pron': 'फॉन्ड', 'hi': 'शौकीन',                   'en': ''},
      {'word': 'Found', 'pron': 'फाउन्ड', 'hi': 'पाया (2nd form of find)', 'en': ''},
    ]},
    // 10
    {'group': 10, 'pairs': [
      {'word': 'Seek', 'pron': 'सीक', 'hi': 'ढूँढना, कोशिश करना', 'en': ''},
      {'word': 'Sick',  'pron': 'सिक', 'hi': 'बीमार',              'en': ''},
    ]},
    // 11
    {'group': 11, 'pairs': [
      {'word': 'Sign',  'pron': 'साइन', 'hi': 'हस्ताक्षर करना (signature करना)', 'en': ''},
      {'word': 'Shine', 'pron': 'शाइन', 'hi': 'चमकना',                           'en': ''},
    ]},
    // 12
    {'group': 12, 'pairs': [
      {'word': 'Same',  'pron': 'सेम', 'hi': 'समान, एक जैसा', 'en': ''},
      {'word': 'Shame', 'pron': 'शेम', 'hi': 'शर्मनाक',       'en': ''},
    ]},
    // 13
    {'group': 13, 'pairs': [
      {'word': 'Ran',  'pron': 'रैन', 'hi': 'दौड़ा (2nd form of run)', 'en': ''},
      {'word': 'Rain', 'pron': 'रेन', 'hi': 'बारिश',                  'en': ''},
    ]},
    // 14
    {'group': 14, 'pairs': [
      {'word': 'People', 'pron': 'पीपल',   'hi': 'लोग',   'en': ''},
      {'word': 'Pupil',  'pron': 'प्यूपिल', 'hi': 'शिष्य', 'en': ''},
    ]},
    // 15
    {'group': 15, 'pairs': [
      {'word': 'Shoulder', 'pron': 'शोल्डर', 'hi': 'कंधा',   'en': ''},
      {'word': 'Soldier',  'pron': 'सोल्जर', 'hi': 'सिपाही', 'en': ''},
    ]},
    // 16
    {'group': 16, 'pairs': [
      {'word': 'Weep', 'pron': 'वीप', 'hi': 'रोना',  'en': ''},
      {'word': 'Wipe', 'pron': 'वाइप', 'hi': 'पोंछना', 'en': ''},
    ]},
    // 17
    {'group': 17, 'pairs': [
      {'word': 'Small', 'pron': 'स्मॉल', 'hi': 'छोटा', 'en': ''},
      {'word': 'Smell', 'pron': 'स्मैल', 'hi': 'गंध',  'en': ''},
    ]},
    // 18
    {'group': 18, 'pairs': [
      {'word': 'Close (adj)', 'pron': 'क्लोस',  'hi': 'खास, करीबी',  'en': 'He is my close friend.'},
      {'word': 'Close (v)',   'pron': 'क्लोज़',  'hi': 'बन्द करना',   'en': 'I closed the door.'},
    ]},
    // 19
    {'group': 19, 'pairs': [
      {'word': 'Tired', 'pron': 'टायर्ड', 'hi': 'थका हुआ',      'en': ''},
      {'word': 'Tyre',  'pron': 'टायर',   'hi': 'गाड़ियों का टायर', 'en': ''},
    ]},
    // 20
    {'group': 20, 'pairs': [
      {'word': 'Break', 'pron': 'ब्रेक', 'hi': 'तोड़ना',         'en': ''},
      {'word': 'Brake', 'pron': 'ब्रेक', 'hi': 'गाड़ियों का ब्रेक', 'en': ''},
    ]},
    // 21
    {'group': 21, 'pairs': [
      {'word': 'There', 'pron': 'देअर', 'hi': 'वहाँ',  'en': ''},
      {'word': 'Their', 'pron': 'देयर', 'hi': 'उनका', 'en': ''},
    ]},
    // 22
    {'group': 22, 'pairs': [
      {'word': 'Whether', 'pron': 'वैदर', 'hi': 'चाहे',  'en': ''},
      {'word': 'Weather', 'pron': 'वैदर', 'hi': 'मौसम', 'en': ''},
    ]},
    // 23
    {'group': 23, 'pairs': [
      {'word': 'Check',  'pron': 'चैक', 'hi': 'चैक करना',  'en': ''},
      {'word': 'Cheque', 'pron': 'चैक', 'hi': 'बैंक का चैक', 'en': ''},
    ]},
    // 24
    {'group': 24, 'pairs': [
      {'word': 'Heart', 'pron': 'हार्ट', 'hi': 'दिल',                       'en': ''},
      {'word': 'Hurt',  'pron': 'हर्ट',  'hi': 'चोट पहुँचाना, दुख पहुँचाना', 'en': ''},
    ]},
    // 25
    {'group': 25, 'pairs': [
      {'word': 'Waste', 'pron': 'वेस्ट', 'hi': 'बेकार',       'en': ''},
      {'word': 'Waist', 'pron': 'वेस्ट', 'hi': 'कमर',         'en': ''},
      {'word': 'West',  'pron': 'वैस्ट', 'hi': 'पश्चिम दिशा', 'en': ''},
    ]},
    // 26
    {'group': 26, 'pairs': [
      {'word': 'Dear', 'pron': 'डियर', 'hi': 'प्रिय',         'en': ''},
      {'word': 'Dare', 'pron': 'डेअर', 'hi': 'हिम्मत करना', 'en': ''},
    ]},
    // 27
    {'group': 27, 'pairs': [
      {'word': 'Chick',  'pron': 'चिक', 'hi': 'मुर्गी का बच्चा', 'en': ''},
      {'word': 'Cheek',  'pron': 'चीक', 'hi': 'गाल',             'en': ''},
    ]},
    // 28
    {'group': 28, 'pairs': [
      {'word': 'Hill',  'pron': 'हिल', 'hi': 'पहाड़',     'en': ''},
      {'word': 'Heel',  'pron': 'हील', 'hi': 'एड़ी',      'en': ''},
      {'word': 'Heal',  'pron': 'हील', 'hi': 'ज़ख्म भरना', 'en': ''},
      {'word': 'Hell',  'pron': 'हैल', 'hi': 'नरक',       'en': ''},
      {'word': 'Hail',  'pron': 'हेल', 'hi': 'ओले पड़ना', 'en': ''},
      {'word': 'Hale',  'pron': 'हेल', 'hi': 'स्वस्थ',   'en': ''},
    ]},
    // 29
    {'group': 29, 'pairs': [
      {'word': 'Reach', 'pron': 'रीच', 'hi': 'पहुँचना', 'en': ''},
      {'word': 'Rich',  'pron': 'रिच', 'hi': 'अमीर',   'en': ''},
    ]},
    // 30
    {'group': 30, 'pairs': [
      {'word': 'Bed', 'pron': 'ब्यड/बेड', 'hi': 'बिस्तर', 'en': ''},
      {'word': 'Bad', 'pron': 'बैड',      'hi': 'बुरा',   'en': ''},
    ]},
    // 31
    {'group': 31, 'pairs': [
      {'word': 'Warm', 'pron': 'वॉर्म', 'hi': 'गर्म',  'en': ''},
      {'word': 'Worm', 'pron': 'वोर्म', 'hi': 'कीड़ा', 'en': ''},
    ]},
    // 32
    {'group': 32, 'pairs': [
      {'word': 'Letter', 'pron': 'लैटर',  'hi': 'पत्र',     'en': ''},
      {'word': 'Later',  'pron': 'लेटर',  'hi': 'बाद में',  'en': ''},
      {'word': 'Latter', 'pron': 'लेटर',  'hi': 'बाद वाला', 'en': ''},
      {'word': 'Late',   'pron': 'लेट',   'hi': 'देर',      'en': ''},
      {'word': 'Lately', 'pron': 'लेटली', 'hi': 'हाल ही में', 'en': ''},
    ]},
    // 33
    {'group': 33, 'pairs': [
      {'word': 'Soap', 'pron': 'सोप', 'hi': 'साबुन', 'en': ''},
      {'word': 'Shop', 'pron': 'शॉप', 'hi': 'दुकान', 'en': ''},
    ]},
    // 34
    {'group': 34, 'pairs': [
      {'word': 'Sweet', 'pron': 'स्वीट', 'hi': 'मीठा',   'en': ''},
      {'word': 'Sweat', 'pron': 'स्वैट', 'hi': 'पसीना', 'en': ''},
    ]},
    // 35
    {'group': 35, 'pairs': [
      {'word': 'Fist',  'pron': 'फिस्ट', 'hi': 'मुठ्ठी', 'en': ''},
      {'word': 'Feast', 'pron': 'फीस्ट', 'hi': 'दावत',  'en': ''},
    ]},
    // 36
    {'group': 36, 'pairs': [
      {'word': 'And', 'pron': 'ऐन्ड', 'hi': 'और',    'en': ''},
      {'word': 'End', 'pron': 'एन्ड', 'hi': 'समाप्त', 'en': ''},
    ]},
    // 37
    {'group': 37, 'pairs': [
      {'word': 'Confident',  'pron': 'कॉन्फिडैन्ट', 'hi': 'विश्वास से भरा हुआ', 'en': ''},
      {'word': 'Confidant',  'pron': 'कॉन्फिडेन्ट', 'hi': 'सहायक',              'en': ''},
    ]},
    // 38
    {'group': 38, 'pairs': [
      {'word': 'Google',  'pron': 'गूगल',   'hi': 'इन्टरनेट का एक सर्च इंजन', 'en': ''},
      {'word': 'Goggles', 'pron': 'गॉगल्ज़', 'hi': 'चश्मा',                    'en': ''},
    ]},
    // 39
    {'group': 39, 'pairs': [
      {'word': 'Heroin',  'pron': 'हैरोइन', 'hi': 'एक प्रकार का नशीला ड्रग', 'en': ''},
      {'word': 'Heroine', 'pron': 'हीरोइन', 'hi': 'फिल्म की हीरोइन',         'en': ''},
    ]},
    // 40
    {'group': 40, 'pairs': [
      {'word': 'Deference',  'pron': 'डैफरैन्स', 'hi': 'सम्मान',        'en': ''},
      {'word': 'Difference', 'pron': 'डिफरैन्स', 'hi': 'मनमुटाव, अन्तर', 'en': ''},
    ]},
    // 41 (from Ex-1 end)
    {'group': 41, 'pairs': [
      {'word': 'Wile', 'pron': 'वाइल', 'hi': 'To deceive', 'en': ''},
      {'word': 'Vile', 'pron': 'वाइल', 'hi': 'Cruel',      'en': ''},
    ]},
    // 42
    {'group': 42, 'pairs': [
      {'word': 'Pen', 'pron': 'पेन', 'hi': 'That we use to write', 'en': ''},
      {'word': 'Pan', 'pron': 'पैन', 'hi': 'To criticize badly',   'en': ''},
    ]},
    // 43
    {'group': 43, 'pairs': [
      {'word': 'Sculpture', 'pron': 'स्कल्पचर', 'hi': 'Art',    'en': ''},
      {'word': 'Sculptor',  'pron': 'स्कल्पटर', 'hi': 'Artist', 'en': ''},
    ]},
    // 44
    {'group': 44, 'pairs': [
      {'word': 'Bash',    'pron': 'बैश',    'hi': 'To hit physically or verbally', 'en': ''},
      {'word': 'Bashful', 'pron': 'बैशफुल', 'hi': 'Shy',                          'en': ''},
    ]},
    // 45
    {'group': 45, 'pairs': [
      {'word': 'Aleft',  'pron': 'अलेफ्ट', 'hi': 'To the left side', 'en': ''},
      {'word': 'Aloft',  'pron': 'अलॉफ्ट', 'hi': 'Above',            'en': ''},
    ]},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // EXERCISE 2 — English-only pairs
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> exercise2 = [
    {'group': 1,  'pairs': [{'word': 'Accessary',  'def': 'Helper'},     {'word': 'Accessory',  'def': 'Spare part'}]},
    {'group': 2,  'pairs': [{'word': 'Amiable',    'def': 'Lovable'},    {'word': 'Amicable',   'def': 'Friendly'}]},
    {'group': 3,  'pairs': [{'word': 'Ascent',     'def': 'Climb up'},   {'word': 'Assent',     'def': 'To agree'}]},
    {'group': 4,  'pairs': [{'word': 'Bail',       'def': 'Security'},   {'word': 'Bale',       'def': 'Bundle'}]},
    {'group': 5,  'pairs': [{'word': 'Beneficial', 'def': 'Useful'},     {'word': 'Beneficent', 'def': 'Kind person'}]},
    {'group': 6,  'pairs': [
      {'word': 'Ball',  'def': 'Sphere'},
      {'word': 'Ball',  'def': 'Social gathering for dance'},
      {'word': 'Bowl',  'def': 'A utensil'},
      {'word': 'Bawl',  'def': 'Cry loudly'},
    ]},
    {'group': 7,  'pairs': [{'word': 'Breach',  'def': 'A break of law, contract etc'}, {'word': 'Breech', 'def': 'Back part of a rifle'}]},
    {'group': 8,  'pairs': [{'word': 'Cannon',  'def': 'A big gun'},        {'word': 'Canon',    'def': 'A rule or law'}]},
    {'group': 9,  'pairs': [{'word': 'Calendar', 'def': 'Calendar of date'}, {'word': 'Calender', 'def': 'A pressing machine'}]},
    {'group': 10, 'pairs': [{'word': 'Childish',  'def': 'Immature'},     {'word': 'Childlike',  'def': 'Innocent'}]},
    {'group': 11, 'pairs': [{'word': 'Chord',   'def': 'A string of music instrument'}, {'word': 'Cord', 'def': 'A thin rope'}]},
    {'group': 12, 'pairs': [{'word': 'Coarse',  'def': 'Rough (Antonym of fine)'}, {'word': 'Course', 'def': 'Line of action'}]},
    {'group': 13, 'pairs': [{'word': 'Compliment',  'def': 'Commendation'}, {'word': 'Complement', 'def': 'Match, Supplement'}]},
    {'group': 14, 'pairs': [{'word': 'Corporal',  'def': 'Pertaining to body'}, {'word': 'Corporeal', 'def': 'Tangible'}]},
    {'group': 15, 'pairs': [{'word': 'Bridal',   'def': 'Marriage related'}, {'word': 'Bridle', 'def': 'Limit'}]},
    {'group': 16, 'pairs': [{'word': 'Council',   'def': 'Assembly'},      {'word': 'Counsel',   'def': 'Advice'}]},
    {'group': 17, 'pairs': [{'word': 'Affluent',  'def': 'Rich'},          {'word': 'Effluent',  'def': 'A small river, coming out of a large river or a lake'}]},
    {'group': 18, 'pairs': [{'word': 'Lapse',    'def': 'Loophole'},       {'word': 'Elapse',    'def': 'Expire'}]},
    {'group': 19, 'pairs': [{'word': 'Emigrant',  'def': 'He is an emigrant in India (he is actually a foreigner)'}, {'word': 'Immigrant', 'def': 'He is an immigrant from India (He is an Indian)'}]},
    {'group': 20, 'pairs': [{'word': 'Ghastly',  'def': 'Horrible'},       {'word': 'Ghostly',   'def': 'Related to ghosts'}]},
    {'group': 21, 'pairs': [{'word': 'Godly',    'def': 'Holy'},           {'word': 'Godlike',   'def': 'Just like God'}]},
    {'group': 22, 'pairs': [{'word': 'Vacation',  'def': 'Holiday'},       {'word': 'Vocation',  'def': 'Profession'}]},
    {'group': 23, 'pairs': [{'word': 'Urban',    'def': 'Belong to town'}, {'word': 'Urbane',    'def': 'Cultured'}]},
    {'group': 24, 'pairs': [{'word': 'Vicious',   'def': 'Cruel'},         {'word': 'Viscous',   'def': 'Sticky'}]},
    {'group': 25, 'pairs': [{'word': 'Veracity',  'def': 'Truthfulness'},  {'word': 'Voracity',  'def': 'Greediness'}]},
    {'group': 26, 'pairs': [{'word': 'Suit',      'def': 'To fit, clothes'}, {'word': 'Suite',   'def': 'A set of rooms'}]},
    {'group': 27, 'pairs': [{'word': 'Vein',      'def': 'Blood vessels'}, {'word': 'Vain',      'def': 'Useless'}]},
    {'group': 28, 'pairs': [{'word': 'Verbal',    'def': 'Oral'},          {'word': 'Verbose',   'def': 'Talkative'}]},
    {'group': 29, 'pairs': [{'word': 'Right',     'def': 'Correct, A side'}, {'word': 'Rite',    'def': 'Ceremony'}]},
    {'group': 30, 'pairs': [{'word': 'Prophecy (Noun)', 'def': 'Prediction'}, {'word': 'Prophesy (Verb)', 'def': 'To predict'}]},
    {'group': 31, 'pairs': [{'word': 'Proceed',   'def': 'Continue'},      {'word': 'Proceeds',  'def': 'Collections'}]},
    {'group': 32, 'pairs': [{'word': 'Premier',   'def': 'Supreme, Chief, first'}, {'word': 'Premiere', 'def': 'Opening show'}]},
    {'group': 33, 'pairs': [{'word': 'Intelligent',  'def': 'Wise'},       {'word': 'Intelligible', 'def': 'Readable'}]},
    {'group': 34, 'pairs': [
      {'word': 'Ingenious',   'def': 'Prudent'},
      {'word': 'Ingenuous',   'def': 'Gullible'},
      {'word': 'Indigenous',  'def': 'Native'},
    ]},
    {'group': 35, 'pairs': [{'word': 'Momentary',  'def': 'For a moment'}, {'word': 'Momentous', 'def': 'Important'}]},
    {'group': 36, 'pairs': [{'word': 'Patrol',    'def': 'Police patrolling'}, {'word': 'Petrol', 'def': 'Car Petrol'}]},
    {'group': 37, 'pairs': [{'word': 'Prosecute', 'def': 'To sue'},        {'word': 'Persecute', 'def': 'To harass'}]},
    {'group': 38, 'pairs': [{'word': 'Salon',     'def': 'Parlour'},       {'word': 'Saloon',    'def': 'Large room'}]},
    {'group': 39, 'pairs': [{'word': 'Route',     'def': 'Path'},          {'word': 'Rout',      'def': 'Defeat'}]},
    {'group': 40, 'pairs': [{'word': 'Rigorous',  'def': 'Severe, Rigid'}, {'word': 'Vigorous',  'def': 'Energetic'}]},
    {'group': 41, 'pairs': [{'word': 'Sheer',     'def': 'Absolute'},      {'word': 'Shear',     'def': 'Shave/Trim'}]},
    {'group': 42, 'pairs': [{'word': 'Vassal',    'def': 'Pauper'},        {'word': 'Vessel',    'def': 'Utensil'}]},
    {'group': 43, 'pairs': [{'word': 'Venal',     'def': 'Evil'},          {'word': 'Venial',    'def': 'Forgivable'}]},
    {'group': 44, 'pairs': [{'word': 'Willing',   'def': 'Wanting, to want'}, {'word': 'Wilful', 'def': 'Stubborn'}]},
    {'group': 45, 'pairs': [{'word': 'Potable',   'def': 'Drinkable'},     {'word': 'Portable',  'def': 'Movable'}]},
    {'group': 46, 'pairs': [{'word': 'Prescribe', 'def': 'To recommend'},  {'word': 'Proscribe', 'def': 'To prohibit'}]},
    {'group': 47, 'pairs': [{'word': 'Funeral',   'def': 'Burial'},        {'word': 'Funereal',  'def': 'Horrible'}]},
    {'group': 48, 'pairs': [{'word': 'Dissent',   'def': 'Disagree'},      {'word': 'Descent',   'def': 'Collapse, Downwards'}]},
    {'group': 49, 'pairs': [{'word': 'Elicit',    'def': 'To deduce'},     {'word': 'Illicit',   'def': 'Illegal'}]},
    {'group': 50, 'pairs': [{'word': 'Discrete',  'def': 'Distinct, clear'}, {'word': 'Discreet', 'def': 'Prudent'}]},
    {'group': 51, 'pairs': [{'word': 'Disinterested', 'def': 'Impartial'}, {'word': 'Uninterested', 'def': 'Boring'}]},
    {'group': 52, 'pairs': [
      {'word': 'Forbear',    'def': 'Refrain from'},
      {'word': 'Forebear',   'def': 'Ancestors'},
      {'word': 'Forerunner', 'def': 'Ancestors'},
    ]},
    {'group': 53, 'pairs': [{'word': 'Corps',  'def': 'Military Branch'}, {'word': 'Corpse', 'def': 'Dead body'}]},
    {'group': 54, 'pairs': [
      {'word': 'Tear', 'def': 'Water drops coming out of eyes'},
      {'word': 'Tier', 'def': 'Standard'},
    ]},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // MOTIVATIONAL QUOTES
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> motivationalQuotes = [
    {'english': 'When I dare to be powerful - to use my strength in the service of my vision, then it becomes less and less important whether I am afraid.', 'author': ''},
    {'english': 'If you genuinely want something, don\'t wait for it -- teach yourself to be impatient.', 'author': ''},
    {'english': 'Your efforts today make your tomorrow, so make your every today count.', 'author': ''},
    {'english': 'If you want to make a permanent change, stop focusing on the size of your problems and start focusing on the size of you.', 'author': ''},
    {'english': 'The greatest mistake you can make in life is to be afraid you will make a mistake.', 'author': ''},
    {'english': 'If you do what you always did, you will get what you always got.', 'author': ''},
    {'english': 'All what we are, is the result of what we have thought.', 'author': ''},
    {'english': 'Great minds discuss ideas; average minds discuss events; small minds discuss people.', 'author': ''},
    {'english': 'To be a great champion you must believe you are the best. If you\'re not, pretend you are.', 'author': 'Muhammad Ali'},
    {'english': 'Life is 10% what happens to me and 90% of how I react to it.', 'author': ''},
    {'english': 'What seems to us as bitter trials are often blessings in disguise.', 'author': ''},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> ex1AQuestions = [
    QuizQuestion(
      questionEn: '"Cast" vs "Caste" — which means "जाति"?',
      questionHi: '"Cast" और "Caste" में से "जाति" किसका अर्थ है?',
      options: ['Cast', 'Caste', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Caste" = जाति। "Cast" = किसी नाटक/फिल्म के पात्रों की सूची।',
    ),
    QuizQuestion(
      questionEn: '"Storey" means ___.',
      questionHi: '"Storey" का अर्थ?',
      options: ['कहानी', 'मंजिल (इमारत की)', 'मीठा', 'होटल का कमरा'],
      correctIndex: 1,
      explanation: '"Storey" = मंजिल (horizontal division of building)। "Story" = कहानी।',
    ),
    QuizQuestion(
      questionEn: '"Currant" vs "Current" — which is किशमिश?',
      questionHi: 'किशमिश के लिए सही spelling?',
      options: ['Current', 'Currant', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Currant" = किशमिश। "Current" = नदी की धारा / वर्तमान।',
    ),
    QuizQuestion(
      questionEn: '"Testy" means ___.',
      questionHi: '"Testy" का अर्थ?',
      options: ['स्वादिष्ट', 'गुस्सैल (Short tempered)', 'परीक्षा', 'मीठा'],
      correctIndex: 1,
      explanation: '"Testy" = गुस्सैल। "Tasty" = स्वादिष्ट।',
    ),
    QuizQuestion(
      questionEn: '"Lightning" means ___.',
      questionHi: '"Lightning" का अर्थ?',
      options: ['रोशनी', 'आकाश में बिजली का चमकना', 'तेज़ रफ्तार', 'बिजली का तार'],
      correctIndex: 1,
      explanation: '"Lightning" = आकाश में बिजली का चमकना। "Lightening" = रोशनी।',
    ),
    QuizQuestion(
      questionEn: '"Weak" vs "Week" — which means "सप्ताह"?',
      questionHi: '"सप्ताह" के लिए सही शब्द?',
      options: ['Weak', 'Week', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Week" = सप्ताह। "Weak" = कमजोर।',
    ),
    QuizQuestion(
      questionEn: '"Shoulder" vs "Soldier" — which means "सिपाही"?',
      questionHi: '"सिपाही" के लिए सही शब्द?',
      options: ['Shoulder', 'Soldier', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Soldier" = सिपाही। "Shoulder" = कंधा।',
    ),
    QuizQuestion(
      questionEn: '"Close" has two pronunciations. "क्लोज़" means ___.',
      questionHi: '"Close" (क्लोज़) का अर्थ?',
      options: ['खास, करीबी', 'बन्द करना', 'दूर', 'खोलना'],
      correctIndex: 1,
      explanation: '"Close" (क्लोज़) = बन्द करना। "Close" (क्लोस) = खास, करीबी।',
    ),
  ];

  static const List<QuizQuestion> ex1BQuestions = [
    QuizQuestion(
      questionEn: '"There" vs "Their" — which means "उनका"?',
      questionHi: '"उनका" के लिए सही शब्द?',
      options: ['There', 'Their', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Their" = उनका। "There" = वहाँ।',
    ),
    QuizQuestion(
      questionEn: '"Whether" vs "Weather" — which means "मौसम"?',
      questionHi: '"मौसम" के लिए सही शब्द?',
      options: ['Whether', 'Weather', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Weather" = मौसम। "Whether" = चाहे।',
    ),
    QuizQuestion(
      questionEn: '"Heart" vs "Hurt" — which means "दिल"?',
      questionHi: '"दिल" के लिए सही शब्द?',
      options: ['Hurt', 'Heart', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Heart" = दिल। "Hurt" = चोट पहुँचाना।',
    ),
    QuizQuestion(
      questionEn: '"Waist" means ___.',
      questionHi: '"Waist" का अर्थ?',
      options: ['बेकार', 'पश्चिम दिशा', 'कमर', 'बर्बाद करना'],
      correctIndex: 2,
      explanation: '"Waist" = कमर। "Waste" = बेकार। "West" = पश्चिम।',
    ),
    QuizQuestion(
      questionEn: '"Heel" vs "Heal" — which means "ज़ख्म भरना"?',
      questionHi: '"ज़ख्म भरना" के लिए सही शब्द?',
      options: ['Heel', 'Heal', 'Hell', 'Hail'],
      correctIndex: 1,
      explanation: '"Heal" = ज़ख्म भरना। "Heel" = एड़ी। "Hell" = नरक।',
    ),
    QuizQuestion(
      questionEn: '"Latter" means ___.',
      questionHi: '"Latter" का अर्थ?',
      options: ['बाद में', 'बाद वाला', 'पत्र', 'देर'],
      correctIndex: 1,
      explanation: '"Latter" = बाद वाला। "Later" = बाद में। "Letter" = पत्र।',
    ),
    QuizQuestion(
      questionEn: '"Heroin" vs "Heroine" — which means "फिल्म की हीरोइन"?',
      questionHi: '"फिल्म की हीरोइन" के लिए सही शब्द?',
      options: ['Heroin', 'Heroine', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Heroine" = फिल्म की हीरोइन। "Heroin" = एक प्रकार का नशीला ड्रग।',
    ),
    QuizQuestion(
      questionEn: '"Deference" vs "Difference" — which means "सम्मान"?',
      questionHi: '"सम्मान" के लिए सही शब्द?',
      options: ['Difference', 'Deference', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Deference" = सम्मान। "Difference" = मनमुटाव, अन्तर।',
    ),
  ];

  static const List<QuizQuestion> ex1CQuestions = [
    QuizQuestion(
      questionEn: '"Break" vs "Brake" — which is "गाड़ियों का ब्रेक"?',
      questionHi: '"गाड़ियों का ब्रेक" के लिए सही शब्द?',
      options: ['Break', 'Brake', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Brake" = गाड़ियों का ब्रेक। "Break" = तोड़ना।',
    ),
    QuizQuestion(
      questionEn: '"Confident" vs "Confidant" — which means "सहायक"?',
      questionHi: '"सहायक" के लिए सही शब्द?',
      options: ['Confident', 'Confidant', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Confidant" = सहायक। "Confident" = विश्वास से भरा हुआ।',
    ),
    QuizQuestion(
      questionEn: '"Goggles" means ___.',
      questionHi: '"Goggles" का अर्थ?',
      options: ['इन्टरनेट सर्च इंजन', 'चश्मा', 'मुर्गी का बच्चा', 'गाल'],
      correctIndex: 1,
      explanation: '"Goggles" = चश्मा। "Google" = इन्टरनेट का एक सर्च इंजन।',
    ),
    QuizQuestion(
      questionEn: '"Sweat" means ___.',
      questionHi: '"Sweat" का अर्थ?',
      options: ['मीठा', 'पसीना', 'होटल का कमरा', 'सूट'],
      correctIndex: 1,
      explanation: '"Sweat" = पसीना। "Sweet" = मीठा।',
    ),
    QuizQuestion(
      questionEn: '"Fist" vs "Feast" — which means "दावत"?',
      questionHi: '"दावत" के लिए सही शब्द?',
      options: ['Fist', 'Feast', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Feast" = दावत। "Fist" = मुठ्ठी।',
    ),
    QuizQuestion(
      questionEn: '"Wile" means ___.',
      questionHi: '"Wile" का अर्थ?',
      options: ['Cruel', 'To deceive', 'To write', 'Artist'],
      correctIndex: 1,
      explanation: '"Wile" = To deceive। "Vile" = Cruel।',
    ),
    QuizQuestion(
      questionEn: '"Sculpture" vs "Sculptor" — which means "Artist"?',
      questionHi: '"Artist" के लिए सही शब्द?',
      options: ['Sculpture', 'Sculptor', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Sculptor" = Artist। "Sculpture" = Art।',
    ),
    QuizQuestion(
      questionEn: '"Aloft" means ___.',
      questionHi: '"Aloft" का अर्थ?',
      options: ['To the left side', 'Above', 'Below', 'Forward'],
      correctIndex: 1,
      explanation: '"Aloft" = Above। "Aleft" = To the left side।',
    ),
  ];

  static const List<QuizQuestion> ex2Questions = [
    QuizQuestion(
      questionEn: '"Assent" means ___.',
      questionHi: '"Assent" का अर्थ?',
      options: ['Climb up', 'To agree', 'Bundle', 'Security'],
      correctIndex: 1,
      explanation: '"Assent" = To agree। "Ascent" = Climb up।',
    ),
    QuizQuestion(
      questionEn: '"Amicable" means ___.',
      questionHi: '"Amicable" का अर्थ?',
      options: ['Lovable', 'Friendly', 'Immature', 'Innocent'],
      correctIndex: 1,
      explanation: '"Amicable" = Friendly। "Amiable" = Lovable।',
    ),
    QuizQuestion(
      questionEn: '"Elicit" vs "Illicit" — which means "Illegal"?',
      questionHi: '"Illegal" के लिए सही शब्द?',
      options: ['Elicit', 'Illicit', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Illicit" = Illegal। "Elicit" = To deduce।',
    ),
    QuizQuestion(
      questionEn: '"Discreet" means ___.',
      questionHi: '"Discreet" का अर्थ?',
      options: ['Distinct, clear', 'Prudent', 'Impartial', 'Boring'],
      correctIndex: 1,
      explanation: '"Discreet" = Prudent। "Discrete" = Distinct, clear।',
    ),
    QuizQuestion(
      questionEn: '"Ghastly" vs "Ghostly" — which means "Related to ghosts"?',
      questionHi: '"Related to ghosts" के लिए सही शब्द?',
      options: ['Ghastly', 'Ghostly', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Ghostly" = Related to ghosts। "Ghastly" = Horrible।',
    ),
    QuizQuestion(
      questionEn: '"Vocation" means ___.',
      questionHi: '"Vocation" का अर्थ?',
      options: ['Holiday', 'Profession', 'Cultured', 'Belong to town'],
      correctIndex: 1,
      explanation: '"Vocation" = Profession। "Vacation" = Holiday।',
    ),
    QuizQuestion(
      questionEn: '"Prosecute" vs "Persecute" — which means "To harass"?',
      questionHi: '"To harass" के लिए सही शब्द?',
      options: ['Prosecute', 'Persecute', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Persecute" = To harass। "Prosecute" = To sue।',
    ),
    QuizQuestion(
      questionEn: '"Corpse" means ___.',
      questionHi: '"Corpse" का अर्थ?',
      options: ['Military Branch', 'Dead body', 'Burial', 'Horrible'],
      correctIndex: 1,
      explanation: '"Corpse" = Dead body। "Corps" = Military Branch।',
    ),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: '"Caste" means ___.',
      questionHi: '"Caste" का अर्थ?',
      options: ['पात्रों की सूची', 'जाति', 'कहानी', 'मंजिल'],
      correctIndex: 1,
      explanation: '"Caste" = जाति। "Cast" = list of characters।',
    ),
    QuizQuestion(
      questionEn: '"Testy" vs "Tasty" — which is "Short tempered"?',
      questionHi: '"Short tempered" के लिए सही शब्द?',
      options: ['Tasty', 'Testy', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Testy" = Short tempered (गुस्सैल)। "Tasty" = Good in taste।',
    ),
    QuizQuestion(
      questionEn: '"Soldier" means ___.',
      questionHi: '"Soldier" का अर्थ?',
      options: ['कंधा', 'सिपाही', 'पहाड़', 'लोग'],
      correctIndex: 1,
      explanation: '"Soldier" = सिपाही। "Shoulder" = कंधा।',
    ),
    QuizQuestion(
      questionEn: '"Weather" means ___.',
      questionHi: '"Weather" का अर्थ?',
      options: ['चाहे', 'मौसम', 'वर्तमान', 'साप्ताहिक'],
      correctIndex: 1,
      explanation: '"Weather" = मौसम। "Whether" = चाहे।',
    ),
    QuizQuestion(
      questionEn: '"Heal" means ___.',
      questionHi: '"Heal" का अर्थ?',
      options: ['एड़ी', 'ज़ख्म भरना', 'नरक', 'ओले पड़ना'],
      correctIndex: 1,
      explanation: '"Heal" = ज़ख्म भरना। "Heel" = एड़ी। "Hell" = नरक।',
    ),
    QuizQuestion(
      questionEn: '"Heroine" means ___.',
      questionHi: '"Heroine" का अर्थ?',
      options: ['नशीला ड्रग', 'फिल्म की हीरोइन', 'चश्मा', 'सहायक'],
      correctIndex: 1,
      explanation: '"Heroine" = फिल्म की हीरोइन। "Heroin" = नशीला ड्रग।',
    ),
    QuizQuestion(
      questionEn: '"Illicit" means ___.',
      questionHi: '"Illicit" का अर्थ?',
      options: ['To deduce', 'Illegal', 'Prudent', 'Distinct'],
      correctIndex: 1,
      explanation: '"Illicit" = Illegal। "Elicit" = To deduce।',
    ),
    QuizQuestion(
      questionEn: '"Vocation" vs "Vacation" — which means "Profession"?',
      questionHi: '"Profession" के लिए सही शब्द?',
      options: ['Vacation', 'Vocation', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Vocation" = Profession। "Vacation" = Holiday।',
    ),
    QuizQuestion(
      questionEn: '"Corpse" vs "Corps" — which means "Dead body"?',
      questionHi: '"Dead body" के लिए सही शब्द?',
      options: ['Corps', 'Corpse', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Corpse" = Dead body। "Corps" = Military Branch।',
    ),
    QuizQuestion(
      questionEn: '"Sculptor" vs "Sculpture" — which means "Art"?',
      questionHi: '"Art" के लिए सही शब्द?',
      options: ['Sculptor', 'Sculpture', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: '"Sculpture" = Art। "Sculptor" = Artist।',
    ),
  ];
}