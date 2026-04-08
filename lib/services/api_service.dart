import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class ApiService {
  // static const String baseUrl = 'http://192.168.1.2:3000'; // Android emulator
  static const String baseUrl =
      'https://lingowave-backend-production.up.railway.app'; // Android emulator

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'auth_user';

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

      print('Signup status: ${res.statusCode}');
      print('Signup body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 201 || res.statusCode == 200) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': data['message'] ?? 'Signup failed'};
    } catch (e) {
      print('Signup error: $e');
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

      print('Login status: ${res.statusCode}');
      print('Login body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': data['message'] ?? 'Login failed'};
    } catch (e) {
      print('Login error: $e');
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
      print('Streak update error: $e');
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
    print('Completing lesson $lessonId with score $score and chapter $chapterId');
    final res = await http.post(
      Uri.parse('$baseUrl/lessons/$lessonId/complete'),
      headers: await _authHeaders(),
      body: jsonEncode({
        'score': score,
        'chapterId': chapterId,
      }),
    ).timeout(const Duration(seconds: 5));

    print('Complete lesson status: ${res.statusCode}');
    print('Complete lesson body: ${res.body}');

    if (res.statusCode == 200 || res.statusCode == 201) {
      final data = jsonDecode(res.body);
      final prefs = await SharedPreferences.getInstance();
      final currentXp = prefs.getInt('lw_total_xp') ?? 0;
      await prefs.setInt(
          'lw_total_xp', currentXp + ((data['xpEarned'] ?? 0) as int));
      return {'success': true, 'data': data};
    }
    return {'success': false};
  } catch (e) {
    print('Complete lesson error: $e');
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

  // add coins
  static Future<void> addCoins(int amount) async {
    try {
      await http
          .post(
            Uri.parse('$baseUrl/coins/add'),
            headers: await _authHeaders(),
            body: jsonEncode({'amount': amount}),
          )
          .timeout(const Duration(seconds: 5));
    } catch (e) {
      print('Add coins error: $e');
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
      print('Get stats error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> googleSignIn({
    required String email,
    required String name,
    required String googleId,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$baseUrl/auth/google'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'name': name,
              'googleId': googleId,
            }),
          )
          .timeout(const Duration(seconds: 10));

      print('Google auth status: ${res.statusCode}');
      print('Google auth body: ${res.body}');

      final data = jsonDecode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        await saveToken(data['token']);
        await saveUser(data['user']);
        return {'success': true, 'data': data};
      }
      return {'success': false, 'message': 'Google login failed'};
    } catch (e) {
      print('Google sign in error: $e');
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
      print('Leaderboard error: $e');
      return {'success': false};
    }
  }

  static Future<Map<String, dynamic>> getUserProgress() async {
  try {
    final res = await http.get(
      Uri.parse('$baseUrl/lessons/progress'),
      headers: await _authHeaders(),
    ).timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return {'success': true, 'data': jsonDecode(res.body)};
    }
    return {'success': false};
  } catch (e) {
    print('Get progress error: $e');
    return {'success': false};
  }
}
}
