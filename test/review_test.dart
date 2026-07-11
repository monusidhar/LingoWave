import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/data/speaking_data.dart';
import 'package:lingowave/data/vocab_data.dart';
import 'package:lingowave/data/chapter1_data.dart';
import 'package:lingowave/exercises/exercise_generator.dart';
import 'package:lingowave/exercises/exercise_models.dart';
import 'package:lingowave/models/lesson_model.dart';
import 'package:lingowave/services/review_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('mistake lifecycle: record → right twice clears → wrong resets', () async {
    expect(await ReviewService.pendingCount(), 0);

    await ReviewService.recordMistake(
        chapterId: 1, lessonId: 6, kind: 'vocab', key: 'Five');
    expect(await ReviewService.pendingCount(), 1);

    // Re-missing the same item must not duplicate it.
    await ReviewService.recordMistake(
        chapterId: 1, lessonId: 6, kind: 'vocab', key: 'Five');
    expect(await ReviewService.pendingCount(), 1);

    // First correct answer: still pending, streak 1.
    var record = (await ReviewService.getPending()).single;
    await ReviewService.recordReviewResult(record, true);
    var pending = await ReviewService.getPending();
    expect(pending, hasLength(1));
    expect(pending.single.correctStreak, 1);

    // Wrong answer resets the streak.
    await ReviewService.recordReviewResult(pending.single, false);
    pending = await ReviewService.getPending();
    expect(pending.single.correctStreak, 0);

    // Two consecutive corrects clear the item.
    await ReviewService.recordReviewResult(pending.single, true);
    pending = await ReviewService.getPending();
    await ReviewService.recordReviewResult(pending.single, true);
    expect(await ReviewService.pendingCount(), 0);
  });

  test('pool is capped at maxPoolSize, oldest dropped first', () async {
    for (var i = 0; i < ReviewService.maxPoolSize + 10; i++) {
      await ReviewService.recordMistake(
          chapterId: 1, lessonId: 1, kind: 'vocab', key: 'word$i');
    }
    final pending = await ReviewService.getPending();
    expect(pending, hasLength(ReviewService.maxPoolSize));
    // The earliest items were dropped.
    expect(pending.any((r) => r.key == 'word0'), isFalse);
    expect(pending.any((r) => r.key == 'word9'), isFalse);
  });

  test('buildReviewExercise regenerates each kind from real data', () {
    // Vocab item from chapter 1 (word-level).
    final vocabWord = VocabData.forLesson(1, 6)!.first.en;
    final vocabEx = ExerciseGenerator.buildReviewExercise(MistakeRecord(
        chapterId: 1,
        lessonId: 6,
        kind: 'vocab',
        key: vocabWord,
        timestamp: 0));
    expect(vocabEx, isNotNull);
    // Whatever variant, it must be about the missed word.
    if (vocabEx is ListenChooseExercise) {
      expect(vocabEx.audioText, vocabWord);
    } else if (vocabEx is McqExercise) {
      expect(vocabEx.question.questionEn, vocabWord);
    } else if (vocabEx is TapBuildExercise) {
      expect(vocabEx.targetEn, vocabWord);
      expect(vocabEx.isSpelling, isTrue);
    }

    // Sentence from chapter 20 (sentence-level).
    final sentence = SpeakingData.forLesson(20, 1).first.en;
    final sentenceEx = ExerciseGenerator.buildReviewExercise(MistakeRecord(
        chapterId: 20,
        lessonId: 1,
        kind: 'sentence',
        key: sentence,
        timestamp: 0));
    expect(sentenceEx, isNotNull);
    if (sentenceEx is TapBuildExercise) {
      expect(sentenceEx.targetEn, sentence);
      expect(sentenceEx.isSpelling, isFalse);
    } else if (sentenceEx is FillBlankExercise) {
      expect(sentenceEx.fullSentence, sentence);
    } else if (sentenceEx is ListenChooseExercise) {
      expect(sentenceEx.audioText, sentence);
    }

    // Authored MCQ from chapter 1.
    final q = Chapter1Data.questionsForLesson(LessonType.alphabets).first;
    final mcqEx = ExerciseGenerator.buildReviewExercise(MistakeRecord(
        chapterId: 1,
        lessonId: 1,
        kind: 'mcq',
        key: q.questionEn,
        timestamp: 0));
    expect(mcqEx, isA<McqExercise>());
    expect((mcqEx as McqExercise).question.questionEn, q.questionEn);

    // Stale content → null (caller drops the record).
    final stale = ExerciseGenerator.buildReviewExercise(const MistakeRecord(
        chapterId: 1,
        lessonId: 6,
        kind: 'vocab',
        key: 'NoSuchWordXyz',
        timestamp: 0));
    expect(stale, isNull);
  });

  test('mistakeRecordFor classifies every exercise in real sessions', () {
    for (final chapter in Chapter1Data.chapters) {
      for (final lesson in chapter.lessons.take(2)) {
        final isQuiz = lesson.title == 'Chapter Quiz' ||
            lesson.type.name.toLowerCase().contains('chapterquiz');
        if (isQuiz) continue;
        final session = ExerciseGenerator.buildLessonSession(
            chapterId: chapter.id, lesson: lesson);
        for (final e in session) {
          final record =
              ExerciseGenerator.mistakeRecordFor(e, chapter.id, lesson.id);
          if (e is MatchPairsExercise) {
            expect(record, isNull);
            continue;
          }
          expect(record, isNotNull,
              reason:
                  'ch${chapter.id}_les${lesson.id} ${e.kind} not recordable');
          // Every recordable mistake must be regenerable for review.
          final regenerated =
              ExerciseGenerator.buildReviewExercise(record!);
          expect(regenerated, isNotNull,
              reason:
                  'ch${chapter.id}_les${lesson.id} ${record.kind}/"${record.key}" not regenerable');
        }
      }
    }
  });
}
