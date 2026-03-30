import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';
import '../services/progress_service.dart';
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
  int _selectedLevel = 0;
  final TextEditingController _nameController = TextEditingController();

  late AnimationController _pageAnimController;
  late Animation<double> _pageAnim;

  final List<Map<String, String>> levels = [
    {'emoji': '🌱', 'label': 'नया शिक्षार्थी', 'sub': 'Beginner'},
    {'emoji': '📖', 'label': 'थोड़ा जानता हूँ', 'sub': 'Elementary'},
    {'emoji': '🚀', 'label': 'मध्यम स्तर', 'sub': 'Intermediate'},
  ];

  @override
  void initState() {
    super.initState();
    _pageAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _pageAnim = CurvedAnimation(
      parent: _pageAnimController,
      curve: Curves.easeOut,
    );
    _pageAnimController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _pageAnimController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  void _goToHome() async {
    final name = _nameController.text.trim().isEmpty
        ? 'दोस्त'
        : _nameController.text.trim();
    await ProgressService.saveUserName(name);
    await ProgressService.saveUserLevel(_selectedLevel);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HomeScreen(userName: name),
        transitionsBuilder: (_, anim, __, child) => FadeTransition(
          opacity: anim,
          child: child,
        ),
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Progress dots
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.md),
              child: Row(
                children: [
                  // Back button
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
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          boxShadow: AppShadows.card,
                        ),
                        child: const Icon(Icons.arrow_back_ios_new_rounded,
                            size: 16, color: AppColors.textPrimary),
                      ),
                    )
                  else
                    const SizedBox(width: 40),
                  const SizedBox(width: AppSpacing.md),
                  // Progress bar
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      child: LinearProgressIndicator(
                        value: (_currentPage + 1) / 3,
                        minHeight: 6,
                        backgroundColor: AppColors.primaryLight,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    '${_currentPage + 1}/3',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  _buildPage1(),
                  _buildPage2(),
                  _buildPage3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Page 1: Level Selection ──────────────────────────────────────────────────
  Widget _buildPage1() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: const Center(
              child: Text('🎓', style: TextStyle(fontSize: 32)),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'आपका स्तर\nक्या है?',
            style: AppTextStyles.displayLarge.copyWith(height: 1.2),
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'हम आपके लिए सही पाठ्यक्रम तैयार करेंगे',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          ...List.generate(
            levels.length,
            (i) => GestureDetector(
              onTap: () => setState(() => _selectedLevel = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: _selectedLevel == i
                      ? AppColors.primary
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                  border: Border.all(
                    color: _selectedLevel == i
                        ? AppColors.primary
                        : AppColors.locked,
                    width: 2,
                  ),
                  boxShadow: _selectedLevel == i ? AppShadows.elevated : [],
                ),
                child: Row(
                  children: [
                    Text(levels[i]['emoji']!,
                        style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            levels[i]['label']!,
                            style: AppTextStyles.labelLarge.copyWith(
                              color: _selectedLevel == i
                                  ? Colors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            levels[i]['sub']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: _selectedLevel == i
                                  ? Colors.white70
                                  : AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_selectedLevel == i)
                      const Icon(Icons.check_circle_rounded,
                          color: Colors.white, size: 22),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'अगला',
            onTap: _nextPage,
            emoji: '→',
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }

  // ── Page 2: Daily Streak / Goal ──────────────────────────────────────────────
  Widget _buildPage2() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          // Illustration
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
              ),
              borderRadius: BorderRadius.circular(AppRadius.xl),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  right: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🔥', style: TextStyle(fontSize: 56)),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      '7 दिन\nरोज़ अभ्यास करें',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingLarge.copyWith(
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'स्ट्रीक बनाएं,\nआगे बढ़ते रहें!',
            style: AppTextStyles.displayMedium.copyWith(height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          const Text(
            'प्रतिदिन थोड़ा सीखें। स्ट्रीक बनाए रखें और XP कमाएं।\nहर दिन नया पाठ आपका इंतज़ार कर रहा है!',
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          // Week indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].asMap().entries.map((e) {
              final active = e.key < 3;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: active ? AppColors.accent : AppColors.lockedBg,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: active ? AppColors.accent : AppColors.locked,
                  ),
                ),
                child: Center(
                  child: active
                      ? const Text('🔥', style: TextStyle(fontSize: 14))
                      : Text(
                          e.value,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textHint,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              );
            }).toList(),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'चलो शुरू करें!',
            onTap: _nextPage,
            emoji: '🚀',
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }

  // ── Page 3: Name Entry ───────────────────────────────────────────────────────
  Widget _buildPage3() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.12),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: const Center(
              child: Text('👋', style: TextStyle(fontSize: 32)),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'आपका स्वागत है!',
            style: AppTextStyles.displayLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'हम आपके लिए पाठ्यक्रम तैयार करेंगे',
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'आपका नाम:',
            style: AppTextStyles.labelLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _nameController,
            style: AppTextStyles.headingMedium,
            decoration: InputDecoration(
              hintText: 'जैसे: Rahul, Priya...',
              hintStyle: AppTextStyles.bodyMedium,
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
          // Motivational card
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.08),
                  AppColors.primary.withOpacity(0.04),
                ],
              ),
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                const Text('💡', style: TextStyle(fontSize: 24)),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'आपका सफ़र यहाँ से शुरू होता है',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'हर दिन थोड़ा सीखें, बड़ा बदलाव लाएं',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          PrimaryButton(
            label: 'शुरू करें!',
            onTap: _goToHome,
            emoji: '✨',
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}