import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping App'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping App'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover amazing products and exclusive deals'**
  String get welcomeSubtitle;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get accountCreated;

  /// No description provided for @accountSignIn.
  ///
  /// In en, this message translates to:
  /// **'Account sign-in successfully'**
  String get accountSignIn;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get ourProducts;

  /// No description provided for @hotOffers.
  ///
  /// In en, this message translates to:
  /// **'Hot Offers'**
  String get hotOffers;

  /// No description provided for @itemAdded.
  ///
  /// In en, this message translates to:
  /// **'Item added to the cart'**
  String get itemAdded;

  /// No description provided for @firstLetterUpper.
  ///
  /// In en, this message translates to:
  /// **'First letter must be uppercase'**
  String get firstLetterUpper;

  /// No description provided for @emailMustContainAt.
  ///
  /// In en, this message translates to:
  /// **'Email must include @'**
  String get emailMustContainAt;

  /// No description provided for @atLeast6Chars.
  ///
  /// In en, this message translates to:
  /// **'At least 6 characters'**
  String get atLeast6Chars;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryPasta.
  ///
  /// In en, this message translates to:
  /// **'Pasta'**
  String get categoryPasta;

  /// No description provided for @categoryPizza.
  ///
  /// In en, this message translates to:
  /// **'Pizza'**
  String get categoryPizza;

  /// No description provided for @categoryDessert.
  ///
  /// In en, this message translates to:
  /// **'Dessert'**
  String get categoryDessert;

  /// No description provided for @categoryDrinks.
  ///
  /// In en, this message translates to:
  /// **'Drinks'**
  String get categoryDrinks;

  /// No description provided for @categorySalad.
  ///
  /// In en, this message translates to:
  /// **'Salad'**
  String get categorySalad;

  /// No description provided for @productSpaghettiCarbonara.
  ///
  /// In en, this message translates to:
  /// **'Spaghetti Carbonara'**
  String get productSpaghettiCarbonara;

  /// No description provided for @productPenneArrabbiata.
  ///
  /// In en, this message translates to:
  /// **'Penne Arrabbiata'**
  String get productPenneArrabbiata;

  /// No description provided for @productMargheritaPizza.
  ///
  /// In en, this message translates to:
  /// **'Margherita Pizza'**
  String get productMargheritaPizza;

  /// No description provided for @productPepperoniPizza.
  ///
  /// In en, this message translates to:
  /// **'Pepperoni Pizza'**
  String get productPepperoniPizza;

  /// No description provided for @productChocolateCake.
  ///
  /// In en, this message translates to:
  /// **'Chocolate Cake'**
  String get productChocolateCake;

  /// No description provided for @productStrawberryCheesecake.
  ///
  /// In en, this message translates to:
  /// **'Strawberry Cheesecake'**
  String get productStrawberryCheesecake;

  /// No description provided for @productFreshOrangeJuice.
  ///
  /// In en, this message translates to:
  /// **'Fresh Orange Juice'**
  String get productFreshOrangeJuice;

  /// No description provided for @productIcedCoffee.
  ///
  /// In en, this message translates to:
  /// **'Iced Coffee'**
  String get productIcedCoffee;

  /// No description provided for @productCaesarSalad.
  ///
  /// In en, this message translates to:
  /// **'Caesar Salad'**
  String get productCaesarSalad;

  /// No description provided for @productGreekSalad.
  ///
  /// In en, this message translates to:
  /// **'Greek Salad'**
  String get productGreekSalad;

  /// No description provided for @headerFoodMenu.
  ///
  /// In en, this message translates to:
  /// **'Food Menu'**
  String get headerFoodMenu;

  /// No description provided for @headerAllFoodItems.
  ///
  /// In en, this message translates to:
  /// **'All Food Items'**
  String get headerAllFoodItems;

  /// No description provided for @headerFoodItems.
  ///
  /// In en, this message translates to:
  /// **'Food Items'**
  String get headerFoodItems;

  /// No description provided for @buttonAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get buttonAdd;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
