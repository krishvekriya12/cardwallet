// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Card Wallet App';

  @override
  String get addCard => 'Add Card';

  @override
  String get hiThere => 'Hi, there 👋';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appLock => 'App Lock';

  @override
  String get appLockSubtitle => 'Require biometrics to open the app';

  @override
  String get language => 'Language';

  @override
  String get backupRestore => 'Backup & Restore';

  @override
  String get backupRestoreSubtitle => 'Export & import your cards locally';

  @override
  String get clearAllData => 'Clear All Data';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String hiName(String name) {
    return 'Hi, $name 👋';
  }

  @override
  String get addNewCard => 'Add New Card';

  @override
  String get scan => 'Scan';

  @override
  String get scanDesc => 'Scan card details\ninstantly';

  @override
  String get manually => 'Manually';

  @override
  String get manuallyDesc => 'Enter card details\nmanually';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Tap card to add\nusing NFC';

  @override
  String get tools => 'Tools';

  @override
  String get binChecker => 'BIN Checker';

  @override
  String get binCheckerDesc => 'Check card details from BIN';

  @override
  String get cardVerify => 'Card Verify';

  @override
  String get cardVerifyDesc => 'Validate a card number';

  @override
  String get frequentlyAdded => 'Frequently Added';

  @override
  String get cardsTitle => 'Cards';

  @override
  String get yourCardsManage => 'Your cards here to manage';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cards saved',
      one: '1 card saved',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cards',
      one: '1 card',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'All';

  @override
  String get noCardsYet => 'No cards yet';

  @override
  String get noCardsYetDesc => 'Go to Home or tap scanner to add a card';

  @override
  String get noCardsCategory => 'No cards in this category';

  @override
  String get tryDifferentFilter => 'Try selecting a different filter';

  @override
  String get addFirstCardStart => 'Add your first card to get started';

  @override
  String get rateUs => 'Rate Us';

  @override
  String get rateUsThanks => 'Thanks for the support!';

  @override
  String get shareApp => 'Share App';

  @override
  String get shareAppSoon => 'Sharing coming soon';

  @override
  String get help => 'Help';

  @override
  String get supportSoon => 'Support coming soon';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicySoon => 'Opens the privacy policy';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get termsOfUseSoon => 'Opens the terms of use';

  @override
  String get clearDataTitle => 'Clear all data?';

  @override
  String get clearDataDesc =>
      'This permanently deletes every saved card. This cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get clearDataConfirm => 'Clear Data';

  @override
  String get clearDataToast => 'All data cleared';

  @override
  String get splashSubtitle => 'Your cards, safe & simple';

  @override
  String get unlockPrompt => 'Unlock Card Wallet to continue';

  @override
  String get tapToUnlock => 'Tap to Unlock';

  @override
  String get authFailed => 'Authentication failed';

  @override
  String get binCheckerTitle => 'BIN Checker';

  @override
  String get enterMin6Digits => 'Enter at least 6 digits';

  @override
  String get binNotVerified => 'This BIN could not be verified';

  @override
  String get lookupFailed =>
      'Lookup failed. Check your connection and try again.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN LOOKUP';

  @override
  String get enterDigitsLabel => 'Enter first 6–8 digits';

  @override
  String get checkButton => 'Check';

  @override
  String get binResultTitle => 'BIN Result';

  @override
  String get cardNetwork => 'Network';

  @override
  String get cardType => 'Type';

  @override
  String get cardBrandCategory => 'Brand/Category';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Country';

  @override
  String get cardCountryCode => 'Country Code';

  @override
  String get cardCurrency => 'Currency';

  @override
  String get cardValid => 'Valid';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get cardValidatorTitle => 'Card Validator';

  @override
  String get cardValidatorPreviewName => 'CARD VALIDATOR';

  @override
  String get enterCardNumberLabel => 'Enter card number';

  @override
  String get validCardNumber => 'Valid card number';

  @override
  String get invalidCardNumber => 'Invalid card number — check the digits';

  @override
  String get backupRestoreTitle => 'Backup & Restore';

  @override
  String get createBackupPass => 'Create Backup Password';

  @override
  String get backupPassWarning =>
      'IMPORTANT: Write down this password. We cannot recover it or restore your backup if you forget it.';

  @override
  String get enterPassLabel => 'Enter Password';

  @override
  String get confirmPassLabel => 'Confirm Password';

  @override
  String get passEmptyError => 'Password cannot be empty';

  @override
  String get passMismatchError => 'Passwords do not match';

  @override
  String get doneBtn => 'Done';

  @override
  String get enterBackupPass => 'Enter Backup Password';

  @override
  String get noCardsToBackup => 'No cards to backup';

  @override
  String get backupSuccess => 'Backup created successfully!';

  @override
  String backupFailed(String error) {
    return 'Backup failed: $error';
  }

  @override
  String get restoreBackupTitle => 'Restore backup?';

  @override
  String get restoreBackupWarning =>
      'WARNING: Restoring a backup will overwrite all current cards and transactions. This cannot be undone.';

  @override
  String get continueBtn => 'Continue';

  @override
  String get restoreSuccess => 'Backup restored successfully!';

  @override
  String get incorrectPasswordError =>
      'Incorrect password or corrupted backup file.';

  @override
  String restoreFailed(String error) {
    return 'Restore failed: $error';
  }

  @override
  String get deleteBackupTitle => 'Delete backup?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Delete \"$name\"? This cannot be undone.';
  }

  @override
  String get deleteBtn => 'Delete';

  @override
  String get backupDeleted => 'Backup deleted';

  @override
  String failedShareBackup(String error) {
    return 'Failed to share backup: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Failed to pick file: $error';
  }

  @override
  String get lastBackup => 'Last Backup';

  @override
  String get neverBackedUp => 'Never backed up';

  @override
  String get backupType => 'Backup Type';

  @override
  String get localBackupDesc => 'Local — saved on this device only';

  @override
  String get createBackupBtn => 'Create Backup';

  @override
  String get importExternalBackupBtn => 'Import External Backup';

  @override
  String get savedBackupsHeader => 'Saved Backups';

  @override
  String get noBackupsYet => 'No backups yet';

  @override
  String get tapCreateBackupDesc => 'Tap \"Create Backup\" to save your cards';

  @override
  String get restoreTooltip => 'Restore';

  @override
  String get shareTooltip => 'Share';

  @override
  String get cardNotFound => 'Card not found';

  @override
  String get editCardTitle => 'Edit Card';

  @override
  String get addCardTitle => 'Add Card';

  @override
  String get cardTypeLabel => 'Card type';

  @override
  String get cardColorLabel => 'Card color';

  @override
  String get fieldRequiredError => 'This field is required';

  @override
  String get bankNameLabel => 'Bank Name';

  @override
  String get expiryLabel => 'Expiry (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Card Photos';

  @override
  String get frontSideLabel => 'Front Side';

  @override
  String get backSideLabel => 'Back Side';

  @override
  String get notesLabel => 'Notes';

  @override
  String get saveChangesBtn => 'Save Changes';

  @override
  String get saveCardBtn => 'Save Card';

  @override
  String get deleteCardBtn => 'Delete card';

  @override
  String get takePhotoLabel => 'Take a photo';

  @override
  String get chooseGalleryLabel => 'Choose from gallery';

  @override
  String get deleteCardPrompt => 'Delete card?';

  @override
  String get deleteCardWarning => 'This action cannot be undone.';

  @override
  String get cardNumberLabel => 'Card Number';

  @override
  String get pointCardNumberLabel => 'Point Card Number';

  @override
  String get membershipIdLabel => 'Membership ID';

  @override
  String get couponCodeLabel => 'Coupon Code';

  @override
  String get giftCardNumberLabel => 'Gift Card Number';

  @override
  String get ticketPnrLabel => 'Ticket / PNR Number';

  @override
  String get numberLabel => 'Number';

  @override
  String get cardholderNameLabel => 'Cardholder Name';

  @override
  String get cardNameLabel => 'Card Name';

  @override
  String get enterValidCardNumberError => 'Enter a valid card number';

  @override
  String get cardNumberInvalidError => 'Card number looks invalid';

  @override
  String get enterMin3CharsError => 'Enter at least 3 characters';

  @override
  String get cardAlreadyExistsError =>
      'A card with this number is already saved';

  @override
  String get revealCvv => 'Reveal CVV';

  @override
  String get cardDetailsHeader => 'Card Details:';

  @override
  String get typePrefix => 'Type: ';

  @override
  String get bankPrefix => 'Bank: ';

  @override
  String get cardNumberPrefix => 'Card Number: ';

  @override
  String get cardholderPrefix => 'Cardholder: ';

  @override
  String get expiryPrefix => 'Expiry: ';

  @override
  String get notesPrefix => 'Notes: ';

  @override
  String get detailsSuffix => ' Details';

  @override
  String get cardDetailsTitle => 'Card Details';

  @override
  String get hideBtn => 'Hide';

  @override
  String get revealBtn => 'Reveal';

  @override
  String get editBtn => 'Edit';

  @override
  String get cardInformationHeader => 'Card Information';

  @override
  String get cardholderLabel => 'Cardholder';

  @override
  String get nameLabel => 'Name';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'PNR Number';

  @override
  String get venueLabel => 'Venue';

  @override
  String get eventDateLabel => 'Event Date';

  @override
  String get seatLabel => 'Seat';

  @override
  String get classLabel => 'Class';

  @override
  String get discountDetailsLabel => 'Discount Details';

  @override
  String get memberIdLabel => 'Member ID';

  @override
  String get tierStatusLabel => 'Tier Status';

  @override
  String get pointsBalanceLabel => 'Points Balance';

  @override
  String get secondaryPinLabel => 'Secondary PIN';

  @override
  String get issueDateLabel => 'Issue Date';

  @override
  String get documentTitleLabel => 'Document Title';

  @override
  String get nfcReaderTitle => 'NFC Reader';

  @override
  String get nfcNotAvailable => 'NFC not available';

  @override
  String get nfcUnsupportedDesc =>
      'This device does not support NFC card reading.';

  @override
  String get readyToScan => 'Ready to Scan';

  @override
  String get holdCardNfcPrompt =>
      'Hold your contactless card to the back of your phone.';

  @override
  String get scanFailed => 'Scan Failed';

  @override
  String get somethingWentWrong => 'Something went wrong.';

  @override
  String get tryAgainBtn => 'Try Again';

  @override
  String get cardDetected => 'Card Detected';

  @override
  String get unsupportedCardError => 'This card type is not supported.';

  @override
  String get nfcReadFailedDesc =>
      'Could not read this card. Try again or add it manually.';

  @override
  String nfcReadError(String error) {
    return 'Read failed: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Could not start NFC session: $error';
  }

  @override
  String get scanCardTitle => 'Scan Card';

  @override
  String get noCameraError => 'No camera available on this device';

  @override
  String cameraStartError(String error) {
    return 'Could not start camera: $error';
  }

  @override
  String get ocrReadError =>
      'Could not read card details. Try again with better lighting.';

  @override
  String ocrScanFailed(String error) {
    return 'Scan failed: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Camera permission is required to scan a card.';

  @override
  String get openSettingsBtn => 'Open Settings';

  @override
  String get notDetected => 'Not detected';

  @override
  String get scanAgainBtn => 'Scan Again';

  @override
  String get cardPhotosDesc =>
      'Keep a photo of your card for quick reference. Images stay on this device.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Add $label photo';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get benefitRemoveAdsTitle => 'Remove all ads';

  @override
  String get benefitRemoveAdsDesc => 'No banners, no interstitials, ever';

  @override
  String get benefitFasterTitle => 'Faster experience';

  @override
  String get benefitFasterDesc => 'Instant screens with nothing to load';

  @override
  String get benefitSupportTitle => 'Support development';

  @override
  String get benefitSupportDesc => 'Help keep the app growing';

  @override
  String get benefitBadgeTitle => 'Premium badge';

  @override
  String get benefitBadgeDesc => 'A little thank-you on your profile';

  @override
  String get premiumHeroActive => 'You\'re Premium';

  @override
  String get premiumHeroInactive => 'Go Ad-Free';

  @override
  String get premiumHeroDescActive => 'Thanks for supporting Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Remove ads and unlock a cleaner experience';

  @override
  String get disablePremiumBtn => 'Disable Premium';

  @override
  String get removeAdsBtn => 'Remove Ads';

  @override
  String get premiumOneTimeNotice =>
      'One-time. Restores instantly on this device.';

  @override
  String get noBiometricsConfigured =>
      'No biometrics/device lock configured on this device';

  @override
  String get cardTypeCredit => 'Credit Card';

  @override
  String get cardTypeDebit => 'Debit Card';

  @override
  String get cardTypePoint => 'Point Card';

  @override
  String get cardTypeMembership => 'Membership Card';

  @override
  String get cardTypeCoupon => 'Coupon';

  @override
  String get cardTypeGift => 'Gift Card';

  @override
  String get cardTypeEventTicket => 'Event Ticket';

  @override
  String get cardTypeOther => 'Other';

  @override
  String get chooseCardType => 'Choose card type';

  @override
  String get selectCustomColor => 'Select Custom Color';

  @override
  String get solidColor => 'Solid';

  @override
  String get gradientColor => 'Gradient';

  @override
  String get startColor => 'Start';

  @override
  String get endColor => 'End';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Home';

  @override
  String get cardsTab => 'My Cards';

  @override
  String get profileTab => 'Profile';

  @override
  String get appTitleTypewriter => 'Card Wallet';

  @override
  String get seeAll => 'See All';

  @override
  String get backupShareText => 'Card Wallet Secure Backup';

  @override
  String get backupFileNotFoundError => 'Backup file not found';

  @override
  String get corruptedBackupError => 'Corrupted or invalid backup file';

  @override
  String get invalidBackupDataError =>
      'Backup file does not contain valid data.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Unsupported backup version: $version';
  }
}
