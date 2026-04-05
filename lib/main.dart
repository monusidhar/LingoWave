import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'services/ad_service.dart';
import 'services/notification_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── Orientation ──────────────────────────────────────────────────────────
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ── Status Bar ───────────────────────────────────────────────────────────
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // ── Firebase Init ─────────────────────────────────────────────────────────
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  // ── AdMob Init ───────────────────────────────────────────────────────────
  await AdService().initialize();

  // ── Notifications Init ───────────────────────────────────────────────────
  await NotificationService().initialize();

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