import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'subscription_service.dart';

/// Central Ad Service for LingoWave
class AdService {
  /// Reset all coins to 0 (for fresh start)
  static Future<void> resetCoins() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_coinsKey, 0);
    _instance._coins = 0;
  }

  static final AdService _instance = AdService._internal();
  factory AdService() => _instance;
  AdService._internal();

  // ─── SharedPreferences Keys ───────────────────────────────────────────────
  static const String _prefix = 'lw_';
  static const String _premiumKey = '${_prefix}is_premium';
  static const String _coinsKey = '${_prefix}coins';
  static const String _lastCoinDateKey = '${_prefix}last_coin_date';

  // ─── Coin Config ──────────────────────────────────────────────────────────
  static const int coinsPerAd = 10;
  static const int coinsPerQuiz = 2;
  static const int coinsPerDailyLogin = 1;
  static const int chapterUnlockCost = 10;

  // ─── AdMob Unit IDs ───────────────────────────────────────────────────────
  // ✅ Your real Ad Unit IDs from AdMob console
  static const String bannerAdUnitId = 'ca-app-pub-2863444084543307/8619814553';
  static const String _interstitialAdId =
      'ca-app-pub-2863444084543307/5768719696';
  // ⚠️ Replace this with your real Rewarded ad unit ID from AdMob
  static const String _rewardedAdId = 'ca-app-pub-3940256099942544/5224354917';

  // ─── Internal State ───────────────────────────────────────────────────────
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  bool _isInterstitialLoading = false;
  bool _isRewardedLoading = false;
  bool _isPremium = false;
  int _coins = 0;

  // ─── Getters ──────────────────────────────────────────────────────────────
  bool get isPremium => _isPremium || SubscriptionService().isPremium;
  int get coins => _coins;
  bool get isInterstitialReady => _interstitialAd != null;
  bool get isRewardedReady => _rewardedAd != null;

  // ══════════════════════════════════════════════════════════════════════════
  // INITIALISATION
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
    await _loadState();

    // ── Sync premium from SubscriptionService ────────────
    if (SubscriptionService().isPremium) {
      _isPremium = true;
    }

    if (!_isPremium) {
      _preloadInterstitial();
      _preloadRewarded();
    }
  }

  Future<void> _loadState() async {
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool(_premiumKey) ?? false;
    _coins = prefs.getInt(_coinsKey) ?? 0;
    await _awardDailyLoginCoin(prefs);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // BANNER AD
  // ══════════════════════════════════════════════════════════════════════════

  /// LingoBannerAd widget creates its own BannerAd using this method.
  /// The widget handles load/fail callbacks and hides itself on failure.
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) => ad.dispose(),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // INTERSTITIAL AD
  // ══════════════════════════════════════════════════════════════════════════

  void _preloadInterstitial() {
    if (_isInterstitialLoading || _interstitialAd != null || _isPremium) return;
    _isInterstitialLoading = true;
    InterstitialAd.load(
      adUnitId: _interstitialAdId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialLoading = false;
          ad.setImmersiveMode(true);
        },
        onAdFailedToLoad: (error) {
          _isInterstitialLoading = false;
          Future.delayed(const Duration(seconds: 30), _preloadInterstitial);
        },
      ),
    );
  }

  Future<void> showInterstitial({required VoidCallback onComplete}) async {
    if (_isPremium || _interstitialAd == null) {
      onComplete();
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _interstitialAd = null;
        _preloadInterstitial();
        onComplete();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _interstitialAd = null;
        _preloadInterstitial();
        onComplete();
      },
    );
    await _interstitialAd!.show();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // REWARDED AD
  // ══════════════════════════════════════════════════════════════════════════

  void _preloadRewarded() {
    if (_isRewardedLoading || _rewardedAd != null) return;
    _isRewardedLoading = true;
    RewardedAd.load(
      adUnitId: _rewardedAdId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedLoading = false;
        },
        onAdFailedToLoad: (error) {
          _isRewardedLoading = false;
          Future.delayed(const Duration(seconds: 30), _preloadRewarded);
        },
      ),
    );
  }

  Future<void> showRewarded({
    required VoidCallback onRewarded,
    required VoidCallback onComplete,
    VoidCallback? onNotReady,
  }) async {
    if (_rewardedAd == null) {
      onNotReady?.call();
      return;
    }
    bool rewarded = false;
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _rewardedAd = null;
        _preloadRewarded();
        if (rewarded) onRewarded();
        onComplete();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _rewardedAd = null;
        _preloadRewarded();
        onComplete();
      },
    );
    await _rewardedAd!.show(
      onUserEarnedReward: (ad, reward) => rewarded = true,
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // COIN SYSTEM
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> _awardDailyLoginCoin(SharedPreferences prefs) async {
    final today = _todayStr();
    final last = prefs.getString(_lastCoinDateKey);
    if (last != today) {
      await _addCoins(coinsPerDailyLogin, prefs);
      await prefs.setString(_lastCoinDateKey, today);
    }
  }

  Future<void> _addCoins(int amount, [SharedPreferences? prefs]) async {
    prefs ??= await SharedPreferences.getInstance();
    _coins += amount;
    await prefs.setInt(_coinsKey, _coins);
  }

  Future<void> _removeCoins(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    _coins = (_coins - amount).clamp(0, 99999);
    await prefs.setInt(_coinsKey, _coins);
  }

  Future<void> awardQuizCoins() async => await _addCoins(coinsPerQuiz);

  Future<void> earnCoinsFromAd({
    required VoidCallback onCoinsEarned,
    required VoidCallback onComplete,
    VoidCallback? onAdNotReady,
  }) async {
    await showRewarded(
      onRewarded: () async {
        await _addCoins(coinsPerAd);
        onCoinsEarned();
      },
      onComplete: onComplete,
      onNotReady: onAdNotReady,
    );
  }

  Future<bool> tryUnlockChapter() async {
    if (_coins >= chapterUnlockCost) {
      await _removeCoins(chapterUnlockCost);
      return true;
    }
    return false;
  }

  Future<bool> isChapterUnlocked(int chapterId) async {
    if (_isPremium) return true;
    if (chapterId == 1) return true;
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('${_prefix}ch${chapterId}_unlocked') ?? false;
  }

  Future<void> markChapterUnlocked(int chapterId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${_prefix}ch${chapterId}_unlocked', true);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PREMIUM
  // ══════════════════════════════════════════════════════════════════════════

  Future<void> setPremium(bool value) async {
    _isPremium = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumKey, value);
  }

  String _todayStr() {
    final d = DateTime.now();
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}
