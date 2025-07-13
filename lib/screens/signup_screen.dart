import 'package:flutter/material.dart';
import '../utils/fade_route.dart';
import 'home_screen.dart';
import '../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) return l.enterFullName;
    if (value[0] != value[0].toUpperCase()) return l.firstLetterUpper;
    return null;
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

  String? _validateConfirmPassword(String? value) {
    final l = AppLocalizations.of(context)!;
    if (value != _passwordController.text) return l.passwordsDoNotMatch;
    return null;
  }

  void _submit() {
    final l = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l.success),
          content: Text(l.accountCreated),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(
                  context,
                ).pushReplacement(FadeRoute(page: const HomeScreen()));
              },
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
      appBar: AppBar(title: Text(l.signUp)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: l.fullName),
                  validator: _validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: l.email),
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: l.password),
                  validator: _validatePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: l.confirmPassword),
                  validator: _validateConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(l.signUp),
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
