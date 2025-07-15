import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.light;

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
          primary: const Color(0xFF6366F1),
          secondary: const Color(0xFF8B5CF6),
          tertiary: const Color(0xFFEC4899),
          surface: const Color(0xFFFAFAFA),
          background: const Color(0xFFFFFFFF),
          error: const Color(0xFFEF4444),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: const Color(0xFF1F2937),
          onBackground: const Color(0xFF1F2937),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            letterSpacing: -0.5,
          ),
          displayMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
            letterSpacing: -0.3,
          ),
          displaySmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
            letterSpacing: -0.2,
          ),
          headlineLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2937),
            letterSpacing: -0.1,
          ),
          headlineMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
          headlineSmall: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
          titleLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
          ),
          titleMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
          titleSmall: ThemeData.light().textTheme.titleSmall,
          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFF374151),
            height: 1.5,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF6B7280),
            height: 1.4,
          ),
          bodySmall: ThemeData.light().textTheme.bodySmall,
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF374151),
            letterSpacing: 0.1,
          ),
          labelMedium: ThemeData.light().textTheme.labelMedium,
          labelSmall: ThemeData.light().textTheme.labelSmall,
        ),

        // Enhanced input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: const Color(0xFFE5E7EB), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFEF4444), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),

        // Enhanced elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
                letterSpacing: 0.1,
                inherit: true,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(const Color(0xFF6366F1)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(0),
            shadowColor: MaterialStateProperty.all(
              const Color(0xFF6366F1).withOpacity(0.3),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ),

        // Enhanced card theme
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: const Color(0xFFF3F4F6), width: 1),
          ),
          color: Colors.white,
          shadowColor: const Color(0xFF1F2937).withOpacity(0.1),
        ),

        // Enhanced app bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
          iconTheme: IconThemeData(color: Color(0xFF374151), size: 24),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
          primary: const Color(0xFF6366F1),
          secondary: const Color(0xFF8B5CF6),
          tertiary: const Color(0xFFEC4899),
          surface: const Color(0xFF18181B),
          background: const Color(0xFF18181B),
          error: const Color(0xFFEF4444),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF18181B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF18181B),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 24),
        ),
        cardTheme: CardThemeData(
          color: Color(0xFF23232A),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color(0xFF23232A), width: 1),
          ),
          shadowColor: Colors.black12,
        ),
        dialogBackgroundColor: const Color(0xFF23232A),
        textTheme: ThemeData.dark().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
          displayMedium: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
          displaySmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -0.2,
          ),
          headlineLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: -0.1,
          ),
          headlineMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFCBD5E1),
          ),
          headlineSmall: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFFCBD5E1),
          ),
          titleLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFFCBD5E1),
          ),
          titleMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF94A3B8),
          ),
          titleSmall: ThemeData.dark().textTheme.titleSmall,
          bodyLarge: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xFFCBD5E1),
            height: 1.5,
          ),
          bodyMedium: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Color(0xFF94A3B8),
            height: 1.4,
          ),
          bodySmall: ThemeData.dark().textTheme.bodySmall,
          labelLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.1,
          ),
          labelMedium: ThemeData.dark().textTheme.labelMedium,
          labelSmall: ThemeData.dark().textTheme.labelSmall,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.1,
                inherit: true,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(const Color(0xFF6366F1)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(0),
            shadowColor: MaterialStateProperty.all(
              const Color(0xFF6366F1).withOpacity(0.3),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ),
        // You can further customize dark theme if needed
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      home: WelcomeScreen(
        onLocaleChange: _setLocale,
        onThemeModeChange: _setThemeMode,
      ),
    );
  }
}
