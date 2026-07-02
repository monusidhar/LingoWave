import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'services/ad_service.dart';
import 'services/notification_service.dart';
import 'services/subscription_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase init failed: $e');
  }

  // None of the services below are critical to showing the UI. Guard each one
  // with a try/catch + timeout so a failure or hang (common on release builds:
  // FCM token fetch, billing, ads) can never freeze the app on the splash.
  try {
    await SubscriptionService()
        .initialize()
        .timeout(const Duration(seconds: 8));
  } catch (e) {
    debugPrint('Subscription init failed: $e');
  }

  try {
    await AdService().initialize().timeout(const Duration(seconds: 8));
  } catch (e) {
    debugPrint('Ad init failed: $e');
  }

  try {
    await NotificationService()
        .initialize()
        .timeout(const Duration(seconds: 8));
  } catch (e) {
    debugPrint('Notification init failed: $e');
  }

  runApp(const LingoWaveApp());
}

class LingoWaveApp extends StatelessWidget {
  const LingoWaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingoWave',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}