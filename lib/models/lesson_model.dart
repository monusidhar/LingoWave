
enum LessonType {
  alphabets, vowelsConsonants, greetings, manners, time, daysMonths,
  numbers, punctuation, contractions, chapterQuiz,
   ch02SentenceTypes,  // L1 — Sentence Types (Classification 1 & 2)
  ch02SVO,            // L2 — Subject, Verb & Object
  ch02Pronouns,       // L3 — Pronouns & This/That/These/Those
  ch02Apostrophe,     // L4 — Apostrophe 's
  ch02Phrases,        // L5 — Key Phrases: Both/All + Common + Prepositions
  ch02Adjectives,     // L6 — Adjectives & States (18 states)
  ch02ChapterQuiz,    // L7 — Chapter Final Quiz (60 XP)
  ch3Intro, ch3VowelEI, ch3VowelOU, ch3SoundsSH, ch3SoundsJZ, ch3ChapterQuiz,
  ch4Ex1, ch4Ex2, ch4Ex3, ch4Ex4, ch4Ex5, ch4ChapterQuiz,
  ch5WHBasics, ch5HowCombos, ch5WhomWhere, ch5WhichWhose, ch5WHPhrases, ch5ChapterQuiz,
  ch6POS1, ch6POS2, ch6POS3, ch6ChapterQuiz,
  ch7NounProper, ch7NounCollective, ch7NounGerund, ch7NounGender, ch7ChapterQuiz,
  ch8Intro, ch8SubjObj, ch8Possessive, ch8Reflexive, ch8MyMine, ch8ChapterQuiz,
  ch9Intro, ch9Degrees, ch9ErEst, ch9MoreMost, ch9Irregular, ch9ChapterQuiz,
  ch10Intro, ch10Forms1, ch10Forms2, ch10Forms3, ch10Special, ch10ChapterQuiz,
  ch11Intro, ch11Degrees, ch11Examples1, ch11Examples2, ch11Examples3, ch11ChapterQuiz,
  ch12Intro, ch12JoyGrief, ch12SurpriseConsent, ch12Everyday, ch12ChapterQuiz,
  ch13Intro, ch13AvsAn, ch13ThePronun, ch13TheUse, ch13TheNotUse, ch13ChapterQuiz,
  ch14Intro, ch14Part1, ch14Part2, ch14Part3, ch14Part4, ch14Part5, ch14Part6, ch14Part7, ch14ChapterQuiz,
  ch15Intro,
  ch15Demonstratives,
  ch15Possessives,
  ch15Quantifiers1,
  ch15Quantifiers2,
  ch15ChapterQuiz,
  // ── Chapter 16 ────────────────────────────────────────────────────────────
  ch16Intro,           // L1 — What are Simple Sentences?
  ch16PresentIsAmAre,  // L2 — Simple Present: Is/Am/Are
  ch16PresentHasHave,  // L3 — Simple Present: Has/Have
  ch16PastWasWere,     // L4 — Simple Past: Was/Were
  ch16PastHad,         // L5 — Simple Past: Had
  ch16Future,          // L6 — Simple Future: Will be / Will have
  ch16Practice,        // L7 — Practice Exercise (100 sentences)
  ch16SingularPlural,  // L8 — Singular & Plural Identification
  ch16TestPaper,       // L9 — Test Papers (I, II, III)
  ch16ChapterQuiz,     // L10 — Chapter Final Quiz
  //   // ── Chapter 17 ──────────────────────────────────────────────────────────
  ch17Concept1,    // L1 — Here/There as location words
  ch17Concept2,    // L2 — There replacing missing Subject/Object
  ch17Practice,    // L3 — Practice Exercise (50 sentences)
  ch17TestPaper,   // L4 — Test Papers I & II
  ch17ChapterQuiz, // L5 — Chapter Final Quiz
  //   // ── Chapter 18 ──────────────────────────────────────────────────────────
  ch18PositionWords,  // L1 — Position Words (next to, ahead of, behind...)
  ch18AheadVsFront,  // L2 — Ahead of vs In Front Of
  ch18Practice,      // L3 — Practice Exercise (50 sentences)
  ch18TestPaper,     // L4 — Test Paper — Class Layout (20 Q&A)
  ch18ChapterQuiz,   // L5 — Chapter Final Quiz
   // ── Chapter 19 ────────────────────────────────────────────────────────────
 ch19Intro,                       // L1  — Introduction to Tense
  ch19PresentIndefiniteAff,        // L2  — Present Indefinite: Affirmative
  ch19PresentIndefiniteNeg,        // L3  — Present Indefinite: Neg & Inter
  ch19PresentContinuous,           // L4  — Present Continuous
  ch19PresentPerfect,              // L5  — Present Perfect
  ch19PresentPerfectContinuous,    // L6  — Present Perfect Continuous
  ch19PastIndefinite,              // L7  — Past Indefinite
  ch19PastContinuous,              // L8  — Past Continuous
  ch19PastPerfect,                 // L9  — Past Perfect
  ch19PastPerfectContinuous,       // L10 — Past Perfect Continuous
  ch19FutureIndefinite,            // L11 — Future Indefinite
  ch19FutureContinuous,            // L12 — Future Continuous
  ch19FuturePerfect,               // L13 — Future Perfect
  ch19FuturePerfectContinuous,     // L14 — Future Perfect Continuous
  ch19Practice,                    // L15 — Practice Exercise (190 sentences)
  ch19TestPaper1,                  // L16 — Test Paper I & II
  ch19TestPaper2,                  // L17 — Test Paper III & IV
  ch19ChapterQuiz,                 // L18 — Chapter Final Quiz (150 XP)
  ch20Concept1,      // L1 — It vs This (निर्जीव vs सजीव)
  ch20Concept2,      // L2 — It as Subject (Day/Date)
  ch20Concept3,      // L3 — It has/had been (समय हो गया)
  ch20Concept4,      // L4 — It takes (समय लगना)
  ch20Practice,      // L5 — Practice Exercise (100 sentences)
  ch20TestPaper1,    // L6 — Test Paper I (Hindi → English 50)
  ch20TestPaper2,    // L7 — Test Paper II (English → Hindi 50)
  ch20ChapterQuiz,   // L8 — Chapter Final Quiz (50 XP)
  ch21Overview,      // L1  — Modals Overview (19 Modals table)
  ch21CanCould,      // L2  — Can / Could / Could have
  ch21MayMight,      // L3  — May / Might / May have
  ch21ShouldMust,    // L4  — Should / Must / Ought to
  ch21HasTo,         // L5  — Has to / Had to / Will have to
  ch21UsedTo,        // L6  — Used to / Would / Would like to
  ch21NeedDare,      // L7  — Need / Dare / Will be able to
  ch21WillRule,      // L8  — Will → Must/May/Might Rule
  ch21Practice,      // L9  — Practice Exercise (94 sentences)
  ch21TestPaper1,    // L10 — Test Paper I (Hindi→English 35)
  ch21TestPaper2,    // L11 — Test Paper II (English→Hindi 50)
  ch21ChapterQuiz,   // L12 — Chapter Final Quiz (100 XP)
 // ── Chapter 22 ────────────────────────────────────────────────────────────
  ch22Intro,           // L1 — And / Or / But / Except
  ch22Because,         // L2 — For/As/Because/Since + Also/Too/Either/Even
  ch22AsAs,            // L3 — As+Adj+As / As (जैसा) / As well as
  ch22AsGroup,         // L4 — As soon as / As far as / As if / As though
  ch22IfAlthough,      // L5 — If (3 types) / Although-Yet / Lest / Otherwise / So that
  ch22WH,              // L6 — WH as conjunctions / Such / That's what/where/why
  ch22Special,         // L7 — Either-or / Neither-nor / Not only-but also / While / No sooner / Still / Yet / Till / Unless / Whether / Whereas
  ch22Practice,        // L8 — Practice Exercise
  ch22TestPaper,       // L9 — Test Paper
  ch22ChapterQuiz,     // L10 — Chapter Final Quiz (100 XP)
   // ── Chapter 23 ────────────────────────────────────────────────────────────
  ch23Intro,          // L1 — Imperative Sentences (Rules)
  ch23Let,            // L2 — Let / Don't Let
  ch23Quotations,     // L3 — Quotations
  ch23Practice,       // L4 — Practice Exercise (95 sentences)
  ch23TestPaper1,     // L5 — Test Paper I  (Hindi → English 50)
  ch23TestPaper2,     // L6 — Test Paper II (English → Hindi 50)
  ch23ChapterQuiz,    // L7 — Chapter Final Quiz (100 XP)
   // ── Chapter 24 ────────────────────────────────────────────────────────────
  ch24Intro,          // L1 — Let: Concept & Rules
  ch24Tenses,         // L2 — Let: All Tenses Table
  ch24Quotations,     // L3 — Quotations
  ch24Practice,       // L4 — Practice Exercise (96 sentences)
  ch24TestPaper1,     // L5 — Test Paper I  (English → Hindi 30)
  ch24TestPaper2,     // L6 — Test Paper II (Hindi → English 30)
  ch24ChapterQuiz,    // L7 — Chapter Final Quiz (100 XP)
    // ── Chapter 25 ────────────────────────────────────────────
  ch25Intro,          // L1 — Concept: Get vs Make
  ch25Get,            // L2 — GET: Non-living + V3
  ch25Make,           // L3 — MAKE: Living + V1
  ch25Special,        // L4 — Special Make words (smile/cry/happy...)
  ch25Practice,       // L5 — Practice Exercise (85 sentences)
  ch25TestPaper1,     // L6 — Test Paper I  (Eng→Hindi 50)
  ch25TestPaper2,     // L7 — Test Paper II (Eng→Hindi 30)
  ch25ChapterQuiz,    // L8 — Chapter Final Quiz (100 XP)
   // ── Chapter 26 ────────────────────────────────────────────────────────────────
  ch26Intro,           // L1 — Active vs Passive Concept
  ch26PassiveTenses,   // L2 — Passive of Tenses (HV Table)
  ch26PassiveModals,   // L3 — Passive of Modals (be / been rule)
  ch26PassiveLet,      // L4 — Passive of Let
  ch26Practice,        // L5 — Practice Exercise (40 sentences)
  ch26TestPaper1,      // L6 — Test Paper I  (Eng → Hindi 30)
  ch26TestPaper2,      // L7 — Test Paper II (Hindi → Eng 20)
  ch26ChapterQuiz,     // L8 — Chapter Final Quiz (100 XP)
  // ── Chapter 27 ────────────────────────────────────────────
  ch27GetSick,        // L1 — Get (बीमार हो जाना)
  ch27FondMeant,      // L2 — Fond of & Meant for
  ch27MadeInOf,       // L3 — Made in / of / by
  ch27AbleHowTo,      // L4 — Able to & How to
  ch27KeepHaving,     // L5 — Keep on & Having + V3
  ch27SpecialMore,    // L6 — ऊँ Formation, Hold, Suggest
  ch27TheVeryOrSo,    // L7 — The very, Or so, The one(s)
  ch27Practice,       // L8 — Practice Exercise (50 sentences)
  ch27TestPaper,      // L9 — Test Paper I & II
  ch27ChapterQuiz,    // L10 — Chapter Final Quiz (100 XP)
    // ── Chapter 28 ────────────────────────────────────────────────────────────
  ch28Intro,           // L1 — What are Fillers?
  ch28CommonFillers,   // L2 — Common Fillers (8)
  ch28InSentences,     // L3 — Fillers in Sentences
  ch28Quotations,      // L4 — Quotations
  ch28ChapterQuiz,     // L5 — Chapter Final Quiz (100 XP)
  // ── Chapter 29 ────────────────────────────────────────────
  ch29Intro,          // L1 — Question Tags: Concept & Rules
  ch29Scenario1,      // L2 — Scenario 1: Positive → Negative Tag (21 sentences)
  ch29Scenario2,      // L3 — Scenario 2: Negative → Positive Tag (20 sentences)
  ch29ChapterQuiz,    // L4 — Chapter Final Quiz (100 XP)
  // chapter 30
    ch30Get,           // L1 — Get (8 phrasals)
  ch30RunTurn,       // L2 — Run (4) / Turn (5)
  ch30PutGo,         // L3 — Put (5) / Go (8)
  ch30BreakComeLook, // L4 — Break (6) / Come (6) / Look (5)
  ch30Others,        // L5 — Others (21 phrasals)
  ch30ChapterQuiz,   // L6 — Chapter Final Quiz (80 XP)
  // ── Chapter 31 ────────────────────────────────────────────────────────────
  ch31GroupA,        // L1 — Group A phrases (According to … In the hope of)
  ch31GroupB,        // L2 — Group B phrases (In lieu of … Anything at all)
  ch31ChapterQuiz,   // L3 — Chapter Final Quiz (80 XP)
   // ── Chapter 32 ────────────────────────────────────────────────────────────
  ch32Ex1A,          // L1 — Exercise 1 Part A (words 1–20, Hindi meanings)
  ch32Ex1B,          // L2 — Exercise 1 Part B (words 21–40, Hindi meanings)
  ch32Ex1C,          // L3 — Exercise 1 Part C (words 41+, Hindi+English)
  ch32Ex2,           // L4 — Exercise 2 (English-only 54 groups)
  ch32ChapterQuiz,   // L5 — Chapter Final Quiz (80 XP)
   ch33PartA,        // L1 — Part A: Words 1–30 (Hindi meanings)
  ch33PartB,        // L2 — Part B: Words 31–54 (Hindi meanings)
  ch33ChapterQuiz,  // L3 — Chapter Final Quiz (80 XP)
  // ── Chapter 34 ────────────────────────────────────────────────────────────
  ch34Intro,        // L1 — Concept & Introduction
  ch34Set1,         // L2 — Sentences 1–55
  ch34Set2,         // L3 — Sentences 56–113
  ch34Set3,         // L4 — Sentences 114–175
  ch34Set4,         // L5 — Sentences 176–220
  ch34Set5,         // L6 — Sentences 221–266
  ch34ChapterQuiz,  // L7 — Chapter Final Quiz (100 XP)
  // ── Chapter 35 ────────────────────────────────────────────
  ch35Polite,         // L1 — Polite Expressions (1–57)
  ch35Questions1,     // L2 — Questions: What, Who, How (58–102)
  ch35Questions2,     // L3 — Questions: Why, Where, Shall (103–143)
  ch35Emotions,       // L4 — Emotions & Feelings (144–200)
  ch35Complex,        // L5 — Complex Sentences (201–278)
  ch35ChapterQuiz,    // L6 — Chapter Final Quiz (100 XP)
 // ── Chapter 36 ────────────────────────────────────────────
  ch36Verbs1,         // L1 — Verbs Part 1 (Q 1–25)
  ch36Verbs2,         // L2 — Verbs Part 2 (Q 26–50)
  ch36Articles1,      // L3 — Articles Part 1 (Q 1–25)
  ch36Articles2,      // L4 — Articles Part 2 (Q 26–50)
  ch36Prep1,          // L5 — Prepositions Part 1 (Q 1–38)
  ch36Prep2,          // L6 — Prepositions Part 2 (Q 39–75)
  ch36ChapterQuiz,    // L7 — Chapter Final Quiz (100 XP)
  // ── Chapter 37 ────────────────────────────────────────────
  ch37Ex1A,         // L1 — Exercise I Part A (sentences 1–50)
  ch37Ex1B,         // L2 — Exercise I Part B (sentences 51–118)
  ch37Ex2A,         // L3 — Exercise II Part A (sentences 1–55)
  ch37Ex2B,         // L4 — Exercise II Part B (sentences 56–110)
  ch37ChapterQuiz,  // L5 — Chapter Final Quiz (100 XP)
    // ── Chapter 38 ────────────────────────────────────────────
  ch38Set1,           // L1 — Set 1: Passive & Tenses (Q 1–30)
  ch38Set2,           // L2 — Set 2: Mixed Concepts (Q 31–60)
  ch38Set3,           // L3 — Set 3: Advanced (Q 61–90)
  ch38ChapterQuiz,    // L4 — Chapter Final Quiz (100 XP)
  // ── Chapter 39 ────────────────────────────────────────────────────────────
  ch39Test1,        // L1 — Mixed Test I   (Translation 30 + Correction 20)
  ch39Test2,        // L2 — Mixed Test II  (Spelling 5 + Correct/Incorrect 15 + Translation 15)
  ch39Test3,        // L3 — Mixed Test III (Tense Correction 10 + Translation 10 + Verb Forms 10)
  ch39Test4,        // L4 — Mixed Test IV  (Translation 30 + Word Meanings 40)
  ch39ChapterQuiz,  // L5 — Chapter Final Quiz (100 XP)
    ch40EnToHi1,
  ch40EnToHi2,
  ch40HiToEn1,  // New
  ch40HiToEn2,  // New
  ch40ChapterQuiz,
     ch41Conv1,        // L1  — Doctor Visit (Rakesh & Dr. Bansal)
  ch41Conv2,        // L2  — Shopping (Seema & Shopkeeper)
  ch41Conv3,        // L3  — Teacher & Student (Priya & Mr. Sharma)
  ch41Conv4,        // L4  — Friends in Trouble (Kamal & Sagar)
  ch41Conv5,        // L5  — Friends Good News (Ram & Shyam)
  ch41Conv6,        // L6  — Feelings (Rohit & Shalini)
  ch41Conv7,        // L7  — Classroom (Teacher & Students)
  ch41Conv8,        // L8  — Gym (Rohan & Sohan)
  ch41Conv9,        // L9  — Flatmates (Saleem & Salman)
  ch41Conv10,
  ch41Conv11,
  ch41Conv12,
  ch41Conv13,
  ch41Conv14,
  ch41Conv15,
  ch41Conv16,
  ch41Conv17,
  ch41Conv18,
  ch41Conv19,
  ch41Conv20,
  ch41Conv21,
  ch41Conv22,
  ch41Conv23,
  ch41Conv24,
  ch41Conv25,
  ch41Conv26,
  ch41Conv27,
  ch41Conv28,
  ch41Conv29,
  ch41Conv30,
  ch41ChapterQuiz,  // L10 — Chapter Final Quiz (100 XP)
  ch42Passages1,    // L1 — English Passages 1–5
  ch42Passages2,    // L2 — English Passages 6–10
  ch42ChapterQuiz,  // L3 — Chapter Final Quiz (60 XP)
   // ── Chapter 43 ────────────────────────────────────────────────────────────
  ch43Intro,        // L1 — Introduction & Categories
  ch43IdiomsA,      // L2 — Idioms Part A (1–20)
  ch43IdiomsB,      // L3 — Idioms Part B (21–40)
  ch43IdiomsC,      // L4 — Idioms Part C (41–59)
  ch43Proverbs,     // L5 — Proverbs (1–25)
  ch43ChapterQuiz,  // L6 — Chapter Final Quiz (100 XP)
   // ── Chapter 44 ────────────────────────────────────────────────────────────
  ch44Tips,            // L1 — Interview Tips & Introduction
  ch44Interview1,      // L2 — Interview I & II (Rahul & Aditya)
  ch44Interview2,      // L3 — Interview III & IV (Pooja & Renu)
  ch44Interview3,      // L4 — Interview V & VI (Priya & Pankaj)
  ch44Interview4,      // L5 — Interview VII & VIII (Puneet & Arun)
  ch44Interview5,      // L6 — Interview IX & X (Arpit & Saleem)
  ch44Interview6,      // L7 — Interview XI & XII (Telephonic)
  ch44Phrases,         // L8 — Key Phrases & Smart Answers
  ch44Mock,            // L9 — Mock Interview Practice
  ch44ChapterQuiz,     // L10 — Chapter Final Quiz (100 XP)
  // ── Chapter 45 ────────────────────────────────────────────────────────────
  ch45DictAE,          // L1 — Dictionary A–E
  ch45DictFJ,          // L2 — Dictionary F–J
  ch45DictKO,          // L3 — Dictionary K–O
  ch45DictPS,          // L4 — Dictionary P–S
  ch45DictTZ,          // L5 — Dictionary T–Z
  ch45POS,             // L6 — Parts of Speech Guide
  ch45QuizEN,          // L7 — Word Quiz I (English → Hindi)
  ch45QuizHI,          // L8 — Word Quiz II (Hindi → English)
  ch45QuizPOS,         // L9 — Word Quiz III (POS & Usage)
  ch45ChapterQuiz,     // L10 — Chapter Final Quiz (100 XP)o
}

enum LessonStatus { locked, inProgress, completed }

class LessonModel {
  final int id;
  final String title;
  final String titleHindi;
  final String emoji;
  final LessonType type;
  LessonStatus status;
  int xpEarned;
  final int totalXP;

  LessonModel({
    required this.id, required this.title, required this.titleHindi,
    required this.emoji, required this.type,
    this.status = LessonStatus.inProgress, this.xpEarned = 0, this.totalXP = 20,
  });
}

class ChapterModel {
  final int id;
  final String title;
  final String titleHindi;
  final String description;
  final List<LessonModel> lessons;
  LessonStatus status;

  ChapterModel({
    required this.id, required this.title, required this.titleHindi,
    required this.description, required this.lessons,
    this.status = LessonStatus.locked,
  });

  double get progress {
    if (lessons.isEmpty) return 0;
    return lessons.where((l) => l.status == LessonStatus.completed).length / lessons.length;
  }
  int get totalXP => lessons.fold(0, (s, l) => s + l.totalXP);
  int get earnedXP => lessons.fold(0, (s, l) => s + l.xpEarned);
  bool get isFullyCompleted => progress == 1.0;
}

class QuizQuestion {
  final String questionEn;
  final String questionHi;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.questionEn, required this.questionHi,
    required this.options, required this.correctIndex, required this.explanation,
  });
}