import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../theme/app_theme.dart';
import '../services/api_service.dart';
import '../services/progress_service.dart';
import '../services/ad_service.dart';
import 'onboarding_screen.dart';
import './home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );
  bool _obscure = true;
  bool _loading = false;
  String? _error;

  late AnimationController _animController;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fade = CurvedAnimation(parent: _animController, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() => _error = 'कृपया सभी फ़ील्ड भरें');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await ApiService.login(email: email, password: password);

    if (!mounted) return;
    setState(() => _loading = false);

    if (result['success']) {
      _navigateAfterAuth();
    } else {
      setState(() => _error = result['message'] ?? 'लॉगिन विफल हुआ');
    }
  }

  Future<void> _navigateAfterAuth() async {
    // ── Clear any previous user's local data ──────────
    await ProgressService.resetAll();
    await AdService.resetCoins();

    // ── Load fresh data from backend ──────────────────
    final user = await ApiService.getUser();
    final userName = user?['name'] ?? 'दोस्त';

    // Save new user's name locally
    await ProgressService.saveUserName(userName);

    final isOnboarded = await _checkIfOnboarded();

    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => isOnboarded
            ? HomeScreen(userName: userName)
            : const OnboardingScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 400),
      ),
      (route) => false,
    );
  }

  Future<bool> _checkIfOnboarded() async {
    final name = await ProgressService.loadUserName();
    return name.isNotEmpty;
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      // Sign out first to show account picker every time
      await _googleSignIn.signOut();

      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        // User cancelled
        setState(() => _loading = false);
        return;
      }

      final result = await ApiService.googleSignIn(
        email: account.email,
        name: account.displayName ?? 'User',
        googleId: account.id,
      );

      if (!mounted) return;
      setState(() => _loading = false);

      if (result['success']) {
      // Clear previous user data
      await ProgressService.resetAll();
      await AdService.resetCoins();
      _navigateAfterAuth();
    } else {
        setState(() => _error = result['message'] ?? 'Google login failed');
      }
    } catch (e) {
      print('Google sign in error: $e');
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = 'Google साइन इन विफल हुआ';
      });
    }
  }

  Future<String> _getUserName() async {
    final user = await ApiService.getUser();
    return user?['name'] ?? 'दोस्त';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.xl),

                  // ── Logo & Title ─────────────────────────────────────
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                            ),
                            borderRadius: BorderRadius.circular(AppRadius.xl),
                            boxShadow: AppShadows.elevated,
                          ),
                          child: const Center(
                            child: Text('🌊', style: TextStyle(fontSize: 40)),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        const Text(
                          'LingoWave',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'हिंदी से English सीखें',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xxl),

                  // ── Form Title ───────────────────────────────────────
                  Text('लॉगिन करें', style: AppTextStyles.displayMedium),
                  const SizedBox(height: AppSpacing.xs),
                  const Text('अपने खाते में प्रवेश करें',
                      style: AppTextStyles.bodyMedium),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Error ────────────────────────────────────────────
                  if (_error != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.error.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(AppRadius.md),
                        border:
                            Border.all(color: AppColors.error.withOpacity(0.3)),
                      ),
                      child: Row(children: [
                        const Icon(Icons.error_outline_rounded,
                            color: AppColors.error, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(_error!,
                              style: AppTextStyles.bodyMedium
                                  .copyWith(color: AppColors.error)),
                        ),
                      ]),
                    ),

                  // ── Email Field ──────────────────────────────────────
                  _buildLabel('ईमेल'),
                  const SizedBox(height: AppSpacing.xs),
                  _buildTextField(
                    controller: _emailController,
                    hint: 'example@gmail.com',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // ── Password Field ───────────────────────────────────
                  _buildLabel('पासवर्ड'),
                  const SizedBox(height: AppSpacing.xs),
                  _buildTextField(
                    controller: _passwordController,
                    hint: '••••••••',
                    icon: Icons.lock_outline_rounded,
                    obscure: _obscure,
                    suffix: IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textHint,
                        size: 20,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),

                  // ── Forgot Password ──────────────────────────────────
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen(),
                        ),
                      ),
                      child: Text(
                        'पासवर्ड भूल गए?',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  // ── Login Button ─────────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                      ),
                      child: _loading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text(
                              'लॉगिन करें',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // ── Divider ──────────────────────────────────────────
                  Row(children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                      child: Text('या', style: AppTextStyles.bodyMedium),
                    ),
                    const Expanded(child: Divider()),
                  ]),

                  const SizedBox(height: AppSpacing.lg),

                  // ── Google Sign In ───────────────────────────────────
                  // ── Google Sign In ───────────────────────────────────
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _loading ? null : _handleGoogleSignIn,
                      icon: const Text('🌐', style: TextStyle(fontSize: 20)),
                      label: const Text(
                        'Google से जारी रखें',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.locked),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Signup Link ──────────────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('खाता नहीं है? ',
                          style: AppTextStyles.bodyMedium),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        ),
                        child: Text(
                          'अभी बनाएं',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.labelLarge.copyWith(
        color: AppColors.textSecondary,
        fontSize: 13,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      style: AppTextStyles.labelLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium,
        prefixIcon: Icon(icon, color: AppColors.textHint, size: 20),
        suffixIcon: suffix,
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.locked),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.locked),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SIGNUP SCREEN
// ══════════════════════════════════════════════════════════════════════════════

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscure = true;
  bool _obscureConfirm = true;
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _confirmController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirm.isEmpty) {
      setState(() => _error = 'कृपया सभी फ़ील्ड भरें');
      return;
    }
    if (password != confirm) {
      setState(() => _error = 'पासवर्ड मेल नहीं खाते');
      return;
    }
    if (password.length < 6) {
      setState(() => _error = 'पासवर्ड कम से कम 6 अक्षर का होना चाहिए');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await ApiService.signup(
      name: name,
      email: email,
      password: password,
    );

    if (!mounted) return;
    setState(() => _loading = false);

    if (result['success']) {
       // Clear any previous user data
  await ProgressService.resetAll();
  await AdService.resetCoins();
      // New user → go to onboarding
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingScreen(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 400),
        ),
        (route) => false,
      );
    } else {
      setState(() => _error = result['message'] ?? 'साइनअप विफल हुआ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('खाता बनाएं', style: AppTextStyles.displayMedium),
              const SizedBox(height: AppSpacing.xs),
              const Text('LingoWave पर स्वागत है!',
                  style: AppTextStyles.bodyMedium),

              const SizedBox(height: AppSpacing.xl),

              // ── Error ──────────────────────────────────────────────
              if (_error != null)
                Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Row(children: [
                    const Icon(Icons.error_outline_rounded,
                        color: AppColors.error, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(_error!,
                          style: AppTextStyles.bodyMedium
                              .copyWith(color: AppColors.error)),
                    ),
                  ]),
                ),

              // ── Name ──────────────────────────────────────────────
              _buildLabel('आपका नाम'),
              const SizedBox(height: AppSpacing.xs),
              _buildTextField(
                controller: _nameController,
                hint: 'जैसे: Rahul, Priya',
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Email ──────────────────────────────────────────────
              _buildLabel('ईमेल'),
              const SizedBox(height: AppSpacing.xs),
              _buildTextField(
                controller: _emailController,
                hint: 'example@gmail.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Password ───────────────────────────────────────────
              _buildLabel('पासवर्ड'),
              const SizedBox(height: AppSpacing.xs),
              _buildTextField(
                controller: _passwordController,
                hint: 'कम से कम 6 अक्षर',
                icon: Icons.lock_outline_rounded,
                obscure: _obscure,
                suffix: IconButton(
                  icon: Icon(
                    _obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.textHint,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Confirm Password ───────────────────────────────────
              _buildLabel('पासवर्ड दोबारा डालें'),
              const SizedBox(height: AppSpacing.xs),
              _buildTextField(
                controller: _confirmController,
                hint: '••••••••',
                icon: Icons.lock_outline_rounded,
                obscure: _obscureConfirm,
                suffix: IconButton(
                  icon: Icon(
                    _obscureConfirm
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.textHint,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _obscureConfirm = !_obscureConfirm),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // ── Signup Button ──────────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _loading ? null : _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                  ),
                  child: _loading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : const Text(
                          'खाता बनाएं',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // ── Login Link ─────────────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('पहले से खाता है? ',
                      style: AppTextStyles.bodyMedium),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'लॉगिन करें',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.labelLarge.copyWith(
        color: AppColors.textSecondary,
        fontSize: 13,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      style: AppTextStyles.labelLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium,
        prefixIcon: Icon(icon, color: AppColors.textHint, size: 20),
        suffixIcon: suffix,
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.locked),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.locked),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// FORGOT PASSWORD SCREEN
// ══════════════════════════════════════════════════════════════════════════════

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  bool _codeSent = false;
  bool _loading = false;
  String? _error;
  String? _success;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _sendCode() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _error = 'कृपया ईमेल डालें');
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    final result = await ApiService.forgotPassword(email);
    if (!mounted) return;
    setState(() => _loading = false);
    if (result['success']) {
      setState(() {
        _codeSent = true;
        _success = 'कोड आपके ईमेल पर भेजा गया है';
      });
    } else {
      setState(() => _error = 'कुछ गलत हुआ, दोबारा कोशिश करें');
    }
  }

  Future<void> _resetPassword() async {
    final code = _codeController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    if (code.isEmpty || newPassword.isEmpty) {
      setState(() => _error = 'कृपया सभी फ़ील्ड भरें');
      return;
    }
    if (newPassword.length < 6) {
      setState(() => _error = 'पासवर्ड कम से कम 6 अक्षर का होना चाहिए');
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    final result = await ApiService.resetPassword(
      email: _emailController.text.trim(),
      code: code,
      newPassword: newPassword,
    );
    if (!mounted) return;
    setState(() => _loading = false);
    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('पासवर्ड बदल गया! अब लॉगिन करें'),
          backgroundColor: AppColors.success,
        ),
      );
      Navigator.pop(context);
    } else {
      setState(() => _error = result['message'] ?? 'कोड गलत है');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('पासवर्ड रीसेट', style: AppTextStyles.headingMedium),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Row(children: [
                  const Text('🔐', style: TextStyle(fontSize: 32)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('पासवर्ड भूल गए?',
                            style: AppTextStyles.labelLarge
                                .copyWith(color: AppColors.primary)),
                        const SizedBox(height: 4),
                        const Text(
                          'अपना ईमेल डालें, हम आपको एक कोड भेजेंगे',
                          style: AppTextStyles.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),

              const SizedBox(height: AppSpacing.xl),

              if (_error != null)
                Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Text(_error!,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.error)),
                ),

              if (_success != null)
                Container(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border:
                        Border.all(color: AppColors.success.withOpacity(0.3)),
                  ),
                  child: Text(_success!,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.success)),
                ),

              // ── Email Field ──────────────────────────────────────
              Text('ईमेल',
                  style: AppTextStyles.labelLarge
                      .copyWith(color: AppColors.textSecondary, fontSize: 13)),
              const SizedBox(height: AppSpacing.xs),
              TextField(
                controller: _emailController,
                enabled: !_codeSent,
                keyboardType: TextInputType.emailAddress,
                style: AppTextStyles.labelLarge,
                decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  hintStyle: AppTextStyles.bodyMedium,
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: AppColors.textHint, size: 20),
                  filled: true,
                  fillColor: _codeSent ? AppColors.lockedBg : AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    borderSide: const BorderSide(color: AppColors.locked),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    borderSide: const BorderSide(color: AppColors.locked),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md, vertical: AppSpacing.md),
                ),
              ),

              if (!_codeSent) ...[
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _sendCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text('कोड भेजें',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                  ),
                ),
              ],

              if (_codeSent) ...[
                const SizedBox(height: AppSpacing.md),
                Text('6-अंकीय कोड',
                    style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.textSecondary, fontSize: 13)),
                const SizedBox(height: AppSpacing.xs),
                TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.labelLarge,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: '123456',
                    hintStyle: AppTextStyles.bodyMedium,
                    prefixIcon: const Icon(Icons.pin_outlined,
                        color: AppColors.textHint, size: 20),
                    filled: true,
                    fillColor: AppColors.surface,
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide: const BorderSide(color: AppColors.locked),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide: const BorderSide(color: AppColors.locked),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md, vertical: AppSpacing.md),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text('नया पासवर्ड',
                    style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.textSecondary, fontSize: 13)),
                const SizedBox(height: AppSpacing.xs),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  style: AppTextStyles.labelLarge,
                  decoration: InputDecoration(
                    hintText: 'कम से कम 6 अक्षर',
                    hintStyle: AppTextStyles.bodyMedium,
                    prefixIcon: const Icon(Icons.lock_outline_rounded,
                        color: AppColors.textHint, size: 20),
                    filled: true,
                    fillColor: AppColors.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide: const BorderSide(color: AppColors.locked),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide: const BorderSide(color: AppColors.locked),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.md),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md, vertical: AppSpacing.md),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _resetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : const Text('पासवर्ड बदलें',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
