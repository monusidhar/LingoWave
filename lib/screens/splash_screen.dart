// import 'package:flutter/material.dart';
// import '../theme/app_theme.dart';
// import '../services/progress_service.dart';
// import 'onboarding_screen.dart';
// import 'home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _logoController;
//   late AnimationController _fadeController;

//   late Animation<double> _logoScale;
//   late Animation<double> _logoFade;
//   late Animation<double> _taglineFade;
//   late Animation<Offset> _taglineSlide;

//   @override
//   void initState() {
//     super.initState();

//     _logoController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     );
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     );

//     _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
//       CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
//     );
//     _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _logoController,
//         curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
//       ),
//     );
//     _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
//     );
//     _taglineSlide = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(
//         CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

//     _startAnimation();
//   }

//   void _startAnimation() async {
//     await Future.delayed(const Duration(milliseconds: 200));
//     _logoController.forward();
//     await Future.delayed(const Duration(milliseconds: 500));
//     _fadeController.forward();
//     await Future.delayed(const Duration(milliseconds: 1500));
//     if (!mounted) return;

//     // Check if user already onboarded
//     final isOnboarded = await ProgressService.isOnboarded();
//     final userName = await ProgressService.loadUserName();

//     if (!mounted) return;
//     Navigator.of(context).pushReplacement(
//       PageRouteBuilder(
//         pageBuilder: (_, __, ___) => isOnboarded
//             ? HomeScreen(userName: userName)
//             : const OnboardingScreen(),
//         transitionsBuilder: (_, anim, __, child) =>
//             FadeTransition(opacity: anim, child: child),
//         transitionDuration: const Duration(milliseconds: 500),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _logoController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Decorative circles
//             Positioned(
//               top: -60, right: -60,
//               child: Container(
//                 width: 200, height: 200,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.06),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -80, left: -40,
//               child: Container(
//                 width: 280, height: 280,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.04),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 120, right: 30,
//               child: Container(
//                 width: 80, height: 80,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white.withOpacity(0.08),
//                 ),
//               ),
//             ),
//             // Center content
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedBuilder(
//                     animation: _logoController,
//                     builder: (context, child) => FadeTransition(
//                       opacity: _logoFade,
//                       child: ScaleTransition(
//                           scale: _logoScale, child: child),
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           width: 96, height: 96,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(24),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 30,
//                                 offset: const Offset(0, 10),
//                               ),
//                             ],
//                           ),
//                           child: const Center(
//                             child: Text('🌊',
//                                 style: TextStyle(fontSize: 48)),
//                           ),
//                         ),
//                         const SizedBox(height: AppSpacing.lg),
//                         const Text(
//                           'LingoWave',
//                           style: TextStyle(
//                             fontFamily: 'Nunito',
//                             fontSize: 40,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.white,
//                             letterSpacing: -1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: AppSpacing.md),
//                   AnimatedBuilder(
//                     animation: _fadeController,
//                     builder: (context, child) => FadeTransition(
//                       opacity: _taglineFade,
//                       child: SlideTransition(
//                           position: _taglineSlide, child: child),
//                     ),
//                     child: const Text(
//                       'अंग्रेज़ी सीखें, आसान तरीके से',
//                       style: TextStyle(
//                         fontFamily: 'Nunito',
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white70,
//                         letterSpacing: 0.3,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Bottom credit
//             Positioned(
//               bottom: AppSpacing.xl, left: 0, right: 0,
//               child: AnimatedBuilder(
//                 animation: _fadeController,
//                 builder: (context, child) =>
//                     FadeTransition(opacity: _taglineFade, child: child),
//                 child: const Text(
//                   'by Mohit Sharma',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Nunito',
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white38,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/api_service.dart';
import '../services/progress_service.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import '../services/notification_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _controller.forward();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (!mounted) return;

    final isLoggedIn = await ApiService.isLoggedIn();

    if (isLoggedIn) {
      // ── Update streak every time app opens ──
      await ApiService.updateStreak();
      await NotificationService().scheduleDailyStreakReminder();

      final userName = await ProgressService.loadUserName();
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(
            userName: userName.isEmpty ? 'दोस्त' : userName,
          ),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    } else {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.xl),
                  ),
                  child: const Center(
                    child: Text('🌊', style: TextStyle(fontSize: 52)),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const Text(
                  'LingoWave',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'हिंदी से English सीखें',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: AppSpacing.xxl),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.6),
                    strokeWidth: 2.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
