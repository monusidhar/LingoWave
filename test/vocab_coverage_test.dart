import 'package:flutter_test/flutter_test.dart';
import 'package:lingowave/data/chapter1_data.dart';
import 'package:lingowave/data/vocab_data.dart';
import 'package:lingowave/exercises/exercise_generator.dart';

void main() {
  test(
      'every non-quiz lesson in chapters 1-15 has a word-level vocab bank '
      'with spellable words', () {
    final missing = <String>[];
    final problems = <String>[];
    var covered = 0;

    for (final chapter in Chapter1Data.chapters) {
      if (chapter.id > ExerciseGenerator.lastWordLevelChapter) continue;
      for (final lesson in chapter.lessons) {
        final isQuiz = lesson.title == 'Chapter Quiz' ||
            lesson.type.name.toLowerCase().contains('chapterquiz');
        if (isQuiz) continue;

        final key = 'ch${chapter.id}_les${lesson.id}';
        final bank = VocabData.forLesson(chapter.id, lesson.id);
        if (bank == null) {
          missing.add('$key (${lesson.title})');
          continue;
        }
        if (bank.length < 8) {
          problems.add('$key has only ${bank.length} items');
        }
        // Enough single words for the spelling exercise.
        final spellable = bank.where((s) =>
            !s.en.contains(' ') &&
            s.en.replaceAll(RegExp(r'[^A-Za-z]'), '').length >= 2 &&
            s.en.replaceAll(RegExp(r'[^A-Za-z]'), '').length <= 9);
        if (spellable.length < 3) {
          problems.add('$key has only ${spellable.length} spellable words');
        }
        for (final s in bank) {
          if (s.en.trim().isEmpty || s.hi.trim().isEmpty) {
            problems.add('$key has an empty item');
          }
          if (s.en.split(' ').length > 3) {
            problems.add('$key item is a sentence: "${s.en}"');
          }
        }
        covered++;
      }
    }

    expect(missing, isEmpty,
        reason: 'Lessons without vocab bank:\n${missing.join('\n')}');
    expect(problems, isEmpty, reason: problems.join('\n'));
    expect(covered, greaterThan(60));
  });
}
