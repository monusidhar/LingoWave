import '../models/lesson_model.dart';

class Chapter45Data {
  static ChapterModel get chapter => ChapterModel(
        id: 45,
        title: 'English–Hindi Dictionary',
        titleHindi: 'अंग्रेज़ी–हिंदी शब्दकोश',
        description: 'A–Z common words with meaning, pronunciation & POS',
        status: LessonStatus.inProgress,
        lessons: [
          LessonModel(id: 1, title: 'Dictionary: A–E', titleHindi: 'शब्दकोश: A से E तक', emoji: '🔤', type: LessonType.ch45DictAE, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 2, title: 'Dictionary: F–J', titleHindi: 'शब्दकोश: F से J तक', emoji: '📖', type: LessonType.ch45DictFJ, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 3, title: 'Dictionary: K–O', titleHindi: 'शब्दकोश: K से O तक', emoji: '📚', type: LessonType.ch45DictKO, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 4, title: 'Dictionary: P–S', titleHindi: 'शब्दकोश: P से S तक', emoji: '📝', type: LessonType.ch45DictPS, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 5, title: 'Dictionary: T–Z', titleHindi: 'शब्दकोश: T से Z तक', emoji: '🔡', type: LessonType.ch45DictTZ, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 6, title: 'Parts of Speech Guide', titleHindi: 'शब्द भेद गाइड', emoji: '🏷️', type: LessonType.ch45POS, totalXP: 20, status: LessonStatus.inProgress,),
          LessonModel(id: 7, title: 'Word Quiz I — English → Hindi', titleHindi: 'शब्द क्विज़ I', emoji: '🧠', type: LessonType.ch45QuizEN, totalXP: 25, status: LessonStatus.inProgress,),
          LessonModel(id: 8, title: 'Word Quiz II — Hindi → English', titleHindi: 'शब्द क्विज़ II', emoji: '🔁', type: LessonType.ch45QuizHI, totalXP: 25, status: LessonStatus.inProgress,),
          LessonModel(id: 9, title: 'Word Quiz III — POS & Usage', titleHindi: 'शब्द क्विज़ III', emoji: '🎯', type: LessonType.ch45QuizPOS, totalXP: 25, status: LessonStatus.inProgress,),
          LessonModel(id: 10, title: 'Chapter Quiz', titleHindi: 'अध्याय क्विज़', emoji: '🏆', type: LessonType.ch45ChapterQuiz, totalXP: 100, status: LessonStatus.inProgress,),
        ],
      );

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.ch45DictAE:   return dictAEQuestions;
      case LessonType.ch45DictFJ:   return dictFJQuestions;
      case LessonType.ch45DictKO:   return dictKOQuestions;
      case LessonType.ch45DictPS:   return dictPSQuestions;
      case LessonType.ch45DictTZ:   return dictTZQuestions;
      case LessonType.ch45POS:      return posQuestions;
      case LessonType.ch45QuizEN:   return quizEnHiQuestions;
      case LessonType.ch45QuizHI:   return quizHiEnQuestions;
      case LessonType.ch45QuizPOS:  return quizPosQuestions;
      case LessonType.ch45ChapterQuiz: return chapterFinalQuestions;
      default: return dictAEQuestions;
    }
  }

  // ─── POS abbreviation map ──────────────────────────────────────────────────
  static const Map<String, String> posFullForm = {
    'n.': 'Noun (संज्ञा)',
    'vt.': 'Transitive Verb (सकर्मक क्रिया)',
    'vi.': 'Intransitive Verb (अकर्मक क्रिया)',
    'vti.': 'Transitive & Intransitive Verb',
    'adj.': 'Adjective (विशेषण)',
    'adv.': 'Adverb (क्रिया विशेषण)',
    'det.': 'Determiner (निर्धारक)',
    'conj.': 'Conjunction (समुच्चय बोधक)',
    'prep.': 'Preposition (सम्बन्ध सूचक)',
    'pron.': 'Pronoun (सर्वनाम)',
    'modal': 'Modal Verb (सहायक क्रिया)',
    'interj.': 'Interjection (विस्मयादिबोधक)',
  };

  static const List<Map<String, String>> posExamples = [
    {'pos': 'n.', 'example': 'Ability — योग्यता', 'sentence': 'He has great ability.'},
    {'pos': 'vt.', 'example': 'Abandon — त्याग देना', 'sentence': 'He moved the chair. (chair = object)'},
    {'pos': 'vi.', 'example': 'Agree — सहमत होना', 'sentence': 'Dad smiled. (no object needed)'},
    {'pos': 'adj.', 'example': 'Brave — वीर', 'sentence': 'He is a brave soldier.'},
    {'pos': 'adv.', 'example': 'Always — हमेशा', 'sentence': 'She always smiles.'},
    {'pos': 'conj.', 'example': 'And — और', 'sentence': 'Ram and Mohan are friends.'},
    {'pos': 'prep.', 'example': 'About — के बारे में', 'sentence': 'Tell me about yourself.'},
    {'pos': 'pron.', 'example': 'He — वह', 'sentence': 'He is my friend.'},
    {'pos': 'det.', 'example': 'All — सभी', 'sentence': 'All students are here.'},
    {'pos': 'modal', 'example': 'Can — सकना', 'sentence': 'I can speak English.'},
    {'pos': 'interj.', 'example': 'Hello — नमस्ते', 'sentence': 'Hello! How are you?'},
  ];

  // ─── Full dictionary data ──────────────────────────────────────────────────
  // Format: [word, pos, pronunciation, hindi meaning]
  static const List<List<String>> allWords = [
    // A
    ['Abandon','vt.','अबैंडन','त्याग देना, छोड़ देना'],
    ['Abate','vt.','अबेट','कम करना, घटाना'],
    ['Abbreviate','vt.','अब्रीविएट','संक्षिप्त करना'],
    ['Ability','n.','अबिलिटी','योग्यता, क्षमता'],
    ['Able','adj.','एबल','समर्थ, योग्य'],
    ['Abolish','vt.','अबॉलिश','समाप्त करना'],
    ['About','prep.','अबाउट','के बारे में, लगभग'],
    ['Above','prep.','अबव','ऊपर'],
    ['Abroad','adv.','अब्रॉड','विदेश'],
    ['Absence','n.','ऐब्सेन्स','अनुपस्थिति'],
    ['Absolute','adj.','ऐब्सलूट','पूर्ण, सर्वसम्मत'],
    ['Absorb','vt.','अब्ज़ॉर्ब','अवशोषित करना, सोखना'],
    ['Absurd','adj.','अब्ज़र्ड','बेतुका, असंगत'],
    ['Abundance','n.','अबन्डेन्स','प्रचुरता, बहुतायत'],
    ['Abuse','vt.','अब्यूज़','दुरुपयोग करना, गाली देना'],
    ['Accept','vt.','ऐक्सेप्ट','स्वीकार करना'],
    ['Access','n.','ऐक्सेस','पहुँच, प्रवेश'],
    ['Accident','n.','ऐक्सिडेन्ट','दुर्घटना'],
    ['Accomplish','vt.','अकम्प्लिश','पूरा करना'],
    ['Accurate','adj.','ऐक्युरेट','सटीक, शुद्ध'],
    ['Achieve','vt.','अचीव','प्राप्त करना'],
    ['Achievement','n.','अचीवमेन्ट','उपलब्धि'],
    ['Action','n.','ऐक्शन','क्रिया'],
    ['Active','adj.','ऐक्टिव','सक्रिय'],
    ['Adapt','vt.','अडैप्ट','अनुकूल बनाना'],
    ['Admire','vt.','एडमायर','प्रशंसा करना'],
    ['Adult','n.','अडल्ट','वयस्क'],
    ['Advantage','n.','एडवान्टेज','लाभ'],
    ['Advice','n.','एड्वाइस','सलाह'],
    ['Affect','vt.','अफेक्ट','प्रभाव डालना'],
    ['Afford','vt.','अफॉर्ड','वहन करना'],
    ['Afraid','adj.','अफ्रेड','डरा हुआ'],
    ['Agree','vi.','अग्री','सहमत होना'],
    ['Agriculture','n.','ऐग्रिकल्चर','कृषि'],
    ['Alcohol','n.','ऐल्कोहॉल','शराब, मदिरा'],
    ['Allow','vt.','अलाउ','अनुमति देना'],
    ['Already','adv.','ऑल्रेडी','पहले ही'],
    ['Although','conj.','ऑल्दो','यद्यपि, हालांकि'],
    ['Always','adv.','ऑल्वेज़','हमेशा'],
    ['Amaze','vt.','अमेज़','चकित करना'],
    ['Amazing','adj.','अमेज़िंग','अद्भुत, जबरदस्त'],
    ['Ambition','n.','एम्बिशन','महत्वाकांक्षा'],
    ['Ancient','adj.','एन्शन्ट','प्राचीन'],
    ['Anger','n.','ऐंगर','क्रोध'],
    ['Angry','adj.','ऐंग्री','क्रोधित'],
    ['Announce','vt.','अनाउन्स','घोषणा करना'],
    ['Anxiety','n.','ऐंग्ज़ायटी','चिंता'],
    ['Apart','adv.','अलग','अलग, दूर'],
    ['Apologize','vi.','अपॉलजाइज़','माफी माँगना'],
    ['Appear','vi.','अपियर','प्रकट होना, दिखना'],
    ['Apply','vt.','अप्लाई','आवेदन करना'],
    ['Appreciate','vt.','अप्रीशिएट','सराहना करना'],
    ['Approve','vt.','अप्रूव','स्वीकार करना'],
    ['Argue','vi.','आर्ग्यू','तर्क करना'],
    ['Arise','vi.','अराइज़','उठना, पैदा होना'],
    ['Army','n.','आर्मी','सेना'],
    ['Arrange','vt.','अरेंज','व्यवस्था करना'],
    ['Arrest','vt.','अरेस्ट','गिरफ्तार करना'],
    ['Arrogant','adj.','ऐरोगेन्ट','अहंकारी'],
    ['Art','n.','आर्ट','कला'],
    ['Artificial','adj.','आर्टिफिशल','कृत्रिम'],
    ['Ask','vt.','आस्क','पूछना, माँगना'],
    ['Assure','vt.','अश्योर','आश्वासन देना'],
    ['Attempt','vt.','अटेम्प्ट','प्रयास करना'],
    ['Attention','n.','अटेन्शन','ध्यान'],
    ['Attitude','n.','ऐटिट्यूड','दृष्टिकोण'],
    ['Attract','vt.','अट्रैक्ट','आकर्षित करना'],
    ['Avoid','vt.','अवॉइड','बचना, टालना'],
    ['Awful','adj.','ऑफुल','भयानक'],
    // B
    ['Background','n.','बैकग्राउन्ड','पृष्ठभूमि'],
    ['Balance','n.','बैलेन्स','संतुलन, शेष राशि'],
    ['Battle','n.','बैटल','लड़ाई'],
    ['Beautiful','adj.','ब्यूटिफुल','सुंदर'],
    ['Because','conj.','बिकॉज़','क्योंकि'],
    ['Behave','vi.','बिहेव','व्यवहार करना'],
    ['Believe','vt.','बिलीव','विश्वास करना'],
    ['Benefit','n.','बेनिफिट','लाभ'],
    ['Betray','vt.','बिट्रे','धोखा देना'],
    ['Biography','n.','बायोग्रफी','जीवनी'],
    ['Blame','vt.','ब्लेम','दोष देना'],
    ['Brave','adj.','ब्रेव','वीर'],
    ['Brilliant','adj.','ब्रिलियन्ट','प्रतिभाशाली'],
    ['Budget','n.','बजट','बजट'],
    ['Build','vt.','बिल्ड','निर्माण करना'],
    ['Business','n.','बिज़नेस','व्यवसाय'],
    // C
    ['Calculate','vt.','कैल्कुलेट','गणना करना'],
    ['Career','n.','करियर','करियर'],
    ['Careful','adj.','केयरफुल','सावधान'],
    ['Cause','n.','कॉज़','कारण'],
    ['Celebrate','vt.','सेलिब्रेट','उत्सव मनाना'],
    ['Challenge','n.','चैलेंज','चुनौती'],
    ['Change','n.','चेंज','बदलाव'],
    ['Character','n.','कैरक्टर','चरित्र'],
    ['Civilisation','n.','सिविलाइज़ेशन','सभ्यता'],
    ['Claim','vt.','क्लेम','दावा करना'],
    ['Collaborate','vi.','कोलैबरेट','सहयोग करना'],
    ['Communicate','vt.','कम्युनिकेट','संवाद करना'],
    ['Community','n.','कम्युनिटी','समुदाय'],
    ['Compare','vt.','कम्पेयर','तुलना करना'],
    ['Complete','adj.','कम्प्लीट','पूरा'],
    ['Confidence','n.','कॉन्फिडेन्स','आत्मविश्वास'],
    ['Conflict','n.','कॉन्फ्लिक्ट','संघर्ष'],
    ['Congratulate','vt.','कन्ग्रैचुलेट','बधाई देना'],
    ['Contribute','vt.','कन्ट्रिब्यूट','योगदान देना'],
    ['Convince','vt.','कन्विन्स','समझाना'],
    ['Corrupt','adj.','करप्ट','भ्रष्ट'],
    ['Courage','n.','करिज','साहस'],
    ['Create','vt.','क्रिएट','सृजन करना'],
    ['Crime','n.','क्राइम','अपराध'],
    ['Crucial','adj.','क्रूशल','महत्वपूर्ण'],
    ['Cruel','adj.','क्रूअल','क्रूर'],
    ['Culture','n.','कल्चर','संस्कृति'],
    ['Curious','adj.','क्यूरियस','जिज्ञासु'],
    // D
    ['Damage','n.','डैमिज','क्षति'],
    ['Danger','n.','डेन्जर','खतरा'],
    ['Decide','vt.','डिसाइड','निर्णय लेना'],
    ['Dedicate','vt.','डेडिकेट','समर्पित करना'],
    ['Defeat','n.','डिफीट','हार'],
    ['Delicious','adj.','डिलिशस','स्वादिष्ट'],
    ['Democracy','n.','डिमॉक्रसी','लोकतंत्र'],
    ['Describe','vt.','डिस्क्राइब','वर्णन करना'],
    ['Deserve','vt.','डिजर्व','योग्य होना'],
    ['Determination','n.','डिटर्मिनेशन','दृढ़ संकल्प'],
    ['Develop','vt.','डिवेलप','विकसित करना'],
    ['Difficult','adj.','डिफिकल्ट','कठिन'],
    ['Diligent','adj.','डिलिजेन्ट','मेहनती'],
    ['Discover','vt.','डिस्कवर','खोज करना'],
    ['Discuss','vt.','डिस्कस','चर्चा करना'],
    ['Dishonest','adj.','डिसॉनिस्ट','बेईमान'],
    ['Diversity','n.','डाइवर्सिटी','विविधता'],
    ['Dream','n.','ड्रीम','सपना'],
    ['Duty','n.','ड्यूटी','कर्तव्य'],
    ['Dynamic','adj.','डायनैमिक','गतिशील'],
    // E
    ['Earn','vt.','अर्न','कमाना'],
    ['Education','n.','एजुकेशन','शिक्षा'],
    ['Effect','n.','इफेक्ट','प्रभाव'],
    ['Effort','n.','एफर्ट','प्रयास'],
    ['Eliminate','vt.','इलिमिनेट','समाप्त करना'],
    ['Emergency','n.','इमर्जन्सी','आपातकाल'],
    ['Emotion','n.','इमोशन','भावना'],
    ['Encourage','vt.','एन्करिज','प्रोत्साहित करना'],
    ['Energy','n.','एनर्जी','ऊर्जा'],
    ['Enjoy','vt.','एन्जॉय','आनंद लेना'],
    ['Equality','n.','ईक्वलिटी','समानता'],
    ['Essential','adj.','एसेन्शल','आवश्यक'],
    ['Establish','vt.','एस्टैब्लिश','स्थापित करना'],
    ['Evaluate','vt.','इवैल्युएट','मूल्यांकन करना'],
    ['Evidence','n.','एविडेन्स','सबूत'],
    ['Excellent','adj.','एक्सलेन्ट','उत्कृष्ट'],
    ['Experience','n.','एक्स्पीरियन्स','अनुभव'],
    ['Extraordinary','adj.','एक्स्ट्राऑर्डिनरी','असाधारण'],
    // F
    ['Fail','vi.','फेल','असफल होना'],
    ['Faith','n.','फेथ','विश्वास'],
    ['Familiar','adj.','फमिलियर','परिचित'],
    ['Famous','adj.','फेमस','प्रसिद्ध'],
    ['Fantastic','adj.','फैन्टैस्टिक','शानदार'],
    ['Fear','n.','फियर','डर'],
    ['Forgive','vt.','फॉरगिव','माफ करना'],
    ['Foundation','n.','फाउन्डेशन','नींव'],
    ['Freedom','n.','फ्रीडम','स्वतंत्रता'],
    ['Friendly','adj.','फ्रेन्डली','मित्रवत'],
    ['Frustrate','vt.','फ्रस्ट्रेट','निराश करना'],
    ['Fulfill','vt.','फुलफिल','पूरा करना'],
    ['Fundamental','adj.','फन्डामेन्टल','मौलिक'],
    ['Future','n.','फ्यूचर','भविष्य'],
    // G
    ['Generous','adj.','जेनरस','उदार'],
    ['Genius','n.','जीनियस','प्रतिभाशाली'],
    ['Genuine','adj.','जेन्युइन','असली'],
    ['Global','adj.','ग्लोबल','वैश्विक'],
    ['Glory','n.','ग्लोरी','गौरव'],
    ['Goal','n.','गोल','लक्ष्य'],
    ['Government','n.','गवर्नमेन्ट','सरकार'],
    ['Grateful','adj.','ग्रेटफुल','आभारी'],
    ['Gratitude','n.','ग्रैटिट्यूड','कृतज्ञता'],
    ['Growth','n.','ग्रोथ','विकास'],
    ['Guarantee','n.','गैरन्टी','गारंटी'],
    ['Guidance','n.','गाइडेन्स','मार्गदर्शन'],
    // H
    ['Habit','n.','हैबिट','आदत'],
    ['Happiness','n.','हैपिनेस','खुशी'],
    ['Honesty','n.','ऑनिस्टी','ईमानदारी'],
    ['Hope','n.','होप','आशा'],
    ['Hostile','adj.','होस्टाइल','शत्रुतापूर्ण'],
    ['Humble','adj.','हम्बल','विनम्र'],
    // I
    ['Identity','n.','आइडेन्टिटी','पहचान'],
    ['Ignorant','adj.','इग्नरेन्ट','अज्ञानी'],
    ['Imagination','n.','इमैजिनेशन','कल्पना'],
    ['Immediate','adj.','इमीडिएट','तत्काल'],
    ['Innocent','adj.','इनसेन्ट','निर्दोष'],
    ['Innovation','n.','इनोवेशन','नवाचार'],
    ['Intelligence','n.','इन्टेलिजेन्स','बुद्धि'],
    ['Integrity','n.','इन्टीग्रिटी','ईमानदारी'],
    ['Invest','vt.','इन्वेस्ट','निवेश करना'],
    ['Invite','vt.','इन्वाइट','निमंत्रण देना'],
    // J
    ['Jealous','adj.','जेलस','ईर्ष्यालु'],
    ['Journey','n.','जर्नी','यात्रा'],
    ['Justice','n.','जस्टिस','न्याय'],
    ['Justify','vt.','जस्टिफाई','औचित्य सिद्ध करना'],
    // K
    ['Keen','adj.','कीन','उत्सुक, तीव्र'],
    ['Kindness','n.','काइन्डनेस','दयालुता'],
    ['Knowledge','n.','नॉलिज','ज्ञान'],
    // L
    ['Leadership','n.','लीडरशिप','नेतृत्व'],
    ['Learn','vt.','लर्न','सीखना'],
    ['Liberty','n.','लिबर्टी','स्वतंत्रता'],
    ['Loyalty','n.','लॉयल्टी','वफादारी'],
    ['Luxury','n.','लक्शरी','विलासिता'],
    // M
    ['Magnificent','adj.','मैग्निफिसेन्ट','भव्य'],
    ['Manage','vt.','मैनेज','प्रबंधन करना'],
    ['Meaningful','adj.','मीनिंगफुल','सार्थक'],
    ['Memory','n.','मेमरी','स्मृति'],
    ['Miracle','n.','मिरेकल','चमत्कार'],
    ['Modest','adj.','मॉडेस्ट','विनम्र'],
    ['Motivate','vt.','मोटिवेट','प्रेरित करना'],
    ['Mutual','adj.','म्यूचुअल','पारस्परिक'],
    ['Mysterious','adj.','मिस्टीरियस','रहस्यमय'],
    // N
    ['Narrate','vt.','नैरेट','वर्णन करना'],
    ['Necessary','adj.','नेसेसरी','आवश्यक'],
    ['Negotiate','vt.','निगोशिएट','बातचीत करना'],
    ['Noble','adj.','नोबल','कुलीन'],
    ['Nonsense','n.','नॉनसेन्स','बकवास'],
    // O
    ['Obey','vt.','ओबे','पालन करना'],
    ['Opportunity','n.','ऑपर्च्युनिटी','अवसर'],
    ['Ordinary','adj.','ऑर्डिनरी','साधारण'],
    ['Outstanding','adj.','आउटस्टैंडिंग','उत्कृष्ट'],
    ['Overcome','vt.','ओवरकम','पार करना'],
    // P
    ['Patience','n.','पेशन्स','धैर्य'],
    ['Patriot','n.','पेट्रियट','देशभक्त'],
    ['Peaceful','adj.','पीसफुल','शांतिपूर्ण'],
    ['Persevere','vi.','पर्सिवियर','दृढ़ रहना'],
    ['Personality','n.','पर्सनैलिटी','व्यक्तित्व'],
    ['Persuade','vt.','परस्वेड','मनाना'],
    ['Potential','n.','पोटेन्शल','क्षमता'],
    ['Poverty','n.','पॉवर्टी','गरीबी'],
    ['Powerful','adj.','पावरफुल','शक्तिशाली'],
    ['Practical','adj.','प्रैक्टिकल','व्यावहारिक'],
    ['Precious','adj.','प्रेशस','कीमती'],
    ['Prejudice','n.','प्रेजुडिस','पूर्वाग्रह'],
    ['Pride','n.','प्राइड','गर्व'],
    ['Priority','n.','प्रायरिटी','प्राथमिकता'],
    ['Progress','n.','प्रोग्रेस','प्रगति'],
    ['Protect','vt.','प्रटेक्ट','रक्षा करना'],
    ['Prove','vt.','प्रूव','साबित करना'],
    ['Purpose','n.','परपस','उद्देश्य'],
    // Q
    ['Quality','n.','क्वालिटी','गुणवत्ता'],
    ['Question','n.','क्वेश्चन','प्रश्न'],
    // R
    ['Realize','vt.','रियलाइज़','महसूस करना'],
    ['Responsible','adj.','रिस्पॉन्सिबल','जिम्मेदार'],
    ['Revolution','n.','रेवोल्यूशन','क्रांति'],
    ['Reward','n.','रिवॉर्ड','पुरस्कार'],
    ['Ridiculous','adj.','रिडिक्युलस','हास्यास्पद'],
    ['Respect','n.','रिस्पेक्ट','सम्मान'],
    ['Research','n.','रिसर्च','अनुसंधान'],
    // S
    ['Sacrifice','n.','सैक्रिफाइस','बलिदान'],
    ['Satisfaction','n.','सैटिस्फैक्शन','संतुष्टि'],
    ['Selfish','adj.','सेल्फिश','स्वार्थी'],
    ['Sensitive','adj.','सेन्सिटिव','संवेदनशील'],
    ['Sincere','adj.','सिन्सियर','ईमानदार'],
    ['Skill','n.','स्किल','कौशल'],
    ['Society','n.','सोसाइटी','समाज'],
    ['Struggle','n.','स्ट्रगल','संघर्ष'],
    ['Success','n.','सक्सेस','सफलता'],
    ['Sympathy','n.','सिम्पथी','सहानुभूति'],
    // T
    ['Talent','n.','टैलेन्ट','प्रतिभा'],
    ['Tradition','n.','ट्रडिशन','परंपरा'],
    ['Transparent','adj.','ट्रान्सपेरेन्ट','पारदर्शी'],
    ['Trust','n.','ट्रस्ट','विश्वास'],
    ['Truth','n.','ट्रूथ','सत्य'],
    // U
    ['Unique','adj.','यूनीक','अद्वितीय'],
    ['Unity','n.','यूनिटी','एकता'],
    ['Useful','adj.','यूज़फुल','उपयोगी'],
    // V
    ['Valuable','adj.','वैल्युएबल','मूल्यवान'],
    ['Victory','n.','विक्टरी','विजय'],
    ['Virtue','n.','वर्चू','सद्गुण'],
    // W
    ['Wisdom','n.','विज्डम','ज्ञान, बुद्धिमानी'],
    ['Wonder','n.','वन्डर','आश्चर्य'],
    ['Worth','adj.','वर्थ','मूल्य का'],
    // Y-Z
    ['Zeal','n.','ज़ील','उत्साह'],
  ];

  // Filtered lists for each lesson
  static List<List<String>> get wordsAE =>
      allWords.where((w) => RegExp(r'^[A-Ea-e]').hasMatch(w[0])).toList();
  static List<List<String>> get wordsFJ =>
      allWords.where((w) => RegExp(r'^[F-Jf-j]').hasMatch(w[0])).toList();
  static List<List<String>> get wordsKO =>
      allWords.where((w) => RegExp(r'^[K-Ok-o]').hasMatch(w[0])).toList();
  static List<List<String>> get wordsPS =>
      allWords.where((w) => RegExp(r'^[P-Sp-s]').hasMatch(w[0])).toList();
  static List<List<String>> get wordsTZ =>
      allWords.where((w) => RegExp(r'^[T-Zt-z]').hasMatch(w[0])).toList();

  // ─── Quiz Questions ────────────────────────────────────────────────────────

  static const List<QuizQuestion> dictAEQuestions = [
    QuizQuestion(questionHi: '"Abandon" का हिंदी अर्थ?', questionEn: 'Hindi meaning of "Abandon"?', options: ['प्रशंसा करना', 'त्याग देना, छोड़ देना', 'स्वीकार करना', 'बचना'], correctIndex: 1, explanation: 'Abandon = त्याग देना, छोड़ देना (vt.)'),
    QuizQuestion(questionHi: '"Accurate" किस Part of Speech का शब्द है?', questionEn: '"Accurate" belongs to which POS?', options: ['Noun', 'Verb', 'Adjective', 'Adverb'], correctIndex: 2, explanation: 'Accurate (adj.) = सटीक, शुद्ध।'),
    QuizQuestion(questionHi: '"Achievement" का अर्थ?', questionEn: 'Meaning of "Achievement"?', options: ['क्रिया', 'आदत', 'उपलब्धि', 'ध्यान'], correctIndex: 2, explanation: 'Achievement (n.) = उपलब्धि।'),
    QuizQuestion(questionHi: '"Courage" का synonym कौन सा है?', questionEn: 'Which word is closest to "Courage"?', options: ['Fear', 'Bravery', 'Anger', 'Doubt'], correctIndex: 1, explanation: 'Courage = साहस। Bravery = वीरता — दोनों समान अर्थ।'),
    QuizQuestion(questionHi: '"Encourage" का हिंदी?', questionEn: 'Hindi meaning of "Encourage"?', options: ['निराश करना', 'घेरना', 'प्रोत्साहित करना', 'बचाना'], correctIndex: 2, explanation: 'Encourage (vt.) = प्रोत्साहित करना।'),
  ];

  static const List<QuizQuestion> dictFJQuestions = [
    QuizQuestion(questionHi: '"Forgive" का अर्थ?', questionEn: 'Meaning of "Forgive"?', options: ['दोष देना', 'माफ करना', 'भूलना', 'बचाना'], correctIndex: 1, explanation: 'Forgive (vt.) = माफ करना।'),
    QuizQuestion(questionHi: '"Freedom" का हिंदी?', questionEn: 'Hindi for "Freedom"?', options: ['गरीबी', 'सफलता', 'स्वतंत्रता', 'विकास'], correctIndex: 2, explanation: 'Freedom (n.) = स्वतंत्रता।'),
    QuizQuestion(questionHi: '"Genuine" का अर्थ?', questionEn: 'Meaning of "Genuine"?', options: ['नकली', 'असली', 'पुराना', 'नया'], correctIndex: 1, explanation: 'Genuine (adj.) = असली।'),
    QuizQuestion(questionHi: '"Grateful" किस situation में use होता है?', questionEn: 'When do you use "Grateful"?', options: ['जब क्रोधित हों', 'जब आभारी हों', 'जब डरे हों', 'जब थके हों'], correctIndex: 1, explanation: 'Grateful (adj.) = आभारी — when you are thankful.'),
    QuizQuestion(questionHi: '"Justice" का हिंदी?', questionEn: 'Hindi for "Justice"?', options: ['अपराध', 'न्याय', 'पुरस्कार', 'साहस'], correctIndex: 1, explanation: 'Justice (n.) = न्याय।'),
  ];

  static const List<QuizQuestion> dictKOQuestions = [
    QuizQuestion(questionHi: '"Knowledge" का हिंदी?', questionEn: 'Hindi for "Knowledge"?', options: ['कौशल', 'ज्ञान', 'प्रतिभा', 'विश्वास'], correctIndex: 1, explanation: 'Knowledge (n.) = ज्ञान।'),
    QuizQuestion(questionHi: '"Loyalty" का अर्थ?', questionEn: 'Meaning of "Loyalty"?', options: ['स्वार्थ', 'वफादारी', 'घृणा', 'ईर्ष्या'], correctIndex: 1, explanation: 'Loyalty (n.) = वफादारी।'),
    QuizQuestion(questionHi: '"Motivate" का हिंदी?', questionEn: 'Hindi for "Motivate"?', options: ['निंदा करना', 'रोकना', 'प्रेरित करना', 'धोखा देना'], correctIndex: 2, explanation: 'Motivate (vt.) = प्रेरित करना।'),
    QuizQuestion(questionHi: '"Noble" किस part of speech का है?', questionEn: '"Noble" is which POS?', options: ['Noun', 'Adjective', 'Verb', 'Adverb'], correctIndex: 1, explanation: 'Noble (adj.) = कुलीन।'),
    QuizQuestion(questionHi: '"Opportunity" का हिंदी?', questionEn: 'Hindi for "Opportunity"?', options: ['चुनौती', 'अवसर', 'संकट', 'लाभ'], correctIndex: 1, explanation: 'Opportunity (n.) = अवसर।'),
  ];

  static const List<QuizQuestion> dictPSQuestions = [
    QuizQuestion(questionHi: '"Patience" का अर्थ?', questionEn: 'Meaning of "Patience"?', options: ['जल्दी', 'धैर्य', 'क्रोध', 'चिंता'], correctIndex: 1, explanation: 'Patience (n.) = धैर्य।'),
    QuizQuestion(questionHi: '"Poverty" का हिंदी?', questionEn: 'Hindi for "Poverty"?', options: ['समृद्धि', 'अमीरी', 'गरीबी', 'स्वास्थ्य'], correctIndex: 2, explanation: 'Poverty (n.) = गरीबी।'),
    QuizQuestion(questionHi: '"Sacrifice" का अर्थ?', questionEn: 'Meaning of "Sacrifice"?', options: ['पुरस्कार', 'बलिदान', 'आराम', 'लाभ'], correctIndex: 1, explanation: 'Sacrifice (n.) = बलिदान।'),
    QuizQuestion(questionHi: '"Sincere" का हिंदी?', questionEn: 'Hindi for "Sincere"?', options: ['बेईमान', 'ईमानदार', 'आलसी', 'क्रूर'], correctIndex: 1, explanation: 'Sincere (adj.) = ईमानदार।'),
    QuizQuestion(questionHi: '"Struggle" का अर्थ?', questionEn: 'Meaning of "Struggle"?', options: ['सफलता', 'आनंद', 'संघर्ष', 'विश्राम'], correctIndex: 2, explanation: 'Struggle (n.) = संघर्ष।'),
  ];

  static const List<QuizQuestion> dictTZQuestions = [
    QuizQuestion(questionHi: '"Trust" का हिंदी?', questionEn: 'Hindi for "Trust"?', options: ['संदेह', 'विश्वास', 'घृणा', 'ईर्ष्या'], correctIndex: 1, explanation: 'Trust (n.) = विश्वास।'),
    QuizQuestion(questionHi: '"Unique" का अर्थ?', questionEn: 'Meaning of "Unique"?', options: ['सामान्य', 'पुराना', 'अद्वितीय', 'नकली'], correctIndex: 2, explanation: 'Unique (adj.) = अद्वितीय।'),
    QuizQuestion(questionHi: '"Virtue" का हिंदी?', questionEn: 'Hindi for "Virtue"?', options: ['पाप', 'सद्गुण', 'दुर्बलता', 'आदत'], correctIndex: 1, explanation: 'Virtue (n.) = सद्गुण।'),
    QuizQuestion(questionHi: '"Wisdom" का अर्थ?', questionEn: 'Meaning of "Wisdom"?', options: ['अज्ञानता', 'ज्ञान, बुद्धिमानी', 'साहस', 'धैर्य'], correctIndex: 1, explanation: 'Wisdom (n.) = ज्ञान, बुद्धिमानी।'),
    QuizQuestion(questionHi: '"Zeal" का हिंदी?', questionEn: 'Hindi for "Zeal"?', options: ['उदासी', 'भय', 'उत्साह', 'आलस'], correctIndex: 2, explanation: 'Zeal (n.) = उत्साह।'),
  ];

  static const List<QuizQuestion> posQuestions = [
    QuizQuestion(questionHi: '"n." का full form?', questionEn: 'Full form of "n." in dictionary?', options: ['Name', 'Noun', 'Number', 'Negative'], correctIndex: 1, explanation: 'n. = Noun (संज्ञा) — person, place, thing.'),
    QuizQuestion(questionHi: '"vt." किस verb को indicate करता है?', questionEn: 'What does "vt." indicate?', options: ['Intransitive Verb', 'Transitive Verb', 'Modal Verb', 'Irregular Verb'], correctIndex: 1, explanation: 'vt. = Transitive Verb — has an object. E.g., "He hit Rahul." (Rahul = object)'),
    QuizQuestion(questionHi: '"vi." किस verb को indicate करता है?', questionEn: 'What does "vi." indicate?', options: ['Transitive Verb', 'Intransitive Verb', 'Noun', 'Adjective'], correctIndex: 1, explanation: 'vi. = Intransitive Verb — no object needed. E.g., "Dad smiled."'),
    QuizQuestion(questionHi: '"adj." का full form?', questionEn: 'Full form of "adj."?', options: ['Adverb', 'Adjacent', 'Adjective', 'Addition'], correctIndex: 2, explanation: 'adj. = Adjective (विशेषण) — describes a noun.'),
    QuizQuestion(questionHi: '"Brave" किस POS का है?', questionEn: '"Brave" belongs to which POS?', options: ['n.', 'vt.', 'adj.', 'adv.'], correctIndex: 2, explanation: 'Brave (adj.) = वीर — describes a person.'),
  ];

  static const List<QuizQuestion> quizEnHiQuestions = [
    QuizQuestion(questionHi: '"Arrogant" का हिंदी?', questionEn: 'Hindi for "Arrogant"?', options: ['विनम्र', 'अहंकारी', 'ईमानदार', 'साहसी'], correctIndex: 1, explanation: 'Arrogant (adj.) = अहंकारी।'),
    QuizQuestion(questionHi: '"Chaos" का हिंदी?', questionEn: 'Hindi for "Chaos"?', options: ['शांति', 'व्यवस्था', 'अराजकता', 'सफलता'], correctIndex: 2, explanation: 'Chaos (n.) = अराजकता।'),
    QuizQuestion(questionHi: '"Dedication" का अर्थ?', questionEn: 'Meaning of "Dedication"?', options: ['लापरवाही', 'समर्पण', 'आलस', 'घृणा'], correctIndex: 1, explanation: 'Dedication (n.) = समर्पण।'),
    QuizQuestion(questionHi: '"Enormous" का हिंदी?', questionEn: 'Hindi for "Enormous"?', options: ['छोटा', 'विशाल', 'हल्का', 'पतला'], correctIndex: 1, explanation: 'Enormous (adj.) = विशाल।'),
    QuizQuestion(questionHi: '"Fragile" का हिंदी?', questionEn: 'Hindi for "Fragile"?', options: ['मजबूत', 'नाजुक, टूटने योग्य', 'भारी', 'कठोर'], correctIndex: 1, explanation: 'Fragile (adj.) = नाजुक, आसानी से टूटने वाला।'),
    QuizQuestion(questionHi: '"Harmony" का हिंदी?', questionEn: 'Hindi for "Harmony"?', options: ['विवाद', 'सद्भाव', 'युद्ध', 'संघर्ष'], correctIndex: 1, explanation: 'Harmony (n.) = सद्भाव।'),
    QuizQuestion(questionHi: '"Inevitable" का अर्थ?', questionEn: 'Meaning of "Inevitable"?', options: ['संभव', 'असंभव', 'अपरिहार्य', 'अस्थायी'], correctIndex: 2, explanation: 'Inevitable (adj.) = अपरिहार्य — जो टाला नहीं जा सकता।'),
    QuizQuestion(questionHi: '"Prejudice" का हिंदी?', questionEn: 'Hindi for "Prejudice"?', options: ['न्याय', 'पूर्वाग्रह', 'स्नेह', 'समझदारी'], correctIndex: 1, explanation: 'Prejudice (n.) = पूर्वाग्रह — pre-formed opinion.'),
  ];

  static const List<QuizQuestion> quizHiEnQuestions = [
    QuizQuestion(questionHi: '"उत्साह" का English?', questionEn: 'English for "उत्साह"?', options: ['Sorrow', 'Zeal', 'Fear', 'Anger'], correctIndex: 1, explanation: 'उत्साह = Zeal / Enthusiasm।'),
    QuizQuestion(questionHi: '"अनुभव" का English?', questionEn: 'English for "अनुभव"?', options: ['Experiment', 'Exercise', 'Experience', 'Explanation'], correctIndex: 2, explanation: 'अनुभव = Experience (n.)।'),
    QuizQuestion(questionHi: '"सद्भाव" का English?', questionEn: 'English for "सद्भाव"?', options: ['Conflict', 'Harmony', 'Hatred', 'Dispute'], correctIndex: 1, explanation: 'सद्भाव = Harmony (n.)।'),
    QuizQuestion(questionHi: '"बलिदान" का English?', questionEn: 'English for "बलिदान"?', options: ['Victory', 'Reward', 'Sacrifice', 'Prize'], correctIndex: 2, explanation: 'बलिदान = Sacrifice (n.)।'),
    QuizQuestion(questionHi: '"प्रेरित करना" का English?', questionEn: 'English for "प्रेरित करना"?', options: ['Frustrate', 'Motivate', 'Ignore', 'Punish'], correctIndex: 1, explanation: 'प्रेरित करना = Motivate (vt.)।'),
    QuizQuestion(questionHi: '"आभारी" का English?', questionEn: 'English for "आभारी"?', options: ['Arrogant', 'Jealous', 'Grateful', 'Selfish'], correctIndex: 2, explanation: 'आभारी = Grateful (adj.)।'),
    QuizQuestion(questionHi: '"न्याय" का English?', questionEn: 'English for "न्याय"?', options: ['Crime', 'Punishment', 'Justice', 'Law'], correctIndex: 2, explanation: 'न्याय = Justice (n.)।'),
    QuizQuestion(questionHi: '"वफादारी" का English?', questionEn: 'English for "वफादारी"?', options: ['Betrayal', 'Loyalty', 'Dishonesty', 'Jealousy'], correctIndex: 1, explanation: 'वफादारी = Loyalty (n.)।'),
  ];

  static const List<QuizQuestion> quizPosQuestions = [
    QuizQuestion(questionHi: '"Happiness" किस POS का है?', questionEn: '"Happiness" is which POS?', options: ['adj.', 'n.', 'vt.', 'adv.'], correctIndex: 1, explanation: 'Happiness (n.) = खुशी — noun क्योंकि यह एक भाव/वस्तु है।'),
    QuizQuestion(questionHi: '"Smile" (vi.) और "Hit" (vt.) में अंतर?', questionEn: 'Difference between "vi." and "vt."?', options: ['vi. has object, vt. does not', 'vt. has object, vi. does not', 'Both same', 'Only tense differs'], correctIndex: 1, explanation: 'vt. = object ज़रूरी है। vi. = object नहीं चाहिए।'),
    QuizQuestion(questionHi: '"Always" किस POS का है?', questionEn: '"Always" is which POS?', options: ['Noun', 'Adjective', 'Adverb', 'Conjunction'], correctIndex: 2, explanation: 'Always (adv.) = हमेशा — verb को modify करता है।'),
    QuizQuestion(questionHi: '"And", "But", "Because" किस POS के हैं?', questionEn: '"And", "But", "Because" belong to?', options: ['Preposition', 'Conjunction', 'Determiner', 'Pronoun'], correctIndex: 1, explanation: 'And, But, Because = Conjunction (conj.) — वाक्यों को जोड़ते हैं।'),
    QuizQuestion(questionHi: '"Can", "Should", "Must" किस POS के हैं?', questionEn: '"Can", "Should", "Must" belong to?', options: ['Main Verbs', 'Modal Verbs', 'Nouns', 'Adjectives'], correctIndex: 1, explanation: 'Can, Should, Must = Modal Verbs — helping verbs जो possibility/obligation दर्शाती हैं।'),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(questionHi: '"Arrogant" का हिंदी?', questionEn: 'Hindi for "Arrogant"?', options: ['विनम्र', 'अहंकारी', 'साहसी', 'ईमानदार'], correctIndex: 1, explanation: 'Arrogant (adj.) = अहंकारी।'),
    QuizQuestion(questionHi: '"vt." = ?', questionEn: '"vt." stands for?', options: ['Intransitive Verb', 'Transitive Verb', 'Modal Verb', 'Main Verb'], correctIndex: 1, explanation: 'vt. = Transitive Verb — needs an object.'),
    QuizQuestion(questionHi: '"Sacrifice" का हिंदी?', questionEn: 'Hindi for "Sacrifice"?', options: ['पुरस्कार', 'बलिदान', 'लाभ', 'आराम'], correctIndex: 1, explanation: 'Sacrifice (n.) = बलिदान।'),
    QuizQuestion(questionHi: '"वफादारी" का English?', questionEn: 'English for "वफादारी"?', options: ['Jealousy', 'Betrayal', 'Loyalty', 'Hatred'], correctIndex: 2, explanation: 'वफादारी = Loyalty (n.)।'),
    QuizQuestion(questionHi: '"Patience" का हिंदी?', questionEn: 'Hindi for "Patience"?', options: ['क्रोध', 'जल्दी', 'धैर्य', 'चिंता'], correctIndex: 2, explanation: 'Patience (n.) = धैर्य।'),
    QuizQuestion(questionHi: '"vi." में object क्यों नहीं होता?', questionEn: 'Why does "vi." not need an object?', options: ['It is a noun', 'Intransitive verbs express action that doesn\'t pass to an object', 'It is an adjective', 'It is always in past tense'], correctIndex: 1, explanation: 'vi. = Intransitive — action stays with the subject. E.g., "Dad smiled."'),
    QuizQuestion(questionHi: '"सद्भाव" का English?', questionEn: 'English for "सद्भाव"?', options: ['Conflict', 'Harmony', 'Violence', 'Dispute'], correctIndex: 1, explanation: 'सद्भाव = Harmony (n.)।'),
    QuizQuestion(questionHi: '"Wisdom" का हिंदी?', questionEn: 'Hindi for "Wisdom"?', options: ['अज्ञानता', 'साहस', 'ज्ञान, बुद्धिमानी', 'आलस'], correctIndex: 2, explanation: 'Wisdom (n.) = ज्ञान, बुद्धिमानी।'),
    QuizQuestion(questionHi: '"Always" किस POS का है?', questionEn: '"Always" belongs to?', options: ['Noun', 'Adjective', 'Adverb', 'Conjunction'], correctIndex: 2, explanation: 'Always (adv.) = हमेशा।'),
    QuizQuestion(questionHi: '"Zeal" का हिंदी?', questionEn: 'Hindi for "Zeal"?', options: ['उदासी', 'उत्साह', 'भय', 'आलस'], correctIndex: 1, explanation: 'Zeal (n.) = उत्साह।'),
  ];
}