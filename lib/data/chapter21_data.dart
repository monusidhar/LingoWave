import '../models/lesson_model.dart';

/// Chapter 21 — Modals (मोडाल्स)
class Chapter21Data {

  // ─── Chapter Model ────────────────────────────────────────────────────────
  static ChapterModel get chapter => ChapterModel(
        id: 21,
        title: 'Modals',
        titleHindi: 'मोडाल्स',
        description: 'Can, Could, May, Should, Must, Used to & more',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Modals Overview', titleHindi: 'Modals का परिचय', emoji: '📋', type: LessonType.ch21Overview, status: LessonStatus.inProgress),
          LessonModel(id: 2, title: 'Can / Could / Could have', titleHindi: 'Can / Could / Could have', emoji: '💪', type: LessonType.ch21CanCould, status: LessonStatus.inProgress),
          LessonModel(id: 3, title: 'May / Might / May have', titleHindi: 'May / Might — सम्भावना', emoji: '🤔', type: LessonType.ch21MayMight, status: LessonStatus.inProgress),
          LessonModel(id: 4, title: 'Should / Must / Ought to', titleHindi: 'Should / Must / Ought to', emoji: '✅', type: LessonType.ch21ShouldMust, status: LessonStatus.inProgress),
          LessonModel(id: 5, title: 'Has to / Had to / Will have to', titleHindi: 'Has to / Had to / Will have to', emoji: '📌', type: LessonType.ch21HasTo, status: LessonStatus.inProgress),
          LessonModel(id: 6, title: 'Used to / Would / Would like to', titleHindi: 'Used to / Would / Would like to', emoji: '🔄', type: LessonType.ch21UsedTo, status: LessonStatus.inProgress),
          LessonModel(id: 7, title: 'Need / Dare / Will be able to', titleHindi: 'Need / Dare / Will be able to', emoji: '⚡', type: LessonType.ch21NeedDare, status: LessonStatus.inProgress),
          LessonModel(id: 8, title: 'Will → Must / May/Might Rule', titleHindi: 'पक्का/शायद Rule', emoji: '💡', type: LessonType.ch21WillRule, status: LessonStatus.inProgress),
          LessonModel(id: 9, title: 'Practice Exercise', titleHindi: 'अभ्यास — 94 वाक्य', emoji: '✍️', type: LessonType.ch21Practice, status: LessonStatus.inProgress),
          LessonModel(id: 10, title: 'Test Paper I', titleHindi: 'टेस्ट पेपर — I', emoji: '📝', type: LessonType.ch21TestPaper1, status: LessonStatus.inProgress),
          LessonModel(id: 11, title: 'Test Paper II', titleHindi: 'टेस्ट पेपर — II', emoji: '📋', type: LessonType.ch21TestPaper2, status: LessonStatus.inProgress),
          LessonModel(id: 12, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch21ChapterQuiz, status: LessonStatus.inProgress, totalXP: 100),
        ],
      );

  // ─── questionsForLesson router ────────────────────────────────────────────
  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch21Overview:     return overviewQuestions;
      case LessonType.ch21CanCould:     return canCouldQuestions;
      case LessonType.ch21MayMight:     return mayMightQuestions;
      case LessonType.ch21ShouldMust:   return shouldMustQuestions;
      case LessonType.ch21HasTo:        return hasToQuestions;
      case LessonType.ch21UsedTo:       return usedToQuestions;
      case LessonType.ch21NeedDare:     return needDareQuestions;
      case LessonType.ch21WillRule:     return willRuleQuestions;
      case LessonType.ch21Practice:     return practiceQuizQuestions;
      case LessonType.ch21TestPaper1:   return testPaper1QuizQuestions;
      case LessonType.ch21TestPaper2:   return testPaper2QuizQuestions;
      case LessonType.ch21ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ QUESTIONS
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> overviewQuestions = [
    QuizQuestion(questionEn: 'Modals are used to express ___.',questionHi: 'Modals किसे व्यक्त करने के लिए प्रयोग होते हैं?',options: ['Only tense','Ability, possibility, certainty, permission, necessity','Only questions','Only negatives'],correctIndex: 1,explanation: 'Modals express: ability (सकता है), possibility (सम्भावना), certainty (निश्चतता), permission (इजाज़त), necessity (आवश्यकता).'),
    QuizQuestion(questionEn: 'After modals, the main verb is always in ___.',questionHi: 'Modal के बाद मुख्य क्रिया की कौन सी form?',options: ['2nd form','3rd form','1st form (base form)','V+ing'],correctIndex: 2,explanation: 'Modal + V1 (1st form/base form). Exception: could have/should have/must have + V3.'),
    QuizQuestion(questionEn: '"Could have" uses which form of main verb?',questionHi: '"Could have" के बाद कौन सी form?',options: ['V1','V2','V3','V+ing'],correctIndex: 2,explanation: '"Could have / Should have / Must have / May have / Might have" → all use V3 (3rd form).'),
    QuizQuestion(questionEn: '"Used to" negative is ___.',questionHi: '"Used to" का negative?',options: ['Used not to','Not used to','Did not use to','Didn\'t used to'],correctIndex: 2,explanation: '"Used to" negative = "did not use to". e.g. "He did not use to go to school."'),
    QuizQuestion(questionEn: '"Has to / Have to" negative is ___.',questionHi: '"Has to / Have to" का negative?',options: ['Has not to / Have not to','Doesn\'t has to','Not has to','Has no to'],correctIndex: 0,explanation: '"Has to" negative = "Has not to". "Have to" negative = "Have not to". e.g. "I have not to go."'),
  ];

  static const List<QuizQuestion> canCouldQuestions = [
    QuizQuestion(questionEn: '"Can" expresses ___.',questionHi: '"Can" किसके लिए होता है?',options: ['Past ability','Future certainty','Present ability / possibility','Permission only'],correctIndex: 2,explanation: '"Can" = present ability (सकता है) or possibility. "Could" = past ability or polite request.'),
    QuizQuestion(questionEn: '"तुम समय पे क्यों नहीं आ सके?" — English?',questionHi: '"तुम समय पे क्यों नहीं आ सके?"',options: ['Why can you not come in time?','Why could you not come in time?','Why could you not have come in time?','Why you not came in time?'],correctIndex: 1,explanation: 'सके = past inability → "could not". "Why could you not come in time?"'),
    QuizQuestion(questionEn: '"तुम नल खोल सकते थे पर तुमने नहीं खोला।" — English?',questionHi: '"तुम नल खोल सकते थे पर तुमने नहीं खोला।"',options: ['You could open the tap but didn\'t.','You can open the tap but didn\'t.','You could have turned on the tap but you didn\'t.','You could have open the tap.'],correctIndex: 2,explanation: '"सकते थे पर नहीं किया" = could have + V3. "You could have turned on the tap but you didn\'t."'),
    QuizQuestion(questionEn: '"कुछ भी हो सकता था।" — English?',questionHi: '"कुछ भी हो सकता था।"',options: ['Anything can happen.','Anything could happen.','Anything could have happened.','Anything might happen.'],correctIndex: 2,explanation: 'हो सकता था (past possibility) → "could have happened". "Anything could have happened."'),
    QuizQuestion(questionEn: '"मैं जा नहीं पाया।" — English?',questionHi: '"मैं जा नहीं पाया।"',options: ["I can't go.",'I couldn\'t go.','I could not have gone.','I didn\'t go.'],correctIndex: 1,explanation: 'नहीं पाया = past inability → "couldn\'t". "I couldn\'t go."'),
  ];

  static const List<QuizQuestion> mayMightQuestions = [
    QuizQuestion(questionEn: '"May" for permission — example?',questionHi: '"May" का permission के लिए प्रयोग?',options: ['It may rain.','May you succeed!','May I come in?','He may have gone.'],correctIndex: 2,explanation: '"May I come in?" = formal permission request. "Can I come in?" is informal.'),
    QuizQuestion(questionEn: '"भगवान आपको आशीर्वाद दे।" — English?',questionHi: '"भगवान आपको आशीर्वाद दे।"',options: ['God blesses you!','God blessed you!','May God bless you!','God should bless you!'],correctIndex: 2,explanation: '"May" for wish/prayer = "May God bless you!" इच्छा व्यक्त करने के लिए।'),
    QuizQuestion(questionEn: '"उस दिन बारिश हो सकती थी।" — English?',questionHi: '"उस दिन बारिश हो सकती थी।"',options: ['It may rain that day.','It might rain that day.','It may/might have rained that day.','It could rain that day.'],correctIndex: 2,explanation: 'हो सकती थी (past possibility) → "may/might have rained". "It may/might have rained that day."'),
    QuizQuestion(questionEn: 'Difference between "May" and "Might"?',questionHi: '"May" और "Might" में अंतर?',options: ['May = certain, Might = impossible','May = higher possibility, Might = lower possibility','May = past, Might = present','No difference'],correctIndex: 1,explanation: '"May" = higher probability (60-70%). "Might" = lower probability (30-40%). Both express possibility.'),
    QuizQuestion(questionEn: '"May I see your book once?" — Hindi?',questionHi: '"May I see your book once?"',options: ['क्या मैं तुम्हारी किताब देख सकता हूँ?','क्या मैं तुम्हारी किताब एक बार देख सकता हूँ?','मैं तुम्हारी किताब देखूँगा।','मुझे किताब दिखाओ।'],correctIndex: 1,explanation: '"May I see your book once?" = "क्या मैं तुम्हारी किताब एक बार देख सकता हूँ?" — formal permission.'),
  ];

  static const List<QuizQuestion> shouldMustQuestions = [
    QuizQuestion(questionEn: 'Difference between "Should" and "Must"?',questionHi: '"Should" और "Must" में अंतर?',options: ['Both same','Should = strong obligation, Must = weak advice','Should = advice/mild duty, Must = strong obligation','Must = past, Should = present'],correctIndex: 2,explanation: '"Should" = चाहिए (advice/mild duty). "Must" = चाहिए ज़रुर (strong obligation/certainty). "Must" is stronger.'),
    QuizQuestion(questionEn: '"तुम्हें वहाँ जाना चाहिए था।" — English?',questionHi: '"तुम्हें वहाँ जाना चाहिए था।"',options: ['You should go there.','You should have gone there.','You must go there.','You must have gone there.'],correctIndex: 1,explanation: 'चाहिए था (unfulfilled past obligation) → "should have + V3". "You should have gone there."'),
    QuizQuestion(questionEn: '"Must have" expresses ___.',questionHi: '"Must have" किसे व्यक्त करता है?',options: ['Future certainty','Past strong certainty / deduction','Past obligation unfulfilled','Permission'],correctIndex: 1,explanation: '"Must have + V3" = past deduction with certainty. "He must have reached home" = पक्का पहुँच चुका होगा।'),
    QuizQuestion(questionEn: '"Ought to" vs "Should" — which is more common?',questionHi: '"Ought to" और "Should" — कौन ज़्यादा common है?',options: ['Ought to','Should','Both equally','Neither'],correctIndex: 1,explanation: '"Should" is more commonly used now. "Ought to" is rarely used and can replace "Should" but it\'s old-fashioned.'),
    QuizQuestion(questionEn: '"ज़िन्दगी आसान होनी चाहिए थी पर नहीं थी।" — English?',questionHi: '"ज़िन्दगी आसान होनी चाहिए थी पर नहीं थी।"',options: ["Life should be easy but it wasn't.",'Life should have been easy but it was.','Life should have been easy but it wasn\'t.',"Life must have been easy but it wasn't."],correctIndex: 2,explanation: 'चाहिए थी → should have been. "Life should have been easy but it wasn\'t."'),
  ];

  static const List<QuizQuestion> hasToQuestions = [
    QuizQuestion(questionEn: '"Has to / Have to" meaning?',questionHi: '"Has to / Have to" का अर्थ?',options: ['सकता है','चाहिए','करना है / करना पड़ता है','पड़ेगा'],correctIndex: 2,explanation: '"Has to/Have to" = करना है / करना पड़ता है। Present obligation. "Had to" = करना था/पड़ा (Past). "Will have to" = करना पड़ेगा (Future).'),
    QuizQuestion(questionEn: '"मुझे जाना है।" — English?',questionHi: '"मुझे जाना है।"',options: ['I should go.','I must go.','I have to go.','I need to go.'],correctIndex: 2,explanation: '"मुझे जाना है" = I have to go. (करना है = have to)'),
    QuizQuestion(questionEn: '"राम को कहीं नहीं जाना है।" — English?',questionHi: '"राम को कहीं नहीं जाना है।"',options: ['Ram has not to go anywhere.','Ram doesn\'t have to go anywhere.','Ram has no to go.','Ram will not go anywhere.'],correctIndex: 0,explanation: '"Has to" negative = "has not to". "Ram has not to go anywhere." / "Ram has to go nowhere."'),
    QuizQuestion(questionEn: '"उसे किससे मिलना था?" — English?',questionHi: '"उसे किससे मिलना था?"',options: ['Whom did he have to meet?','Whom has he to meet?','Whom had he to meet?','Who had he to meet?'],correctIndex: 2,explanation: 'मिलना था = Past obligation = "had to". "Whom had he to meet?" — Interrogative with "had to".'),
    QuizQuestion(questionEn: '"एक दिन तुम्हें परेशानी झेलनी पड़ेगी।" — English?',questionHi: '"एक दिन तुम्हें परेशानी झेलनी पड़ेगी।"',options: ['You will have to face trouble someday.','You should face trouble someday.','You must face trouble someday.','You had to face trouble someday.'],correctIndex: 0,explanation: 'पड़ेगी = Future obligation = "will have to". "You will have to face trouble someday."'),
  ];

  static const List<QuizQuestion> usedToQuestions = [
    QuizQuestion(questionEn: '"Used to" expresses ___.',questionHi: '"Used to" का अर्थ?',options: ['किया करता था / करता था (past habit)','करना है','सकता है','चाहिए था'],correctIndex: 0,explanation: '"Used to" = किया करता था / करता था — past repeated habit or state. "I used to play" = मैं खेला करता था।'),
    QuizQuestion(questionEn: 'After first "used to" in a sentence, next verbs use ___.',questionHi: 'एक बार "used to" आने के बाद अगले verbs में क्या?',options: ['used to again','would','should','had'],correctIndex: 1,explanation: 'Rule: Once "used to" is used, replace subsequent mentions with "would". "I used to come and he would go."'),
    QuizQuestion(questionEn: '"Would" in past context (past paragraph) replaces ___.',questionHi: 'Past paragraph में "would" किसकी जगह लेता है?',options: ['will','shall','used to','had'],correctIndex: 2,explanation: 'In a past paragraph, "would" completely replaces "used to". "There was a king. He would get up at 6."'),
    QuizQuestion(questionEn: '"Would like to" = ___.',questionHi: '"Would like to" का अर्थ?',options: ['चाहता था','चाहूँगा / चाहेगा (polite desire)','चाहिए','सकूँगा'],correctIndex: 1,explanation: '"Would like to" = चाहूँगा/चाहेगा (polite desire). "I would like to meet you." = मैं तुमसे मिलना चाहूँगा।'),
    QuizQuestion(questionEn: '"Is/Am/Are + used to" means ___.',questionHi: '"Is/Am/Are + used to" का मतलब?',options: ['Past habit','Future habit','किसी चीज़ की आदत हो जाना (to become habitual to)','Possibility'],correctIndex: 2,explanation: '"Is/Am/Are + used to" = किसी चीज़ की आदत होना। "I am used to this car." = मुझे इस कार की आदत है।'),
  ];

  static const List<QuizQuestion> needDareQuestions = [
    QuizQuestion(questionEn: '"राम को पैन चाहिए।" — English?',questionHi: '"राम को पैन चाहिए।" — (Noun needed)',options: ['Ram needs to a pen.','Ram needs a pen.','Ram need a pen.','Ram is needing a pen.'],correctIndex: 1,explanation: 'पैन = Noun → "need" without "to". "Ram needs a pen." (3rd Person Singular → needs)'),
    QuizQuestion(questionEn: '"राम को जाना चाहिए।" — English?',questionHi: '"राम को जाना चाहिए।" — (Verb needed)',options: ['Ram needs go.','Ram need to go.','Ram needs to go.','Ram need going.'],correctIndex: 2,explanation: 'जाना = Verb → "need to + V1". "Ram needs to go." (3rd Person Singular → needs)'),
    QuizQuestion(questionEn: '"Need" vs "Needs" — rule?',questionHi: '"Need" vs "Needs" — नियम?',options: ['Always needs','Singular → needs, Plural → need','Always need','Depends on tense'],correctIndex: 1,explanation: 'Singular subject → "needs". Plural subject → "need". "Ram needs help." / "We need help."'),
    QuizQuestion(questionEn: '"Will be able to" = ___.',questionHi: '"Will be able to" का अर्थ?',options: ['सकता है','सकता था','सकेगा / पाएगा (future ability)','सकना चाहिए'],correctIndex: 2,explanation: '"Will be able to" = सकेगा / पायेगा। Future ability. "Will you be able to do this?" = क्या तुम ये कर सकोगे?'),
    QuizQuestion(questionEn: '"तुम्हारी यहाँ आने की हिम्मत कैसे हुई?" — English?',questionHi: '"तुम्हारी यहाँ आने की हिम्मत कैसे हुई?"',options: ['How dare you come here?','How dared you come here?','How dare to you come here?','How did you dare come here?'],correctIndex: 0,explanation: '"How dare you come here?" — "How dare you" is a fixed expression for challenging someone\'s audacity.'),
  ];

  static const List<QuizQuestion> willRuleQuestions = [
    QuizQuestion(questionEn: '"पक्का/ज़रुर" in Future sentences → change "will" to ___.',questionHi: '"पक्का/ज़रुर" हो तो "will" बदलकर?',options: ['may','might','must','should'],correctIndex: 2,explanation: '"पक्का/ज़रुर" → replace "will" with "must". "Ram will go" → "Ram must go."'),
    QuizQuestion(questionEn: '"शायद" in Future sentences → change "will" to ___.',questionHi: '"शायद" हो तो "will" बदलकर?',options: ['must','should','may / might','can'],correctIndex: 2,explanation: '"शायद" → replace "will" with "may/might". "Ram will go" → "Ram may/might go."'),
    QuizQuestion(questionEn: '"राम पक्का जा रहा होगा।" — English?',questionHi: '"राम पक्का जा रहा होगा।"',options: ['Ram will be going.','Ram must be going.','Ram may be going.','Ram should be going.'],correctIndex: 1,explanation: '"पक्का" + Future Continuous = "must be going". "Ram must be going."'),
    QuizQuestion(questionEn: '"शायद राम जा चुका होगा।" — English?',questionHi: '"शायद राम जा चुका होगा।"',options: ['Ram must have gone.','Ram should have gone.','Ram may/might have gone.','Ram will have gone.'],correctIndex: 2,explanation: '"शायद" + Future Perfect = "may/might have gone". "Ram may/might have gone."'),
    QuizQuestion(questionEn: '"वो पक्का घर पहुँच चुका होगा।" — English?',questionHi: '"वो पक्का घर पहुँच चुका होगा।"',options: ['He will have reached home.','He may have reached home.','He must have reached home.','He should have reached home.'],correctIndex: 2,explanation: '"पक्का" + Future Perfect = "must have + V3". "He must have reached home."'),
  ];

  static const List<QuizQuestion> practiceQuizQuestions = [
    QuizQuestion(questionEn: '"हम खेला करते थे।" — English?',questionHi: '"हम खेला करते थे।"',options: ['We would play.','We used to play.','We played.','We could play.'],correctIndex: 1,explanation: 'करते थे (past habit) = "used to play". "We used to play."'),
    QuizQuestion(questionEn: '"शायद वो जा रहा हो।" — English?',questionHi: '"शायद वो जा रहा हो।"',options: ['He must be going.','He might be going.','He may have gone.','He should be going.'],correctIndex: 1,explanation: 'शायद + जा रहा हो = "might be going". "He might be going."'),
    QuizQuestion(questionEn: '"मैं पक्का जाऊँगा।" — English?',questionHi: '"मैं पक्का जाऊँगा।"',options: ['I will definitely go.','I must go.','Both A and B are correct.','I should go.'],correctIndex: 2,explanation: '"पक्का" → will → must. "I must go." OR "I\'ll definitely go." — both are correct.'),
    QuizQuestion(questionEn: '"सीता पक्का बस पकड़ चुकी होगी।" — English?',questionHi: '"सीता पक्का बस पकड़ चुकी होगी।"',options: ['Seeta must catch the bus.','Seeta must have caught the bus.','Seeta may have caught the bus.','Seeta will have caught the bus.'],correctIndex: 1,explanation: '"पक्का" + Future Perfect = "must have + V3". "Seeta must have caught/taken the bus."'),
    QuizQuestion(questionEn: '"भगवान हमें माफ करे।" — English?',questionHi: '"भगवान हमें माफ करे।"',options: ['God forgives us.','God forgave us.','May God forgive us!','God should forgive us.'],correctIndex: 2,explanation: '"May" for wish/prayer. "May God forgive us!" — इच्छा/आशीर्वाद के लिए।'),
  ];

  static const List<QuizQuestion> testPaper1QuizQuestions = [
    QuizQuestion(questionEn: '"तुम मेरे घर आ सकते थे पर तुम नहीं आये।" — English?',questionHi: '"तुम मेरे घर आ सकते थे पर तुम नहीं आये।"',options: ['You could come my home but you didn\'t.','You could have come my home but you didn\'t.','You can come my home but you didn\'t.','You should have come my home but you didn\'t.'],correctIndex: 1,explanation: 'आ सकते थे पर नहीं आये = could have + V3. "You could have come my home but you didn\'t."'),
    QuizQuestion(questionEn: '"मैं पढ़ने के बजाय खेलना पसन्द करता हूँ।" — English?',questionHi: '"मैं पढ़ने के बजाय खेलना पसन्द करता हूँ।"',options: ['I like playing rather than studying.','I prefer playing rather than studying.','I would like to play than study.','I used to play rather than study.'],correctIndex: 1,explanation: 'पसन्द करना = "prefer". "I prefer playing rather than studying." / "I prefer to play rather than to study."'),
    QuizQuestion(questionEn: '"क्या पता बस निकल गयी हो।" — English?',questionHi: '"क्या पता बस निकल गयी हो।"',options: ['Bus must have left.','Bus should have left.','Bus may/might have left.','Bus will have left.'],correctIndex: 2,explanation: '"क्या पता" = maybe/perhaps = "may/might". Past → "may/might have left". "Bus may/might have gone."'),
    QuizQuestion(questionEn: '"उसने कहा था कि वो स्कूल नहीं आयेगा।" — English?',questionHi: '"उसने कहा था कि वो स्कूल नहीं आयेगा।"',options: ['He said that he will not come to school.','He had said that he would not come to school.','He says that he won\'t come to school.','He said that he would not have come to school.'],correctIndex: 1,explanation: 'Past में कही हुई future की बात → will → would. "He had said that he would not come to school."'),
    QuizQuestion(questionEn: '"राम को पैन नहीं चाहिए, बल्कि उसे तो किताब चाहिए।" — English?',questionHi: '"राम को पैन नहीं चाहिए, बल्कि उसे तो किताब चाहिए।"',options: ['Ram doesn\'t need a pen, rather he needs a book.','Ram need not a pen, rather he needs book.','Ram needs not pen, rather he need book.','Ram has no pen, rather needs book.'],correctIndex: 0,explanation: '"Doesn\'t need" for negative (singular). "Ram doesn\'t need a pen, rather he needs a book."'),
  ];

  static const List<QuizQuestion> testPaper2QuizQuestions = [
    QuizQuestion(questionEn: '"You should have thought about his condition." — Hindi?',questionHi: '"You should have thought about his condition."',options: ['तुम्हें उसकी हालत के बारे में सोचना चाहिए।','तुम्हें उसकी हालत के बारे में सोचना चाहिए था।','तुमने उसकी हालत के बारे में सोचा।','तुम्हें सोचना था।'],correctIndex: 1,explanation: '"should have thought" = चाहिए था (past unfulfilled). "तुम्हें उसकी हालत के बारे में सोचना चाहिए था।"'),
    QuizQuestion(questionEn: '"Seeta must be studying at this point of time." — Hindi?',questionHi: '"Seeta must be studying at this point of time."',options: ['सीता को अभी पढ़ना चाहिए।','सीता इस वक्त पढ़ रही होगी।','सीता पढ़ रही है।','सीता ज़रुर पढ़ रही होगी।'],correctIndex: 1,explanation: '"Must be studying" = strong inference about present = "इस वक्त पढ़ रही होगी।"'),
    QuizQuestion(questionEn: '"If I had gone there, I would have given him the money." — Hindi?',questionHi: '"If I had gone there, I would have given him the money."',options: ['अगर मैं वहाँ जाऊँगा, मैं उसे पैसे दूँगा।','अगर मैं वहाँ गया होता, मैंने उसे पैसे दे दिये होते।','अगर मैं वहाँ गया था, मैंने पैसे दिये।','अगर मैं वहाँ जाता, मैं पैसे देता।'],correctIndex: 1,explanation: 'Conditional past (3rd type): If + had gone → would have given. "अगर मैं वहाँ गया होता, मैंने उसे पैसे दे दिये होते।"'),
    QuizQuestion(questionEn: '"They are used to such a climate." — Hindi?',questionHi: '"They are used to such a climate."',options: ['वो इस तरह के मौसम में रहते थे।','उन्हें इस तरह के मौसम की आदत हो गई है।','वो इस मौसम में रह सकते हैं।','वो इस मौसम को पसन्द करते हैं।'],correctIndex: 1,explanation: '"Are used to" = आदत हो गई है। "उन्हें इस तरह के मौसम की आदत हो गई है।"'),
    QuizQuestion(questionEn: '"I would rather buy a pen than a pencil." — Hindi?',questionHi: '"I would rather buy a pen than a pencil."',options: ['मैं पेंसिल और पैन खरीदूँगा।','मैं पेंसिल के बजाय पैन खरीदूँगा।','मुझे पैन चाहिए।','मैं पेन नहीं खरीदूँगा।'],correctIndex: 1,explanation: '"Would rather X than Y" = Y के बजाय X करूँगा। "मैं पेंसिल के बजाय पैन खरीदूँगा।"'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionEn: '"Can" is for present, "Could" is for ___.',questionHi: '"Can" = present, "Could" = ___.',options: ['Future','Present formal','Past ability or polite','Permission only'],correctIndex: 2,explanation: '"Could" = past ability (सका/पाया) or polite request. "Could you please help me?"'),
    QuizQuestion(questionEn: '"आज बारिश हो सकती है।" — English?',questionHi: '"आज बारिश हो सकती है।"',options: ['It should rain today.','It will rain today.','It may/might rain today.','It could rain today.'],correctIndex: 2,explanation: 'सकती है (possibility) → may/might. "It may/might rain today."'),
    QuizQuestion(questionEn: '"May you succeed!" — Hindi?',questionHi: '"May you succeed!"',options: ['तुम सफल हो सकते हो।','भगवान करे आप सफल हो जायें।','तुम्हें सफल होना चाहिए।','क्या तुम सफल हो सकते हो?'],correctIndex: 1,explanation: '"May" for wish = भगवान करे। "May you succeed!" = "भगवान करे आप सफल हो जायें।"'),
    QuizQuestion(questionEn: '"We have to go there daily." — Hindi?',questionHi: '"We have to go there daily."',options: ['हम वहाँ रोज जाते हैं।','हम वहाँ रोज जाना चाहते हैं।','हमें वहाँ रोज जाना पड़ता है।','हम वहाँ जा सकते हैं।'],correctIndex: 2,explanation: '"Have to" = करना पड़ता है। "हमें वहाँ रोज जाना पड़ता है।"'),
    QuizQuestion(questionEn: '"I used to come and he would go." — Hindi?',questionHi: '"I used to come and he would go."',options: ['मैं आता था और वो जाता था।','मैं आऊँगा और वो जायेगा।','मैं आ रहा था और वो जा रहा था।','मैं आया और वो गया।'],correctIndex: 0,explanation: '"used to come" + "would go" = both = करता था। "मैं आता था और वो जाता था।"'),
    QuizQuestion(questionEn: '"Ram needs a pen." vs "Ram needs to go." — difference?',questionHi: '"Ram needs a pen." vs "Ram needs to go."',options: ['No difference','needs a pen = noun, needs to go = verb action','Both use "to"','Both don\'t use "to"'],correctIndex: 1,explanation: 'Noun के साथ "needs" (no to). Verb के साथ "needs to". "Ram needs a pen" (noun) / "Ram needs to go" (verb).'),
    QuizQuestion(questionEn: '"राम पक्का जा चुका होगा।" — English?',questionHi: '"राम पक्का जा चुका होगा।"',options: ['Ram will have gone.','Ram may have gone.','Ram must have gone.','Ram should have gone.'],correctIndex: 2,explanation: '"पक्का" + Future Perfect = "must have + V3". "Ram must have gone."'),
    QuizQuestion(questionEn: '"मुझे गाली सुनने की आदत है।" — English?',questionHi: '"मुझे गाली सुनने की आदत है।"',options: ['I used to listen to abuses.','I am used to listening to abuses.','I would listen to abuses.','I need to listen to abuses.'],correctIndex: 1,explanation: '"Am used to" = आदत है (present habit). "I am used to listening to abuses."'),
    QuizQuestion(questionEn: '"Would" replaces "will" when ___.',questionHi: '"Would" किसकी जगह लेता है?',options: ['In future tense','When something future was spoken in the past','In conditional sentences only','When subject is plural'],correctIndex: 1,explanation: '"Would" replaces "will" when future was spoken in past context. "I knew he would win." (वो जीतेगा → would win)'),
    QuizQuestion(questionEn: '"How dare you come here?" — Hindi?',questionHi: '"How dare you come here?"',options: ['तुम यहाँ क्यों आये?','तुम्हारी यहाँ आने की हिम्मत कैसे हुई?','क्या तुम यहाँ आ सकते हो?','तुम यहाँ कैसे आ गये?'],correctIndex: 1,explanation: '"How dare you" = तुम्हारी हिम्मत कैसे हुई। "How dare you come here?" = "तुम्हारी यहाँ आने की हिम्मत कैसे हुई?"'),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // STATIC CONTENT DATA
  // ══════════════════════════════════════════════════════════════════════════

  /// Modals overview table data
  static const List<Map<String, String>> modalsTable = [
    {'no': '1',  'modal': 'Can',                        'negative': 'Can not',                              'form': 'V1', 'meaning': 'सकता है'},
    {'no': '2',  'modal': 'Could',                      'negative': 'Could not',                            'form': 'V1', 'meaning': 'सका / पाया'},
    {'no': '3',  'modal': 'Could have',                 'negative': 'Could not have',                       'form': 'V3', 'meaning': 'सकता था'},
    {'no': '4',  'modal': 'May / Might',                'negative': 'May not / Might not',                  'form': 'V1', 'meaning': 'सकता है (संभावना)'},
    {'no': '5',  'modal': 'May have / Might have',      'negative': 'May not have / Might not have',        'form': 'V3', 'meaning': 'सकता था'},
    {'no': '6',  'modal': 'Should',                     'negative': 'Should not',                           'form': 'V1', 'meaning': 'चाहिए'},
    {'no': '7',  'modal': 'Should have',                'negative': 'Should not have',                      'form': 'V3', 'meaning': 'चाहिए था'},
    {'no': '8',  'modal': 'Must',                       'negative': 'Must not',                             'form': 'V1', 'meaning': 'चाहिए ज़रुर'},
    {'no': '9',  'modal': 'Must have',                  'negative': 'Must not have',                        'form': 'V3', 'meaning': 'चाहिए था ज़रुर'},
    {'no': '10', 'modal': 'Ought to',                   'negative': 'Ought not to',                         'form': 'V1', 'meaning': 'चाहिए'},
    {'no': '11', 'modal': 'Ought to have',              'negative': 'Ought not to have',                    'form': 'V3', 'meaning': 'चाहिए था'},
    {'no': '12', 'modal': 'Has to / Have to',           'negative': 'Has not to / Have not to',             'form': 'V1', 'meaning': 'करना है / पड़ता है'},
    {'no': '13', 'modal': 'Had to',                     'negative': 'Had not to',                           'form': 'V1', 'meaning': 'करना था / पड़ा'},
    {'no': '14', 'modal': 'Will have to',               'negative': 'Will not have to',                     'form': 'V1', 'meaning': 'करना पड़ेगा'},
    {'no': '15', 'modal': 'Will be able to',            'negative': 'Will not be able to',                  'form': 'V1', 'meaning': 'सकेगा / पायेगा'},
    {'no': '16', 'modal': 'Would like to',              'negative': 'Would not like to',                    'form': 'V1', 'meaning': 'चाहूँगा'},
    {'no': '17', 'modal': 'Used to',                    'negative': 'Did not use to',                       'form': 'V1', 'meaning': 'किया करता था'},
    {'no': '18', 'modal': 'Need / Needs / Needed',      'negative': "Don't/Doesn't/Didn't need",            'form': 'V1', 'meaning': 'ज़रुरत है / चाहिए'},
    {'no': '19', 'modal': 'Dare to / Dares to / Dared to','negative': "Don't/Doesn't/Didn't dare to",      'form': 'V1', 'meaning': 'हिम्मत करना'},
  ];

  /// Can / Could / Could have examples
  static const List<Map<String, String>> canCouldExamples = [
    {'hindi': 'विद्यार्थी स्कूल से घर आ सकते हैं।',        'english': 'Students can come home from school.'},
    {'hindi': 'लोग तुम्हारे बारे में गलत सोच सकते हैं।',   'english': 'People can think wrong about you.'},
    {'hindi': 'कुछ भी हो सकता था।',                        'english': 'Anything could have happened.'},
    {'hindi': 'तुम कभी किसी को प्यार नहीं कर सकते।',      'english': 'You can never love anyone.'},
    {'hindi': 'तुम समय पे क्यों नहीं आ सके?',             'english': 'Why could you not come in time?'},
    {'hindi': 'तुम नल खोल सकते थे पर तुमने नहीं खोला।',  'english': "You could have turned on the tap but you didn't."},
    {'hindi': 'मैं जा नहीं पाया।',                         'english': "I couldn't go."},
    {'hindi': 'क्या तुम कल रात सो पाये?',                 'english': 'Could you sleep last night?'},
  ];

  /// May/Might — Possibility examples
  static const List<Map<String, String>> mayMightPossibilityExamples = [
    {'hindi': 'आज बारिश हो सकती है।',          'english': 'It may/might rain today.'},
    {'hindi': 'ये तुम्हारे साथ भी तो हो सकता है।','english': 'It may also happen with you.'},
    {'hindi': 'वो किसी को भी मार सकता था।',    'english': 'He may have/might have killed anyone.'},
    {'hindi': 'उस दिन बारिश हो सकती थी।',      'english': 'It may/might have rained that day.'},
  ];

  /// May — Permission examples
  static const List<Map<String, String>> mayPermissionExamples = [
    {'hindi': 'क्या मैं अन्दर आ सकता हूँ?',               'english': 'May I come in?'},
    {'hindi': 'क्या मैं बैठ सकता हूँ?',                   'english': 'May I sit?'},
    {'hindi': 'क्या मैं तुम्हारी किताब एक बार देख सकता हूँ?','english': 'May I see your book once?'},
  ];

  /// May — Wish examples
  static const List<Map<String, String>> mayWishExamples = [
    {'hindi': 'भगवान करे आप सफल हो जायें।',  'english': 'May you succeed!'},
    {'hindi': 'भगवान आपको बड़ा आदमी बनाये।', 'english': 'May you become a rich man!'},
    {'hindi': 'भगवान आपको आशीर्वाद दे।',     'english': 'May God bless you!'},
    {'hindi': 'तुम्हें मेरी उम्र लग जाये।',   'english': 'May you live long!'},
    {'hindi': 'भगवान हमें माफ करे।',          'english': 'May God forgive us!'},
  ];

  /// Should / Should have examples
  static const List<Map<String, String>> shouldExamples = [
    {'hindi': 'तुम्हें ऐसा नहीं कहना चाहिए।',                'english': "You shouldn't say so."},
    {'hindi': 'लोगों को निकल जाना चाहिए।',                   'english': 'People should leave.'},
    {'hindi': 'तुम्हें वहाँ जाना चाहिए था।',                  'english': 'You should have gone there.'},
    {'hindi': 'ज़िन्दगी आसान होनी चाहिए थी पर नहीं थी।',    "english": "Life should have been easy but it wasn't."},
    {'hindi': 'तुम्हें मुझे याद दिलाना चाहिए था।',            'english': 'You should have reminded me.'},
    {'hindi': 'तुम्हें कम से कम शादी में तो जाना चाहिए था।', 'english': 'You should have at least attended the marriage.'},
  ];

  /// Must / Must have examples
  static const List<Map<String, String>> mustExamples = [
    {'hindi': 'पापा बीमार हैं। तुम्हें उन्हें देखने जाना ही चाहिए।','english': 'Dad is unwell. You must go to see him.'},
    {'hindi': 'हमें अपने माता पिता की सेवा करनी चाहिए।',           'english': 'We must serve our parents.'},
    {'hindi': 'तुम्हें ज़रुर आना चाहिए था।',                        'english': 'You must have come.'},
  ];

  /// Has to / Have to examples
  static const List<Map<String, String>> hasToExamples = [
    {'hindi': 'हमें वहाँ रोज जाना पड़ता है।',        'english': 'We have to go there daily.'},
    {'hindi': 'उसे प्यार से बात करनी पड़ती है।',     'english': 'He has to speak politely.'},
    {'hindi': 'मुझे जाना है।',                        'english': 'I have to go.'},
    {'hindi': 'मुझे नहीं जाना है।',                   'english': 'I have not to go.'},
    {'hindi': 'राम को कहीं नहीं जाना है।',           'english': 'Ram has not to go anywhere.'},
    {'hindi': 'राम को घर आना है।',                   'english': 'Ram has to come home.'},
    {'hindi': 'तुम लोगों को जाना नहीं है क्या?',     'english': 'Have you people not to go?'},
    {'hindi': 'उसे कहाँ जाना है?',                   'english': 'Where has he to go?'},
  ];

  /// Had to examples
  static const List<Map<String, String>> hadToExamples = [
    {'hindi': 'हमें वहाँ रोज़ जाना पड़ता था।', 'english': 'We had to go there daily.'},
    {'hindi': 'मुझे जाना था।',               'english': 'I had to go.'},
    {'hindi': 'मुझे जाना पड़ा।',             'english': 'I had to go.'},
    {'hindi': 'क्या तुम्हें ये काम करना था?', 'english': 'Had you to do this work?'},
    {'hindi': 'उसे किससे मिलना था?',         'english': 'Whom had he to meet?'},
  ];

  /// Will have to / Will be able to examples
  static const List<Map<String, String>> willHaveToExamples = [
    {'hindi': 'एक दिन तुम्हें परेशानी झेलनी पड़ेगी।', 'english': 'You will have to face trouble someday.', 'modal': 'Will have to'},
    {'hindi': 'मुझे कभी न कभी वहाँ जाना पड़ेगा।',    'english': 'I will have to go there someday.',        'modal': 'Will have to'},
    {'hindi': 'क्या मुझे ये भी करना पड़ेगा?',          'english': 'Will I have to do this too?',             'modal': 'Will have to'},
    {'hindi': 'मैं वहाँ नहीं जा पाऊँगा/सकूँगा।',     'english': 'I will not be able to go there.',         'modal': 'Will be able to'},
    {'hindi': 'क्या तुम ये कर सकोगे/पाओगे?',         'english': 'Will you be able to do this?',            'modal': 'Will be able to'},
  ];

  /// Would like to examples
  static const List<Map<String, String>> wouldLikeToExamples = [
    {'hindi': 'मैं तुमसे एक बार मिलना चाहूँगा।',          'english': 'I would like to meet you once.'},
    {'hindi': 'क्या तुम मेरे साथ डाँस करना चाहोगी?',      'english': 'Would you like to dance with me?'},
    {'hindi': 'क्या तुम पीटना चाहोगे?',                   'english': 'Would you like to beat?'},
    {'hindi': 'क्या तुम पिटना चाहोगे?',                   'english': 'Would you like to be beaten?'},
    {'hindi': 'सबसे पहले मैं तुमसे एक सवाल पूछना चाहूँगा।','english': 'First of all, I would like to ask you a question.'},
    {'hindi': 'मैं आपको तहे दिल से धन्यवाद देना चाहूँगा।', 'english': 'I would like to thank you from the core of my heart.'},
  ];

  /// Will → Must / May/Might rule table
  static const List<Map<String, String>> willRuleTable = [
    {'hindi': 'राम जायेगा।',                              'will': 'Ram will go.',         'must': 'Ram must go.',          'may': 'Ram may/might go.'},
    {'hindi': 'राम जा रहा होगा।',                         'will': 'Ram will be going.',   'must': 'Ram must be going.',    'may': 'Ram may/might be going.'},
    {'hindi': 'राम जा चुका होगा।',                        'will': 'Ram will have gone.',  'must': 'Ram must have gone.',   'may': 'Ram may/might have gone.'},
  ];

  static const List<Map<String, String>> willRuleExamples = [
    {'hindi': 'शायद बस आ रही हो।',               'english': 'Bus might/may be coming.'},
    {'hindi': 'वो पक्का घर पहुँच चुका होगा।',    'english': 'He must have reached home.'},
    {'hindi': 'मैं उससे ज़रुर मिलूँगा।',          'english': 'I must meet him/her.'},
    {'hindi': 'शायद लोग चले गये हों।',            'english': 'People might have left/gone.'},
    {'hindi': 'वो पक्का उससे मिलने जा रहा होगा।','english': 'He must be going to meet her/him.'},
  ];

  /// Used to examples
  static const List<Map<String, String>> usedToExamples = [
    {'hindi': 'मैं सुबह जल्दी उठता था।',              'english': 'I used to get up early in the morning.'},
    {'hindi': 'तुम मुझे उठाते थे।',                    'english': 'You used to wake me up.'},
    {'hindi': 'हम बचपन में साथ साथ खेलते थे।',        'english': 'We used to play together in childhood.'},
    {'hindi': 'वो स्कूल नहीं जाता था।',               'english': "He didn't use to go to school."},
    {'hindi': 'क्या वो केवल दो घंटे सोता था?',        'english': 'Did he use to sleep only for two hours?'},
  ];

  static const List<Map<String, String>> usedToWouldExamples = [
    {'hindi': 'मैं आता था और वो जाता था।',                          'english': 'I used to come and he would go.'},
    {'hindi': 'मैं 5 बजे उठता था। फिर मैं दो घंटे पढ़ता था।',     'english': 'I used to get up at 5. Then, I would study for 2 hours.'},
    {'hindi': 'वो आती थी। मैं भाग जाता था। फिर वो मुझे बुलाती थी।','english': 'She used to come. I would run. Then, she would call me.'},
  ];

  static const List<Map<String, String>> wouldPastParaExamples = [
    {'hindi': 'एक राजा था। वो रोज़ 6 बजे उठता था।',                  'english': 'There was a king. He would get up daily at 6.'},
    {'hindi': 'मैं बहुत बुरा था पर मैं अपनी मम्मी को बहुत प्यार करता था।','english': 'I was very bad but I would love my mom a lot.'},
  ];

  static const List<Map<String, String>> wouldFutureInPastExamples = [
    {'hindi': 'उसने कहा कि वो हमारी मदद करेगा।',                     'english': 'He said that he would help us.'},
    {'hindi': 'मुझे मालूम था कि वह जीतेगा।',                         'english': 'I knew that he would win.'},
    {'hindi': 'मैंने कभी नहीं सोचा था कि वह इतना स्वार्थी होगा।',   'english': 'I had never thought that he would be this much selfish.'},
    {'hindi': 'मुझे संदेह नहीं था कि तुम जीतोगे।',                  'english': 'I had no doubt that you would win.'},
    {'hindi': 'मुझे लगा कि वो कभी नहीं आयेगा।',                     'english': 'I thought that he would never come.'},
  ];

  static const List<Map<String, String>> wouldRequestExamples = [
    {'hindi': 'क्या तुम कृपया मेरी मदद करोगे?',   'english': 'Would you please help me?'},
    {'hindi': 'क्या तुम कृपया दरवाजा खोल दोगे?',  'english': 'Would you please open the door?'},
  ];

  /// Is/Am/Are + used to examples
  static const List<Map<String, String>> isUsedToExamples = [
    {'hindi': 'मुझे गाली सुनने की आदत है।',         'english': 'I am used to listening to abuses.'},
    {'hindi': 'मुझे इस कार की आदत हो गई है।',      'english': 'I am used to this car.'},
    {'hindi': 'तुम्हें झूठ बोलने की आदत थी।',       'english': 'You were used to telling a lie.'},
    {'hindi': 'राम को रात भर जगे रहने की आदत है।', 'english': 'Ram is used to staying awake for the whole night.'},
  ];

  /// Need examples
  static const List<Map<String, String>> needExamples = [
    {'hindi': 'राम को पैन चाहिए।',      'english': 'Ram needs a pen.',        'note': 'Noun → no "to"'},
    {'hindi': 'राम को जाना चाहिए।',     'english': 'Ram needs to go.',        'note': 'Verb → needs to'},
    {'hindi': 'राम को पैन नहीं चाहिए।', 'english': "Ram doesn't need a pen.", 'note': 'Negative'},
    {'hindi': 'राम को जाना नहीं चाहिए।','english': "Ram doesn't need to go.", 'note': 'Negative verb'},
    {'hindi': 'मुझे माँ चाहिए।',        'english': 'I need mom.',             'note': 'Noun → no "to"'},
    {'hindi': 'मुझे तुम्हारी ज़रुरत थी।', 'english': 'I needed you.',          'note': 'Past'},
    {'hindi': 'राम को जाना चाहिए था।',  'english': 'Ram needed to go.',       'note': 'Past verb'},
  ];

  /// Dare examples
  static const List<Map<String, String>> dareExamples = [
    {'hindi': 'वो जाने की हिम्मत करता है।',         'english': 'He dares to go.'},
    {'hindi': 'वो वहाँ जाने की हिम्मत नहीं करता।', 'english': "He doesn't dare to go there."},
    {'hindi': 'तुम्हारी यहाँ आने की हिम्मत कैसे हुई?','english': 'How dare you come here?'},
    {'hindi': 'राम ने खेलने की हिम्मत की।',         'english': 'Ram dared to play.'},
    {'hindi': 'राम ने खेलने की हिम्मत नहीं की।',    'english': "Ram didn't dare to play."},
    {'hindi': 'राम की हिम्मत कैसे हुई?',            'english': 'How dare Ram?'},
  ];

  // ─── Practice Exercise — 94 sentences ────────────────────────────────────
  static const List<Map<String, String>> practiceExercise = [
    {'hindi': 'मुझे देखना है।',                               'english': 'I have to see.'},
    {'hindi': 'उसे बताना पड़ा।',                              'english': 'He had to tell.'},
    {'hindi': 'राम को खेलना पड़ेगा।',                         'english': 'Ram will have to play.'},
    {'hindi': 'उसे मेरी बात माननी पड़ेगी।',                   'english': 'He will have to follow my instructions.'},
    {'hindi': 'मुझे जाना चाहिए था।',                          'english': 'I should have gone.'},
    {'hindi': 'हम खेला करते थे।',                             'english': 'We used to play.'},
    {'hindi': 'लोग मुझे सलमान खान बुलाते थे।',               'english': 'People used to call me Salman Khan.'},
    {'hindi': 'क्या तुम जा पाये?',                            'english': 'Could you go?'},
    {'hindi': 'क्या तुम यहाँ सो पाओगे?',                     'english': 'Will you be able to sleep here?'},
    {'hindi': 'हम कभी नहीं भुला सके।',                       'english': 'We could never forget.'},
    {'hindi': 'मुझे अपने आस-पास कोई नहीं चाहिए।',            'english': "I don't need anybody around me."},
    {'hindi': 'शायद वो जा रहा हो।',                           'english': 'He might be going.'},
    {'hindi': 'उसे मुझे बताना चाहिए था।',                    'english': 'He should have told me.'},
    {'hindi': 'अब उसके खर्चे तुम्हें उठाने पड़ेंगे।',        'english': 'Now, you will have to bear his expenses.'},
    {'hindi': 'मैं आता था और वो जाता था।',                   'english': 'I used to come and he would go.'},
    {'hindi': 'बच्चे को माँ की ज़रुरत होती है।',              'english': 'Child needs mother.'},
    {'hindi': 'शायद बस आ रही होगी।',                         'english': 'Bus might be coming.'},
    {'hindi': 'किसी को प्यार नहीं चाहिए।',                   'english': 'Nobody needs love.'},
    {'hindi': 'दोनों कभी भी आ सकते हैं।',                    'english': 'Both can come anytime.'},
    {'hindi': 'मैं पक्का जाऊँगा।',                            'english': 'I must go.'},
    {'hindi': 'ये प्रश्न कोई नहीं कर पायेगा।',               'english': 'Nobody will be able to solve this question.'},
    {'hindi': 'मुझे कुछ कहना है।',                            'english': 'I have to say something.'},
    {'hindi': 'हम खेलने चले जाते थे।',                       'english': 'We used to go to play.'},
    {'hindi': 'मुझे किसी की ज़रुरत नहीं है।',                "english": "I don't need anybody."},
    {'hindi': 'मुझे तुम याद करते थे।',                        'english': 'You used to miss/remember me.'},
    {'hindi': 'सीता पक्का बस पकड़ चुकी होगी।',               'english': 'Seeta must have taken/caught the bus.'},
    {'hindi': 'शायद वो तुमसे मिले।',                          'english': 'He might meet you.'},
    {'hindi': 'बचपन में हम दोनों साथ-साथ खेलते थे।',         'english': 'We both used to play together in childhood.'},
    {'hindi': 'उसे क्या कहना है?',                            'english': 'What has he to say?'},
    {'hindi': 'मैं आ सकता था पर मैं नहीं आ पाया।',           "english": "I could have come but I could not come."},
    {'hindi': 'मैं घूमने कभी नहीं जा सकती।',                 'english': 'I can never go for a walk.'},
    {'hindi': 'तुम्हें झूठ बोलने की आदत है।',                'english': 'You are in the habit of telling a lie.'},
    {'hindi': 'तुम नल खोल सकते थे पर तुमने नहीं खोला।',     "english": "You could have turned the tap on but you didn't."},
    {'hindi': 'कुछ भी हो सकता है। मैं कह नहीं सकता।',       "english": "Anything can happen. I can't say."},
    {'hindi': 'तुम्हें पहाड़ों में रहना चाहिए क्योंकि तुम्हें दिल की बीमारी है।','english': 'You must live in hills because you are suffering from heart disease.'},
    {'hindi': 'वो मुझसे दूर कभी नहीं जा सकती।',             'english': 'She can never go away from me.'},
    {'hindi': 'राम मिठाई खा सकता था।',                       'english': 'Ram could have eaten the sweets.'},
    {'hindi': 'विद्यार्थी स्कूल से घर आ सकते हैं।',          'english': 'Students can come home from school.'},
    {'hindi': 'मैं कभी गाना नहीं गा सका।',                   'english': 'I could never sing songs.'},
    {'hindi': 'तुम मुझसे मिलने आ सकते हो।',                  'english': 'You can come to meet me.'},
    {'hindi': 'तुम समय पे क्यों नहीं आ सके?',               'english': 'Why could you not come in time?'},
    {'hindi': 'तुम कभी किसी का प्यार नहीं कर सकते।',        'english': 'You can never love anyone.'},
    {'hindi': 'राजेश अपने दिल की बात कभी नहीं कह सका।',     'english': 'Rajesh could never say his feelings.'},
    {'hindi': 'अंगूर खट्टे हो सकते थे।',                     'english': 'Grapes could have been sour.'},
    {'hindi': 'तुम्हें मेरा आभारी होना चाहिए।',              'english': 'You should be grateful to me.'},
    {'hindi': 'हम बर्दाशत कभी नहीं कर सकते।',               'english': 'We can never tolerate you.'},
    {'hindi': 'क्या मुझे चेहरे पर कुछ लगाना चाहिए?',        'english': 'Should I apply something on my face?'},
    {'hindi': 'राम किसी तरह वहाँ पहुँच सकता था।',           'english': 'Ram could have reached there somehow.'},
    {'hindi': 'राम को उससे कभी नहीं मिलना चाहिए।',          'english': 'Ram should never meet him.'},
    {'hindi': 'लोग तुम्हारे बारे में सोच सकते थे।',          'english': 'People could have thought about you.'},
    {'hindi': 'ज़िन्दगी आसान होनी चाहिए थी पर नहीं थी।',    "english": "Life should have been easy but wasn't."},
    {'hindi': 'मुझे वक्त का पाबन्द होना चाहिए।',             'english': 'I must be punctual.'},
    {'hindi': 'उसने कहा कि वो हमारी मदद करेगा।',            'english': 'He said he would help us.'},
    {'hindi': 'दूल्हा दुल्हन को बात करनी चाहिए थी।',        'english': 'Groom and bride should have talked.'},
    {'hindi': 'लोग तुम्हारे बारे में गलत सोच सकते हैं।',     'english': 'People can think wrong about you.'},
    {'hindi': 'राकेश को लड़कियाँ नहीं छेड़नी चाहिए।',       "english": "Rakesh shouldn't tease girls."},
    {'hindi': 'तुम्हें मुझे याद दिलाना चाहिए था।',           'english': 'You should have reminded me.'},
    {'hindi': 'राम को मुझसे ज़रुर मिलना चाहिए था।',          'english': 'Ram must have met me.'},
    {'hindi': 'उसे कहाँ जाना है?',                            'english': 'Where has he to go?'},
    {'hindi': 'वो कहाँ से आता था?',                           'english': 'From where did he use to come?'},
    {'hindi': 'क्या वो जाना चाहता है?',                       'english': 'Does he want to go?'},
    {'hindi': 'क्या उसे कुछ चाहिए था?',                      'english': 'Did he need something?'},
    {'hindi': 'तुम्हें इतनी जल्दी नहीं सोना चाहिए।',         'english': 'You should not sleep this early.'},
    {'hindi': 'तुम जब चाहो आ सकते हो।',                     'english': 'Whenever you want, you can come.'},
    {'hindi': 'तुम्हें कम से कम वहाँ जाना चाहिए था।',        'english': 'You should have atleast gone there.'},
    {'hindi': 'तुम जल्द ही अंग्रेज़ी बोल सकोगे।',            'english': 'Soon, you will be able to speak English.'},
    {'hindi': 'मैंने कभी नहीं सोचा था कि वह स्वार्थी होगा।', "english": "I had never thought that he'll be selfish."},
    {'hindi': 'तुम जब चाहो तब तक काम कर सकते हो।',         'english': 'As long as you want, you can work.'},
    {'hindi': 'क्या वो ये काम कर सकेगा?',                    'english': 'Will he be able to do this work?'},
    {'hindi': 'बच्चा कुछ दिनों में ही अच्छी तरह बोल सकेगा।', 'english': 'Child will be able to speak within only a few days.'},
    {'hindi': 'तुम्हें उसके वापिस जाना चाहिए।',              'english': 'You must go back to his home.'},
    {'hindi': 'मुझे मालूम था कि वो जीतेगा।',                'english': 'I knew that he would win.'},
    {'hindi': 'तुम इम्तिहान पास नहीं कर सकते।',              "english": "You can't pass the exam."},
    {'hindi': 'मैं आपको धन्यवाद देना चाहूँगा।',             'english': 'I would like to thank you.'},
    {'hindi': 'मुझे संदेह नहीं था कि तुम जीतोगे।',           'english': 'I had no doubt that you would win.'},
    {'hindi': 'तुम खा सकते हो, चाहे ये या चाहे वो।',        'english': 'You can eat; either this or that.'},
    {'hindi': 'मुझे लगा कि वो कभी नहीं आयेगा।',             'english': 'I thought that he will never come.'},
    {'hindi': 'मैं तुमसे सिर्फ एक बार मिलना चाहूँगा।',       'english': 'I would like to meet you only once.'},
    {'hindi': 'वह पक्का बस से गया होगा।',                    'english': 'He must have gone by bus.'},
    {'hindi': 'तुम्हारे प्रयत्न सफल होने चाहिए।',             'english': 'You efforts must be fruitful.'},
    {'hindi': 'तुम किससे बात करना चाहोगे?',                  'english': 'Whom would you like to talk?'},
    {'hindi': 'राम पढ़ने के बजाय खेलना पसन्द करेगा।',       'english': 'Ram would like to play rather than study.'},
    {'hindi': 'मुझे गाली सुनने की आदत है।',                  'english': 'I am used to listening to abuses.'},
    {'hindi': 'तुम्हें इस तरह के माहौल में रहने की आदत हो चुकी है।','english': 'You are used to living in such an environment.'},
    {'hindi': 'तुम्हें कल उससे मिलना था।',                   'english': 'You had to meet him yesterday.'},
    {'hindi': 'आज मुझे शॉपिंग के लिए जाना चाहिए था।',       'english': 'I should have gone for shopping today.'},
    {'hindi': 'पहले मैं तुमसे एक सवाल पूछना चाहूँगा।',      'english': 'First, I would like to ask you a question.'},
    {'hindi': 'तुम्हें मेरे परिवार से मिलना चाहिए था।',       'english': 'You should have met my family.'},
    {'hindi': 'क्या मुझे रात भर जगे रहने की आदत है?',       'english': 'Am I used to being awake the whole night?'},
    {'hindi': 'क्या मैं अंदर आ सकता हूँ?',                   'english': 'May I come in?'},
    {'hindi': 'तुम्हें कम से कम आज तो काम करना चाहिए था।', 'english': 'You should have worked at least today.'},
    {'hindi': 'क्या मैं अब जा सकता हूँ?',                    'english': 'May I go now?'},
    {'hindi': 'भगवान हमें माफ करे।',                         'english': 'May God forgive us!'},
    {'hindi': 'क्या राम वहाँ जाता था?',                       'english': 'Did Ram use to go there?'},
  ];

  // ─── Test Paper I — 35 Hindi→English ─────────────────────────────────────
  static const List<Map<String, String>> testPaper1 = [
    {'hindi': 'तुम मेरे घर आ सकते थे पर तुम नहीं आये।',       'english': "You could have come my home but you didn't."},
    {'hindi': 'हमें आज मिलना था।',                             'english': 'We had to meet today.'},
    {'hindi': 'मुझे उससे बात करनी है।',                        'english': 'I have to talk to him.'},
    {'hindi': 'उसे किसी भी हालत में वहाँ जाना चाहिए।',        'english': 'He must go there at any cost.'},
    {'hindi': 'राहुल को आना पड़ेगा।',                          'english': 'Rahul will have to come.'},
    {'hindi': 'तुम उसके घर क्यों जाते थे?',                   'english': 'Why did you use to go to his home?'},
    {'hindi': 'क्या तुम मुझसे मिलना चाहोगे?',                 'english': 'Would you like to meet me?'},
    {'hindi': 'शायद वो आज आये।',                               'english': 'He might come today.'},
    {'hindi': 'क्या उसे जाना है?',                             'english': 'Has he to go?'},
    {'hindi': 'अगर मैंने तुम्हें देखा होता, क्या तुमसे बात नहीं करता?','english': "If I had seen you, wouldn't I have talked to you?"},
    {'hindi': 'मुझे तुम्हारी ज़रुरत नहीं है, बल्कि मुझे तो मेरी माँ चाहिए।','english': "I don't need you, rather I need my mom."},
    {'hindi': 'उसने कहा था कि वो स्कूल नहीं आयेगा।',         'english': 'He had said that he would not come to school.'},
    {'hindi': 'मैं पढ़ने के बजाय खेलना पसन्द करता हूँ।',      'english': 'I prefer playing rather than studying.'},
    {'hindi': 'मैं पक्का जाऊँगा वहाँ।',                        'english': 'I must go there.'},
    {'hindi': 'मैं जीतना चाहता था पर कभी जीत नहीं पाया।',    'english': 'I wanted to win but I could never.'},
    {'hindi': 'वो खेलना नहीं चाहता।',                          'english': "He doesn't want to play."},
    {'hindi': 'अगर मैं आया, तो तुमसे मिलूँगा।',               'english': 'If I come, I will meet you.'},
    {'hindi': 'हमें प्यार चाहिए, कुछ और नहीं।',               'english': 'We need love, nothing else.'},
    {'hindi': 'शायद बारिश हो रही हो।',                         'english': 'It may/might be raining.'},
    {'hindi': 'उसे किसी की ज़रुरत नहीं है, वो खुद ही काफी है।','english': "He doesn't need anyone, he himself is good enough."},
    {'hindi': 'तुमने हमेशा मुझे सम्मान दिया, मैं भूल नहीं सकता।','english': 'You always respected me, I can not forget.'},
    {'hindi': 'चाहे जो हो, हमारा प्यार हमेशा ज़िन्दा रहना चाहिए।','english': 'No matter what, our love must remain alive forever.'},
    {'hindi': 'मुझे उसे प्यार नहीं करना चाहिए था।',            'english': "I shouldn't have loved her."},
    {'hindi': 'शायद वो आयेगी।',                                'english': 'She might/may come.'},
    {'hindi': 'राम यहाँ क्यों आता था?',                        'english': 'Why did Ram use to come here?'},
    {'hindi': 'मैं स्कूल के दिनों में खूब खेला करता था।',     'english': 'I used to play a lot in school days.'},
    {'hindi': 'राकेश को सोचना चाहिए था।',                     'english': 'Rakesh should have thought.'},
    {'hindi': 'क्या पता बस निकल गयी हो।',                     'english': 'Bus may/might have left/gone.'},
    {'hindi': 'मैं तुमसे मिलने कभी नहीं आ सकता।',             'english': 'I can never come to meet you.'},
    {'hindi': 'मैं तुमसे कभी नहीं कह सका।',                   'english': 'I could never tell you.'},
    {'hindi': 'राम को पैन नहीं चाहिए, बल्कि उसे तो किताब चाहिए।','english': "Ram doesn't need a pen, rather he needs a book."},
    {'hindi': 'क्या तुम कभी वहाँ जा पाये? शायद कभी नहीं।',   'english': 'Could you ever go there? Never, I think.'},
    {'hindi': 'क्या तुम मेरे लिए रुक नहीं सकते?',             'english': "Can't you wait for me?"},
    {'hindi': 'क्या तुम्हें कुछ नहीं चाहिए?',                 "english": "Don't you need anything?"},
    {'hindi': 'तुम्हारा क्या ख्याल है, मुझे वहाँ जाना चाहिए?','english': 'What do you think, should I go there?'},
  ];

  // ─── Test Paper II — 50 English→Hindi ────────────────────────────────────
  static const List<Map<String, String>> testPaper2 = [
    {'english': 'Could he achieve what he wanted?',                           'hindi': 'क्या वो पा सका जो वो चाहता था?'},
    {'english': 'She would not like to dance with you.',                      'hindi': 'वो तुम्हारे साथ डाँस नहीं करना चाहेगी।'},
    {'english': 'You should have thought about his condition.',                'hindi': 'तुम्हें उसकी हालत के बारे में सोचना चाहिए था।'},
    {'english': 'Does he need your help?',                                    'hindi': 'क्या उसे तुम्हारी मदद की ज़रूरत है?'},
    {'english': 'Did he use to come to your home?',                           'hindi': 'क्या वो तुम्हारे घर आता था?'},
    {'english': 'They might have left for school.',                           'hindi': 'शायद वो स्कूल के लिए निकल गये हों/होंगे।'},
    {'english': 'Seeta must be studying at this point of time.',              'hindi': 'सीता इस वक्त पढ़ रही होगी।'},
    {'english': 'He might be coming.',                                        'hindi': 'शायद वो आ रहा हो / होगा।'},
    {'english': 'If I had gone there, I would have given him the money.',     'hindi': 'अगर मैं वहाँ गया होता, मैंने उसे पैसे दे दिये होते।'},
    {'english': 'They are used to such a climate.',                           'hindi': 'उन्हें इस तरह के मौसम की आदत हो गई है।'},
    {'english': 'Has he to go?',                                              'hindi': 'क्या उसे जाना है?'},
    {'english': 'I had told you that I would not go there.',                  'hindi': 'मैंने तुम्हें बताया था कि मैं वहाँ नहीं जाऊँगा।'},
    {'english': 'He is used to his car now.',                                 'hindi': 'उसे अपनी कार की अब आदत हो गई है।'},
    {'english': 'We ought to respect whoever is older than we.',              'hindi': 'हमें अपनों से बड़ों का आदर करना चाहिए।'},
    {'english': 'I was watching TV, rather than studying.',                   'hindi': 'मैं पढ़ने के बजाय टी वी देख रहा था।'},
    {'english': 'They should have left by now.',                              'hindi': 'वो अब तक निकल गये होंगे।'},
    {'english': 'There should be good weather.',                              'hindi': 'वहाँ अच्छा मौसम होना चाहिए।'},
    {'english': 'I would rather buy a pen than a pencil.',                    'hindi': 'मैं पेंसिल के बजाय पैन खरीदूँगा।'},
    {'english': 'I already knew that he would win.',                          'hindi': 'मैं पहले से ही जानता था कि वो जीतेगा।'},
    {'english': "I couldn't protest against Government's decision.",          'hindi': 'मैं सरकार के फैसले के विरुद्ध विद्रोह नहीं कर सका।'},
    {'english': 'Can you meet that guy?',                                     'hindi': 'क्या तुम उस लड़के से मिल सकते हो?'},
    {'english': 'There can be anybody.',                                      'hindi': 'वहाँ कोई भी हो सकता है।'},
    {'english': "I don't love you; rather I love your sister.",               'hindi': 'मैं तुम्हें नहीं बल्कि तुम्हारी बहन को प्यार करता हूँ।'},
    {'english': 'I had to fight till the end.',                               'hindi': 'मुझे अन्त तक लड़ना था/पड़ा।'},
    {'english': "You can't compare love with anything.",                      'hindi': 'तुम प्यार की तुलना किसी चीज़ के साथ नहीं कर सकते।'},
    {'english': 'Could you please spare some time for me?',                   'hindi': 'क्या आप मेरे लिए थोड़ा समय निकाल सकते हैं?'},
    {'english': 'This girl used to meet Ram quite often.',                    'hindi': 'ये लड़की राम से अकसर मिलती थी।'},
    {'english': 'Will he be able to come here?',                              'hindi': 'क्या वो यहाँ आ पायेगा?'},
    {'english': 'It must hail tomorrow.',                                     'hindi': 'कल पक्का ओले पड़ेंगे।'},
    {'english': 'I would rather meet my dad than meet him.',                  'hindi': 'मैं उससे मिलने के बजाय अपने पापा से मिलूँगा।'},
    {'english': 'Could I speak with Mr. Batra?',                             'hindi': 'क्या मैं मि0 बत्रा से बात कर सकता हूँ?'},
    {'english': 'I would get up at 6 when I was a kid.',                     'hindi': 'मैं 6 बजे उठता था जब मैं एक बच्चा था।'},
    {'english': 'They didn\'t want to meet me.',                              'hindi': 'वो मुझसे मिलना नहीं चाहते थे।'},
    {'english': 'Mom needed help because she was unwell.',                    'hindi': 'मम्मी को मदद चाहिए थी क्योंकि वो बीमार थीं।'},
    {'english': 'Shall I go?',                                                'hindi': 'क्या मुझे जाना चाहिए?'},
    {'english': 'I wanted my mom not to work.',                               'hindi': 'मैं नहीं चाहता था कि मेरी मम्मी काम करें।'},
    {'english': "Mobile couldn't divert me from my study.",                   'hindi': 'मोबाइल मेरी पढ़ाई से मुझे भटका नहीं सका।'},
    {'english': 'I was used to his abuses.',                                  'hindi': 'मुझे उसकी गालियों की आदत पड़ गयी थी।'},
    {'english': 'He prefers singing over dancing.',                           'hindi': 'वो डाँस करने के बजाय गाने को तवज्जो देता है।'},
    {'english': 'Had he loved me, he would have been here.',                  'hindi': 'अगर उसने मुझे प्यार किया होता, तो वो यहाँ होता।'},
    {'english': 'Seeta used to come. She would prepare food and study here.','hindi': 'सीता आती थी। खाना बनाती थी और यहाँ पढ़ती थी।'},
    {'english': 'He must leave.',                                             'hindi': 'उसे पक्का चले जाना चाहिए।'},
    {'english': 'If he meets me, I will tell him about you.',                 'hindi': 'अगर वो मुझसे मिला, तो मैं उसे तुम्हारे बारे में बताऊँगा।'},
    {'english': 'Had you known the truth, you would have told me.',           'hindi': 'अगर तुम्हें सच्चाई का पता होता, तो तुम मुझे बता चुके होते।'},
    {'english': 'They might have left.',                                      'hindi': 'शायद वे चले गये हों/होंगे।'},
    {'english': 'It may rain tomorrow.',                                      'hindi': 'शायद कल बारिश हो/होगी।'},
    {'english': 'He prefers me over you.',                                    'hindi': 'वो तुम्हारे बजाय मुझे ज़्यादा मानता है।'},
    {'english': 'It might be a rumour.',                                      'hindi': 'यह एक अफवाह भी हो सकती है।'},
    {'english': 'May I go now?',                                              'hindi': 'क्या मैं अब जा सकता हूँ?'},
    {'english': 'He used to go and I would come.',                            'hindi': 'वो जाता था और मैं आता था।'},
  ];

  /// Motivational quotes
  static const List<Map<String, String>> motivationalQuotes = [
    {'english': 'The secret of getting ahead is getting started.', 'hindi': 'आगे बढ़ने का रहस्य है शुरुआत करना।'},
    {'english': 'You can do anything, but not everything.', 'hindi': 'तुम कुछ भी कर सकते हो, पर सब कुछ नहीं।'},
    {'english': 'Don\'t watch the clock; do what it does. Keep going.', 'hindi': 'घड़ी मत देखो; वो जो करती है वो करो। चलते रहो।'},
  ];
}