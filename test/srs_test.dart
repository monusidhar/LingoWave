import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/data/vocab_data.dart';
import 'package:lingowave/exercises/exercise_generator.dart';
import 'package:lingowave/services/review_service.dart';
import 'package:lingowave/services/srs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  final day0 = DateTime(2026, 7, 10);
  DateTime day(int n) => DateTime(2026, 7, 10 + n);

  test('completing a lesson seeds its items, due the next day', () async {
    final added = await SrsService.seedFromLesson(1, 6, now: day0);
    expect(added, VocabData.forLesson(1, 6)!.length);

    // Not due immediately, due tomorrow.
    expect(await SrsService.dueCount(now: day0), 0);
    expect(await SrsService.dueCount(now: day(1)), added);

    // Re-seeding must not duplicate or reset schedules.
    expect(await SrsService.seedFromLesson(1, 6, now: day0), 0);
    expect((await SrsService.getAll()).length, added);
  });

  test('sentence-level chapters seed sentences', () async {
    final added = await SrsService.seedFromLesson(20, 1, now: day0);
    expect(added, greaterThan(0));
    final items = await SrsService.getAll();
    expect(items.every((i) => i.kind == 'sentence'), isTrue);
  });

  test('correct answers climb the Leitner ladder, wrong resets', () async {
    await SrsService.seedFromLesson(1, 6, now: day0);
    var item = (await SrsService.dueItems(now: day(1))).first;

    // Correct on day 1 → box 1, due 3 days later (day 4).
    await SrsService.applyResult(item, true, now: day(1));
    expect(await SrsService.dueCount(now: day(3)),
        (await SrsService.getAll()).length - 1,
        reason: 'answered item must not be due before its new date');
    var updated =
        (await SrsService.getAll()).firstWhere((i) => i.id == item.id);
    expect(updated.box, 1);
    expect(await _isDue(updated, day(4)), isTrue);

    // Correct again on day 4 → box 2, due 7 days later (day 11).
    await SrsService.applyResult(updated, true, now: day(4));
    updated = (await SrsService.getAll()).firstWhere((i) => i.id == item.id);
    expect(updated.box, 2);
    expect(await _isDue(updated, day(10)), isFalse);
    expect(await _isDue(updated, day(11)), isTrue);

    // Wrong on day 11 → back to box 0, due next day.
    await SrsService.applyResult(updated, false, now: day(11));
    updated = (await SrsService.getAll()).firstWhere((i) => i.id == item.id);
    expect(updated.box, 0);
    expect(await _isDue(updated, day(12)), isTrue);
  });

  test('interval caps at the longest box', () async {
    await SrsService.seedFromLesson(1, 6, now: day0);
    var item = (await SrsService.getAll()).first;
    var when = day(1);
    for (var i = 0; i < 10; i++) {
      await SrsService.applyResult(item, true, now: when);
      item = (await SrsService.getAll()).firstWhere((x) => x.id == item.id);
      when = when.add(Duration(days: SrsService.intervals[item.box]));
    }
    expect(item.box, SrsService.intervals.length - 1);
  });

  test('every due item is regenerable as a review exercise', () async {
    await SrsService.seedFromLesson(1, 6, now: day0); // vocab
    await SrsService.seedFromLesson(20, 1, now: day0); // sentences
    final due = await SrsService.dueItems(now: day(1));
    expect(due, isNotEmpty);
    for (final item in due) {
      final exercise = ExerciseGenerator.buildReviewExercise(MistakeRecord(
        chapterId: item.chapterId,
        lessonId: item.lessonId,
        kind: item.kind,
        key: item.key,
        timestamp: 0,
      ));
      expect(exercise, isNotNull,
          reason: '${item.id} could not be regenerated');
    }
  });
}

Future<bool> _isDue(SrsItem item, DateTime now) async {
  final due = await SrsService.dueItems(now: now);
  return due.any((i) => i.id == item.id);
}
