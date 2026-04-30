import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_service.dart';

class SubscriptionService {
  static final SubscriptionService _instance =
      SubscriptionService._internal();
  factory SubscriptionService() => _instance;
  SubscriptionService._internal();

  static const String _androidApiKey =
      'test_ryybUOiJWJAcDXCqlyffgiGUxAd';
  static const String _premiumKey = 'lw_is_premium';
  static const String _entitlementId = 'premium';

  bool _isPremium = false;
  bool get isPremium => _isPremium;

  // ── Initialize ────────────────────────────────────────
  Future<void> initialize() async {
    // Load cached status first (works on all platforms)
    final prefs = await SharedPreferences.getInstance();
    _isPremium = prefs.getBool(_premiumKey) ?? false;

    if (kIsWeb) return; // RevenueCat not supported on web

    try {
      await Purchases.setLogLevel(LogLevel.debug);
      final configuration =
          PurchasesConfiguration(_androidApiKey);
      await Purchases.configure(configuration);

      // Then check actual status
      await checkPremiumStatus();
    } catch (e) {
      print('SubscriptionService init error: $e');
    }
  }

  // ── Check Premium Status ──────────────────────────────
  Future<bool> checkPremiumStatus() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      _isPremium = customerInfo.entitlements.active
          .containsKey(_entitlementId);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_premiumKey, _isPremium);

      if (_isPremium) {
        await ApiService.setPremium(true);
      }

      return _isPremium;
    } catch (e) {
      print('Check premium error: $e');
      // Fallback to backend
      try {
        _isPremium = await ApiService.getPremiumStatus();
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_premiumKey, _isPremium);
      } catch (e2) {
        print('Backend premium check error: $e2');
      }
      return _isPremium;
    }
  }

  // ── Set User ID for RevenueCat (call after login) ─────
  Future<void> setUserId(String userId) async {
    try {
      await Purchases.logIn(userId);
    } catch (e) {
      print('RevenueCat login error: $e');
    }
  }

  // ── Get Offerings ─────────────────────────────────────
  Future<Offerings?> getOfferings() async {
    try {
      return await Purchases.getOfferings();
    } catch (e) {
      print('Get offerings error: $e');
      return null;
    }
  }

  // ── Purchase Premium ──────────────────────────────────
  Future<Map<String, dynamic>> purchasePremium(
      Package package) async {
    try {
      final customerInfo =
          await Purchases.purchasePackage(package);
      _isPremium = customerInfo.entitlements.active
          .containsKey(_entitlementId);

      if (_isPremium) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_premiumKey, true);
        await ApiService.setPremium(true);
        return {'success': true, 'isPremium': true};
      }
      return {
        'success': false,
        'message': 'Purchase not verified'
      };
    } on PurchasesErrorCode catch (e) {
      if (e == PurchasesErrorCode.purchaseCancelledError) {
        return {'success': false, 'cancelled': true};
      }
      return {'success': false, 'message': e.toString()};
    } catch (e) {
      print('Purchase error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  // ── Restore Purchases ─────────────────────────────────
  Future<Map<String, dynamic>> restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      _isPremium = customerInfo.entitlements.active
          .containsKey(_entitlementId);

      if (_isPremium) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_premiumKey, true);
        await ApiService.setPremium(true);
        return {'success': true, 'isPremium': true};
      }
      return {'success': false, 'isPremium': false};
    } catch (e) {
      print('Restore error: $e');
      return {'success': false, 'message': e.toString()};
    }
  }

  // ── Clear on Logout ───────────────────────────────────
  Future<void> clearPremium() async {
    try {
      await Purchases.logOut();
    } catch (e) {
      print('RevenueCat logout error: $e');
    }
    _isPremium = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumKey, false);
  }

  // ── Test Premium (Dev Only) ───────────────────────────
  Future<void> activateTestPremium() async {
    _isPremium = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_premiumKey, true);
    await ApiService.setPremium(true);
  }
}