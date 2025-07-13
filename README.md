# 🛒 Shopping App X

A beautiful, modern, and fully localized shopping app built with Flutter and Dart. This project demonstrates best practices in UI/UX, form validation, navigation, and internationalization (English & Arabic). Perfect for learning or as a foundation for your next e-commerce project!

---

## 🌟 Project Overview

Shopping App X is a cross-platform mobile application that provides a seamless shopping experience. It features a stunning welcome screen, secure sign-up/sign-in, animated navigation, a dynamic product catalog, and full Arabic language support. The codebase is modular, clean, and ready for extension.

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
  - All UI text is localized (no hardcoded strings)
  - RTL layout for Arabic
- **Clean Codebase**
  - Each widget/class in a separate file
  - No unused or duplicated code
  - Clear naming and formatting

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

4. **Switch language:**

   - Change your device/emulator language to Arabic to see RTL and Arabic text.
   - All UI and validation messages will appear in Arabic automatically.

5. **Assets & Fonts:**
   - All required assets and fonts are included in the repository.

---

## 📂 Project Structure

```
lib/
  main.dart
  app.dart
  l10n/
    intl_en.arb
    intl_ar.arb
    app_localizations.dart
  screens/
    welcome_screen.dart
    signup_screen.dart
    signin_screen.dart
    home_screen.dart
  widgets/
    intro_widget.dart
  utils/
    fade_route.dart
assets/
  images/
    local_image.png
  fonts/
    Suwannaphum-Regular.ttf
```

---

## ✨ Screenshots

> _Add screenshots here to showcase the UI in both English and Arabic!_

---

## 📢 Credits

- Built with [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
- Font: [Suwannaphum](https://fonts.google.com/specimen/Suwannaphum)
- Images: [Unsplash](https://unsplash.com/) & [Picsum](https://picsum.photos/)

---

## 💡 License

This project is open source and free to use for learning and development.
