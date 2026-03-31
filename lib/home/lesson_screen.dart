import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../theme/app_theme.dart';
import '../models/lesson_model.dart';
import '../widgets/common_widgets.dart';
import '../widgets/ad_widgets.dart';
import '../services/progress_service.dart';
import '../services/ad_service.dart';
import 'quiz_screen.dart';

import '../widgets/lesson/chapter1_widgets.dart';
import '../widgets/lesson/chapter2_widgets.dart';
import '../widgets/lesson/chapter3_widgets.dart';
import '../widgets/lesson/chapter4_widgets.dart';
import '../widgets/lesson/chapter5_widgets.dart';
import '../widgets/lesson/chapter6_widgets.dart';
import '../widgets/lesson/chapter7_widgets.dart';
import '../widgets/lesson/chapter8_widgets.dart';
import '../widgets/lesson/chapter9_widgets.dart';
import '../widgets/lesson/chapter10_widgets.dart';
import '../widgets/lesson/chapter11_widgets.dart';
import '../widgets/lesson/chapter12_widgets.dart';
import '../widgets/lesson/chapter13_widgets.dart';
import '../widgets/lesson/chapter14_widgets.dart';
import '../widgets/lesson/chapter15_widgets.dart';
import '../widgets/lesson/chapter16_widgets.dart';
import '../widgets/lesson/chapter17_widgets.dart';
import '../widgets/lesson/chapter18_widgets.dart';
import '../widgets/lesson/chapter19_widgets.dart';
import '../widgets/lesson/chapter20_widgets.dart';
import '../widgets/lesson/chapter21_widgets.dart';
import '../widgets/lesson/chapter22_widgets.dart';
import '../widgets/lesson/chapter23_widgets.dart';
import '../widgets/lesson/chapter24_widgets.dart';
import '../widgets/lesson/chapter25_widgets.dart';
import '../widgets/lesson/chapter26_widgets.dart';
import '../widgets/lesson/chapter27_widgets.dart';
import '../widgets/lesson/chapter28_widgets.dart';
import '../widgets/lesson/chapter29_widgets.dart';
import '../widgets/lesson/chapter30_widgets.dart';
import '../widgets/lesson/chapter31_widgets.dart';
import '../widgets/lesson/chapter32_widgets.dart';
import '../widgets/lesson/chapter33_widgets.dart';
import '../widgets/lesson/chapter34_widgets.dart';
import '../widgets/lesson/chapter35_widgets.dart';
import '../widgets/lesson/chapter36_widgets.dart';
import '../widgets/lesson/chapter37_widgets.dart';
import '../widgets/lesson/chapter38_widgets.dart';
import '../widgets/lesson/chapter39_widgets.dart';
import '../widgets/lesson/chapter40_widgets.dart';
import '../widgets/lesson/chapter41_widgets.dart';
import '../widgets/lesson/chapter42_widgets.dart';
import '../widgets/lesson/chapter43_widgets.dart';
import '../widgets/lesson/chapter44_widgets.dart';
import '../widgets/lesson/chapter45_widgets.dart';

class LessonScreen extends StatefulWidget {
  final LessonModel lesson;
  final ChapterModel chapter;
  final Color accentColor;
  const LessonScreen(
      {super.key,
      required this.lesson,
      required this.chapter,
      required this.accentColor});
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _fade;
  final FlutterTts _tts = FlutterTts();
  bool _ttsReady = false;
  String? _speakingText;

  late Chapter1Widgets  _ch1;
  late Chapter2Widgets  _ch2;
  late Chapter3Widgets  _ch3;
  late Chapter4Widgets  _ch4;
  late Chapter5Widgets  _ch5;
  late Chapter6Widgets  _ch6;
  late Chapter7Widgets  _ch7;
  late Chapter8Widgets  _ch8;
  late Chapter9Widgets  _ch9;
  late Chapter10Widgets _ch10;
  late Chapter11Widgets _ch11;
  late Chapter12Widgets _ch12;
  late Chapter13Widgets _ch13;
  late Chapter14Widgets _ch14;
  late Chapter15Widgets _ch15;
  late Chapter16Widgets _ch16;
  late Chapter17Widgets _ch17;
  late Chapter18Widgets _ch18;
  late Chapter19Widgets _ch19;
  late Chapter20Widgets _ch20;
  late Chapter21Widgets _ch21;
  late Chapter22Widgets _ch22;
  late Chapter23Widgets _ch23;
  late Chapter24Widgets _ch24;
  late Chapter25Widgets _ch25;
  late Chapter26Widgets _ch26;
  late Chapter27Widgets _ch27;
  late Chapter28Widgets _ch28;
  late Chapter29Widgets _ch29;
  late Chapter30Widgets _ch30;
  late Chapter31Widgets _ch31;
  late Chapter32Widgets _ch32;
  late Chapter33Widgets _ch33;
  late Chapter34Widgets _ch34;
  late Chapter35Widgets _ch35;
  late Chapter36Widgets _ch36;
  late Chapter37Widgets _ch37;
  late Chapter38Widgets _ch38;
  late Chapter39Widgets _ch39;
  late Chapter40Widgets _ch40;
  late Chapter41Widgets _ch41;
  late Chapter42Widgets _ch42;
  late Chapter43Widgets _ch43;
  late Chapter44Widgets _ch44;
  late Chapter45Widgets _ch45;
  late LessonCommonWidgets _cw;

  static const _chapterQuizTypes = [
    LessonType.chapterQuiz,
    LessonType.ch02ChapterQuiz,
    LessonType.ch3ChapterQuiz,
    LessonType.ch4ChapterQuiz,
    LessonType.ch5ChapterQuiz,
    LessonType.ch6ChapterQuiz,
    LessonType.ch7ChapterQuiz,
    LessonType.ch8ChapterQuiz,
    LessonType.ch9ChapterQuiz,
    LessonType.ch10ChapterQuiz,
    LessonType.ch11ChapterQuiz,
    LessonType.ch12ChapterQuiz,
    LessonType.ch13ChapterQuiz,
    LessonType.ch14ChapterQuiz,
    LessonType.ch15ChapterQuiz,
    LessonType.ch16ChapterQuiz,
    LessonType.ch17ChapterQuiz,
    LessonType.ch18ChapterQuiz,
    LessonType.ch19ChapterQuiz,
    LessonType.ch20ChapterQuiz,
    LessonType.ch21ChapterQuiz,
    LessonType.ch22ChapterQuiz,
    LessonType.ch23ChapterQuiz,
    LessonType.ch24ChapterQuiz,
    LessonType.ch25ChapterQuiz,
    LessonType.ch26ChapterQuiz,
    LessonType.ch27ChapterQuiz,
    LessonType.ch28ChapterQuiz,
    LessonType.ch29ChapterQuiz,
    LessonType.ch30ChapterQuiz,
    LessonType.ch31ChapterQuiz,
    LessonType.ch32ChapterQuiz,
    LessonType.ch33ChapterQuiz,
    LessonType.ch34ChapterQuiz,
    LessonType.ch35ChapterQuiz,
    LessonType.ch36ChapterQuiz,
    LessonType.ch37ChapterQuiz,
    LessonType.ch38ChapterQuiz,
    LessonType.ch39ChapterQuiz,
    LessonType.ch40ChapterQuiz,
    LessonType.ch41ChapterQuiz,
    LessonType.ch42ChapterQuiz,
    LessonType.ch43ChapterQuiz,
    LessonType.ch44ChapterQuiz,
    LessonType.ch45ChapterQuiz,
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _fade = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
    _initTts();
    _cw = LessonCommonWidgets(
        tts: _tts,
        speakingText: _speakingText,
        onSpeak: _speak,
        onStop: _stopSpeaking,
        setStateCallback: () => setState(() {}),
        accentColor: widget.accentColor);
    _ch1  = Chapter1Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch2  = Chapter2Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch3  = Chapter3Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch4  = Chapter4Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch5  = Chapter5Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch6  = Chapter6Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch7  = Chapter7Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch8  = Chapter8Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch9  = Chapter9Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch10 = Chapter10Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch11 = Chapter11Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch12 = Chapter12Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch13 = Chapter13Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch14 = Chapter14Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch15 = Chapter15Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch16 = Chapter16Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch17 = Chapter17Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch18 = Chapter18Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch19 = Chapter19Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch20 = Chapter20Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch21 = Chapter21Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch22 = Chapter22Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch23 = Chapter23Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch24 = Chapter24Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch25 = Chapter25Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch26 = Chapter26Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch27 = Chapter27Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch28 = Chapter28Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch29 = Chapter29Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch30 = Chapter30Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch31 = Chapter31Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch32 = Chapter32Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch33 = Chapter33Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch34 = Chapter34Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch35 = Chapter35Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch36 = Chapter36Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch37 = Chapter37Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch38 = Chapter38Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch39 = Chapter39Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch40 = Chapter40Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch41 = Chapter41Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch42 = Chapter42Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch43 = Chapter43Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch44 = Chapter44Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
    _ch45 = Chapter45Widgets(commonWidgets: _cw, accentColor: widget.accentColor);
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-IN');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _speakingText = null);
    });
    if (mounted) setState(() => _ttsReady = true);
  }

  Future<void> _speak(String t) async {
    if (!_ttsReady) return;
    await _tts.stop();
    setState(() => _speakingText = t);
    await _tts.speak(t);
  }

  Future<void> _stopSpeaking() async {
    await _tts.stop();
    if (mounted) setState(() => _speakingText = null);
  }

  @override
  void dispose() {
    _animController.dispose();
    _tts.stop();
    super.dispose();
  }

  void _goToQuiz() async {
    if (widget.lesson.status != LessonStatus.completed) {
      await ProgressService.completeLesson(
          chapterId: widget.chapter.id,
          lessonId: widget.lesson.id,
          xpEarned: widget.lesson.totalXP,
          totalLessonsInChapter: widget.chapter.lessons.length);
      // ── Award quiz coins ────────────────────────────────────────────
      await AdService().awardQuizCoins();
      if (mounted)
        setState(() {
          widget.lesson.status = LessonStatus.completed;
          widget.lesson.xpEarned = widget.lesson.totalXP;
        });
    }
    if (!mounted) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => QuizScreen(
                chapter: widget.chapter,
                lesson: widget.lesson,
                accentColor: widget.accentColor)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      // ── Banner Ad at bottom (auto-hides for premium users) ───────────
      bottomNavigationBar: const LingoBannerAd(),
      body: FadeTransition(
          opacity: _fade,
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: widget.accentColor,
              leading: IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white),
                  onPressed: () => Navigator.pop(context)),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.lesson.title,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16)),
                    Text(widget.lesson.titleHindi,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white70,
                            fontSize: 12)),
                  ]),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.md),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppRadius.full)),
                      child: Text('+${widget.lesson.totalXP} XP',
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13)),
                    ))
              ],
            ),
            SliverPadding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                sliver: SliverToBoxAdapter(child: _buildContent())),
            SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.xxl),
                sliver: SliverToBoxAdapter(child: _buildQuizButton())),
          ])),
    );
  }

  Widget _buildQuizButton() {
    final isCQ = _chapterQuizTypes.contains(widget.lesson.type);
    return PrimaryButton(
        label: isCQ
            ? 'अध्याय क्विज़ शुरू करें'
            : 'क्विज़ दें  (+${widget.lesson.totalXP} XP)',
        onTap: _goToQuiz,
        color: widget.accentColor,
        emoji: isCQ ? '🏆' : '📝');
  }

  Widget _buildContent() {
    switch (widget.lesson.type) {
      case LessonType.alphabets:           return _ch1.buildAlphabetContent();
      case LessonType.vowelsConsonants:    return _ch1.buildVowelsConsonantsContent();
      case LessonType.greetings:           return _ch1.buildGreetingsContent();
      case LessonType.manners:             return _ch1.buildMannersContent();
      case LessonType.daysMonths:          return _ch1.buildDaysMonthsContent();
      case LessonType.numbers:             return _ch1.buildNumbersContent();
      case LessonType.time:                return _ch1.buildTimeContent();
      case LessonType.punctuation:         return _ch1.buildPunctuationContent();
      case LessonType.contractions:        return _ch1.buildContractionsContent();
      case LessonType.chapterQuiz:         return _ch1.buildChapterQuizIntro();
       case LessonType.ch02SentenceTypes: return _ch2.buildSentenceTypesContent();
      case LessonType.ch02SVO:           return _ch2.buildSVOContent();
      case LessonType.ch02Pronouns:      return _ch2.buildPronounsContent();
      case LessonType.ch02Apostrophe:    return _ch2.buildApostropheContent();
      case LessonType.ch02Phrases:       return _ch2.buildPhrasesContent();
      case LessonType.ch02Adjectives:    return _ch2.buildAdjectivesContent();
      case LessonType.ch02ChapterQuiz:   return _ch2.buildChapterQuizIntro();
      case LessonType.ch3Intro:            return _ch3.buildIntroContent();
      case LessonType.ch3VowelEI:          return _ch3.buildVowelEIContent();
      case LessonType.ch3VowelOU:          return _ch3.buildVowelOUContent();
      case LessonType.ch3SoundsSH:         return _ch3.buildSoundsSHContent();
      case LessonType.ch3SoundsJZ:         return _ch3.buildSoundsJZContent();
      case LessonType.ch3ChapterQuiz:      return _ch3.buildChapterQuizIntro();
      case LessonType.ch4Ex1:              return _ch4.buildEx1Content();
      case LessonType.ch4Ex2:              return _ch4.buildEx2Content();
      case LessonType.ch4Ex3:              return _ch4.buildEx3Content();
      case LessonType.ch4Ex4:              return _ch4.buildEx4Content();
      case LessonType.ch4Ex5:              return _ch4.buildEx5Content();
      case LessonType.ch4ChapterQuiz:      return _ch4.buildChapterQuizIntro();
      case LessonType.ch5WHBasics:         return _ch5.buildWHBasicsContent();
      case LessonType.ch5HowCombos:        return _ch5.buildHowCombosContent();
      case LessonType.ch5WhomWhere:        return _ch5.buildWhomWhereContent();
      case LessonType.ch5WhichWhose:       return _ch5.buildWhichWhoseContent();
      case LessonType.ch5WHPhrases:        return _ch5.buildWHPhrasesContent();
      case LessonType.ch5ChapterQuiz:      return _ch5.buildChapterQuizIntro();
      case LessonType.ch6POS1:             return _ch6.buildPOS1Content();
      case LessonType.ch6POS2:             return _ch6.buildPOS2Content();
      case LessonType.ch6POS3:             return _ch6.buildPOS3Content();
      case LessonType.ch6ChapterQuiz:      return _ch6.buildChapterQuizIntro();
      case LessonType.ch7NounProper:       return _ch7.buildNounProperContent();
      case LessonType.ch7NounCollective:   return _ch7.buildNounCollectiveContent();
      case LessonType.ch7NounGerund:       return _ch7.buildNounGerundContent();
      case LessonType.ch7NounGender:       return _ch7.buildNounGenderContent();
      case LessonType.ch7ChapterQuiz:      return _ch7.buildChapterQuizIntro();
      case LessonType.ch8Intro:            return _ch8.buildIntroContent();
      case LessonType.ch8SubjObj:          return _ch8.buildSubjObjContent();
      case LessonType.ch8Possessive:       return _ch8.buildPossessiveContent();
      case LessonType.ch8Reflexive:        return _ch8.buildReflexiveContent();
      case LessonType.ch8MyMine:           return _ch8.buildMyMineContent();
      case LessonType.ch8ChapterQuiz:      return _ch8.buildChapterQuizIntro();
      case LessonType.ch9Intro:            return _ch9.buildIntroContent();
      case LessonType.ch9Degrees:          return _ch9.buildDegreesContent();
      case LessonType.ch9ErEst:            return _ch9.buildErEstContent();
      case LessonType.ch9MoreMost:         return _ch9.buildMoreMostContent();
      case LessonType.ch9Irregular:        return _ch9.buildIrregularContent();
      case LessonType.ch9ChapterQuiz:      return _ch9.buildChapterQuizIntro();
      case LessonType.ch10Intro:           return _ch10.buildIntroContent();
      case LessonType.ch10Forms1:          return _ch10.buildForms1Content();
      case LessonType.ch10Forms2:          return _ch10.buildForms2Content();
      case LessonType.ch10Forms3:          return _ch10.buildForms3Content();
      case LessonType.ch10Special:         return _ch10.buildSpecialContent();
      case LessonType.ch10ChapterQuiz:     return _ch10.buildChapterQuizIntro();
      case LessonType.ch11Intro:           return _ch11.buildIntroContent();
      case LessonType.ch11Degrees:         return _ch11.buildDegreesContent();
      case LessonType.ch11Examples1:       return _ch11.buildExamples1Content();
      case LessonType.ch11Examples2:       return _ch11.buildExamples2Content();
      case LessonType.ch11Examples3:       return _ch11.buildExamples3Content();
      case LessonType.ch11ChapterQuiz:     return _ch11.buildChapterQuizIntro();
      case LessonType.ch12Intro:           return _ch12.buildIntroContent();
      case LessonType.ch12JoyGrief:        return _ch12.buildJoyGriefContent();
      case LessonType.ch12SurpriseConsent: return _ch12.buildSurpriseConsentContent();
      case LessonType.ch12Everyday:        return _ch12.buildEverydayContent();
      case LessonType.ch12ChapterQuiz:     return _ch12.buildChapterQuizIntro();
      case LessonType.ch13Intro:           return _ch13.buildIntroContent();
      case LessonType.ch13AvsAn:           return _ch13.buildAvsAnContent();
      case LessonType.ch13ThePronun:       return _ch13.buildThePronunContent();
      case LessonType.ch13TheUse:          return _ch13.buildTheUseContent();
      case LessonType.ch13TheNotUse:       return _ch13.buildTheNotUseContent();
      case LessonType.ch13ChapterQuiz:     return _ch13.buildChapterQuizIntro();
      case LessonType.ch14Intro:           return _ch14.buildIntroContent();
      case LessonType.ch14Part1:           return _ch14.buildPart1Content();
      case LessonType.ch14Part2:           return _ch14.buildPart2Content();
      case LessonType.ch14Part3:           return _ch14.buildPart3Content();
      case LessonType.ch14Part4:           return _ch14.buildPart4Content();
      case LessonType.ch14Part5:           return _ch14.buildPart5Content();
      case LessonType.ch14Part6:           return _ch14.buildPart6Content();
      case LessonType.ch14Part7:           return _ch14.buildPart7Content();
      case LessonType.ch14ChapterQuiz:     return _ch14.buildChapterQuizIntro();
      case LessonType.ch15Intro:           return _ch15.buildIntroContent();
      case LessonType.ch15Demonstratives:  return _ch15.buildDemonstrativesContent();
      case LessonType.ch15Possessives:     return _ch15.buildPossessivesContent();
      case LessonType.ch15Quantifiers1:    return _ch15.buildQuantifiers1Content();
      case LessonType.ch15Quantifiers2:    return _ch15.buildQuantifiers2Content();
      case LessonType.ch15ChapterQuiz:     return _ch15.buildChapterQuizIntro();
      case LessonType.ch16Intro:           return _ch16.buildIntroContent();
      case LessonType.ch16PresentIsAmAre:  return _ch16.buildPresentIsAmAreContent();
      case LessonType.ch16PresentHasHave:  return _ch16.buildPresentHasHaveContent();
      case LessonType.ch16PastWasWere:     return _ch16.buildPastWasWereContent();
      case LessonType.ch16PastHad:         return _ch16.buildPastHadContent();
      case LessonType.ch16Future:          return _ch16.buildFutureContent();
      case LessonType.ch16Practice:        return _ch16.buildPracticeContent();
      case LessonType.ch16SingularPlural:  return _ch16.buildSingularPluralContent();
      case LessonType.ch16TestPaper:       return _ch16.buildTestPaperContent();
      case LessonType.ch16ChapterQuiz:     return _ch16.buildChapterQuizIntro();
      case LessonType.ch17Concept1:        return _ch17.buildConcept1Content();
      case LessonType.ch17Concept2:        return _ch17.buildConcept2Content();
      case LessonType.ch17Practice:        return _ch17.buildPracticeContent();
      case LessonType.ch17TestPaper:       return _ch17.buildTestPaperContent();
      case LessonType.ch17ChapterQuiz:     return _ch17.buildChapterQuizIntro();
      case LessonType.ch18PositionWords:   return _ch18.buildPositionWordsContent();
      case LessonType.ch18AheadVsFront:    return _ch18.buildAheadVsFrontContent();
      case LessonType.ch18Practice:        return _ch18.buildPracticeContent();
      case LessonType.ch18TestPaper:       return _ch18.buildTestPaperContent();
      case LessonType.ch18ChapterQuiz:     return _ch18.buildChapterQuizIntro();
      case LessonType.ch19Intro:                    return _ch19.buildIntroContent();
      case LessonType.ch19PresentIndefiniteAff:     return _ch19.buildPresentIndefiniteAffContent();
      case LessonType.ch19PresentIndefiniteNeg:     return _ch19.buildPresentIndefiniteNegContent();
      case LessonType.ch19PresentContinuous:        return _ch19.buildPresentContinuousContent();
      case LessonType.ch19PresentPerfect:           return _ch19.buildPresentPerfectContent();
      case LessonType.ch19PresentPerfectContinuous: return _ch19.buildPresentPerfectContinuousContent();
      case LessonType.ch19PastIndefinite:           return _ch19.buildPastIndefiniteContent();
      case LessonType.ch19PastContinuous:           return _ch19.buildPastContinuousContent();
      case LessonType.ch19PastPerfect:              return _ch19.buildPastPerfectContent();
      case LessonType.ch19PastPerfectContinuous:    return _ch19.buildPastPerfectContinuousContent();
      case LessonType.ch19FutureIndefinite:         return _ch19.buildFutureIndefiniteContent();
      case LessonType.ch19FutureContinuous:         return _ch19.buildFutureContinuousContent();
      case LessonType.ch19FuturePerfect:            return _ch19.buildFuturePerfectContent();
      case LessonType.ch19FuturePerfectContinuous:  return _ch19.buildFuturePerfectContinuousContent();
      case LessonType.ch19Practice:                 return _ch19.buildPracticeContent();
      case LessonType.ch19TestPaper1:               return _ch19.buildTestPaper1Content();
      case LessonType.ch19TestPaper2:               return _ch19.buildTestPaper2Content();
      case LessonType.ch19ChapterQuiz:              return _ch19.buildChapterQuizIntro();
      case LessonType.ch20Concept1:    return _ch20.buildConcept1Content();
      case LessonType.ch20Concept2:    return _ch20.buildConcept2Content();
      case LessonType.ch20Concept3:    return _ch20.buildConcept3Content();
      case LessonType.ch20Concept4:    return _ch20.buildConcept4Content();
      case LessonType.ch20Practice:    return _ch20.buildPracticeContent();
      case LessonType.ch20TestPaper1:  return _ch20.buildTestPaper1Content();
      case LessonType.ch20TestPaper2:  return _ch20.buildTestPaper2Content();
      case LessonType.ch20ChapterQuiz: return _ch20.buildChapterQuizIntro();
      case LessonType.ch21Overview:    return _ch21.buildOverviewContent();
      case LessonType.ch21CanCould:    return _ch21.buildCanCouldContent();
      case LessonType.ch21MayMight:    return _ch21.buildMayMightContent();
      case LessonType.ch21ShouldMust:  return _ch21.buildShouldMustContent();
      case LessonType.ch21HasTo:       return _ch21.buildHasToContent();
      case LessonType.ch21UsedTo:      return _ch21.buildUsedToContent();
      case LessonType.ch21NeedDare:    return _ch21.buildNeedDareContent();
      case LessonType.ch21WillRule:    return _ch21.buildWillRuleContent();
      case LessonType.ch21Practice:    return _ch21.buildPracticeContent();
      case LessonType.ch21TestPaper1:  return _ch21.buildTestPaper1Content();
      case LessonType.ch21TestPaper2:  return _ch21.buildTestPaper2Content();
      case LessonType.ch21ChapterQuiz: return _ch21.buildChapterQuizIntro();
      case LessonType.ch22Intro:       return _ch22.buildIntroContent();
      case LessonType.ch22Because:     return _ch22.buildBecauseContent();
      case LessonType.ch22AsAs:        return _ch22.buildAsAsContent();
      case LessonType.ch22AsGroup:     return _ch22.buildAsGroupContent();
      case LessonType.ch22IfAlthough:  return _ch22.buildIfAlthoughContent();
      case LessonType.ch22WH:          return _ch22.buildWHContent();
      case LessonType.ch22Special:     return _ch22.buildSpecialContent();
      case LessonType.ch22Practice:    return _ch22.buildPracticeContent();
      case LessonType.ch22TestPaper:   return _ch22.buildTestPaperContent();
      case LessonType.ch22ChapterQuiz: return _ch22.buildChapterQuizIntro();
      case LessonType.ch23Intro:       return _ch23.buildIntroContent();
      case LessonType.ch23Let:         return _ch23.buildLetContent();
      case LessonType.ch23Quotations:  return _ch23.buildQuotationsContent();
      case LessonType.ch23Practice:    return _ch23.buildPracticeContent();
      case LessonType.ch23TestPaper1:  return _ch23.buildTestPaper1Content();
      case LessonType.ch23TestPaper2:  return _ch23.buildTestPaper2Content();
      case LessonType.ch23ChapterQuiz: return _ch23.buildChapterQuizIntro();
      case LessonType.ch24Intro:       return _ch24.buildIntroContent();
      case LessonType.ch24Tenses:      return _ch24.buildTensesContent();
      case LessonType.ch24Quotations:  return _ch24.buildQuotationsContent();
      case LessonType.ch24Practice:    return _ch24.buildPracticeContent();
      case LessonType.ch24TestPaper1:  return _ch24.buildTestPaper1Content();
      case LessonType.ch24TestPaper2:  return _ch24.buildTestPaper2Content();
      case LessonType.ch24ChapterQuiz: return _ch24.buildChapterQuizIntro();
      case LessonType.ch25Intro:       return _ch25.buildIntroContent();
      case LessonType.ch25Get:         return _ch25.buildGetContent();
      case LessonType.ch25Make:        return _ch25.buildMakeContent();
      case LessonType.ch25Special:     return _ch25.buildSpecialContent();
      case LessonType.ch25Practice:    return _ch25.buildPracticeContent();
      case LessonType.ch25TestPaper1:  return _ch25.buildTestPaper1Content();
      case LessonType.ch25TestPaper2:  return _ch25.buildTestPaper2Content();
      case LessonType.ch25ChapterQuiz: return _ch25.buildChapterQuizIntro();
      case LessonType.ch26Intro:          return _ch26.buildIntroContent();
      case LessonType.ch26PassiveTenses:  return _ch26.buildPassiveTensesContent();
      case LessonType.ch26PassiveModals:  return _ch26.buildPassiveModalsContent();
      case LessonType.ch26PassiveLet:     return _ch26.buildPassiveLetContent();
      case LessonType.ch26Practice:       return _ch26.buildPracticeContent();
      case LessonType.ch26TestPaper1:     return _ch26.buildTestPaper1Content();
      case LessonType.ch26TestPaper2:     return _ch26.buildTestPaper2Content();
      case LessonType.ch26ChapterQuiz:    return _ch26.buildChapterQuizIntro();
      case LessonType.ch27GetSick:     return _ch27.buildGetSickContent();
      case LessonType.ch27FondMeant:   return _ch27.buildFondMeantContent();
      case LessonType.ch27MadeInOf:    return _ch27.buildMadeInOfContent();
      case LessonType.ch27AbleHowTo:   return _ch27.buildAbleHowToContent();
      case LessonType.ch27KeepHaving:  return _ch27.buildKeepHavingContent();
      case LessonType.ch27SpecialMore: return _ch27.buildSpecialMoreContent();
      case LessonType.ch27TheVeryOrSo: return _ch27.buildTheVeryOrSoContent();
      case LessonType.ch27Practice:    return _ch27.buildPracticeContent();
      case LessonType.ch27TestPaper:   return _ch27.buildTestPaperContent();
      case LessonType.ch27ChapterQuiz: return _ch27.buildChapterQuizIntro();
      case LessonType.ch28Intro:         return _ch28.buildIntroContent();
      case LessonType.ch28CommonFillers: return _ch28.buildCommonFillersContent();
      case LessonType.ch28InSentences:   return _ch28.buildInSentencesContent();
      case LessonType.ch28Quotations:    return _ch28.buildQuotationsContent();
      case LessonType.ch28ChapterQuiz:   return _ch28.buildChapterQuizIntro();
      case LessonType.ch29Intro:       return _ch29.buildIntroContent();
      case LessonType.ch29Scenario1:   return _ch29.buildScenario1Content();
      case LessonType.ch29Scenario2:   return _ch29.buildScenario2Content();
      case LessonType.ch29ChapterQuiz: return _ch29.buildChapterQuizIntro();
      case LessonType.ch30Get:             return _ch30.buildGetContent();
      case LessonType.ch30RunTurn:         return _ch30.buildRunTurnContent();
      case LessonType.ch30PutGo:           return _ch30.buildPutGoContent();
      case LessonType.ch30BreakComeLook:   return _ch30.buildBreakComeLookContent();
      case LessonType.ch30Others:          return _ch30.buildOthersContent();
      case LessonType.ch30ChapterQuiz:     return _ch30.buildChapterQuizIntro();
      case LessonType.ch31GroupA:      return _ch31.buildGroupAContent();
      case LessonType.ch31GroupB:      return _ch31.buildGroupBContent();
      case LessonType.ch31ChapterQuiz: return _ch31.buildChapterQuizIntro();
      case LessonType.ch32Ex1A:        return _ch32.buildEx1AContent();
      case LessonType.ch32Ex1B:        return _ch32.buildEx1BContent();
      case LessonType.ch32Ex1C:        return _ch32.buildEx1CContent();
      case LessonType.ch32Ex2:         return _ch32.buildEx2Content();
      case LessonType.ch32ChapterQuiz: return _ch32.buildChapterQuizIntro();
      case LessonType.ch33PartA:       return _ch33.buildPartAContent();
      case LessonType.ch33PartB:       return _ch33.buildPartBContent();
      case LessonType.ch33ChapterQuiz: return _ch33.buildChapterQuizIntro();
      case LessonType.ch34Intro:       return _ch34.buildIntroContent();
      case LessonType.ch34Set1:        return _ch34.buildSet1Content();
      case LessonType.ch34Set2:        return _ch34.buildSet2Content();
      case LessonType.ch34Set3:        return _ch34.buildSet3Content();
      case LessonType.ch34Set4:        return _ch34.buildSet4Content();
      case LessonType.ch34Set5:        return _ch34.buildSet5Content();
      case LessonType.ch34ChapterQuiz: return _ch34.buildChapterQuizIntro();
      case LessonType.ch35Polite:      return _ch35.buildPoliteContent();
      case LessonType.ch35Questions1:  return _ch35.buildQuestions1Content();
      case LessonType.ch35Questions2:  return _ch35.buildQuestions2Content();
      case LessonType.ch35Emotions:    return _ch35.buildEmotionsContent();
      case LessonType.ch35Complex:     return _ch35.buildComplexContent();
      case LessonType.ch35ChapterQuiz: return _ch35.buildChapterQuizIntro();
      case LessonType.ch36Verbs1:      return _ch36.buildVerbs1Content();
      case LessonType.ch36Verbs2:      return _ch36.buildVerbs2Content();
      case LessonType.ch36Articles1:   return _ch36.buildArticles1Content();
      case LessonType.ch36Articles2:   return _ch36.buildArticles2Content();
      case LessonType.ch36Prep1:       return _ch36.buildPrep1Content();
      case LessonType.ch36Prep2:       return _ch36.buildPrep2Content();
      case LessonType.ch36ChapterQuiz: return _ch36.buildChapterQuizIntro();
      case LessonType.ch37Ex1A:        return _ch37.buildEx1AContent();
      case LessonType.ch37Ex1B:        return _ch37.buildEx1BContent();
      case LessonType.ch37Ex2A:        return _ch37.buildEx2AContent();
      case LessonType.ch37Ex2B:        return _ch37.buildEx2BContent();
      case LessonType.ch37ChapterQuiz: return _ch37.buildChapterQuizIntro();
      case LessonType.ch38Set1:        return _ch38.buildSet1Content();
      case LessonType.ch38Set2:        return _ch38.buildSet2Content();
      case LessonType.ch38Set3:        return _ch38.buildSet3Content();
      case LessonType.ch38ChapterQuiz: return _ch38.buildChapterQuizIntro();
      case LessonType.ch39Test1:       return _ch39.buildTest1Content();
      case LessonType.ch39Test2:       return _ch39.buildTest2Content();
      case LessonType.ch39Test3:       return _ch39.buildTest3Content();
      case LessonType.ch39Test4:       return _ch39.buildTest4Content();
      case LessonType.ch39ChapterQuiz: return _ch39.buildChapterQuizIntro();
      case LessonType.ch40EnToHi1:     return _ch40.buildEnToHi1Content();
      case LessonType.ch40EnToHi2:     return _ch40.buildEnToHi2Content();
      case LessonType.ch40HiToEn1:     return _ch40.buildHiToEn1Content();
      case LessonType.ch40HiToEn2:     return _ch40.buildHiToEn2Content();
      case LessonType.ch40ChapterQuiz: return _ch40.buildChapterQuizIntro();
      case LessonType.ch41Conv1:       return _ch41.buildConv1Content();
      case LessonType.ch41Conv2:       return _ch41.buildConv2Content();
      case LessonType.ch41Conv3:       return _ch41.buildConv3Content();
      case LessonType.ch41Conv4:       return _ch41.buildConv4Content();
      case LessonType.ch41Conv5:       return _ch41.buildConv5Content();
      case LessonType.ch41Conv6:       return _ch41.buildConv6Content();
      case LessonType.ch41Conv7:       return _ch41.buildConv7Content();
      case LessonType.ch41Conv8:       return _ch41.buildConv8Content();
      case LessonType.ch41Conv9:       return _ch41.buildConv9Content();
      case LessonType.ch41Conv10:      return _ch41.buildConv10Content();
      case LessonType.ch41Conv11:      return _ch41.buildConv11Content();
      case LessonType.ch41Conv12:      return _ch41.buildConv12Content();
      case LessonType.ch41Conv13:      return _ch41.buildConv13Content();
      case LessonType.ch41Conv14:      return _ch41.buildConv14Content();
      case LessonType.ch41Conv15:      return _ch41.buildConv15Content();
      case LessonType.ch41Conv16:      return _ch41.buildConv16Content();
      case LessonType.ch41Conv17:      return _ch41.buildConv17Content();
      case LessonType.ch41Conv18:      return _ch41.buildConv18Content();
      case LessonType.ch41Conv19:      return _ch41.buildConv19Content();
      case LessonType.ch41Conv20:      return _ch41.buildConv20Content();
      case LessonType.ch41Conv21:      return _ch41.buildConv21Content();
      case LessonType.ch41Conv22:      return _ch41.buildConv22Content();
      case LessonType.ch41Conv23:      return _ch41.buildConv23Content();
      case LessonType.ch41Conv24:      return _ch41.buildConv24Content();
      case LessonType.ch41Conv25:      return _ch41.buildConv25Content();
      case LessonType.ch41Conv26:      return _ch41.buildConv26Content();
      case LessonType.ch41Conv27:      return _ch41.buildConv27Content();
      case LessonType.ch41Conv28:      return _ch41.buildConv28Content();
      case LessonType.ch41Conv29:      return _ch41.buildConv29Content();
      case LessonType.ch41Conv30:      return _ch41.buildConv30Content();
      case LessonType.ch41ChapterQuiz: return _ch41.buildChapterQuizIntro();
      case LessonType.ch42Passages1:   return _ch42.buildPassages1Content();
      case LessonType.ch42Passages2:   return _ch42.buildPassages2Content();
      case LessonType.ch42ChapterQuiz: return _ch42.buildChapterQuizIntro();
      case LessonType.ch43Intro:       return _ch43.buildIntroContent();
      case LessonType.ch43IdiomsA:     return _ch43.buildIdiomsAContent();
      case LessonType.ch43IdiomsB:     return _ch43.buildIdiomsBContent();
      case LessonType.ch43IdiomsC:     return _ch43.buildIdiomsCContent();
      case LessonType.ch43Proverbs:    return _ch43.buildProverbsContent();
      case LessonType.ch43ChapterQuiz: return _ch43.buildChapterQuizIntro();
      case LessonType.ch44Tips:        return _ch44.buildTipsContent();
      case LessonType.ch44Interview1:  return _ch44.buildInterview1Content();
      case LessonType.ch44Interview2:  return _ch44.buildInterview2Content();
      case LessonType.ch44Interview3:  return _ch44.buildInterview3Content();
      case LessonType.ch44Interview4:  return _ch44.buildInterview4Content();
      case LessonType.ch44Interview5:  return _ch44.buildInterview5Content();
      case LessonType.ch44Interview6:  return _ch44.buildInterview6Content();
      case LessonType.ch44Phrases:     return _ch44.buildPhrasesContent();
      case LessonType.ch44Mock:        return _ch44.buildMockContent();
      case LessonType.ch44ChapterQuiz: return _ch44.buildChapterQuizIntro();
      case LessonType.ch45DictAE:      return _ch45.buildDictAEContent();
      case LessonType.ch45DictFJ:      return _ch45.buildDictFJContent();
      case LessonType.ch45DictKO:      return _ch45.buildDictKOContent();
      case LessonType.ch45DictPS:      return _ch45.buildDictPSContent();
      case LessonType.ch45DictTZ:      return _ch45.buildDictTZContent();
      case LessonType.ch45POS:         return _ch45.buildPOSContent();
      case LessonType.ch45QuizEN:      return _ch45.buildPOSContent();
      case LessonType.ch45QuizHI:      return _ch45.buildPOSContent();
      case LessonType.ch45QuizPOS:     return _ch45.buildPOSContent();
      case LessonType.ch45ChapterQuiz: return _ch45.buildChapterQuizIntro();
      default:                         return _ch1.buildAlphabetContent();
    }
  }
}