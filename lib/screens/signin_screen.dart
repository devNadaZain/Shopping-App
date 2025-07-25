import 'package:flutter/material.dart';
import '../utils/fade_route.dart';
import '../utils/animated_route.dart';
import '../widgets/animated_button.dart';
import 'home_screen.dart';
import '../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  final void Function(Locale) onLocaleChange;
  final void Function(ThemeMode) onThemeModeChange;
  const SignInScreen({
    Key? key,
    required this.onLocaleChange,
    required this.onThemeModeChange,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) return l.enterEmail;
    if (!value.contains('@')) return l.emailMustContainAt;
    return null;
  }

  String? _validatePassword(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) return l.enterPassword;
    if (value.length < 6) return l.atLeast6Chars;
    return null;
  }

  void _submit() {
    final l = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white.withOpacity(0.95)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF10B981),
                        const Color(0xFF059669),
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF10B981).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 40),
                ),
                const SizedBox(height: 24),
                Text(
                  l.success,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l.accountSignIn,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        SlideRoute(
                          page: HomeScreen(
                            onLocaleChange: widget.onLocaleChange,
                            onThemeModeChange: widget.onThemeModeChange,
                          ),
                          direction: SlideDirection.right,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.home_outlined, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          l.close,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? _obscurePassword : false,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(color: Color(0xFF1F2937)),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: const Color(0xFF9CA3AF), size: 20),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xFF9CA3AF),
                      size: 20,
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: const Color(0xFFE5E7EB),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xFFEF4444),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Stack(
            children: [
              // Main content
              SingleChildScrollView(
                padding: EdgeInsets.all(size.width * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.025),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: const Color(0xFF374151),
                              size: size.width * 0.05,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          l.signIn,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontSize: size.width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1F2937),
                                letterSpacing: -0.5,
                              ),
                        ),
                        const Spacer(),
                        SizedBox(width: size.width * 0.12),
                      ],
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      padding: EdgeInsets.all(size.width * 0.06),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _emailController,
                              label: l.email,
                              hint: l.enterEmail,
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                              controller: _passwordController,
                              label: l.password,
                              hint: l.enterPassword,
                              icon: Icons.lock_outline,
                              isPassword: true,
                              validator: _validatePassword,
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6366F1),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.login_outlined, size: 24),
                                    const SizedBox(width: 12),
                                    Text(
                                      l.signIn,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              // Add this to the Stack children (before main content):
              Positioned(
                top: size.height * 0.03,
                right: Directionality.of(context) == TextDirection.ltr
                    ? size.width * 0.04
                    : null,
                left: Directionality.of(context) == TextDirection.rtl
                    ? size.width * 0.04
                    : null,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      heroTag: 'lang_signin',
                      mini: true,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        final isEnglish =
                            Localizations.localeOf(context).languageCode ==
                            'en';
                        widget.onLocaleChange(Locale(isEnglish ? 'ar' : 'en'));
                      },
                      tooltip: 'Switch Language',
                      child: const Icon(Icons.language),
                    ),
                    SizedBox(width: size.width * 0.02),
                    FloatingActionButton(
                      heroTag: 'theme_signin',
                      mini: true,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        widget.onThemeModeChange(
                          Theme.of(context).brightness == Brightness.dark
                              ? ThemeMode.light
                              : ThemeMode.dark,
                        );
                      },
                      tooltip: 'Switch Theme',
                      child: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
