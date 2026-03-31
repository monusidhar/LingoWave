import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../services/ad_service.dart';
import '../theme/app_theme.dart';

// ══════════════════════════════════════════════════════════════════════════════
// BANNER AD WIDGET
// Zero height until ad actually fills. No blank bar ever shown.
// ══════════════════════════════════════════════════════════════════════════════

class LingoBannerAd extends StatefulWidget {
  const LingoBannerAd({super.key});

  @override
  State<LingoBannerAd> createState() => _LingoBannerAdState();
}

class _LingoBannerAdState extends State<LingoBannerAd> {
  BannerAd? _ad;
  bool _adLoaded = false; // only true when ad ACTUALLY fills

  @override
  void initState() {
    super.initState();
    if (!AdService().isPremium) {
      _loadAd();
    }
  }

  void _loadAd() {
    _ad = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // Ad filled — now render it
          if (mounted) setState(() => _adLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          // No fill — dispose and show nothing (no blank bar)
          ad.dispose();
          _ad = null;
          // Don't update state — widget stays SizedBox.shrink()
        },
      ),
    );
    _ad!.load();
  }

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Return zero-size widget in ALL cases except a confirmed filled ad
    if (AdService().isPremium || !_adLoaded || _ad == null) {
      return const SizedBox.shrink();
    }

    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
          ),
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: _ad!.size.height.toDouble(),
        child: AdWidget(ad: _ad!),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// COIN DISPLAY BADGE
// ══════════════════════════════════════════════════════════════════════════════

class CoinBadge extends StatelessWidget {
  final int coins;
  final Color? color;
  const CoinBadge({super.key, required this.coins, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (color ?? AppColors.accentGold).withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
        border: Border.all(
            color: (color ?? AppColors.accentGold).withOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🪙', style: TextStyle(fontSize: 13)),
          const SizedBox(width: 4),
          Text(
            '$coins',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: color ?? AppColors.accentGold,
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CHAPTER LOCK OVERLAY
// ══════════════════════════════════════════════════════════════════════════════

class ChapterLockOverlay extends StatefulWidget {
  final int chapterId;
  final String chapterTitle;
  final VoidCallback onUnlocked;
  final Color accentColor;

  const ChapterLockOverlay({
    super.key,
    required this.chapterId,
    required this.chapterTitle,
    required this.onUnlocked,
    required this.accentColor,
  });

  @override
  State<ChapterLockOverlay> createState() => _ChapterLockOverlayState();
}

class _ChapterLockOverlayState extends State<ChapterLockOverlay> {
  final _ads = AdService();
  bool _loading = false;

  Future<void> _watchAd() async {
    setState(() => _loading = true);
    await _ads.earnCoinsFromAd(
      onCoinsEarned: () async {
        final unlocked = await _ads.tryUnlockChapter();
        if (unlocked) {
          await _ads.markChapterUnlocked(widget.chapterId);
          if (mounted) {
            _showSuccess('विज्ञापन देखकर अनलॉक किया! 🎉');
            widget.onUnlocked();
          }
        }
      },
      onComplete: () {
        if (mounted) setState(() => _loading = false);
      },
      onAdNotReady: () {
        if (mounted) {
          setState(() => _loading = false);
          _showError('विज्ञापन अभी तैयार नहीं है, थोड़ी देर बाद कोशिश करें।');
        }
      },
    );
  }

  Future<void> _useCoins() async {
    if (_ads.coins < AdService.chapterUnlockCost) {
      _showError(
          'पर्याप्त सिक्के नहीं हैं। ${AdService.chapterUnlockCost - _ads.coins} सिक्के और चाहिए।');
      return;
    }
    setState(() => _loading = true);
    final unlocked = await _ads.tryUnlockChapter();
    if (unlocked) {
      await _ads.markChapterUnlocked(widget.chapterId);
      if (mounted) {
        _showSuccess('सिक्कों से अनलॉक किया! 🪙');
        widget.onUnlocked();
      }
    }
    if (mounted) setState(() => _loading = false);
  }

  void _showSuccess(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg,
          style: const TextStyle(
              fontFamily: 'Nunito', fontWeight: FontWeight.w700)),
      backgroundColor: AppColors.success,
      duration: const Duration(seconds: 2),
    ));
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg, style: const TextStyle(fontFamily: 'Nunito')),
      backgroundColor: AppColors.error,
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final coinsNeeded = AdService.chapterUnlockCost;
    final hasEnoughCoins = _ads.coins >= coinsNeeded;

    return Container(
      margin: const EdgeInsets.all(AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.elevated,
        border: Border.all(color: widget.accentColor.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: widget.accentColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text('🔒', style: TextStyle(fontSize: 36)),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text('अध्याय बंद है', style: AppTextStyles.headingLarge),
          const SizedBox(height: AppSpacing.xs),
          Text(
            widget.chapterTitle,
            style:
                AppTextStyles.bodyMedium.copyWith(color: widget.accentColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Coins status
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.accentGold.withOpacity(0.08),
              borderRadius: BorderRadius.circular(AppRadius.md),
              border:
                  Border.all(color: AppColors.accentGold.withOpacity(0.3)),
            ),
            child: Row(children: [
              const Text('🪙', style: TextStyle(fontSize: 20)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('आपके सिक्के: ${_ads.coins}',
                      style: AppTextStyles.labelLarge
                          .copyWith(color: AppColors.accentGold)),
                  Text('अनलॉक करने के लिए: $coinsNeeded सिक्के',
                      style:
                          AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ]),
              ),
            ]),
          ),
          const SizedBox(height: AppSpacing.lg),

          if (_loading)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: CircularProgressIndicator(),
            )
          else ...[
            // Watch Ad button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _watchAd,
                icon: const Text('📺', style: TextStyle(fontSize: 18)),
                label: const Text(
                  'विज्ञापन देखें → 10 सिक्के पाएं',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            // Use Coins button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: hasEnoughCoins ? _useCoins : null,
                icon: const Text('🪙', style: TextStyle(fontSize: 16)),
                label: Text(
                  hasEnoughCoins
                      ? 'सिक्कों से अनलॉक करें ($coinsNeeded 🪙)'
                      : '${coinsNeeded - _ads.coins} सिक्के और चाहिए',
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: hasEnoughCoins
                      ? AppColors.accentGold
                      : AppColors.textHint,
                  side: BorderSide(
                      color: hasEnoughCoins
                          ? AppColors.accentGold
                          : AppColors.locked),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Earn coins hint
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(children: [
                const Text('💡', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'सिक्के कमाएं: विज्ञापन देखें (+10), क्विज़ दें (+2), रोज़ खोलें (+1)',
                    style:
                        AppTextStyles.bodyMedium.copyWith(fontSize: 11),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: AppSpacing.md),

            // Premium CTA
            GestureDetector(
              onTap: () {
                // Navigate to premium screen
              },
              child: Text(
                '✨ Premium लें — सभी अध्याय बिना विज्ञापन के',
                style: AppTextStyles.labelSmall.copyWith(
                  color: widget.accentColor,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }
}