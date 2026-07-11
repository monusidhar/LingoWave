/// Word-level vocabulary banks for the early chapters (1-15) — the atoms
/// each lesson actually teaches (number words, day names, prepositions...).
/// Exercises for from-scratch learners are built from these, never from
/// full sentences. Part files live in lib/data/vocab/.
import 'speaking/speaking_sentence.dart';
import 'vocab/vocab_lessons_01_05.dart';
import 'vocab/vocab_lessons_06_10.dart';
import 'vocab/vocab_lessons_11_15.dart';

class VocabData {
  /// Vocab items for a lesson, or null if no bank is authored (the exercise
  /// generator then falls back to sentence mode).
  static List<SpeakingSentence>? forLesson(int chapterId, int lessonId) =>
      _byLesson['ch${chapterId}_les$lessonId'];

  /// True when the lesson has an authored vocab bank (used by tests).
  static bool hasLessonBank(int chapterId, int lessonId) =>
      _byLesson.containsKey('ch${chapterId}_les$lessonId');

  static final Map<String, List<SpeakingSentence>> _byLesson = {
    ...vocabLessonsCh01to05,
    ...vocabLessonsCh06to10,
    ...vocabLessonsCh11to15,
  };
}
