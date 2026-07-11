import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/data/chapter1_data.dart';
import 'package:lingowave/data/speaking_data.dart';

void main() {
  test('every non-quiz lesson has a dedicated speaking bank of 5 sentences',
      () {
    final missing = <String>[];
    final wrongSize = <String>[];
    var covered = 0;

    for (final chapter in Chapter1Data.chapters) {
      for (final lesson in chapter.lessons) {
        final isQuiz = lesson.title == 'Chapter Quiz' ||
            lesson.type.name.toLowerCase().contains('chapterquiz');
        if (isQuiz) continue;

        final key = 'ch${chapter.id}_les${lesson.id}';
        if (!SpeakingData.hasLessonBank(chapter.id, lesson.id)) {
          missing.add('$key (${lesson.title})');
          continue;
        }
        final bank = SpeakingData.forLesson(chapter.id, lesson.id);
        if (bank.length != 5) {
          wrongSize.add('$key has ${bank.length} sentences');
        }
        for (final s in bank) {
          expect(s.en.trim(), isNotEmpty, reason: '$key has empty English');
          expect(s.hi.trim(), isNotEmpty, reason: '$key has empty Hindi');
        }
        covered++;
      }
    }

    expect(missing, isEmpty,
        reason: 'Lessons without a speaking bank:\n${missing.join('\n')}');
    expect(wrongSize, isEmpty,
        reason: 'Banks with wrong size:\n${wrongSize.join('\n')}');
    // Sanity: the app has hundreds of lessons; guard against silently
    // iterating an empty chapter list.
    expect(covered, greaterThan(250));
  });

  test(
      'speaking practice serves words in chapters 1-15 and sentences after',
      () {
    for (final chapter in Chapter1Data.chapters) {
      final lessonIds = chapter.lessons
          .where((l) => l.title != 'Chapter Quiz')
          .map((l) => l.id)
          .toList();
      for (final id in lessonIds) {
        final pool = SpeakingData.practiceItemsForLesson(chapter.id, id);
        expect(pool, isNotEmpty, reason: 'ch${chapter.id}_les$id empty pool');
        if (chapter.id <= SpeakingData.lastWordLevelChapter) {
          for (final item in pool) {
            expect(item.en.split(' ').length, lessThanOrEqualTo(3),
                reason:
                    'ch${chapter.id}_les$id word-mode speaking has a sentence: "${item.en}"');
          }
        }
      }
      // Chapter-wide pool obeys the same rule.
      final chapterPool =
          SpeakingData.practiceItemsForChapter(chapter.id, lessonIds);
      expect(chapterPool, isNotEmpty);
      if (chapter.id <= SpeakingData.lastWordLevelChapter) {
        for (final item in chapterPool) {
          expect(item.en.split(' ').length, lessThanOrEqualTo(3),
              reason:
                  'ch${chapter.id} chapter speaking pool has a sentence: "${item.en}"');
        }
      }
    }
  });
}
