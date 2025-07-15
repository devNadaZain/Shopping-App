# 🛒 Shopping App

A beautiful, modern, and fully localized shopping app built with Flutter and Dart. This project demonstrates best practices in UI/UX, theming, form validation, navigation, and internationalization (English & Arabic).

---

## 🌟 Project Overview

Shopping App is a cross-platform mobile application that provides a seamless shopping experience. It features a stunning welcome screen, secure sign-up/sign-in, animated navigation, a dynamic product catalog, full Arabic language support, and robust light/dark mode theming. The codebase is modular, clean, and ready for extension.

---

## 🚀 Features

- **Aesthetic Welcome Screen**
  - Custom font (Suwannaphum-Regular), bold, colored, and centered
  - AppBar with app title
  - Two images (local & online) in a row
  - Sign Up and Sign In buttons
- **Sign Up / Sign In Forms**
  - Full validation (name, email, password, confirm password)
  - Success dialogs and smooth navigation
- **Animated Navigation**
  - Fade transitions between screens
- **Shopping Home Screen**
  - Localized AppBar (English/Arabic)
  - Horizontal PageView for featured products
  - Responsive GridView for product cards (image, title, add to cart)
  - SnackBar on add to cart
  - Hot Offers section (ListView, images, descriptions)
- **Localization & RTL Support**
  - English and Arabic via `.arb` files and `intl`
  - All UI text, product names, and headers are localized (no hardcoded strings)
  - RTL layout for Arabic
  - Language switch button on all screens for instant locale switching
- **Theme & Dark Mode**
  - Light and dark themes with fully theme-based coloring for all widgets, cards, backgrounds, and dialogs
  - Theme switcher button (light/dark) on all screens
  - All colors and text adapt instantly to theme changes
  - AppBar, cards, containers, and all UI elements use theme colors (no hardcoded backgrounds)
- **Clean, Modular Codebase**
  - Each widget/class in a separate file
  - No unused or duplicated code
  - Clear naming and formatting
  - Uses best practices for localization and theming

---

## 🆕 Recent Enhancements

- **Language Switch Button:** Instantly switch between English and Arabic from any screen. All text, product names, and headers update immediately.
- **Theme Switcher:** Toggle between light and dark mode from any screen. All backgrounds, cards, and widgets adapt to the selected theme.
- **Full Dark Mode Support:** Every widget, card, and dialog uses true dark colors in dark mode. No hardcoded light backgrounds remain.
- **Dynamic RTL Layout:** The app layout and navigation adapt automatically for Arabic (RTL) and English (LTR).
- **Theme & Localization Best Practices:** All colors and text use the current theme and locale, ensuring a consistent and accessible experience.

---

## 🛠️ Setup Instructions

1. **Clone the repository:**

   ```sh
   git clone <your-repo-url>
   cd shopping_app_x
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the app:**

   ```sh
   flutter run
   ```

4. **Switch language or theme:**

   - Use the language and theme switch buttons in the app bar on any screen.
   - All UI and validation messages will appear in the selected language instantly.
   - All colors and backgrounds will adapt to the selected theme instantly.

5. **Assets & Fonts:**
   - All required assets and fonts are included in the repository.

---

## 📂 Project Structure

```
lib/
  main.dart
  app.dart
  l10n/
    app_en.arb
    app_ar.arb
    app_localizations.dart
  screens/
    welcome_screen.dart
    signup_screen.dart
    signin_screen.dart
    home_screen.dart
  widgets/
    intro_widget.dart
    animated_button.dart
    shimmer_loading.dart
  utils/
    fade_route.dart
    animated_route.dart
assets/
  images/
    local_image.png
  fonts/
    Suwannaphum-Regular.ttf
```

---

## ✨ Screenshots

> \_\_

---
s
## 📢 Credits

- Built with [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
- Font: [Suwannaphum](https://fonts.google.com/specimen/Suwannaphum)
- Images: [Unsplash](https://unsplash.com/) & [Picsum](https://picsum.photos/)

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for full details.
