import '../models/lesson_model.dart';

/// Chapter 42 — Few English Passages (कुछ अंग्रेज़ी परिच्छेद)
/// Lesson 42 of the original book
class Chapter42Data {

  static ChapterModel get chapter => ChapterModel(
        id: 42,
        title: 'Few English Passages',
        titleHindi: 'कुछ अंग्रेज़ी परिच्छेद',
        description: 'Nuclear Family, Boxing, Call Centers & More',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(
            id: 1,
            title: 'Passages 1–5',
            titleHindi: 'परिच्छेद 1–5: Family, Boxing, BPO...',
            emoji: '📖',
            type: LessonType.ch42Passages1,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 2,
            title: 'Passages 6–10',
            titleHindi: 'परिच्छेद 6–10: Poverty, Ambition...',
            emoji: '📝',
            type: LessonType.ch42Passages2,
            status: LessonStatus.inProgress,
          ),
          LessonModel(
            id: 3,
            title: 'Chapter Quiz',
            titleHindi: 'अध्याय क्विज़',
            emoji: '🏆',
            type: LessonType.ch42ChapterQuiz,
            status: LessonStatus.inProgress,
            totalXP: 60,
          ),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch42Passages1:    return passages1Questions;
      case LessonType.ch42Passages2:    return passages2Questions;
      case LessonType.ch42ChapterQuiz:  return chapterFinalQuestions;
      default:                          return [];
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PASSAGES 1–10
  // ══════════════════════════════════════════════════════════════════════════

  static const List<Map<String, dynamic>> passages = [
    {
      'no': 1,
      'title': 'Nuclear Family vs. Joint Family',
      'titleHi': 'एकल परिवार बनाम संयुक्त परिवार',
      'emoji': '👨‍👩‍👧‍👦',
      'text': '''Nuclear family is the one where family members are from two generations i.e. parents and their children while the joint family has got members from more than two generations. The Nuclear family consists of a man, his wife and their children. And in joint family, one might find a man, his wife, sons, daughters, daughters in law, grandchildren etc. The oldest member of the family is considered to be the head of the family; mostly grandfather or grandmother has got this privilege.

Joint family was quite apparent in ancient times, however, things changed with time. Both of the family systems have got some or the other advantages as well as disadvantages. Mostly, the joint family system used to be found in villages and small cities. Now, here comes the interesting question why joint family system disintegrated. One of the major reasons is nothing but the better job opportunities available in cities. It led to migration of people from small cities with only a few opportunities to larger cities with better opportunities. There are not only job opportunities there but also the facilities of every kind. People look for better living standard, medical facilities, higher wages and better education facilities for their children. Here comes the role of migration. Now it's not easy for elderly people to adjust in other places than the places where they lived since birth or for a longer period of their lives. They have certain attachment with people there.

Needless to say that India developed rapidly and so did the thinking of newer members, which emerged differences between generations.

A nuclear family has many advantages. In such families, the mother is given much importance and that's why she can take care of her children in much better way because children spends good amount of time with their mother. Mother has got decision making powers and obviously as she wants her children to perform the best, she plans everything cautiously and this makes a great impact in her children's life.

A Nuclear family has some disadvantages too, particularly when both the parents are working. Children don't get proper attention and they sometimes miss love and care, which leads to be their attempts for love and care from outsiders, who can betray them. Guidance is quite inevitable for children since childhood. It is not possible to conclude which family system is better as both have certain advantages but disadvantages too.''',
      'vocab': [
        {'word': 'Nuclear family', 'meaning': 'एकल परिवार (सिर्फ माँ-बाप और बच्चे)'},
        {'word': 'Joint family', 'meaning': 'संयुक्त परिवार'},
        {'word': 'privilege', 'meaning': 'विशेषाधिकार'},
        {'word': 'disintegrated', 'meaning': 'टूट गया / बिखर गया'},
        {'word': 'migration', 'meaning': 'स्थानांतरण / पलायन'},
        {'word': 'living standard', 'meaning': 'जीवन स्तर'},
        {'word': 'inevitable', 'meaning': 'अनिवार्य'},
        {'word': 'cautiously', 'meaning': 'सावधानी से'},
        {'word': 'attachment', 'meaning': 'लगाव'},
        {'word': 'betray', 'meaning': 'धोखा देना'},
      ],
    },
    {
      'no': 2,
      'title': 'John Love – "A Piece of Iron"',
      'titleHi': 'जॉन लव – "लोहे का टुकड़ा"',
      'emoji': '🥊',
      'text': '''John Love is one the biggest names in boxing history. Boxing was his passion. This instinct was self developed. He was not from a very good family so it was difficult for him to manage huge amount of money to take admission in Boxing Academy. But still, he was never discouraged. He took every second of time as a challenge. Once, there was a competition in his city. He didn't have enough money to take part in this event so he borrowed some money from his best friend. He knocked out the opponent in just one round. He hit him hard on his nose, which started bleeding and the opponent surrendered within a minute. This was the start of his boxing career. People appreciated him for his powerful punches. There was a boxing coach, seeing this match. He came to John and offered him free training in his training camp. John accepted as it was a golden opportunity for him. After a year, John was extremely famous due to his right hand punches, which could break anyone.

Nelson Ryan was 2 times undisputed and undefeated heavyweight boxing champion of the world of that time. He was called a man of miracles. John Love challenged him for a title match. He accepted. When Nelson was about to start the fight, his wife asked him "what do you think how long will this fight take to get over?" He replied "Not more than 10 minutes." Fight started. Nelson dominated for first 5 rounds and John wasn't able to even stand against him. But things changed. Nelson had underestimated the strength and endurance of John Love. In the 6th round, John hit Nelson a solid punch on his face, which hurt Nelson badly and he fell down. People stood up the seats and they couldn't believe it. The moment Nelson stood up, John started punching him and it didn't take more than 30 seconds that Nelson got knocked out. John Love became the new heavyweight boxing champion of the world. He became famous by the name "John Love – A piece of iron" because when he would fight, it seemed as if the opponents were fighting with a piece of iron.''',
      'vocab': [
        {'word': 'passion', 'meaning': 'जुनून / शौक'},
        {'word': 'self developed', 'meaning': 'खुद से विकसित'},
        {'word': 'discouraged', 'meaning': 'हतोत्साहित'},
        {'word': 'knocked out', 'meaning': 'बेहोश कर दिया / हरा दिया'},
        {'word': 'surrendered', 'meaning': 'हार मान ली'},
        {'word': 'undisputed', 'meaning': 'निर्विवाद'},
        {'word': 'undefeated', 'meaning': 'अपराजित'},
        {'word': 'underestimated', 'meaning': 'कम आँका'},
        {'word': 'endurance', 'meaning': 'सहनशक्ति'},
        {'word': 'a piece of iron', 'meaning': 'लोहे का टुकड़ा (बहुत मज़बूत)'},
      ],
    },
    {
      'no': 3,
      'title': 'Call Centers',
      'titleHi': 'कॉल सेंटर',
      'emoji': '📞',
      'text': '''What is a call center? Common definition is "call center is a place where either we receive a call from customers or make a call to them". Call centers where we receive calls from the customers are known as inbound call centers and similarly where we make a call to customers are called outbound call centers. If a call center has both; inbound as well as outbound setup, then we call these setups 'Processes'. You might have heard someone saying 'I am in an inbound process' or someone saying 'I am in an outbound process'. Basically, one is talking about the setup. In Inbound process/call center, Customers call us for several purposes; may be to enquire about a product, enquire about some sort of services that our company offers or anything of this sort. Similarly In outbound, executives call customers for several purposes; to sell a product, to offer a service, to survey about something etc.

You must have heard that call centers belong to BPO Industry. That's true. BPO stands for Business Process Outsourcing. When a company gives some part of its business to some other company, it's called Outsourcing of business.''',
      'vocab': [
        {'word': 'Inbound', 'meaning': 'आने वाले कॉल (customer calls us)'},
        {'word': 'Outbound', 'meaning': 'जाने वाले कॉल (we call customer)'},
        {'word': 'Process', 'meaning': 'setup जिसमें दोनों हों'},
        {'word': 'enquire', 'meaning': 'पूछताछ करना'},
        {'word': 'executives', 'meaning': 'कर्मचारी / अधिकारी'},
        {'word': 'BPO', 'meaning': 'Business Process Outsourcing'},
        {'word': 'Outsourcing', 'meaning': 'किसी काम को बाहरी कंपनी को देना'},
        {'word': 'survey', 'meaning': 'सर्वे / जानकारी इकट्ठा करना'},
      ],
    },
    {
      'no': 4,
      'title': 'Colors of Life',
      'titleHi': 'जिन्दगी के रंग',
      'emoji': '🌈',
      'text': '''Life is called colorful with so many colors in it. Colors are nothing but the reference of several phases of life. Life is given names i.e. Struggling, Beautiful or any other adjective as such. It differs person to person and it all depends on how we take it. We are all born with some innate instincts, positive or negative which differs us in how we celebrate win and how we surpass a loss. Losing a race, by two people might be seen in two different ways. One might consider himself a weaker contender and promise to improvise further whereas the other one might blame his fortune. This exhibits two different behavior patterns of two individuals. However, the way we expect life, is not necessarily what it turns out to be. Hence, our perception about it changes with our experience. The more we experience, the more colors we discover.''',
      'vocab': [
        {'word': 'innate instincts', 'meaning': 'स्वाभाविक प्रवृत्तियाँ'},
        {'word': 'surpass a loss', 'meaning': 'हार से उबरना'},
        {'word': 'contender', 'meaning': 'प्रतिस्पर्धी'},
        {'word': 'improvise', 'meaning': 'बेहतर बनाना'},
        {'word': 'behavior patterns', 'meaning': 'व्यवहारिक नमूने'},
        {'word': 'perception', 'meaning': 'सोच / दृष्टिकोण'},
        {'word': 'fortune', 'meaning': 'किस्मत'},
      ],
    },
    {
      'no': 5,
      'title': 'Criminals',
      'titleHi': 'अपराधी',
      'emoji': '⚖️',
      'text': '''Criminals are the ones who commit the crime for any reason at all. This is the actual definition that we expect from all of us and also we expect such people to be given the title 'criminals'. However, needless to say that this title is not in fact given to all, who commit crimes and neither, all the people, who are given this title are necessarily criminals. What we often hear is about hidden crimes, which are never unearthed; reasons are many. Sometimes it's because the victim is scared of future repercussions to himself or to the loved ones and sometimes it's because victim is completely unaware of the laws, which might give him justice. These crimes are huge in numbers. I think Education plays a vital role in minimizing crime rate. Our country will grow if we grow our hereabouts. A revolution doesn't demand many but one.''',
      'vocab': [
        {'word': 'commit crime', 'meaning': 'अपराध करना'},
        {'word': 'needless to say', 'meaning': 'बताने की जरूरत नहीं'},
        {'word': 'unearthed', 'meaning': 'उजागर किया गया'},
        {'word': 'repercussions', 'meaning': 'दुष्परिणाम'},
        {'word': 'victim', 'meaning': 'पीड़ित'},
        {'word': 'vital role', 'meaning': 'महत्वपूर्ण भूमिका'},
        {'word': 'hereabouts', 'meaning': 'आस-पास'},
        {'word': 'revolution', 'meaning': 'क्रान्ति'},
      ],
    },
    {
      'no': 6,
      'title': 'Boy & Guitar',
      'titleHi': 'लड़का और गिटार',
      'emoji': '🎸',
      'text': '''This is the story of a boy who had to put down his first love 'Guitar' and get into his father's business. He compromised because he knew that father's business was better than his passion for guitar. Everything was going good in his life but all of a sudden, something as such happened which changed his life and made him pick the gun. His parents were brutally killed. Left were only his two sisters and one brother. He picked the gun in revenge but he had to also ensure that nobody knew about him otherwise his siblings could have been in trouble. Hence, whatever he did, he would be cautious. He himself punished all the culprits. Nobody could ever know who killed them. There was a doubt but without a proof.''',
      'vocab': [
        {'word': 'put down', 'meaning': 'छोड़ना'},
        {'word': 'compromised', 'meaning': 'समझौता किया'},
        {'word': 'all of a sudden', 'meaning': 'अचानक'},
        {'word': 'brutally killed', 'meaning': 'बेरहमी से मारा गया'},
        {'word': 'in revenge', 'meaning': 'बदले की भावना से'},
        {'word': 'siblings', 'meaning': 'भाई-बहन'},
        {'word': 'cautious', 'meaning': 'सावधान'},
        {'word': 'culprits', 'meaning': 'गुनहगार'},
      ],
    },
    {
      'no': 7,
      'title': 'Poverty',
      'titleHi': 'गरीबी',
      'emoji': '🏚️',
      'text': '''Poverty is a malediction for our society. If you really want to realize what poverty is, then you must interact with people who live in slums. Talk to them, ask them about their lives, their past and then see how difficult their lives have been. I lived a middle class life and always got almost everything that I wanted, even though I had to ask my dad for many a time. I firmly believe that pain ideally is realized by the one who goes through, not by everybody. Indian Government has put in several efforts to improvise their lives, Huge is the number of NGOs, which claim to help the needy but implementation is not up to the mark and the major reasons of Government's failure is nothing but the corruption.

In fact, poverty and corruption go hand by hand. Both are mutually related to a great extent. If you are poor, you tend to do anything and everything that can get you some money and that's where corruption comes from. However, there are numerous examples, where even the rich are corrupt due to the greediness for having more money.''',
      'vocab': [
        {'word': 'malediction', 'meaning': 'अभिशाप'},
        {'word': 'slums', 'meaning': 'गन्दी बस्ती'},
        {'word': 'middle class', 'meaning': 'मध्यम वर्ग'},
        {'word': 'implementation', 'meaning': 'कार्यान्वयन'},
        {'word': 'not up to the mark', 'meaning': 'उचित स्तर पर नहीं'},
        {'word': 'corruption', 'meaning': 'भ्रष्टाचार'},
        {'word': 'go hand by hand', 'meaning': 'साथ-साथ चलना'},
        {'word': 'greediness', 'meaning': 'लालच'},
      ],
    },
    {
      'no': 8,
      'title': 'Ambition',
      'titleHi': 'महत्वाकांक्षा',
      'emoji': '🎯',
      'text': '''What is an Ambition? Ambition is a firm goal that we set for ourselves. It also changes with our experience. As time passes by and we experience lot many new things, which changes the way we take things, either something adds on to our goal or something eliminates. For example, a person wants to become a social worker and he is firm in his idea. Sudden in life, he encounters a terrible phase and he realizes the importance of money, now he sets a target of having good money as well. Now, there are two types of people. Ones are those who change their viewpoint and entirely change their target and otherwise are those who just add money earning to their original idea of social welfare but not at the cost of their original goal. Hence, a goal is not a static part, rather dynamic.''',
      'vocab': [
        {'word': 'ambition', 'meaning': 'महत्वाकांक्षा'},
        {'word': 'firm goal', 'meaning': 'निश्चित लक्ष्य'},
        {'word': 'eliminates', 'meaning': 'घटाना / हटाना'},
        {'word': 'encounters', 'meaning': 'सामना करना'},
        {'word': 'viewpoint', 'meaning': 'दृष्टिकोण'},
        {'word': 'social welfare', 'meaning': 'समाज कल्याण'},
        {'word': 'static', 'meaning': 'अचल / स्थिर'},
        {'word': 'dynamic', 'meaning': 'परिवर्तनशील / चल'},
      ],
    },
    {
      'no': 9,
      'title': 'When I was a Kid',
      'titleHi': 'जब मैं बच्चा था',
      'emoji': '🧒',
      'text': '''How cruel I feel I was when I was a kid. I used to kill small creatures like ants, fishes, birds etc without any regret. Every day was a new day of my sin. I would separate the nests off the tree, thinking that the bird would have to face trouble finding her children. Even if kids would die, I would feel no pain. I would make two ants fight and imagine how I would have experienced if I was of their size. I would kill birds with a special weapon called "Gulail". I remember an incidence when I rather ate toffees of the school fee than pay to Class Teacher and next day hid behind the tree. Having been seen, I jumped into a canal and put myself under water thinking they couldn't see me, just like a pigeon, closes eyes seeing cat believing that she is not being seen. It's something that makes me laugh now. Whatever it was, cute it was. It is true that childhood is like a dream that is to be broken some or the other day.''',
      'vocab': [
        {'word': 'cruel', 'meaning': 'क्रूर'},
        {'word': 'regret', 'meaning': 'पछतावा'},
        {'word': 'nests', 'meaning': 'घोंसले'},
        {'word': 'Gulail', 'meaning': 'गुलेल (slingshot)'},
        {'word': 'incidence', 'meaning': 'घटना'},
        {'word': 'canal', 'meaning': 'नहर'},
        {'word': 'pigeon', 'meaning': 'कबूतर'},
      ],
    },
    {
      'no': 10,
      'title': 'The Best Day of My Life',
      'titleHi': 'मेरी ज़िन्दगी का सबसे अच्छा दिन',
      'emoji': '🌟',
      'text': '''It was Sunday and I had to go for an interview. I got up at 8 in the morning, took a bath and got ready. I was a bit scared thinking about the interview. Actually, it was the first time. My friends had told me a lot about how to face but it was obvious that I was scared. I left for the interview venue. When I reached there, I read a quote by Thomas Alva Edison on the board, written as "I will not say that I failed thousand times, rather I would say, I know thousand ways which can cause failure". This encouraged me and I realized that it didn't matter if I failed, rather I must be optimist for future. Thinking this, I reached at a specious hall; where already about 50 candidates were sitting. I looked here and there. I saw a receptionist sitting there. I went to her. She asked me for my resume. I provided the same. She had a glance on it and she advised me to have a seat. My name was called after a long wait. The moment I stepped in the interview room, I was straight away asked what I liked the first thing about the venue. I told the interviewers about Edison's quote. They got impressed. They asked me just a few more questions and asked me to wait outside. After a little while, a lady called my name and informed me that I got selected. It proved to be one of the best days of my life.''',
      'vocab': [
        {'word': 'interview venue', 'meaning': 'इंटरव्यू का स्थान'},
        {'word': 'optimist', 'meaning': 'आशावादी'},
        {'word': 'spacious hall', 'meaning': 'विशाल हॉल'},
        {'word': 'candidates', 'meaning': 'उम्मीदवार'},
        {'word': 'resume', 'meaning': 'रेज्यूमे'},
        {'word': 'had a glance', 'meaning': 'एक नज़र डाली'},
        {'word': 'impressed', 'meaning': 'प्रभावित'},
        {'word': 'got selected', 'meaning': 'चुना / सिलेक्ट हो गया'},
      ],
    },
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 1 (Passages 1–5)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> passages1Questions = [
    QuizQuestion(
      questionEn: 'What is a "Nuclear family"?',
      questionHi: '"Nuclear family" क्या होती है?',
      options: [
        'माँ-बाप, बच्चे, दादा-दादी',
        'सिर्फ माँ-बाप और उनके बच्चे',
        'पूरा खानदान',
        'सिर्फ माँ और बच्चे',
      ],
      correctIndex: 1,
      explanation: 'Nuclear family = parents and their children only — two generations.',
    ),
    QuizQuestion(
      questionEn: 'Why did joint family system disintegrate? (Passage 1)',
      questionHi: 'संयुक्त परिवार क्यों टूटा?',
      options: [
        'लड़ाई-झगड़े की वजह से',
        'शहरों में बेहतर नौकरियों की वजह से',
        'सरकारी नीतियों की वजह से',
        'धर्म की वजह से',
      ],
      correctIndex: 1,
      explanation: '"Better job opportunities in cities" led to migration, which broke joint families.',
    ),
    QuizQuestion(
      questionEn: 'What does "undisputed champion" mean? (Passage 2)',
      questionHi: '"Undisputed champion" का अर्थ?',
      options: ['हारा हुआ', 'निर्विवाद चैंपियन', 'नया चैंपियन', 'कमज़ोर खिलाड़ी'],
      correctIndex: 1,
      explanation: '"Undisputed" = निर्विवाद — someone whose championship no one questions.',
    ),
    QuizQuestion(
      questionEn: 'John Love was nicknamed "A piece of iron" because?',
      questionHi: 'जॉन लव को "लोहे का टुकड़ा" क्यों कहा गया?',
      options: [
        'वो लोहे का काम करता था',
        'उसकी मुट्ठी लोहे जैसी कठोर थी',
        'लड़ते समय ऐसा लगता था जैसे विरोधी लोहे से लड़ रहा हो',
        'उसका नाम लोहे से जुड़ा था',
      ],
      correctIndex: 2,
      explanation: '"When he would fight, it seemed as if the opponents were fighting with a piece of iron."',
    ),
    QuizQuestion(
      questionEn: 'What does "BPO" stand for?',
      questionHi: '"BPO" का पूरा नाम?',
      options: [
        'Business Profit Organization',
        'Business Process Outsourcing',
        'Basic Process Operations',
        'Business Phone Operators',
      ],
      correctIndex: 1,
      explanation: 'BPO = Business Process Outsourcing — giving part of business to another company.',
    ),
    QuizQuestion(
      questionEn: 'What is an "Inbound" call center?',
      questionHi: '"Inbound" call center क्या है?',
      options: [
        'जहाँ हम customers को call करते हैं',
        'जहाँ customers हमें call करते हैं',
        'दोनों तरह की calls',
        'Telemarketing center',
      ],
      correctIndex: 1,
      explanation: 'Inbound = customers call us. Outbound = we call customers.',
    ),
    QuizQuestion(
      questionEn: 'What does "perception" mean? (Passage 4 — Colors of Life)',
      questionHi: '"Perception" का अर्थ?',
      options: ['कल्पना', 'सोच / दृष्टिकोण', 'भावना', 'अनुभव'],
      correctIndex: 1,
      explanation: '"Perception" = सोच / दृष्टिकोण. "Our perception changes with experience."',
    ),
    QuizQuestion(
      questionEn: 'What does "unearthed" mean? (Passage 5 — Criminals)',
      questionHi: '"Unearthed" का अर्थ?',
      options: ['दफनाया गया', 'उजागर किया गया', 'छिपाया गया', 'भूल गया'],
      correctIndex: 1,
      explanation: '"Unearthed" = उजागर किया गया. "Hidden crimes never unearthed."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // QUIZ — Lesson 2 (Passages 6–10)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> passages2Questions = [
    QuizQuestion(
      questionEn: 'In Passage 6 (Boy & Guitar), why was the boy cautious?',
      questionHi: 'Passage 6 में लड़का सावधान क्यों था?',
      options: [
        'पुलिस से डरता था',
        'अगर पकड़ा जाता तो भाई-बहन मुसीबत में पड़ते',
        'वो कमज़ोर था',
        'उसे कुछ पता नहीं था',
      ],
      correctIndex: 1,
      explanation: '"He had to ensure that nobody knew about him otherwise his siblings could have been in trouble."',
    ),
    QuizQuestion(
      questionEn: 'What does "malediction" mean? (Passage 7 — Poverty)',
      questionHi: '"Malediction" का अर्थ?',
      options: ['आशीर्वाद', 'अभिशाप', 'दवाई', 'समाधान'],
      correctIndex: 1,
      explanation: '"Malediction" = अभिशाप. "Poverty is a malediction for our society."',
    ),
    QuizQuestion(
      questionEn: '"Poverty and corruption go hand by hand" means?',
      questionHi: 'इसका क्या अर्थ है?',
      options: [
        'दोनों अलग-अलग हैं',
        'दोनों एक साथ चलते हैं',
        'गरीबी भ्रष्टाचार से बड़ी है',
        'भ्रष्टाचार गरीबी खत्म करता है',
      ],
      correctIndex: 1,
      explanation: 'Both are mutually related — where there is poverty, corruption follows.',
    ),
    QuizQuestion(
      questionEn: 'What does "static" mean in "a goal is not static"? (Passage 8)',
      questionHi: '"Static" का अर्थ?',
      options: ['परिवर्तनशील', 'अचल / स्थिर', 'जटिल', 'आसान'],
      correctIndex: 1,
      explanation: '"Static" = अचल / स्थिर. A goal is not static (fixed) but dynamic (changeable).',
    ),
    QuizQuestion(
      questionEn: 'In Passage 9, why did the boy jump into a canal?',
      questionHi: 'Passage 9 में लड़का नहर में क्यों कूदा?',
      options: [
        'तैरने के लिए',
        'मछली पकड़ने',
        'छिपने के लिए — सोचा देखा नहीं जाएगा',
        'खेलने के लिए',
      ],
      correctIndex: 2,
      explanation: '"Put myself under water thinking they couldn\'t see me" — like a pigeon closing eyes.',
    ),
    QuizQuestion(
      questionEn: 'What quote did Edison give? (Passage 10)',
      questionHi: 'Edison की quote?',
      options: [
        'I failed thousand times.',
        'Success is the only option.',
        'I know thousand ways which can cause failure.',
        'Never stop trying.',
      ],
      correctIndex: 2,
      explanation: '"I know thousand ways which can cause failure" — knowledge from every failure.',
    ),
    QuizQuestion(
      questionEn: 'What does "endurance" mean? (Passage 2 — John Love)',
      questionHi: '"Endurance" का अर्थ?',
      options: ['ताकत', 'सहनशक्ति', 'गति', 'साहस'],
      correctIndex: 1,
      explanation: '"Endurance" = सहनशक्ति. Nelson underestimated the endurance of John Love.',
    ),
    QuizQuestion(
      questionEn: 'What does "inevitable" mean? (Passage 1 — Nuclear Family)',
      questionHi: '"Inevitable" का अर्थ?',
      options: ['टाला जा सकता है', 'अनिवार्य', 'असम्भव', 'सामान्य'],
      correctIndex: 1,
      explanation: '"Inevitable" = अनिवार्य. "Guidance is quite inevitable for children since childhood."',
    ),
  ];

  // ══════════════════════════════════════════════════════════════════════════
  // CHAPTER FINAL QUIZ (10 questions)
  // ══════════════════════════════════════════════════════════════════════════

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'Who is considered the head of a joint family?',
      questionHi: 'संयुक्त परिवार में मुखिया कौन होता है?',
      options: ['सबसे बड़ा बेटा', 'सबसे बड़ा सदस्य (दादा/दादी)', 'पिता', 'माँ'],
      correctIndex: 1,
      explanation: '"The oldest member of the family is considered to be the head — mostly grandfather or grandmother."',
    ),
    QuizQuestion(
      questionEn: 'What does "migration" mean?',
      questionHi: '"Migration" का अर्थ?',
      options: ['शिक्षा', 'स्थानांतरण / पलायन', 'नौकरी', 'विकास'],
      correctIndex: 1,
      explanation: '"Migration" = स्थानांतरण. People migrated from villages to cities for better opportunities.',
    ),
    QuizQuestion(
      questionEn: 'In which round did John Love knock out Nelson Ryan?',
      questionHi: 'जॉन लव ने नेल्सन को किस round में knock out किया?',
      options: ['3rd', '5th', '6th', '10th'],
      correctIndex: 2,
      explanation: '"In the 6th round, John hit Nelson a solid punch on his face."',
    ),
    QuizQuestion(
      questionEn: 'What does "Outsourcing" mean?',
      questionHi: '"Outsourcing" का अर्थ?',
      options: [
        'खुद काम करना',
        'किसी काम को बाहरी कंपनी को देना',
        'Employees को निकालना',
        'नई कंपनी बनाना',
      ],
      correctIndex: 1,
      explanation: '"When a company gives some part of its business to some other company, it\'s called Outsourcing."',
    ),
    QuizQuestion(
      questionEn: 'What weapon did the boy use to kill birds? (Passage 9)',
      questionHi: 'Passage 9 में लड़का किस हथियार से पक्षियों को मारता था?',
      options: ['तीर-कमान', 'गुलेल (Gulail)', 'पत्थर', 'छड़ी'],
      correctIndex: 1,
      explanation: '"I would kill birds with a special weapon called Gulail."',
    ),
    QuizQuestion(
      questionEn: 'What does "greediness" mean? (Passage 7 — Poverty)',
      questionHi: '"Greediness" का अर्थ?',
      options: ['उदारता', 'लालच', 'दया', 'साहस'],
      correctIndex: 1,
      explanation: '"Greediness" = लालच. Even the rich are corrupt due to greediness for more money.',
    ),
    QuizQuestion(
      questionEn: 'What does "dynamic goal" mean?',
      questionHi: '"Dynamic goal" का अर्थ?',
      options: ['अचल लक्ष्य', 'परिवर्तनशील लक्ष्य', 'कठिन लक्ष्य', 'असम्भव लक्ष्य'],
      correctIndex: 1,
      explanation: '"Dynamic" = परिवर्तनशील. A goal changes with experience — dynamic, not static.',
    ),
    QuizQuestion(
      questionEn: 'Nuclear family disadvantage when both parents work?',
      questionHi: 'दोनों माँ-बाप काम करते हों तो क्या नुकसान?',
      options: [
        'पैसों की कमी',
        'बच्चों को proper attention नहीं मिलती',
        'घर छोटा पड़ जाता है',
        'बच्चे पढ़ते नहीं',
      ],
      correctIndex: 1,
      explanation: '"Children don\'t get proper attention and sometimes miss love and care."',
    ),
    QuizQuestion(
      questionEn: 'What does "surrendered" mean? (Passage 2 — John Love)',
      questionHi: '"Surrendered" का अर्थ?',
      options: ['जीत लिया', 'हार मान ली', 'लड़ता रहा', 'भाग गया'],
      correctIndex: 1,
      explanation: '"The opponent surrendered within a minute" = हार मान ली।',
    ),
    QuizQuestion(
      questionEn: 'Complete: "The more we experience, ___."',
      questionHi: 'सही option?',
      options: [
        'the less we know.',
        'the more tired we get.',
        'the more colors we discover.',
        'the more we struggle.',
      ],
      correctIndex: 2,
      explanation: '"The more we experience, the more colors of life we discover." — Colors of Life passage.',
    ),
  ];
}