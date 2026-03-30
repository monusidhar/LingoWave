import '../models/lesson_model.dart';

/// Chapter 39 — Mixed Test Papers (मिश्रित टेस्ट पेपर)
class Chapter39Data {

  static ChapterModel get chapter => ChapterModel(
        id: 39,
        title: 'Mixed Test Papers',
        titleHindi: 'मिश्रित टेस्ट पेपर',
        description: 'Tests I–IV: Translation, Correction, Spelling & Vocabulary',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Mixed Test — I', titleHindi: 'टेस्ट I: अनुवाद & सुधार', emoji: '📝', type: LessonType.ch39Test1, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Mixed Test — II', titleHindi: 'टेस्ट II: वर्तनी & सुधार', emoji: '🔤', type: LessonType.ch39Test2, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'Mixed Test — III', titleHindi: 'टेस्ट III: Tense & क्रिया रूप', emoji: '⏱️', type: LessonType.ch39Test3, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Mixed Test — IV', titleHindi: 'टेस्ट IV: अनुवाद & शब्दार्थ', emoji: '📖', type: LessonType.ch39Test4, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch39ChapterQuiz, status: LessonStatus.inProgress, totalXP: 100),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch39Test1:        return test1Questions;
      case LessonType.ch39Test2:        return test2Questions;
      case LessonType.ch39Test3:        return test3Questions;
      case LessonType.ch39Test4:        return test4Questions;
      case LessonType.ch39ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // TEST I — Q1: Hindi → English Translation (30 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> test1Translations = [
    {'hi': 'मैं कई लोगों के बीच बैठा था।',                                          'en': 'I was sitting among many people.'},
    {'hi': 'बंदर पेड़ से कूदा।',                                                     'en': 'The monkey jumped off the tree.'},
    {'hi': 'राम को मुझसे मिलवाया जायेगा।',                                           'en': 'Ram will be made meet me.'},
    {'hi': 'मुझे भिजवाया गया।',                                                      'en': 'I was made go.'},
    {'hi': 'मुझे रोज सिखाया जाता था।',                                               'en': 'I used to be taught daily.'},
    {'hi': 'मैं पूछ रहा हूँ कि तुम कौन हो।',                                         'en': 'I am asking who you are.'},
    {'hi': 'अगर मैं ठीक होता, तो हम साथ खेलते।',                                     'en': 'If I was fit, we would play together.'},
    {'hi': 'मैं सुबह से यहाँ हूँ।',                                                   'en': 'I have been here since morning.'},
    {'hi': 'किताब तकिये के नीचे थी।',                                                 'en': 'The book was under the pillow.'},
    {'hi': 'राम को खेलने नहीं दिया गया।',                                             'en': 'Ram was not let play.'},
    {'hi': 'मुझे समझाया जा रहा था।',                                                  'en': 'I was being made understand.'},
    {'hi': 'ये तुम्हें मैं कैसे बताऊँ कि तुम मेरे लिए क्या मायने रखते हो?',          'en': 'How can I tell you, what you mean to me?'},
    {'hi': 'उसकी हरकतों से लगता है कि वो अभी भी बच्चा है।',                          'en': 'His actions show that he is still a child.'},
    {'hi': 'ये सुनने में अच्छा लगता है पर कर के देखो, मजाक नहीं है।',               'en': "It sounds good but try doing it, it's not a joke."},
    {'hi': 'वक्त ने तुम्हारी यादों को धुंधला कर दिया था।',                           'en': 'Time had faded your memories.'},
    {'hi': 'उसने तुम्हें धोखा दिया, तुम उसे अब भी चाहते हो?',                       'en': 'He cheated you, do you still love him?'},
    {'hi': 'इतना आसान नहीं होता।',                                                   'en': 'It is not that easy.'},
    {'hi': 'सोचने की बात ये है कि हम ये करेंगे कैसे?',                               'en': 'The point of thinking is, how will we do this?'},
    {'hi': 'तुम मेरी मजबूरी का फायदा उठा रहे हो।',                                   'en': 'You are taking advantage of my helplessness.'},
    {'hi': 'ऐसा करना किसी पाप से कम नहीं है।',                                       'en': 'Doing this is nothing less than a sin.'},
    {'hi': 'बार-बार बुलाकर उसका समय खराब मत करो।',                                   'en': 'Don\'t waste his time by calling him again and again.'},
    {'hi': 'अपने आप को ज्यादा चालाक समझने की गलती मत करो।',                         'en': 'Don\'t make the mistake of considering yourself too clever.'},
    {'hi': 'क्या पता कब मेरी किस्मत बदल जाये!',                                      'en': 'Who knows when my luck changes!'},
    {'hi': 'बेकार की बातें करने से कोई फायदा नहीं।',                                  'en': 'Talking nonsense is of no use.'},
    {'hi': 'ऐसा सोचना बिल्कुल बेकार है।',                                            'en': 'Thinking like this is totally useless.'},
    {'hi': 'मैं ये सब करके छोड़ चुका हूँ जो तुम अब कर रहे हो।',                     'en': 'I have already done all that you are doing now.'},
    {'hi': 'यही तो किताब है जो मैंने तुम्हें दी थी।',                                 'en': 'This is the very book that I had given you.'},
    {'hi': 'हम वो हैं जो दुनिया जीत सकते हैं।',                                      'en': 'We are the ones who can win the world.'},
    {'hi': 'उसकी हालत देखकर मैं अपने आँसू नहीं रोक पाया।',                          'en': 'Seeing his condition, I couldn\'t hold my tears.'},
    {'hi': 'मेरे सारे दोस्त वहीं पर थे।',                                             'en': 'All my friends were there.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST I — Q2: Sentence Correction (20 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> test1Corrections = [
    {'original': 'He as well as his friends is good.',           'correct': true,  'corrected': '',                                                   'rule': '"as well as" — verb agrees with first subject (He → is). Correct!'},
    {'original': 'The Director & Producer is dead.',             'correct': true,  'corrected': '',                                                   'rule': '"The Director & Producer" refers to the same person → singular verb "is". Correct!'},
    {'original': 'A Mr. Ram is sitting outside and waiting.',    'correct': true,  'corrected': '',                                                   'rule': '"A Mr. Ram" implies a person named Ram, not a specific known Ram. Correct!'},
    {'original': 'I took the mobile from the table.',            'correct': false, 'corrected': 'I took the mobile off the table.',                    'rule': 'Use "off" when something is taken from a surface, not "from".'},
    {'original': 'The Table, which is my favourite is expensive.','correct': false, 'corrected': 'The Table which is my favourite is expensive.',       'rule': 'No comma before restrictive (defining) relative clauses.'},
    {'original': 'You, he & I are to blame.',                   'correct': false, 'corrected': 'I, you & he are to blame.',                           'rule': 'For blame/fault: I comes first — "I, you & he".'},
    {'original': 'You, he & I are doing a good job.',           'correct': true,  'corrected': '',                                                   'rule': 'For praise/credit: others first — "You, he & I". Correct!'},
    {'original': 'He along with the members of his team has seen the Taj.', 'correct': true, 'corrected': '', 'rule': '"along with" — verb agrees with first subject (He → has). Correct!'},
    {'original': 'If he will come, he will scold you.',         'correct': false, 'corrected': 'If he comes, he will scold you.',                     'rule': 'After "if", use Simple Present, not Future tense.'},
    {'original': 'He is older than me.',                        'correct': false, 'corrected': 'He is older than I.',                                 'rule': 'After "than" in comparisons, use Subject pronoun (I, he, she), not Object (me).'},
    {'original': 'I will see whether he is there.',             'correct': false, 'corrected': 'I will see if he is there.',                          'rule': '"Whether" is for two alternatives. "If" is used for conditions. Use "if" here.'},
    {'original': 'He is 3 years younger than me.',              'correct': false, 'corrected': 'He is 3 years younger to me.',                        'rule': 'With "junior/younger/senior/older", use "to" not "than".'},
    {'original': 'Even if he will go, I don\'t care.',          'correct': false, 'corrected': 'Even if he goes, I don\'t care.',                     'rule': 'After "even if", use Simple Present, not Future tense.'},
    {'original': 'I am here for 3 days.',                       'correct': false, 'corrected': 'I have been here for 3 days.',                        'rule': 'For time duration up to now, use Present Perfect Continuous or "have been".'},
    {'original': 'The moment he come, baby starts weeping.',    'correct': false, 'corrected': 'The moment he comes, baby starts weeping.',            'rule': 'Subject "he" needs "comes" (third person singular).'},
    {'original': 'You looks tired today.',                      'correct': false, 'corrected': 'You look tired today.',                               'rule': '"You" always takes base verb without "s" — "look", not "looks".'},
    {'original': 'Because you are my friend, I will help you.', 'correct': false, 'corrected': 'Since/As you are my friend, I will help you.',        'rule': '"Because" answers "why?" — use "since/as" for reason-at-start sentences.'},
    {'original': 'I have got 3 hairs on my head.',              'correct': true,  'corrected': '',                                                   'rule': '"Hairs" (countable) is correct when referring to individual strands. Correct!'},
    {'original': 'He was used to my anger.',                    'correct': true,  'corrected': '',                                                   'rule': '"used to" here means "accustomed to" — correct usage. Correct!'},
    {'original': 'He hide behind the wall.',                    'correct': false, 'corrected': 'He hides behind the wall. / He hid behind the wall.', 'rule': 'Present: "hides" (3rd person). Past: "hid" (V2 of hide).'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST II — Q1: Spelling (5 items)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> test2Spellings = [
    {'options': ['Grammar', 'Grammer', 'Grammar', 'Gremmer'],       'correctIndex': 0, 'word': 'Grammar'},
    {'options': ['Tommorrow', 'Tomorrow', 'Tommorow', 'Tomorrow'],  'correctIndex': 1, 'word': 'Tomorrow'},
    {'options': ['Parhaps', 'Perheps', 'Perhaps', 'Parheps'],       'correctIndex': 2, 'word': 'Perhaps'},
    {'options': ['Pronounciation', 'proununciation', 'Pronunciation', 'Prununciation'], 'correctIndex': 2, 'word': 'Pronunciation'},
    {'options': ['Calendar', 'Calendir', 'Calander', 'Celender'],   'correctIndex': 0, 'word': 'Calendar'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST II — Q2: Correct/Incorrect (15 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> test2SentenceCheck = [
    {'original': 'I am working ever since you went out.',                   'correct': false, 'corrected': 'I have been working ever since you went out.',                              'rule': 'For ongoing action from a past point → Present Perfect Continuous.'},
    {'original': 'He is not such person who can fight till the end.',       'correct': false, 'corrected': 'He is not such a person who can fight till the end.',                      'rule': '"such" must be followed by article "a/an" before a singular noun.'},
    {'original': 'My parents got me written a letter.',                     'correct': false, 'corrected': 'My parents made me write a letter. / My parents got a letter written by me.', 'rule': 'GET + object + V3 OR MAKE + object + V1. Not "got me written".'},
    {'original': 'He keep on calling me fool.',                             'correct': false, 'corrected': 'He keeps on calling me fool.',                                            'rule': '"He" (3rd person singular) → "keeps".'},
    {'original': 'He gets up early in the morning.',                        'correct': true,  'corrected': '',                                                                         'rule': 'Correct! Simple Present for daily habit.'},
    {'original': 'His awkward behavior suggests me that he is not social.', 'correct': true,  'corrected': '',                                                                         'rule': 'Correct! "suggests me" is acceptable here.'},
    {'original': 'None of Ram & Shyam is my friend.',                       'correct': true,  'corrected': '',                                                                         'rule': 'Correct! "None of" + two persons → singular verb.'},
    {'original': 'Did you not tell him something?',                         'correct': false, 'corrected': 'Did you not tell him anything?',                                          'rule': 'In negative/interrogative sentences, use "anything" not "something".'},
    {'original': "I don't like burger too.",                                'correct': false, 'corrected': "I don't like burger either.",                                             'rule': 'In negative sentences, use "either" not "too".'},
    {'original': "People don't like me much.",                              'correct': true,  'corrected': '',                                                                         'rule': 'Correct! "much" used correctly in negative sentence.'},
    {'original': 'Rain has started.',                                        'correct': false, 'corrected': 'It has started raining.',                                                 'rule': '"Rain" as weather uses impersonal "It". Correct form: "It has started raining."'},
    {'original': 'Today is my birthday.',                                    'correct': false, 'corrected': "It's my birthday today.",                                                 'rule': 'Use "It\'s my birthday today" — impersonal "It" for dates/occasions.'},
    {'original': 'He had told me that he will not go.',                     'correct': false, 'corrected': 'He had told me that he would not go.',                                   'rule': 'Reported speech: past reporting verb → "would" in subordinate clause.'},
    {'original': 'I am going to the school.',                               'correct': false, 'corrected': 'I am going to school.',                                                   'rule': 'No article with "school" when referring to its primary purpose.'},
    {'original': 'The Earth is revolving around Sun.',                      'correct': false, 'corrected': 'The Earth is revolving around the Sun.',                                  'rule': '"the Sun" — unique celestial bodies take "the".'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST II — Q3: English → Hindi Translation (15 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> test2Translations = [
    {'en': 'Your words make it seem like you are really mad.',          'hi': 'तुम्हारी बातों से लगता है कि तुम सचमुच पागल हो।'},
    {'en': 'He got angry.',                                            'hi': 'उसे गुस्सा आ गया।'},
    {'en': 'I was brought home. After that I could sleep.',            'hi': 'मुझे घर लाया गया। उसके बाद मैं सो पाया।'},
    {'en': 'He was told that you would be killed.',                    'hi': 'उसे कहा गया था कि तुम मारे जाओगे।'},
    {'en': 'How can I tell you what you are to me?',                  'hi': 'मैं तुम्हें कैसे बताऊँ कि तुम मेरे क्या हो।'},
    {'en': 'He had made me cry a lot.',                               'hi': 'उसने मुझे बहुत रुलाया था।'},
    {'en': 'I am the one who never lost.',                            'hi': 'मैं वो हूँ जो कभी नहीं हारा।'},
    {'en': 'Why did he let me go?',                                   'hi': 'उसने मुझे क्यों जाने दिया?'},
    {'en': 'When he was there, you were not.',                        'hi': 'जब वो था, तुम नहीं थे।'},
    {'en': 'It took me many years to talk to him.',                   'hi': 'मुझे उससे बात करने में कई साल लगे।'},
    {'en': 'Many years have passed.',                                  'hi': 'कई साल हो गये हैं।'},
    {'en': 'The one who loved me is no longer in this world.',        'hi': 'जिसने मुझे चाहा वो अब इस दुनिया में नहीं है।'},
    {'en': "It's raining, isn't it?",                                 'hi': 'बारिश हो रही है, है ना?'},
    {'en': 'He will come in a day or so.',                            'hi': 'वो एकाद दिन में आ जायेगा।'},
    {'en': 'No matter how much you study, you cannot pass.',          'hi': 'चाहे तुम जितना पढ़ लो, पास नहीं हो सकते।'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST III — Q1: Tense Corrections (10 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> test3Corrections = [
    {'original': 'He do not has a pen.',                    'corrected': 'He does not have a pen.',              'rule': '3rd person singular → "does not have".'},
    {'original': 'Does people have computers?',             'corrected': 'Do people have computers?',            'rule': '"People" is plural → "Do", not "Does".'},
    {'original': 'Why does you not do this?',               'corrected': 'Why do you not do this?',              'rule': '"You" → "do", not "does".'},
    {'original': "It don't sound good to me.",              'corrected': "It doesn't sound good to me.",         'rule': '"It" (3rd person singular) → "doesn\'t".'},
    {'original': "Why doesn't we work together?",           'corrected': "Why don't we work together?",          'rule': '"We" → "don\'t", not "doesn\'t".'},
    {'original': 'Ram and Shyam works together.',           'corrected': 'Ram and Shyam work together.',         'rule': 'Two subjects joined by "and" → plural verb "work".'},
    {'original': 'Those peoples are doing something.',      'corrected': 'Those people are doing something.',    'rule': '"People" is already plural. "Peoples" is wrong.'},
    {'original': "My brother's friend have not come.",      'corrected': "My brother's friend has not come.",    'rule': 'Singular subject "friend" → "has not come".'},
    {'original': 'My brother has been studying for 2 pm.', 'corrected': 'My brother has been studying since 2 pm.', 'rule': 'Specific time point → "since". Duration → "for".'},
    {'original': 'I have saw off my mother.',               'corrected': 'I have seen off my mother.',           'rule': '"seen" is V3 of "see". "saw" is V2, not V3.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST III — Q2: Hindi → English (10 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> test3Translations = [
    {'hi': 'मैं तुम्हारे बारे में क्यों नहीं सोचता हूँ?',                    'en': 'Why do I not think about you?'},
    {'hi': 'राम और आदित्य किस ऑफिस से आ रहे हैं?',                           'en': 'From which office are Ram & Aditya coming?'},
    {'hi': 'वो आदमी तुम्हें धमकी कैसे देता है?',                              'en': 'How does that man threaten you?'},
    {'hi': 'यह सुनने में अच्छा लग रहा है पर मेरा दिल खुश नहीं है।',          'en': 'It is sounding good but my heart is not happy.'},
    {'hi': 'क्या तुम सबने उसके कदमों की आवाज सुनी है?',                      'en': 'Have you all heard his footfall?'},
    {'hi': 'सीता भगवान की पूजा कब से कर रही है?',                            'en': 'Since when has Seeta been worshiping God?'},
    {'hi': 'मैं ऑफिस के अन्दर पहले ही अच्छी तरह से देख चुका हूँ।',          'en': 'I have already seen properly inside the office.'},
    {'hi': 'तुम कब तक ऑफिस में रहते हो?',                                    'en': 'Until when do you stay in office?'},
    {'hi': 'वो इस जनवरी से किस कम्पनी के लिए गाना गा रहा है?',              'en': 'For which company has he been singing since this January?'},
    {'hi': 'मैं 2 घंटे से ठंड से कांप रहा हूँ।',                             'en': 'I have been shivering with cold for 2 hours.'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST III — Q3 & Q4: Verb Forms (10 verbs)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> test3VerbForms = [
    {'hindi': 'खिलाना',       'v1': 'Feed',   'v2': 'Fed',     'v3': 'Fed'},
    {'hindi': 'शुरू करना',    'v1': 'Begin',  'v2': 'Began',   'v3': 'Begun'},
    {'hindi': 'चोट पहुँचाना', 'v1': 'Hurt',   'v2': 'Hurt',    'v3': 'Hurt'},
    {'hindi': 'पकड़ना',        'v1': 'Hold',   'v2': 'Held',    'v3': 'Held'},
    {'hindi': 'छिपना',        'v1': 'Hide',   'v2': 'Hid',     'v3': 'Hidden'},
    {'hindi': 'ढूँढना',        'v1': 'Seek',   'v2': 'Sought',  'v3': 'Sought'},
    {'hindi': 'दौड़ना',        'v1': 'Run',    'v2': 'Ran',     'v3': 'Run'},
    {'hindi': 'आना',          'v1': 'Come',   'v2': 'Came',    'v3': 'Come'},
    {'hindi': 'लाना',         'v1': 'Bring',  'v2': 'Brought', 'v3': 'Brought'},
    {'hindi': '2-wheeler चलाना','v1': 'Ride',  'v2': 'Rode',    'v3': 'Ridden'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST IV — Q1: Hindi → English (30 sentences)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> test4Translations = [
    {'hi': 'बाहर ओले पड़ रहे हैं।',                                           'en': "It's hailing outside.",                                         'marks': 1},
    {'hi': 'ये कुछ और नहीं मेरा प्यार है।',                                   'en': "It's nothing but my love.",                                     'marks': 1},
    {'hi': 'माँ ने हमें पाला।',                                               'en': 'Mother bred us.',                                               'marks': 1},
    {'hi': 'ये रोड कहाँ जाती है?',                                            'en': 'Where does this road lead to?',                                 'marks': 1},
    {'hi': 'वो पैसा मेरे किसी काम का नहीं।',                                  'en': 'That money is of no use to me.',                                'marks': 1},
    {'hi': 'राम यहीं पर था।',                                                 'en': 'Ram was very much here.',                                       'marks': 1},
    {'hi': 'आखिरकार शादी के शुभ दिन की घोषणा हो चुकी है।',                   'en': 'Finally, auspicious date of marriage is announced.',            'marks': 1},
    {'hi': 'ध्यान रखना तुम्हें मेरे घर आना है।',                              'en': 'Keep in mind, you have to come to my home.',                   'marks': 1},
    {'hi': 'मैं कोई कसर नहीं छोड़ूँगा।',                                     'en': "I'll not leave any stone unturned.",                            'marks': 1},
    {'hi': 'मुझे कई साल लगे उसे भूलने में।',                                  'en': 'It took me many years to forget her.',                         'marks': 1},
    {'hi': 'चाहे कोई कुछ भी कहे मैं तुम्हारा साथ दूँगा।',                    'en': "Irrespective of what anyone says, I'll stand by you.",          'marks': 2},
    {'hi': 'दहेज प्रथा एक अभिशाप है।',                                        'en': 'Dowry system is a malediction.',                                'marks': 2},
    {'hi': 'महंगाई भ्रष्टाचार को जन्म देती है।',                              'en': 'Inflation breeds corruption.',                                  'marks': 2},
    {'hi': 'जिनकी उंगली पकड़कर तुमने चलना सीखा उन्हें कभी गिरने मत देना।', 'en': 'One whose fingers you resorted to toddle, don\'t let him ever down.', 'marks': 2},
    {'hi': 'उसने साफ मना कर दिया।',                                           'en': 'He refused point blank.',                                       'marks': 2},
    {'hi': 'तुम क्या शर्त रखना चाहते हो?',                                    'en': 'What condition do you want to lay?',                            'marks': 2},
    {'hi': 'हिन्दू मरे हुए को जलाते हैं और मुस्लिम दफनाते हैं।',             'en': 'Hindus burn the dead bodies and Muslims bury.',                 'marks': 2},
    {'hi': 'मैं अपनी सफलता का श्रेय तुम्हें देता हूँ।',                      'en': 'I ascribe my success to you.',                                  'marks': 2},
    {'hi': 'आग बुझा दो ऐसा न हो कि फैल जाए।',                               'en': 'Put out the fire lest it should spread out.',                   'marks': 2},
    {'hi': 'उस साजिश का पर्दाफाश करूँगा।',                                   'en': "I'll unearth that conspiracy.",                                 'marks': 2},
    {'hi': 'आसपास ही रहना, मैं बस अभी आ रहा हूँ।',                           'en': 'Stick around, I am just coming.',                               'marks': 3},
    {'hi': 'सचिन का आउट होना एक जबरदस्त झटका है।',                           'en': "Sachin's departure is a big blow.",                             'marks': 3},
    {'hi': 'अच्छा हुआ तुम आ गये, मैं बस अभी निकल गया होता।',               'en': 'Thank God you dropped in, I would have just left.',             'marks': 3},
    {'hi': 'मुझे भोला-भाला समझने की गलती मत कर, पछताएगा।',                  'en': "Don't mistake me for a credulous, you would regret.",           'marks': 3},
    {'hi': 'एक कहावत है, "नफरत पाप से करो पापी से नहीं।"',                  'en': 'There is a saying, "Hate sin, not a sinner."',                  'marks': 3},
    {'hi': 'जिम्मेदारी से भागना लगता है तुम्हारे खून में है।',                'en': 'To shirk responsibility seems to be in your blood.',            'marks': 3},
    {'hi': 'मानो सदियों बीत गई हों हमें मिले हुए।',                          'en': 'As if centuries have passed since we met.',                     'marks': 3},
    {'hi': 'जितना मैं सोचूँगा, उतना ही पागल हो जाऊँगा।',                   'en': "Deeper I think, more I'll go mad.",                             'marks': 3},
    {'hi': 'मैंने जानबूझकर कभी तुम्हारा दिल नहीं दुखाया।',                  'en': 'I never hurt you deliberately.',                                'marks': 3},
    {'hi': 'एक बात कहूँ, पास होकर भी बहुत दूर हो तुम।',                    'en': 'You know what, although near, yet afar you are.',               'marks': 3},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // TEST IV — Q2: Word Meanings (40 words)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> test4Vocabulary = [
    {'word': 'Shirk',               'hindi': 'जी चुराना'},
    {'word': 'Shy away',            'hindi': 'दूर भागना'},
    {'word': 'Bury',                'hindi': 'दफनाना'},
    {'word': 'Off hand',            'hindi': 'बिना तैयारी के'},
    {'word': 'Enchant',             'hindi': 'मोहित करना'},
    {'word': 'Fiasco',              'hindi': 'घोर असफलता'},
    {'word': 'Totter',              'hindi': 'लड़खड़ाना'},
    {'word': 'Dacoit',              'hindi': 'डाकू'},
    {'word': 'Abase',               'hindi': 'अपमान करना'},
    {'word': 'Sigh of relief',      'hindi': 'चैन की साँस लेना'},
    {'word': 'Delve',               'hindi': 'गहराई में जाना'},
    {'word': 'Imbibe',              'hindi': 'ग्रहण करना'},
    {'word': 'Lisp',                'hindi': 'तुतलाना'},
    {'word': 'Notorious',           'hindi': 'कुख्यात'},
    {'word': 'Hover',               'hindi': 'मँडराना'},
    {'word': 'Retaliate',           'hindi': 'करारा जवाब देना'},
    {'word': 'Havoc',               'hindi': 'तहलका'},
    {'word': 'Trifles',             'hindi': 'छोटी-मोटी बातें'},
    {'word': 'Indebted',            'hindi': 'कर्जदार'},
    {'word': 'Altogether',          'hindi': 'पूरी तरह से'},
    {'word': 'Instincts',           'hindi': 'प्रवृत्ति'},
    {'word': 'Ascribe',             'hindi': 'श्रेय देना'},
    {'word': 'Thoroughfare',        'hindi': 'आम रास्ता'},
    {'word': 'Mist',                'hindi': 'कोहरा'},
    {'word': 'Fist',                'hindi': 'मुट्ठी'},
    {'word': 'Demise',              'hindi': 'मृत्यु'},
    {'word': 'Lately',              'hindi': 'हाल ही में'},
    {'word': 'Vigilance',           'hindi': 'चौकसी'},
    {'word': 'Fumble',              'hindi': 'टटोलना'},
    {'word': 'Auspicious',          'hindi': 'शुभ'},
    {'word': 'Assess',              'hindi': 'आँकना'},
    {'word': 'Confess',             'hindi': 'गलती मान लेना'},
    {'word': 'Unearth',             'hindi': 'उजागर करना'},
    {'word': 'Malediction',         'hindi': 'अभिशाप'},
    {'word': 'Aloof',               'hindi': 'अलग-थलग'},
    {'word': 'Rip off',             'hindi': 'लूटना'},
    {'word': 'Negligence',          'hindi': 'लापरवाही'},
    {'word': 'Deliberately',        'hindi': 'जानबूझकर'},
    {'word': 'Legislative assembly','hindi': 'विधानसभा'},
    {'word': 'Ointment',            'hindi': 'मलहम / क्रीम'},
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // MOTIVATIONAL QUOTES
  // ══════════════════════════════════════════════════════════════════════════

  static const List<String> motivationalQuotes = [
    'There is only one way to avoid criticism: do nothing, say nothing, and be nothing. So remember, if you are criticized, never be afraid.',
    "You can't make it big unless you try.",
    'Every time you lose, you gain experience.',
    "Unless you try, you can't say whether you'll succeed or not. So go ahead and try your best.",
    'Failure is better teacher than success, because when you fail, you tend to focus more for the next try.',
    'You can never cross the ocean until you have the courage to lose sight of the shore.',
    'The best revenge is massive success.',
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Test 1
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> test1Questions = [
    QuizQuestion(
      questionEn: '"मैं सुबह से यहाँ हूँ।" — correct translation?',
      questionHi: 'सही अनुवाद चुनें:',
      options: ['I am here since morning.', 'I have been here since morning.', 'I was here since morning.', 'I had been here since morning.'],
      correctIndex: 1,
      explanation: 'Present state since a time point → "I have been here since morning."',
    ),
    QuizQuestion(
      questionEn: 'Correct: "I took the mobile from the table."',
      questionHi: 'क्या यह वाक्य सही है?',
      options: ['Yes, it\'s correct.', 'No — "off" the table', 'No — "on" the table', 'No — "at" the table'],
      correctIndex: 1,
      explanation: 'When removing from a surface, use "off" — "I took the mobile off the table."',
    ),
    QuizQuestion(
      questionEn: 'Which pronoun is correct? "He is older than ___."',
      questionHi: 'सही सर्वनाम चुनें:',
      options: ['me', 'I', 'my', 'mine'],
      correctIndex: 1,
      explanation: 'After "than" in comparisons, use subject pronoun → "I", not "me".',
    ),
    QuizQuestion(
      questionEn: '"You, he & I are to blame." — is this correct?',
      questionHi: 'क्या यह वाक्य सही है?',
      options: ['Yes, correct.', 'No — should be "I, you & he"', 'No — should be "He, you & I"', 'No — should be "You & I"'],
      correctIndex: 1,
      explanation: 'For blame/fault: I comes first → "I, you & he are to blame."',
    ),
    QuizQuestion(
      questionEn: 'Correct form: "If he ___ come, he will scold you."',
      questionHi: 'सही form चुनें:',
      options: ['will', 'would', 'comes', 'came'],
      correctIndex: 2,
      explanation: 'After "if", use Simple Present (not future) → "If he comes..."',
    ),
    QuizQuestion(
      questionEn: '"Because you are my friend" — better alternative at sentence start?',
      questionHi: '"Because" की जगह वाक्य के शुरू में?',
      options: ['Although', 'Since / As', 'Until', 'Unless'],
      correctIndex: 1,
      explanation: 'At sentence start, use "Since/As" for reason, not "Because".',
    ),
    QuizQuestion(
      questionEn: '"He is 3 years younger than me." — correction?',
      questionHi: 'सुधार क्या है?',
      options: ['younger than I', 'younger to me', 'younger from me', 'No correction needed'],
      correctIndex: 1,
      explanation: 'With junior/younger/senior, use "to" — "younger to me".',
    ),
    QuizQuestion(
      questionEn: '"I am here for 3 days." — correct form?',
      questionHi: 'सही वाक्य?',
      options: ['I am here since 3 days.', 'I was here for 3 days.', 'I have been here for 3 days.', 'I had been here for 3 days.'],
      correctIndex: 2,
      explanation: 'Duration up to now → Present Perfect → "I have been here for 3 days."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Test 2
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> test2Questions = [
    QuizQuestion(
      questionEn: 'Correct spelling?',
      questionHi: 'सही spelling चुनें:',
      options: ['Pronounciation', 'Pronunciation', 'Pronuncation', 'Proununciation'],
      correctIndex: 1,
      explanation: 'Correct: P-R-O-N-U-N-C-I-A-T-I-O-N. No extra vowel after "Pro".',
    ),
    QuizQuestion(
      questionEn: '"I am working ever since you went out." — correct?',
      questionHi: 'क्या यह सही है?',
      options: ['Yes, correct.', 'No — I have been working ever since...', 'No — I was working ever since...', 'No — I had been working ever since...'],
      correctIndex: 1,
      explanation: 'Ongoing from a past point → Present Perfect Continuous → "I have been working..."',
    ),
    QuizQuestion(
      questionEn: '"I don\'t like burger too." — correction?',
      questionHi: 'सुधार क्या है?',
      options: ['also', 'either', 'neither', 'No correction needed'],
      correctIndex: 1,
      explanation: 'In negative sentences, use "either" not "too" → "I don\'t like burger either."',
    ),
    QuizQuestion(
      questionEn: '"Rain has started." — correct form?',
      questionHi: 'सही वाक्य?',
      options: ['Raining has started.', 'It has started to rain.', 'It has started raining.', 'The rain has started.'],
      correctIndex: 2,
      explanation: 'Weather uses impersonal "It" → "It has started raining."',
    ),
    QuizQuestion(
      questionEn: '"He had told me that he will not go." — correction?',
      questionHi: 'सुधार क्या है?',
      options: ['"will" is correct', 'Change "will" to "would"', 'Change "had told" to "told"', 'No change needed'],
      correctIndex: 1,
      explanation: 'Reported speech with past reporting verb → "would" not "will".',
    ),
    QuizQuestion(
      questionEn: 'Correct spelling?',
      questionHi: 'सही spelling?',
      options: ['Calander', 'Celender', 'Calendir', 'Calendar'],
      correctIndex: 3,
      explanation: 'Correct: C-A-L-E-N-D-A-R. Remember: "cal-en-dar".',
    ),
    QuizQuestion(
      questionEn: '"I am going to the school." — correction?',
      questionHi: 'सुधार क्या है?',
      options: ['Remove "the"', 'Change "to" to "at"', 'Change "am going" to "go"', 'No correction needed'],
      correctIndex: 0,
      explanation: 'No article with "school/hospital/church" when referring to their main purpose → "going to school".',
    ),
    QuizQuestion(
      questionEn: '"He is not such person..." — correction?',
      questionHi: 'सुधार क्या है?',
      options: ['such the person', 'such a person', 'such one person', 'No correction needed'],
      correctIndex: 1,
      explanation: '"Such" + singular noun needs article "a/an" → "such a person".',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Test 3
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> test3Questions = [
    QuizQuestion(
      questionEn: 'V2 and V3 of "Hide"?',
      questionHi: '"Hide" के V2 और V3?',
      options: ['hided – hided', 'hid – hidden', 'hide – hid', 'hid – hid'],
      correctIndex: 1,
      explanation: 'Hide → Hid → Hidden. (Irregular verb)',
    ),
    QuizQuestion(
      questionEn: '"Does people have computers?" — correction?',
      questionHi: 'सुधार?',
      options: ['Does peoples have...', 'Do people have...', 'Do peoples have...', 'No correction needed'],
      correctIndex: 1,
      explanation: '"People" is plural → "Do people have computers?"',
    ),
    QuizQuestion(
      questionEn: 'V2 of "Seek"?',
      questionHi: '"Seek" का V2?',
      options: ['Seeked', 'Sought', 'Sook', 'Seeken'],
      correctIndex: 1,
      explanation: 'Seek → Sought → Sought. (Irregular verb)',
    ),
    QuizQuestion(
      questionEn: '"My brother has been studying for 2 pm." — correction?',
      questionHi: 'सुधार?',
      options: ['studying since 2 pm', 'studying at 2 pm', 'studying from 2 pm', 'No correction needed'],
      correctIndex: 0,
      explanation: 'Specific time point → "since". "For" is used with duration (2 hours).',
    ),
    QuizQuestion(
      questionEn: 'V3 of "Begin"?',
      questionHi: '"Begin" का V3?',
      options: ['Began', 'Begined', 'Begun', 'Begin'],
      correctIndex: 2,
      explanation: 'Begin → Began → Begun. (Irregular verb)',
    ),
    QuizQuestion(
      questionEn: '"Ram and Shyam works together." — correction?',
      questionHi: 'सुधार?',
      options: ['work together', 'is working together', 'worked together', 'No correction needed'],
      correctIndex: 0,
      explanation: 'Two subjects joined by "and" → plural verb → "work together".',
    ),
    QuizQuestion(
      questionEn: '"Those peoples are doing something." — correction?',
      questionHi: 'सुधार?',
      options: ['Those peoples was...', 'Those people are...', 'That peoples are...', 'No correction needed'],
      correctIndex: 1,
      explanation: '"People" is already plural. "Peoples" is incorrect.',
    ),
    QuizQuestion(
      questionEn: 'V2 and V3 of "Bring"?',
      questionHi: '"Bring" के V2 और V3?',
      options: ['brang – brung', 'bringed – bringed', 'brought – brought', 'bring – bringing'],
      correctIndex: 2,
      explanation: 'Bring → Brought → Brought. (Irregular verb)',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Test 4
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> test4Questions = [
    QuizQuestion(
      questionEn: '"बाहर ओले पड़ रहे हैं।" — translation?',
      questionHi: 'सही अनुवाद?',
      options: ["It's raining outside.", "It's snowing outside.", "It's hailing outside.", "It's storming outside."],
      correctIndex: 2,
      explanation: 'ओले = hail. "It\'s hailing outside."',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Malediction"?',
      questionHi: '"Malediction" का अर्थ?',
      options: ['आशीर्वाद', 'अभिशाप', 'घोषणा', 'शुभकामना'],
      correctIndex: 1,
      explanation: '"Malediction" = अभिशाप (curse/evil wish). Used in: "Dowry system is a malediction."',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Ascribe"?',
      questionHi: '"Ascribe" का अर्थ?',
      options: ['लिखना', 'श्रेय देना', 'आँकना', 'उजागर करना'],
      correctIndex: 1,
      explanation: '"Ascribe" = श्रेय देना. "I ascribe my success to you."',
    ),
    QuizQuestion(
      questionEn: '"मैं कोई कसर नहीं छोड़ूँगा।" — translation?',
      questionHi: 'सही अनुवाद?',
      options: ["I won't give up.", "I'll not leave any stone unturned.", "I'll do my best.", "I'll not stop."],
      correctIndex: 1,
      explanation: 'कोई कसर नहीं छोड़ना = leave no stone unturned.',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Shirk"?',
      questionHi: '"Shirk" का अर्थ?',
      options: ['करारा जवाब देना', 'जी चुराना', 'दूर भागना', 'ग्रहण करना'],
      correctIndex: 1,
      explanation: '"Shirk" = जी चुराना (to avoid responsibility). "To shirk responsibility."',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Auspicious"?',
      questionHi: '"Auspicious" का अर्थ?',
      options: ['अशुभ', 'साधारण', 'शुभ', 'विशेष'],
      correctIndex: 2,
      explanation: '"Auspicious" = शुभ. "Finally, auspicious date of marriage is announced."',
    ),
    QuizQuestion(
      questionEn: '"आग बुझा दो ऐसा न हो कि फैल जाए।" — translation?',
      questionHi: 'सही अनुवाद?',
      options: ['Put off the fire so it spreads.', 'Put out the fire lest it should spread out.', 'Blow the fire lest it goes out.', "Don't let the fire spread out."],
      correctIndex: 1,
      explanation: '"lest it should" = ऐसा न हो कि. "Put out" = बुझाना.',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Unearth"?',
      questionHi: '"Unearth" का अर्थ?',
      options: ['दफनाना', 'उजागर करना', 'गहराई में जाना', 'मोहित करना'],
      correctIndex: 1,
      explanation: '"Unearth" = उजागर करना (expose/reveal). "I\'ll unearth that conspiracy."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ (10 questions — best of all 4 tests)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Correct: "He is older than ___."',
      questionHi: 'सही विकल्प?',
      options: ['me', 'I', 'my', 'myself'],
      correctIndex: 1,
      explanation: 'After "than" in comparisons → subject pronoun "I", not "me".',
    ),
    QuizQuestion(
      questionEn: 'Correct spelling?',
      questionHi: 'सही spelling?',
      options: ['Tommorrow', 'Tommorow', 'Tomorrow', 'Tomorow'],
      correctIndex: 2,
      explanation: 'Tomorrow: T-O-M-O-R-R-O-W. One "m", double "r".',
    ),
    QuizQuestion(
      questionEn: '"I am here for 3 days." — correct form?',
      questionHi: 'सही वाक्य?',
      options: ['I am here since 3 days.', 'I have been here for 3 days.', 'I was here for 3 days.', 'I had been here for 3 days.'],
      correctIndex: 1,
      explanation: 'Duration up to now → "I have been here for 3 days."',
    ),
    QuizQuestion(
      questionEn: 'V2 and V3 of "Hide"?',
      questionHi: '"Hide" के V2 और V3?',
      options: ['hided – hided', 'hid – hidden', 'hid – hid', 'hide – hidden'],
      correctIndex: 1,
      explanation: 'Hide → Hid → Hidden.',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Malediction"?',
      questionHi: '"Malediction" का अर्थ?',
      options: ['आशीर्वाद', 'घोषणा', 'अभिशाप', 'प्रार्थना'],
      correctIndex: 2,
      explanation: '"Malediction" = अभिशाप (curse).',
    ),
    QuizQuestion(
      questionEn: '"Don\'t like burger too" → correction?',
      questionHi: 'सुधार?',
      options: ['also', 'either', 'neither', 'No change'],
      correctIndex: 1,
      explanation: 'Negative sentences → "either" not "too".',
    ),
    QuizQuestion(
      questionEn: '"You, he & I are to blame." — correction?',
      questionHi: 'सुधार?',
      options: ['He, I & you...', 'I, you & he...', 'You & I...', 'No correction needed'],
      correctIndex: 1,
      explanation: 'For blame: I comes first → "I, you & he are to blame."',
    ),
    QuizQuestion(
      questionEn: 'V3 of "Seek"?',
      questionHi: '"Seek" का V3?',
      options: ['Seeked', 'Sook', 'Sought', 'Seeken'],
      correctIndex: 2,
      explanation: 'Seek → Sought → Sought.',
    ),
    QuizQuestion(
      questionEn: 'Meaning of "Auspicious"?',
      questionHi: '"Auspicious" का अर्थ?',
      options: ['अशुभ', 'शुभ', 'साधारण', 'विशेष'],
      correctIndex: 1,
      explanation: '"Auspicious" = शुभ.',
    ),
    QuizQuestion(
      questionEn: '"Ram and Shyam works together." — correction?',
      questionHi: 'सुधार?',
      options: ['work', 'is working', 'worked', 'No change'],
      correctIndex: 0,
      explanation: 'Two subjects joined by "and" → plural verb → "work".',
    ),
  ];
}