import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../theme/app_theme.dart';
import '../models/lesson_model.dart';

// ─── XP Progress Bar ───────────────────────────────────────────────────────────
class XPBar extends StatefulWidget {
  final int current;
  final int total;
  final bool showLabel;

  const XPBar({
    super.key,
    required this.current,
    required this.total,
    this.showLabel = true,
  });

  @override
  State<XPBar> createState() => _XPBarState();
}

class _XPBarState extends State<XPBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _oldValue = widget.total == 0 ? 0 : widget.current / widget.total;
    _animation = Tween<double>(
      begin: 0,
      end: _oldValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant XPBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    final double newValue = widget.total == 0
        ? 0.0
        : widget.current.toDouble() / widget.total.toDouble();
    if (newValue != _oldValue) {
      _animation = Tween<double>(
        begin: _oldValue,
        end: newValue,
      ).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
      _controller
        ..reset()
        ..forward();
      _oldValue = newValue;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('⚡', style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 4),
                  Text(
                    '${widget.current} XP',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.accentGold,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.total} XP',
                style: AppTextStyles.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.full),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) => LinearProgressIndicator(
              value: _animation.value,
              minHeight: 8,
              backgroundColor: AppColors.primaryLight,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.accentGold),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Streak Badge ───────────────────────────────────────────────────────────────
class StreakBadge extends StatelessWidget {
  final int streak;

  const StreakBadge({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🔥', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 4),
          Text(
            '$streak दिन',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Chapter Card ───────────────────────────────────────────────────────────────
class ChapterCard extends StatelessWidget {
  final ChapterModel chapter;
  final int colorIndex;
  final VoidCallback? onTap;

  /// Set true to force the lock appearance regardless of chapter.status
  final bool forceShowLocked;

  const ChapterCard({
    super.key,
    required this.chapter,
    required this.colorIndex,
    this.onTap,
    this.forceShowLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    // Show locked if forced OR if chapter.status is locked
    final isLocked = forceShowLocked || chapter.status == LessonStatus.locked;
    final color =
        AppColors.chapterColors[colorIndex % AppColors.chapterColors.length];

    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: isLocked ? AppColors.lockedBg : AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: isLocked ? AppColors.locked : color.withOpacity(0.25),
            width: 1.5,
          ),
          boxShadow: isLocked ? [] : AppShadows.card,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                // Chapter number badge
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLocked ? AppColors.locked : color,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Center(
                    child: Text(
                      '${chapter.id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapter.title,
                        style: AppTextStyles.headingMedium.copyWith(
                          color: isLocked
                              ? AppColors.textHint
                              : AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        chapter.titleHindi,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: isLocked ? AppColors.textHint : color,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLocked)
                  const Icon(Icons.lock_rounded,
                      color: AppColors.locked, size: 20)
                else if (chapter.progress == 1.0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_rounded,
                        color: AppColors.success, size: 16),
                  ),
              ]),
              if (!isLocked) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  chapter.description,
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 12),
                ),
                const SizedBox(height: AppSpacing.sm),
                XPBar(
                  current: chapter.earnedXP,
                  total: chapter.totalXP,
                  showLabel: false,
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${chapter.lessons.where((l) => l.status == LessonStatus.completed).length}/${chapter.lessons.length} पाठ पूरे',
                      style: AppTextStyles.labelSmall,
                    ),
                    Text(
                      '${chapter.earnedXP}/${chapter.totalXP} XP',
                      style: AppTextStyles.labelSmall
                          .copyWith(color: AppColors.accentGold),
                    ),
                  ],
                ),
              ] else ...[
                const SizedBox(height: AppSpacing.sm),
                // Show which chapter needs to be completed to unlock this one
                Text(
                  'अध्याय ${chapter.id - 1} पूरा करने पर खुलेगा',
                  style: AppTextStyles.labelSmall
                      .copyWith(color: AppColors.textHint),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Lesson Tile ────────────────────────────────────────────────────────────────
class LessonTile extends StatelessWidget {
  final LessonModel lesson;
  final Color activeColor;
  final VoidCallback? onTap;
  final bool isLast;

  const LessonTile({
    super.key,
    required this.lesson,
    required this.activeColor,
    this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLocked = lesson.status == LessonStatus.locked;
    final isCompleted = lesson.status == LessonStatus.completed;
    final isActive = lesson.status == LessonStatus.inProgress;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          SizedBox(
            width: 48,
            child: Column(
              children: [
                // Circle
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.success
                        : isActive
                            ? activeColor
                            : AppColors.lockedBg,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.success
                          : isActive
                              ? activeColor
                              : AppColors.locked,
                      width: 2,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: activeColor.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            )
                          ]
                        : [],
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(Icons.check_rounded,
                            color: Colors.white, size: 20)
                        : isLocked
                            ? const Icon(Icons.lock_rounded,
                                color: AppColors.locked, size: 18)
                            : Text(
                                lesson.emoji,
                                style: const TextStyle(fontSize: 20),
                              ),
                  ),
                ),
                // Connecting line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isCompleted
                          ? AppColors.success.withOpacity(0.3)
                          : AppColors.locked,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          // Content
          Expanded(
            child: GestureDetector(
              onTap: isLocked ? null : onTap,
              child: Container(
                margin: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: isLocked
                      ? AppColors.lockedBg
                      : isActive
                          ? activeColor.withOpacity(0.06)
                          : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: isActive
                      ? Border.all(
                          color: activeColor.withOpacity(0.4), width: 1.5)
                      : null,
                  boxShadow: isActive ? AppShadows.card : [],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson.title,
                            style: AppTextStyles.labelLarge.copyWith(
                              color: isLocked
                                  ? AppColors.textHint
                                  : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            lesson.titleHindi,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontSize: 12,
                              color:
                                  isLocked ? AppColors.textHint : activeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                        child: const Text(
                          'जारी रखें',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    else if (isCompleted)
                      Text(
                        '+${lesson.totalXP} XP',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.accentGold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Primary Button ─────────────────────────────────────────────────────────────
class PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? color;
  final bool isFullWidth;
  final String? emoji;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.color,
    this.isFullWidth = true,
    this.emoji,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );
    _scale = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.color ?? AppColors.accent;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          width: widget.isFullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(AppRadius.full),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.35),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:
                widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (widget.emoji != null) ...[
                Text(widget.emoji!, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.labelLarge.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Info Card ──────────────────────────────────────────────────────────────────
class InfoCard extends StatelessWidget {
  final String emoji;
  final String titleEn;
  final String titleHi;
  final Color color;
  final Widget? trailing;

  const InfoCard({
    super.key,
    required this.emoji,
    required this.titleEn,
    required this.titleHi,
    required this.color,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleEn, style: AppTextStyles.labelLarge),
                Text(
                  titleHi,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 12,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class LessonCommonWidgets {
  final FlutterTts tts;
  final String? speakingText;
  final Function(String) onSpeak;
  final Function() onStop;
  final VoidCallback? setStateCallback;
  final Color accentColor;

  LessonCommonWidgets({
    required this.tts,
    required this.speakingText,
    required this.onSpeak,
    required this.onStop,
    required this.setStateCallback,
    required this.accentColor,
  });

  Widget ttsButton(String text, {Color? color}) {
    final isSpeaking = speakingText == text;
    final c = color ?? accentColor;
    return GestureDetector(
      onTap: () => isSpeaking ? onStop() : onSpeak(text),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSpeaking ? c : c.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
          color: isSpeaking ? Colors.white : c,
          size: 18,
        ),
      ),
    );
  }

  Widget buildLessonIntro(String hindi, String english) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.06),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(hindi,
              style: AppTextStyles.bodyMedium
                  .copyWith(color: AppColors.textPrimary)),
          const SizedBox(height: AppSpacing.sm),
          Text(
            english,
            style: AppTextStyles.bodyMedium.copyWith(
              fontStyle: FontStyle.italic,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionCard({
    required String title,
    required String subtitle,
    required Color color,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: AppTextStyles.headingMedium.copyWith(color: color)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(subtitle,
                    style: AppTextStyles.labelSmall.copyWith(color: color)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }

  Widget phraseGroupHeader(
      String emoji, String title, String subtitle, Color color) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: AppTextStyles.labelLarge.copyWith(color: color)),
              Text(subtitle,
                  style: AppTextStyles.labelSmall.copyWith(color: color)),
            ],
          ),
        ],
      ),
    );
  }

  Widget quizStatBadge(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              )),
          Text(label,
              style: const TextStyle(
                  fontFamily: 'Nunito', color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }

  Widget quizStatBadge2(String value, String label) =>
      quizStatBadge(value, label);

  Widget ruleRow(String condition, String result) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(condition, style: AppTextStyles.bodyMedium),
          ),
          Expanded(
            flex: 2,
            child: Text(result,
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.warning, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget caseRow(String label, String letters) {
    return Row(
      children: [
        SizedBox(
          width: 160,
          child: Text(label,
              style:
                  AppTextStyles.bodyMedium.copyWith(color: AppColors.primary)),
        ),
        Text('— ', style: AppTextStyles.bodyMedium),
        Expanded(
          child: Text(letters,
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.textPrimary)),
        ),
      ],
    );
  }

  Widget amPmRow(String emoji, String hindi, String suffix, Color color) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(hindi, style: AppTextStyles.bodyMedium),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(suffix,
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 14)),
        ),
      ],
    );
  }

  Widget greetPill(String label, String text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bodyMedium),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.full),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(text,
                    style: AppTextStyles.labelLarge
                        .copyWith(color: color, fontSize: 12)),
              ),
              const SizedBox(width: 4),
              ttsButton(text, color: color),
            ],
          ),
        ),
      ],
    );
  }

  Widget formalRow(String label, String example, bool isFormal) {
    final color = isFormal ? AppColors.primary : AppColors.accent;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.full),
          ),
          child: Text(label,
              style: AppTextStyles.labelSmall.copyWith(color: color)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(example,
              style: AppTextStyles.bodyMedium
                  .copyWith(fontStyle: FontStyle.italic)),
        ),
        ttsButton(example, color: color),
      ],
    );
  }

  Widget buildChain() {
    final items = [
      {'emoji': '🔤', 'en': 'Letters', 'hi': 'अक्षर', 'example': 'A, B, C...'},
      {'emoji': '📝', 'en': 'Word', 'hi': 'शब्द', 'example': 'Hello'},
      {
        'emoji': '💬',
        'en': 'Sentence',
        'hi': 'वाक्य',
        'example': 'He is good.'
      },
      {
        'emoji': '📄',
        'en': 'Paragraph',
        'hi': 'पैराग्राफ',
        'example': 'Multiple sentences.'
      },
    ];
    return Column(
      children: items.asMap().entries.map((e) {
        final i = e.key;
        final item = e.value;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Text(item['emoji']!, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(item['en']!, style: AppTextStyles.labelLarge),
                          const SizedBox(width: 8),
                          Text('(${item['hi']!})',
                              style: AppTextStyles.bodyMedium
                                  .copyWith(color: accentColor, fontSize: 12)),
                        ]),
                        Text(item['example']!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (i < items.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Icon(Icons.arrow_downward_rounded,
                    color: accentColor, size: 20),
              ),
          ],
        );
      }).toList(),
    );
  }
}
