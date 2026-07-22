// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Card Wallet App';

  @override
  String get addCard => 'Magdagdag ng Card';

  @override
  String get hiThere => 'Kumusta, ayan 👋';

  @override
  String get settingsTitle => 'Mga setting';

  @override
  String get appLock => 'Lock ng App';

  @override
  String get appLockSubtitle =>
      'Mangangailangan ng biometrics upang mabuksan ang app';

  @override
  String get language => 'Wika';

  @override
  String get backupRestore => 'I-backup at I-restore';

  @override
  String get backupRestoreSubtitle =>
      'I-export at i-import ang iyong mga card nang lokal';

  @override
  String get clearAllData => 'I-clear ang Lahat ng Data';

  @override
  String get goodMorning => 'Magandang umaga po';

  @override
  String get goodAfternoon => 'Magandang hapon po';

  @override
  String get goodEvening => 'Magandang gabi po';

  @override
  String hiName(String name) {
    return 'Kumusta, $name 👋';
  }

  @override
  String get addNewCard => 'Magdagdag ng Bagong Card';

  @override
  String get scan => 'I-scan';

  @override
  String get scanDesc => 'I-scan ang mga detalye ng card\nkaagad';

  @override
  String get manually => 'Manu-manong';

  @override
  String get manuallyDesc => 'Ipasok ang mga detalye ng card\nmano-mano';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'I-tap ang card para idagdag\ngamit ang NFC';

  @override
  String get tools => 'Mga gamit';

  @override
  String get binChecker => 'Tagasuri ng BIN';

  @override
  String get binCheckerDesc => 'Suriin ang mga detalye ng card mula sa BIN';

  @override
  String get cardVerify => 'Pagpapatunay ng Card';

  @override
  String get cardVerifyDesc => 'Patunayan ang isang numero ng card';

  @override
  String get frequentlyAdded => 'Madalas Idinagdag';

  @override
  String get cardsTitle => 'Mga kard';

  @override
  String get yourCardsManage => 'Ang iyong mga card dito upang pamahalaan';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Na-save ang $count card',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count card',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Lahat';

  @override
  String get noCardsYet => 'Wala pang card';

  @override
  String get noCardsYetDesc =>
      'Pumunta sa Home o i-tap ang scanner para magdagdag ng card';

  @override
  String get noCardsCategory => 'Walang mga card sa kategoryang ito';

  @override
  String get tryDifferentFilter => 'Subukang pumili ng ibang filter';

  @override
  String get addFirstCardStart =>
      'Idagdag ang iyong unang card upang makapagsimula';

  @override
  String get rateUs => 'I-rate Kami';

  @override
  String get rateUsThanks => 'Salamat sa suporta!';

  @override
  String get shareApp => 'Ibahagi ang App';

  @override
  String get shareAppSoon => 'Malapit nang magbahagi';

  @override
  String get help => 'Tulong';

  @override
  String get supportSoon => 'Paparating na ang suporta';

  @override
  String get privacyPolicy => 'Patakaran sa Privacy';

  @override
  String get privacyPolicySoon => 'Binubuksan ang patakaran sa privacy';

  @override
  String get termsOfUse => 'Mga Tuntunin sa Paggamit';

  @override
  String get termsOfUseSoon => 'Binubuksan ang mga tuntunin ng paggamit';

  @override
  String get clearDataTitle => 'I-clear ang lahat ng data?';

  @override
  String get clearDataDesc =>
      'Permanente nitong tinatanggal ang bawat naka-save na card. Hindi na ito maaaring bawiin.';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get clearDataConfirm => 'I-clear ang Data';

  @override
  String get clearDataToast => 'Na-clear ang lahat ng data';

  @override
  String get splashSubtitle => 'Ang iyong mga card, ligtas at simple';

  @override
  String get unlockPrompt => 'I-unlock ang Card Wallet upang magpatuloy';

  @override
  String get tapToUnlock => 'I-tap para I-unlock';

  @override
  String get authFailed => 'Nabigo ang pagpapatotoo';

  @override
  String get binCheckerTitle => 'BIN Checker';

  @override
  String get enterMin6Digits => 'Maglagay ng hindi bababa sa 6 na digit';

  @override
  String get binNotVerified => 'Hindi ma-verify ang BIN na ito';

  @override
  String get lookupFailed =>
      'Nabigo ang paghahanap. Suriin ang iyong koneksyon at subukang muli.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN LOOKUP';

  @override
  String get enterDigitsLabel => 'Ipasok ang unang 6–8 digit';

  @override
  String get checkButton => 'Suriin';

  @override
  String get binResultTitle => 'Resulta ng BIN';

  @override
  String get cardNetwork => 'Network';

  @override
  String get cardType => 'Uri';

  @override
  String get cardBrandCategory => 'Brand/Kategorya';

  @override
  String get cardBank => 'Bangko';

  @override
  String get cardCountry => 'Bansa';

  @override
  String get cardCountryCode => 'Code ng Bansa';

  @override
  String get cardCurrency => 'Pera';

  @override
  String get cardValid => 'Wasto';

  @override
  String get yes => 'Oo';

  @override
  String get no => 'Hindi';

  @override
  String get cardValidatorTitle => 'Validator ng Card';

  @override
  String get cardValidatorPreviewName => 'CARD VALIDATOR';

  @override
  String get enterCardNumberLabel => 'Ipasok ang numero ng card';

  @override
  String get validCardNumber => 'Wastong numero ng card';

  @override
  String get invalidCardNumber =>
      'Di-wastong numero ng card — tingnan ang mga digit';

  @override
  String get backupRestoreTitle => 'I-backup at I-restore';

  @override
  String get createBackupPass => 'Lumikha ng Backup Password';

  @override
  String get backupPassWarning =>
      'MAHALAGA: Isulat ang password na ito. Hindi namin ito mababawi o maibabalik ang iyong backup kung nakalimutan mo ito.';

  @override
  String get enterPassLabel => 'Ipasok ang Password';

  @override
  String get confirmPassLabel => 'Kumpirmahin ang Password';

  @override
  String get passEmptyError => 'Hindi maaaring walang laman ang password';

  @override
  String get passMismatchError => 'Hindi tugma ang mga password';

  @override
  String get doneBtn => 'Tapos na';

  @override
  String get enterBackupPass => 'Ipasok ang Backup Password';

  @override
  String get noCardsToBackup => 'Walang mga card na i-backup';

  @override
  String get backupSuccess => 'Matagumpay na nagawa ang backup!';

  @override
  String backupFailed(String error) {
    return 'Nabigo ang pag-backup: $error';
  }

  @override
  String get restoreBackupTitle => 'Ibalik ang backup?';

  @override
  String get restoreBackupWarning =>
      'BABALA: Ang pagpapanumbalik ng backup ay o-overwrite ang lahat ng kasalukuyang card at transaksyon. Hindi na ito maaaring bawiin.';

  @override
  String get continueBtn => 'Magpatuloy';

  @override
  String get restoreSuccess => 'Matagumpay na naibalik ang backup!';

  @override
  String get incorrectPasswordError => 'Maling password o sirang backup file.';

  @override
  String restoreFailed(String error) {
    return 'Nabigo ang pag-restore: $error';
  }

  @override
  String get deleteBackupTitle => 'Tanggalin ang backup?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Tanggalin ang \"$name\"? Hindi na ito maaaring bawiin.';
  }

  @override
  String get deleteBtn => 'Tanggalin';

  @override
  String get backupDeleted => 'Tinanggal ang backup';

  @override
  String failedShareBackup(String error) {
    return 'Nabigong ibahagi ang backup: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Nabigong pumili ng file: $error';
  }

  @override
  String get lastBackup => 'Huling Backup';

  @override
  String get neverBackedUp => 'Hindi kailanman nag-back up';

  @override
  String get backupType => 'Uri ng Backup';

  @override
  String get localBackupDesc => 'Lokal — naka-save sa device na ito lamang';

  @override
  String get createBackupBtn => 'Gumawa ng Backup';

  @override
  String get importExternalBackupBtn => 'Mag-import ng Panlabas na Backup';

  @override
  String get savedBackupsHeader => 'Mga Naka-save na Backup';

  @override
  String get noBackupsYet => 'Wala pang backup';

  @override
  String get tapCreateBackupDesc =>
      'I-tap ang \"Gumawa ng Backup\" para i-save ang iyong mga card';

  @override
  String get restoreTooltip => 'Ibalik';

  @override
  String get shareTooltip => 'Ibahagi';

  @override
  String get cardNotFound => 'Hindi nakita ang card';

  @override
  String get editCardTitle => 'I-edit ang Card';

  @override
  String get addCardTitle => 'Magdagdag ng Card';

  @override
  String get cardTypeLabel => 'Uri ng card';

  @override
  String get cardColorLabel => 'Kulay ng card';

  @override
  String get fieldRequiredError => 'Kinakailangan ang field na ito';

  @override
  String get bankNameLabel => 'Pangalan ng Bangko';

  @override
  String get expiryLabel => 'Expiry (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Mga Larawan sa Card';

  @override
  String get frontSideLabel => 'Front Side';

  @override
  String get backSideLabel => 'Likod na Gilid';

  @override
  String get notesLabel => 'Mga Tala';

  @override
  String get saveChangesBtn => 'I-save ang Mga Pagbabago';

  @override
  String get saveCardBtn => 'I-save ang Card';

  @override
  String get deleteCardBtn => 'Tanggalin ang card';

  @override
  String get takePhotoLabel => 'Kumuha ng litrato';

  @override
  String get chooseGalleryLabel => 'Pumili mula sa gallery';

  @override
  String get deleteCardPrompt => 'Tanggalin ang card?';

  @override
  String get deleteCardWarning =>
      'Ang pagkilos na ito ay hindi maaaring i-undo.';

  @override
  String get cardNumberLabel => 'Numero ng Card';

  @override
  String get pointCardNumberLabel => 'Numero ng Point Card';

  @override
  String get membershipIdLabel => 'Membership ID';

  @override
  String get couponCodeLabel => 'Code ng Kupon';

  @override
  String get giftCardNumberLabel => 'Numero ng Gift Card';

  @override
  String get ticketPnrLabel => 'Numero ng Ticket / PNR';

  @override
  String get numberLabel => 'Numero';

  @override
  String get cardholderNameLabel => 'Pangalan ng Cardholder';

  @override
  String get cardNameLabel => 'Pangalan ng Card';

  @override
  String get enterValidCardNumberError => 'Maglagay ng wastong numero ng card';

  @override
  String get cardNumberInvalidError => 'Mukhang di-wasto ang numero ng card';

  @override
  String get enterMin3CharsError => 'Maglagay ng hindi bababa sa 3 character';

  @override
  String get cardAlreadyExistsError =>
      'Naka-save na ang card na may ganitong numero';

  @override
  String get revealCvv => 'Ibunyag ang CVV';

  @override
  String get cardDetailsHeader => 'Mga Detalye ng Card:';

  @override
  String get typePrefix => 'Uri:';

  @override
  String get bankPrefix => 'Bangko:';

  @override
  String get cardNumberPrefix => 'Numero ng Card:';

  @override
  String get cardholderPrefix => 'Cardholder:';

  @override
  String get expiryPrefix => 'Expiry:';

  @override
  String get notesPrefix => 'Mga Tala:';

  @override
  String get detailsSuffix => 'Mga Detalye';

  @override
  String get cardDetailsTitle => 'Mga Detalye ng Card';

  @override
  String get hideBtn => 'Magtago';

  @override
  String get revealBtn => 'Ibunyag';

  @override
  String get editBtn => 'I-edit';

  @override
  String get cardInformationHeader => 'Impormasyon sa Card';

  @override
  String get cardholderLabel => 'Cardholder';

  @override
  String get nameLabel => 'Pangalan';

  @override
  String get bankLabel => 'Bangko';

  @override
  String get pnrNumberLabel => 'Numero ng PNR';

  @override
  String get venueLabel => 'Venue';

  @override
  String get eventDateLabel => 'Petsa ng Kaganapan';

  @override
  String get seatLabel => 'upuan';

  @override
  String get classLabel => 'Klase';

  @override
  String get discountDetailsLabel => 'Mga Detalye ng Diskwento';

  @override
  String get memberIdLabel => 'ID ng Miyembro';

  @override
  String get tierStatusLabel => 'Katayuan ng Tier';

  @override
  String get pointsBalanceLabel => 'Balanse ng mga Puntos';

  @override
  String get secondaryPinLabel => 'Pangalawang PIN';

  @override
  String get issueDateLabel => 'Petsa ng Isyu';

  @override
  String get documentTitleLabel => 'Pamagat ng Dokumento';

  @override
  String get nfcReaderTitle => 'NFC Reader';

  @override
  String get nfcNotAvailable => 'Hindi available ang NFC';

  @override
  String get nfcUnsupportedDesc =>
      'Hindi sinusuportahan ng device na ito ang pagbabasa ng NFC card.';

  @override
  String get readyToScan => 'Handa nang I-scan';

  @override
  String get holdCardNfcPrompt =>
      'Hawakan ang iyong contactless card sa likod ng iyong telepono.';

  @override
  String get scanFailed => 'Nabigo ang pag-scan';

  @override
  String get somethingWentWrong => 'Nagkaproblema.';

  @override
  String get tryAgainBtn => 'Subukan Muli';

  @override
  String get cardDetected => 'Natukoy ang Card';

  @override
  String get unsupportedCardError =>
      'Ang uri ng card na ito ay hindi suportado.';

  @override
  String get nfcReadFailedDesc =>
      'Hindi mabasa ang card na ito. Subukang muli o idagdag ito nang manu-mano.';

  @override
  String nfcReadError(String error) {
    return 'Nabigo ang pagbabasa: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Hindi masimulan ang NFC session: $error';
  }

  @override
  String get scanCardTitle => 'Scan Card';

  @override
  String get noCameraError => 'Walang available na camera sa device na ito';

  @override
  String cameraStartError(String error) {
    return 'Hindi masimulan ang camera: $error';
  }

  @override
  String get ocrReadError =>
      'Hindi mabasa ang mga detalye ng card. Subukang muli gamit ang mas mahusay na pag-iilaw.';

  @override
  String ocrScanFailed(String error) {
    return 'Nabigo ang pag-scan: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Kinakailangan ang pahintulot ng camera para mag-scan ng card.';

  @override
  String get openSettingsBtn => 'Buksan ang Mga Setting';

  @override
  String get notDetected => 'Hindi natukoy';

  @override
  String get scanAgainBtn => 'I-scan muli';

  @override
  String get cardPhotosDesc =>
      'Panatilihin ang isang larawan ng iyong card para sa mabilis na sanggunian. Nananatili ang mga larawan sa device na ito.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Magdagdag ng $label na larawan';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get benefitRemoveAdsTitle => 'Alisin ang lahat ng ad';

  @override
  String get benefitRemoveAdsDesc =>
      'Walang mga banner, walang mga interstitial, kailanman';

  @override
  String get benefitFasterTitle => 'Mas mabilis na karanasan';

  @override
  String get benefitFasterDesc => 'Mga instant na screen na walang mai-load';

  @override
  String get benefitSupportTitle => 'Suportahan ang pag-unlad';

  @override
  String get benefitSupportDesc => 'Tumulong na panatilihing lumago ang app';

  @override
  String get benefitBadgeTitle => 'Premium badge';

  @override
  String get benefitBadgeDesc => 'Isang maliit na pasasalamat sa iyong profile';

  @override
  String get premiumHeroActive => 'Premium ka';

  @override
  String get premiumHeroInactive => 'Maging Ad-Free';

  @override
  String get premiumHeroDescActive => 'Salamat sa pagsuporta sa Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Alisin ang mga ad at mag-unlock ng mas malinis na karanasan';

  @override
  String get disablePremiumBtn => 'Huwag paganahin ang Premium';

  @override
  String get removeAdsBtn => 'Alisin ang Mga Ad';

  @override
  String get premiumOneTimeNotice =>
      'Isang beses. Agad na nagre-restore sa device na ito.';

  @override
  String get noBiometricsConfigured =>
      'Walang biometrics/device lock na naka-configure sa device na ito';

  @override
  String get cardTypeCredit => 'Credit Card';

  @override
  String get cardTypeDebit => 'Debit Card';

  @override
  String get cardTypePoint => 'Point Card';

  @override
  String get cardTypeMembership => 'Membership Card';

  @override
  String get cardTypeCoupon => 'Kupon';

  @override
  String get cardTypeGift => 'Gift Card';

  @override
  String get cardTypeEventTicket => 'Ticket ng Kaganapan';

  @override
  String get cardTypeOther => 'Iba pa';

  @override
  String get chooseCardType => 'Pumili ng uri ng card';

  @override
  String get selectCustomColor => 'Piliin ang Custom na Kulay';

  @override
  String get solidColor => 'Solid';

  @override
  String get gradientColor => 'Gradient';

  @override
  String get startColor => 'Magsimula';

  @override
  String get endColor => 'Tapusin';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Bahay';

  @override
  String get cardsTab => 'Aking Mga Kard';

  @override
  String get profileTab => 'Profile';

  @override
  String get appTitleTypewriter => 'Card Wallet';

  @override
  String get seeAll => 'Tingnan Lahat';

  @override
  String get backupShareText => 'Card Wallet Secure Backup';

  @override
  String get backupFileNotFoundError => 'Hindi nahanap ang backup na file';

  @override
  String get corruptedBackupError => 'Sirang o di-wastong backup na file';

  @override
  String get invalidBackupDataError =>
      'Ang backup na file ay hindi naglalaman ng wastong data.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Hindi sinusuportahang backup na bersyon: $version';
  }
}
