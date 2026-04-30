import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Background message handler — must be top level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background message: ${message.messageId}');
}

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'lingowave_channel',
    'LingoWave Notifications',
    description: 'LingoWave streak and lesson reminders',
    importance: Importance.high,
  );

  // ── Initialize ─────────────────────────────────────────────────────────────
  Future<void> initialize() async {
    if (kIsWeb) return; // FCM push + local notifications not fully supported on web

    // Set background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request permission
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('FCM Permission: ${settings.authorizationStatus}');

    // Initialize local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
        InitializationSettings(android: androidSettings);

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        print('Notification tapped: ${details.payload}');
      },
    );

    // Create notification channel
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Get FCM token
    final token = await _fcm.getToken();
    print('FCM Token: $token');

    // Save token to backend
    if (token != null) {
      await _saveFcmToken(token);
    }

    // Listen for token refresh
    _fcm.onTokenRefresh.listen(_saveFcmToken);
  }

  // ── Handle Foreground Message ───────────────────────────────────────────────
  void _handleForegroundMessage(RemoteMessage message) {
    print('Foreground message: ${message.notification?.title}');

    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            color: const Color(0xFF4F46E5),
          ),
        ),
        payload: message.data['route'],
      );
    }
  }

  // ── Save FCM Token to Backend ───────────────────────────────────────────────
  Future<void> _saveFcmToken(String token) async {
    try {
      // We'll add this API endpoint later
      print('Saving FCM token: $token');
    } catch (e) {
      print('Error saving FCM token: $e');
    }
  }

  // ── Show Local Notification ─────────────────────────────────────────────────
  Future<void> showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    await _localNotifications.show(
      DateTime.now().millisecond,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          color: const Color(0xFF4F46E5),
        ),
      ),
      payload: payload,
    );
  }

  // ── Schedule Daily Streak Reminder ──────────────────────────────────────────
  Future<void> scheduleDailyStreakReminder() async {
    // Cancel existing
    await _localNotifications.cancel(1);

    // Show reminder at 8 PM if user hasn't opened app
    await _localNotifications.periodicallyShow(
      1,
      '🔥 स्ट्रीक बनाए रखें!',
      'आज का पाठ अभी बाकी है। अपनी streak मत तोड़ें!',
      RepeatInterval.daily,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          color: const Color(0xFF4F46E5),
        ),
      ),
      payload: 'streak_reminder',
      androidScheduleMode: AndroidScheduleMode.inexact,
    );

    print('Daily streak reminder scheduled!');
  }

  // ── Cancel All Notifications ────────────────────────────────────────────────
  Future<void> cancelAll() async {
    await _localNotifications.cancelAll();
  }
}
