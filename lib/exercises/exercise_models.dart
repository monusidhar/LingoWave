import '../models/lesson_model.dart';
import '../data/speaking_data.dart';

/// The interactive exercise types a lesson session can mix (v2.1).
enum ExerciseKind {
  mcq, // classic multiple choice from QuizQuestion data
  listenChoose, // TTS plays English → pick the right Hindi meaning
  tapToBuild, // word bank → build the English sentence
  fillBlank, // sentence with a missing word → tap the right word
  matchPairs, // match English ↔ Hindi pairs
  speak, // say the sentence aloud (speech-to-text scored)
}

/// Base class: one interactive exercise inside a session.
abstract class Exercise {
  ExerciseKind get kind;
}

class McqExercise extends Exercise {
  final QuizQuestion question;
  McqExercise(this.question);
  @override
  ExerciseKind get kind => ExerciseKind.mcq;
}

class ListenChooseExercise extends Exercise {
  /// English text played via TTS.
  final String audioText;

  /// Options: Hindi meanings normally; exact English sentences for the
  /// advanced variant ([englishOptions] true).
  final List<String> options;
  final int correctIndex;
  final bool englishOptions;
  ListenChooseExercise({
    required this.audioText,
    required this.options,
    required this.correctIndex,
    this.englishOptions = false,
  });
  @override
  ExerciseKind get kind => ExerciseKind.listenChoose;
}

class TapBuildExercise extends Exercise {
  /// The English sentence (or single word in spelling mode) to build.
  final String targetEn;

  /// Hindi meaning shown as the prompt.
  final String hindi;

  /// Shuffled chips: words of the sentence — or LETTERS of the word in
  /// spelling mode — plus optional distractors.
  final List<String> wordBank;

  /// Spelling mode (early chapters): chips are letters and the learner
  /// spells a single word instead of building a sentence.
  final bool isSpelling;
  TapBuildExercise({
    required this.targetEn,
    required this.hindi,
    required this.wordBank,
    this.isSpelling = false,
  });
  @override
  ExerciseKind get kind => ExerciseKind.tapToBuild;
}

class FillBlankExercise extends Exercise {
  /// Sentence with the blanked word replaced by '_____'.
  final String display;

  /// The full correct sentence (shown in feedback).
  final String fullSentence;

  /// Hindi meaning shown as a hint.
  final String hindi;

  /// Word options; [correctIndex] is the blanked word.
  final List<String> options;
  final int correctIndex;
  FillBlankExercise({
    required this.display,
    required this.fullSentence,
    required this.hindi,
    required this.options,
    required this.correctIndex,
  });
  @override
  ExerciseKind get kind => ExerciseKind.fillBlank;
}

class MatchPairsExercise extends Exercise {
  /// English → Hindi pairs to match (typically 4).
  final List<MapEntry<String, String>> pairs;
  MatchPairsExercise(this.pairs);
  @override
  ExerciseKind get kind => ExerciseKind.matchPairs;
}

class SpeakExercise extends Exercise {
  final SpeakingSentence sentence;

  /// Similarity percent needed to pass — scales with chapter level.
  final int passPercent;
  SpeakExercise(this.sentence, {this.passPercent = 70});
  @override
  ExerciseKind get kind => ExerciseKind.speak;
}

/// What an exercise widget reports back to the session runner when the user
/// locks in an answer.
class ExerciseResult {
  final bool correct;

  /// Explanation / correct answer to show in the feedback panel.
  final String feedback;
  const ExerciseResult({required this.correct, required this.feedback});
}
