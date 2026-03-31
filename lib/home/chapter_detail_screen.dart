import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/lesson_model.dart';
import '../widgets/common_widgets.dart';
import '../widgets/ad_widgets.dart';
import '../services/progress_service.dart';
import '../services/ad_service.dart';
import 'lesson_screen.dart';

class ChapterDetailScreen extends StatefulWidget {
  final ChapterModel chapter;
  final int colorIndex;

  const ChapterDetailScreen({
    super.key,
    required this.chapter,
    required this.colorIndex,
  });

  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen>
    with RouteAware {
  bool _loading = true;
  bool _isUnlocked = false;
  int _coins = 0;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  /// Called every time this screen becomes visible again
  @override
  void didPopNext() {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    setState(() => _loading = true);

    // Chapter 1 is always free; premium users always unlocked
    final unlocked = await AdService().isChapterUnlocked(widget.chapter.id);
    _coins = AdService().coins;

    await ProgressService.loadChapterProgress(widget.chapter);
    if (mounted) {
      setState(() {
        _isUnlocked = unlocked;
        _loading = false;
      });
    }
  }

  void _onChapterUnlocked() {
    setState(() {
      _isUnlocked = true;
      _coins = AdService().coins;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = AppColors.chapterColors[
        widget.colorIndex % AppColors.chapterColors.length];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // ── App Bar ────────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            // ── Coin badge in AppBar (free users only) ─────────────────
            actions: [
              if (!AdService().isPremium)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.md),
                  child: Center(
                    child: CoinBadge(coins: _coins, color: Colors.white),
                  ),
                ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color,
                      color.withBlue((color.blue + 40).clamp(0, 255))
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -30,
                      right: -30,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),
                    ),
                    // Lock icon shown in header when chapter is locked
                    if (!_isUnlocked && !_loading && widget.chapter.id != 1)
                      Positioned(
                        top: 48,
                        right: AppSpacing.lg,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Text('🔒',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    Positioned(
                      bottom: 20,
                      left: AppSpacing.lg,
                      right: AppSpacing.lg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.full),
                            ),
                            child: Text(
                              'अध्याय ${widget.chapter.id}',
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            widget.chapter.title,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            widget.chapter.titleHindi,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (_loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          // ── LOCKED STATE ────────────────────────────────────────────────
          else if (!_isUnlocked && widget.chapter.id != 1)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: SingleChildScrollView(
                  child: ChapterLockOverlay(
                    chapterId: widget.chapter.id,
                    chapterTitle: widget.chapter.title,
                    onUnlocked: _onChapterUnlocked,
                    accentColor: color,
                  ),
                ),
              ),
            )
          // ── UNLOCKED STATE ──────────────────────────────────────────────
          else ...[
            // Progress Summary
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    boxShadow: AppShadows.card,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStat(
                            '${widget.chapter.lessons.where((l) => l.status == LessonStatus.completed).length}',
                            'पूरे',
                            AppColors.success,
                          ),
                          _buildStat(
                            '${widget.chapter.lessons.length}',
                            'कुल पाठ',
                            color,
                          ),
                          _buildStat(
                            '${widget.chapter.earnedXP}',
                            'XP कमाए',
                            AppColors.accentGold,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      XPBar(
                        current: widget.chapter.earnedXP,
                        total: widget.chapter.totalXP,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Lessons Header
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverToBoxAdapter(
                child: Text('पाठ सूची',
                    style: AppTextStyles.headingLarge),
              ),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(height: AppSpacing.md)),

            // Lessons List
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    // Lock lessons until previous is completed
                    final lessons = widget.chapter.lessons;
                    LessonModel lesson = lessons[i];
                    LessonStatus status = lesson.status;
                    if (i > 0) {
                      final prev = lessons[i - 1];
                      if (prev.status != LessonStatus.completed && status != LessonStatus.completed) {
                        status = LessonStatus.locked;
                      }
                    }
                    // Create a copy with updated status for display
                    final displayLesson = LessonModel(
                      id: lesson.id,
                      title: lesson.title,
                      titleHindi: lesson.titleHindi,
                      emoji: lesson.emoji,
                      type: lesson.type,
                      status: status,
                      totalXP: lesson.totalXP,
                      xpEarned: lesson.xpEarned,
                    );
                    return LessonTile(
                      lesson: displayLesson,
                      activeColor: color,
                      isLast: i == lessons.length - 1,
                      onTap: status == LessonStatus.locked
                          ? null
                          : () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LessonScreen(
                                    lesson: lesson,
                                    chapter: widget.chapter,
                                    accentColor: color,
                                  ),
                                ),
                              );
                              // Reload progress when returning from lesson
                              _loadProgress();
                            },
                    );
                  },
                  childCount: widget.chapter.lessons.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(height: AppSpacing.xxl)),
          ],
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(value,
            style: AppTextStyles.displayMedium.copyWith(color: color)),
        Text(label, style: AppTextStyles.labelSmall),
      ],
    );
  }
}