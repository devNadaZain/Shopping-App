import 'package:flutter/material.dart';
import '../utils/fade_route.dart';
import '../utils/animated_route.dart';
import '../widgets/animated_button.dart';
import 'home_screen.dart';
import '../l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.check_circle, color: Colors.green),
              ),
              const SizedBox(width: 12),
              Text(l.success),
            ],
          ),
          content: Text(l.accountSignIn),
          actions: [
            AnimatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(
                  context,
                ).pushReplacement(ScaleRoute(page: const HomeScreen()));
              },
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              child: Text(l.close),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E293B), Color(0xFF334155), Color(0xFF475569)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          AnimatedButton(
                            onPressed: () => Navigator.pop(context),
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            icon: Icons.arrow_back,
                            child: const SizedBox.shrink(),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l.signIn,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: l.email,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Color(0xFF6366F1),
                          ),
                        ),
                        validator: _validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: l.password,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xFF6366F1),
                          ),
                        ),
                        validator: _validatePassword,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 32),
                      AnimatedButton(
                        onPressed: _submit,
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        icon: Icons.login,
                        child: Text(l.signIn),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
