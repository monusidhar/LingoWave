import 'package:shared_preferences/shared_preferences.dart';

import 'subscription_service.dart';

/// ❤️ Hearts / lives (Step 5, v2.4).
///
/// - Start with [maxHearts]; a wrong answer in a LESSON session costs one.
/// - Refill 1 heart every [refillMinutes] minutes, up to full.
/// - A rewarded ad refills to full instantly; premium users are unlimited.
/// - Practice screens (mistakes review, SRS, speaking) never cost hearts.
///
/// Local-first (`lw_` prefix — cleared on logout). Every method takes an
/// optional [now] so tests can fast-forward time.
class HeartsService {
  static const String _countKey = 'lw_hearts';
  static const String _lastRefillKey = 'lw_hearts_refill_at';

  static const int maxHearts = 5;
  static const int refillMinutes = 30;

  static bool get _isPremium => SubscriptionService().isPremium;

  /// Current hearts after applying time-based refills. Premium → maxHearts
  /// (display code shows ∞ instead).
  static Future<int> current({DateTime? now}) async {
    if (_isPremium) return maxHearts;
    now ??= DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    var hearts = prefs.getInt(_countKey) ?? maxHearts;
    if (hearts >= maxHearts) return maxHearts;

    final lastMs = prefs.getInt(_lastRefillKey) ?? now.millisecondsSinceEpoch;
    final elapsedMin =
        (now.millisecondsSinceEpoch - lastMs) ~/ (60 * 1000);
    final refilled = elapsedMin ~/ refillMinutes;
    if (refilled > 0) {
      hearts = (hearts + refilled).clamp(0, maxHearts);
      // Carry the remainder so partial progress toward the next heart
      // isn't lost, unless we're already full.
      final newAnchor = hearts >= maxHearts
          ? now.millisecondsSinceEpoch
          : lastMs + refilled * refillMinutes * 60 * 1000;
      await prefs.setInt(_countKey, hearts);
      await prefs.setInt(_lastRefillKey, newAnchor);
    }
    return hearts;
  }

  /// Whether a lesson session may start.
  static Future<bool> canStartLesson({DateTime? now}) async =>
      _isPremium || (await current(now: now)) > 0;

  /// A wrong answer costs one heart (no-op for premium). Returns the new
  /// count.
  static Future<int> loseHeart({DateTime? now}) async {
    if (_isPremium) return maxHearts;
    now ??= DateTime.now();
    final hearts = await current(now: now);
    final prefs = await SharedPreferences.getInstance();
    final next = (hearts - 1).clamp(0, maxHearts);
    // If we just left "full", start the refill clock now.
    if (hearts >= maxHearts) {
      await prefs.setInt(_lastRefillKey, now.millisecondsSinceEpoch);
    }
    await prefs.setInt(_countKey, next);
    return next;
  }

  /// Full refill (rewarded ad payout).
  static Future<void> refillFull({DateTime? now}) async {
    now ??= DateTime.now();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_countKey, maxHearts);
    await prefs.setInt(_lastRefillKey, now.millisecondsSinceEpoch);
  }

  /// Minutes until the next heart arrives (0 when full or premium).
  static Future<int> minutesToNextHeart({DateTime? now}) async {
    if (_isPremium) return 0;
    now ??= DateTime.now();
    final hearts = await current(now: now);
    if (hearts >= maxHearts) return 0;
    final prefs = await SharedPreferences.getInstance();
    final lastMs = prefs.getInt(_lastRefillKey) ?? now.millisecondsSinceEpoch;
    final elapsedMin = (now.millisecondsSinceEpoch - lastMs) ~/ (60 * 1000);
    final remaining = refillMinutes - (elapsedMin % refillMinutes);
    return remaining.clamp(1, refillMinutes);
  }
}
