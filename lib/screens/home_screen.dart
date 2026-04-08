import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/chapter1_data.dart';
import '../models/lesson_model.dart';
import '../widgets/common_widgets.dart';
import '../home/chapter_detail_screen.dart';
import '../services/progress_service.dart';
import '../services/api_service.dart';
import '../screens/login_screen.dart';
import '../screens/leaderboard_screen.dart';
import '../services/ad_service.dart';

int _totalXPBackend = 0;
int _coinsBackend = 0;
int _completedLessonsBackend = 0;
int _levelBackend = 1;

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _navIndex = 0;
  final List<ChapterModel> _chapters = Chapter1Data.chapters;
  int _streak = 0;

  late AnimationController _headerAnim;
  late Animation<double> _headerFade;
  late Animation<Offset> _headerSlide;

  @override
  void initState() {
    super.initState();
    _headerAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _headerFade = CurvedAnimation(parent: _headerAnim, curve: Curves.easeOut);
    _headerSlide = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _headerAnim, curve: Curves.easeOut));
    _headerAnim.forward();
    _loadAll();
  }

  Future<void> _loadAll() async {
    // ── Get streak from backend ──────────────────────────
    final streakResult = await ApiService.updateStreak();
    if (streakResult['success'] && streakResult['data'] != null) {
      _streak = streakResult['data']['streakDays'] ?? 0;
    } else {
      _streak = await ProgressService.loadStreak();
    }

    // ── Get profile from backend ─────────────────────────
    final profileResult = await ApiService.getProfile();
    if (profileResult['success'] && profileResult['data'] != null) {
      final data = profileResult['data'];
      _totalXPBackend = data['xp'] ?? 0;
      _coinsBackend = data['coins'] ?? 0;
      _levelBackend = data['level'] ?? 1;
    }

    // ── Get stats from backend ───────────────────────────
    final statsResult = await ApiService.getStats();
    if (statsResult['success'] && statsResult['data'] != null) {
      final data = statsResult['data'];
      _completedLessonsBackend = data['completedLessons'] ?? 0;
    }

    // ── Optionally: update local progress with backend data here ──
    // (Implement if you want offline support, otherwise skip)

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _headerAnim.dispose();
    super.dispose();
  }

  int get _totalXP => _chapters.fold(0, (s, c) => s + c.earnedXP);
  int get _levelXP => 1000;

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'सुप्रभात 🌅';
    if (hour < 17) return 'नमस्ते ☀️';
    return 'शुभ संध्या 🌆';
  }

  /// A chapter is accessible if:
  /// - It's chapter 1 (always open), OR
  /// - The previous chapter in the list is fully completed
  bool _isChapterAccessible(int listIndex) {
    if (listIndex == 0) return true;
    final prev = _chapters[listIndex - 1];
    return prev.isFullyCompleted;
  }

  /// Find the active chapter — the first one that is accessible but not complete
  int _activeChapterIndex() {
    for (int i = 0; i < _chapters.length; i++) {
      if (_isChapterAccessible(i) && !_chapters[i].isFullyCompleted) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: IndexedStack(
        index: _navIndex,
        children: [
          _buildHomeTab(),
          _buildProgressTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHomeTab() {
    final activeIdx = _activeChapterIndex();
    final activeChapter = _chapters[activeIdx];

    // Find the first in-progress lesson in active chapter
    final activeLesson = activeChapter.lessons.firstWhere(
      (l) => l.status == LessonStatus.inProgress,
      orElse: () => activeChapter.lessons.first,
    );

    return CustomScrollView(
      slivers: [
        // ── Header ────────────────────────────────────────────────────────
        SliverToBoxAdapter(
          child: FadeTransition(
            opacity: _headerFade,
            child: SlideTransition(
              position: _headerSlide,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF4F46E5), Color(0xFF6D28D9)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.lg,
                        AppSpacing.md, AppSpacing.lg, AppSpacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getGreeting(),
                                  style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 13,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${widget.userName} जी!',
                                  style: const TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            StreakBadge(streak: _streak),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        // XP Bar
                        Row(
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
                                'स्तर ${(_totalXP / _levelXP).floor() + 1}',
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.full),
                                child: LinearProgressIndicator(
                                  value: (_totalXP % _levelXP) / _levelXP,
                                  minHeight: 8,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          AppColors.accentGold),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(
                              '$_totalXP XP',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),

        // ── Continue Card ──────────────────────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          sliver: SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChapterDetailScreen(
                      chapter: activeChapter,
                      colorIndex: activeIdx,
                    ),
                  ),
                );
                _loadAll(); // refresh after returning
              },
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: AppShadows.button,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                      child: Center(
                        child: Text(
                          activeLesson.emoji,
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'अध्याय ${activeChapter.id} — जारी रखें →',
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'पाठ ${activeLesson.id}: ${activeLesson.title}',
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            activeLesson.titleHindi,
                            style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded,
                          color: Colors.white, size: 22),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.lg)),

        // ── Section Title ────────────────────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          sliver: SliverToBoxAdapter(
            child: Text('आपकी यात्रा', style: AppTextStyles.headingLarge),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

        // ── Chapter Cards ────────────────────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final accessible = _isChapterAccessible(i);
                return ChapterCard(
                  chapter: _chapters[i],
                  colorIndex: i,
                  // Force locked appearance for inaccessible chapters
                  forceShowLocked: !accessible,
                  onTap: accessible
                      ? () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChapterDetailScreen(
                                chapter: _chapters[i],
                                colorIndex: i,
                              ),
                            ),
                          );
                          _loadAll(); // refresh after returning
                        }
                      : null,
                );
              },
              childCount: _chapters.length,
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
      ],
    );
  }

  Widget _buildProgressTab() {
    final level = _levelBackend;
    final xpForNextLevel = level * 500;
    final currentLevelXp = _totalXPBackend % 500;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('प्रगति', style: AppTextStyles.displayMedium),
            const SizedBox(height: AppSpacing.lg),

            // ── XP Card ─────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                ),
                borderRadius: BorderRadius.circular(AppRadius.xl),
                boxShadow: AppShadows.elevated,
              ),
              child: Column(children: [
                const Text('कुल XP',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white70,
                        fontSize: 14)),
                const SizedBox(height: 4),
                Text('$_totalXPBackend',
                    style: const TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.w900)),
                const Text('XP Points',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Colors.white70,
                        fontSize: 14)),
                const SizedBox(height: AppSpacing.md),
                // Level progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                  child: LinearProgressIndicator(
                    value: currentLevelXp / 500,
                    minHeight: 8,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.accentGold),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'स्तर $level',
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white70,
                          fontSize: 12),
                    ),
                    Text(
                      '$currentLevelXp / 500 XP',
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white70,
                          fontSize: 12),
                    ),
                  ],
                ),
              ]),
            ),

            const SizedBox(height: AppSpacing.lg),

            // ── Stats Row ────────────────────────────────────────────
            Row(children: [
              Expanded(
                child: _buildStatCard(
                    '🔥', '$_streak', 'दिन की स्ट्रीक', AppColors.accent),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildStatCard('📖', '$_completedLessonsBackend',
                    'पाठ पूरे', AppColors.success),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildStatCard(
                    '🪙', '$_coinsBackend', 'सिक्के', AppColors.accentGold),
              ),
            ]),

            const SizedBox(height: AppSpacing.lg),

            // ── Chapter Progress ─────────────────────────────────────
            Text('अध्याय प्रगति', style: AppTextStyles.headingLarge),
            const SizedBox(height: AppSpacing.md),

            ..._chapters.asMap().entries.map((entry) {
              final i = entry.key;
              final chapter = entry.value;
              final completed = chapter.lessons
                  .where((l) => l.status == LessonStatus.completed)
                  .length;
              final total = chapter.lessons.length;
              final accessible = _isChapterAccessible(i);

              if (!accessible) return const SizedBox.shrink();

              return Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'अध्याय ${chapter.id}: ${chapter.title}',
                            style: AppTextStyles.labelLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '$completed/$total',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.success),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      child: LinearProgressIndicator(
                        value: total > 0 ? completed / total : 0,
                        minHeight: 6,
                        backgroundColor: AppColors.primaryLight,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.success),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String emoji, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.headingMedium.copyWith(color: color)),
        Text(label,
            style: AppTextStyles.labelSmall, textAlign: TextAlign.center),
      ]),
    );
  }

  Widget _buildProfileTab() {
    final user = _chapters; // just for reference
    final level = _levelBackend;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(children: [
          const SizedBox(height: AppSpacing.lg),

          // ── Avatar ───────────────────────────────────────────────
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)]),
              shape: BoxShape.circle,
              boxShadow: AppShadows.elevated,
            ),
            child: Center(
              child: Text(
                widget.userName.isNotEmpty
                    ? widget.userName[0].toUpperCase()
                    : '👤',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(widget.userName, style: AppTextStyles.displayMedium),
          Text('LingoWave शिक्षार्थी',
              style:
                  AppTextStyles.bodyMedium.copyWith(color: AppColors.primary)),

          const SizedBox(height: AppSpacing.xl),

          // ── Stats Grid ───────────────────────────────────────────
          Row(children: [
            Expanded(
              child: _buildProfileStat(
                '⚡',
                '$_totalXPBackend XP',
                'कुल अनुभव',
                AppColors.primary,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildProfileStat(
                '⭐',
                'स्तर $level',
                'वर्तमान स्तर',
                AppColors.accentGold,
              ),
            ),
          ]),
          const SizedBox(height: AppSpacing.md),
          Row(children: [
            Expanded(
              child: _buildProfileStat(
                '🔥',
                '$_streak दिन',
                'स्ट्रीक',
                AppColors.accent,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildProfileStat(
                '🪙',
                '$_coinsBackend',
                'सिक्के',
                AppColors.accentGold,
              ),
            ),
          ]),
          const SizedBox(height: AppSpacing.md),
          Row(children: [
            Expanded(
              child: _buildProfileStat(
                '📖',
                '$_completedLessonsBackend',
                'पाठ पूरे',
                AppColors.success,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _buildProfileStat(
                '📚',
                '${_chapters.where((c) => c.isFullyCompleted).length}',
                'अध्याय पूरे',
                AppColors.primary,
              ),
            ),
          ]),

          const SizedBox(height: AppSpacing.md),

// ── Leaderboard Button ─────────────────────────────
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                final user = await ApiService.getUser();
                if (!mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LeaderboardScreen(
                      currentUserEmail: user?['email'] ?? '',
                    ),
                  ),
                );
              },
              icon: const Text('🏆', style: TextStyle(fontSize: 18)),
              label: const Text(
                'लीडरबोर्ड देखें',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // ── App Info ─────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              boxShadow: AppShadows.card,
            ),
            child: Row(children: [
              const Text('🌊', style: TextStyle(fontSize: 24)),
              const SizedBox(width: AppSpacing.md),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('LingoWave',
                    style: AppTextStyles.labelLarge
                        .copyWith(color: AppColors.primary)),
                const Text('हिंदी से English सीखें',
                    style: AppTextStyles.bodyMedium),
              ]),
            ]),
          ),

          const SizedBox(height: AppSpacing.md),

          // ── Logout Button ─────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout_rounded,
                  color: AppColors.error, size: 20),
              label: const Text(
                'लॉगआउट करें',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                  color: AppColors.error,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.error),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xxl),
        ]),
      ),
    );
  }

  Widget _buildProfileStat(
      String emoji, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Column(children: [
        Text(emoji, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 6),
        Text(value, style: AppTextStyles.headingMedium.copyWith(color: color)),
        Text(label,
            style: AppTextStyles.labelSmall, textAlign: TextAlign.center),
      ]),
    );
  }

  Future<void> _logout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('लॉगआउट करें?', style: AppTextStyles.headingMedium),
        content: const Text('क्या आप वाकई लॉगआउट करना चाहते हैं?',
            style: AppTextStyles.bodyMedium),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('रद्द करें'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child:
                const Text('लॉगआउट', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // ── Clear ALL local data ──────────────────────────
      await ProgressService.resetAll();
      await AdService.resetCoins();
      await ApiService.clearAuth();

      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
        (route) => false,
      );
    }
  }

  Widget _buildProfileItem(
      IconData icon, String value, String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: AppShadows.card,
      ),
      child: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(value, style: AppTextStyles.labelLarge),
            Text(label, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
          ]),
        ),
      ]),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      {'icon': Icons.home_rounded, 'label': 'होम'},
      {'icon': Icons.bar_chart_rounded, 'label': 'प्रगति'},
      {'icon': Icons.person_rounded, 'label': 'प्रोफ़ाइल'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.asMap().entries.map((entry) {
              final i = entry.key;
              final item = entry.value;
              final active = _navIndex == i;
              return GestureDetector(
                onTap: () => setState(() => _navIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.primary.withOpacity(0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: active ? AppColors.primary : AppColors.textHint,
                        size: 22,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 10,
                          fontWeight:
                              active ? FontWeight.w700 : FontWeight.w500,
                          color:
                              active ? AppColors.primary : AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
