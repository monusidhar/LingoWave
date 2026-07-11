import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../services/speech_service.dart';
import 'exercise_models.dart';

typedef OnExerciseResult = void Function(ExerciseResult result);
typedef SpeakFn = Future<void> Function(String text);

// ═══════════════════════════════════════════════════════════════════════════
// Shared pieces
// ═══════════════════════════════════════════════════════════════════════════

/// Prompt card — same accent-gradient card the old quiz used.
class _PromptCard extends StatelessWidget {
  final Color accent;
  final String big;
  final String? small;
  final Widget? trailing;
  const _PromptCard({
    required this.accent,
    required this.big,
    this.small,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [accent, accent.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(big,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.4,
                  )),
              if (small != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(small!,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      color: Colors.white70,
                      height: 1.4,
                    )),
              ],
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ]),
    );
  }
}

enum _TileState { idle, selected, correct, wrong }

/// Answer option tile — same look as the old quiz options.
class _OptionTile extends StatelessWidget {
  final String text;
  final String badge;
  final _TileState state;
  final Color accent;
  final VoidCallback? onTap;
  const _OptionTile({
    required this.text,
    required this.badge,
    required this.state,
    required this.accent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color bc = AppColors.locked, bg = AppColors.surface;
    Color tc = AppColors.textPrimary, badgeBg = AppColors.lockedBg;
    Color badgeTc = AppColors.textSecondary;
    Widget? ti;
    switch (state) {
      case _TileState.selected:
        bc = accent;
        bg = accent.withOpacity(0.08);
        tc = accent;
        badgeBg = accent;
        badgeTc = Colors.white;
        break;
      case _TileState.correct:
        bc = AppColors.success;
        bg = AppColors.success.withOpacity(0.08);
        tc = AppColors.success;
        badgeBg = AppColors.success;
        badgeTc = Colors.white;
        ti = const Icon(Icons.check_circle_rounded,
            color: AppColors.success, size: 22);
        break;
      case _TileState.wrong:
        bc = AppColors.error;
        bg = AppColors.error.withOpacity(0.06);
        tc = AppColors.error;
        badgeBg = AppColors.error;
        badgeTc = Colors.white;
        ti = const Icon(Icons.cancel_rounded, color: AppColors.error, size: 22);
        break;
      case _TileState.idle:
        break;
    }
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: bc, width: 2),
        ),
        child: Row(children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(color: badgeBg, shape: BoxShape.circle),
            child: Center(
              child: Text(badge,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: badgeTc,
                  )),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(text,
                style: AppTextStyles.labelLarge.copyWith(color: tc)),
          ),
          if (ti != null) ti,
        ]),
      ),
    );
  }
}

const _badges = ['अ', 'ब', 'स', 'द', 'इ', 'फ'];

// ═══════════════════════════════════════════════════════════════════════════
// 1. MCQ
// ═══════════════════════════════════════════════════════════════════════════

class McqExerciseWidget extends StatefulWidget {
  final McqExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  const McqExerciseWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
  });

  @override
  State<McqExerciseWidget> createState() => _McqExerciseWidgetState();
}

class _McqExerciseWidgetState extends State<McqExerciseWidget> {
  int _selected = -1;
  bool _answered = false;

  void _tap(int i) {
    if (_answered) return;
    final q = widget.exercise.question;
    setState(() {
      _selected = i;
      _answered = true;
    });
    widget.onResult(ExerciseResult(
      correct: i == q.correctIndex,
      feedback: q.explanation,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.exercise.question;
    return Column(children: [
      _PromptCard(accent: widget.accent, big: q.questionHi, small: q.questionEn),
      const SizedBox(height: AppSpacing.lg),
      ...List.generate(q.options.length, (i) {
        var state = _TileState.idle;
        if (_answered) {
          if (i == q.correctIndex) state = _TileState.correct;
          if (i == _selected && i != q.correctIndex) state = _TileState.wrong;
        }
        return _OptionTile(
          text: q.options[i],
          badge: _badges[i % _badges.length],
          state: state,
          accent: widget.accent,
          onTap: () => _tap(i),
        );
      }),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 2. Listen and choose
// ═══════════════════════════════════════════════════════════════════════════

class ListenChooseWidget extends StatefulWidget {
  final ListenChooseExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  final SpeakFn speak;
  const ListenChooseWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
    required this.speak,
  });

  @override
  State<ListenChooseWidget> createState() => _ListenChooseWidgetState();
}

class _ListenChooseWidgetState extends State<ListenChooseWidget> {
  int _selected = -1;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    // Auto-play once so the user immediately knows what to do.
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) widget.speak(widget.exercise.audioText);
    });
  }

  void _tap(int i) {
    if (_answered) return;
    setState(() {
      _selected = i;
      _answered = true;
    });
    widget.onResult(ExerciseResult(
      correct: i == widget.exercise.correctIndex,
      feedback: 'वाक्य था: "${widget.exercise.audioText}"',
    ));
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.exercise;
    return Column(children: [
      _PromptCard(
        accent: widget.accent,
        big: e.englishOptions
            ? 'सुनिए और सही वाक्य चुनिए 🎧'
            : 'सुनिए और सही अर्थ चुनिए 🎧',
        small: 'बटन दबाकर दोबारा सुन सकते हैं',
        trailing: GestureDetector(
          onTap: () => widget.speak(e.audioText),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.5)),
            ),
            child: const Icon(Icons.volume_up_rounded,
                color: Colors.white, size: 28),
          ),
        ),
      ),
      const SizedBox(height: AppSpacing.lg),
      ...List.generate(e.options.length, (i) {
        var state = _TileState.idle;
        if (_answered) {
          if (i == e.correctIndex) state = _TileState.correct;
          if (i == _selected && i != e.correctIndex) state = _TileState.wrong;
        }
        return _OptionTile(
          text: e.options[i],
          badge: _badges[i % _badges.length],
          state: state,
          accent: widget.accent,
          onTap: () => _tap(i),
        );
      }),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 3. Fill in the blank
// ═══════════════════════════════════════════════════════════════════════════

class FillBlankWidget extends StatefulWidget {
  final FillBlankExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  const FillBlankWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
  });

  @override
  State<FillBlankWidget> createState() => _FillBlankWidgetState();
}

class _FillBlankWidgetState extends State<FillBlankWidget> {
  int _selected = -1;
  bool _answered = false;

  void _tap(int i) {
    if (_answered) return;
    setState(() {
      _selected = i;
      _answered = true;
    });
    widget.onResult(ExerciseResult(
      correct: i == widget.exercise.correctIndex,
      feedback: 'सही वाक्य: "${widget.exercise.fullSentence}"',
    ));
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.exercise;
    return Column(children: [
      _PromptCard(
        accent: widget.accent,
        big: e.display,
        small: '${e.hindi}  •  खाली जगह के लिए सही शब्द चुनिए ✏️',
      ),
      const SizedBox(height: AppSpacing.lg),
      ...List.generate(e.options.length, (i) {
        var state = _TileState.idle;
        if (_answered) {
          if (i == e.correctIndex) state = _TileState.correct;
          if (i == _selected && i != e.correctIndex) state = _TileState.wrong;
        }
        return _OptionTile(
          text: e.options[i],
          badge: _badges[i % _badges.length],
          state: state,
          accent: widget.accent,
          onTap: () => _tap(i),
        );
      }),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 4. Tap to build
// ═══════════════════════════════════════════════════════════════════════════

class TapBuildWidget extends StatefulWidget {
  final TapBuildExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  const TapBuildWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
  });

  @override
  State<TapBuildWidget> createState() => _TapBuildWidgetState();
}

class _TapBuildWidgetState extends State<TapBuildWidget> {
  /// Indices into wordBank, in the order the user placed them.
  final List<int> _placed = [];
  bool _answered = false;
  bool _wasCorrect = false;

  String _clean(String w) =>
      w.toLowerCase().replaceAll(RegExp(r"[^a-z0-9']"), '');

  void _check() {
    if (_answered || _placed.isEmpty) return;
    final spelling = widget.exercise.isSpelling;
    final String built, target;
    if (spelling) {
      // Chips are letters — compare the spelled word.
      built = _placed
          .map((i) => widget.exercise.wordBank[i].toLowerCase())
          .join();
      target = _clean(widget.exercise.targetEn);
    } else {
      built = _placed
          .map((i) => _clean(widget.exercise.wordBank[i]))
          .where((w) => w.isNotEmpty)
          .join(' ');
      target = widget.exercise.targetEn
          .split(RegExp(r'\s+'))
          .map(_clean)
          .where((w) => w.isNotEmpty)
          .join(' ');
    }
    setState(() {
      _answered = true;
      _wasCorrect = built == target;
    });
    widget.onResult(ExerciseResult(
      correct: _wasCorrect,
      feedback: spelling
          ? 'सही शब्द: "${widget.exercise.targetEn}"'
          : 'सही वाक्य: "${widget.exercise.targetEn}"',
    ));
  }

  Widget _chip(String word, {required bool inAnswer, VoidCallback? onTap}) {
    final borderColor = _answered
        ? (_wasCorrect ? AppColors.success : AppColors.error)
        : widget.accent;
    return GestureDetector(
      onTap: _answered ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: inAnswer ? borderColor.withOpacity(0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: inAnswer ? borderColor : AppColors.locked,
            width: 1.5,
          ),
          boxShadow: inAnswer ? [] : AppShadows.card,
        ),
        child: Text(word,
            style: AppTextStyles.labelLarge.copyWith(
              color: inAnswer ? borderColor : AppColors.textPrimary,
              fontSize: 15,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final e = widget.exercise;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _PromptCard(
        accent: widget.accent,
        big: e.hindi,
        small: e.isSpelling
            ? 'अक्षर जोड़कर अंग्रेज़ी शब्द बनाइए 🔤'
            : 'शब्दों को टैप करके अंग्रेज़ी वाक्य बनाइए 🧩',
      ),
      const SizedBox(height: AppSpacing.lg),

      // Answer area
      Container(
        constraints: const BoxConstraints(minHeight: 64),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: widget.accent.withOpacity(0.3)),
        ),
        child: _placed.isEmpty
            ? Center(
                child: Text(
                    e.isSpelling ? 'यहाँ शब्द बनेगा...' : 'यहाँ वाक्य बनेगा...',
                    style: AppTextStyles.bodyMedium
                        .copyWith(color: AppColors.textHint)),
              )
            : Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _placed
                    .map((i) => _chip(
                          e.wordBank[i],
                          inAnswer: true,
                          onTap: () => setState(() => _placed.remove(i)),
                        ))
                    .toList(),
              ),
      ),
      const SizedBox(height: AppSpacing.lg),

      // Word bank
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(e.wordBank.length, (i) {
          if (_placed.contains(i)) return const SizedBox.shrink();
          return _chip(
            e.wordBank[i],
            inAnswer: false,
            onTap: () => setState(() => _placed.add(i)),
          );
        }),
      ),
      const SizedBox(height: AppSpacing.lg),

      if (!_answered)
        GestureDetector(
          onTap: _placed.isEmpty ? null : _check,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: _placed.isEmpty ? AppColors.locked : widget.accent,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text('जाँचें ✓',
                textAlign: TextAlign.center,
                style: AppTextStyles.labelLarge
                    .copyWith(color: Colors.white, fontSize: 16)),
          ),
        ),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 5. Match pairs
// ═══════════════════════════════════════════════════════════════════════════

class MatchPairsWidget extends StatefulWidget {
  final MatchPairsExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  const MatchPairsWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
  });

  @override
  State<MatchPairsWidget> createState() => _MatchPairsWidgetState();
}

class _MatchPairsWidgetState extends State<MatchPairsWidget> {
  late final List<String> _left; // English, pair order
  late final List<String> _right; // Hindi, shuffled
  int? _selectedLeft;
  final Set<int> _matchedLeft = {}, _matchedRight = {};
  int? _flashWrongRight;
  int _mistakes = 0;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _left = widget.exercise.pairs.map((p) => p.key).toList();
    _right = widget.exercise.pairs.map((p) => p.value).toList()..shuffle();
  }

  void _tapLeft(int i) {
    if (_done || _matchedLeft.contains(i)) return;
    setState(() => _selectedLeft = i);
  }

  void _tapRight(int i) {
    if (_done || _matchedRight.contains(i) || _selectedLeft == null) return;
    final en = _left[_selectedLeft!];
    final correctHi = widget.exercise.pairs
        .firstWhere((p) => p.key == en)
        .value;
    if (_right[i] == correctHi) {
      setState(() {
        _matchedLeft.add(_selectedLeft!);
        _matchedRight.add(i);
        _selectedLeft = null;
      });
      if (_matchedLeft.length == _left.length) _finish();
    } else {
      _mistakes++;
      setState(() => _flashWrongRight = i);
      Future.delayed(const Duration(milliseconds: 450), () {
        if (mounted) setState(() => _flashWrongRight = null);
      });
    }
  }

  void _finish() {
    _done = true;
    widget.onResult(ExerciseResult(
      correct: _mistakes == 0,
      feedback: _mistakes == 0
          ? 'सभी जोड़ियाँ पहली बार में सही! 🎯'
          : '$_mistakes गलत कोशिशें हुईं — जोड़ियाँ फिर से देख लीजिए।',
    ));
  }

  Widget _card(String text,
      {required bool matched,
      required bool selected,
      required bool wrongFlash,
      VoidCallback? onTap}) {
    Color border = AppColors.locked, bg = AppColors.surface;
    Color tc = AppColors.textPrimary;
    if (matched) {
      border = AppColors.success;
      bg = AppColors.success.withOpacity(0.08);
      tc = AppColors.success;
    } else if (wrongFlash) {
      border = AppColors.error;
      bg = AppColors.error.withOpacity(0.08);
      tc = AppColors.error;
    } else if (selected) {
      border = widget.accent;
      bg = widget.accent.withOpacity(0.08);
      tc = widget.accent;
    }
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Text(text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: tc,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _PromptCard(
        accent: widget.accent,
        big: 'जोड़ी मिलाइए 🔗',
        small: 'पहले अंग्रेज़ी वाक्य चुनें, फिर उसका हिंदी अर्थ',
      ),
      const SizedBox(height: AppSpacing.lg),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Column(
            children: List.generate(
              _left.length,
              (i) => _card(
                _left[i],
                matched: _matchedLeft.contains(i),
                selected: _selectedLeft == i,
                wrongFlash: false,
                onTap: () => _tapLeft(i),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            children: List.generate(
              _right.length,
              (i) => _card(
                _right[i],
                matched: _matchedRight.contains(i),
                selected: false,
                wrongFlash: _flashWrongRight == i,
                onTap: () => _tapRight(i),
              ),
            ),
          ),
        ),
      ]),
    ]);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 6. Speak the sentence
// ═══════════════════════════════════════════════════════════════════════════

class SpeakExerciseWidget extends StatefulWidget {
  final SpeakExercise exercise;
  final Color accent;
  final OnExerciseResult onResult;
  final SpeakFn speak;
  const SpeakExerciseWidget({
    super.key,
    required this.exercise,
    required this.accent,
    required this.onResult,
    required this.speak,
  });

  @override
  State<SpeakExerciseWidget> createState() => _SpeakExerciseWidgetState();
}

class _SpeakExerciseWidgetState extends State<SpeakExerciseWidget> {
  bool _listening = false;
  bool _done = false;
  bool _attempted = false;
  String _transcript = '';
  int _lastPercent = 0;

  @override
  void dispose() {
    SpeechService().cancel();
    super.dispose();
  }

  Future<void> _startListening() async {
    if (_done) return;
    final ok = await SpeechService().listen(onResult: (words, isFinal) {
      if (!mounted) return;
      setState(() => _transcript = words);
      if (isFinal) _score(words);
    });
    if (!mounted) return;
    if (!ok) {
      // No mic / permission denied → skip without penalty.
      _done = true;
      widget.onResult(const ExerciseResult(
        correct: true,
        feedback: 'माइक उपलब्ध नहीं है — यह अभ्यास छोड़ दिया गया।',
      ));
      return;
    }
    setState(() {
      _listening = true;
      _transcript = '';
    });
  }

  Future<void> _stopListening() async {
    await SpeechService().stop();
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted && _listening) _score(_transcript);
    });
  }

  void _score(String words) {
    if (_done || !_listening) return;
    final s = SpeechService.scoreAttempt(widget.exercise.sentence.en, words);
    setState(() {
      _listening = false;
      _attempted = true;
      _lastPercent = s.percent;
      _transcript = words;
    });
    // Pass threshold scales with the chapter's level.
    if (s.percent >= widget.exercise.passPercent) {
      _done = true;
      widget.onResult(ExerciseResult(
        correct: true,
        feedback: 'बहुत बढ़िया! उच्चारण ${s.percent}% सही रहा। 🎉',
      ));
    }
  }

  void _skip() {
    if (_done) return;
    _done = true;
    widget.onResult(ExerciseResult(
      correct: false,
      feedback: 'कोई बात नहीं! सही वाक्य: "${widget.exercise.sentence.en}"',
    ));
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.exercise.sentence;
    return Column(children: [
      _PromptCard(
        accent: widget.accent,
        big: s.en,
        small: '${s.hi}  •  माइक दबाकर यह वाक्य बोलिए 🎤',
        trailing: GestureDetector(
          onTap: () => widget.speak(s.en),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.volume_up_rounded,
                color: Colors.white, size: 24),
          ),
        ),
      ),
      const SizedBox(height: AppSpacing.lg),
      if (_transcript.isNotEmpty || _listening)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          margin: const EdgeInsets.only(bottom: AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: _listening
                  ? widget.accent.withOpacity(0.4)
                  : AppColors.locked,
            ),
          ),
          child: Text(
            _listening
                ? (_transcript.isEmpty
                    ? '🎙️ सुन रहे हैं... बोलिए!'
                    : _transcript)
                : 'आपने कहा: $_transcript',
            style: AppTextStyles.bodyLarge
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      if (_attempted && !_done)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(
            '$_lastPercent% मिला — ${widget.exercise.passPercent}% चाहिए। फिर कोशिश करें!',
            style: AppTextStyles.bodyMedium
                .copyWith(color: AppColors.warning),
          ),
        ),
      if (!_done)
        GestureDetector(
          onTap: _listening ? _stopListening : _startListening,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _listening
                    ? [AppColors.error, const Color(0xFFFF8E53)]
                    : [widget.accent, widget.accent.withOpacity(0.7)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: (_listening ? AppColors.error : widget.accent)
                      .withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              _listening ? Icons.stop_rounded : Icons.mic_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      if (!_done && _attempted) ...[
        const SizedBox(height: AppSpacing.md),
        GestureDetector(
          onTap: _skip,
          child: Text('छोड़ें और आगे बढ़ें',
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.textSecondary)),
        ),
      ],
    ]);
  }
}
