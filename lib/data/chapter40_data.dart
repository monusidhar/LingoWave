// chapter40_data.dart - Updated with 4 content lessons + quiz

import '../models/lesson_model.dart';

/// Chapter 40 — Translation Exercises (अनुवाद अभ्यास)
class Chapter40Data {

  static ChapterModel get chapter => ChapterModel(
        id: 40,
        title: 'Translation Exercises',
        titleHindi: 'अनुवाद अभ्यास',
        description: 'English→Hindi & Hindi→English Passages',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
            id: 1,
            title: 'English → Hindi (Passages 1–5)',
            titleHindi: 'अंग्रेज़ी से हिंदी (परिच्छेद 1–5)',
            emoji: '📖',
            type: LessonType.ch40EnToHi1,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 2,
            title: 'English → Hindi (Passages 6–10)',
            titleHindi: 'अंग्रेज़ी से हिंदी (परिच्छेद 6–10)',
            emoji: '📝',
            type: LessonType.ch40EnToHi2,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 3,
            title: 'Hindi → English (Passages 1–10)',
            titleHindi: 'हिंदी से अंग्रेज़ी (परिच्छेद 1–10)',
            emoji: '🔄',
            type: LessonType.ch40HiToEn1,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 4,
            title: 'Hindi → English (Passages 11–20)',
            titleHindi: 'हिंदी से अंग्रेज़ी (परिच्छेद 11–20)',
            emoji: '🔄',
            type: LessonType.ch40HiToEn2,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 5,
            title: 'Chapter Quiz',
            titleHindi: 'अध्याय क्विज़',
            emoji: '🏆',
            type: LessonType.ch40ChapterQuiz,
            status: LessonStatus.inProgress,
            totalXP: 60,
          ),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch40EnToHi1:     return enToHi1Questions;
      case LessonType.ch40EnToHi2:     return enToHi2Questions;
      case LessonType.ch40HiToEn1:     return hiToEn1Questions;
      case LessonType.ch40HiToEn2:     return hiToEn2Questions;
      case LessonType.ch40ChapterQuiz: return chapterFinalQuestions;
      default:                         return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // "The more…the more" motivational pattern
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> moreMorePatterns = [
    {
      'en': 'The more you practice, the better you become.',
      'hi': 'जितना ज्यादा तुम अभ्यास करते हो, उतने ही बेहतर बनते हो।',
    },
    {
      'en': 'The more you face problems, the more you strive to find solutions.',
      'hi': 'जितनी ज्यादा समस्याओं का सामना करते हो, उतना ही समाधान ढूँढने की कोशिश करते हो।',
    },
    {
      'en': 'The more you understand a concept, the nearer you reach to your aim.',
      'hi': 'जितना ज्यादा तुम किसी विषय को समझते हो, उतने ही अपने लक्ष्य के करीब पहुँचते हो।',
    },
    {
      'en': 'The more you try to speak, the more you command a language.',
      'hi': 'जितना ज्यादा बोलने की कोशिश करते हो, उतनी ही ज्यादा भाषा पर पकड़ बनती है।',
    },
    {
      'en': 'The more we experience, the more colors we discover.',
      'hi': 'जितने ज्यादा हम अनुभव लेते हैं, जीवन के उतने ही रंगों से अवगत होते हैं।',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // ENGLISH → HINDI PASSAGES (1–10)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> enToHiPassages = [
    {
      'no': 1,
      'title': 'The Boy & The Gun',
      'titleHi': 'लड़का और बन्दूक',
      'emoji': '🔫',
      'en': 'This is the story of a boy who had to put down his first love \'Guitar\' and get into father\'s business. But all of a sudden, something as such happened which changed his life and made him pick the gun. Earlier, he was absolutely carefree and now he was worried for his family. He had lost a lot in his life. His father was brutally killed. His Mother was shot 10 bullets to dead. Left were only his two sisters and one brother. He picked the gun in revenge but he had to also ensure that if he was caught, what would happen with his siblings. Hence, whatever he did, he would be cautious. He himself punished all the culprits. Nobody could ever know who killed them. There was a doubt but no evidence.',
      'hi': 'ये एक ऐसे लड़के की कहानी है जिसे अपना पहला प्यार गिटार छोड़ना पड़ा और पापा के बिजनेस में लगना पड़ा। पर अचानक कुछ ऐसा हुआ जिसने उसकी जिन्दगी ही बदल दी और उसे बन्दूक उठाने पर मजबूर कर दिया। पहले उसे किसी की परवाह तक नहीं थी और अब वो अपने परिवार की चिन्ता करता था। उसने जीवन में बहुत कुछ खो दिया था। उसके पिता को बेरहमी से मार दिया गया। उसकी माँ को 10 गोलियाँ मारी गईं। सिर्फ बची उसकी दो बहनें और एक भाई। बदले की भावना से उसने बन्दूक उठाई पर उसे ये भी देखना था कि अगर वो पकड़ा गया तो उसके भाई बहनों का क्या होगा। इसलिए वो जो करता, बड़े ध्यान से करता। उसने सभी गुनहगारों को खुद ही सजा दे दी। कोई कभी नहीं जान पाया कि उन लोगों को मारा किसने, शक था पर बिना किसी सबूत के।',
      'vocab': [
        {'word': 'put down', 'meaning': 'छोड़ना'},
        {'word': 'all of a sudden', 'meaning': 'अचानक'},
        {'word': 'carefree', 'meaning': 'बेफिक्र / परवाह न करने वाला'},
        {'word': 'brutally killed', 'meaning': 'बेरहमी से मारा गया'},
        {'word': 'in revenge', 'meaning': 'बदले की भावना से'},
        {'word': 'siblings', 'meaning': 'भाई-बहन'},
        {'word': 'cautious', 'meaning': 'सावधान'},
        {'word': 'culprits', 'meaning': 'गुनहगार'},
        {'word': 'evidence', 'meaning': 'सबूत'},
      ],
    },
    {
      'no': 2,
      'title': 'What is Ambition?',
      'titleHi': 'महत्वाकांक्षा क्या है?',
      'emoji': '🎯',
      'en': 'Ambition is a firm goal that we set for ourselves. It also changes with our experience. As time passes by and we experience lot many new things, which changes the way we take things, either something adds on to our goal or something eliminates. For example, a person wants to become a social worker and he is firm in his idea. Sudden in life, he encounters a terrible phase and he realizes the importance of money, now he sets a target of having good money as well. Now, there are two types of people. Ones are those who change their viewpoint and entirely change their target and otherwise are those who just add money earning to their original idea of social welfare but not at the cost of their original goal. Hence, a goal is not static, but dynamic.',
      'hi': 'महत्वाकांक्षा एक निश्चित लक्ष्य है, जो हम अपने लिए तय करते हैं। यह हमारे अनुभव के साथ-साथ बदलता भी रहता है। जैसे-जैसे समय बीतता है और हम कई नई चीजें अनुभव करते हैं, ये हमारे सोचने के तरीके में बदलाव लाता है, फिर या तो अपने लक्ष्य में हम कुछ और जोड़ देते हैं या कुछ घटा देते हैं। उदाहरण के लिए, माना एक व्यक्ति सोशल वर्कर बनना चाहता है। अचानक जिन्दगी में वो एक बहुत बुरे दौर से गुजरता है और पैसे की महत्ता को महसूस करता है। और अब पैसा कमाना भी अपना उद्देश्य बना लेता है। दो तरह के लोग होते हैं। एक तो वो जो सोच ही बदल लेते हैं और पूरी तरह अपने लक्ष्य को बदल देते हैं। दूसरे वो जो अपने मूल उद्देश्य यानि समाज कल्याण के साथ पैसे कमाने को भी अपने लक्ष्य में जोड़ देते हैं पर अपने मूल उद्देश्य को छोड़ते नहीं। अतः लक्ष्य अचल (static) नहीं चल (dynamic) होता है।',
      'vocab': [
        {'word': 'ambition', 'meaning': 'महत्वाकांक्षा'},
        {'word': 'firm goal', 'meaning': 'निश्चित लक्ष्य'},
        {'word': 'eliminates', 'meaning': 'घटाना / हटाना'},
        {'word': 'encounters', 'meaning': 'सामना करना / गुजरना'},
        {'word': 'viewpoint', 'meaning': 'दृष्टिकोण / सोच'},
        {'word': 'social welfare', 'meaning': 'समाज कल्याण'},
        {'word': 'static', 'meaning': 'अचल / स्थिर'},
        {'word': 'dynamic', 'meaning': 'चल / परिवर्तनशील'},
      ],
    },
    {
      'no': 3,
      'title': 'My First Interview',
      'titleHi': 'मेरा पहला इंटरव्यू',
      'emoji': '💼',
      'en': 'It was Sunday and I had to go for an interview. I got up at about 8, took a bath and got ready. I was a bit scared thinking about the interview. In fact, it was the first time when I was about to face an interview. My friends had told me a lot about how to face but it was obvious that I was scared. I left for the interview venue. When I reached there, I read a quote by Thomas Alva Edison on the board: "I will not say that I failed thousand times, rather I would say, I know thousand ways which can cause failure". This encouraged me and I realized that it didn\'t matter if I failed, rather I must be optimistic for future. Thinking this, I reached at a spacious hall; where already about 50 candidates were sitting. I looked here and there. I saw a receptionist sitting there. I went to her. She asked me for my resume. I provided the same. She had a glance on it and she advised me to have a seat. My name was called after a long wait. The moment I stepped in the interview room, I was straight away asked what I liked the first thing about the venue. I told the interviewer about Edison\'s quote. She got impressed. She asked me just a few more questions and asked me to wait outside. After a little while, a lady called my name and I was informed that I got through. It proved to be one of the best days of my life.',
      'hi': 'रविवार था। मुझे इन्टरव्यू के लिए जाना था। मैं करीब 8 बजे उठा, नहाया और तैयार हो गया। मैं इन्टरव्यू के बारे में सोचकर डरा हुआ था। सच तो ये था कि ये पहली बार था जब मैं इन्टरव्यू देने वाला था। मेरे दोस्तों ने मुझे इन्टरव्यू के बारे में काफी कुछ बताया था पर जाहिर सी बात थी कि मैं डरा हुआ था। मैं निकल पड़ा वहाँ के लिए जहाँ इन्टरव्यू होना था। जब मैं वहाँ पहुँचा, मैंने थॉमस अल्वा एडिसन की कही बात बोर्ड पर पढ़ी, लिखा था "मैं ये नहीं कहूँगा कि मैं हजार बार असफल हुआ, बल्कि मैं तो ये कहूँगा कि मैं ऐसे हजार तरीके जानता हूँ, जिनसे आप सफल नहीं होंगे।" इसने मुझे हौसला दिया और मैंने महसूस किया कि इस बात से फर्क नहीं पड़ता कि मैं असफल हो जाऊँ, बल्कि मुझे तो आशावादी होना चाहिए। ये सोचते हुए, मैं एक बड़े हॉल में पहुँचा, जहाँ करीब 50 लोग बैठे थे। मैंने इधर-उधर देखा। मैंने एक रिसेप्शनिस्ट को देखा, मैं उसके पास गया। उसने मुझसे मेरा रेज्यूमे मांगा, मैंने दिया। उसने मुझे एक नजर देखा और मुझे बैठने की सलाह दी। काफी देर बाद मेरा नाम पुकारा गया। जैसे ही मैंने इन्टरव्यू रूम में कदम रखा, मुझे सीधे ये प्रश्न पूछा गया कि यहाँ सबसे पहली चीज़ मुझे क्या पसन्द आयी। मैंने इन्टरव्यू लेने वाले व्यक्ति को एडिसन की कही बात के बारे में बताया। वो प्रभावित हो गई। उन्होंने मुझे कुछ और प्रश्न पूछे और बाहर इन्तजार करने को कहा। थोड़ी ही देर बाद, एक महिला ने मेरा नाम लिया और मुझे सूचित किया गया कि मैं सिलेक्ट हो गया। ये मेरी जिन्दगी के सबसे अच्छे दिनों में से एक साबित हुआ।',
      'vocab': [
        {'word': 'interview venue', 'meaning': 'इंटरव्यू का स्थान'},
        {'word': 'optimistic', 'meaning': 'आशावादी'},
        {'word': 'spacious', 'meaning': 'विशाल / बड़ा'},
        {'word': 'candidates', 'meaning': 'उम्मीदवार'},
        {'word': 'resume', 'meaning': 'रेज्यूमे / जीवन परिचय'},
        {'word': 'had a glance', 'meaning': 'एक नजर डाली'},
        {'word': 'impressed', 'meaning': 'प्रभावित'},
        {'word': 'got through', 'meaning': 'चुना/सिलेक्ट हो गया'},
      ],
    },
    {
      'no': 4,
      'title': 'Colors of Life',
      'titleHi': 'जिन्दगी के रंग',
      'emoji': '🌈',
      'en': 'Life is called colorful with so many colors in it. Colors are nothing but the reference of several phases of life. Life is given names i.e. Struggling, Beautiful or any other adjective as such. It differs person to person and it all depends on how we take it. We are all born with some innate instincts, positive or negative which differs us in how we celebrate win and how we surpass a loss. Losing a race, by two people might be seen in two different ways. One might consider himself a weaker contender and promise to improvise further whereas the other one might blame his fortune. This exhibits two different behavior patterns of two individuals. However, the way we expect life, is not necessarily what it turns out to be. Hence, our perception about it changes with our experience. The more we experience, the more colors we discover.',
      'hi': 'जिन्दगी को कहा जाता है कि ये कई रंगों से भरी है। रंग कुछ और नहीं जीवन के कई पक्षों को दर्शाते हैं। जिन्दगी को कई विशेषणों से नवाजा जाता है जैसे मुश्किल भरी, खूबसूरत और ऐसे ही कई और विशेषण। ये इस बात पर निर्भर करता है कि अलग-अलग लोग इसे किस तरह समझते हैं। हम सभी का जन्म कुछ स्वाभाविक प्रवृत्तियों के साथ हुआ है। सकारात्मक या नकारात्मक जो हमारी सोच के हिसाब से है कि हम किस तरह अपनी जीत का जश्न मनाते हैं या अपनी हार का शोक। दो लोग एक रेस की हार को दो अलग-अलग तरीकों से ले सकते हैं। हो सकता है कि एक अपने आप को कमजोर समझकर अपने आप को बेहतर बनाने का प्रण ले तो दूसरा अपनी किस्मत को दोष दे। यह दो व्यक्तियों के व्यवहारिक नमूने को दर्शाता है। पर समझने की बात यह है कि जो हम उम्मीद करते हैं, ज़रूरी नहीं कि वही हो। इसलिए, हमारी सोच हमारे अनुभव के साथ बदलती है। जितने ज्यादा हम अनुभव लेते हैं, जीवन के उतने ही रंगों से अवगत होते हैं।',
      'vocab': [
        {'word': 'innate instincts', 'meaning': 'स्वाभाविक प्रवृत्तियाँ'},
        {'word': 'surpass a loss', 'meaning': 'हार से उबरना'},
        {'word': 'contender', 'meaning': 'प्रतिस्पर्धी'},
        {'word': 'improvise', 'meaning': 'बेहतर बनाना'},
        {'word': 'blame his fortune', 'meaning': 'किस्मत को दोष देना'},
        {'word': 'behavior patterns', 'meaning': 'व्यवहारिक नमूने'},
        {'word': 'perception', 'meaning': 'सोच / दृष्टिकोण'},
      ],
    },
    {
      'no': 5,
      'title': 'Criminals',
      'titleHi': 'अपराधी',
      'emoji': '⚖️',
      'en': 'Criminals are those who commit crime for any reason at all. This is the actual definition that we expect from all of us and also we expect such people to be given the title \'criminals\'. However, needless to say that this title is not in fact given to all, who commit crimes and neither, all the people, who are given this title are necessarily criminals. What we often hear is about hidden crimes, which are never unearthed; reasons are many. Sometimes it\'s because the victim is scared of future repercussions to himself/herself or to loved ones and sometimes it\'s because victim is completely unaware of the laws, which might give him/her justice. These crimes are huge in numbers. I believe, Education plays a vital role in minimizing crime rate. Our country will grow if we grow our hereabouts. A revolution doesn\'t demand many but one.',
      'hi': 'अपराधी वो होते हैं जो किसी भी कारणवश अपराध करते हैं। यही वो परिभाषा है जो हम सभी से उम्मीद करते हैं। और ये भी उम्मीद करते हैं कि ऐसे लोगों को अपराधी नाम दिया जाए। पर ये बताने की जरूरत नहीं कि यह नाम वास्तव में सभी अपराधियों को नहीं दिया जाता और यह भी जरूरी नहीं कि जिन्हें दिया जाता है वो अपराधी ही हों। हम अक्सर छिपे हुए अपराधों के बारे में सुनते हैं जो कभी उजागर ही नहीं हुए, कारण कई हैं, कभी-कभी ऐसा इसलिए होता है क्योंकि पीड़ित भविष्य के दुष्परिणामों से डरता है जो उसके साथ या उसके अपनों के साथ हो सकते हैं या फिर कभी इसलिए कि वो कानून के बारे में जानता ही नहीं जो उसे न्याय दे सकते हैं। ये अपराध बहुत अधिक मात्रा में होते हैं। मैं समझता हूँ कि शिक्षा अपराध की दर कम करने में महत्वपूर्ण भूमिका निभाती है। हमारा देश आगे बढ़ेगा अगर हम अपने आस-पास की तरक्की करें। एक क्रान्ति के लिए कई नहीं, एक ही काफी है।',
      'vocab': [
        {'word': 'commit crime', 'meaning': 'अपराध करना'},
        {'word': 'needless to say', 'meaning': 'बताने की जरूरत नहीं'},
        {'word': 'unearthed', 'meaning': 'उजागर हुए'},
        {'word': 'repercussions', 'meaning': 'दुष्परिणाम'},
        {'word': 'victim', 'meaning': 'पीड़ित'},
        {'word': 'vital role', 'meaning': 'महत्वपूर्ण भूमिका'},
        {'word': 'minimizing', 'meaning': 'कम करना'},
        {'word': 'hereabouts', 'meaning': 'आस-पास'},
        {'word': 'revolution', 'meaning': 'क्रान्ति'},
      ],
    },
    {
      'no': 6,
      'title': 'Diwali',
      'titleHi': 'दीवाली',
      'emoji': '🪔',
      'en': 'Diwali is the most important festival of Hindus. This festival is celebrated with joy and happiness. It is a festival of light. The reason of celebrating this festival is that on this day, Lord Rama had come back to Ayodhya after 14 years of exile. On his arrival, people of Ayodhya lighted the whole city with Diyas. Since then, Hindus has been celebrating this festival. It is celebrated with fireworks and crackers. In this festival, distributing sweets has also become a trend. But there is something that we can\'t ignore that on this day, air pollution is on high due to the smoke of crackers.',
      'hi': 'दीवाली हिन्दुओं का सबसे प्रमुख त्योहार है। यह त्योहार हर्षोल्लास से मनाया जाता है। यह रोशनी का त्योहार है। इस त्योहार को मनाने का कारण यह है कि इस दिन भगवान राम 14 वर्षों के वनवास के बाद अयोध्या वापस आये थे। भगवान राम के इस आगमन पर, अयोध्या वासियों ने शहर को दीयों से जगमग कर दिया। तब से, हिन्दू इस त्योहार को मना रहे हैं। इसे पटाखों के साथ मनाया जाता है। इस त्योहार में मिठाई बाँटना भी एक प्रचलन सा बन गया है। पर एक बात है जिसे हम नजरअंदाज नहीं कर सकते कि इस दिन पटाखों के धुएं के कारण वायु प्रदूषण अत्यधिक मात्रा में होता है।',
      'vocab': [
        {'word': 'exile', 'meaning': 'वनवास'},
        {'word': 'arrival', 'meaning': 'आगमन'},
        {'word': 'lighted with Diyas', 'meaning': 'दीयों से जगमग किया'},
        {'word': 'fireworks', 'meaning': 'आतिशबाजी'},
        {'word': 'crackers', 'meaning': 'पटाखे'},
        {'word': 'trend', 'meaning': 'प्रचलन'},
        {'word': 'air pollution', 'meaning': 'वायु प्रदूषण'},
      ],
    },
    {
      'no': 7,
      'title': 'When I was a Kid',
      'titleHi': 'जब मैं बच्चा था',
      'emoji': '🧒',
      'en': 'How cruel I feel I was when I was a kid. I used to kill small creatures like ants, fishes, birds etc without any regret. Every day was a new day of my sin. I would separate the nests off the tree, thinking that the bird would have to face trouble finding her children. Even if kids would die, I would feel no pain. I would make two ants fight and imagine how I would have experienced if I was of their size. I would kill birds with a special weapon called "Gulail". I remember an incidence when I rather ate toffees of the school fee than pay to Class Teacher and next day hid behind the tree. Having been seen, I jumped into a canal and put myself under water thinking they couldn\'t see me, just like a pigeon, closes eyes seeing cat believing that she is not being seen. It\'s something that makes me laugh now. Whatever it was, cute it was. It is true that childhood is like a dream that is to be broken some or the other day.',
      'hi': 'मैं महसूस करता हूँ कि मैं कितना क्रूर था, जब मैं एक बच्चा था। मैं छोटे प्राणियों जैसे चींटी, मछलियों, पक्षियों आदि को मार दिया करता था वो भी बिना किसी पछतावे के। हर दिन मेरे पाप का एक नया दिन था। मैं घोंसलों को पेड़ से अलग कर देता था, ये सोचकर कि चिड़ियों को अपने बच्चों को ढूँढने में दिक्कत झेलनी पड़ेगी। बच्चे चाहे मर जाएँ, मुझे दर्द महसूस भी नहीं होता था। मैं दो चींटियों को लड़ाता था और ये कल्पना करता था कि मुझे कैसा महसूस होता अगर मैं उनके जितने आकार का होता। मैं एक अनोखे हथियार गुलेल से पक्षियों को मार दिया करता था। मुझे एक घटना याद है जब मैंने क्लास टीचर को फीस देने के बजाए उस पैसे की टॉफी खा ली और अगले दिन पेड़ के पीछे छिप गया। और देखे जाने पर, मैं नहर में कूद गया और अपने आप को पानी में घुसा दिया, ये सोचकर कि वो मुझे देख नहीं पायेंगे बिल्कुल एक कबूतर की तरह जो बिल्ली को देखकर आँख बन्द कर लेता है और ये सोचता है कि उसे देखा नहीं जा रहा है। अब ये बात मुझे हँसा देती है। पर जो कुछ भी था ये, बहुत प्यारा था। यह सच है कि बचपन एक सपने की तरह है जिसे एक न एक दिन टूटना ही है।',
      'vocab': [
        {'word': 'cruel', 'meaning': 'क्रूर'},
        {'word': 'regret', 'meaning': 'पछतावा'},
        {'word': 'nests', 'meaning': 'घोंसले'},
        {'word': 'incidence', 'meaning': 'घटना'},
        {'word': 'canal', 'meaning': 'नहर'},
        {'word': 'pigeon', 'meaning': 'कबूतर'},
        {'word': 'Gulail', 'meaning': 'गुलेल (slingshot)'},
      ],
    },
    {
      'no': 8,
      'title': 'Recent Incidents in Delhi',
      'titleHi': 'दिल्ली की हाल की घटनाएँ',
      'emoji': '📢',
      'en': 'Recent incidents have threatened Delhi. People are in a dilemma what to do. They are quite agitated due to increasing crimes against women. Its witness is people\'s protest at Jantar Mantar. But only protest is not our aim but we want our views to be reached to Government. In future, such incidents might happen with our loved ones too. Such shameful incidents defame our nation. If we really want to stop these, we will have to raise our voice.',
      'hi': 'हाल ही में हुई घटनाओं ने दिल्ली को दहला दिया है। लोग समझ नहीं पा रहे हैं कि वो करें तो क्या करें। महिलाओं के साथ हो रहे जुल्म के खिलाफ लोग काफी आक्रोश में हैं, जिसका सबूत है जन्तर मन्तर पर हो रहा लोगों का विरोध प्रदर्शन। पर विरोध करना ही हमारा उद्देश्य नहीं है बल्कि हम सरकार तक अपनी बात पहुँचाना चाहते हैं। कल ऐसी घटनाएँ हमारे किसी अपने के साथ भी हो सकती हैं। इस तरह की शर्मनाक घटनाएँ हमारे देश को बदनाम करती हैं। अगर हम सही मायने में इन घटनाओं को रोकना चाहते हैं तो हमें आवाज उठानी होगी।',
      'vocab': [
        {'word': 'threatened', 'meaning': 'दहला दिया / खतरे में डाला'},
        {'word': 'dilemma', 'meaning': 'दुविधा'},
        {'word': 'agitated', 'meaning': 'आक्रोश में / उत्तेजित'},
        {'word': 'protest', 'meaning': 'विरोध प्रदर्शन'},
        {'word': 'defame', 'meaning': 'बदनाम करना'},
        {'word': 'raise our voice', 'meaning': 'आवाज उठाना'},
      ],
    },
    {
      'no': 9,
      'title': 'Poverty',
      'titleHi': 'गरीबी',
      'emoji': '🏚️',
      'en': 'Poverty is a malediction for our society. If you really want to realize what poverty is, then you must interact with people who live in slums. Talk to them, ask them about their lives, their past and then see how difficult their lives have been. I lived a middle class life and always got almost everything that I wanted, even though I had to ask my dad for many a time. I firmly believe that pain ideally is realized by the one who goes through, not by everybody. Indian Government has put in several efforts to improvise their lives, Huge is the number of NGOs, which claim to help the needy but implementation is not up to the mark and the major reasons of Government\'s failure is nothing but the corruption.\n\nIn fact, poverty and corruption go hand by hand. Both are mutually related to a great extent. If you are poor, you tend to do anything and everything that can get you some money and that\'s where corruption comes from. However, there are numerous examples, where even the rich are corrupt due to the greediness for having more money.',
      'hi': 'गरीबी हमारे समाज के लिए एक अभिशाप है। अगर वास्तव में गरीबी को महसूस करना चाहते हो, तो आपको उन लोगों से मिलना चाहिए जो गन्दी बस्ती में रहते हैं। उनसे बात करो, उन्हें पूछो उनके जीवन के बारे में, उनके बीते कल के बारे में और फिर देखो उनकी जिन्दगी कितनी मुश्किल रही है। मैंने एक मध्यम स्तर की जिन्दगी जी और लगभग वो हर चीज पाई जो मैंने चाही, हालाँकि मुझे अपने पिता से कई बार कहना पड़ा। मैं ये विश्वास करता हूँ कि दर्द सही मायने में वही महसूस करता है, जो उससे गुजरता है, हर कोई नहीं। भारत सरकार ने उनके जीवन सुधार हेतु कई प्रयास किये हैं, कई सारे गैर सरकारी संस्थान (NGO) हैं जो जरूरतमंदों की मदद करने का दावा करते हैं पर वास्तविकता कुछ और है और सरकार की असफलता का मुख्य कारण कुछ और नहीं बल्कि भ्रष्टाचार है।\n\nवास्तव में, गरीबी और भ्रष्टाचार साथ-साथ चलते हैं। दोनों एक दूसरे से काफी हद तक जुड़े हुए हैं। अगर आप गरीब हो, तो पैसा प्राप्त करने हेतु आप कुछ भी करने को तत्पर रहते हो और यहीं से जन्म होता है भ्रष्टाचार का। पर फिर भी, कई ऐसे उदाहरण हैं जहाँ अमीर भी ज्यादा पैसे के लालच में भ्रष्ट होते हैं।',
      'vocab': [
        {'word': 'malediction', 'meaning': 'अभिशाप'},
        {'word': 'slums', 'meaning': 'गन्दी बस्ती'},
        {'word': 'middle class', 'meaning': 'मध्यम वर्ग'},
        {'word': 'implementation', 'meaning': 'वास्तविकता / कार्यान्वयन'},
        {'word': 'not up to the mark', 'meaning': 'उचित नहीं'},
        {'word': 'corruption', 'meaning': 'भ्रष्टाचार'},
        {'word': 'go hand by hand', 'meaning': 'साथ-साथ चलना'},
        {'word': 'greediness', 'meaning': 'लालच'},
      ],
    },
    {
      'no': 10,
      'title': 'Uncertainty of Life',
      'titleHi': 'जीवन की अनिश्चितता',
      'emoji': '🌊',
      'en': 'Life is full of uncertainty. It is difficult to say about future as what we think is not necessarily going to happen. But it doesn\'t mean that we leave putting efforts. We must improvise on every next day, as in we must make everyday count. Someone has said, whatever we expect, we often achieves lesser. If it is true why don\'t we aim at more than what we dream so that we might get what we want. No matter what fortune has for us, efforts mustn\'t remain below the mark.',
      'hi': 'जीवन अनिश्चितताओं से भरा है। कल के बारे में कह पाना मुश्किल है क्योंकि जो हम सोचते हैं वैसा ही हो, ज़रूरी नहीं है। पर इसका यह अर्थ भी नहीं कि हम प्रयास करना छोड़ दें। हमें हर दिन अपने आप को पहले से बेहतर बनाना चाहिए। यानी हमें हर दिन को पूरी तरह जीना चाहिए। किसी ने कहा है कि जितना हमारे मन में है, हम अक्सर उससे कम ही पाते हैं। यदि ये सच है तो हम क्यों न उससे ज्यादा को लक्ष्य बनायें ताकि हमें उतना ही मिल जाए, जितना हम चाहते हैं। भविष्य में चाहे जो हो, प्रयास कभी कम न रह जाएँ।',
      'vocab': [
        {'word': 'uncertainty', 'meaning': 'अनिश्चितता'},
        {'word': 'improvise', 'meaning': 'बेहतर बनाना'},
        {'word': 'make everyday count', 'meaning': 'हर दिन को पूरी तरह जीना'},
        {'word': 'fortune', 'meaning': 'भाग्य / किस्मत'},
        {'word': 'below the mark', 'meaning': 'कम / उचित स्तर से नीचे'},
      ],
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // HINDI → ENGLISH PASSAGES (1–20)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, String>> hiToEnPassages = [
    {
      'no': '1',
      'titleHi': 'तुम मेरे अच्छे दोस्त हो',
      'titleEn': 'You are my good friend',
      'emoji': '🤝',
      'hi': 'मैं कभी कभी सोचता हूँ कि तुम मेरे साथ बैठो और कुछ अच्छी बातें चल रही हों पर मैं जानता हूँ कि ये उतना आसान नहीं है। हालाँकि मैं जानता हूँ कि हम पूरी तरह अलग हैं। तुम बहुत अच्छी लड़की हो और मैं बहुत बुरा लड़का हूँ। पर सच में, मैं अपने आप को बदलने की कोशिश करूंगा। मैं काफी हद तक अपने आप को बदल भी चुका हूँ। तुम मुझे क्यों नहीं समझती? पर मैं तुम्हें दोष नहीं दूंगा। यह तुम्हारे और मेरे बीच की बात है। हम दोनों अच्छे दोस्त हैं। जब मेरे साथ कोई नहीं था, तुम तब भी मेरे साथ थी। मैं तुम्हारा आभारी हूँ।',
      'en': 'I sometimes think that you sit with me and an interesting talk is going on but I know, it\'s not that easy. Though, I know we are different altogether. You are a very nice girl and I am a bad boy. But seriously, I will try to change myself. I have even changed myself to a great extent. Why don\'t you understand me? But I will not blame you. This is between you and me. We both are good friends. When nobody was with me, you were still with me. I am grateful to you.',
    },
    {
      'no': '2',
      'titleHi': 'मेरा रुटीन',
      'titleEn': 'My Daily Routine',
      'emoji': '📅',
      'hi': 'आप कैसे हैं? मैं अच्छा हूँ। आप बताइए? मैं भी अच्छा हूँ। आप की फैमिली कैसी है? अच्छी है। आपका रुटीन क्या है? मैं सुबह 6 बजे उठता हूँ। नहाता हूँ। उसके बाद घूमने जाता हूँ। पार्क में घूमना अच्छा लगता है। फिर वापस आ जाता हूँ। कल जब मैं घूमने गया, मैंने एक बन्दर देखा। उसके पास दो पैन थे। चलो छोड़ो। वापस आने के बाद मैं नाश्ता करता हूँ। मेरी मम्मी बहुत अच्छा खाना बनाती हैं। खाने के बाद मैं ऑफिस चला जाता हूँ। मैं 10 बजे ऑफिस पहुँचता हूँ। प्रोजेक्ट बनाता हूँ। 2 बजे लंच करता हूँ। अंगड़ाई लेता हूँ। 4 बजे ऑफिस से निकलता हूँ। 5 बजे घर पहुँचता हूँ। फिर थोड़ा पढ़ाई करता हूँ। पढ़ाई के बाद, थोड़ा खेलता हूँ। खेलने के बाद, पूजा करता हूँ। न्यूज देखता हूँ। न्यूज देखना अच्छा लगता है। मैं अभी भी न्यूज देख रहा हूँ। साथ में खाना भी खा रहा हूँ। 10 बजे सोने जाता हूँ।',
      'en': 'How are you? I am fine. You tell me? I am fine too. How is your family? Good. What is your routine? I get up at 6 o\'clock in the morning, take a bath and then go for a walk. I like walking in the park. Then I come back. Yesterday when I went for a walk, I saw a monkey having two pens. Leave it. After coming back, I take breakfast. My mom cooks pretty nice food. After having food, I go to office. I reach office at 10 o\'clock. I prepare the project. I take lunch at 2 o\'clock. I stretch. I leave office at 4. I reach home at 5. Then I study bit. After studying, I play for a while. After playing, I worship. I watch news. I like watching News. I am still watching it and eating the food as well. At 10, I go to bed.',
    },
    {
      'no': '3',
      'titleHi': 'एक दूसरे को समझें',
      'titleEn': 'Let\'s Understand Each Other',
      'emoji': '💬',
      'hi': 'वे चार लड़कियाँ हैं और तुम केवल दो लड़के हो। उनके पास दिमाग है और तुम्हारे पास काम है। तुम अगर मिल कर काम करो तो सब ठीक हो सकता है। इस दुनिया में सब कुछ सम्भव है। तुमने कभी उनसे बात की इस बारे में? मैं तो कभी नहीं कर पाया। अगली बार जब तुम यहाँ जाओ तो उनसे जरूर मिलना। वे बहुत अच्छे इन्सान हैं। सभी लड़कियाँ अपना काम समय पर करती हैं। तुम भी करते हो पर कमी रह जाती है। क्या तुम मेरे बारे में जानते हो? मुझे ऐसा नहीं लगता। मुझे वो घड़ी मिली पर मैंने वापिस कर दी। क्या मैंने अच्छा नहीं किया? तुमने हमेशा मुझे गलत समझा पर मैंने तुम्हें दोस्त समझा। आज वक्त आ चुका है कि हम एक दूसरे को समझें।',
      'en': 'They are four girls and you are only 2 boys. They have mind and you have work. If you work together, then everything can be alright. Everything is possible in this world. Did you talk to them about this? I could never do. When you go there next time, meet them for sure. They are very nice human beings. All the girls finish their work in time. You also do but something misses. Do you know about me? I don\'t think so. I found that watch but I returned. Did I not do well? You always took me wrong but I took you as a friend. Now the time has come that we understand each other.',
    },
    {
      'no': '4',
      'titleHi': 'तन्हाई में',
      'titleEn': 'In My Loneliness',
      'emoji': '🚶',
      'hi': 'मैं कहीं जा रहा हूँ। मुझे नहीं पता कहाँ? शायद वहीं जहाँ मैं तन्हाई में जाता हूँ। बड़ा सुकून मिलता है। मन्दिरों की घंटियों की आवाज सुनाई देती है। ऐसा लगता है जैसे भगवान मेरे बहुत पास है। मैं पिछले 4 घंटे से चल रहा हूँ। पर अभी भी वहाँ नहीं पहुँचा हूँ। जानते हो क्यों? क्योंकि मैं तुमसे फोन पर बात भी कर रहा हूँ। करीब 2 घंटे हो चुके हैं। पता है? एक हाथी दिख रहा है। बड़ा प्यारा सा है। लगता है ये 1 साल का है। मुझे जानवरों का बहुत तजुर्बा है। मैं आसानी से जानवरों की उम्र बता सकता हूँ।',
      'en': 'I am going somewhere. I don\'t know where? Most probably, the place where I go in my loneliness. I feel good. The sound of temple\'s bells is heard. It seems as God is just quite nearby me. I have been walking for last 4 hours but not reached there yet. You know why? Because I\'ve been talking to you over the phone as well. It has been about 2 hrs. You know what? I can see an elephant. He is very cute. It looks a year old. I have rich experience about animals. I can easily figure out animals\' age.',
    },
    {
      'no': '5',
      'titleHi': 'मैं पक चुका हूँ',
      'titleEn': 'I am Fed Up',
      'emoji': '😤',
      'hi': 'मैं काम कर चुका हूँ पर तुम पूछते ही नहीं हो। मैं तुमसे अनुरोध करता हूँ कि तुम पूछा करो। पता नहीं तुम क्या कर रहे हो। हमें एक दूसरे से पूछना चाहिए। मैं जानता हूँ यह आसान नहीं है पर नामुमकिन कुछ भी नहीं। हम दोनों सोच में बिल्कुल अलग हैं। ऐसा क्यों है? इसलिए क्योंकि हम कभी काम के बारे में बात नहीं करते? मैं नहीं जानता कि तुम क्या सोचते हो? मैं पक चुका हूँ। क्या तुम नहीं पके? शायद तुम भी, पर तुम कभी बताते नहीं। मैं तुम्हारी बहुत इज़्ज़त करता हूँ। पर इसका यह मतलब नहीं कि तुम मेरी परेशानी समझो ही नहीं।',
      'en': 'I have worked but you don\'t ask. I request you that you ask. I don\'t know what you are doing. We must ask each other. I know it\'s not easy but nothing is impossible. We both are different altogether in thinking. Why is it? Is it because we never talk about work? I don\'t know what you think? I am fed up. Aren\'t you? Perhaps, you too but you never express. I respect you a lot but it doesn\'t mean that you don\'t even understand my problems.',
    },
    {
      'no': '6',
      'titleHi': 'क्या तुमने उससे बात की?',
      'titleEn': 'Did you talk to him?',
      'emoji': '📞',
      'hi': 'तुमने कभी उससे बात की इस बारे में? किस बारे में? दोस्त, तुम भूल जाते हो। हम कभी भी काम के बारे में बात नहीं करते। मैं पिछले 4 घंटे से कोशिश कर रहा हूँ। तुमसे फोन पर बात भी की पर कोई फायदा नहीं हुआ। तुम्हें क्या लगता है कि मैं पागल हूँ! मैंने ऐसा तो नहीं कहा। चलो छोड़ो। आज ऐसा लग रहा है जैसे मैंने तुम्हें खो दिया हो। क्या तुमने राम को कभी देखा है? हाँ देखा तो है पर भूल गया हूँ उसका चेहरा।',
      'en': 'Did you ever talk to him on this matter? About what? Mate, you forget. We never discuss about work. I have been trying for last 4 hours. We even had a talk over the phone but of no use. What do you think, I am mad! I didn\'t say so. Anyways Leave it. Now, I feel as if I have lost you. Have you ever seen Ram? Yes I have but I\'ve forgotten his face.',
    },
    {
      'no': '7',
      'titleHi': 'अजीब माहौल',
      'titleEn': 'A Weird Atmosphere',
      'emoji': '😨',
      'hi': 'यहाँ बहुत अजीब सा माहौल है। आप कैसे हैं? मैं ठीक हूँ। क्या आपने आज अखबार देखा? नहीं, अभी नहीं देखा। मैंने देखा। बहुत सारी बुरी खबरें हैं। कल कुछ लोगों ने कुछ लड़कियों के साथ बहुत बुरा किया। क्या आप उसके बारे में बात कर रहे हैं? हाँ, मैं यही बात कर रहा हूँ। बहुत बुरा है न? हाँ बहुत बुरा है। मुझे डर लग रहा है। कैसा डर? मुझे नहीं पता। बहुत बुरा लग रहा है। आपने कभी ऐसा महसूस किया है? हाँ कई बार। आप कैसे डील करते हैं? मैं कुछ नहीं करता। बस काम में लग जाता हूँ। इससे मन हल्का हो जाता है।',
      'en': 'It\'s a very weird atmosphere. How are you? I am fine. Did you see the newspaper today? No, not yet. I saw. There are a lot of bad news. Yesterday some people did something very bad with some girls. Are you talking about that? Yes, I am talking about the same. It\'s very bad, isn\'t it? Yes, it\'s very bad. I am scared. What kind of fear? I don\'t know. I feel very bad. Have you ever felt like that? Yes many times. How do you deal? I don\'t do anything. I just keep myself busy. It gives me relief.',
    },
    {
      'no': '8',
      'titleHi': 'ऑफिस कैंटीन का खाना',
      'titleEn': 'Office Canteen Food',
      'emoji': '🍱',
      'hi': 'मैं उस दिन घर नहीं गया था। मैं ऑफिस गया था। क्या तुम उस दिन ऑफिस गये थे? नहीं, मैं उस दिन ऑफिस नहीं गया था। मैं घर पर था। तुम क्या कर रहे थे? मैं टी.वी. देख रहा था। क्या तुमने खाना खाया था? हाँ, मैंने खाना खाया था। क्या खाना अच्छा था? हाँ, बहुत अच्छा था। मैंने भी खाना खाया था पर मेरा खाना अच्छा नहीं था। तुमने कहाँ खाया? मैंने ऑफिस के कैंटीन में खाया। वहाँ का खाना अच्छा नहीं होता। हाँ, मैं जानता हूँ। मैंने भी कई बार खाया है। तुमने क्या खाया? मैंने दाल चावल खाया। बस इतना ही? हाँ, बस इतना ही।',
      'en': 'I didn\'t go home that day. I went to office. Did you go to office that day? No, I didn\'t go to office that day. I was at home. What were you doing? I was watching TV. Did you have food? Yes, I had food. Was the food good? Yes, it was very good. I also had food but my food was not good. Where did you eat? I ate in office canteen. The food there is not good. Yes, I know. I have also eaten many times. What did you eat? I ate daal rice. Only that? Yes, only that.',
    },
    {
      'no': '9',
      'titleHi': 'क्या तुम मुझसे प्यार करते हो?',
      'titleEn': 'Do you love me?',
      'emoji': '💕',
      'hi': 'मैं तुमसे कुछ कहना चाहता हूँ। कहो। तुम मुझसे नाराज़ तो नहीं हो? नहीं, मैं तुमसे नाराज़ नहीं हूँ। फिर तुम मुझसे बात क्यों नहीं कर रहे हो? मैं कर रही हूँ। नहीं, तुम नहीं कर रही हो। तुम क्यों ऐसा कह रहे हो? क्योंकि तुम मुझसे आँख मिलाकर बात नहीं कर रही हो। ऐसा कुछ नहीं है। मैं बस थकी हुई हूँ। थकी हुई हो तो आराम करो। ठीक है। मैं चलता हूँ। रुको। क्या हुआ? मैं तुमसे कुछ पूछना चाहती हूँ। पूछो। क्या तुम मुझसे प्यार करते हो? यह क्या सवाल है? मुझे जवाब दो। हाँ, मैं करता हूँ। सच में? सच में। मैं भी तुमसे प्यार करती हूँ।',
      'en': 'I want to tell you something. Say. You are not angry with me, are you? No, I am not angry with you. Then why are you not talking to me? I am talking. No, you are not. Why are you saying so? Because you are not talking to me making eye contact. Nothing like that. I am just tired. If you are tired, take rest. Okay. I am leaving. Wait. What happened? I want to ask you something. Ask. Do you love me? What kind of question is this? Answer me. Yes, I do. Really? Really. I also love you.',
    },
    {
      'no': '10',
      'titleHi': 'बिजली का बिल',
      'titleEn': 'Electricity Bill',
      'emoji': '❄️',
      'hi': 'आज बहुत गर्मी है। हाँ, बहुत गर्मी है। तुमने एसी चलाया क्या? हाँ, चलाया है। कितने डिग्री पर? 24 डिग्री पर। 24 डिग्री बहुत होता है। मुझे 22 डिग्री पर चाहिए। तुम अपने घर में 22 डिग्री पर चलाओ। मैं यहाँ 24 डिग्री पर चलाऊँगा। तुम्हारा बिजली का बिल कितना आता है? लगभग 2000 रुपये। इतना ज्यादा? हाँ, इतना ज्यादा। तुम्हारा कितना आता है? मेरा लगभग 1500 रुपये। तुम एसी कितना चलाते हो? मैं रात में 5-6 घंटे चलाता हूँ। मैं भी लगभग इतना ही चलाता हूँ। फिर तुम्हारा बिल कम क्यों आता है? क्योंकि मेरा एसी 5 स्टार है। अच्छा, यही कारण है। हाँ।',
      'en': 'It\'s very hot today. Yes, it\'s very hot. Did you turn on the AC? Yes, I have. At what temperature? At 24 degrees. 24 degrees is too much. I need at 22 degrees. You run at 22 degrees at your home. I will run at 24 degrees here. What is your electricity bill? Around 2000 rupees. So much? Yes, so much. How much is yours? Mine is around 1500 rupees. How much do you run AC? I run it for 5-6 hours at night. I also run almost that much. Then why is your bill less? Because my AC is 5 star. Oh, that\'s the reason. Yes.',
    },
    {
      'no': '11',
      'titleHi': 'बीमारी की खबर',
      'titleEn': 'News of Illness',
      'emoji': '🤒',
      'hi': 'मैं कल तुम्हारे घर आना चाहता था पर आ नहीं सका। क्यों? क्योंकि मैं बीमार था। क्या हुआ था? मुझे बुखार था। कितना बुखार था? 102 डिग्री। इतना ज्यादा? हाँ। अब तुम ठीक हो? हाँ, अब मैं ठीक हूँ। डॉक्टर को दिखाया था? हाँ, दिखाया था। क्या दवा दी? कुछ दवाएँ दी थीं। मैंने वो सब ले लीं। अब बिल्कुल ठीक हूँ। अच्छा है। कल मैं तुम्हारे घर आऊँगा। ठीक है। कितने बजे आओगे? शाम को लगभग 5 बजे। ठीक है। मैं तुम्हारा इन्तजार करूंगा।',
      'en': 'I wanted to come to your home yesterday but I couldn\'t. Why? Because I was ill. What happened? I had fever. How much fever? 102 degrees. So high? Yes. Are you fine now? Yes, I am fine now. Did you see the doctor? Yes, I did. What medicine did he give? He gave some medicines. I took all of them. I am perfectly fine now. Good. I will come to your home tomorrow. Okay. At what time will you come? Around 5 in the evening. Okay. I will wait for you.',
    },
    {
      'no': '12',
      'titleHi': 'किताब खरीदना',
      'titleEn': 'Buying a Book',
      'emoji': '📚',
      'hi': 'तुमने ये किताब कहाँ से खरीदी? मैंने ये किताब ऑनलाइन खरीदी। कितने की है? 500 रुपये की। इतनी महँगी? हाँ, थोड़ी महँगी है। पर ये बहुत अच्छी है। मैं भी ये किताब पढ़ना चाहता हूँ। तुम इसे पढ़ सकते हो। मैं पढ़ लूँ तो तुम्हें दे दूंगा। ठीक है। तुम्हें कितने दिन लगेंगे? शायद 10 दिन। ठीक है। मैं 10 दिन बाद तुमसे ले लूंगा।',
      'en': 'From where did you buy this book? I bought this book online. How much is it? It is 500 rupees. So expensive? Yes, it\'s a little expensive. But it\'s very good. I also want to read this book. You can read it. I will give it to you after I finish. Okay. How many days will you take? Probably 10 days. Okay. I will take it from you after 10 days.',
    },
    {
      'no': '13',
      'titleHi': 'बाजार जाना',
      'titleEn': 'Going to Market',
      'emoji': '🛒',
      'hi': 'तुम कहाँ जा रहे हो? मैं बाजार जा रहा हूँ। क्या खरीदने जा रहे हो? सब्जी खरीदने। कौन सी सब्जी? आलू, प्याज, टमाटर। और कुछ? नहीं, बस इतना ही। तुम भी चलोगे? नहीं, मैं नहीं चल सकता। मेरा काम है। ठीक है। मैं अकेला चला जाता हूँ। ठीक है। जल्दी आना। मैं जल्दी आ जाऊँगा।',
      'en': 'Where are you going? I am going to the market. What are you going to buy? To buy vegetables. Which vegetables? Potato, onion, tomato. Anything else? No, only this much. Will you also come? No, I can\'t come. I have work. Okay. I will go alone. Okay. Come soon. I will come soon.',
    },
    {
      'no': '14',
      'titleHi': 'फिल्म देखना',
      'titleEn': 'Watching a Movie',
      'emoji': '🎬',
      'hi': 'मैंने कल एक फिल्म देखी। कौन सी फिल्म? \'द कश्मीर फाइल्स\'। कैसी थी? बहुत अच्छी थी। किसने डायरेक्ट की है? विवेक अग्निहोत्री ने। किस किस ने अभिनय किया है? अनुपम खेर, मिथुन चक्रवर्ती और कई अन्य कलाकार। यह फिल्म किस बारे में है? यह कश्मीरी पंडितों के पलायन के बारे में है। बहुत दुखद कहानी है। हाँ, बहुत दुखद है। मैं भी यह फिल्म देखना चाहता हूँ। तुम देख सकते हो। अभी सिनेमा हॉल में लगी है? हाँ, लगी है।',
      'en': 'I saw a movie yesterday. Which movie? \'The Kashmir Files\'. How was it? It was very good. Who directed it? Vivek Agnihotri. Who acted in it? Anupam Kher, Mithun Chakraborty and many other artists. What is this movie about? It is about the exodus of Kashmiri Pandits. Very sad story. Yes, very sad. I also want to watch this movie. You can watch. Is it still playing in cinema hall? Yes, it is.',
    },
    {
      'no': '15',
      'titleHi': 'खाना खाना',
      'titleEn': 'Having Food',
      'emoji': '🍛',
      'hi': 'तुमने खाना खाया? हाँ, खा लिया। क्या खाया? दाल रोटी। अच्छा। मैंने अभी तक नहीं खाया। क्यों? भूख नहीं लगी थी। अब भूख लगी है? हाँ, अब भूख लगी है। तो जाकर खा लो। चलो साथ में खाते हैं। ठीक है। चलो।',
      'en': 'Did you have food? Yes, I had. What did you eat? Daal roti. Good. I haven\'t eaten yet. Why? I wasn\'t hungry. Are you hungry now? Yes, I am hungry now. Then go and eat. Let\'s eat together. Okay. Let\'s go.',
    },
    {
      'no': '16',
      'titleHi': 'तेज़ बारिश',
      'titleEn': 'Heavy Rain',
      'emoji': '🌧️',
      'hi': 'आज बहुत तेज़ बारिश हो रही है। हाँ, बहुत तेज़। तुमने छाता लिया? नहीं, मैं छाता भूल गया। तो तुम भीग जाओगे। हाँ, मैं भीग जाऊँगा। मैं तुम्हें अपना छाता दे दूँ? नहीं, तुम इसे रखो। मैं ऑटो ले लूँगा। ठीक है। फिर मैं चलता हूँ। ठीक है। ध्यान रखना।',
      'en': 'It\'s raining very heavily today. Yes, very heavy. Did you take an umbrella? No, I forgot the umbrella. Then you will get wet. Yes, I will get wet. Shall I give you my umbrella? No, you keep it. I will take an auto. Okay. Then I am leaving. Okay. Take care.',
    },
    {
      'no': '17',
      'titleHi': 'जन्मदिन की पार्टी',
      'titleEn': 'Birthday Party',
      'emoji': '🎂',
      'hi': 'तुम्हारा जन्मदिन कब है? 15 अगस्त को। अच्छा, स्वतंत्रता दिवस पर। हाँ। तुम कैसे मनाओगे? मैं एक छोटी सी पार्टी रखूँगा। किस किस को बुलाओगे? सिर्फ करीबी दोस्तों को। अच्छा। मैं भी आऊंगा। जरूर आना।',
      'en': 'When is your birthday? On 15th August. Oh, on Independence Day. Yes. How will you celebrate? I will have a small party. Whom will you invite? Only close friends. Good. I will also come. Do come for sure.',
    },
    {
      'no': '18',
      'titleHi': 'रामचरितमानस पढ़ना',
      'titleEn': 'Reading Ramcharitmanas',
      'emoji': '📖',
      'hi': 'तुम क्या कर रहे हो? मैं किताब पढ़ रहा हूँ। कौन सी किताब? \'रामचरितमानस\'। बहुत अच्छी किताब है। हाँ, बहुत अच्छी है। तुमने यह किताब कब से पढ़नी शुरू की? पिछले हफ्ते से। कितने पन्ने पढ़ लिए? लगभग 100 पन्ने। बहुत अच्छा। मैंने भी यह किताब पढ़ी है। कैसी लगी? बहुत अच्छी लगी। रामचरितमानस में बहुत सीखने को मिलता है। हाँ, बिल्कुल।',
      'en': 'What are you doing? I am reading a book. Which book? \'Ramcharitmanas\'. It\'s a very good book. Yes, very good. Since when did you start reading this book? Since last week. How many pages have you read? About 100 pages. Very good. I have also read this book. How did you like it? I liked it very much. There is a lot to learn from Ramcharitmanas. Yes, absolutely.',
    },
    {
      'no': '19',
      'titleHi': 'एक दिन की कहानी',
      'titleEn': 'A Day\'s Story',
      'emoji': '📋',
      'hi': 'तुमने आज क्या किया? मैं सुबह उठा, नहाया, नाश्ता किया और फिर ऑफिस चला गया। ऑफिस में क्या किया? मैंने एक मीटिंग अटेंड की। किस बारे में? नए प्रोजेक्ट के बारे में। अच्छा। फिर क्या किया? फिर मैंने लंच किया और शाम को घर आ गया। अब तुम क्या कर रहे हो? अब मैं टी.वी. देख रहा हूँ। क्या देख रहे हो? न्यूज़ देख रहा हूँ। क्या खबर है? कुछ खास नहीं।',
      'en': 'What did you do today? I woke up in the morning, took a bath, had breakfast and then went to office. What did you do in office? I attended a meeting. About what? About the new project. Good. Then what did you do? Then I had lunch and came home in the evening. What are you doing now? I am watching TV now. What are you watching? I am watching news. What\'s the news? Nothing special.',
    },
    {
      'no': '20',
      'titleHi': 'कल कहाँ थे?',
      'titleEn': 'Where Were You Yesterday?',
      'emoji': '🏠',
      'hi': 'तुम कल कहाँ थे? मैं कल घर पर था। पूरे दिन? हाँ, पूरे दिन। क्या कर रहे थे? मैंने सारा दिन आराम किया। अच्छा। तुमने कोई काम नहीं किया? नहीं, मैंने कोई काम नहीं किया। मुझे आराम की जरूरत थी। तुम बीमार थे क्या? नहीं, मैं बीमार नहीं था। बस थका हुआ था। ठीक है। अब तुम ठीक हो? हाँ, अब मैं ठीक हूँ।',
      'en': 'Where were you yesterday? I was at home yesterday. The whole day? Yes, the whole day. What were you doing? I rested the whole day. Good. Did you not do any work? No, I didn\'t do any work. I needed rest. Were you ill? No, I wasn\'t ill. I was just tired. Okay. Are you fine now? Yes, I am fine now.',
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 1 (English → Hindi, Passages 1–5)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> enToHi1Questions = [
    QuizQuestion(
      questionEn: 'What does "all of a sudden" mean?',
      questionHi: '"all of a sudden" का अर्थ?',
      options: ['धीरे-धीरे', 'अचानक', 'जानबूझकर', 'अंत में'],
      correctIndex: 1,
      explanation: '"All of a sudden" = अचानक. Used in Passage 1: "all of a sudden, something happened..."',
    ),
    QuizQuestion(
      questionEn: 'In Passage 1, why was the boy cautious?',
      questionHi: 'Passage 1 में लड़का सावधान क्यों था?',
      options: [
        'वो डरपोक था',
        'उसे नहीं पता था',
        'अगर पकड़ा जाता तो भाई-बहनों का क्या होता',
        'वो कमज़ोर था'
      ],
      correctIndex: 2,
      explanation: 'He had to ensure that if he was caught, what would happen with his siblings.',
    ),
    QuizQuestion(
      questionEn: 'What does "static" mean? (Passage 2)',
      questionHi: '"Static" का हिंदी अर्थ? (Passage 2)',
      options: ['चल', 'परिवर्तनशील', 'अचल / स्थिर', 'जटिल'],
      correctIndex: 2,
      explanation: '"Static" = अचल / स्थिर. Opposite of dynamic. "A goal is not static, but dynamic."',
    ),
    QuizQuestion(
      questionEn: 'What quote did Edison say? (Passage 3)',
      questionHi: 'Passage 3 में Edison की बात?',
      options: [
        'I failed thousand times.',
        'I know thousand ways which can cause failure.',
        'Success is the only option.',
        'Never give up.'
      ],
      correctIndex: 1,
      explanation: '"I know thousand ways which can cause failure" — meaning he gained knowledge from each failure.',
    ),
    QuizQuestion(
      questionEn: 'What does "innate instincts" mean? (Passage 4)',
      questionHi: '"Innate instincts" का अर्थ? (Passage 4)',
      options: ['सीखी हुई बातें', 'स्वाभाविक प्रवृत्तियाँ', 'बाहरी प्रभाव', 'अनुभव'],
      correctIndex: 1,
      explanation: '"Innate instincts" = स्वाभाविक प्रवृत्तियाँ — born within us, not learned.',
    ),
    QuizQuestion(
      questionEn: 'What does "unearthed" mean? (Passage 5 — Criminals)',
      questionHi: '"Unearthed" का अर्थ? (Passage 5)',
      options: ['दफनाया गया', 'उजागर किया गया', 'छिपाया गया', 'नष्ट किया गया'],
      correctIndex: 1,
      explanation: '"Unearthed" = उजागर किया गया. "Hidden crimes, which are never unearthed."',
    ),
    QuizQuestion(
      questionEn: 'What does "culprits" mean? (Passage 1)',
      questionHi: '"Culprits" का अर्थ?',
      options: ['गवाह', 'पुलिस', 'गुनहगार', 'पीड़ित'],
      correctIndex: 2,
      explanation: '"Culprits" = गुनहगार (wrongdoers/offenders).',
    ),
    QuizQuestion(
      questionEn: 'In Passage 5, what does the author believe reduces crime?',
      questionHi: 'Passage 5 में अपराध कम करने का उपाय?',
      options: ['पुलिस', 'शिक्षा', 'कानून', 'न्यायालय'],
      correctIndex: 1,
      explanation: '"Education plays a vital role in minimizing crime rate."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 2 (English → Hindi, Passages 6–10)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> enToHi2Questions = [
    QuizQuestion(
      questionEn: 'Which festival is discussed in Passage 6?',
      questionHi: 'Passage 6 किस त्योहार के बारे में है?',
      options: ['होली', 'दीवाली', 'ईद', 'क्रिसमस'],
      correctIndex: 1,
      explanation: 'Passage 6 is about Diwali — the festival of light celebrated when Lord Rama returned to Ayodhya.',
    ),
    QuizQuestion(
      questionEn: 'What does "exile" mean? (Passage 6)',
      questionHi: '"Exile" का अर्थ?',
      options: ['वनवास', 'जीत', 'वापसी', 'युद्ध'],
      correctIndex: 0,
      explanation: '"Exile" = वनवास. "Lord Rama had come back after 14 years of exile."',
    ),
    QuizQuestion(
      questionEn: 'In Passage 7 (Kid), why did the boy jump into a canal?',
      questionHi: 'Passage 7 में लड़का नहर में क्यों कूदा?',
      options: [
        'तैरने के लिए',
        'मछली पकड़ने के लिए',
        'छिपने के लिए — सोचा किसी ने नहीं देखा',
        'मस्ती के लिए'
      ],
      correctIndex: 2,
      explanation: 'He jumped thinking they couldn\'t see him — like a pigeon that closes its eyes seeing a cat.',
    ),
    QuizQuestion(
      questionEn: 'What does "malediction" mean? (Passage 9 — Poverty)',
      questionHi: '"Malediction" का अर्थ?',
      options: ['आशीर्वाद', 'अभिशाप', 'दवाई', 'उपहार'],
      correctIndex: 1,
      explanation: '"Malediction" = अभिशाप (curse). "Poverty is a malediction for our society."',
    ),
    QuizQuestion(
      questionEn: '"Poverty and corruption go hand by hand" means?',
      questionHi: '"Poverty and corruption go hand by hand" का अर्थ?',
      options: [
        'दोनों अलग हैं',
        'दोनों साथ-साथ चलते हैं',
        'दोनों असम्बंधित हैं',
        'एक दूसरे का विरोध करते हैं'
      ],
      correctIndex: 1,
      explanation: 'Both are mutually related — गरीबी और भ्रष्टाचार साथ-साथ चलते हैं।',
    ),
    QuizQuestion(
      questionEn: 'Passage 10 — "Make everyday count" means?',
      questionHi: '"Make everyday count" का अर्थ?',
      options: [
        'हर दिन गिनती करना',
        'हर दिन को पूरी तरह जीना',
        'हर दिन पैसे कमाना',
        'हर दिन अभ्यास करना'
      ],
      correctIndex: 1,
      explanation: '"Make everyday count" = हर दिन को पूरी तरह जीना — live each day fully.',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 3 (Hindi → English, Passages 1–10)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> hiToEn1Questions = [
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं तुम्हारा आभारी हूँ।"',
      questionHi: 'सही अनुवाद?',
      options: [
        'I am sorry to you.',
        'I am grateful to you.',
        'I am angry with you.',
        'I am proud of you.'
      ],
      correctIndex: 1,
      explanation: '"आभारी हूँ" = grateful. "I am grateful to you."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं पक चुका हूँ।"',
      questionHi: 'सही अनुवाद?',
      options: [
        'I am cooked.',
        'I am tired.',
        'I am fed up.',
        'I am ready.'
      ],
      correctIndex: 2,
      explanation: '"पक जाना" = to be fed up (fed up with something). "I am fed up."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुमने कभी उससे बात की?" (Passage 6)',
      questionHi: 'सही अनुवाद?',
      options: [
        'Did you ever talk to him?',
        'Will you talk to him?',
        'Are you talking to him?',
        'Do you talk to him?'
      ],
      correctIndex: 0,
      explanation: '"कभी बात की" = ever talk to (past tense). "Did you ever talk to him?"',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं पिछले 4 घंटे से चल रहा हूँ।" (Passage 4)',
      questionHi: 'सही अनुवाद?',
      options: [
        'I walked for 4 hours.',
        'I have been walking for last 4 hours.',
        'I was walking for 4 hours.',
        'I will walk for 4 hours.'
      ],
      correctIndex: 1,
      explanation: 'Present Perfect Continuous — "I have been walking for last 4 hours."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं काम कर चुका हूँ।" (Passage 5)',
      questionHi: 'सही अनुवाद?',
      options: [
        'I have worked.',
        'I am working.',
        'I will work.',
        'I was working.'
      ],
      correctIndex: 0,
      explanation: '"कर चुका हूँ" = present perfect. "I have worked."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "वे चार लड़कियाँ हैं।" (Passage 3)',
      questionHi: 'सही अनुवाद?',
      options: [
        'There are four girls.',
        'They are four girls.',
        'Those are four girls.',
        'These are four girls.'
      ],
      correctIndex: 1,
      explanation: '"वे" = they (for people). "They are four girls."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 4 (Hindi → English, Passages 11–20)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> hiToEn2Questions = [
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं कल तुम्हारे घर आना चाहता था पर आ नहीं सका।" (Passage 11)',
      questionHi: 'सही अनुवाद?',
      options: [
        'I will come to your home tomorrow.',
        'I wanted to come to your home yesterday but I couldn\'t.',
        'I came to your home yesterday.',
        'I am coming to your home today.'
      ],
      correctIndex: 1,
      explanation: '"मैं कल आना चाहता था" = I wanted to come yesterday. "पर आ नहीं सका" = but I couldn\'t.',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुमने ये किताब कहाँ से खरीदी?" (Passage 12)',
      questionHi: 'सही अनुवाद?',
      options: [
        'Where did you buy this book from?',
        'When did you buy this book?',
        'How much is this book?',
        'Who bought this book?'
      ],
      correctIndex: 0,
      explanation: '"कहाँ से खरीदी" = where did you buy from?',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुम कहाँ जा रहे हो?" (Passage 13)',
      questionHi: 'सही अनुवाद?',
      options: [
        'Where are you going?',
        'Where were you going?',
        'Where will you go?',
        'Where do you go?'
      ],
      correctIndex: 0,
      explanation: '"जा रहे हो" = present continuous. "Where are you going?"',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "आज बहुत तेज़ बारिश हो रही है।" (Passage 16)',
      questionHi: 'सही अनुवाद?',
      options: [
        'It will rain heavily today.',
        'It rained heavily yesterday.',
        'It\'s raining very heavily today.',
        'It is going to rain.'
      ],
      correctIndex: 2,
      explanation: '"हो रही है" = present continuous. "It\'s raining very heavily today."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुम्हारा जन्मदिन कब है?" (Passage 17)',
      questionHi: 'सही अनुवाद?',
      options: [
        'When is your birthday?',
        'How old are you?',
        'When is the party?',
        'Where is your birthday?'
      ],
      correctIndex: 0,
      explanation: '"जन्मदिन कब है" = When is your birthday?',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुम कल कहाँ थे?" (Passage 20)',
      questionHi: 'सही अनुवाद?',
      options: [
        'Where are you going?',
        'Where were you yesterday?',
        'Where will you go?',
        'Where do you live?'
      ],
      correctIndex: 1,
      explanation: '"कल कहाँ थे" = where were you yesterday? (past tense)',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मुझे बुखार था।" (Passage 11)',
      questionHi: 'सही अनुवाद?',
      options: [
        'I have fever.',
        'I had fever.',
        'I will have fever.',
        'I am having fever.'
      ],
      correctIndex: 1,
      explanation: '"था" = past tense. "I had fever."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "क्या तुमने खाना खाया?" (Passage 15)',
      questionHi: 'सही अनुवाद?',
      options: [
        'Did you have food?',
        'Do you have food?',
        'Will you have food?',
        'Are you having food?'
      ],
      correctIndex: 0,
      explanation: '"खाया" = past tense. "Did you have food?"',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ (10 questions)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Complete: "The more you practice, ___ you become."',
      questionHi: 'सही option?',
      options: ['the good', 'the better', 'better', 'the best'],
      correctIndex: 1,
      explanation: '"The more…the better" pattern. "The more you practice, the better you become."',
    ),
    QuizQuestion(
      questionEn: 'What does "cautious" mean?',
      questionHi: '"Cautious" का अर्थ?',
      options: ['लापरवाह', 'साहसी', 'सावधान', 'थका हुआ'],
      correctIndex: 2,
      explanation: '"Cautious" = सावधान. Used in Passage 1: "whatever he did, he would be cautious."',
    ),
    QuizQuestion(
      questionEn: 'Which word means "अचानक"?',
      questionHi: '"अचानक" के लिए सही शब्द?',
      options: ['Gradually', 'Eventually', 'All of a sudden', 'Deliberately'],
      correctIndex: 2,
      explanation: '"All of a sudden" = अचानक. Not gradually (धीरे-धीरे).',
    ),
    QuizQuestion(
      questionEn: '"A goal is not static but dynamic." What does this mean?',
      questionHi: 'इसका अर्थ?',
      options: [
        'लक्ष्य कभी नहीं बदलता',
        'लक्ष्य स्थिर रहता है',
        'लक्ष्य अनुभव के साथ बदलता है',
        'लक्ष्य बेकार है'
      ],
      correctIndex: 2,
      explanation: 'Dynamic = परिवर्तनशील. Goals change with experience — not fixed (static).',
    ),
    QuizQuestion(
      questionEn: 'What was Lord Rama\'s exile duration? (Passage 6)',
      questionHi: 'भगवान राम का वनवास कितने साल का था?',
      options: ['7 साल', '12 साल', '14 साल', '10 साल'],
      correctIndex: 2,
      explanation: '"Lord Rama had come back to Ayodhya after 14 years of exile."',
    ),
    QuizQuestion(
      questionEn: 'What does "perception" mean?',
      questionHi: '"Perception" का अर्थ?',
      options: ['कल्पना', 'सोच / दृष्टिकोण', 'अनुभव', 'ज्ञान'],
      correctIndex: 1,
      explanation: '"Perception" = सोच / दृष्टिकोण. "Our perception changes with experience."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मैं पिछले 4 घंटे से चल रहा हूँ।"',
      questionHi: 'सही अनुवाद?',
      options: [
        'I walked for 4 hours.',
        'I have been walking for last 4 hours.',
        'I was walking for 4 hours.',
        'I will walk for 4 hours.'
      ],
      correctIndex: 1,
      explanation: 'Present Perfect Continuous — "I have been walking for last 4 hours."',
    ),
    QuizQuestion(
      questionEn: 'What does "improvise" mean?',
      questionHi: '"Improvise" का अर्थ?',
      options: ['खराब करना', 'बेहतर बनाना', 'नष्ट करना', 'रोकना'],
      correctIndex: 1,
      explanation: '"Improvise" = बेहतर बनाना. "We must improvise on every next day."',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "तुम्हारा जन्मदिन कब है?" (Passage 17)',
      questionHi: 'सही अनुवाद?',
      options: [
        'When is your birthday?',
        'How old are you?',
        'When is the party?',
        'Where is your birthday?'
      ],
      correctIndex: 0,
      explanation: '"जन्मदिन कब है" = When is your birthday?',
    ),
    QuizQuestion(
      questionEn: 'Hindi→English: "मुझे बुखार था।" (Passage 11)',
      questionHi: 'सही अनुवाद?',
      options: [
        'I have fever.',
        'I had fever.',
        'I will have fever.',
        'I am having fever.'
      ],
      correctIndex: 1,
      explanation: '"था" = past tense. "I had fever."',
    ),
  ];
}