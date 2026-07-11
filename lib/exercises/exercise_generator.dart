import 'dart:math';

import '../data/chapter1_data.dart';
import '../data/speaking_data.dart';
import '../data/vocab_data.dart';
import '../models/lesson_model.dart';
import '../services/review_service.dart';
import 'exercise_models.dart';

/// Difficulty tier derived from chapter position — early chapters are
/// beginner material, later ones progressively harder. `foundation` covers
/// the very first chapters where the learner knows no grammar yet: only
/// short sentences, minimal choices, and the gentlest speaking threshold.
enum SessionLevel { foundation, beginner, intermediate, advanced }

/// Builds a mixed interactive session for a lesson from data the app already
/// has: the lesson's QuizQuestion list + its per-lesson speaking bank.
/// Session shape, option counts, distractors, and speaking pass threshold
/// all scale with the chapter's level.
class ExerciseGenerator {
  static final _rng = Random();

  static SessionLevel levelForChapter(int chapterId) => chapterId <= 5
      ? SessionLevel.foundation
      : chapterId <= 15
          ? SessionLevel.beginner
          : chapterId <= 30
              ? SessionLevel.intermediate
              : SessionLevel.advanced;

  /// Speaking pass threshold, easier for beginners, stricter later.
  static int passPercentForChapter(int chapterId) {
    switch (levelForChapter(chapterId)) {
      case SessionLevel.foundation:
        return 55;
      case SessionLevel.beginner:
        return 60;
      case SessionLevel.intermediate:
        return 70;
      case SessionLevel.advanced:
        return 75;
    }
  }

  /// Foundation exercises only use short sentences the learner can handle.
  static const int _foundationMaxWords = 6;

  /// Function words we never blank out or use as distractors.
  static const _stopWords = {
    'a', 'an', 'the', 'is', 'am', 'are', 'was', 'were', 'be', 'been',
    'to', 'in', 'on', 'of', 'and', 'or', 'it', 'i', 'you', 'he', 'she',
    'we', 'they', 'my', 'your', 'his', 'her', 'its', 'our', 'their',
    'at', 'for', 'with', 'do', 'does', 'did', 'not', 'no', 'so', 'this',
    'that', 'me', 'us', 'him', 'them',
  };

  static const _fallbackDistractors = [
    'school', 'water', 'happy', 'morning', 'friend', 'market', 'always',
  ];

  /// Chapter final quizzes stay pure MCQ — they gate chapter progression and
  /// must keep their exact pass semantics (≥60% of the authored questions).
  static List<Exercise> buildChapterQuiz(LessonType type) {
    final questions = Chapter1Data.questionsForLesson(type);
    return questions.map(McqExercise.new).toList();
  }

  /// Word-level chapters: the learner hasn't been taught sentences yet, so
  /// exercises use the lesson's own atoms (number words, day names, ...).
  /// The course introduces sentences around chapter 16.
  static const int lastWordLevelChapter = 15;

  /// A regular lesson becomes a mixed session shaped by the chapter's level.
  /// Chapters 1-15 with an authored vocab bank get WORD-level exercises;
  /// later chapters (or missing banks) get sentence-level exercises.
  static List<Exercise> buildLessonSession({
    required int chapterId,
    required LessonModel lesson,
  }) {
    if (chapterId <= lastWordLevelChapter) {
      final vocab = VocabData.forLesson(chapterId, lesson.id);
      if (vocab != null && vocab.length >= 4) {
        return _buildWordSession(
            chapterId: chapterId, lesson: lesson, vocab: vocab);
      }
    }
    return _buildSentenceSession(chapterId: chapterId, lesson: lesson);
  }

  // ── Word-level session (chapters 1-15) ────────────────────────────────────
  //
  // MCQ (authored) → match word↔meaning → hear-the-word → spell-the-word →
  // meaning MCQ → speak the word. No sentences anywhere.
  static List<Exercise> _buildWordSession({
    required int chapterId,
    required LessonModel lesson,
    required List<SpeakingSentence> vocab,
  }) {
    final level = levelForChapter(chapterId);
    final passPercent = passPercentForChapter(chapterId);
    final items = List<SpeakingSentence>.of(vocab)..shuffle(_rng);
    final questions =
        List<QuizQuestion>.of(Chapter1Data.questionsForLesson(lesson.type))
          ..shuffle(_rng);

    final pairCount = level == SessionLevel.foundation ? 3 : 4;
    final exercises = <Exercise>[];

    // 1. Warm-up MCQ from the lesson's authored questions.
    if (questions.isNotEmpty) exercises.add(McqExercise(questions[0]));

    // 2. Match word ↔ meaning.
    if (items.length >= pairCount) {
      exercises.add(MatchPairsExercise(
        items.take(pairCount).map((s) => MapEntry(s.en, s.hi)).toList(),
      ));
    }

    // 3. Hear the word, pick its meaning.
    final listen =
        _buildListenChoose(items, sentenceIndex: 0, optionCount: 3, englishOptions: false);
    if (listen != null) exercises.add(listen);

    // 4. Spell the word from letter chips.
    final spell = _buildSpelling(items, level: level);
    if (spell != null) exercises.add(spell);

    // 5. Meaning MCQ built from the vocab bank.
    final meaning = _buildMeaningMcq(items, itemIndex: 1);
    if (meaning != null) exercises.add(meaning);

    // 6. Speak the word — always last.
    exercises.add(SpeakExercise(
      items[2 % items.length],
      passPercent: passPercent,
    ));

    return exercises;
  }

  /// Arrange-the-letters spelling exercise from the shortest single word.
  static TapBuildExercise? _buildSpelling(
    List<SpeakingSentence> items, {
    required SessionLevel level,
  }) {
    final candidates = items
        .where((s) =>
            !s.en.contains(' ') &&
            _clean(s.en).length >= 2 &&
            _clean(s.en).length <= 9)
        .toList()
      ..sort((a, b) => a.en.length.compareTo(b.en.length));
    if (candidates.isEmpty) return null;
    final word = candidates[_rng.nextInt(
        candidates.length < 3 ? candidates.length : 3)];

    final letters = word.en
        .replaceAll(RegExp(r"[^A-Za-z]"), '')
        .toUpperCase()
        .split('');

    // Distractor letters for non-foundation learners.
    final distractorCount = level == SessionLevel.foundation ? 0 : 2;
    const alphabet = 'ABCDEFGHIJKLMNOPRSTUVWY';
    final distractors = <String>[];
    while (distractors.length < distractorCount) {
      final c = alphabet[_rng.nextInt(alphabet.length)];
      if (!letters.contains(c) && !distractors.contains(c)) {
        distractors.add(c);
      }
    }

    return TapBuildExercise(
      targetEn: word.en,
      hindi: word.hi,
      wordBank: [...letters, ...distractors]..shuffle(_rng),
      isSpelling: true,
    );
  }

  /// "What does '<word>' mean?" MCQ generated from the vocab bank.
  static McqExercise? _buildMeaningMcq(
    List<SpeakingSentence> items, {
    required int itemIndex,
  }) {
    if (items.length < 3) return null;
    final target = items[itemIndex % items.length];
    final others = items.where((s) => s != target).toList()..shuffle(_rng);
    final options = [target.hi, ...others.take(2).map((s) => s.hi)]
      ..shuffle(_rng);
    return McqExercise(QuizQuestion(
      questionEn: target.en,
      questionHi: "'${target.en}' का अर्थ क्या है?",
      options: options,
      correctIndex: options.indexOf(target.hi),
      explanation: "'${target.en}' का अर्थ '${target.hi}' होता है।",
    ));
  }

  // ── Sentence-level session (chapters 16+, and fallback) ──────────────────
  static List<Exercise> _buildSentenceSession({
    required int chapterId,
    required LessonModel lesson,
  }) {
    final level = levelForChapter(chapterId);
    final passPercent = passPercentForChapter(chapterId);

    var bank =
        List<SpeakingSentence>.of(SpeakingData.forLesson(chapterId, lesson.id))
          ..shuffle(_rng);
    // Beginners practice the shortest sentences first; advanced the longest.
    int words(SpeakingSentence s) => s.en.split(RegExp(r'\s+')).length;
    if (level == SessionLevel.foundation || level == SessionLevel.beginner) {
      bank.sort((a, b) => words(a).compareTo(words(b)));
    } else if (level == SessionLevel.advanced) {
      bank.sort((a, b) => words(b).compareTo(words(a)));
    }
    // Foundation learners only ever see short sentences in exercises.
    if (level == SessionLevel.foundation) {
      final short =
          bank.where((s) => words(s) <= _foundationMaxWords).toList();
      if (short.length >= 3) bank = short;
    }

    final questions =
        List<QuizQuestion>.of(Chapter1Data.questionsForLesson(lesson.type))
          ..shuffle(_rng);

    // Level tuning.
    final pairCount = switch (level) {
      SessionLevel.foundation => 3,
      SessionLevel.beginner => 3,
      SessionLevel.intermediate => 4,
      SessionLevel.advanced => 5,
    };
    final optionCount = switch (level) {
      SessionLevel.foundation => 3,
      SessionLevel.beginner => 3,
      SessionLevel.intermediate => 4,
      SessionLevel.advanced => 5,
    };
    final buildDistractors = switch (level) {
      SessionLevel.foundation => 0,
      SessionLevel.beginner => 0,
      SessionLevel.intermediate => 2,
      SessionLevel.advanced => 4,
    };

    final exercises = <Exercise>[];

    // 1. Warm-up MCQ.
    if (questions.isNotEmpty) exercises.add(McqExercise(questions[0]));

    // 2. Match pairs — EN↔HI pairs from the lesson bank.
    if (bank.length >= pairCount && pairCount >= 2) {
      exercises.add(MatchPairsExercise(
        bank.take(pairCount).map((s) => MapEntry(s.en, s.hi)).toList(),
      ));
    }

    // 3. Listen. Beginner/intermediate pick the Hindi meaning; advanced pick
    //    the exact English sentence they heard (finer listening).
    final listen = _buildListenChoose(
      bank,
      sentenceIndex: 0,
      optionCount: optionCount.clamp(2, bank.length),
      englishOptions: level == SessionLevel.advanced,
    );
    if (listen != null) exercises.add(listen);

    // 4. Tap to build.
    if (bank.length >= 2) {
      exercises.add(_buildTapToBuild(bank,
          sentenceIndex: 1, distractorCount: buildDistractors));
    }

    // 5. Fill in the blank.
    final fill = _buildFillBlank(bank,
        sentenceIndex: 2 % bank.length, optionCount: optionCount);
    if (fill != null) exercises.add(fill);

    // 6. Second MCQ (intermediate and up).
    if ((level == SessionLevel.intermediate ||
            level == SessionLevel.advanced) &&
        questions.length >= 2) {
      exercises.add(McqExercise(questions[1]));
    }

    // 7. Advanced: a second, harder sentence build.
    if (level == SessionLevel.advanced && bank.length >= 4) {
      exercises.add(_buildTapToBuild(bank,
          sentenceIndex: 3, distractorCount: buildDistractors));
    }

    // 8. Speak — always last, ends the session on production practice.
    if (bank.isNotEmpty) {
      exercises.add(SpeakExercise(
        bank[(bank.length - 1) % bank.length],
        passPercent: passPercent,
      ));
    }

    // Safety net: never return an empty session.
    if (exercises.isEmpty) {
      final fallback = Chapter1Data.questionsForLesson(LessonType.alphabets);
      exercises.addAll(fallback.take(5).map(McqExercise.new));
    }
    return exercises;
  }

  // ── Builders ──────────────────────────────────────────────────────────────

  static ListenChooseExercise? _buildListenChoose(
    List<SpeakingSentence> bank, {
    required int sentenceIndex,
    required int optionCount,
    required bool englishOptions,
  }) {
    if (bank.length < optionCount || optionCount < 2) return null;
    final target = bank[sentenceIndex];
    final others = bank.where((s) => s != target).toList()..shuffle(_rng);
    String textOf(SpeakingSentence s) => englishOptions ? s.en : s.hi;
    final options = [
      textOf(target),
      ...others.take(optionCount - 1).map(textOf),
    ]..shuffle(_rng);
    return ListenChooseExercise(
      audioText: target.en,
      options: options,
      correctIndex: options.indexOf(textOf(target)),
      englishOptions: englishOptions,
    );
  }

  static TapBuildExercise _buildTapToBuild(
    List<SpeakingSentence> bank, {
    required int sentenceIndex,
    required int distractorCount,
  }) {
    final target = bank[sentenceIndex];
    final words = target.en
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();

    // Distractor words drawn from other sentences in the bank.
    final targetSet = words.map(_clean).toSet();
    final distractors = <String>[];
    if (distractorCount > 0) {
      final otherWords = bank
          .where((s) => s != target)
          .expand((s) => s.en.split(RegExp(r'\s+')))
          .where((w) =>
              w.isNotEmpty &&
              _clean(w).length >= 3 &&
              !targetSet.contains(_clean(w)) &&
              !_stopWords.contains(_clean(w)))
          .toList()
        ..shuffle(_rng);
      for (final w in otherWords) {
        if (distractors.length >= distractorCount) break;
        if (!distractors.any((d) => _clean(d) == _clean(w))) {
          distractors.add(w.replaceAll(RegExp(r'[.,!?]'), ''));
        }
      }
    }

    final wordBank = [...words, ...distractors]..shuffle(_rng);
    return TapBuildExercise(
      targetEn: target.en,
      hindi: target.hi,
      wordBank: wordBank,
    );
  }

  static FillBlankExercise? _buildFillBlank(
    List<SpeakingSentence> bank, {
    required int sentenceIndex,
    required int optionCount,
  }) {
    if (bank.isEmpty) return null;
    final target = bank[sentenceIndex];
    final tokens = target.en.split(RegExp(r'\s+'));

    // Blank the longest meaningful word.
    String? blankToken;
    for (final t in tokens) {
      final c = _clean(t);
      if (c.length >= 3 && !_stopWords.contains(c)) {
        if (blankToken == null || _clean(t).length > _clean(blankToken).length) {
          blankToken = t;
        }
      }
    }
    if (blankToken == null) return null;
    final correctWord = blankToken.replaceAll(RegExp(r'[.,!?]'), '');

    // Distractor words from other sentences, then fallbacks.
    final distractors = <String>[];
    final pool = bank
        .where((s) => s != target)
        .expand((s) => s.en.split(RegExp(r'\s+')))
        .map((w) => w.replaceAll(RegExp(r'[.,!?]'), ''))
        .where((w) =>
            _clean(w).length >= 3 &&
            !_stopWords.contains(_clean(w)) &&
            _clean(w) != _clean(correctWord))
        .toList()
      ..shuffle(_rng);
    for (final w in [...pool, ..._fallbackDistractors]) {
      if (distractors.length >= optionCount - 1) break;
      if (_clean(w) != _clean(correctWord) &&
          !distractors.any((d) => _clean(d) == _clean(w))) {
        distractors.add(w);
      }
    }

    final display = tokens
        .map((t) => t == blankToken ? '_____' : t)
        .join(' ');
    final options = [correctWord, ...distractors]..shuffle(_rng);
    return FillBlankExercise(
      display: display,
      fullSentence: target.en,
      hindi: target.hi,
      options: options,
      correctIndex: options.indexOf(correctWord),
    );
  }

  static String _clean(String w) =>
      w.toLowerCase().replaceAll(RegExp(r"[^a-z0-9']"), '');

  // ══════════════════════════════════════════════════════════════════════════
  // PRACTICE YOUR MISTAKES (Step 3, v2.2)
  // ══════════════════════════════════════════════════════════════════════════

  /// Identify what a wrong answer was ABOUT so it can be re-drilled later.
  /// Returns null for exercises we don't re-drill (match pairs — the widget
  /// doesn't report which pair was missed).
  static MistakeRecord? mistakeRecordFor(
      Exercise exercise, int chapterId, int lessonId) {
    String? key;
    if (exercise is ListenChooseExercise) key = exercise.audioText;
    if (exercise is TapBuildExercise) key = exercise.targetEn;
    if (exercise is FillBlankExercise) key = exercise.fullSentence;
    if (exercise is SpeakExercise) key = exercise.sentence.en;
    if (exercise is McqExercise) key = exercise.question.questionEn;
    if (key == null) return null;

    // Classify by where the content actually lives — this also folds the
    // generated meaning-MCQs (whose questionEn is the vocab word) back to
    // their vocab item.
    final vocab = VocabData.forLesson(chapterId, lessonId) ?? const [];
    if (vocab.any((s) => s.en == key)) {
      return _record(chapterId, lessonId, 'vocab', key);
    }
    final sentences = SpeakingData.forLesson(chapterId, lessonId);
    if (sentences.any((s) => s.en == key)) {
      return _record(chapterId, lessonId, 'sentence', key);
    }
    if (exercise is McqExercise) {
      return _record(chapterId, lessonId, 'mcq', key);
    }
    return null;
  }

  static MistakeRecord _record(int c, int l, String kind, String key) =>
      MistakeRecord(
        chapterId: c,
        lessonId: l,
        kind: kind,
        key: key,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

  /// Regenerate an exercise for a recorded mistake. Returns null when the
  /// source content no longer exists (caller should drop the record).
  /// Review sessions are tap-based (no mic dependency).
  static Exercise? buildReviewExercise(MistakeRecord record) {
    switch (record.kind) {
      case 'vocab':
        final bank =
            VocabData.forLesson(record.chapterId, record.lessonId) ?? const [];
        final idx = bank.indexWhere((s) => s.en == record.key);
        if (idx == -1 || bank.length < 3) return null;
        final items = List.of(bank);
        // Rotate the missed item to the front, then pick a drill variant.
        final target = items.removeAt(idx);
        items.insert(0, target);
        switch (_rng.nextInt(3)) {
          case 0:
            final listen = _buildListenChoose(items,
                sentenceIndex: 0, optionCount: 3, englishOptions: false);
            if (listen != null) return listen;
            continue meaning;
          meaning:
          case 1:
            return _buildMeaningMcq(items, itemIndex: 0);
          default:
            return _buildSpelling([target],
                    level: SessionLevel.foundation) ??
                _buildMeaningMcq(items, itemIndex: 0);
        }
      case 'sentence':
        final bank =
            SpeakingData.forLesson(record.chapterId, record.lessonId);
        final idx = bank.indexWhere((s) => s.en == record.key);
        if (idx == -1) return null;
        final items = List.of(bank);
        final target = items.removeAt(idx);
        items.insert(0, target);
        switch (_rng.nextInt(3)) {
          case 0:
            return _buildTapToBuild(items,
                sentenceIndex: 0, distractorCount: 2);
          case 1:
            return _buildFillBlank(items, sentenceIndex: 0, optionCount: 4) ??
                _buildTapToBuild(items, sentenceIndex: 0, distractorCount: 2);
          default:
            return _buildListenChoose(items,
                    sentenceIndex: 0, optionCount: 4, englishOptions: false) ??
                _buildTapToBuild(items, sentenceIndex: 0, distractorCount: 2);
        }
      case 'mcq':
        final lesson = _findLesson(record.chapterId, record.lessonId);
        if (lesson == null) return null;
        final questions = Chapter1Data.questionsForLesson(lesson.type);
        for (final q in questions) {
          if (q.questionEn == record.key) return McqExercise(q);
        }
        return null;
    }
    return null;
  }

  static LessonModel? _findLesson(int chapterId, int lessonId) {
    for (final chapter in Chapter1Data.chapters) {
      if (chapter.id != chapterId) continue;
      for (final lesson in chapter.lessons) {
        if (lesson.id == lessonId) return lesson;
      }
    }
    return null;
  }
}
