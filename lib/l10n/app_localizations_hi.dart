// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'कार्ड वॉलेट ऐप';

  @override
  String get addCard => 'कार्ड जोड़ें';

  @override
  String get hiThere => 'नमस्ते! 👋';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get appLock => 'ऐप लॉक';

  @override
  String get appLockSubtitle => 'ऐप खोलने के लिए बायोमेट्रिक्स की आवश्यकता है';

  @override
  String get language => 'भाषा';

  @override
  String get backupRestore => 'बैकअप और रीस्टोर';

  @override
  String get backupRestoreSubtitle =>
      'अपने कार्ड स्थानीय रूप से एक्सपोर्ट और इम्पोर्ट करें';

  @override
  String get clearAllData => 'सभी डेटा मिटाएं';

  @override
  String get goodMorning => 'सुप्रभात';

  @override
  String get goodAfternoon => 'नमस्कार';

  @override
  String get goodEvening => 'शुभ संध्या';

  @override
  String hiName(String name) {
    return 'नमस्ते, $name 👋';
  }

  @override
  String get addNewCard => 'नया कार्ड जोड़ें';

  @override
  String get scan => 'स्कैन करें';

  @override
  String get scanDesc => 'कार्ड का विवरण तुरंत\nस्कैन करें';

  @override
  String get manually => 'मैन्युअल रूप से';

  @override
  String get manuallyDesc => 'कार्ड का विवरण मैन्युअल रूप से\nदर्ज करें';

  @override
  String get nfc => 'एनएफसी';

  @override
  String get nfcDesc => 'एनएफसी का उपयोग करके जोड़ने के लिए\nकार्ड टैप करें';

  @override
  String get tools => 'टूल्स';

  @override
  String get binChecker => 'बिन चेकर';

  @override
  String get binCheckerDesc => 'बिन (BIN) से कार्ड का विवरण जांचें';

  @override
  String get cardVerify => 'कार्ड सत्यापित करें';

  @override
  String get cardVerifyDesc => 'कार्ड नंबर सत्यापित करें';

  @override
  String get frequentlyAdded => 'अक्सर जोड़े जाने वाले';

  @override
  String get cardsTitle => 'कार्ड्स';

  @override
  String get yourCardsManage => 'प्रबंधन के लिए आपके कार्ड यहाँ हैं';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कार्ड सहेजे गए',
      one: '1 कार्ड सहेजा गया',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कार्ड',
      one: '1 कार्ड',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'सभी';

  @override
  String get noCardsYet => 'अभी तक कोई कार्ड नहीं है';

  @override
  String get noCardsYetDesc =>
      'होम पर जाएं या कार्ड जोड़ने के लिए स्कैनर पर टैप करें';

  @override
  String get noCardsCategory => 'इस श्रेणी में कोई कार्ड नहीं है';

  @override
  String get tryDifferentFilter => 'दूसरा फ़िल्टर चुनने का प्रयास करें';

  @override
  String get addFirstCardStart => 'शुरू करने के लिए अपना पहला कार्ड जोड़ें';

  @override
  String get rateUs => 'हमें रेट करें';

  @override
  String get rateUsThanks => 'समर्थन के लिए धन्यवाद!';

  @override
  String get shareApp => 'ऐप शेयर करें';

  @override
  String get shareAppSoon => 'शेयरिंग जल्द ही आ रही है';

  @override
  String get help => 'सहायता';

  @override
  String get supportSoon => 'सहायता जल्द ही आ रही है';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get privacyPolicySoon => 'गोपनीयता नीति खोलता है';

  @override
  String get termsOfUse => 'उपयोग की शर्तें';

  @override
  String get termsOfUseSoon => 'उपयोग की शर्तें खोलता है';

  @override
  String get clearDataTitle => 'सभी डेटा मिटाएं?';

  @override
  String get clearDataDesc =>
      'यह स्थायी रूप से प्रत्येक सहेजे गए कार्ड को हटा देता है। इसे वापस नहीं लाया जा सकता।';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get clearDataConfirm => 'डेटा मिटाएं';

  @override
  String get clearDataToast => 'सभी डेटा हटा दिया गया';

  @override
  String get splashSubtitle => 'आपके कार्ड, सुरक्षित और सरल';

  @override
  String get unlockPrompt => 'आगे बढ़ने के लिए कार्ड वॉलेट को अनलॉक करें';

  @override
  String get tapToUnlock => 'अनलॉक करने के लिए टैप करें';

  @override
  String get authFailed => 'सत्यापन विफल रहा';

  @override
  String get binCheckerTitle => 'बिन चेकर';

  @override
  String get enterMin6Digits => 'कम से कम 6 अंक दर्ज करें';

  @override
  String get binNotVerified => 'यह bin (BIN) सत्यापित नहीं किया जा सका';

  @override
  String get lookupFailed =>
      'लुकअप विफल रहा। अपना कनेक्शन जांचें और पुनः प्रयास करें।';

  @override
  String get binLookupPlaceholder => 'बिन / आईआईएन लुकअप';

  @override
  String get enterDigitsLabel => 'पहले 6-8 अंक दर्ज करें';

  @override
  String get checkButton => 'जांचें';

  @override
  String get binResultTitle => 'बिन परिणाम';

  @override
  String get cardNetwork => 'नेटवर्क';

  @override
  String get cardType => 'प्रकार';

  @override
  String get cardBrandCategory => 'ब्रांड/श्रेणी';

  @override
  String get cardBank => 'बैंक';

  @override
  String get cardCountry => 'देश';

  @override
  String get cardCountryCode => 'देश कोड';

  @override
  String get cardCurrency => 'मुद्रा';

  @override
  String get cardValid => 'वैध';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String get cardValidatorTitle => 'कार्ड वैलिडेटर';

  @override
  String get cardValidatorPreviewName => 'कार्ड वैलिडेटर';

  @override
  String get enterCardNumberLabel => 'कार्ड नंबर दर्ज करें';

  @override
  String get validCardNumber => 'वैध कार्ड नंबर';

  @override
  String get invalidCardNumber => 'अवैध कार्ड नंबर - अंकों की जांच करें';

  @override
  String get backupRestoreTitle => 'बैकअप और रीस्टोर';

  @override
  String get createBackupPass => 'बैकअप पासवर्ड बनाएं';

  @override
  String get backupPassWarning =>
      'महत्वपूर्ण: इस पासवर्ड को कहीं लिख लें। यदि आप इसे भूल जाते हैं तो हम इसे रिकवर नहीं कर सकते या आपके बैकअप को रीस्टोर नहीं कर सकते।';

  @override
  String get enterPassLabel => 'पासवर्ड दर्ज करें';

  @override
  String get confirmPassLabel => 'पासवर्ड की पुष्टि करें';

  @override
  String get passEmptyError => 'पासवर्ड खाली नहीं हो सकता';

  @override
  String get passMismatchError => 'पासवर्ड मेल नहीं खाते';

  @override
  String get doneBtn => 'पूर्ण';

  @override
  String get enterBackupPass => 'बैकअप पासवर्ड दर्ज करें';

  @override
  String get noCardsToBackup => 'बैकअप लेने के लिए कोई कार्ड नहीं है';

  @override
  String get backupSuccess => 'बैकअप सफलतापूर्वक बनाया गया!';

  @override
  String backupFailed(String error) {
    return 'बैकअप विफल रहा: $error';
  }

  @override
  String get restoreBackupTitle => 'बैकअप रीस्टोर करें?';

  @override
  String get restoreBackupWarning =>
      'चेतावनी: बैकअप रीस्टोर करने से सभी मौजूदा कार्ड और लेनदेन मिट जाएंगे। इसे वापस नहीं लाया जा सकता।';

  @override
  String get continueBtn => 'जारी रखें';

  @override
  String get restoreSuccess => 'बैकअप सफलतापूर्वक रीस्टोर किया गया!';

  @override
  String get incorrectPasswordError => 'गलत पासवर्ड या दूषित बैकअप फ़ाइल।';

  @override
  String restoreFailed(String error) {
    return 'रीस्टोर विफल रहा: $error';
  }

  @override
  String get deleteBackupTitle => 'बैकअप हटाएं?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'क्या आप \"$name\" को हटाना चाहते हैं? इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String get deleteBtn => 'हटाएं';

  @override
  String get backupDeleted => 'बैकअप हटा दिया गया';

  @override
  String failedShareBackup(String error) {
    return 'बैकअप साझा करने में विफल: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'फ़ाइल चुनने में विफल: $error';
  }

  @override
  String get lastBackup => 'आखिरी बैकअप';

  @override
  String get neverBackedUp => 'कभी बैकअप नहीं लिया गया';

  @override
  String get backupType => 'बैकअप का प्रकार';

  @override
  String get localBackupDesc => 'स्थानीय — केवल इस डिवाइस पर सुरक्षित';

  @override
  String get createBackupBtn => 'बैकअप बनाएं';

  @override
  String get importExternalBackupBtn => 'बाहरी बैकअप इम्पोर्ट करें';

  @override
  String get savedBackupsHeader => 'सहेजे गए बैकअप';

  @override
  String get noBackupsYet => 'अभी तक कोई बैकअप नहीं है';

  @override
  String get tapCreateBackupDesc =>
      'अपने कार्ड सुरक्षित करने के लिए \"बैकअप बनाएं\" पर टैप करें';

  @override
  String get restoreTooltip => 'रीस्टोर';

  @override
  String get shareTooltip => 'साझा करें';

  @override
  String get cardNotFound => 'कार्ड नहीं मिला';

  @override
  String get editCardTitle => 'कार्ड संपादित करें';

  @override
  String get addCardTitle => 'कार्ड जोड़ें';

  @override
  String get cardTypeLabel => 'कार्ड का प्रकार';

  @override
  String get cardColorLabel => 'कार्ड का रंग';

  @override
  String get fieldRequiredError => 'यह फ़ील्ड आवश्यक है';

  @override
  String get bankNameLabel => 'बैंक का नाम';

  @override
  String get expiryLabel => 'समाप्ति तिथि (MM/YY)';

  @override
  String get cvvLabel => 'सीवीवी (CVV)';

  @override
  String get cardPhotosLabel => 'कार्ड की तस्वीरें';

  @override
  String get frontSideLabel => 'सामने का भाग';

  @override
  String get backSideLabel => 'पीछे का भाग';

  @override
  String get notesLabel => 'टिप्पणियाँ';

  @override
  String get saveChangesBtn => 'बदलाव सहेजें';

  @override
  String get saveCardBtn => 'कार्ड सहेजें';

  @override
  String get deleteCardBtn => 'कार्ड हटाएं';

  @override
  String get takePhotoLabel => 'तस्वीर लें';

  @override
  String get chooseGalleryLabel => 'गैलरी से चुनें';

  @override
  String get deleteCardPrompt => 'कार्ड हटाएं?';

  @override
  String get deleteCardWarning => 'इस कार्रवाई को वापस नहीं लाया जा सकता।';

  @override
  String get cardNumberLabel => 'कार्ड नंबर';

  @override
  String get pointCardNumberLabel => 'प्वाइंट कार्ड नंबर';

  @override
  String get membershipIdLabel => 'सदस्यता आईडी';

  @override
  String get couponCodeLabel => 'कूपन कोड';

  @override
  String get giftCardNumberLabel => 'गिफ्ट कार्ड नंबर';

  @override
  String get ticketPnrLabel => 'टिकट / पीएनआर नंबर';

  @override
  String get numberLabel => 'नंबर';

  @override
  String get cardholderNameLabel => 'कार्डधारक का नाम';

  @override
  String get cardNameLabel => 'कार्ड का नाम';

  @override
  String get enterValidCardNumberError => 'एक वैध कार्ड नंबर दर्ज करें';

  @override
  String get cardNumberInvalidError => 'कार्ड नंबर अमान्य लग रहा है';

  @override
  String get enterMin3CharsError => 'कम से कम 3 वर्ण दर्ज करें';

  @override
  String get cardAlreadyExistsError =>
      'इस नंबर वाला कार्ड पहले से सहेजा गया है';

  @override
  String get revealCvv => 'सीवीवी (CVV) दिखाएं';

  @override
  String get cardDetailsHeader => 'कार्ड का विवरण:';

  @override
  String get typePrefix => 'प्रकार: ';

  @override
  String get bankPrefix => 'बैंक: ';

  @override
  String get cardNumberPrefix => 'कार्ड नंबर: ';

  @override
  String get cardholderPrefix => 'कार्डधारक: ';

  @override
  String get expiryPrefix => 'समाप्ति: ';

  @override
  String get notesPrefix => 'टिप्पणी: ';

  @override
  String get detailsSuffix => ' विवरण';

  @override
  String get cardDetailsTitle => 'कार्ड विवरण';

  @override
  String get hideBtn => 'छिपाएं';

  @override
  String get revealBtn => 'दिखाएं';

  @override
  String get editBtn => 'संपादित करें';

  @override
  String get cardInformationHeader => 'कार्ड की जानकारी';

  @override
  String get cardholderLabel => 'कार्डधारक';

  @override
  String get nameLabel => 'नाम';

  @override
  String get bankLabel => 'बैंक';

  @override
  String get pnrNumberLabel => 'पीएनआर नंबर';

  @override
  String get venueLabel => 'स्थान';

  @override
  String get eventDateLabel => 'घटना की तिथि';

  @override
  String get seatLabel => 'सीट';

  @override
  String get classLabel => 'श्रेणी';

  @override
  String get discountDetailsLabel => 'छूट का विवरण';

  @override
  String get memberIdLabel => 'सदस्यता आईडी';

  @override
  String get tierStatusLabel => 'टियर स्थिति';

  @override
  String get pointsBalanceLabel => 'अंक शेष';

  @override
  String get secondaryPinLabel => 'द्वितीयक पिन';

  @override
  String get issueDateLabel => 'जारी करने की तिथि';

  @override
  String get documentTitleLabel => 'दस्तावेज़ का शीर्षक';

  @override
  String get nfcReaderTitle => 'एनएफसी रीडर';

  @override
  String get nfcNotAvailable => 'एनएफसी उपलब्ध नहीं है';

  @override
  String get nfcUnsupportedDesc =>
      'यह डिवाइस एनएफसी कार्ड पढ़ने का समर्थन नहीं करता है।';

  @override
  String get readyToScan => 'स्कैन करने के लिए तैयार';

  @override
  String get holdCardNfcPrompt =>
      'अपने कॉन्टैक्टलेस कार्ड को अपने फोन के पीछे रखें।';

  @override
  String get scanFailed => 'स्कैन विफल रहा';

  @override
  String get somethingWentWrong => 'कुछ गलत हो गया।';

  @override
  String get tryAgainBtn => 'पुनः प्रयास करें';

  @override
  String get cardDetected => 'कार्ड का पता चला';

  @override
  String get unsupportedCardError => 'यह कार्ड प्रकार समर्थित नहीं है।';

  @override
  String get nfcReadFailedDesc =>
      'यह कार्ड नहीं पढ़ा जा सका। पुन: प्रयास करें या इसे मैन्युअल रूप से जोड़ें।';

  @override
  String nfcReadError(String error) {
    return 'पढ़ना विफल रहा: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'एनएफसी सत्र शुरू नहीं किया जा सका: $error';
  }

  @override
  String get scanCardTitle => 'कार्ड स्कैन करें';

  @override
  String get noCameraError => 'इस डिवाइस पर कोई कैमरा उपलब्ध नहीं है';

  @override
  String cameraStartError(String error) {
    return 'कैमरा शुरू नहीं किया जा सका: $error';
  }

  @override
  String get ocrReadError =>
      'कार्ड का विवरण नहीं पढ़ा जा सका। बेहतर रोशनी के साथ पुन: प्रयास करें।';

  @override
  String ocrScanFailed(String error) {
    return 'स्कैन विफल रहा: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'कार्ड स्कैन करने के लिए कैमरे की अनुमति आवश्यक है।';

  @override
  String get openSettingsBtn => 'सेटिंग्स खोलें';

  @override
  String get notDetected => 'पता नहीं चला';

  @override
  String get scanAgainBtn => 'फिर से स्कैन करें';

  @override
  String get cardPhotosDesc =>
      'त्वरित संदर्भ के लिए अपने कार्ड का फोटो रखें। छवियां इसी डिवाइस पर रहेंगी।';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label फोटो जोड़ें';
  }

  @override
  String get premiumTitle => 'प्रीमियम';

  @override
  String get benefitRemoveAdsTitle => 'सभी विज्ञापन हटाएं';

  @override
  String get benefitRemoveAdsDesc => 'कभी कोई बैनर या विज्ञापन नहीं';

  @override
  String get benefitFasterTitle => 'तेज़ अनुभव';

  @override
  String get benefitFasterDesc => 'बिना लोड हुए तुरंत खुलने वाली स्क्रीन';

  @override
  String get benefitSupportTitle => 'विकास का समर्थन करें';

  @override
  String get benefitSupportDesc => 'ऐप को लगातार बेहतर बनाने में मदद करें';

  @override
  String get benefitBadgeTitle => 'प्रीमियम बैज';

  @override
  String get benefitBadgeDesc => 'आपके प्रोफ़ाइल पर एक छोटा सा धन्यवाद बैज';

  @override
  String get premiumHeroActive => 'आप प्रीमियम हैं';

  @override
  String get premiumHeroInactive => 'विज्ञापन-मुक्त अनुभव पाएं';

  @override
  String get premiumHeroDescActive =>
      'कार्ड वॉलेट का समर्थन करने के लिए धन्यवाद';

  @override
  String get premiumHeroDescInactive => 'विज्ञापन हटाएं और एक बेहतर अनुभव पाएं';

  @override
  String get disablePremiumBtn => 'प्रीमियम निष्क्रिय करें';

  @override
  String get removeAdsBtn => 'विज्ञापन हटाएं';

  @override
  String get premiumOneTimeNotice =>
      'एक बार भुगतान। इस डिवाइस पर तुरंत लागू होगा।';

  @override
  String get noBiometricsConfigured =>
      'इस डिवाइस पर कोई बायोमेट्रिक्स/डिवाइस लॉक कॉन्फ़िगर नहीं किया गया है';

  @override
  String get cardTypeCredit => 'क्रेडिट कार्ड';

  @override
  String get cardTypeDebit => 'डेबिट कार्ड';

  @override
  String get cardTypePoint => 'पॉइंट कार्ड';

  @override
  String get cardTypeMembership => 'सदस्यता कार्ड';

  @override
  String get cardTypeCoupon => 'कूपन';

  @override
  String get cardTypeGift => 'गिफ्ट कार्ड';

  @override
  String get cardTypeEventTicket => 'इवेंट टिकट';

  @override
  String get cardTypeOther => 'अन्य';

  @override
  String get chooseCardType => 'कार्ड का प्रकार चुनें';

  @override
  String get selectCustomColor => 'कस्टम रंग चुनें';

  @override
  String get solidColor => 'ठोस';

  @override
  String get gradientColor => 'ग्रेडिएंट';

  @override
  String get startColor => 'प्रारंभ';

  @override
  String get endColor => 'अंत';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'होम';

  @override
  String get cardsTab => 'मेरे कार्ड';

  @override
  String get profileTab => 'प्रोफ़ाइल';

  @override
  String get appTitleTypewriter => 'कार्ड वॉलेट';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String get backupShareText => 'कार्ड वॉलेट सुरक्षित बैकअप';

  @override
  String get backupFileNotFoundError => 'बैकअप फ़ाइल नहीं मिली';

  @override
  String get corruptedBackupError => 'दूषित या अमान्य बैकअप फ़ाइल';

  @override
  String get invalidBackupDataError => 'बैकअप फ़ाइल में वैध डेटा नहीं है';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'असमर्थित बैकअप संस्करण: $version';
  }
}
