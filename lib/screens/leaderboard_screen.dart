import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/api_service.dart';

class LeaderboardScreen extends StatefulWidget {
  final String currentUserEmail;
  const LeaderboardScreen({super.key, required this.currentUserEmail});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<dynamic> _leaders = [];
  bool _loading = true;
  int _myRank = 0;

  @override
  void initState() {
    super.initState();
    _loadLeaderboard();
  }

  Future<void> _loadLeaderboard() async {
  final result = await ApiService.getLeaderboard();
  final user = await ApiService.getUser();
  if (result['success']) {
    final data = result['data'] as List;
    final myRank = user != null
        ? data.indexWhere((u) => u['id'] == user['id']) + 1
        : 0;
    setState(() {
      _leaders = data;
      _myRank = myRank;
      _loading = false;
    });
  } else {
    setState(() => _loading = false);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // ── Header ───────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: AppSpacing.lg),
                      const Text('🏆',
                          style: TextStyle(fontSize: 52)),
                      const SizedBox(height: AppSpacing.sm),
                      const Text(
                        'लीडरबोर्ड',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'शीर्ष ${_leaders.length} शिक्षार्थी',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          if (_loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_leaders.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('📚',
                        style: TextStyle(fontSize: 52)),
                    const SizedBox(height: AppSpacing.md),
                    Text('अभी कोई डेटा नहीं',
                        style: AppTextStyles.headingMedium),
                    const SizedBox(height: AppSpacing.sm),
                    const Text('पाठ पूरे करके XP कमाएं!',
                        style: AppTextStyles.bodyMedium),
                  ],
                ),
              ),
            )
          else ...[
            // ── Top 3 Podium ─────────────────────────────────────
            if (_leaders.length >= 3)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: _buildPodium(),
                ),
              ),

            // ── Rest of leaderboard ───────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final startIndex =
                        _leaders.length >= 3 ? 3 : 0;
                    final index = startIndex + i;
                    if (index >= _leaders.length)
                      return null;
                    return _buildLeaderItem(
                        _leaders[index], index + 1);
                  },
                  childCount: _leaders.length >= 3
                      ? _leaders.length - 3
                      : _leaders.length,
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

  Widget _buildPodium() {
    final first = _leaders[0];
    final second = _leaders[1];
    final third = _leaders[2];

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.elevated,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 2nd place
          Expanded(child: _buildPodiumItem(second, 2, 80)),
          // 1st place
          Expanded(child: _buildPodiumItem(first, 1, 110)),
          // 3rd place
          Expanded(child: _buildPodiumItem(third, 3, 60)),
        ],
      ),
    );
  }

  Widget _buildPodiumItem(
      dynamic user, int rank, double height) {
    final medals = {1: '🥇', 2: '🥈', 3: '🥉'};
    final colors = {
      1: AppColors.accentGold,
      2: const Color(0xFFC0C0C0),
      3: const Color(0xFFCD7F32),
    };

    return Column(
      children: [
        Text(medals[rank]!,
            style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors[rank]!.withOpacity(0.2),
            shape: BoxShape.circle,
            border: Border.all(color: colors[rank]!, width: 2),
          ),
          child: Center(
            child: Text(
              (user['name'] as String? ?? '?')
                  .isNotEmpty
                  ? (user['name'] as String)[0].toUpperCase()
                  : '?',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: colors[rank],
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          (user['name'] as String? ?? 'User')
              .split(' ')
              .first,
          style: const TextStyle(
            fontFamily: 'Nunito',
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${user['xp'] ?? 0} XP',
          style: TextStyle(
            fontFamily: 'Nunito',
            color: colors[rank],
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: colors[rank]!.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: colors[rank],
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderItem(dynamic user, int rank) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Center(
              child: Text(
                '#$rank',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (user['name'] as String? ?? '?').isNotEmpty
                    ? (user['name'] as String)[0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),

          // Name & streak
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'] as String? ?? 'User',
                  style: AppTextStyles.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(children: [
                  const Text('🔥',
                      style: TextStyle(fontSize: 12)),
                  const SizedBox(width: 2),
                  Text(
                    '${user['streakDays'] ?? 0} दिन',
                    style: AppTextStyles.bodyMedium
                        .copyWith(fontSize: 12),
                  ),
                ]),
              ],
            ),
          ),

          // XP
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${user['xp'] ?? 0} XP',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                'स्तर ${user['level'] ?? 1}',
                style: AppTextStyles.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}