// Exercise engine coverage (v2.1): word-level sessions for chapters 1-15,
// sentence-level for 16+, chapter quizzes untouched.

import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/data/chapter1_data.dart';
import 'package:lingowave/data/vocab_data.dart';
import 'package:lingowave/exercises/exercise_generator.dart';
import 'package:lingowave/exercises/exercise_models.dart';

void main() {
  test('every regular lesson generates a valid session for its level', () {
    for (final chapter in Chapter1Data.chapters) {
      for (final lesson in chapter.lessons) {
        final isQuiz = lesson.title == 'Chapter Quiz' ||
            lesson.type.name.toLowerCase().contains('chapterquiz');
        if (isQuiz) continue;

        final session = ExerciseGenerator.buildLessonSession(
            chapterId: chapter.id, lesson: lesson);
        final label = 'ch${chapter.id}_les${lesson.id}';
        final wordMode =
            chapter.id <= ExerciseGenerator.lastWordLevelChapter &&
                VocabData.hasLessonBank(chapter.id, lesson.id);

        expect(session.length, greaterThanOrEqualTo(4),
            reason: '$label session too short');
        final speak = session.whereType<SpeakExercise>();
        expect(speak, isNotEmpty, reason: '$label has no speak exercise');
        expect(speak.first.passPercent,
            ExerciseGenerator.passPercentForChapter(chapter.id),
            reason: '$label speak threshold mismatch');

        if (wordMode) {
          // WORD mode: no sentences anywhere in the session.
          expect(speak.first.sentence.en.split(' ').length,
              lessThanOrEqualTo(3),
              reason: '$label word-mode speak target is a sentence');
          for (final e in session.whereType<TapBuildExercise>()) {
            expect(e.isSpelling, isTrue,
                reason: '$label word-mode has sentence tap-build');
            expect(e.targetEn.contains(' '), isFalse,
                reason: '$label spelling target has spaces');
          }
          for (final e in session.whereType<MatchPairsExercise>()) {
            for (final p in e.pairs) {
              expect(p.key.split(' ').length, lessThanOrEqualTo(3),
                  reason: '$label word-mode match pair is a sentence');
            }
          }
          for (final e in session.whereType<ListenChooseExercise>()) {
            expect(e.audioText.split(' ').length, lessThanOrEqualTo(3),
                reason: '$label word-mode listen plays a sentence');
          }
        } else {
          // SENTENCE mode (ch16+): builders and level rules.
          final level = ExerciseGenerator.levelForChapter(chapter.id);
          for (final e in session.whereType<TapBuildExercise>()) {
            expect(e.isSpelling, isFalse,
                reason: '$label sentence-mode has spelling');
            final bank = e.wordBank.toList();
            for (final w in e.targetEn.split(' ')) {
              expect(bank.remove(w), isTrue,
                  reason: '$label tap-build bank missing "$w"');
            }
          }
          for (final e in session.whereType<ListenChooseExercise>()) {
            expect(e.englishOptions, level == SessionLevel.advanced,
                reason: '$label listen variant mismatch');
            expect(e.correctIndex,
                inInclusiveRange(0, e.options.length - 1));
          }
          if (level == SessionLevel.advanced) {
            expect(session.whereType<TapBuildExercise>().length,
                greaterThanOrEqualTo(2),
                reason: '$label advanced needs 2 tap-builds');
          }
          for (final e in session.whereType<FillBlankExercise>()) {
            expect(e.display, contains('_____'));
            expect(e.correctIndex,
                inInclusiveRange(0, e.options.length - 1));
          }
        }

        // MCQ integrity in both modes.
        for (final e in session.whereType<McqExercise>()) {
          expect(e.question.correctIndex,
              inInclusiveRange(0, e.question.options.length - 1),
              reason: '$label MCQ correctIndex out of range');
        }
      }
    }
  });

  test('chapter final quizzes stay pure MCQ with all authored questions', () {
    for (final chapter in Chapter1Data.chapters) {
      final quizLessons = chapter.lessons.where((l) =>
          l.title == 'Chapter Quiz' ||
          l.type.name.toLowerCase().contains('chapterquiz'));
      for (final lesson in quizLessons) {
        final session = ExerciseGenerator.buildChapterQuiz(lesson.type);
        final authored = Chapter1Data.questionsForLesson(lesson.type);
        expect(session.length, authored.length,
            reason: 'ch${chapter.id} quiz question count changed');
        expect(session.every((e) => e is McqExercise), isTrue,
            reason: 'ch${chapter.id} quiz contains non-MCQ exercises');
      }
    }
  });
}
