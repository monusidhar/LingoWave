/// Speaking-practice sentence bank.
///
/// Chapter banks live in this file; the per-lesson banks for chapters 2-45
/// live in lib/data/speaking/ (one part file per chapter block). Each session
/// shuffles its bank and picks a few, so back-to-back sessions feel fresh.
/// Kept separate from chapterN_data.dart so speaking practice never depends
/// on any chapter's internal data shape.
import 'speaking/speaking_sentence.dart';
import 'vocab_data.dart';
import 'speaking/speaking_lessons_02_09.dart';
import 'speaking/speaking_lessons_10_17.dart';
import 'speaking/speaking_lessons_18_25.dart';
import 'speaking/speaking_lessons_26_33.dart';
import 'speaking/speaking_lessons_34_42.dart';
import 'speaking/speaking_lessons_41_44_45.dart';

export 'speaking/speaking_sentence.dart';

class SpeakingData {
  /// Sentences for a chapter; falls back to the chapter-1 set for any id
  /// without its own bank (safe default — basic greetings).
  static List<SpeakingSentence> forChapter(int chapterId) =>
      _byChapter[chapterId] ?? _byChapter[1]!;

  /// Chapters up to here practice WORDS (from the vocab banks); later
  /// chapters practice sentences. Mirrors the exercise engine's boundary.
  static const int lastWordLevelChapter = 15;

  /// What speaking practice should serve for a lesson, matched to the
  /// learner's level: vocab words for chapters 1-15, sentences after.
  static List<SpeakingSentence> practiceItemsForLesson(
      int chapterId, int lessonId) {
    if (chapterId <= lastWordLevelChapter) {
      final vocab = VocabData.forLesson(chapterId, lessonId);
      if (vocab != null && vocab.isNotEmpty) return vocab;
    }
    return forLesson(chapterId, lessonId);
  }

  /// Chapter-wide practice pool: union of the chapter's lesson vocab banks
  /// for word-level chapters (deterministic order — the no-repeat logic
  /// stores indices into this pool), sentences for later chapters.
  static List<SpeakingSentence> practiceItemsForChapter(
      int chapterId, List<int> lessonIds) {
    if (chapterId <= lastWordLevelChapter) {
      final pool = <SpeakingSentence>[];
      for (final id in lessonIds) {
        pool.addAll(VocabData.forLesson(chapterId, id) ?? const []);
      }
      if (pool.isNotEmpty) return pool;
    }
    return forChapter(chapterId);
  }

  /// Sentences for a specific lesson. Every non-quiz lesson in the app has a
  /// dedicated bank (chapter 1 below; chapters 2-45 in lib/data/speaking/).
  /// The chapter-bank slice remains only as a safety net for any lesson id
  /// added to the app before its bank is authored.
  static List<SpeakingSentence> forLesson(int chapterId, int lessonId) {
    final own = _allLessonBanks['ch${chapterId}_les$lessonId'];
    if (own != null) return own;
    final pool = forChapter(chapterId);
    final count = pool.length < 5 ? pool.length : 5;
    final start = ((lessonId - 1) * 3) % pool.length;
    return List.generate(count, (i) => pool[(start + i) % pool.length]);
  }

  /// True when the lesson has a dedicated authored bank (used by tests).
  static bool hasLessonBank(int chapterId, int lessonId) =>
      _allLessonBanks.containsKey('ch${chapterId}_les$lessonId');

  /// All per-lesson banks merged: chapter 1 (below) + the part files.
  static final Map<String, List<SpeakingSentence>> _allLessonBanks = {
    ..._byLesson,
    ...speakingLessonsCh02to09,
    ...speakingLessonsCh10to17,
    ...speakingLessonsCh18to25,
    ...speakingLessonsCh26to33,
    ...speakingLessonsCh34to42,
    ...speakingLessonsCh41to45,
  };

  /// Chapter-1 lesson banks, keyed 'ch{chapterId}_les{lessonId}'.
  static const Map<String, List<SpeakingSentence>> _byLesson = {
    // ── Chapter 1 ──────────────────────────────────────────────────────────
    // Les 1 — Alphabets
    'ch1_les1': [
      SpeakingSentence(en: 'A is the first letter.', hi: 'ए पहला अक्षर है।'),
      SpeakingSentence(en: 'Z is the last letter.', hi: 'ज़ेड आखिरी अक्षर है।'),
      SpeakingSentence(
          en: 'English has twenty six letters.',
          hi: 'अंग्रेज़ी में छब्बीस अक्षर होते हैं।'),
      SpeakingSentence(
          en: 'My name starts with R.', hi: 'मेरा नाम आर से शुरू होता है।'),
      SpeakingSentence(
          en: 'I can say the alphabet.', hi: 'मैं वर्णमाला बोल सकता हूँ।'),
    ],
    // Les 2 — Vowels & Consonants
    'ch1_les2': [
      SpeakingSentence(
          en: 'There are five vowels in English.',
          hi: 'अंग्रेज़ी में पाँच स्वर होते हैं।'),
      SpeakingSentence(
          en: 'The rest are consonants.', hi: 'बाकी अक्षर व्यंजन होते हैं।'),
      SpeakingSentence(
          en: 'Apple starts with a vowel.', hi: 'एप्पल स्वर से शुरू होता है।'),
      SpeakingSentence(
          en: 'Ball starts with a consonant.', hi: 'बॉल व्यंजन से शुरू होता है।'),
      SpeakingSentence(
          en: 'Every word needs a vowel sound.',
          hi: 'हर शब्द में स्वर की ध्वनि ज़रूरी होती है।'),
    ],
    // Les 3 — Greetings
    'ch1_les3': [
      SpeakingSentence(en: 'Good morning, sir.', hi: 'सुप्रभात, श्रीमान।'),
      SpeakingSentence(en: 'Good evening, everyone.', hi: 'सभी को शुभ संध्या।'),
      SpeakingSentence(en: 'Hello, how are you?', hi: 'नमस्ते, आप कैसे हैं?'),
      SpeakingSentence(
          en: 'I am happy to see you.', hi: 'आपसे मिलकर खुशी हुई।'),
      SpeakingSentence(en: 'Have a nice day.', hi: 'आपका दिन शुभ हो।'),
    ],
    // Les 4 — Manners
    'ch1_les4': [
      SpeakingSentence(
          en: 'Please give me the book.', hi: 'कृपया मुझे किताब दीजिए।'),
      SpeakingSentence(
          en: 'Thank you for your help.', hi: 'आपकी मदद के लिए धन्यवाद।'),
      SpeakingSentence(
          en: 'I am sorry for the mistake.', hi: 'गलती के लिए माफ़ी चाहता हूँ।'),
      SpeakingSentence(
          en: 'Excuse me, may I ask something?',
          hi: 'माफ़ कीजिए, क्या मैं कुछ पूछ सकता हूँ?'),
      SpeakingSentence(en: 'You are welcome.', hi: 'कोई बात नहीं।'),
    ],
    // Les 5 — Days & Months
    'ch1_les5': [
      SpeakingSentence(en: 'Today is Monday.', hi: 'आज सोमवार है।'),
      SpeakingSentence(en: 'Sunday is a holiday.', hi: 'रविवार को छुट्टी होती है।'),
      SpeakingSentence(
          en: 'January is the first month.', hi: 'जनवरी पहला महीना है।'),
      SpeakingSentence(
          en: 'There are twelve months in a year.',
          hi: 'साल में बारह महीने होते हैं।'),
      SpeakingSentence(
          en: 'My birthday is in August.', hi: 'मेरा जन्मदिन अगस्त में है।'),
    ],
    // Les 6 — Numbers
    'ch1_les6': [
      SpeakingSentence(en: 'I have ten fingers.', hi: 'मेरी दस उँगलियाँ हैं।'),
      SpeakingSentence(en: 'Two plus two is four.', hi: 'दो और दो चार होते हैं।'),
      SpeakingSentence(
          en: 'There are seven days in a week.',
          hi: 'हफ़्ते में सात दिन होते हैं।'),
      SpeakingSentence(en: 'I have five apples.', hi: 'मेरे पास पाँच सेब हैं।'),
      SpeakingSentence(
          en: 'One hundred is a big number.', hi: 'सौ एक बड़ी संख्या है।'),
    ],
    // Les 7 — Telling Time
    'ch1_les7': [
      SpeakingSentence(en: 'It is nine o\'clock.', hi: 'नौ बज गए हैं।'),
      SpeakingSentence(
          en: 'The time is half past two.', hi: 'ढाई बज गए हैं।'),
      SpeakingSentence(
          en: 'I wake up at six in the morning.', hi: 'मैं सुबह छह बजे उठता हूँ।'),
      SpeakingSentence(en: 'The class starts at ten.', hi: 'कक्षा दस बजे शुरू होती है।'),
      SpeakingSentence(
          en: 'It is quarter past five.', hi: 'सवा पाँच बजे हैं।'),
    ],
    // Les 8 — Punctuation
    'ch1_les8': [
      SpeakingSentence(
          en: 'A sentence ends with a full stop.',
          hi: 'वाक्य पूर्ण विराम पर खत्म होता है।'),
      SpeakingSentence(
          en: 'A question ends with a question mark.',
          hi: 'प्रश्न के अंत में प्रश्नवाचक चिह्न आता है।'),
      SpeakingSentence(
          en: 'Use a comma for a pause.', hi: 'रुकने के लिए कॉमा लगाइए।'),
      SpeakingSentence(
          en: 'Capital letters start a sentence.',
          hi: 'वाक्य बड़े अक्षर से शुरू होता है।'),
      SpeakingSentence(
          en: 'Write your name with a capital letter.',
          hi: 'अपना नाम बड़े अक्षर से लिखिए।'),
    ],
    // Les 9 — Contractions
    'ch1_les9': [
      SpeakingSentence(
          en: 'I\'m learning English.', hi: 'मैं अंग्रेज़ी सीख रहा हूँ।'),
      SpeakingSentence(en: 'Don\'t worry about it.', hi: 'इसकी चिंता मत करो।'),
      SpeakingSentence(en: 'It\'s a lovely day.', hi: 'आज का दिन बहुत अच्छा है।'),
      SpeakingSentence(en: 'She\'s my best friend.', hi: 'वह मेरी सबसे अच्छी दोस्त है।'),
      SpeakingSentence(en: 'We\'ll meet tomorrow.', hi: 'हम कल मिलेंगे।'),
    ],
  };

  static const Map<int, List<SpeakingSentence>> _byChapter = {
    // Ch 1 — Before We Start (alphabets, greetings, basics)
    1: [
      SpeakingSentence(en: 'Good morning.', hi: 'सुप्रभात।'),
      SpeakingSentence(en: 'My name is Rahul.', hi: 'मेरा नाम राहुल है।'),
      SpeakingSentence(en: 'Thank you very much.', hi: 'बहुत-बहुत धन्यवाद।'),
      SpeakingSentence(en: 'How are you?', hi: 'आप कैसे हैं?'),
      SpeakingSentence(en: 'Nice to meet you.', hi: 'आपसे मिलकर खुशी हुई।'),
      SpeakingSentence(en: 'Good night.', hi: 'शुभ रात्रि।'),
      SpeakingSentence(en: 'Please help me.', hi: 'कृपया मेरी मदद कीजिए।'),
      SpeakingSentence(en: 'Welcome to my home.', hi: 'मेरे घर में आपका स्वागत है।'),
      SpeakingSentence(
          en: 'I am fine, thank you.', hi: 'मैं ठीक हूँ, धन्यवाद।'),
      SpeakingSentence(en: 'See you later.', hi: 'बाद में मिलते हैं।'),
    ],
    // Ch 2 — Few Basics of English
    2: [
      SpeakingSentence(en: 'I am a student.', hi: 'मैं एक विद्यार्थी हूँ।'),
      SpeakingSentence(en: 'This is my book.', hi: 'यह मेरी किताब है।'),
      SpeakingSentence(en: 'She is my sister.', hi: 'वह मेरी बहन है।'),
      SpeakingSentence(en: 'We are happy.', hi: 'हम खुश हैं।'),
      SpeakingSentence(
          en: 'It is a beautiful day.', hi: 'यह एक सुंदर दिन है।'),
      SpeakingSentence(en: 'That is a big dog.', hi: 'वह एक बड़ा कुत्ता है।'),
      SpeakingSentence(en: 'You are my friend.', hi: 'तुम मेरे दोस्त हो।'),
      SpeakingSentence(en: 'The tea is hot.', hi: 'चाय गर्म है।'),
      SpeakingSentence(en: 'I am ready.', hi: 'मैं तैयार हूँ।'),
      SpeakingSentence(en: 'This is very easy.', hi: 'यह बहुत आसान है।'),
    ],
    // Ch 3 — Pronunciation
    3: [
      SpeakingSentence(en: 'Please speak slowly.', hi: 'कृपया धीरे बोलिए।'),
      SpeakingSentence(en: 'The water is cold.', hi: 'पानी ठंडा है।'),
      SpeakingSentence(
          en: 'I can hear you clearly.', hi: 'मैं आपको साफ़ सुन सकता हूँ।'),
      SpeakingSentence(en: 'Repeat after me.', hi: 'मेरे बाद दोहराइए।'),
      SpeakingSentence(
          en: 'The weather is pleasant.', hi: 'मौसम सुहावना है।'),
      SpeakingSentence(en: 'Say it again, please.', hi: 'कृपया इसे फिर से कहिए।'),
      SpeakingSentence(en: 'Listen and repeat.', hi: 'सुनिए और दोहराइए।'),
      SpeakingSentence(
          en: 'Speak a little louder.', hi: 'थोड़ा ज़ोर से बोलिए।'),
      SpeakingSentence(
          en: 'Your voice is very clear.', hi: 'आपकी आवाज़ बहुत साफ़ है।'),
      SpeakingSentence(
          en: 'I am practicing English.', hi: 'मैं अंग्रेज़ी का अभ्यास कर रहा हूँ।'),
    ],
    // Ch 4 — Vocabulary & Pronunciation
    4: [
      SpeakingSentence(
          en: 'I eat an apple every day.', hi: 'मैं रोज़ एक सेब खाता हूँ।'),
      SpeakingSentence(
          en: 'The sun rises in the east.', hi: 'सूरज पूर्व में उगता है।'),
      SpeakingSentence(
          en: 'My father is a teacher.', hi: 'मेरे पिता एक शिक्षक हैं।'),
      SpeakingSentence(
          en: 'I like the color blue.', hi: 'मुझे नीला रंग पसंद है।'),
      SpeakingSentence(
          en: 'Birds fly in the sky.', hi: 'पक्षी आकाश में उड़ते हैं।'),
      SpeakingSentence(
          en: 'The moon shines at night.', hi: 'चाँद रात में चमकता है।'),
      SpeakingSentence(
          en: 'I drink water after lunch.',
          hi: 'मैं दोपहर के खाने के बाद पानी पीता हूँ।'),
      SpeakingSentence(
          en: 'She has a green umbrella.', hi: 'उसके पास हरा छाता है।'),
      SpeakingSentence(
          en: 'We buy vegetables from the market.',
          hi: 'हम बाज़ार से सब्ज़ियाँ खरीदते हैं।'),
      SpeakingSentence(en: 'The train is very long.', hi: 'ट्रेन बहुत लंबी है।'),
    ],
    // Ch 5 — WH Family
    5: [
      SpeakingSentence(en: 'What is your name?', hi: 'आपका नाम क्या है?'),
      SpeakingSentence(en: 'Where do you live?', hi: 'आप कहाँ रहते हैं?'),
      SpeakingSentence(en: 'When do you wake up?', hi: 'आप कब उठते हैं?'),
      SpeakingSentence(en: 'Why are you late?', hi: 'आप देर से क्यों आए?'),
      SpeakingSentence(
          en: 'Who is your best friend?', hi: 'आपका सबसे अच्छा दोस्त कौन है?'),
      SpeakingSentence(en: 'How old are you?', hi: 'आपकी उम्र कितनी है?'),
      SpeakingSentence(
          en: 'Which color do you like?', hi: 'आपको कौन-सा रंग पसंद है?'),
      SpeakingSentence(en: 'Whose bag is this?', hi: 'यह बैग किसका है?'),
      SpeakingSentence(
          en: 'How much is this shirt?', hi: 'यह शर्ट कितने की है?'),
      SpeakingSentence(en: 'What time is it now?', hi: 'अभी क्या समय हुआ है?'),
    ],
    // Ch 6 — Parts of Speech
    6: [
      SpeakingSentence(en: 'Ram plays football.', hi: 'राम फुटबॉल खेलता है।'),
      SpeakingSentence(
          en: 'The cat sleeps on the sofa.', hi: 'बिल्ली सोफ़े पर सोती है।'),
      SpeakingSentence(en: 'She sings very well.', hi: 'वह बहुत अच्छा गाती है।'),
      SpeakingSentence(en: 'Delhi is a big city.', hi: 'दिल्ली एक बड़ा शहर है।'),
      SpeakingSentence(en: 'He runs fast.', hi: 'वह तेज़ दौड़ता है।'),
      SpeakingSentence(en: 'The dog barks loudly.', hi: 'कुत्ता ज़ोर से भौंकता है।'),
      SpeakingSentence(
          en: 'My sister dances well.', hi: 'मेरी बहन अच्छा नाचती है।'),
      SpeakingSentence(
          en: 'The boys play in the ground.', hi: 'लड़के मैदान में खेलते हैं।'),
      SpeakingSentence(
          en: 'The bird sings in the morning.', hi: 'पक्षी सुबह गाता है।'),
      SpeakingSentence(en: 'The baby sleeps all day.', hi: 'बच्चा पूरे दिन सोता है।'),
    ],
    // Ch 7 — Noun
    7: [
      SpeakingSentence(en: 'India is my country.', hi: 'भारत मेरा देश है।'),
      SpeakingSentence(
          en: 'The teacher is in the class.', hi: 'शिक्षक कक्षा में हैं।'),
      SpeakingSentence(
          en: 'My mother makes tasty food.',
          hi: 'मेरी माँ स्वादिष्ट खाना बनाती हैं।'),
      SpeakingSentence(
          en: 'The children are playing.', hi: 'बच्चे खेल रहे हैं।'),
      SpeakingSentence(
          en: 'Honesty is the best policy.',
          hi: 'ईमानदारी सबसे अच्छी नीति है।'),
      SpeakingSentence(en: 'Mumbai is a busy city.', hi: 'मुंबई एक व्यस्त शहर है।'),
      SpeakingSentence(
          en: 'The doctor helps sick people.',
          hi: 'डॉक्टर बीमार लोगों की मदद करता है।'),
      SpeakingSentence(
          en: 'My school is near the river.', hi: 'मेरा स्कूल नदी के पास है।'),
      SpeakingSentence(
          en: 'The farmer works in the field.', hi: 'किसान खेत में काम करता है।'),
      SpeakingSentence(
          en: 'Water is important for life.',
          hi: 'पानी जीवन के लिए ज़रूरी है।'),
    ],
    // Ch 8 — Pronoun
    8: [
      SpeakingSentence(en: 'He is my brother.', hi: 'वह मेरा भाई है।'),
      SpeakingSentence(
          en: 'She loves her family.', hi: 'वह अपने परिवार से प्यार करती है।'),
      SpeakingSentence(
          en: 'They are going to school.', hi: 'वे स्कूल जा रहे हैं।'),
      SpeakingSentence(en: 'We live in Mumbai.', hi: 'हम मुंबई में रहते हैं।'),
      SpeakingSentence(
          en: 'It is raining outside.', hi: 'बाहर बारिश हो रही है।'),
      SpeakingSentence(en: 'This book is mine.', hi: 'यह किताब मेरी है।'),
      SpeakingSentence(en: 'That car is theirs.', hi: 'वह कार उनकी है।'),
      SpeakingSentence(en: 'I made it myself.', hi: 'मैंने इसे खुद बनाया।'),
      SpeakingSentence(en: 'Everyone likes her.', hi: 'हर कोई उसे पसंद करता है।'),
      SpeakingSentence(en: 'Nobody was at home.', hi: 'घर पर कोई नहीं था।'),
    ],
    // Ch 9 — Adjective
    9: [
      SpeakingSentence(en: 'She has a red dress.', hi: 'उसके पास लाल पोशाक है।'),
      SpeakingSentence(en: 'This mango is sweet.', hi: 'यह आम मीठा है।'),
      SpeakingSentence(en: 'He is a tall boy.', hi: 'वह एक लंबा लड़का है।'),
      SpeakingSentence(en: 'The exam was easy.', hi: 'परीक्षा आसान थी।'),
      SpeakingSentence(
          en: 'I have two small dogs.', hi: 'मेरे पास दो छोटे कुत्ते हैं।'),
      SpeakingSentence(en: 'The sky is clear today.', hi: 'आज आसमान साफ़ है।'),
      SpeakingSentence(en: 'This road is very long.', hi: 'यह सड़क बहुत लंबी है।'),
      SpeakingSentence(
          en: 'He bought an expensive phone.', hi: 'उसने महँगा फ़ोन खरीदा।'),
      SpeakingSentence(en: 'The soup is too salty.', hi: 'सूप बहुत नमकीन है।'),
      SpeakingSentence(
          en: 'She wore a beautiful saree.', hi: 'उसने सुंदर साड़ी पहनी।'),
    ],
    // Ch 10 — Verbs
    10: [
      SpeakingSentence(en: 'I read books daily.', hi: 'मैं रोज़ किताबें पढ़ता हूँ।'),
      SpeakingSentence(en: 'She writes a letter.', hi: 'वह एक पत्र लिखती है।'),
      SpeakingSentence(
          en: 'We play cricket on Sunday.', hi: 'हम रविवार को क्रिकेट खेलते हैं।'),
      SpeakingSentence(
          en: 'He drinks milk every morning.', hi: 'वह रोज़ सुबह दूध पीता है।'),
      SpeakingSentence(
          en: 'They watch television at night.', hi: 'वे रात में टीवी देखते हैं।'),
      SpeakingSentence(
          en: 'I wash my hands before eating.',
          hi: 'मैं खाने से पहले हाथ धोता हूँ।'),
      SpeakingSentence(
          en: 'He teaches maths in school.', hi: 'वह स्कूल में गणित पढ़ाता है।'),
      SpeakingSentence(
          en: 'The children draw pictures.', hi: 'बच्चे चित्र बनाते हैं।'),
      SpeakingSentence(
          en: 'We clean our house on Sunday.',
          hi: 'हम रविवार को अपना घर साफ़ करते हैं।'),
      SpeakingSentence(
          en: 'She waters the plants daily.', hi: 'वह रोज़ पौधों को पानी देती है।'),
    ],
    // Ch 11 — Adverbs
    11: [
      SpeakingSentence(en: 'He speaks softly.', hi: 'वह धीरे बोलता है।'),
      SpeakingSentence(en: 'She runs very fast.', hi: 'वह बहुत तेज़ दौड़ती है।'),
      SpeakingSentence(
          en: 'I always tell the truth.', hi: 'मैं हमेशा सच बोलता हूँ।'),
      SpeakingSentence(en: 'They arrived late.', hi: 'वे देर से पहुँचे।'),
      SpeakingSentence(en: 'Please listen carefully.', hi: 'कृपया ध्यान से सुनिए।'),
      SpeakingSentence(
          en: 'He drives very carefully.', hi: 'वह बहुत सावधानी से गाड़ी चलाता है।'),
      SpeakingSentence(en: 'She smiled happily.', hi: 'वह खुशी से मुस्कुराई।'),
      SpeakingSentence(
          en: 'They rarely eat outside.', hi: 'वे कभी-कभार ही बाहर खाते हैं।'),
      SpeakingSentence(
          en: 'I usually sleep early.', hi: 'मैं आमतौर पर जल्दी सोता हूँ।'),
      SpeakingSentence(
          en: 'He answered all questions correctly.',
          hi: 'उसने सभी प्रश्नों के सही उत्तर दिए।'),
    ],
    // Ch 12 — Interjection
    12: [
      SpeakingSentence(
          en: 'Wow! What a beautiful house!', hi: 'वाह! कितना सुंदर घर है!'),
      SpeakingSentence(
          en: 'Oh no! I missed the bus.', hi: 'अरे नहीं! मेरी बस छूट गई।'),
      SpeakingSentence(
          en: 'Hurray! We won the match.', hi: 'हुर्रे! हम मैच जीत गए।'),
      SpeakingSentence(
          en: 'Great! You did a good job.', hi: 'बहुत बढ़िया! आपने अच्छा काम किया।'),
      SpeakingSentence(en: 'Oh! I forgot my keys.', hi: 'ओह! मैं चाबियाँ भूल गया।'),
      SpeakingSentence(
          en: 'Oh dear! The glass broke.', hi: 'अरे! गिलास टूट गया।'),
      SpeakingSentence(
          en: 'Bravo! You played very well.', hi: 'शाबाश! तुमने बहुत अच्छा खेला।'),
      SpeakingSentence(en: 'Ouch! That really hurt.', hi: 'आह! सच में दर्द हुआ।'),
      SpeakingSentence(
          en: 'Wow! The view is amazing.', hi: 'वाह! नज़ारा कमाल का है।'),
      SpeakingSentence(
          en: 'Congratulations! You passed the exam.',
          hi: 'बधाई हो! आपने परीक्षा पास कर ली।'),
    ],
    // Ch 13 — Articles
    13: [
      SpeakingSentence(en: 'I saw an elephant.', hi: 'मैंने एक हाथी देखा।'),
      SpeakingSentence(en: 'She is a doctor.', hi: 'वह एक डॉक्टर है।'),
      SpeakingSentence(
          en: 'The moon is bright tonight.', hi: 'आज रात चाँद चमकीला है।'),
      SpeakingSentence(en: 'He ate an orange.', hi: 'उसने एक संतरा खाया।'),
      SpeakingSentence(
          en: 'This is the best day of my life.',
          hi: 'यह मेरी ज़िंदगी का सबसे अच्छा दिन है।'),
      SpeakingSentence(en: 'He is an engineer.', hi: 'वह एक इंजीनियर है।'),
      SpeakingSentence(
          en: 'I read a story at night.', hi: 'मैं रात में एक कहानी पढ़ता हूँ।'),
      SpeakingSentence(
          en: 'The earth moves around the sun.',
          hi: 'पृथ्वी सूरज के चारों ओर घूमती है।'),
      SpeakingSentence(en: 'She gave me an idea.', hi: 'उसने मुझे एक विचार दिया।'),
      SpeakingSentence(
          en: 'A dog is a faithful animal.', hi: 'कुत्ता एक वफ़ादार जानवर है।'),
    ],
    // Ch 14 — Prepositions
    14: [
      SpeakingSentence(
          en: 'The book is on the table.', hi: 'किताब मेज़ पर है।'),
      SpeakingSentence(
          en: 'He is sitting under the tree.', hi: 'वह पेड़ के नीचे बैठा है।'),
      SpeakingSentence(
          en: 'She lives near the market.', hi: 'वह बाज़ार के पास रहती है।'),
      SpeakingSentence(
          en: 'The cat is behind the door.', hi: 'बिल्ली दरवाज़े के पीछे है।'),
      SpeakingSentence(
          en: 'We will meet at five o\'clock.', hi: 'हम पाँच बजे मिलेंगे।'),
      SpeakingSentence(
          en: 'The train goes through the tunnel.',
          hi: 'ट्रेन सुरंग से होकर जाती है।'),
      SpeakingSentence(
          en: 'He jumped into the river.', hi: 'वह नदी में कूद गया।'),
      SpeakingSentence(
          en: 'She walked towards the door.', hi: 'वह दरवाज़े की ओर चली।'),
      SpeakingSentence(
          en: 'The gift is from my uncle.', hi: 'यह उपहार मेरे चाचा की ओर से है।'),
      SpeakingSentence(en: 'We waited for the bus.', hi: 'हमने बस का इंतज़ार किया।'),
    ],
    // Ch 15 — Determiners
    15: [
      SpeakingSentence(en: 'I have some money.', hi: 'मेरे पास कुछ पैसे हैं।'),
      SpeakingSentence(
          en: 'There are many students in the class.',
          hi: 'कक्षा में बहुत सारे विद्यार्थी हैं।'),
      SpeakingSentence(en: 'She has few friends.', hi: 'उसके कुछ ही दोस्त हैं।'),
      SpeakingSentence(en: 'Each child got a gift.', hi: 'हर बच्चे को उपहार मिला।'),
      SpeakingSentence(en: 'I drank a little water.', hi: 'मैंने थोड़ा पानी पिया।'),
      SpeakingSentence(en: 'I have enough time.', hi: 'मेरे पास काफ़ी समय है।'),
      SpeakingSentence(en: 'He ate all the rice.', hi: 'उसने सारे चावल खा लिए।'),
      SpeakingSentence(
          en: 'There is much noise outside.', hi: 'बाहर बहुत शोर है।'),
      SpeakingSentence(
          en: 'Both brothers are doctors.', hi: 'दोनों भाई डॉक्टर हैं।'),
      SpeakingSentence(
          en: 'Several people were waiting.', hi: 'कई लोग इंतज़ार कर रहे थे।'),
    ],
    // Ch 16 — Simple Sentences
    16: [
      SpeakingSentence(
          en: 'I go to school every day.', hi: 'मैं रोज़ स्कूल जाता हूँ।'),
      SpeakingSentence(en: 'She likes tea.', hi: 'उसे चाय पसंद है।'),
      SpeakingSentence(en: 'My house is very big.', hi: 'मेरा घर बहुत बड़ा है।'),
      SpeakingSentence(
          en: 'We watch movies on weekends.',
          hi: 'हम सप्ताहांत में फ़िल्में देखते हैं।'),
      SpeakingSentence(en: 'He works in a bank.', hi: 'वह बैंक में काम करता है।'),
      SpeakingSentence(en: 'The shop opens at nine.', hi: 'दुकान नौ बजे खुलती है।'),
      SpeakingSentence(
          en: 'I love my parents.', hi: 'मैं अपने माता-पिता से प्यार करता हूँ।'),
      SpeakingSentence(en: 'The phone is ringing.', hi: 'फ़ोन बज रहा है।'),
      SpeakingSentence(
          en: 'She speaks three languages.', hi: 'वह तीन भाषाएँ बोलती है।'),
      SpeakingSentence(
          en: 'We live in a small town.', hi: 'हम एक छोटे शहर में रहते हैं।'),
    ],
    // Ch 17 — There
    17: [
      SpeakingSentence(
          en: 'There is a temple near my house.',
          hi: 'मेरे घर के पास एक मंदिर है।'),
      SpeakingSentence(
          en: 'There are five members in my family.',
          hi: 'मेरे परिवार में पाँच सदस्य हैं।'),
      SpeakingSentence(
          en: 'There was a big tree here.', hi: 'यहाँ एक बड़ा पेड़ था।'),
      SpeakingSentence(
          en: 'There is no milk in the fridge.', hi: 'फ्रिज में दूध नहीं है।'),
      SpeakingSentence(
          en: 'There are many stars in the sky.',
          hi: 'आकाश में बहुत सारे तारे हैं।'),
      SpeakingSentence(
          en: 'There is a problem with my phone.',
          hi: 'मेरे फ़ोन में कोई समस्या है।'),
      SpeakingSentence(
          en: 'There are two banks in this street.',
          hi: 'इस गली में दो बैंक हैं।'),
      SpeakingSentence(
          en: 'There was heavy rain last night.',
          hi: 'कल रात भारी बारिश हुई थी।'),
      SpeakingSentence(
          en: 'There is someone at the door.', hi: 'दरवाज़े पर कोई है।'),
      SpeakingSentence(
          en: 'There were many people at the fair.',
          hi: 'मेले में बहुत लोग थे।'),
    ],
    // Ch 18 — Position Sense
    18: [
      SpeakingSentence(
          en: 'The fan is above the table.', hi: 'पंखा मेज़ के ऊपर है।'),
      SpeakingSentence(
          en: 'My shoes are under the bed.', hi: 'मेरे जूते बिस्तर के नीचे हैं।'),
      SpeakingSentence(
          en: 'The shop is in front of the school.',
          hi: 'दुकान स्कूल के सामने है।'),
      SpeakingSentence(
          en: 'The garden is behind the house.', hi: 'बगीचा घर के पीछे है।'),
      SpeakingSentence(
          en: 'The keys are inside the drawer.', hi: 'चाबियाँ दराज़ के अंदर हैं।'),
      SpeakingSentence(en: 'The bird is on the roof.', hi: 'पक्षी छत पर है।'),
      SpeakingSentence(
          en: 'The bag is between the chairs.', hi: 'बैग कुर्सियों के बीच में है।'),
      SpeakingSentence(
          en: 'The bank is opposite the park.', hi: 'बैंक पार्क के सामने है।'),
      SpeakingSentence(
          en: 'My office is on the second floor.',
          hi: 'मेरा दफ़्तर दूसरी मंज़िल पर है।'),
      SpeakingSentence(
          en: 'The ball rolled under the car.', hi: 'गेंद कार के नीचे लुढ़क गई।'),
    ],
    // Ch 19 — Tense
    19: [
      SpeakingSentence(
          en: 'I am learning English.', hi: 'मैं अंग्रेज़ी सीख रहा हूँ।'),
      SpeakingSentence(
          en: 'She went to the market yesterday.', hi: 'वह कल बाज़ार गई थी।'),
      SpeakingSentence(
          en: 'We will travel to Delhi tomorrow.', hi: 'हम कल दिल्ली जाएँगे।'),
      SpeakingSentence(
          en: 'He has finished his work.', hi: 'उसने अपना काम पूरा कर लिया है।'),
      SpeakingSentence(
          en: 'They were playing in the park.', hi: 'वे पार्क में खेल रहे थे।'),
      SpeakingSentence(
          en: 'I have seen this movie.', hi: 'मैंने यह फ़िल्म देखी है।'),
      SpeakingSentence(
          en: 'She is cooking dinner now.', hi: 'वह अभी रात का खाना बना रही है।'),
      SpeakingSentence(
          en: 'They had left before sunrise.',
          hi: 'वे सूर्योदय से पहले निकल चुके थे।'),
      SpeakingSentence(
          en: 'We have been waiting for an hour.',
          hi: 'हम एक घंटे से इंतज़ार कर रहे हैं।'),
      SpeakingSentence(
          en: 'He will have finished by evening.',
          hi: 'वह शाम तक काम पूरा कर चुका होगा।'),
    ],
    // Ch 20 — It
    20: [
      SpeakingSentence(en: 'It is very hot today.', hi: 'आज बहुत गर्मी है।'),
      SpeakingSentence(en: 'It is ten o\'clock.', hi: 'दस बज गए हैं।'),
      SpeakingSentence(en: 'It is raining heavily.', hi: 'ज़ोर से बारिश हो रही है।'),
      SpeakingSentence(
          en: 'It is important to learn English.',
          hi: 'अंग्रेज़ी सीखना ज़रूरी है।'),
      SpeakingSentence(en: 'It was a wonderful trip.', hi: 'वह एक शानदार यात्रा थी।'),
      SpeakingSentence(en: 'It is Monday today.', hi: 'आज सोमवार है।'),
      SpeakingSentence(en: 'It is far from here.', hi: 'यह यहाँ से दूर है।'),
      SpeakingSentence(en: 'It looks like rain.', hi: 'लगता है बारिश होगी।'),
      SpeakingSentence(
          en: 'It takes two hours by bus.', hi: 'बस से दो घंटे लगते हैं।'),
      SpeakingSentence(
          en: 'It feels good to help others.',
          hi: 'दूसरों की मदद करके अच्छा लगता है।'),
    ],
    // Ch 21 — Modals
    21: [
      SpeakingSentence(
          en: 'I can swim very well.', hi: 'मैं बहुत अच्छा तैर सकता हूँ।'),
      SpeakingSentence(
          en: 'You should eat healthy food.',
          hi: 'आपको पौष्टिक खाना खाना चाहिए।'),
      SpeakingSentence(
          en: 'We must respect our elders.',
          hi: 'हमें बड़ों का सम्मान करना चाहिए।'),
      SpeakingSentence(en: 'May I come in?', hi: 'क्या मैं अंदर आ सकता हूँ?'),
      SpeakingSentence(en: 'He might come tomorrow.', hi: 'वह शायद कल आए।'),
      SpeakingSentence(
          en: 'You must wear a helmet.', hi: 'आपको हेलमेट पहनना ही चाहिए।'),
      SpeakingSentence(
          en: 'She could read at the age of four.',
          hi: 'वह चार साल की उम्र में पढ़ सकती थी।'),
      SpeakingSentence(
          en: 'We should not waste water.',
          hi: 'हमें पानी बर्बाद नहीं करना चाहिए।'),
      SpeakingSentence(en: 'You may use my pen.', hi: 'आप मेरा पेन इस्तेमाल कर सकते हैं।'),
      SpeakingSentence(en: 'I would like some coffee.', hi: 'मुझे थोड़ी कॉफ़ी चाहिए।'),
    ],
    // Ch 22 — Conjunctions
    22: [
      SpeakingSentence(
          en: 'I like tea and coffee.', hi: 'मुझे चाय और कॉफ़ी पसंद है।'),
      SpeakingSentence(en: 'He is poor but honest.', hi: 'वह गरीब है पर ईमानदार है।'),
      SpeakingSentence(
          en: 'Work hard or you will fail.',
          hi: 'मेहनत करो वरना असफल हो जाओगे।'),
      SpeakingSentence(
          en: 'She was tired because she worked all day.',
          hi: 'वह थकी थी क्योंकि उसने पूरा दिन काम किया।'),
      SpeakingSentence(
          en: 'Although it was raining, we went out.',
          hi: 'हालाँकि बारिश हो रही थी, हम बाहर गए।'),
      SpeakingSentence(
          en: 'Neither Ram nor Shyam came.', hi: 'न राम आया न श्याम।'),
      SpeakingSentence(
          en: 'He is not only smart but also kind.',
          hi: 'वह न सिर्फ़ होशियार है बल्कि दयालु भी है।'),
      SpeakingSentence(
          en: 'Wait here until I return.',
          hi: 'जब तक मैं न लौटूँ यहीं रुको।'),
      SpeakingSentence(
          en: 'As soon as he came, we left.', hi: 'जैसे ही वह आया, हम निकल गए।'),
      SpeakingSentence(
          en: 'Either take it or leave it.', hi: 'या तो इसे लो या छोड़ दो।'),
    ],
    // Ch 23 — Imperative Sentences
    23: [
      SpeakingSentence(en: 'Please close the door.', hi: 'कृपया दरवाज़ा बंद करें।'),
      SpeakingSentence(en: 'Open your books.', hi: 'अपनी किताबें खोलिए।'),
      SpeakingSentence(en: 'Do not make noise.', hi: 'शोर मत करो।'),
      SpeakingSentence(en: 'Sit down quietly.', hi: 'चुपचाप बैठ जाओ।'),
      SpeakingSentence(
          en: 'Bring me a glass of water.', hi: 'मुझे एक गिलास पानी लाकर दो।'),
      SpeakingSentence(
          en: 'Please wait for a moment.', hi: 'कृपया एक पल रुकिए।'),
      SpeakingSentence(
          en: 'Turn left at the corner.', hi: 'कोने से बाएँ मुड़िए।'),
      SpeakingSentence(
          en: 'Speak politely to everyone.', hi: 'सबसे विनम्रता से बात करो।'),
      SpeakingSentence(en: 'Do your homework first.', hi: 'पहले अपना गृहकार्य करो।'),
      SpeakingSentence(en: 'Never tell a lie.', hi: 'कभी झूठ मत बोलो।'),
    ],
    // Ch 24 — Let
    24: [
      SpeakingSentence(en: 'Let me help you.', hi: 'मुझे आपकी मदद करने दीजिए।'),
      SpeakingSentence(en: 'Let us go to the park.', hi: 'चलो पार्क चलते हैं।'),
      SpeakingSentence(en: 'Let him speak first.', hi: 'पहले उसे बोलने दो।'),
      SpeakingSentence(
          en: 'Let her sleep for some time.', hi: 'उसे कुछ देर सोने दो।'),
      SpeakingSentence(
          en: 'Let the children play outside.', hi: 'बच्चों को बाहर खेलने दो।'),
      SpeakingSentence(en: 'Let us start the class.', hi: 'चलो कक्षा शुरू करते हैं।'),
      SpeakingSentence(
          en: 'Let me see your notebook.', hi: 'मुझे अपनी कॉपी दिखाओ।'),
      SpeakingSentence(
          en: 'Let them decide themselves.', hi: 'उन्हें खुद फ़ैसला करने दो।'),
      SpeakingSentence(
          en: 'Do not let the dog out.', hi: 'कुत्ते को बाहर मत जाने दो।'),
      SpeakingSentence(en: 'Let it be.', hi: 'रहने दो।'),
    ],
    // Ch 25 — Causative Verbs (Get & Make)
    25: [
      SpeakingSentence(en: 'I got my hair cut.', hi: 'मैंने अपने बाल कटवाए।'),
      SpeakingSentence(en: 'She made me laugh.', hi: 'उसने मुझे हँसाया।'),
      SpeakingSentence(
          en: 'He got his car repaired.', hi: 'उसने अपनी कार ठीक करवाई।'),
      SpeakingSentence(
          en: 'The teacher made us write an essay.',
          hi: 'शिक्षक ने हमसे निबंध लिखवाया।'),
      SpeakingSentence(
          en: 'I will get this work done today.',
          hi: 'मैं यह काम आज करवा लूँगा।'),
      SpeakingSentence(
          en: 'She got the room cleaned.', hi: 'उसने कमरा साफ़ करवाया।'),
      SpeakingSentence(en: 'I made him understand.', hi: 'मैंने उसे समझाया।'),
      SpeakingSentence(
          en: 'We got the invitations printed.',
          hi: 'हमने निमंत्रण पत्र छपवाए।'),
      SpeakingSentence(en: 'He made her cry.', hi: 'उसने उसे रुला दिया।'),
      SpeakingSentence(en: 'Get your eyes checked.', hi: 'अपनी आँखें जँचवाओ।'),
    ],
    // Ch 26 — Active & Passive Voice
    26: [
      SpeakingSentence(
          en: 'The letter was written by Ram.', hi: 'पत्र राम द्वारा लिखा गया।'),
      SpeakingSentence(en: 'Rice is grown in India.', hi: 'चावल भारत में उगाया जाता है।'),
      SpeakingSentence(
          en: 'English is spoken all over the world.',
          hi: 'अंग्रेज़ी पूरी दुनिया में बोली जाती है।'),
      SpeakingSentence(
          en: 'The window was broken by the boys.',
          hi: 'खिड़की लड़कों द्वारा तोड़ी गई।'),
      SpeakingSentence(
          en: 'The homework has been completed.', hi: 'गृहकार्य पूरा हो चुका है।'),
      SpeakingSentence(
          en: 'The thief was caught by the police.',
          hi: 'चोर पुलिस द्वारा पकड़ा गया।'),
      SpeakingSentence(
          en: 'This song was sung by Lata.', hi: 'यह गीत लता ने गाया था।'),
      SpeakingSentence(
          en: 'The bridge is being built.', hi: 'पुल बनाया जा रहा है।'),
      SpeakingSentence(
          en: 'My bike was stolen yesterday.', hi: 'मेरी बाइक कल चोरी हो गई।'),
      SpeakingSentence(en: 'Dinner is served at nine.', hi: 'रात का खाना नौ बजे परोसा जाता है।'),
    ],
    // Ch 27 — Special Cases
    27: [
      SpeakingSentence(en: 'I wish I could fly.', hi: 'काश मैं उड़ सकता।'),
      SpeakingSentence(en: 'It is time to sleep.', hi: 'सोने का समय हो गया है।'),
      SpeakingSentence(en: 'She is about to leave.', hi: 'वह जाने ही वाली है।'),
      SpeakingSentence(
          en: 'I would rather stay home.', hi: 'मैं घर पर ही रहना पसंद करूँगा।'),
      SpeakingSentence(
          en: 'He is used to waking up early.',
          hi: 'उसे जल्दी उठने की आदत है।'),
      SpeakingSentence(en: 'It is no use crying now.', hi: 'अब रोने का कोई फ़ायदा नहीं।'),
      SpeakingSentence(
          en: 'I cannot help laughing.', hi: 'मैं हँसे बिना नहीं रह सकता।'),
      SpeakingSentence(
          en: 'He is too weak to walk.',
          hi: 'वह इतना कमज़ोर है कि चल नहीं सकता।'),
      SpeakingSentence(
          en: 'She is so kind that everyone loves her.',
          hi: 'वह इतनी दयालु है कि सब उसे प्यार करते हैं।'),
      SpeakingSentence(
          en: 'I look forward to meeting you.',
          hi: 'मुझे आपसे मिलने का इंतज़ार है।'),
    ],
    // Ch 28 — Fillers
    28: [
      SpeakingSentence(
          en: 'Well, let me think about it.', hi: 'अच्छा, मुझे इसके बारे में सोचने दो।'),
      SpeakingSentence(
          en: 'You know, he is my old friend.',
          hi: 'पता है, वह मेरा पुराना दोस्त है।'),
      SpeakingSentence(
          en: 'Actually, I forgot my keys.', hi: 'असल में, मैं अपनी चाबियाँ भूल गया।'),
      SpeakingSentence(
          en: 'By the way, how is your family?',
          hi: 'वैसे, आपका परिवार कैसा है?'),
      SpeakingSentence(
          en: 'I mean, it was not my fault.', hi: 'मेरा मतलब है, यह मेरी गलती नहीं थी।'),
      SpeakingSentence(
          en: 'So, what do you think?', hi: 'तो, आपका क्या विचार है?'),
      SpeakingSentence(
          en: 'Anyway, let us move on.', hi: 'खैर, आगे बढ़ते हैं।'),
      SpeakingSentence(
          en: 'Look, I was just trying to help.',
          hi: 'देखो, मैं बस मदद करने की कोशिश कर रहा था।'),
      SpeakingSentence(
          en: 'Basically, it is very simple.', hi: 'मूल रूप से, यह बहुत आसान है।'),
      SpeakingSentence(en: 'Right, let us begin.', hi: 'ठीक है, शुरू करते हैं।'),
    ],
    // Ch 29 — Question Tags
    29: [
      SpeakingSentence(
          en: 'You are coming, aren\'t you?', hi: 'तुम आ रहे हो, है ना?'),
      SpeakingSentence(
          en: 'He likes cricket, doesn\'t he?', hi: 'उसे क्रिकेट पसंद है, है ना?'),
      SpeakingSentence(
          en: 'She can sing, can\'t she?', hi: 'वह गा सकती है, है ना?'),
      SpeakingSentence(
          en: 'It is cold today, isn\'t it?', hi: 'आज ठंड है, है ना?'),
      SpeakingSentence(
          en: 'They went home, didn\'t they?', hi: 'वे घर चले गए, है ना?'),
      SpeakingSentence(
          en: 'You will help me, won\'t you?', hi: 'तुम मेरी मदद करोगे, है ना?'),
      SpeakingSentence(en: 'We are late, aren\'t we?', hi: 'हम लेट हो गए, है ना?'),
      SpeakingSentence(
          en: 'He does not smoke, does he?',
          hi: 'वह सिगरेट नहीं पीता, पीता है क्या?'),
      SpeakingSentence(
          en: 'She was there, wasn\'t she?', hi: 'वह वहाँ थी, है ना?'),
      SpeakingSentence(en: 'Let us go, shall we?', hi: 'चलें, क्या?'),
    ],
    // Ch 30 — Phrasal Verbs
    30: [
      SpeakingSentence(
          en: 'Please turn off the light.', hi: 'कृपया बत्ती बंद कर दो।'),
      SpeakingSentence(en: 'He woke up late today.', hi: 'वह आज देर से उठा।'),
      SpeakingSentence(
          en: 'She is looking for her keys.', hi: 'वह अपनी चाबियाँ ढूँढ रही है।'),
      SpeakingSentence(
          en: 'Do not give up your dreams.', hi: 'अपने सपने मत छोड़ो।'),
      SpeakingSentence(
          en: 'I will pick you up at six.', hi: 'मैं तुम्हें छह बजे लेने आऊँगा।'),
      SpeakingSentence(en: 'Please put on your shoes.', hi: 'कृपया अपने जूते पहनो।'),
      SpeakingSentence(
          en: 'The plane took off on time.', hi: 'विमान समय पर उड़ा।'),
      SpeakingSentence(
          en: 'He turned down my offer.', hi: 'उसने मेरा प्रस्ताव ठुकरा दिया।'),
      SpeakingSentence(
          en: 'I ran into an old friend.', hi: 'मैं एक पुराने दोस्त से टकरा गया।'),
      SpeakingSentence(
          en: 'She takes after her mother.', hi: 'वह अपनी माँ पर गई है।'),
    ],
    // Ch 31 — Prepositional Phrases
    31: [
      SpeakingSentence(
          en: 'The match was cancelled because of rain.',
          hi: 'बारिश के कारण मैच रद्द हो गया।'),
      SpeakingSentence(
          en: 'In spite of the traffic, we reached on time.',
          hi: 'ट्रैफ़िक के बावजूद हम समय पर पहुँचे।'),
      SpeakingSentence(
          en: 'She stood in front of the mirror.',
          hi: 'वह आईने के सामने खड़ी थी।'),
      SpeakingSentence(
          en: 'According to the news, it will rain today.',
          hi: 'ख़बरों के अनुसार आज बारिश होगी।'),
      SpeakingSentence(
          en: 'He succeeded by means of hard work.',
          hi: 'वह कड़ी मेहनत के बल पर सफल हुआ।'),
      SpeakingSentence(
          en: 'He passed the exam with the help of his teacher.',
          hi: 'उसने अपने शिक्षक की मदद से परीक्षा पास की।'),
      SpeakingSentence(
          en: 'In case of fire, call this number.',
          hi: 'आग लगने पर इस नंबर पर फ़ोन करें।'),
      SpeakingSentence(
          en: 'She succeeded because of her efforts.',
          hi: 'वह अपने प्रयासों के कारण सफल हुई।'),
      SpeakingSentence(
          en: 'The shop is next to the bank.', hi: 'दुकान बैंक के बगल में है।'),
      SpeakingSentence(
          en: 'We stayed home due to the storm.',
          hi: 'तूफ़ान के कारण हम घर पर रहे।'),
    ],
    // Ch 32 — Confusing Similar Words
    32: [
      SpeakingSentence(en: 'I accept your advice.', hi: 'मैं आपकी सलाह मानता हूँ।'),
      SpeakingSentence(
          en: 'The weather affects my mood.',
          hi: 'मौसम मेरे मूड को प्रभावित करता है।'),
      SpeakingSentence(
          en: 'She is quite quiet today.', hi: 'वह आज काफ़ी शांत है।'),
      SpeakingSentence(
          en: 'Their house is over there.', hi: 'उनका घर वहाँ है।'),
      SpeakingSentence(en: 'You are taller than me.', hi: 'तुम मुझसे लंबे हो।'),
      SpeakingSentence(
          en: 'The medicine had no effect.', hi: 'दवा का कोई असर नहीं हुआ।'),
      SpeakingSentence(
          en: 'I lost the game but learned a lot.',
          hi: 'मैं खेल हार गया पर बहुत कुछ सीखा।'),
      SpeakingSentence(en: 'He gave me good advice.', hi: 'उसने मुझे अच्छी सलाह दी।'),
      SpeakingSentence(
          en: 'Can you lend me your book?',
          hi: 'क्या तुम मुझे अपनी किताब उधार दे सकते हो?'),
      SpeakingSentence(en: 'The dessert was delicious.', hi: 'मिठाई स्वादिष्ट थी।'),
    ],
    // Ch 33 — One Word Substitutions
    33: [
      SpeakingSentence(en: 'He is an honest man.', hi: 'वह एक ईमानदार आदमी है।'),
      SpeakingSentence(
          en: 'My grandfather is very wise.', hi: 'मेरे दादाजी बहुत बुद्धिमान हैं।'),
      SpeakingSentence(
          en: 'She is a famous writer.', hi: 'वह एक प्रसिद्ध लेखिका है।'),
      SpeakingSentence(
          en: 'This medicine is very effective.', hi: 'यह दवा बहुत असरदार है।'),
      SpeakingSentence(en: 'He is a brave soldier.', hi: 'वह एक बहादुर सिपाही है।'),
      SpeakingSentence(
          en: 'He is a man of few words.', hi: 'वह कम बोलने वाला आदमी है।'),
      SpeakingSentence(
          en: 'She works hard day and night.', hi: 'वह दिन-रात मेहनत करती है।'),
      SpeakingSentence(
          en: 'The story is unbelievable.', hi: 'कहानी अविश्वसनीय है।'),
      SpeakingSentence(
          en: 'He returned the money immediately.',
          hi: 'उसने तुरंत पैसे लौटा दिए।'),
      SpeakingSentence(
          en: 'My uncle is a generous person.', hi: 'मेरे चाचा उदार व्यक्ति हैं।'),
    ],
    // Ch 34 — Special & Complex Sentences
    34: [
      SpeakingSentence(
          en: 'The man who lives next door is a doctor.',
          hi: 'जो आदमी बगल में रहता है वह डॉक्टर है।'),
      SpeakingSentence(
          en: 'I know that you are right.', hi: 'मैं जानता हूँ कि तुम सही हो।'),
      SpeakingSentence(
          en: 'If it rains, we will stay home.',
          hi: 'अगर बारिश हुई तो हम घर पर रहेंगे।'),
      SpeakingSentence(
          en: 'This is the house where I was born.',
          hi: 'यह वह घर है जहाँ मैं पैदा हुआ था।'),
      SpeakingSentence(
          en: 'She asked me what I wanted.',
          hi: 'उसने मुझसे पूछा कि मुझे क्या चाहिए।'),
      SpeakingSentence(
          en: 'The girl who won the prize is my cousin.',
          hi: 'जिस लड़की ने इनाम जीता वह मेरी चचेरी बहन है।'),
      SpeakingSentence(
          en: 'I believe that hard work pays.',
          hi: 'मेरा मानना है कि मेहनत रंग लाती है।'),
      SpeakingSentence(
          en: 'Unless you try, you will not learn.',
          hi: 'जब तक कोशिश नहीं करोगे, सीखोगे नहीं।'),
      SpeakingSentence(
          en: 'The day when we met was special.',
          hi: 'जिस दिन हम मिले वह दिन ख़ास था।'),
      SpeakingSentence(
          en: 'Whatever happens, stay calm.', hi: 'जो भी हो, शांत रहो।'),
    ],
    // Ch 35 — Extensive Translation
    35: [
      SpeakingSentence(
          en: 'My village is very beautiful.', hi: 'मेरा गाँव बहुत सुंदर है।'),
      SpeakingSentence(
          en: 'I want to become a good person.',
          hi: 'मैं एक अच्छा इंसान बनना चाहता हूँ।'),
      SpeakingSentence(
          en: 'Education is the key to success.',
          hi: 'शिक्षा सफलता की कुंजी है।'),
      SpeakingSentence(
          en: 'Hard work always pays off.', hi: 'मेहनत हमेशा रंग लाती है।'),
      SpeakingSentence(
          en: 'We should help the poor.', hi: 'हमें गरीबों की मदद करनी चाहिए।'),
      SpeakingSentence(
          en: 'Our country is famous for its culture.',
          hi: 'हमारा देश अपनी संस्कृति के लिए प्रसिद्ध है।'),
      SpeakingSentence(
          en: 'Everyone should respect women.',
          hi: 'सभी को महिलाओं का सम्मान करना चाहिए।'),
      SpeakingSentence(
          en: 'Farmers feed the whole nation.',
          hi: 'किसान पूरे देश का पेट भरते हैं।'),
      SpeakingSentence(
          en: 'Trees are our best friends.', hi: 'पेड़ हमारे सबसे अच्छे मित्र हैं।'),
      SpeakingSentence(
          en: 'We should always speak the truth.',
          hi: 'हमें हमेशा सच बोलना चाहिए।'),
    ],
    // Ch 36 — Objective Exercises
    36: [
      SpeakingSentence(
          en: 'Practice makes a man perfect.',
          hi: 'अभ्यास इंसान को परिपूर्ण बनाता है।'),
      SpeakingSentence(en: 'Knowledge is power.', hi: 'ज्ञान ही शक्ति है।'),
      SpeakingSentence(en: 'Time is very precious.', hi: 'समय बहुत कीमती है।'),
      SpeakingSentence(en: 'Health is wealth.', hi: 'स्वास्थ्य ही धन है।'),
      SpeakingSentence(
          en: 'Slow and steady wins the race.',
          hi: 'धीरे और लगातार चलने वाला ही जीतता है।'),
      SpeakingSentence(
          en: 'Choose the correct answer.', hi: 'सही उत्तर चुनिए।'),
      SpeakingSentence(
          en: 'Fill in the blanks carefully.',
          hi: 'खाली स्थान ध्यान से भरिए।'),
      SpeakingSentence(
          en: 'Read the question twice.', hi: 'प्रश्न को दो बार पढ़िए।'),
      SpeakingSentence(
          en: 'Do not guess the answers.', hi: 'उत्तरों का अंदाज़ा मत लगाओ।'),
      SpeakingSentence(
          en: 'Check your paper before submitting.',
          hi: 'जमा करने से पहले अपना पेपर जाँच लो।'),
    ],
    // Ch 37 — Sentence Correction
    37: [
      SpeakingSentence(
          en: 'He goes to school every day.', hi: 'वह रोज़ स्कूल जाता है।'),
      SpeakingSentence(
          en: 'She does not like cold coffee.',
          hi: 'उसे ठंडी कॉफ़ी पसंद नहीं है।'),
      SpeakingSentence(
          en: 'I have been living here for ten years.',
          hi: 'मैं यहाँ दस साल से रह रहा हूँ।'),
      SpeakingSentence(
          en: 'One of my friends is a doctor.',
          hi: 'मेरे दोस्तों में से एक डॉक्टर है।'),
      SpeakingSentence(
          en: 'Neither of them was present.',
          hi: 'उन दोनों में से कोई भी मौजूद नहीं था।'),
      SpeakingSentence(
          en: 'She has gone to the market.', hi: 'वह बाज़ार गई है।'),
      SpeakingSentence(en: 'He did not come yesterday.', hi: 'वह कल नहीं आया।'),
      SpeakingSentence(
          en: 'Each of the boys has a bag.', hi: 'हर लड़के के पास एक बैग है।'),
      SpeakingSentence(en: 'The news is very good.', hi: 'ख़बर बहुत अच्छी है।'),
      SpeakingSentence(
          en: 'Mathematics is my favorite subject.',
          hi: 'गणित मेरा पसंदीदा विषय है।'),
    ],
    // Ch 38 — Mixed Practice
    38: [
      SpeakingSentence(
          en: 'I have two brothers and one sister.',
          hi: 'मेरे दो भाई और एक बहन है।'),
      SpeakingSentence(
          en: 'My favorite subject is English.',
          hi: 'मेरा पसंदीदा विषय अंग्रेज़ी है।'),
      SpeakingSentence(
          en: 'We celebrated the festival with joy.',
          hi: 'हमने त्योहार खुशी से मनाया।'),
      SpeakingSentence(
          en: 'The train arrives at nine o\'clock.', hi: 'ट्रेन नौ बजे आती है।'),
      SpeakingSentence(
          en: 'Reading books is my hobby.', hi: 'किताबें पढ़ना मेरा शौक है।'),
      SpeakingSentence(
          en: 'I take a bath every morning.', hi: 'मैं रोज़ सुबह नहाता हूँ।'),
      SpeakingSentence(
          en: 'We went to a wedding last week.',
          hi: 'हम पिछले हफ़्ते एक शादी में गए।'),
      SpeakingSentence(
          en: 'My exam starts next Monday.',
          hi: 'मेरी परीक्षा अगले सोमवार से शुरू होगी।'),
      SpeakingSentence(
          en: 'He plays the guitar very well.', hi: 'वह बहुत अच्छा गिटार बजाता है।'),
      SpeakingSentence(
          en: 'The market remains closed on Tuesday.',
          hi: 'बाज़ार मंगलवार को बंद रहता है।'),
    ],
    // Ch 39 — Mixed Test Papers
    39: [
      SpeakingSentence(
          en: 'India became independent in 1947.',
          hi: 'भारत 1947 में आज़ाद हुआ।'),
      SpeakingSentence(
          en: 'The Ganga is a holy river.', hi: 'गंगा एक पवित्र नदी है।'),
      SpeakingSentence(
          en: 'Children should play outdoor games.',
          hi: 'बच्चों को बाहर के खेल खेलने चाहिए।'),
      SpeakingSentence(
          en: 'We must protect our environment.',
          hi: 'हमें अपने पर्यावरण की रक्षा करनी चाहिए।'),
      SpeakingSentence(
          en: 'Cleanliness is next to godliness.',
          hi: 'स्वच्छता में ही ईश्वर का वास है।'),
      SpeakingSentence(
          en: 'Delhi is the capital of India.', hi: 'दिल्ली भारत की राजधानी है।'),
      SpeakingSentence(
          en: 'The sun gives us light and heat.',
          hi: 'सूरज हमें रोशनी और गर्मी देता है।'),
      SpeakingSentence(
          en: 'We should obey traffic rules.',
          hi: 'हमें यातायात के नियमों का पालन करना चाहिए।'),
      SpeakingSentence(en: 'Yoga keeps us healthy.', hi: 'योग हमें स्वस्थ रखता है।'),
      SpeakingSentence(
          en: 'Books are our true friends.', hi: 'किताबें हमारी सच्ची मित्र हैं।'),
    ],
    // Ch 40 — Translation Exercises
    40: [
      SpeakingSentence(
          en: 'My mother cooks delicious food.',
          hi: 'मेरी माँ स्वादिष्ट खाना बनाती हैं।'),
      SpeakingSentence(
          en: 'I go for a walk every morning.', hi: 'मैं रोज़ सुबह सैर पर जाता हूँ।'),
      SpeakingSentence(
          en: 'He is the best student in the class.',
          hi: 'वह कक्षा का सबसे अच्छा विद्यार्थी है।'),
      SpeakingSentence(
          en: 'We visited the Taj Mahal last year.',
          hi: 'हम पिछले साल ताजमहल देखने गए।'),
      SpeakingSentence(
          en: 'Honesty always wins in the end.',
          hi: 'अंत में जीत हमेशा ईमानदारी की होती है।'),
      SpeakingSentence(
          en: 'My brother works in a hospital.',
          hi: 'मेरा भाई अस्पताल में काम करता है।'),
      SpeakingSentence(
          en: 'The festival of Diwali brings happiness.',
          hi: 'दिवाली का त्योहार खुशियाँ लाता है।'),
      SpeakingSentence(
          en: 'I met my teacher in the market.',
          hi: 'मैं बाज़ार में अपने शिक्षक से मिला।'),
      SpeakingSentence(
          en: 'The garden is full of flowers.', hi: 'बगीचा फूलों से भरा है।'),
      SpeakingSentence(
          en: 'Our team won the final match.',
          hi: 'हमारी टीम ने फ़ाइनल मैच जीता।'),
    ],
    // Ch 41 — Written Conversations
    41: [
      SpeakingSentence(
          en: 'Hello, how can I help you?',
          hi: 'नमस्ते, मैं आपकी क्या मदद कर सकता हूँ?'),
      SpeakingSentence(
          en: 'I would like a cup of tea, please.',
          hi: 'कृपया मुझे एक कप चाय चाहिए।'),
      SpeakingSentence(
          en: 'Can you tell me the way to the station?',
          hi: 'क्या आप मुझे स्टेशन का रास्ता बता सकते हैं?'),
      SpeakingSentence(en: 'How much does this cost?', hi: 'इसकी कीमत कितनी है?'),
      SpeakingSentence(
          en: 'See you tomorrow, take care.',
          hi: 'कल मिलते हैं, अपना ख्याल रखना।'),
      SpeakingSentence(
          en: 'Good morning, how was your day?',
          hi: 'सुप्रभात, आपका दिन कैसा रहा?'),
      SpeakingSentence(
          en: 'Could you please repeat that?',
          hi: 'क्या आप कृपया इसे दोहरा सकते हैं?'),
      SpeakingSentence(
          en: 'I am sorry, I am late.', hi: 'माफ़ कीजिए, मुझे देर हो गई।'),
      SpeakingSentence(
          en: 'What would you like to eat?', hi: 'आप क्या खाना पसंद करेंगे?'),
      SpeakingSentence(
          en: 'It was nice talking to you.',
          hi: 'आपसे बात करके अच्छा लगा।'),
    ],
    // Ch 42 — Few English Passages
    42: [
      SpeakingSentence(
          en: 'Trees give us oxygen and shade.',
          hi: 'पेड़ हमें ऑक्सीजन और छाया देते हैं।'),
      SpeakingSentence(
          en: 'A healthy mind lives in a healthy body.',
          hi: 'स्वस्थ शरीर में ही स्वस्थ मन रहता है।'),
      SpeakingSentence(en: 'Unity is strength.', hi: 'एकता में बल है।'),
      SpeakingSentence(
          en: 'The early bird catches the worm.',
          hi: 'जो जल्दी उठता है, वही पाता है।'),
      SpeakingSentence(
          en: 'Every cloud has a silver lining.',
          hi: 'हर मुश्किल में एक उम्मीद छिपी होती है।'),
      SpeakingSentence(
          en: 'Time and tide wait for none.',
          hi: 'समय किसी का इंतज़ार नहीं करता।'),
      SpeakingSentence(
          en: 'As you sow, so shall you reap.',
          hi: 'जैसा बोओगे, वैसा काटोगे।'),
      SpeakingSentence(
          en: 'All that glitters is not gold.',
          hi: 'हर चमकती चीज़ सोना नहीं होती।'),
      SpeakingSentence(
          en: 'Rome was not built in a day.',
          hi: 'कोई भी बड़ा काम एक दिन में नहीं होता।'),
      SpeakingSentence(en: 'Still waters run deep.', hi: 'शांत पानी गहरा होता है।'),
    ],
    // Ch 43 — Idioms & Proverbs
    43: [
      SpeakingSentence(
          en: 'Actions speak louder than words.',
          hi: 'कथनी से करनी बड़ी होती है।'),
      SpeakingSentence(
          en: 'A friend in need is a friend indeed.',
          hi: 'सच्चा दोस्त वही जो मुसीबत में काम आए।'),
      SpeakingSentence(
          en: 'Better late than never.', hi: 'देर आए दुरुस्त आए।'),
      SpeakingSentence(
          en: 'Honesty is the best policy.', hi: 'ईमानदारी सबसे अच्छी नीति है।'),
      SpeakingSentence(
          en: 'Where there is a will, there is a way.',
          hi: 'जहाँ चाह वहाँ राह।'),
      SpeakingSentence(
          en: 'It is raining cats and dogs.', hi: 'मूसलाधार बारिश हो रही है।'),
      SpeakingSentence(
          en: 'He let the cat out of the bag.', hi: 'उसने राज़ खोल दिया।'),
      SpeakingSentence(
          en: 'That test was a piece of cake.', hi: 'वह परीक्षा बहुत आसान थी।'),
      SpeakingSentence(
          en: 'Once in a blue moon, we meet.', hi: 'हम कभी-कभार ही मिलते हैं।'),
      SpeakingSentence(
          en: 'Practice what you preach.', hi: 'जो कहो, वही करो।'),
    ],
    // Ch 44 — Written Interviews
    44: [
      SpeakingSentence(
          en: 'Tell me about yourself.', hi: 'अपने बारे में बताइए।'),
      SpeakingSentence(en: 'I am from Jaipur.', hi: 'मैं जयपुर से हूँ।'),
      SpeakingSentence(
          en: 'My strength is hard work.', hi: 'मेरी ताकत मेहनत है।'),
      SpeakingSentence(
          en: 'I want to work in your company.',
          hi: 'मैं आपकी कंपनी में काम करना चाहता हूँ।'),
      SpeakingSentence(
          en: 'Thank you for this opportunity.',
          hi: 'इस अवसर के लिए धन्यवाद।'),
      SpeakingSentence(
          en: 'Why should we hire you?', hi: 'हम आपको नौकरी क्यों दें?'),
      SpeakingSentence(en: 'I am a quick learner.', hi: 'मैं जल्दी सीखता हूँ।'),
      SpeakingSentence(
          en: 'My goal is to grow with the company.',
          hi: 'मेरा लक्ष्य कंपनी के साथ आगे बढ़ना है।'),
      SpeakingSentence(
          en: 'I completed my graduation last year.',
          hi: 'मैंने पिछले साल स्नातक पूरा किया।'),
      SpeakingSentence(
          en: 'I can join from next Monday.',
          hi: 'मैं अगले सोमवार से काम शुरू कर सकता हूँ।'),
    ],
    // Ch 45 — English–Hindi Dictionary
    45: [
      SpeakingSentence(
          en: 'I learn five new words every day.',
          hi: 'मैं रोज़ पाँच नए शब्द सीखता हूँ।'),
      SpeakingSentence(
          en: 'This word has two meanings.', hi: 'इस शब्द के दो अर्थ हैं।'),
      SpeakingSentence(
          en: 'Please check the spelling.', hi: 'कृपया वर्तनी जाँच लीजिए।'),
      SpeakingSentence(
          en: 'English has a rich vocabulary.',
          hi: 'अंग्रेज़ी की शब्दावली बहुत समृद्ध है।'),
      SpeakingSentence(
          en: 'I use a dictionary to find meanings.',
          hi: 'मैं अर्थ ढूँढने के लिए शब्दकोश का उपयोग करता हूँ।'),
      SpeakingSentence(
          en: 'What is the meaning of this word?',
          hi: 'इस शब्द का अर्थ क्या है?'),
      SpeakingSentence(
          en: 'Every word has a story.', hi: 'हर शब्द की एक कहानी होती है।'),
      SpeakingSentence(
          en: 'I revise old words on Sunday.',
          hi: 'मैं रविवार को पुराने शब्द दोहराता हूँ।'),
      SpeakingSentence(
          en: 'Synonyms are words with similar meanings.',
          hi: 'समानार्थी शब्द मिलते-जुलते अर्थ वाले शब्द होते हैं।'),
      SpeakingSentence(
          en: 'My vocabulary is improving every day.',
          hi: 'मेरी शब्दावली रोज़ बेहतर हो रही है।'),
    ],
  };
}
