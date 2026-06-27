import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ApiService {
  // static const String baseUrl = 'http://192.168.1.2:3000'; // Android emulator
  static const String baseUrl =
      'https://lingowave-backend-production-132d.up.railway.app';

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';

  /// Debug-only logger. Guarded by kDebugMode so auth tokens and raw response
  /// bodies are never written to logs in release builds.
  static void _log(Object? message) {
    if (kDebugMode) print(message);
  }

  // ── Token Management ──────────────────────────────────────────────────────
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user));
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString(_userKey);
    if (str == null) return null;
    return jsonDecode(str);
  }

  static Future<void> clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // ── Headers ───────────────────────────────────────────────────────────────
  static Future<Map<String, String>> _authHeaders() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // ── Signup ────────────────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/auth/signup'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(
                {'name': name, 'email': email, 'password': password}),
          )
          .timeout(const Duration(seconds: 10));

      _log('Signup status: ${res.statusCode}');
      _log('Signup body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 201 || res.statusCode == 200) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': data['message'] ?? 'Signup failed'};
    } catch (e) {
      _log('Signup error: $e');
      return {'success': false, 'message': 'Connection error: $e'};
    }
  }

  // ── Login ─────────────────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'email': email, 'password': password}),
          )
          .timeout(const Duration(seconds: 10));

      _log('Login status: ${res.statusCode}');
      _log('Login body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': data['message'] ?? 'Login failed'};
    } catch (e) {
      _log('Login error: $e');
      return {
        'success': false,
        'message': 'सर्वर से कनेक्ट नहीं हो पाया। WiFi जांचें।'
      };
    }
  }

  // ── Get Profile ───────────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> getProfile() async {
    final res = await http.get(
      Uri.parse('$baseUrl/users/profile'),
      headers: await _authHeaders(),
    );
    if (res.statusCode == 200) {
      return {'success': true, 'data': jsonDecode(res.body)};
    }
    return {'success': false, 'message': 'Failed to load profile'};
  }

  // ── Save FCM Token to Backend ─────────────────────────────────────────────
  /// Registers this device's push token against the authenticated user so the
  /// backend can target them with notifications. Requires a valid auth token
  /// (uses _authHeaders). Fails soft if the endpoint isn't live yet.
  static Future<bool> saveFcmToken(String token) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/users/fcm-token'),
            headers: await _authHeaders(),
            body: jsonEncode({'fcmToken': token}),
          )
          .timeout(const Duration(seconds: 5));
      return res.statusCode == 200 || res.statusCode == 201;
    } catch (e) {
      _log('Save FCM token error: $e');
      return false;
    }
  }

  // ── Update Streak ─────────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> updateStreak() async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/coins/streak'),
            headers: await _authHeaders(),
          )
          .timeout(const Duration(seconds: 5));

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        // Save streak locally as backup
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('lw_streak', data['streakDays'] ?? 0);
        return {'success': true, 'data': data};
      }
      return {'success': false};
    } catch (e) {
      _log('Streak update error: $e');
      return {'success': false};
    }
  }

  // ── Complete Lesson ───────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> completeLesson({
    required int lessonId,
    required int score,
    required int chapterId,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/lessons/$lessonId/complete'),
            headers: await _authHeaders(),
            body: jsonEncode({
              'score': score,
              'chapterId': chapterId,
            }),
          )
          .timeout(const Duration(seconds: 5));

      _log('Complete lesson status: ${res.statusCode}');
      _log('Complete lesson body: ${res.body}');

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        // NOTE: the local 'lw_total_xp' counter is owned by
        // ProgressService.completeLesson, which already incremented it for this
        // lesson. Do NOT add xpEarned again here, or the local total
        // double-counts every completion.
        return {'success': true, 'data': data};
      }
      return {'success': false};
    } catch (e) {
      _log('Complete lesson error: $e');
      return {'success': false};
    }
  }

  // ── Forgot Password ───────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> forgotPassword(String email) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    return {'success': res.statusCode == 200 || res.statusCode == 201};
  }

  // ── Reset Password ────────────────────────────────────────────────────────
  static Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String code,
    required String newPassword,
  }) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'code': code,
        'newPassword': newPassword,
      }),
    );
    final data = jsonDecode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return {'success': true};
    }
    return {'success': false, 'message': data['message'] ?? 'Failed'};
  }

  // add coins — returns the user's new backend balance, or null on failure.
  static Future<int?> addCoins(int amount) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/coins/add'),
            headers: await _authHeaders(),
            body: jsonEncode({'amount': amount}),
          )
          .timeout(const Duration(seconds: 5));
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        return data['coins'] as int?;
      }
      return null;
    } catch (e) {
      _log('Add coins error: $e');
      return null;
    }
  }

  // deduct coins — the backend re-checks the balance. Returns
  // {success, coins}; success is false if the user doesn't have enough.
  static Future<Map<String, dynamic>> deductCoins(int amount) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/coins/deduct'),
            headers: await _authHeaders(),
            body: jsonEncode({'amount': amount}),
          )
          .timeout(const Duration(seconds: 5));
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        return {'success': data['success'] ?? true, 'coins': data['coins']};
      }
      return {'success': false};
    } catch (e) {
      _log('Deduct coins error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> getStats() async {
    try {
      final res = await http
          .get(
            Uri.parse('$baseUrl/lessons/stats'),
            headers: await _authHeaders(),
          )
          .timeout(const Duration(seconds: 5));

      if (res.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(res.body)};
      }
      return {'success': false};
    } catch (e) {
      _log('Get stats error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> googleSignIn({
    required String idToken,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/auth/google'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'idToken': idToken,
            }),
          )
          .timeout(const Duration(seconds: 10));

      _log('Google auth status: ${res.statusCode}');
      _log('Google auth body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': 'Google login failed'};
    } catch (e) {
      _log('Google sign in error: $e');
      return {'success': false, 'message': 'कनेक्शन विफल हुआ'};
    }
  }

  static Future<Map<String, dynamic>> getLeaderboard() async {
    try {
      final res = await http
          .get(
            Uri.parse('$baseUrl/users/leaderboard'),
            headers: await _authHeaders(),
          )
          .timeout(const Duration(seconds: 5));

      if (res.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(res.body)};
      }
      return {'success': false};
    } catch (e) {
      _log('Leaderboard error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> getUserProgress() async {
    try {
      final res = await http
          .get(
            Uri.parse('$baseUrl/lessons/progress'),
            headers: await _authHeaders(),
          )
          .timeout(const Duration(seconds: 10));

      if (res.statusCode == 200) {
        return {'success': true, 'data': jsonDecode(res.body)};
      }
      return {'success': false};
    } catch (e) {
      _log('Get progress error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> setPremium(bool isPremium) async {
  try {
    final res = await http.post(
      Uri.parse('$baseUrl/users/premium'),
      headers: await _authHeaders(),
      body: jsonEncode({'isPremium': isPremium}),
    ).timeout(const Duration(seconds: 5));

    if (res.statusCode == 200 || res.statusCode == 201) {
      return {'success': true};
    }
    return {'success': false};
  } catch (e) {
    _log('Set premium error: $e');
    return {'success': false};
  }
}

static Future<bool> getPremiumStatus() async {
  try {
    final res = await http.get(
      Uri.parse('$baseUrl/users/premium/status'),
      headers: await _authHeaders(),
    ).timeout(const Duration(seconds: 5));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data['isPremium'] ?? false;
    }
    return false;
  } catch (e) {
    _log('Get premium status error: $e');
    return false;
  }
}
}
