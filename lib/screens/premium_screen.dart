import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../theme/app_theme.dart';
import '../services/subscription_service.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool _loading = true;
  bool _purchasing = false;
  Package? _package;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadOfferings();
  }

  Future<void> _loadOfferings() async {
  try {
    final offerings = await SubscriptionService().getOfferings();
    print('Offerings: ${offerings?.all.keys}');
    print('Current: ${offerings?.current?.identifier}');
    print('Packages: ${offerings?.current?.availablePackages.map((p) => p.identifier)}');

    if (offerings != null && offerings.current != null) {
      final packages = offerings.current!.availablePackages;

      // ── Pick Lifetime package specifically ────────────
      Package? lifetimePackage;
      for (final package in packages) {
        if (package.packageType == PackageType.lifetime ||
            package.identifier == '\$rc_lifetime' ||
            package.identifier.contains('lifetime')) {
          lifetimePackage = package;
          break;
        }
      }

      if (lifetimePackage != null) {
        setState(() {
          _package = lifetimePackage;
          _loading = false;
        });
        print('Selected package: ${lifetimePackage.identifier}');
        return;
      } else if (packages.isNotEmpty) {
        // Fallback to first package
        setState(() {
          _package = packages.first;
          _loading = false;
        });
      }
    }
  } catch (e) {
    print('Load offerings error: $e');
  }
  setState(() => _loading = false);
}

  Future<void> _purchase() async {
    if (_package == null) {
      _showError('उत्पाद लोड नहीं हो सका। दोबारा कोशिश करें।');
      return;
    }

    setState(() => _purchasing = true);

    final result = await SubscriptionService().purchasePremium(_package!);

    if (!mounted) return;
    setState(() => _purchasing = false);

    if (result['success'] == true) {
      _showSuccess();
    } else if (result['cancelled'] == true) {
      // User cancelled — do nothing
    } else {
      _showError(result['message'] ?? 'खरीद विफल हुई');
    }
  }

  Future<void> _restore() async {
    setState(() => _purchasing = true);
    final result = await SubscriptionService().restorePurchases();
    if (!mounted) return;
    setState(() => _purchasing = false);

    if (result['isPremium'] == true) {
      _showSuccess();
    } else {
      _showError('कोई पुरानी खरीद नहीं मिली');
    }
  }

  void _showSuccess() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            const Text(
              'Premium सक्रिय हो गया!',
              style: AppTextStyles.headingLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'सभी 45 अध्याय अनलॉक हो गए और विज्ञापन हट गए!',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context, true);
            },
            child: const Text('शुरू करें! 🚀'),
          ),
        ],
      ),
    );
  }

  void _showError(String msg) {
    setState(() => _error = msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          // ── Header ───────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF4F46E5),
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
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('💎',
                              style: TextStyle(fontSize: 40)),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      const Text(
                        'LingoWave Premium',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'एक बार खरीदें, जीवन भर सीखें',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Error ─────────────────────────────────────────────
                if (_error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      border: Border.all(
                          color: AppColors.error.withOpacity(0.3)),
                    ),
                    child: Row(children: [
                      const Icon(Icons.error_outline_rounded,
                          color: AppColors.error, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(_error!,
                            style: AppTextStyles.bodyMedium
                                .copyWith(color: AppColors.error)),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _error = null),
                        child: const Icon(Icons.close,
                            color: AppColors.error, size: 18),
                      ),
                    ]),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],

                // ── Benefits ───────────────────────────────────────────
                Text('Premium में क्या मिलेगा?',
                    style: AppTextStyles.headingLarge),
                const SizedBox(height: AppSpacing.md),

                _buildBenefit('🔓', 'सभी 45 अध्याय अनलॉक',
                    'एक बार में पूरा कोर्स access करें',
                    AppColors.primary),
                _buildBenefit('🚫', 'कोई विज्ञापन नहीं',
                    'बिना रुकावट सीखें', AppColors.error),
                _buildBenefit('⚡', 'असीमित XP',
                    'सभी पाठों से XP कमाएं', AppColors.accentGold),
                _buildBenefit('🏆', 'लीडरबोर्ड में आगे',
                    'ज़्यादा पाठ = ज़्यादा XP', AppColors.success),
                _buildBenefit('💎', 'एकमुश्त भुगतान',
                    'कोई मासिक शुल्क नहीं', AppColors.primary),

                const SizedBox(height: AppSpacing.xl),

                // ── Price Card ─────────────────────────────────────────
                Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                    boxShadow: AppShadows.elevated,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'सिर्फ एक बार',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '₹499',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 56,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'Lifetime Access',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      if (_loading || _purchasing)
                        const CircularProgressIndicator(
                            color: Colors.white)
                      else
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _purchase,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppRadius.full),
                              ),
                            ),
                            child: const Text(
                              'अभी खरीदें — ₹499',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF4F46E5),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // ── Restore ───────────────────────────────────────────
                Center(
                  child: TextButton(
                    onPressed: _purchasing ? null : _restore,
                    child: Text(
                      'पुरानी खरीद वापस लाएं',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                // ── Test Button (Dev Only) ────────────────────────────
                // Center(
                //   child: TextButton(
                //     onPressed: () async {
                //       await SubscriptionService().activateTestPremium();
                //       _showSuccess();
                //     },
                //     child: const Text(
                //       '🧪 Test Premium (Dev Only)',
                //       style: TextStyle(
                //         color: AppColors.textHint,
                //         fontSize: 11,
                //       ),
                //     ),
                //   ),
                // ),

                // const SizedBox(height: AppSpacing.sm),

                // ── Terms ─────────────────────────────────────────────
                Center(
                  child: Text(
                    'एकमुश्त भुगतान • कोई auto-renewal नहीं\nGoogle Play द्वारा सुरक्षित',
                    style:
                        AppTextStyles.bodyMedium.copyWith(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefit(
      String emoji, String title, String sub, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.card,
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Center(
              child:
                  Text(emoji, style: const TextStyle(fontSize: 24)),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelLarge),
                Text(sub,
                    style: AppTextStyles.bodyMedium
                        .copyWith(fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.check_circle_rounded, color: color, size: 20),
        ],
      ),
    );
  }
}