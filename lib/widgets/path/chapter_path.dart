import 'package:flutter/material.dart';

import '../../models/lesson_model.dart';
import '../../theme/app_theme.dart';

/// 🗺️ Duolingo-style vertical chapter path (Step 5, v2.4).
///
/// Chapters render as nodes winding down the screen: green ✓ when finished,
/// a highlighted "current" node with a pulsing ring, gray 🔒 when locked.
/// Tap behavior is the caller's (open chapter / coin-unlock dialog) so the
/// existing Home logic keeps working unchanged.
class ChapterPath extends StatelessWidget {
  final List<ChapterModel> chapters;
  final bool Function(int index) isAccessible;
  final void Function(ChapterModel chapter, int index) onChapterTap;

  const ChapterPath({
    super.key,
    required this.chapters,
    required this.isAccessible,
    required this.onChapterTap,
  });

  /// Horizontal winding pattern, in logical pixels from center.
  static const List<double> _offsets = [0, 64, 0, -64];

  double _offsetAt(int i) => _offsets[i % _offsets.length];

  /// The node the learner should play next: first accessible chapter that
  /// isn't fully completed.
  int get _currentIndex {
    for (var i = 0; i < chapters.length; i++) {
      if (isAccessible(i) && !chapters[i].isFullyCompleted) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final current = _currentIndex;
    final children = <Widget>[];
    for (var i = 0; i < chapters.length; i++) {
      if (i > 0) {
        final done = chapters[i - 1].isFullyCompleted;
        children.add(SizedBox(
          height: 36,
          width: double.infinity,
          child: CustomPaint(
            painter: _ConnectorPainter(
              fromX: _offsetAt(i - 1),
              toX: _offsetAt(i),
              color: done
                  ? AppColors.success.withOpacity(0.45)
                  : AppColors.locked,
            ),
          ),
        ));
      }
      children.add(_PathNode(
        chapter: chapters[i],
        accessible: isAccessible(i),
        isCurrent: i == current,
        offsetX: _offsetAt(i),
        color: AppColors.chapterColors[i % AppColors.chapterColors.length],
        onTap: () => onChapterTap(chapters[i], i),
      ));
    }
    return Column(children: children);
  }
}

class _PathNode extends StatefulWidget {
  final ChapterModel chapter;
  final bool accessible;
  final bool isCurrent;
  final double offsetX;
  final Color color;
  final VoidCallback onTap;

  const _PathNode({
    required this.chapter,
    required this.accessible,
    required this.isCurrent,
    required this.offsetX,
    required this.color,
    required this.onTap,
  });

  @override
  State<_PathNode> createState() => _PathNodeState();
}

class _PathNodeState extends State<_PathNode>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100));
    if (widget.isCurrent) _pulse.repeat(reverse: true);
  }

  @override
  void didUpdateWidget(covariant _PathNode old) {
    super.didUpdateWidget(old);
    if (widget.isCurrent && !_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    } else if (!widget.isCurrent && _pulse.isAnimating) {
      _pulse.stop();
      _pulse.value = 0;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final done = widget.chapter.isFullyCompleted;
    final locked = !widget.accessible;
    final baseColor =
        done ? AppColors.success : locked ? AppColors.locked : widget.color;

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: double.infinity,
        child: Column(children: [
          Transform.translate(
            offset: Offset(widget.offsetX, 0),
            child: Column(children: [
              // Node circle with optional pulsing ring for the current node.
              AnimatedBuilder(
                animation: _pulse,
                builder: (context, child) {
                  final ring = widget.isCurrent ? 6 + _pulse.value * 5 : 0.0;
                  return Container(
                    padding: EdgeInsets.all(ring),
                    decoration: widget.isCurrent
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            color: baseColor.withOpacity(0.18),
                          )
                        : null,
                    child: child,
                  );
                },
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: locked ? AppColors.lockedBg : baseColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: locked
                          ? AppColors.locked
                          : baseColor.withOpacity(0.5),
                      width: 3,
                    ),
                    boxShadow: locked
                        ? []
                        : [
                            BoxShadow(
                              color: baseColor.withOpacity(0.35),
                              blurRadius: 14,
                              offset: const Offset(0, 6),
                            ),
                          ],
                  ),
                  child: Center(
                    child: done
                        ? const Icon(Icons.check_rounded,
                            color: Colors.white, size: 32)
                        : locked
                            ? const Icon(Icons.lock_rounded,
                                color: AppColors.locked, size: 26)
                            : Text(
                                '${widget.chapter.id}',
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              // Chapter label under the node.
              SizedBox(
                width: 150,
                child: Column(children: [
                  Text(
                    widget.chapter.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: locked
                          ? AppColors.textHint
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (widget.isCurrent) ...[
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: const Text(
                        'शुरू करें',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ] else if (!locked && !done) ...[
                    const SizedBox(height: 3),
                    Text(
                      '${widget.chapter.lessons.where((l) => l.status == LessonStatus.completed).length}/${widget.chapter.lessons.length} पाठ',
                      style: AppTextStyles.labelSmall
                          .copyWith(fontSize: 10, color: baseColor),
                    ),
                  ],
                ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

/// Soft curved connector between two consecutive nodes.
class _ConnectorPainter extends CustomPainter {
  final double fromX;
  final double toX;
  final Color color;

  _ConnectorPainter({
    required this.fromX,
    required this.toX,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final cx = size.width / 2;
    final path = Path()
      ..moveTo(cx + fromX, 2)
      ..cubicTo(
        cx + fromX,
        size.height * 0.6,
        cx + toX,
        size.height * 0.4,
        cx + toX,
        size.height - 2,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ConnectorPainter old) =>
      old.fromX != fromX || old.toX != toX || old.color != color;
}
