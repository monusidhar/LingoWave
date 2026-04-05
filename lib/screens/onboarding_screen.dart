import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../services/progress_service.dart';
import '../services/api_service.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final TextEditingController _nameController = TextEditingController();
  bool _loading = false;

  late AnimationController _animController;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fade = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _animController.forward();
    _prefillName();
  }

  // Pre-fill name from signup if available
  Future<void> _prefillName() async {
    final user = await ApiService.getUser();
    if (user != null && user['name'] != null) {
      final name = user['name'] as String;
      if (name.isNotEmpty && name != 'दोस्त') {
        _nameController.text = name;
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  Future<void> _goToHome() async {
    final name = _nameController.text.trim().isEmpty
        ? 'दोस्त'
        : _nameController.text.trim();

    setState(() => _loading = true);

    // Save locally
    await ProgressService.saveUserName(name);

    // Update streak on first open
    await ApiService.updateStreak();

    if (!mounted) return;
    setState(() => _loading = false);

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HomeScreen(userName: name),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: Column(
            children: [
              // ── Progress Bar ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                child: Row(
                  children: [
                    if (_currentPage > 0)
                      GestureDetector(
                        onTap: () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius:
                                BorderRadius.circular(AppRadius.md),
                            boxShadow: AppShadows.card,
                          ),
                          child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                              color: AppColors.textPrimary),
                        ),
                      )
                    else
                      const SizedBox(width: 40),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppRadius.full),
                        child: LinearProgressIndicator(
                          value: (_currentPage + 1) / 2,
                          minHeight: 6,
                          backgroundColor: AppColors.primaryLight,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primary),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      '${_currentPage + 1}/2',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Pages ───────────────────────────────────────────────
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (i) =>
                      setState(() => _currentPage = i),
                  children: [
                    _buildWelcomePage(),
                    _buildNamePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Page 1: Welcome ────────────────────────────────────────────────────
  Widget _buildWelcomePage() {
    final features = [
      {
        'emoji': '📚',
        'title': '45 अध्याय',
        'sub': 'Basics से Advanced तक',
        'color': AppColors.primary,
      },
      {
        'emoji': '🔥',
        'title': 'रोज़ाना स्ट्रीक',
        'sub': 'हर दिन सीखें, आगे बढ़ें',
        'color': AppColors.accent,
      },
      {
        'emoji': '⚡',
        'title': 'XP & सिक्के कमाएं',
        'sub': 'क्विज़ देकर इनाम पाएं',
        'color': AppColors.accentGold,
      },
      {
        'emoji': '🔊',
        'title': 'उच्चारण सीखें',
        'sub': 'सुनें और बोलें',
        'color': AppColors.success,
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),

          // ── Hero Section ───────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.xl),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
              ),
              borderRadius: BorderRadius.circular(AppRadius.xl),
              boxShadow: AppShadows.elevated,
            ),
            child: Column(
              children: [
                const Text('🌊', style: TextStyle(fontSize: 64)),
                const SizedBox(height: AppSpacing.md),
                const Text(
                  'LingoWave में\nआपका स्वागत है!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'हिंदी से English सीखने का\nसबसे आसान तरीका',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.85),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          Text('आप सीखेंगे:', style: AppTextStyles.headingLarge),
          const SizedBox(height: AppSpacing.md),

          // ── Feature Cards ──────────────────────────────────────────
          ...features.map((f) => Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  boxShadow: AppShadows.card,
                  border: Border.all(
                    color: (f['color'] as Color).withOpacity(0.15),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color:
                            (f['color'] as Color).withOpacity(0.1),
                        borderRadius:
                            BorderRadius.circular(AppRadius.md),
                      ),
                      child: Center(
                        child: Text(f['emoji'] as String,
                            style: const TextStyle(fontSize: 24)),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(f['title'] as String,
                              style: AppTextStyles.labelLarge),
                          Text(f['sub'] as String,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                    Icon(Icons.check_circle_rounded,
                        color: f['color'] as Color, size: 20),
                  ],
                ),
              )),

          const SizedBox(height: AppSpacing.xl),

          PrimaryButton(
            label: 'शुरू करें',
            onTap: _nextPage,
            emoji: '→',
            color: AppColors.primary,
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  // ── Page 2: Name Entry ─────────────────────────────────────────────────
  Widget _buildNamePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),

          // ── Header ─────────────────────────────────────────────────
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.xl),
            ),
            child: const Center(
              child: Text('👋', style: TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('आपको हम\nकिस नाम से\nबुलाएं?',
              style: AppTextStyles.displayLarge.copyWith(height: 1.2)),
          const SizedBox(height: AppSpacing.xs),
          const Text(
            'यह नाम आपके प्रोफ़ाइल पर दिखेगा',
            style: AppTextStyles.bodyMedium,
          ),

          const SizedBox(height: AppSpacing.xl),

          // ── Name Field ─────────────────────────────────────────────
          TextField(
            controller: _nameController,
            style: AppTextStyles.headingMedium,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              hintText: 'जैसे: Rahul, Priya...',
              hintStyle: AppTextStyles.bodyMedium,
              prefixIcon: const Icon(Icons.person_outline_rounded,
                  color: AppColors.textHint),
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.locked),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: const BorderSide(color: AppColors.locked),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide:
                    const BorderSide(color: AppColors.primary, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: AppSpacing.md),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // ── Motivational Card ──────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.06),
                  AppColors.primary.withOpacity(0.02),
                ],
              ),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border:
                  Border.all(color: AppColors.primary.withOpacity(0.15)),
            ),
            child: Row(
              children: [
                const Text('💡', style: TextStyle(fontSize: 24)),
                const SizedBox(width: AppSpacing.md),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'आपका सफ़र यहाँ से शुरू होता है',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'हर दिन थोड़ा सीखें, बड़ा बदलाव लाएं ✨',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // ── What happens next ──────────────────────────────────────
          Text('आगे क्या होगा?',
              style: AppTextStyles.labelLarge
                  .copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: AppSpacing.md),
          _buildNextStep('1', 'अध्याय 1 शुरू होगा',
              'Alphabets & Basics से शुरुआत', AppColors.primary),
          const SizedBox(height: AppSpacing.sm),
          _buildNextStep('2', 'क्विज़ देकर XP कमाएं',
              'हर पाठ के बाद क्विज़ होगा', AppColors.accent),
          const SizedBox(height: AppSpacing.sm),
          _buildNextStep('3', 'अगला अध्याय खुलेगा',
              'एक-एक करके 45 अध्याय पूरे करें', AppColors.success),

          const SizedBox(height: AppSpacing.xl),

          PrimaryButton(
            label: _loading ? 'जारी है...' : 'LingoWave शुरू करें!',
            onTap: _loading ? null : _goToHome,
            emoji: '🚀',
            color: AppColors.success,
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  Widget _buildNextStep(
      String step, String title, String sub, Color color) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Center(
            child: Text(
              step,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.labelLarge),
              Text(sub,
                  style:
                      AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}