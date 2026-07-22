import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('ms'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('th'),
    Locale('tr'),
    Locale('vi'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Wallet App'**
  String get appTitle;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCard;

  /// No description provided for @hiThere.
  ///
  /// In en, this message translates to:
  /// **'Hi, there 👋'**
  String get hiThere;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @appLock.
  ///
  /// In en, this message translates to:
  /// **'App Lock'**
  String get appLock;

  /// No description provided for @appLockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Require biometrics to open the app'**
  String get appLockSubtitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @backupRestore.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupRestore;

  /// No description provided for @backupRestoreSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Export & import your cards locally'**
  String get backupRestoreSubtitle;

  /// No description provided for @clearAllData.
  ///
  /// In en, this message translates to:
  /// **'Clear All Data'**
  String get clearAllData;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get goodEvening;

  /// No description provided for @hiName.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name} 👋'**
  String hiName(String name);

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get addNewCard;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @scanDesc.
  ///
  /// In en, this message translates to:
  /// **'Scan card details\ninstantly'**
  String get scanDesc;

  /// No description provided for @manually.
  ///
  /// In en, this message translates to:
  /// **'Manually'**
  String get manually;

  /// No description provided for @manuallyDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter card details\nmanually'**
  String get manuallyDesc;

  /// No description provided for @nfc.
  ///
  /// In en, this message translates to:
  /// **'NFC'**
  String get nfc;

  /// No description provided for @nfcDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap card to add\nusing NFC'**
  String get nfcDesc;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @binChecker.
  ///
  /// In en, this message translates to:
  /// **'BIN Checker'**
  String get binChecker;

  /// No description provided for @binCheckerDesc.
  ///
  /// In en, this message translates to:
  /// **'Check card details from BIN'**
  String get binCheckerDesc;

  /// No description provided for @cardVerify.
  ///
  /// In en, this message translates to:
  /// **'Card Verify'**
  String get cardVerify;

  /// No description provided for @cardVerifyDesc.
  ///
  /// In en, this message translates to:
  /// **'Validate a card number'**
  String get cardVerifyDesc;

  /// No description provided for @frequentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Frequently Added'**
  String get frequentlyAdded;

  /// No description provided for @cardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Cards'**
  String get cardsTitle;

  /// No description provided for @yourCardsManage.
  ///
  /// In en, this message translates to:
  /// **'Your cards here to manage'**
  String get yourCardsManage;

  /// No description provided for @cardCountText.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 card saved} other{{count} cards saved}}'**
  String cardCountText(num count);

  /// No description provided for @cardCountBadge.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 card} other{{count} cards}}'**
  String cardCountBadge(num count);

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @noCardsYet.
  ///
  /// In en, this message translates to:
  /// **'No cards yet'**
  String get noCardsYet;

  /// No description provided for @noCardsYetDesc.
  ///
  /// In en, this message translates to:
  /// **'Go to Home or tap scanner to add a card'**
  String get noCardsYetDesc;

  /// No description provided for @noCardsCategory.
  ///
  /// In en, this message translates to:
  /// **'No cards in this category'**
  String get noCardsCategory;

  /// No description provided for @tryDifferentFilter.
  ///
  /// In en, this message translates to:
  /// **'Try selecting a different filter'**
  String get tryDifferentFilter;

  /// No description provided for @addFirstCardStart.
  ///
  /// In en, this message translates to:
  /// **'Add your first card to get started'**
  String get addFirstCardStart;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @rateUsThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for the support!'**
  String get rateUsThanks;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @shareAppSoon.
  ///
  /// In en, this message translates to:
  /// **'Sharing coming soon'**
  String get shareAppSoon;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @supportSoon.
  ///
  /// In en, this message translates to:
  /// **'Support coming soon'**
  String get supportSoon;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicySoon.
  ///
  /// In en, this message translates to:
  /// **'Opens the privacy policy'**
  String get privacyPolicySoon;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @termsOfUseSoon.
  ///
  /// In en, this message translates to:
  /// **'Opens the terms of use'**
  String get termsOfUseSoon;

  /// No description provided for @clearDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all data?'**
  String get clearDataTitle;

  /// No description provided for @clearDataDesc.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes every saved card. This cannot be undone.'**
  String get clearDataDesc;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @clearDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear Data'**
  String get clearDataConfirm;

  /// No description provided for @clearDataToast.
  ///
  /// In en, this message translates to:
  /// **'All data cleared'**
  String get clearDataToast;

  /// No description provided for @splashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your cards, safe & simple'**
  String get splashSubtitle;

  /// No description provided for @unlockPrompt.
  ///
  /// In en, this message translates to:
  /// **'Unlock Card Wallet to continue'**
  String get unlockPrompt;

  /// No description provided for @tapToUnlock.
  ///
  /// In en, this message translates to:
  /// **'Tap to Unlock'**
  String get tapToUnlock;

  /// No description provided for @authFailed.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get authFailed;

  /// No description provided for @binCheckerTitle.
  ///
  /// In en, this message translates to:
  /// **'BIN Checker'**
  String get binCheckerTitle;

  /// No description provided for @enterMin6Digits.
  ///
  /// In en, this message translates to:
  /// **'Enter at least 6 digits'**
  String get enterMin6Digits;

  /// No description provided for @binNotVerified.
  ///
  /// In en, this message translates to:
  /// **'This BIN could not be verified'**
  String get binNotVerified;

  /// No description provided for @lookupFailed.
  ///
  /// In en, this message translates to:
  /// **'Lookup failed. Check your connection and try again.'**
  String get lookupFailed;

  /// No description provided for @binLookupPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'BIN / IIN LOOKUP'**
  String get binLookupPlaceholder;

  /// No description provided for @enterDigitsLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter first 6–8 digits'**
  String get enterDigitsLabel;

  /// No description provided for @checkButton.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get checkButton;

  /// No description provided for @binResultTitle.
  ///
  /// In en, this message translates to:
  /// **'BIN Result'**
  String get binResultTitle;

  /// No description provided for @cardNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get cardNetwork;

  /// No description provided for @cardType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get cardType;

  /// No description provided for @cardBrandCategory.
  ///
  /// In en, this message translates to:
  /// **'Brand/Category'**
  String get cardBrandCategory;

  /// No description provided for @cardBank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get cardBank;

  /// No description provided for @cardCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get cardCountry;

  /// No description provided for @cardCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get cardCountryCode;

  /// No description provided for @cardCurrency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get cardCurrency;

  /// No description provided for @cardValid.
  ///
  /// In en, this message translates to:
  /// **'Valid'**
  String get cardValid;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @cardValidatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Validator'**
  String get cardValidatorTitle;

  /// No description provided for @cardValidatorPreviewName.
  ///
  /// In en, this message translates to:
  /// **'CARD VALIDATOR'**
  String get cardValidatorPreviewName;

  /// No description provided for @enterCardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter card number'**
  String get enterCardNumberLabel;

  /// No description provided for @validCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Valid card number'**
  String get validCardNumber;

  /// No description provided for @invalidCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid card number — check the digits'**
  String get invalidCardNumber;

  /// No description provided for @backupRestoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get backupRestoreTitle;

  /// No description provided for @createBackupPass.
  ///
  /// In en, this message translates to:
  /// **'Create Backup Password'**
  String get createBackupPass;

  /// No description provided for @backupPassWarning.
  ///
  /// In en, this message translates to:
  /// **'IMPORTANT: Write down this password. We cannot recover it or restore your backup if you forget it.'**
  String get backupPassWarning;

  /// No description provided for @enterPassLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassLabel;

  /// No description provided for @confirmPassLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassLabel;

  /// No description provided for @passEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passEmptyError;

  /// No description provided for @passMismatchError.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passMismatchError;

  /// No description provided for @doneBtn.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneBtn;

  /// No description provided for @enterBackupPass.
  ///
  /// In en, this message translates to:
  /// **'Enter Backup Password'**
  String get enterBackupPass;

  /// No description provided for @noCardsToBackup.
  ///
  /// In en, this message translates to:
  /// **'No cards to backup'**
  String get noCardsToBackup;

  /// No description provided for @backupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup created successfully!'**
  String get backupSuccess;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'Backup failed: {error}'**
  String backupFailed(String error);

  /// No description provided for @restoreBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Restore backup?'**
  String get restoreBackupTitle;

  /// No description provided for @restoreBackupWarning.
  ///
  /// In en, this message translates to:
  /// **'WARNING: Restoring a backup will overwrite all current cards and transactions. This cannot be undone.'**
  String get restoreBackupWarning;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @restoreSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup restored successfully!'**
  String get restoreSuccess;

  /// No description provided for @incorrectPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password or corrupted backup file.'**
  String get incorrectPasswordError;

  /// No description provided for @restoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed: {error}'**
  String restoreFailed(String error);

  /// No description provided for @deleteBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete backup?'**
  String get deleteBackupTitle;

  /// No description provided for @deleteBackupConfirmText.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? This cannot be undone.'**
  String deleteBackupConfirmText(String name);

  /// No description provided for @deleteBtn.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteBtn;

  /// No description provided for @backupDeleted.
  ///
  /// In en, this message translates to:
  /// **'Backup deleted'**
  String get backupDeleted;

  /// No description provided for @failedShareBackup.
  ///
  /// In en, this message translates to:
  /// **'Failed to share backup: {error}'**
  String failedShareBackup(String error);

  /// No description provided for @failedPickFile.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick file: {error}'**
  String failedPickFile(String error);

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last Backup'**
  String get lastBackup;

  /// No description provided for @neverBackedUp.
  ///
  /// In en, this message translates to:
  /// **'Never backed up'**
  String get neverBackedUp;

  /// No description provided for @backupType.
  ///
  /// In en, this message translates to:
  /// **'Backup Type'**
  String get backupType;

  /// No description provided for @localBackupDesc.
  ///
  /// In en, this message translates to:
  /// **'Local — saved on this device only'**
  String get localBackupDesc;

  /// No description provided for @createBackupBtn.
  ///
  /// In en, this message translates to:
  /// **'Create Backup'**
  String get createBackupBtn;

  /// No description provided for @importExternalBackupBtn.
  ///
  /// In en, this message translates to:
  /// **'Import External Backup'**
  String get importExternalBackupBtn;

  /// No description provided for @savedBackupsHeader.
  ///
  /// In en, this message translates to:
  /// **'Saved Backups'**
  String get savedBackupsHeader;

  /// No description provided for @noBackupsYet.
  ///
  /// In en, this message translates to:
  /// **'No backups yet'**
  String get noBackupsYet;

  /// No description provided for @tapCreateBackupDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Create Backup\" to save your cards'**
  String get tapCreateBackupDesc;

  /// No description provided for @restoreTooltip.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restoreTooltip;

  /// No description provided for @shareTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareTooltip;

  /// No description provided for @cardNotFound.
  ///
  /// In en, this message translates to:
  /// **'Card not found'**
  String get cardNotFound;

  /// No description provided for @editCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Card'**
  String get editCardTitle;

  /// No description provided for @addCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get addCardTitle;

  /// No description provided for @cardTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Card type'**
  String get cardTypeLabel;

  /// No description provided for @cardColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Card color'**
  String get cardColorLabel;

  /// No description provided for @fieldRequiredError.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequiredError;

  /// No description provided for @bankNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankNameLabel;

  /// No description provided for @expiryLabel.
  ///
  /// In en, this message translates to:
  /// **'Expiry (MM/YY)'**
  String get expiryLabel;

  /// No description provided for @cvvLabel.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvvLabel;

  /// No description provided for @cardPhotosLabel.
  ///
  /// In en, this message translates to:
  /// **'Card Photos'**
  String get cardPhotosLabel;

  /// No description provided for @frontSideLabel.
  ///
  /// In en, this message translates to:
  /// **'Front Side'**
  String get frontSideLabel;

  /// No description provided for @backSideLabel.
  ///
  /// In en, this message translates to:
  /// **'Back Side'**
  String get backSideLabel;

  /// No description provided for @notesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesLabel;

  /// No description provided for @saveChangesBtn.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesBtn;

  /// No description provided for @saveCardBtn.
  ///
  /// In en, this message translates to:
  /// **'Save Card'**
  String get saveCardBtn;

  /// No description provided for @deleteCardBtn.
  ///
  /// In en, this message translates to:
  /// **'Delete card'**
  String get deleteCardBtn;

  /// No description provided for @takePhotoLabel.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhotoLabel;

  /// No description provided for @chooseGalleryLabel.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get chooseGalleryLabel;

  /// No description provided for @deleteCardPrompt.
  ///
  /// In en, this message translates to:
  /// **'Delete card?'**
  String get deleteCardPrompt;

  /// No description provided for @deleteCardWarning.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get deleteCardWarning;

  /// No description provided for @cardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumberLabel;

  /// No description provided for @pointCardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Point Card Number'**
  String get pointCardNumberLabel;

  /// No description provided for @membershipIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Membership ID'**
  String get membershipIdLabel;

  /// No description provided for @couponCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCodeLabel;

  /// No description provided for @giftCardNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Gift Card Number'**
  String get giftCardNumberLabel;

  /// No description provided for @ticketPnrLabel.
  ///
  /// In en, this message translates to:
  /// **'Ticket / PNR Number'**
  String get ticketPnrLabel;

  /// No description provided for @numberLabel.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get numberLabel;

  /// No description provided for @cardholderNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Cardholder Name'**
  String get cardholderNameLabel;

  /// No description provided for @cardNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Card Name'**
  String get cardNameLabel;

  /// No description provided for @enterValidCardNumberError.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid card number'**
  String get enterValidCardNumberError;

  /// No description provided for @cardNumberInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Card number looks invalid'**
  String get cardNumberInvalidError;

  /// No description provided for @enterMin3CharsError.
  ///
  /// In en, this message translates to:
  /// **'Enter at least 3 characters'**
  String get enterMin3CharsError;

  /// No description provided for @cardAlreadyExistsError.
  ///
  /// In en, this message translates to:
  /// **'A card with this number is already saved'**
  String get cardAlreadyExistsError;

  /// No description provided for @revealCvv.
  ///
  /// In en, this message translates to:
  /// **'Reveal CVV'**
  String get revealCvv;

  /// No description provided for @cardDetailsHeader.
  ///
  /// In en, this message translates to:
  /// **'Card Details:'**
  String get cardDetailsHeader;

  /// No description provided for @typePrefix.
  ///
  /// In en, this message translates to:
  /// **'Type: '**
  String get typePrefix;

  /// No description provided for @bankPrefix.
  ///
  /// In en, this message translates to:
  /// **'Bank: '**
  String get bankPrefix;

  /// No description provided for @cardNumberPrefix.
  ///
  /// In en, this message translates to:
  /// **'Card Number: '**
  String get cardNumberPrefix;

  /// No description provided for @cardholderPrefix.
  ///
  /// In en, this message translates to:
  /// **'Cardholder: '**
  String get cardholderPrefix;

  /// No description provided for @expiryPrefix.
  ///
  /// In en, this message translates to:
  /// **'Expiry: '**
  String get expiryPrefix;

  /// No description provided for @notesPrefix.
  ///
  /// In en, this message translates to:
  /// **'Notes: '**
  String get notesPrefix;

  /// No description provided for @detailsSuffix.
  ///
  /// In en, this message translates to:
  /// **' Details'**
  String get detailsSuffix;

  /// No description provided for @cardDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Card Details'**
  String get cardDetailsTitle;

  /// No description provided for @hideBtn.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hideBtn;

  /// No description provided for @revealBtn.
  ///
  /// In en, this message translates to:
  /// **'Reveal'**
  String get revealBtn;

  /// No description provided for @editBtn.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editBtn;

  /// No description provided for @cardInformationHeader.
  ///
  /// In en, this message translates to:
  /// **'Card Information'**
  String get cardInformationHeader;

  /// No description provided for @cardholderLabel.
  ///
  /// In en, this message translates to:
  /// **'Cardholder'**
  String get cardholderLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @bankLabel.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bankLabel;

  /// No description provided for @pnrNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'PNR Number'**
  String get pnrNumberLabel;

  /// No description provided for @venueLabel.
  ///
  /// In en, this message translates to:
  /// **'Venue'**
  String get venueLabel;

  /// No description provided for @eventDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get eventDateLabel;

  /// No description provided for @seatLabel.
  ///
  /// In en, this message translates to:
  /// **'Seat'**
  String get seatLabel;

  /// No description provided for @classLabel.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get classLabel;

  /// No description provided for @discountDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Discount Details'**
  String get discountDetailsLabel;

  /// No description provided for @memberIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Member ID'**
  String get memberIdLabel;

  /// No description provided for @tierStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Tier Status'**
  String get tierStatusLabel;

  /// No description provided for @pointsBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Points Balance'**
  String get pointsBalanceLabel;

  /// No description provided for @secondaryPinLabel.
  ///
  /// In en, this message translates to:
  /// **'Secondary PIN'**
  String get secondaryPinLabel;

  /// No description provided for @issueDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDateLabel;

  /// No description provided for @documentTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Document Title'**
  String get documentTitleLabel;

  /// No description provided for @nfcReaderTitle.
  ///
  /// In en, this message translates to:
  /// **'NFC Reader'**
  String get nfcReaderTitle;

  /// No description provided for @nfcNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'NFC not available'**
  String get nfcNotAvailable;

  /// No description provided for @nfcUnsupportedDesc.
  ///
  /// In en, this message translates to:
  /// **'This device does not support NFC card reading.'**
  String get nfcUnsupportedDesc;

  /// No description provided for @readyToScan.
  ///
  /// In en, this message translates to:
  /// **'Ready to Scan'**
  String get readyToScan;

  /// No description provided for @holdCardNfcPrompt.
  ///
  /// In en, this message translates to:
  /// **'Hold your contactless card to the back of your phone.'**
  String get holdCardNfcPrompt;

  /// No description provided for @scanFailed.
  ///
  /// In en, this message translates to:
  /// **'Scan Failed'**
  String get scanFailed;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get somethingWentWrong;

  /// No description provided for @tryAgainBtn.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgainBtn;

  /// No description provided for @cardDetected.
  ///
  /// In en, this message translates to:
  /// **'Card Detected'**
  String get cardDetected;

  /// No description provided for @unsupportedCardError.
  ///
  /// In en, this message translates to:
  /// **'This card type is not supported.'**
  String get unsupportedCardError;

  /// No description provided for @nfcReadFailedDesc.
  ///
  /// In en, this message translates to:
  /// **'Could not read this card. Try again or add it manually.'**
  String get nfcReadFailedDesc;

  /// No description provided for @nfcReadError.
  ///
  /// In en, this message translates to:
  /// **'Read failed: {error}'**
  String nfcReadError(String error);

  /// No description provided for @nfcStartSessionError.
  ///
  /// In en, this message translates to:
  /// **'Could not start NFC session: {error}'**
  String nfcStartSessionError(String error);

  /// No description provided for @scanCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan Card'**
  String get scanCardTitle;

  /// No description provided for @noCameraError.
  ///
  /// In en, this message translates to:
  /// **'No camera available on this device'**
  String get noCameraError;

  /// No description provided for @cameraStartError.
  ///
  /// In en, this message translates to:
  /// **'Could not start camera: {error}'**
  String cameraStartError(String error);

  /// No description provided for @ocrReadError.
  ///
  /// In en, this message translates to:
  /// **'Could not read card details. Try again with better lighting.'**
  String get ocrReadError;

  /// No description provided for @ocrScanFailed.
  ///
  /// In en, this message translates to:
  /// **'Scan failed: {error}'**
  String ocrScanFailed(String error);

  /// No description provided for @cameraPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan a card.'**
  String get cameraPermissionDesc;

  /// No description provided for @openSettingsBtn.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettingsBtn;

  /// No description provided for @notDetected.
  ///
  /// In en, this message translates to:
  /// **'Not detected'**
  String get notDetected;

  /// No description provided for @scanAgainBtn.
  ///
  /// In en, this message translates to:
  /// **'Scan Again'**
  String get scanAgainBtn;

  /// No description provided for @cardPhotosDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep a photo of your card for quick reference. Images stay on this device.'**
  String get cardPhotosDesc;

  /// No description provided for @addPhotoPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Add {label} photo'**
  String addPhotoPlaceholder(String label);

  /// No description provided for @premiumTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumTitle;

  /// No description provided for @benefitRemoveAdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove all ads'**
  String get benefitRemoveAdsTitle;

  /// No description provided for @benefitRemoveAdsDesc.
  ///
  /// In en, this message translates to:
  /// **'No banners, no interstitials, ever'**
  String get benefitRemoveAdsDesc;

  /// No description provided for @benefitFasterTitle.
  ///
  /// In en, this message translates to:
  /// **'Faster experience'**
  String get benefitFasterTitle;

  /// No description provided for @benefitFasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Instant screens with nothing to load'**
  String get benefitFasterDesc;

  /// No description provided for @benefitSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support development'**
  String get benefitSupportTitle;

  /// No description provided for @benefitSupportDesc.
  ///
  /// In en, this message translates to:
  /// **'Help keep the app growing'**
  String get benefitSupportDesc;

  /// No description provided for @benefitBadgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Premium badge'**
  String get benefitBadgeTitle;

  /// No description provided for @benefitBadgeDesc.
  ///
  /// In en, this message translates to:
  /// **'A little thank-you on your profile'**
  String get benefitBadgeDesc;

  /// No description provided for @premiumHeroActive.
  ///
  /// In en, this message translates to:
  /// **'You\'re Premium'**
  String get premiumHeroActive;

  /// No description provided for @premiumHeroInactive.
  ///
  /// In en, this message translates to:
  /// **'Go Ad-Free'**
  String get premiumHeroInactive;

  /// No description provided for @premiumHeroDescActive.
  ///
  /// In en, this message translates to:
  /// **'Thanks for supporting Card Wallet'**
  String get premiumHeroDescActive;

  /// No description provided for @premiumHeroDescInactive.
  ///
  /// In en, this message translates to:
  /// **'Remove ads and unlock a cleaner experience'**
  String get premiumHeroDescInactive;

  /// No description provided for @disablePremiumBtn.
  ///
  /// In en, this message translates to:
  /// **'Disable Premium'**
  String get disablePremiumBtn;

  /// No description provided for @removeAdsBtn.
  ///
  /// In en, this message translates to:
  /// **'Remove Ads'**
  String get removeAdsBtn;

  /// No description provided for @premiumOneTimeNotice.
  ///
  /// In en, this message translates to:
  /// **'One-time. Restores instantly on this device.'**
  String get premiumOneTimeNotice;

  /// No description provided for @noBiometricsConfigured.
  ///
  /// In en, this message translates to:
  /// **'No biometrics/device lock configured on this device'**
  String get noBiometricsConfigured;

  /// No description provided for @cardTypeCredit.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get cardTypeCredit;

  /// No description provided for @cardTypeDebit.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get cardTypeDebit;

  /// No description provided for @cardTypePoint.
  ///
  /// In en, this message translates to:
  /// **'Point Card'**
  String get cardTypePoint;

  /// No description provided for @cardTypeMembership.
  ///
  /// In en, this message translates to:
  /// **'Membership Card'**
  String get cardTypeMembership;

  /// No description provided for @cardTypeCoupon.
  ///
  /// In en, this message translates to:
  /// **'Coupon'**
  String get cardTypeCoupon;

  /// No description provided for @cardTypeGift.
  ///
  /// In en, this message translates to:
  /// **'Gift Card'**
  String get cardTypeGift;

  /// No description provided for @cardTypeEventTicket.
  ///
  /// In en, this message translates to:
  /// **'Event Ticket'**
  String get cardTypeEventTicket;

  /// No description provided for @cardTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get cardTypeOther;

  /// No description provided for @chooseCardType.
  ///
  /// In en, this message translates to:
  /// **'Choose card type'**
  String get chooseCardType;

  /// No description provided for @selectCustomColor.
  ///
  /// In en, this message translates to:
  /// **'Select Custom Color'**
  String get selectCustomColor;

  /// No description provided for @solidColor.
  ///
  /// In en, this message translates to:
  /// **'Solid'**
  String get solidColor;

  /// No description provided for @gradientColor.
  ///
  /// In en, this message translates to:
  /// **'Gradient'**
  String get gradientColor;

  /// No description provided for @startColor.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startColor;

  /// No description provided for @endColor.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get endColor;

  /// No description provided for @cardExpLabel.
  ///
  /// In en, this message translates to:
  /// **'EXP'**
  String get cardExpLabel;

  /// No description provided for @homeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// No description provided for @cardsTab.
  ///
  /// In en, this message translates to:
  /// **'My Cards'**
  String get cardsTab;

  /// No description provided for @profileTab.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTab;

  /// No description provided for @appTitleTypewriter.
  ///
  /// In en, this message translates to:
  /// **'Card Wallet'**
  String get appTitleTypewriter;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @backupShareText.
  ///
  /// In en, this message translates to:
  /// **'Card Wallet Secure Backup'**
  String get backupShareText;

  /// No description provided for @backupFileNotFoundError.
  ///
  /// In en, this message translates to:
  /// **'Backup file not found'**
  String get backupFileNotFoundError;

  /// No description provided for @corruptedBackupError.
  ///
  /// In en, this message translates to:
  /// **'Corrupted or invalid backup file'**
  String get corruptedBackupError;

  /// No description provided for @invalidBackupDataError.
  ///
  /// In en, this message translates to:
  /// **'Backup file does not contain valid data.'**
  String get invalidBackupDataError;

  /// No description provided for @unsupportedBackupVersionError.
  ///
  /// In en, this message translates to:
  /// **'Unsupported backup version: {version}'**
  String unsupportedBackupVersionError(String version);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fil',
    'fr',
    'he',
    'hi',
    'id',
    'it',
    'ja',
    'ko',
    'ms',
    'nl',
    'pl',
    'pt',
    'ru',
    'th',
    'tr',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
