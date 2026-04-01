import '../models/lesson_model.dart';
import 'chapter2_data.dart';
import 'chapter3_data.dart';
import 'chapter4_data.dart';
import 'chapter5_data.dart';
import 'chapter6_data.dart';
import 'chapter7_data.dart';
import 'chapter8_data.dart';
import 'chapter9_data.dart';
import 'chapter10_data.dart';
import 'chapter11_data.dart';
import 'chapter12_data.dart';
import 'chapter13_data.dart';
import 'chapter14_data.dart';
import 'chapter15_data.dart';
import 'chapter16_data.dart';
import 'chapter17_data.dart';
import 'chapter18_data.dart';
import 'chapter19_data.dart';
import 'chapter20_data.dart';
import 'chapter21_data.dart';
import 'chapter22_data.dart';
import 'chapter23_data.dart';
import 'chapter24_data.dart';
import 'chapter25_data.dart';
import 'chapter26_data.dart';
import 'chapter27_data.dart';
import 'chapter28_data.dart';
import 'chapter29_data.dart';
import 'chapter30_data.dart';
import 'chapter31_data.dart';
import 'chapter32_data.dart';
import 'chapter33_data.dart';
import 'chapter34_data.dart';
import 'chapter35_data.dart';
import 'chapter36_data.dart';
import 'chapter37_data.dart';
import 'chapter38_data.dart';
import 'chapter39_data.dart';
import 'chapter40_data.dart';
import 'chapter41_data.dart';
import 'chapter42_data.dart';
import 'chapter43_data.dart';
import 'chapter44_data.dart';
import 'chapter45_data.dart';

class Chapter1Data {
  static List<ChapterModel> get chapters => [
        ChapterModel(
          id: 1,
          title: 'Before We Start',
          titleHindi: 'शुरुआत से पहले',
          description: 'Alphabets, Greetings & Basics',
          status: LessonStatus.inProgress,
          lessons: [
            LessonModel(
                id: 1,
                title: 'Alphabets',
                titleHindi: 'वर्णमाला',
                emoji: '🔤',
                type: LessonType.alphabets,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 2,
                title: 'Vowels & Consonants',
                titleHindi: 'स्वर और व्यंजन',
                emoji: '🗣️',
                type: LessonType.vowelsConsonants,
                status: LessonStatus.locked,
                xpEarned: 0),
            LessonModel(
                id: 3,
                title: 'Greetings',
                titleHindi: 'अभिवादन',
                emoji: '👋',
                type: LessonType.greetings,
                status: LessonStatus.locked,
                xpEarned: 0),
            LessonModel(
                id: 4,
                title: 'Manners',
                titleHindi: 'शिष्टाचार',
                emoji: '🙏',
                type: LessonType.manners,
                status: LessonStatus.locked,
                xpEarned: 0),
            LessonModel(
                id: 5,
                title: 'Days & Months',
                titleHindi: 'दिन और महीने',
                emoji: '📅',
                type: LessonType.daysMonths,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 6,
                title: 'Numbers',
                titleHindi: 'संख्याएँ',
                emoji: '🔢',
                type: LessonType.numbers,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 7,
                title: 'Telling Time',
                titleHindi: 'समय बताना',
                emoji: '🕐',
                type: LessonType.time,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 8,
                title: 'Punctuation',
                titleHindi: 'विराम चिह्न',
                emoji: '✍️',
                type: LessonType.punctuation,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 9,
                title: 'Contractions',
                titleHindi: 'संकुचन',
                emoji: '🔗',
                type: LessonType.contractions,
                status: LessonStatus.inProgress,
                xpEarned: 0),
            LessonModel(
                id: 31,
                title: 'Chapter Quiz',
                titleHindi: 'अध्याय क्विज़',
                emoji: '🏆',
                type: LessonType.chapterQuiz,
                status: LessonStatus.inProgress,
                totalXP: 100),
          ],
        ),
        Chapter2Data.chapter,
        Chapter3Data.chapter,
        Chapter4Data.chapter,
        Chapter5Data.chapter,
        Chapter6Data.chapter,
        Chapter7Data.chapter,
        Chapter8Data.chapter,
        Chapter9Data.chapter,
        Chapter10Data.chapter,
        Chapter11Data.chapter,
        Chapter12Data.chapter,
        Chapter13Data.chapter,
        Chapter14Data.chapter,
        Chapter15Data.chapter,
        Chapter16Data.chapter,
        Chapter17Data.chapter,
        Chapter18Data.chapter,
        Chapter19Data.chapter,
        Chapter20Data.chapter,
        Chapter21Data.chapter,
        Chapter22Data.chapter,
        Chapter23Data.chapter,
        Chapter24Data.chapter,
        Chapter25Data.chapter,
        Chapter26Data.chapter,
        Chapter27Data.chapter,
        Chapter28Data.chapter,
        Chapter29Data.chapter,
        Chapter30Data.chapter,
        Chapter31Data.chapter,
        Chapter32Data.chapter,
        Chapter33Data.chapter,
        Chapter34Data.chapter,
        Chapter35Data.chapter,
        Chapter36Data.chapter,
        Chapter37Data.chapter,
        Chapter38Data.chapter,
        Chapter39Data.chapter,
        Chapter40Data.chapter,
        Chapter41Data.chapter,
        Chapter42Data.chapter,
        Chapter44Data.chapter,
        Chapter45Data.chapter,
      ];

  static List<QuizQuestion> questionsForLesson(LessonType type) {
    switch (type) {
      case LessonType.alphabets:
        return alphabetQuestions;
      case LessonType.vowelsConsonants:
        return vowelConsonantQuestions;
      case LessonType.greetings:
        return greetingQuestions;
      case LessonType.manners:
        return mannersQuestions;
      case LessonType.daysMonths:
        return daysMonthsQuestions;
      case LessonType.numbers:
        return numbersQuestions;
      case LessonType.time:
        return timeQuestions;
      case LessonType.punctuation:
        return punctuationQuestions;
      case LessonType.contractions:
        return contractionQuestions;
      case LessonType.chapterQuiz:
        return chapterFinalQuestions;
      case LessonType.ch02SentenceTypes:
        return Chapter2Data.sentenceTypesQuestions;
      case LessonType.ch02SVO:
        return Chapter2Data.svoQuestions;
      case LessonType.ch02Pronouns:
        return Chapter2Data.pronounsQuestions;
      case LessonType.ch02Apostrophe:
        return Chapter2Data.apostropheQuestions;
      case LessonType.ch02Phrases:
        return Chapter2Data.phrasesQuestions;
      case LessonType.ch02Adjectives:
        return Chapter2Data.adjectivesQuestions;
      case LessonType.ch02ChapterQuiz:
        return Chapter2Data.chapterFinalQuestions;
      case LessonType.ch3Intro:
        return Chapter3Data.introVowelAQuestions;
      case LessonType.ch3VowelEI:
        return Chapter3Data.vowelEIQuestions;
      case LessonType.ch3VowelOU:
        return Chapter3Data.vowelOUQuestions;
      case LessonType.ch3SoundsSH:
        return Chapter3Data.soundsSHQuestions;
      case LessonType.ch3SoundsJZ:
        return Chapter3Data.soundsJZQuestions;
      case LessonType.ch3ChapterQuiz:
        return Chapter3Data.chapterFinalQuestions;
      case LessonType.ch4Ex1:
        return Chapter4Data.ex1Questions;
      case LessonType.ch4Ex2:
        return Chapter4Data.ex2Questions;
      case LessonType.ch4Ex3:
        return Chapter4Data.ex3Questions;
      case LessonType.ch4Ex4:
        return Chapter4Data.ex4Questions;
      case LessonType.ch4Ex5:
        return Chapter4Data.ex5Questions;
      case LessonType.ch4ChapterQuiz:
        return Chapter4Data.chapterFinalQuestions;
      case LessonType.ch5WHBasics:
        return Chapter5Data.whBasicsQuestions;
      case LessonType.ch5HowCombos:
        return Chapter5Data.howCombosQuestions;
      case LessonType.ch5WhomWhere:
        return Chapter5Data.whomWhereQuestions;
      case LessonType.ch5WhichWhose:
        return Chapter5Data.whichWhoseQuestions;
      case LessonType.ch5WHPhrases:
        return Chapter5Data.whPhrasesQuestions;
      case LessonType.ch5ChapterQuiz:
        return Chapter5Data.chapterFinalQuestions;
      case LessonType.ch6POS1:
        return Chapter6Data.pos1Questions;
      case LessonType.ch6POS2:
        return Chapter6Data.pos2Questions;
      case LessonType.ch6POS3:
        return Chapter6Data.pos3Questions;
      case LessonType.ch6ChapterQuiz:
        return Chapter6Data.chapterFinalQuestions;
      case LessonType.ch7NounProper:
        return Chapter7Data.properCommonQuestions;
      case LessonType.ch7NounCollective:
        return Chapter7Data.collectiveAbstractQuestions;
      case LessonType.ch7NounGerund:
        return Chapter7Data.gerundCountableQuestions;
      case LessonType.ch7NounGender:
        return Chapter7Data.genderNumberQuestions;
      case LessonType.ch7ChapterQuiz:
        return Chapter7Data.chapterFinalQuestions;
      case LessonType.ch8Intro:
        return Chapter8Data.introQuestions;
      case LessonType.ch8SubjObj:
        return Chapter8Data.subjObjQuestions;
      case LessonType.ch8Possessive:
        return Chapter8Data.possessiveQuestions;
      case LessonType.ch8Reflexive:
        return Chapter8Data.reflexiveQuestions;
      case LessonType.ch8MyMine:
        return Chapter8Data.myMineQuestions;
      case LessonType.ch8ChapterQuiz:
        return Chapter8Data.chapterFinalQuestions;
      case LessonType.ch9Intro:
        return Chapter9Data.introQuestions;
      case LessonType.ch9Degrees:
        return Chapter9Data.degreesQuestions;
      case LessonType.ch9ErEst:
        return Chapter9Data.erEstQuestions;
      case LessonType.ch9MoreMost:
        return Chapter9Data.moreMotQuestions;
      case LessonType.ch9Irregular:
        return Chapter9Data.irregularQuestions;
      case LessonType.ch9ChapterQuiz:
        return Chapter9Data.chapterFinalQuestions;
      case LessonType.ch10Intro:
        return Chapter10Data.introQuestions;
      case LessonType.ch10Forms1:
        return Chapter10Data.forms1Questions;
      case LessonType.ch10Forms2:
        return Chapter10Data.forms2Questions;
      case LessonType.ch10Forms3:
        return Chapter10Data.forms3Questions;
      case LessonType.ch10Special:
        return Chapter10Data.specialQuestions;
      case LessonType.ch10ChapterQuiz:
        return Chapter10Data.chapterFinalQuestions;
      case LessonType.ch11Intro:
        return Chapter11Data.introQuestions;
      case LessonType.ch11Degrees:
        return Chapter11Data.degreesQuestions;
      case LessonType.ch11Examples1:
        return Chapter11Data.examples1Questions;
      case LessonType.ch11Examples2:
        return Chapter11Data.examples2Questions;
      case LessonType.ch11Examples3:
        return Chapter11Data.examples3Questions;
      case LessonType.ch11ChapterQuiz:
        return Chapter11Data.chapterFinalQuestions;
      case LessonType.ch12Intro:
        return Chapter12Data.introQuestions;
      case LessonType.ch12JoyGrief:
        return Chapter12Data.joyGriefQuestions;
      case LessonType.ch12SurpriseConsent:
        return Chapter12Data.surpriseConsentQuestions;
      case LessonType.ch12Everyday:
        return Chapter12Data.everydayQuestions;
      case LessonType.ch12ChapterQuiz:
        return Chapter12Data.chapterFinalQuestions;
      case LessonType.ch13Intro:
        return Chapter13Data.introQuestions;
      case LessonType.ch13AvsAn:
        return Chapter13Data.aVsAnQuestions;
      case LessonType.ch13ThePronun:
        return Chapter13Data.thePronunQuestions;
      case LessonType.ch13TheUse:
        return Chapter13Data.theUseQuestions;
      case LessonType.ch13TheNotUse:
        return Chapter13Data.theNotUseQuestions;
      case LessonType.ch13ChapterQuiz:
        return Chapter13Data.chapterFinalQuestions;
      case LessonType.ch14Intro:
        return Chapter14Data.introQuestions;
      case LessonType.ch14Part1:
        return Chapter14Data.part1Questions;
      case LessonType.ch14Part2:
        return Chapter14Data.part2Questions;
      case LessonType.ch14Part3:
        return Chapter14Data.part3Questions;
      case LessonType.ch14Part4:
        return Chapter14Data.part4Questions;
      case LessonType.ch14Part5:
        return Chapter14Data.part5Questions;
      case LessonType.ch14Part6:
        return Chapter14Data.part6Questions;
      case LessonType.ch14Part7:
        return Chapter14Data.part7Questions;
      case LessonType.ch14ChapterQuiz:
        return Chapter14Data.chapterFinalQuestions;
      case LessonType.ch15Intro:
        return Chapter15Data.introQuestions;
      case LessonType.ch15Demonstratives:
        return Chapter15Data.demonstrativeQuestions;
      case LessonType.ch15Possessives:
        return Chapter15Data.possessiveQuestions;
      case LessonType.ch15Quantifiers1:
        return Chapter15Data.quantifier1Questions;
      case LessonType.ch15Quantifiers2:
        return Chapter15Data.quantifier2Questions;
      case LessonType.ch15ChapterQuiz:
        return Chapter15Data.chapterFinalQuestions;
      case LessonType.ch16Intro:
        return Chapter16Data.introQuestions;
      case LessonType.ch16PresentIsAmAre:
        return Chapter16Data.presentIsAmAreQuestions;
      case LessonType.ch16PresentHasHave:
        return Chapter16Data.presentHasHaveQuestions;
      case LessonType.ch16PastWasWere:
        return Chapter16Data.pastWasWereQuestions;
      case LessonType.ch16PastHad:
        return Chapter16Data.pastHadQuestions;
      case LessonType.ch16Future:
        return Chapter16Data.futureQuestions;
      case LessonType.ch16Practice:
        return Chapter16Data.practiceQuizQuestions;
      case LessonType.ch16SingularPlural:
        return Chapter16Data.singularPluralQuestions;
      case LessonType.ch16TestPaper:
        return Chapter16Data.testPaperQuizQuestions;
      case LessonType.ch16ChapterQuiz:
        return Chapter16Data.chapterFinalQuestions;
      case LessonType.ch17Concept1:
        return Chapter17Data.concept1Questions;
      case LessonType.ch17Concept2:
        return Chapter17Data.concept2Questions;
      case LessonType.ch17Practice:
        return Chapter17Data.practiceQuizQuestions;
      case LessonType.ch17TestPaper:
        return Chapter17Data.testPaperQuizQuestions;
      case LessonType.ch17ChapterQuiz:
        return Chapter17Data.chapterFinalQuestions;
      case LessonType.ch18PositionWords:
        return Chapter18Data.positionWordsQuestions;
      case LessonType.ch18AheadVsFront:
        return Chapter18Data.aheadVsFrontQuestions;
      case LessonType.ch18Practice:
        return Chapter18Data.practiceQuizQuestions;
      case LessonType.ch18TestPaper:
        return Chapter18Data.testPaperQuizQuestions;
      case LessonType.ch18ChapterQuiz:
        return Chapter18Data.chapterFinalQuestions;
      case LessonType.ch19Intro:
        return Chapter19Data.introQuestions;
      case LessonType.ch19PresentIndefiniteAff:
        return Chapter19Data.presentIndefiniteAffQuestions;
      case LessonType.ch19PresentIndefiniteNeg:
        return Chapter19Data.presentIndefiniteNegQuestions;
      case LessonType.ch19PresentContinuous:
        return Chapter19Data.presentContinuousQuestions;
      case LessonType.ch19PresentPerfect:
        return Chapter19Data.presentPerfectQuestions;
      case LessonType.ch19PresentPerfectContinuous:
        return Chapter19Data.presentPerfectContinuousQuestions;
      case LessonType.ch19PastIndefinite:
        return Chapter19Data.pastIndefiniteQuestions;
      case LessonType.ch19PastContinuous:
        return Chapter19Data.pastContinuousQuestions;
      case LessonType.ch19PastPerfect:
        return Chapter19Data.pastPerfectQuestions;
      case LessonType.ch19PastPerfectContinuous:
        return Chapter19Data.pastPerfectContinuousQuestions;
      case LessonType.ch19FutureIndefinite:
        return Chapter19Data.futureIndefiniteQuestions;
      case LessonType.ch19FutureContinuous:
        return Chapter19Data.futureContinuousQuestions;
      case LessonType.ch19FuturePerfect:
        return Chapter19Data.futurePerfectQuestions;
      case LessonType.ch19FuturePerfectContinuous:
        return Chapter19Data.futurePerfectContinuousQuestions;
      case LessonType.ch19Practice:
        return Chapter19Data.practiceQuizQuestions;
      case LessonType.ch19TestPaper1:
        return Chapter19Data.testPaper1QuizQuestions;
      case LessonType.ch19TestPaper2:
        return Chapter19Data.testPaper2QuizQuestions;
      case LessonType.ch19ChapterQuiz:
        return Chapter19Data.chapterFinalQuestions;
      case LessonType.ch20Concept1:
        return Chapter20Data.concept1Questions;
      case LessonType.ch20Concept2:
        return Chapter20Data.concept2Questions;
      case LessonType.ch20Concept3:
        return Chapter20Data.concept3Questions;
      case LessonType.ch20Concept4:
        return Chapter20Data.concept4Questions;
      case LessonType.ch20Practice:
        return Chapter20Data.practiceQuizQuestions;
      case LessonType.ch20TestPaper1:
        return Chapter20Data.testPaper1QuizQuestions;
      case LessonType.ch20TestPaper2:
        return Chapter20Data.testPaper2QuizQuestions;
      case LessonType.ch20ChapterQuiz:
        return Chapter20Data.chapterFinalQuestions;
      case LessonType.ch21Overview:
        return Chapter21Data.overviewQuestions;
      case LessonType.ch21CanCould:
        return Chapter21Data.canCouldQuestions;
      case LessonType.ch21MayMight:
        return Chapter21Data.mayMightQuestions;
      case LessonType.ch21ShouldMust:
        return Chapter21Data.shouldMustQuestions;
      case LessonType.ch21HasTo:
        return Chapter21Data.hasToQuestions;
      case LessonType.ch21UsedTo:
        return Chapter21Data.usedToQuestions;
      case LessonType.ch21NeedDare:
        return Chapter21Data.needDareQuestions;
      case LessonType.ch21WillRule:
        return Chapter21Data.willRuleQuestions;
      case LessonType.ch21Practice:
        return Chapter21Data.practiceQuizQuestions;
      case LessonType.ch21TestPaper1:
        return Chapter21Data.testPaper1QuizQuestions;
      case LessonType.ch21TestPaper2:
        return Chapter21Data.testPaper2QuizQuestions;
      case LessonType.ch21ChapterQuiz:
        return Chapter21Data.chapterFinalQuestions;
      case LessonType.ch22Intro:
        return Chapter22Data.introQuestions;
      case LessonType.ch22Because:
        return Chapter22Data.becauseQuestions;
      case LessonType.ch22AsAs:
        return Chapter22Data.asAsQuestions;
      case LessonType.ch22AsGroup:
        return Chapter22Data.asGroupQuestions;
      case LessonType.ch22IfAlthough:
        return Chapter22Data.ifAlthoughQuestions;
      case LessonType.ch22WH:
        return Chapter22Data.whQuestions;
      case LessonType.ch22Special:
        return Chapter22Data.specialQuestions;
      case LessonType.ch22Practice:
        return Chapter22Data.practiceQuizQuestions;
      case LessonType.ch22TestPaper:
        return Chapter22Data.testPaperQuizQuestions;
      case LessonType.ch22ChapterQuiz:
        return Chapter22Data.chapterFinalQuestions;
      case LessonType.ch23Intro:
        return Chapter23Data.introQuestions;
      case LessonType.ch23Let:
        return Chapter23Data.letQuestions;
      case LessonType.ch23Quotations:
        return Chapter23Data.quotationQuestions;
      case LessonType.ch23Practice:
        return Chapter23Data.practiceQuizQuestions;
      case LessonType.ch23TestPaper1:
        return Chapter23Data.testPaper1QuizQuestions;
      case LessonType.ch23TestPaper2:
        return Chapter23Data.testPaper2QuizQuestions;
      case LessonType.ch23ChapterQuiz:
        return Chapter23Data.chapterFinalQuestions;
      case LessonType.ch24Intro:
        return Chapter24Data.introQuestions;
      case LessonType.ch24Tenses:
        return Chapter24Data.tensesQuestions;
      case LessonType.ch24Quotations:
        return Chapter24Data.quotationQuestions;
      case LessonType.ch24Practice:
        return Chapter24Data.practiceQuizQuestions;
      case LessonType.ch24TestPaper1:
        return Chapter24Data.testPaper1QuizQuestions;
      case LessonType.ch24TestPaper2:
        return Chapter24Data.testPaper2QuizQuestions;
      case LessonType.ch24ChapterQuiz:
        return Chapter24Data.chapterFinalQuestions;
      case LessonType.ch25Intro:
        return Chapter25Data.introQuestions;
      case LessonType.ch25Get:
        return Chapter25Data.getQuestions;
      case LessonType.ch25Make:
        return Chapter25Data.makeQuestions;
      case LessonType.ch25Special:
        return Chapter25Data.specialQuestions;
      case LessonType.ch25Practice:
        return Chapter25Data.practiceQuizQuestions;
      case LessonType.ch25TestPaper1:
        return Chapter25Data.testPaper1QuizQuestions;
      case LessonType.ch25TestPaper2:
        return Chapter25Data.testPaper2QuizQuestions;
      case LessonType.ch25ChapterQuiz:
        return Chapter25Data.chapterFinalQuestions;
      case LessonType.ch26Intro:
        return Chapter26Data.introQuestions;
      case LessonType.ch26PassiveTenses:
        return Chapter26Data.passiveTensesQuestions;
      case LessonType.ch26PassiveModals:
        return Chapter26Data.passiveModalsQuestions;
      case LessonType.ch26PassiveLet:
        return Chapter26Data.passiveLetQuestions;
      case LessonType.ch26Practice:
        return Chapter26Data.practiceQuizQuestions;
      case LessonType.ch26TestPaper1:
        return Chapter26Data.testPaper1QuizQuestions;
      case LessonType.ch26TestPaper2:
        return Chapter26Data.testPaper2QuizQuestions;
      case LessonType.ch26ChapterQuiz:
        return Chapter26Data.chapterFinalQuestions;
      case LessonType.ch27GetSick:
        return Chapter27Data.getSickQuestions;
      case LessonType.ch27FondMeant:
        return Chapter27Data.fondMeantQuestions;
      case LessonType.ch27MadeInOf:
        return Chapter27Data.madeInOfQuestions;
      case LessonType.ch27AbleHowTo:
        return Chapter27Data.ableHowToQuestions;
      case LessonType.ch27KeepHaving:
        return Chapter27Data.keepHavingQuestions;
      case LessonType.ch27SpecialMore:
        return Chapter27Data.specialMoreQuestions;
      case LessonType.ch27TheVeryOrSo:
        return Chapter27Data.theVeryOrSoQuestions;
      case LessonType.ch27Practice:
        return Chapter27Data.practiceQuizQuestions;
      case LessonType.ch27TestPaper:
        return Chapter27Data.testPaperQuizQuestions;
      case LessonType.ch27ChapterQuiz:
        return Chapter27Data.chapterFinalQuestions;
      case LessonType.ch28Intro:
        return Chapter28Data.introQuestions;
      case LessonType.ch28CommonFillers:
        return Chapter28Data.commonFillersQuestions;
      case LessonType.ch28InSentences:
        return Chapter28Data.inSentencesQuestions;
      case LessonType.ch28Quotations:
        return Chapter28Data.quotationQuestions;
      case LessonType.ch28ChapterQuiz:
        return Chapter28Data.chapterFinalQuestions;
      case LessonType.ch29Intro:
        return Chapter29Data.introQuestions;
      case LessonType.ch29Scenario1:
        return Chapter29Data.scenario1Questions;
      case LessonType.ch29Scenario2:
        return Chapter29Data.scenario2Questions;
      case LessonType.ch29ChapterQuiz:
        return Chapter29Data.chapterFinalQuestions;
      case LessonType.ch30Get:
        return Chapter30Data.getQuestions;
      case LessonType.ch30RunTurn:
        return Chapter30Data.runTurnQuestions;
      case LessonType.ch30PutGo:
        return Chapter30Data.putGoQuestions;
      case LessonType.ch30BreakComeLook:
        return Chapter30Data.breakComeLookQuestions;
      case LessonType.ch30Others:
        return Chapter30Data.othersQuestions;
      case LessonType.ch30ChapterQuiz:
        return Chapter30Data.chapterFinalQuestions;
      case LessonType.ch31GroupA:
        return Chapter31Data.groupAQuestions;
      case LessonType.ch31GroupB:
        return Chapter31Data.groupBQuestions;
      case LessonType.ch31ChapterQuiz:
        return Chapter31Data.chapterFinalQuestions;
      case LessonType.ch32Ex1A:
        return Chapter32Data.ex1AQuestions;
      case LessonType.ch32Ex1B:
        return Chapter32Data.ex1BQuestions;
      case LessonType.ch32Ex1C:
        return Chapter32Data.ex1CQuestions;
      case LessonType.ch32Ex2:
        return Chapter32Data.ex2Questions;
      case LessonType.ch32ChapterQuiz:
        return Chapter32Data.chapterFinalQuestions;
      case LessonType.ch33PartA:
        return Chapter33Data.partAQuestions;
      case LessonType.ch33PartB:
        return Chapter33Data.partBQuestions;
      case LessonType.ch33ChapterQuiz:
        return Chapter33Data.chapterFinalQuestions;
      case LessonType.ch34Intro:
        return Chapter34Data.introQuestions;
      case LessonType.ch34Set1:
        return Chapter34Data.set1Questions;
      case LessonType.ch34Set2:
        return Chapter34Data.set2Questions;
      case LessonType.ch34Set3:
        return Chapter34Data.set3Questions;
      case LessonType.ch34Set4:
        return Chapter34Data.set4Questions;
      case LessonType.ch34Set5:
        return Chapter34Data.set5Questions;
      case LessonType.ch34ChapterQuiz:
        return Chapter34Data.chapterFinalQuestions;
      case LessonType.ch35Polite:
        return Chapter35Data.politeQuestions;
      case LessonType.ch35Questions1:
        return Chapter35Data.questions1Quiz;
      case LessonType.ch35Questions2:
        return Chapter35Data.questions2Quiz;
      case LessonType.ch35Emotions:
        return Chapter35Data.emotionsQuestions;
      case LessonType.ch35Complex:
        return Chapter35Data.complexQuestions;
      case LessonType.ch35ChapterQuiz:
        return Chapter35Data.chapterFinalQuestions;
      case LessonType.ch36Verbs1:
        return Chapter36Data.verbs1Questions;
      case LessonType.ch36Verbs2:
        return Chapter36Data.verbs2Questions;
      case LessonType.ch36Articles1:
        return Chapter36Data.articles1Questions;
      case LessonType.ch36Articles2:
        return Chapter36Data.articles2Questions;
      case LessonType.ch36Prep1:
        return Chapter36Data.prep1Questions;
      case LessonType.ch36Prep2:
        return Chapter36Data.prep2Questions;
      case LessonType.ch36ChapterQuiz:
        return Chapter36Data.chapterFinalQuestions;
      case LessonType.ch37Ex1A:
        return Chapter37Data.ex1AQuestions;
      case LessonType.ch37Ex1B:
        return Chapter37Data.ex1BQuestions;
      case LessonType.ch37Ex2A:
        return Chapter37Data.ex2AQuestions;
      case LessonType.ch37Ex2B:
        return Chapter37Data.ex2BQuestions;
      case LessonType.ch37ChapterQuiz:
        return Chapter37Data.chapterFinalQuestions;
      case LessonType.ch38Set1:
        return Chapter38Data.set1Questions;
      case LessonType.ch38Set2:
        return Chapter38Data.set2Questions;
      case LessonType.ch38Set3:
        return Chapter38Data.set3Questions;
      case LessonType.ch38ChapterQuiz:
        return Chapter38Data.chapterFinalQuestions;
      case LessonType.ch39Test1:
        return Chapter39Data.test1Questions;
      case LessonType.ch39Test2:
        return Chapter39Data.test2Questions;
      case LessonType.ch39Test3:
        return Chapter39Data.test3Questions;
      case LessonType.ch39Test4:
        return Chapter39Data.test4Questions;
      case LessonType.ch39ChapterQuiz:
        return Chapter39Data.chapterFinalQuestions;
      case LessonType.ch40EnToHi1:
        return Chapter40Data.enToHi1Questions;
      case LessonType.ch40EnToHi2:
        return Chapter40Data.enToHi2Questions;
      case LessonType.ch40HiToEn1:
        return Chapter40Data.hiToEn1Questions;
      case LessonType.ch40HiToEn2:
        return Chapter40Data.hiToEn2Questions;
      case LessonType.ch40ChapterQuiz:
        return Chapter40Data.chapterFinalQuestions;
      case LessonType.ch41Conv1:
        return Chapter41Data.conv1Questions;
      case LessonType.ch41Conv2:
        return Chapter41Data.conv2Questions;
      case LessonType.ch41Conv3:
        return Chapter41Data.conv3Questions;
      case LessonType.ch41Conv4:
        return Chapter41Data.conv4Questions;
      case LessonType.ch41Conv5:
        return Chapter41Data.conv5Questions;
      case LessonType.ch41Conv6:
        return Chapter41Data.conv6Questions;
      case LessonType.ch41Conv7:
        return Chapter41Data.conv7Questions;
      case LessonType.ch41Conv8:
        return Chapter41Data.conv8Questions;
      case LessonType.ch41Conv9:
        return Chapter41Data.conv9Questions;
      case LessonType.ch41Conv10:
        return Chapter41Data.conv10Questions;
      case LessonType.ch41Conv11:
        return Chapter41Data.conv11Questions;
      case LessonType.ch41Conv12:
        return Chapter41Data.conv12Questions;
      case LessonType.ch41Conv13:
        return Chapter41Data.conv13Questions;
      case LessonType.ch41Conv14:
        return Chapter41Data.conv14Questions;
      case LessonType.ch41Conv15:
        return Chapter41Data.conv15Questions;
      case LessonType.ch41Conv16:
        return Chapter41Data.conv16Questions;
      case LessonType.ch41Conv17:
        return Chapter41Data.conv17Questions;
      case LessonType.ch41Conv18:
        return Chapter41Data.conv18Questions;
      case LessonType.ch41Conv19:
        return Chapter41Data.conv19Questions;
      case LessonType.ch41Conv20:
        return Chapter41Data.conv20Questions;
      case LessonType.ch41Conv21:
        return Chapter41Data.conv21Questions;
      case LessonType.ch41Conv22:
        return Chapter41Data.conv22Questions;
      case LessonType.ch41Conv23:
        return Chapter41Data.conv23Questions;
      case LessonType.ch41Conv24:
        return Chapter41Data.conv24Questions;
      case LessonType.ch41Conv25:
        return Chapter41Data.conv25Questions;
      case LessonType.ch41Conv26:
        return Chapter41Data.conv26Questions;
      case LessonType.ch41Conv27:
        return Chapter41Data.conv27Questions;
      case LessonType.ch41Conv28:
        return Chapter41Data.conv28Questions;
      case LessonType.ch41Conv29:
        return Chapter41Data.conv29Questions;
      case LessonType.ch41Conv30:
        return Chapter41Data.conv30Questions;
      case LessonType.ch41ChapterQuiz:
        return Chapter41Data.chapterFinalQuestions;
      case LessonType.ch42Passages1:
        return Chapter42Data.passages1Questions;
      case LessonType.ch42Passages2:
        return Chapter42Data.passages2Questions;
      case LessonType.ch42ChapterQuiz:
        return Chapter42Data.chapterFinalQuestions;
      case LessonType.ch43Intro:
        return Chapter43Data.introQuestions;
      case LessonType.ch43IdiomsA:
        return Chapter43Data.idiomsAQuestions;
      case LessonType.ch43IdiomsB:
        return Chapter43Data.idiomsBQuestions;
      case LessonType.ch43IdiomsC:
        return Chapter43Data.idiomsCQuestions;
      case LessonType.ch43Proverbs:
        return Chapter43Data.proverbsQuestions;
      case LessonType.ch43ChapterQuiz:
        return Chapter43Data.chapterFinalQuestions;
      case LessonType.ch44Tips:
        return Chapter44Data.tipsQuestions;
      case LessonType.ch44Interview1:
        return Chapter44Data.interview1Questions;
      case LessonType.ch44Interview2:
        return Chapter44Data.interview2Questions;
      case LessonType.ch44Interview3:
        return Chapter44Data.interview3Questions;
      case LessonType.ch44Interview4:
        return Chapter44Data.interview4Questions;
      case LessonType.ch44Interview5:
        return Chapter44Data.interview5Questions;
      case LessonType.ch44Interview6:
        return Chapter44Data.interview6Questions;
      case LessonType.ch44Phrases:
        return Chapter44Data.phrasesQuestions;
      case LessonType.ch44Mock:
        return Chapter44Data.mockQuizQuestions;
      case LessonType.ch44ChapterQuiz:
        return Chapter44Data.chapterFinalQuestions;
      case LessonType.ch45DictAE:
        return Chapter45Data.dictAEQuestions;
      case LessonType.ch45DictFJ:
        return Chapter45Data.dictFJQuestions;
      case LessonType.ch45DictKO:
        return Chapter45Data.dictKOQuestions;
      case LessonType.ch45DictPS:
        return Chapter45Data.dictPSQuestions;
      case LessonType.ch45DictTZ:
        return Chapter45Data.dictTZQuestions;
      case LessonType.ch45POS:
        return Chapter45Data.posQuestions;
      case LessonType.ch45QuizEN:
        return Chapter45Data.quizEnHiQuestions;
      case LessonType.ch45QuizHI:
        return Chapter45Data.quizHiEnQuestions;
      case LessonType.ch45QuizPOS:
        return Chapter45Data.quizPosQuestions;
      case LessonType.ch45ChapterQuiz:
        return Chapter45Data.chapterFinalQuestions;
    }
    return alphabetQuestions;
  }

  static const List<QuizQuestion> alphabetQuestions = [
    QuizQuestion(
      questionEn: 'How many letters are in the English Alphabet?',
      questionHi: 'अंग्रेज़ी वर्णमाला में कितने अक्षर होते हैं?',
      options: ['24', '25', '26', '28'],
      correctIndex: 2,
      explanation: 'English Alphabet has 26 letters — from A to Z.',
    ),
    QuizQuestion(
      questionEn: 'Which letter comes after "M"?',
      questionHi: '"M" के बाद कौन सा अक्षर आता है?',
      options: ['L', 'N', 'O', 'P'],
      correctIndex: 1,
      explanation: 'The order is: ...L, M, N, O...',
    ),
    QuizQuestion(
      questionEn: 'How many Alphabets are there in English?',
      questionHi: 'अंग्रेज़ी में कितनी वर्णमालाएँ होती हैं?',
      options: ['2', '3', '1', '26'],
      correctIndex: 2,
      explanation: 'There is only 1 Alphabet in English.',
    ),
    QuizQuestion(
      questionEn: 'What is the last letter of the English Alphabet?',
      questionHi: 'अंग्रेज़ी वर्णमाला का आखिरी अक्षर कौन सा है?',
      options: ['X', 'Y', 'Z', 'W'],
      correctIndex: 2,
      explanation: 'Z is the 26th and last letter.',
    ),
    QuizQuestion(
      questionEn: 'Which is the correct order?',
      questionHi: 'सही क्रम कौन सा है?',
      options: ['A B D C', 'A B C D', 'B A C D', 'A C B D'],
      correctIndex: 1,
      explanation: 'The correct alphabetical order is A, B, C, D...',
    ),
  ];

  static const List<QuizQuestion> vowelConsonantQuestions = [
    QuizQuestion(
      questionEn: 'How many Vowels are in English?',
      questionHi: 'अंग्रेज़ी में कितने Vowels हैं?',
      options: ['3', '4', '5', '6'],
      correctIndex: 2,
      explanation: '5 vowels: A, E, I, O, U.',
    ),
    QuizQuestion(
      questionEn: 'Which of these is a Vowel?',
      questionHi: 'इनमें से कौन सा Vowel है?',
      options: ['B', 'C', 'E', 'D'],
      correctIndex: 2,
      explanation: 'E is a vowel. The 5 vowels are A, E, I, O, U.',
    ),
    QuizQuestion(
      questionEn: 'How many Consonants are in English?',
      questionHi: 'अंग्रेज़ी में कितने Consonants हैं?',
      options: ['20', '21', '22', '23'],
      correctIndex: 1,
      explanation: '26 − 5 = 21 consonants.',
    ),
    QuizQuestion(
      questionEn: 'Which is NOT a vowel?',
      questionHi: 'कौन सा Vowel नहीं है?',
      options: ['A', 'I', 'F', 'U'],
      correctIndex: 2,
      explanation: 'F is a consonant.',
    ),
    QuizQuestion(
      questionEn: 'Letters form a ___.',
      questionHi: 'अक्षरों से ___ बनता है।',
      options: ['Paragraph', 'Sentence', 'Word', 'Chapter'],
      correctIndex: 2,
      explanation: 'Letters → Word → Sentence → Paragraph.',
    ),
  ];

  static const List<QuizQuestion> greetingQuestions = [
    QuizQuestion(
      questionEn: 'What do you say when meeting at 10 AM?',
      questionHi: 'सुबह 10 बजे मिलने पर क्या कहते हैं?',
      options: ['Good Night', 'Good Evening', 'Good Afternoon', 'Good Morning'],
      correctIndex: 3,
      explanation: '"Good Morning" till 12 noon.',
    ),
    QuizQuestion(
      questionEn: 'What do you say when meeting at 3 PM?',
      questionHi: 'दोपहर 3 बजे मिलने पर?',
      options: ['Good Morning', 'Good Night', 'Good Afternoon', 'Good Evening'],
      correctIndex: 2,
      explanation: '"Good Afternoon" 12 PM–5 PM.',
    ),
    QuizQuestion(
      questionEn: 'What do you say when leaving in the morning?',
      questionHi: 'सुबह जाते वक्त?',
      options: [
        'Good Morning',
        'Good Night',
        'Bye / Have a nice day',
        'Good Evening'
      ],
      correctIndex: 2,
      explanation: 'Say "Bye", "Take care", or "Have a nice day".',
    ),
    QuizQuestion(
      questionEn: 'Which is the casual greeting?',
      questionHi: 'अनौपचारिक अभिवादन?',
      options: ['Good Morning', 'Good Evening', 'Hi / Hello', 'Good Afternoon'],
      correctIndex: 2,
      explanation: '"Hi" and "Hello" are casual/informal greetings.',
    ),
    QuizQuestion(
      questionEn: 'What do you say at night before sleeping?',
      questionHi: 'रात को सोने से पहले?',
      options: ['Good Morning', 'Good Night', 'Good Evening', 'See you'],
      correctIndex: 1,
      explanation: '"Good Night" is said before sleeping.',
    ),
  ];

  static const List<QuizQuestion> mannersQuestions = [
    QuizQuestion(
      questionEn: 'What word when asking for something?',
      questionHi: 'कुछ माँगते वक्त?',
      options: ['Sorry', 'Thanks', 'Please', 'Welcome'],
      correctIndex: 2,
      explanation: 'Use "Please" when asking for something.',
    ),
    QuizQuestion(
      questionEn: 'Reply to "Thank you"?',
      questionHi: '"Thank you" का जवाब?',
      options: ['Please', 'Sorry', 'Excuse me', 'Welcome / My pleasure'],
      correctIndex: 3,
      explanation: '"Welcome", "My pleasure", or "It\'s ok".',
    ),
    QuizQuestion(
      questionEn: "Can't hear on phone?",
      questionHi: 'फ़ोन पर न सुनाई दे?',
      options: ['Thank you', 'I beg your pardon', 'Good Morning', 'Please'],
      correctIndex: 1,
      explanation: '"I beg your pardon" = please repeat.',
    ),
    QuizQuestion(
      questionEn: 'Let someone pass before you?',
      questionHi: 'किसी को पहले जाने देते वक्त?',
      options: ['Please', 'After you', 'Welcome', 'Thank you'],
      correctIndex: 1,
      explanation: '"After you" = you go first.',
    ),
    QuizQuestion(
      questionEn: 'More formal: "Thanks" or "Thank you"?',
      questionHi: 'ज़्यादा औपचारिक कौन सा?',
      options: ['Thanks', 'Thank you', 'Both same', 'Neither'],
      correctIndex: 1,
      explanation: '"Thank you" is more formal than "Thanks".',
    ),
  ];

  static const List<QuizQuestion> daysMonthsQuestions = [
    QuizQuestion(
      questionEn: 'Wednesday in Hindi?',
      questionHi: 'Wednesday को हिंदी में?',
      options: ['सोमवार', 'बुधवार', 'गुरुवार', 'शुक्रवार'],
      correctIndex: 1,
      explanation: 'Wednesday = बुधवार।',
    ),
    QuizQuestion(
      questionEn: 'Day after Thursday?',
      questionHi: 'Thursday के बाद?',
      options: ['Wednesday', 'Saturday', 'Friday', 'Sunday'],
      correctIndex: 2,
      explanation: 'Mon→Tue→Wed→Thu→Fri→Sat→Sun.',
    ),
    QuizQuestion(
      questionEn: 'Days in a week?',
      questionHi: 'एक हफ्ते में दिन?',
      options: ['5', '6', '7', '8'],
      correctIndex: 2,
      explanation: '7 days: Monday to Sunday.',
    ),
    QuizQuestion(
      questionEn: '9th month of year?',
      questionHi: 'साल का 9वाँ महीना?',
      options: ['August', 'October', 'November', 'September'],
      correctIndex: 3,
      explanation: 'September is the 9th month.',
    ),
    QuizQuestion(
      questionEn: 'Months in a year?',
      questionHi: 'एक साल में महीने?',
      options: ['10', '11', '12', '13'],
      correctIndex: 2,
      explanation: '12 months: January to December.',
    ),
  ];

  static const List<QuizQuestion> numbersQuestions = [
    QuizQuestion(
      questionEn: '"पन्द्रह" in English?',
      questionHi: '"पन्द्रह" को English में?',
      options: ['Thirteen', 'Fourteen', 'Fifteen', 'Sixteen'],
      correctIndex: 2,
      explanation: 'पन्द्रह = Fifteen (15)',
    ),
    QuizQuestion(
      questionEn: '"Forty" in Hindi?',
      questionHi: '"Forty" को हिंदी में?',
      options: ['तीस', 'चालीस', 'पचास', 'साठ'],
      correctIndex: 1,
      explanation: 'Forty = चालीस (40)',
    ),
    QuizQuestion(
      questionEn: 'Zeros in One Lakh?',
      questionHi: 'एक लाख में शून्य?',
      options: ['3', '4', '5', '6'],
      correctIndex: 2,
      explanation: '1,00,000 — 5 zeros.',
    ),
    QuizQuestion(
      questionEn: 'After Nineteen?',
      questionHi: 'Nineteen के बाद?',
      options: ['Ninety', 'Twelve', 'Twenty', 'Eighteen'],
      correctIndex: 2,
      explanation: '19=Nineteen, 20=Twenty.',
    ),
    QuizQuestion(
      questionEn: '"एक करोड़" in English?',
      questionHi: '"एक करोड़" को English में?',
      options: ['One Lakh', 'Ten Lakh', 'One Crore', 'One Billion'],
      correctIndex: 2,
      explanation: 'एक करोड़ = One Crore',
    ),
  ];

  static const List<QuizQuestion> timeQuestions = [
    QuizQuestion(
      questionEn: '"5 बजकर 10 मिनट" in English?',
      questionHi: '"5 बजकर 10 मिनट"?',
      options: ['5 to 10', '10 past 5', 'Half past 5', 'Quarter past 5'],
      correctIndex: 1,
      explanation: 'Y past X → 10 past 5.',
    ),
    QuizQuestion(
      questionEn: '"Half past 8" means?',
      questionHi: '"Half past 8"?',
      options: ['7:30', '8:00', '8:30', '8:15'],
      correctIndex: 2,
      explanation: 'Half past 8 = 8:30.',
    ),
    QuizQuestion(
      questionEn: '"7 o\'clock" means?',
      questionHi: '"7 o\'clock"?',
      options: ['7:15', '7:30', '7:00', '6:45'],
      correctIndex: 2,
      explanation: "7 o'clock = exactly 7:00",
    ),
    QuizQuestion(
      questionEn: '"10 to 5" means?',
      questionHi: '"10 to 5"?',
      options: ['5:10', '4:50', '5:50', '4:10'],
      correctIndex: 1,
      explanation: 'Y to X → 5 बजने में 10 मिनट = 4:50',
    ),
    QuizQuestion(
      questionEn: '1 AM to 11:59 AM uses?',
      questionHi: 'सुबह 1 बजे से 11:59 बजे तक?',
      options: ['PM', 'AM', 'Both', 'Neither'],
      correctIndex: 1,
      explanation: 'AM = midnight to noon.',
    ),
  ];

  static const List<QuizQuestion> punctuationQuestions = [
    QuizQuestion(
      questionEn: 'Mark ending a question?',
      questionHi: 'प्रश्न के अंत में?',
      options: ['.', '!', '?', ','],
      correctIndex: 2,
      explanation: 'Question Mark (?)',
    ),
    QuizQuestion(
      questionEn: 'Mark for surprise?',
      questionHi: 'आश्चर्य के लिए?',
      options: [',', '.', ':', '!'],
      correctIndex: 3,
      explanation: 'Exclamation Mark (!)',
    ),
    QuizQuestion(
      questionEn: 'Full Stop (.) indicates?',
      questionHi: 'Full Stop (.) क्या दर्शाता है?',
      options: ['Pause', 'Question', 'End of sentence', 'List'],
      correctIndex: 2,
      explanation: 'Full Stop = end of statement.',
    ),
    QuizQuestion(
      questionEn: 'Mark before a list?',
      questionHi: 'सूची से पहले?',
      options: [';', ':', ',', '.'],
      correctIndex: 1,
      explanation: 'Colon (:) before a list.',
    ),
    QuizQuestion(
      questionEn: "Apostrophe (') is used for?",
      questionHi: "Apostrophe (') किस लिए?",
      options: ['Questions', 'Lists', 'Possession & Contractions', 'Surprises'],
      correctIndex: 2,
      explanation: "Apostrophe for Possession and Contractions.",
    ),
  ];

  static const List<QuizQuestion> contractionQuestions = [
    QuizQuestion(
      questionEn: 'Contraction of "Do not"?',
      questionHi: '"Do not" का contraction?',
      options: ["Doesn't", "Don't", "Didn't", "Won't"],
      correctIndex: 1,
      explanation: "Do not → Don't",
    ),
    QuizQuestion(
      questionEn: "\"Isn't\" expands to?",
      questionHi: '"Isn\'t" का पूरा रूप?',
      options: ['Is not', 'It is not', 'I am not', 'In not'],
      correctIndex: 0,
      explanation: "Isn't = Is not.",
    ),
    QuizQuestion(
      questionEn: 'Contraction of "I have"?',
      questionHi: '"I have" का contraction?',
      options: ["I'm", "I've", "I'd", "I'll"],
      correctIndex: 1,
      explanation: "I have → I've",
    ),
    QuizQuestion(
      questionEn: 'Helping Verb for contraction?',
      questionHi: 'Contraction के लिए Helping Verb?',
      options: ['Run', 'Eat', 'Does', 'Play'],
      correctIndex: 2,
      explanation: '"Does", "Is", "Do", "Have" etc.',
    ),
    QuizQuestion(
      questionEn: 'Contraction of "You are"?',
      questionHi: '"You are" का contraction?',
      options: ["You're", "Your", "You've", "You'd"],
      correctIndex: 0,
      explanation: "You are → You're",
    ),
  ];

  static const List<QuizQuestion> chapterFinalQuestions = [
    QuizQuestion(
      questionEn: 'How many letters in English Alphabet?',
      questionHi: 'अंग्रेज़ी वर्णमाला में कितने अक्षर?',
      options: ['24', '25', '26', '28'],
      correctIndex: 2,
      explanation: '26 letters — A to Z.',
    ),
    QuizQuestion(
      questionEn: 'How many vowels?',
      questionHi: 'कितने Vowels?',
      options: ['3', '4', '5', '6'],
      correctIndex: 2,
      explanation: '5 vowels: A, E, I, O, U.',
    ),
    QuizQuestion(
      questionEn: 'Greeting at 10 AM?',
      questionHi: 'सुबह 10 बजे?',
      options: ['Good Night', 'Good Afternoon', 'Good Evening', 'Good Morning'],
      correctIndex: 3,
      explanation: '"Good Morning" till 12 noon.',
    ),
    QuizQuestion(
      questionEn: 'Word for polite request?',
      questionHi: 'विनम्र अनुरोध के लिए?',
      options: ['Thanks', 'Sorry', 'Please', 'Welcome'],
      correctIndex: 2,
      explanation: '"Please" when requesting.',
    ),
    QuizQuestion(
      questionEn: 'Wednesday in Hindi?',
      questionHi: 'Wednesday हिंदी में?',
      options: ['सोमवार', 'बुधवार', 'शुक्रवार', 'रविवार'],
      correctIndex: 1,
      explanation: 'Wednesday = बुधवार',
    ),
    QuizQuestion(
      questionEn: '"Forty" in Hindi?',
      questionHi: '"Forty" हिंदी में?',
      options: ['तीस', 'चालीस', 'पचास', 'साठ'],
      correctIndex: 1,
      explanation: 'Forty = चालीस',
    ),
    QuizQuestion(
      questionEn: '"Half past 5" means?',
      questionHi: '"Half past 5"?',
      options: ['5:15', '5:30', '4:30', '5:45'],
      correctIndex: 1,
      explanation: 'Half past 5 = 5:30',
    ),
    QuizQuestion(
      questionEn: 'Mark ending a question?',
      questionHi: 'प्रश्न के अंत में?',
      options: ['.', ',', '!', '?'],
      correctIndex: 3,
      explanation: 'Question Mark (?)',
    ),
    QuizQuestion(
      questionEn: 'Contraction of "Do not"?',
      questionHi: '"Do not" का contraction?',
      options: ["Doesn't", "Don't", "Didn't", "Dn't"],
      correctIndex: 1,
      explanation: "Do not → Don't",
    ),
    QuizQuestion(
      questionEn: "Apostrophe for possession and ___.",
      questionHi: "Apostrophe possession और ___.",
      options: ['Questions', 'Contractions', 'Lists', 'Pauses'],
      correctIndex: 1,
      explanation: "Apostrophe for Possession and Contractions.",
    ),
  ];

  static const List<Map<String, dynamic>> alphabetContent = [
    {'letter': 'A', 'hindi': 'ए', 'vowel': true},
    {'letter': 'B', 'hindi': 'बी', 'vowel': false},
    {'letter': 'C', 'hindi': 'सी', 'vowel': false},
    {'letter': 'D', 'hindi': 'डी', 'vowel': false},
    {'letter': 'E', 'hindi': 'ई', 'vowel': true},
    {'letter': 'F', 'hindi': 'एफ', 'vowel': false},
    {'letter': 'G', 'hindi': 'जी', 'vowel': false},
    {'letter': 'H', 'hindi': 'एच', 'vowel': false},
    {'letter': 'I', 'hindi': 'आई', 'vowel': true},
    {'letter': 'J', 'hindi': 'जे', 'vowel': false},
    {'letter': 'K', 'hindi': 'के', 'vowel': false},
    {'letter': 'L', 'hindi': 'एल', 'vowel': false},
    {'letter': 'M', 'hindi': 'एम', 'vowel': false},
    {'letter': 'N', 'hindi': 'एन', 'vowel': false},
    {'letter': 'O', 'hindi': 'ओ', 'vowel': true},
    {'letter': 'P', 'hindi': 'पी', 'vowel': false},
    {'letter': 'Q', 'hindi': 'क्यू', 'vowel': false},
    {'letter': 'R', 'hindi': 'आर', 'vowel': false},
    {'letter': 'S', 'hindi': 'एस', 'vowel': false},
    {'letter': 'T', 'hindi': 'टी', 'vowel': false},
    {'letter': 'U', 'hindi': 'यू', 'vowel': true},
    {'letter': 'V', 'hindi': 'वी', 'vowel': false},
    {'letter': 'W', 'hindi': 'डबल्यू', 'vowel': false},
    {'letter': 'X', 'hindi': 'एक्स', 'vowel': false},
    {'letter': 'Y', 'hindi': 'वाय', 'vowel': false},
    {'letter': 'Z', 'hindi': 'ज़ेड', 'vowel': false},
  ];

  static const List<Map<String, String>> hindiVowels = [
    {'vowel': 'अ', 'roman': 'a'},
    {'vowel': 'आ', 'roman': 'aa'},
    {'vowel': 'इ', 'roman': 'e/i'},
    {'vowel': 'ई', 'roman': 'ee'},
    {'vowel': 'उ', 'roman': 'u/o'},
    {'vowel': 'ऊ', 'roman': 'oo/u'},
    {'vowel': 'ए', 'roman': 'e/ai'},
    {'vowel': 'ऐ', 'roman': 'ai'},
    {'vowel': 'ओ', 'roman': 'o'},
    {'vowel': 'औ', 'roman': 'au/ou'},
    {'vowel': 'अं', 'roman': 'ang'},
    {'vowel': 'अः', 'roman': 'ah'},
  ];

  static const List<Map<String, String>> daysContent = [
    {'hindi': 'सोमवार', 'english': 'Monday', 'pronunciation': 'मंडे'},
    {'hindi': 'मंगलवार', 'english': 'Tuesday', 'pronunciation': 'ट्यूज़डे'},
    {'hindi': 'बुधवार', 'english': 'Wednesday', 'pronunciation': 'वेडनेसडे'},
    {'hindi': 'बृहस्पतिवार', 'english': 'Thursday', 'pronunciation': 'थर्सडे'},
    {'hindi': 'शुक्रवार', 'english': 'Friday', 'pronunciation': 'फ्राइडे'},
    {'hindi': 'शनिवार', 'english': 'Saturday', 'pronunciation': 'सैटर्डे'},
    {'hindi': 'रविवार', 'english': 'Sunday', 'pronunciation': 'सन्डे'},
  ];

  static const List<Map<String, String>> monthsContent = [
    {'hindi': 'जनवरी', 'english': 'January', 'pronunciation': 'जेन्युअरी'},
    {'hindi': 'फ़रवरी', 'english': 'February', 'pronunciation': 'फेब्रुअरी'},
    {'hindi': 'मार्च', 'english': 'March', 'pronunciation': 'मार्च'},
    {'hindi': 'अप्रैल', 'english': 'April', 'pronunciation': 'एप्रिल'},
    {'hindi': 'मई', 'english': 'May', 'pronunciation': 'मे'},
    {'hindi': 'जून', 'english': 'June', 'pronunciation': 'जून'},
    {'hindi': 'जुलाई', 'english': 'July', 'pronunciation': 'जुलाई'},
    {'hindi': 'अगस्त', 'english': 'August', 'pronunciation': 'ऑगस्ट'},
    {'hindi': 'सितम्बर', 'english': 'September', 'pronunciation': 'सितेम्बर'},
    {'hindi': 'अक्टूबर', 'english': 'October', 'pronunciation': 'अक्टोबर'},
    {'hindi': 'नवम्बर', 'english': 'November', 'pronunciation': 'नवेम्बर'},
    {'hindi': 'दिसम्बर', 'english': 'December', 'pronunciation': 'डिसेम्बर'},
  ];

  static const List<Map<String, dynamic>> numbersContent = [
    {'number': 1, 'english': 'One', 'hindi': 'एक'},
    {'number': 2, 'english': 'Two', 'hindi': 'दो'},
    {'number': 3, 'english': 'Three', 'hindi': 'तीन'},
    {'number': 4, 'english': 'Four', 'hindi': 'चार'},
    {'number': 5, 'english': 'Five', 'hindi': 'पाँच'},
    {'number': 6, 'english': 'Six', 'hindi': 'छः'},
    {'number': 7, 'english': 'Seven', 'hindi': 'सात'},
    {'number': 8, 'english': 'Eight', 'hindi': 'आठ'},
    {'number': 9, 'english': 'Nine', 'hindi': 'नौ'},
    {'number': 10, 'english': 'Ten', 'hindi': 'दस'},
    {'number': 11, 'english': 'Eleven', 'hindi': 'ग्यारह'},
    {'number': 12, 'english': 'Twelve', 'hindi': 'बारह'},
    {'number': 13, 'english': 'Thirteen', 'hindi': 'तेरह'},
    {'number': 14, 'english': 'Fourteen', 'hindi': 'चौदह'},
    {'number': 15, 'english': 'Fifteen', 'hindi': 'पन्द्रह'},
    {'number': 16, 'english': 'Sixteen', 'hindi': 'सोलह'},
    {'number': 17, 'english': 'Seventeen', 'hindi': 'सत्रह'},
    {'number': 18, 'english': 'Eighteen', 'hindi': 'अठारह'},
    {'number': 19, 'english': 'Nineteen', 'hindi': 'उन्नीस'},
    {'number': 20, 'english': 'Twenty', 'hindi': 'बीस'},
    {'number': 30, 'english': 'Thirty', 'hindi': 'तीस'},
    {'number': 40, 'english': 'Forty', 'hindi': 'चालीस'},
    {'number': 50, 'english': 'Fifty', 'hindi': 'पचास'},
    {'number': 60, 'english': 'Sixty', 'hindi': 'साठ'},
    {'number': 70, 'english': 'Seventy', 'hindi': 'सत्तर'},
    {'number': 80, 'english': 'Eighty', 'hindi': 'अस्सी'},
    {'number': 90, 'english': 'Ninety', 'hindi': 'नब्बे'},
    {'number': 100, 'english': 'Hundred', 'hindi': 'सौ'},
    {'number': 1000, 'english': 'Thousand', 'hindi': 'हज़ार'},
  ];

  static const List<Map<String, String>> greetingsContent = [
    {
      'timeHindi': 'सुबह से दोपहर 12 बजे तक',
      'timeEn': 'Morning to 12 PM',
      'greetMeet': 'Good Morning',
      'greetBye': 'Bye / Have a nice day',
      'emoji': '🌅'
    },
    {
      'timeHindi': 'दोपहर 12 से शाम 5 बजे तक',
      'timeEn': '12 PM to 5 PM',
      'greetMeet': 'Good Afternoon',
      'greetBye': 'See you / Take care',
      'emoji': '☀️'
    },
    {
      'timeHindi': 'शाम 5 बजे से रात तक',
      'timeEn': '5 PM to Night',
      'greetMeet': 'Good Evening',
      'greetBye': 'Good Night / See you',
      'emoji': '🌆'
    },
  ];

  static const List<Map<String, String>> punctuationContent = [
    {
      'symbol': '?',
      'nameEn': 'Question Mark',
      'nameHindi': 'प्रश्नवाचक चिह्न',
      'use': 'Used at end of questions',
      'example': 'Who are you?',
      'emoji': '❓'
    },
    {
      'symbol': '!',
      'nameEn': 'Exclamation Mark',
      'nameHindi': 'विस्मयादिबोधक चिह्न',
      'use': 'Express surprise or emotion',
      'example': 'Wow! Wonderful!',
      'emoji': '❕'
    },
    {
      'symbol': '.',
      'nameEn': 'Full Stop',
      'nameHindi': 'पूर्ण विराम',
      'use': 'End of a statement',
      'example': 'I am coming.',
      'emoji': '⏺'
    },
    {
      'symbol': ',',
      'nameEn': 'Comma',
      'nameHindi': 'अल्प विराम',
      'use': 'Short pause or list',
      'example': 'Ram, come here.',
      'emoji': '✂️'
    },
    {
      'symbol': ':',
      'nameEn': 'Colon',
      'nameHindi': 'कोलन',
      'use': 'Before a list',
      'example': 'I need: pen, book.',
      'emoji': '📋'
    },
    {
      'symbol': ';',
      'nameEn': 'Semicolon',
      'nameHindi': 'सेमीकोलन',
      'use': 'Join two related clauses',
      'example': 'Meeting: Oct 25; Jan 15.',
      'emoji': '🔗'
    },
    {
      'symbol': "'",
      'nameEn': 'Apostrophe',
      'nameHindi': 'एपोस्ट्रोफी',
      'use': 'Possession or contraction',
      'example': "Ram's book / Don't",
      'emoji': '📝'
    },
    {
      'symbol': '"',
      'nameEn': 'Quotation Mark',
      'nameHindi': 'कोटेशन मार्क',
      'use': "Quote someone's words",
      'example': 'He said, "Hello."',
      'emoji': '💬'
    },
  ];
}
