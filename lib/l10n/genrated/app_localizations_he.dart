// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'אפליקציית ארנק כרטיסים';

  @override
  String get addCard => 'הוסף כרטיס';

  @override
  String get hiThere => 'היי, שם 👋';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get appLock => 'נעילת אפליקציה';

  @override
  String get appLockSubtitle => 'דרוש ביומטריה כדי לפתוח את האפליקציה';

  @override
  String get language => 'שָׂפָה';

  @override
  String get backupRestore => 'גיבוי ושחזור';

  @override
  String get backupRestoreSubtitle => 'ייצא וייבא את הכרטיסים שלך באופן מקומי';

  @override
  String get clearAllData => 'נקה את כל הנתונים';

  @override
  String get goodMorning => 'בוקר טוב';

  @override
  String get goodAfternoon => 'צהריים טובים';

  @override
  String get goodEvening => 'ערב טוב';

  @override
  String hiName(String name) {
    return 'היי, $name 👋';
  }

  @override
  String get addNewCard => 'הוסף כרטיס חדש';

  @override
  String get scan => 'לִסְרוֹק';

  @override
  String get scanDesc => 'סרוק את פרטי הכרטיס\nבאופן מיידי';

  @override
  String get manually => 'באופן ידני';

  @override
  String get manuallyDesc => 'הזן פרטי כרטיס\nבאופן ידני';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'הקש על כרטיס כדי להוסיף\nבאמצעות NFC';

  @override
  String get tools => 'כְּלֵי עֲבוֹדָה';

  @override
  String get binChecker => 'בודק BIN';

  @override
  String get binCheckerDesc => 'בדוק את פרטי הכרטיס מ-BIN';

  @override
  String get cardVerify => 'אימות כרטיס';

  @override
  String get cardVerifyDesc => 'אימות מספר כרטיס';

  @override
  String get frequentlyAdded => 'נוסף לעתים קרובות';

  @override
  String get cardsTitle => 'קלפים';

  @override
  String get yourCardsManage => 'הקלפים שלך כאן כדי לנהל';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'כרטיסי $count נשמרו',
      one: 'כרטיס אחד נשמר',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'כרטיסי $count',
      one: 'כרטיס אחד',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'כֹּל';

  @override
  String get noCardsYet => 'עדיין אין כרטיסים';

  @override
  String get noCardsYetDesc => 'עבור אל בית או הקש על סורק כדי להוסיף כרטיס';

  @override
  String get noCardsCategory => 'אין כרטיסים בקטגוריה זו';

  @override
  String get tryDifferentFilter => 'נסה לבחור מסנן אחר';

  @override
  String get addFirstCardStart => 'הוסף את הכרטיס הראשון שלך כדי להתחיל';

  @override
  String get rateUs => 'דרג אותנו';

  @override
  String get rateUsThanks => 'תודה על התמיכה!';

  @override
  String get shareApp => 'שתף אפליקציה';

  @override
  String get shareAppSoon => 'שיתוף בקרוב';

  @override
  String get help => 'עֶזרָה';

  @override
  String get supportSoon => 'תמיכה בקרוב';

  @override
  String get privacyPolicy => 'מדיניות פרטיות';

  @override
  String get privacyPolicySoon => 'פותח את מדיניות הפרטיות';

  @override
  String get termsOfUse => 'תנאי שימוש';

  @override
  String get termsOfUseSoon => 'פותח את תנאי השימוש';

  @override
  String get clearDataTitle => 'לנקות את כל הנתונים?';

  @override
  String get clearDataDesc =>
      'פעולה זו מוחקת לצמיתות כל כרטיס שמור. לא ניתן לבטל זאת.';

  @override
  String get cancel => 'לְבַטֵל';

  @override
  String get clearDataConfirm => 'נקה נתונים';

  @override
  String get clearDataToast => 'כל הנתונים נוקו';

  @override
  String get splashSubtitle => 'הכרטיסים שלך, בטוחים ופשוטים';

  @override
  String get unlockPrompt => 'בטל את נעילת ארנק הכרטיס כדי להמשיך';

  @override
  String get tapToUnlock => 'הקש כדי לבטל את הנעילה';

  @override
  String get authFailed => 'האימות נכשל';

  @override
  String get binCheckerTitle => 'בודק BIN';

  @override
  String get enterMin6Digits => 'הזן לפחות 6 ספרות';

  @override
  String get binNotVerified => 'לא ניתן היה לאמת את ה-BIN הזה';

  @override
  String get lookupFailed => 'חיפוש נכשל. בדוק את החיבור שלך ונסה שוב.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN חיפוש';

  @override
  String get enterDigitsLabel => 'הזן את 6-8 הספרות הראשונות';

  @override
  String get checkButton => 'לִבדוֹק';

  @override
  String get binResultTitle => 'תוצאת BIN';

  @override
  String get cardNetwork => 'רֶשֶׁת';

  @override
  String get cardType => 'סוּג';

  @override
  String get cardBrandCategory => 'מותג/קטגוריה';

  @override
  String get cardBank => 'בַּנק';

  @override
  String get cardCountry => 'מְדִינָה';

  @override
  String get cardCountryCode => 'קוד מדינה';

  @override
  String get cardCurrency => 'מַטְבֵּעַ';

  @override
  String get cardValid => 'תָקֵף';

  @override
  String get yes => 'כֵּן';

  @override
  String get no => 'לֹא';

  @override
  String get cardValidatorTitle => 'מאמת כרטיסים';

  @override
  String get cardValidatorPreviewName => 'תוקף כרטיס';

  @override
  String get enterCardNumberLabel => 'הזן מספר כרטיס';

  @override
  String get validCardNumber => 'מספר כרטיס תקף';

  @override
  String get invalidCardNumber => 'מספר כרטיס לא חוקי - בדוק את הספרות';

  @override
  String get backupRestoreTitle => 'גיבוי ושחזור';

  @override
  String get createBackupPass => 'צור סיסמת גיבוי';

  @override
  String get backupPassWarning =>
      'חשוב: רשום את הסיסמה הזו. לא נוכל לשחזר אותו או לשחזר את הגיבוי שלך אם תשכח אותו.';

  @override
  String get enterPassLabel => 'הזן סיסמה';

  @override
  String get confirmPassLabel => 'אשר את הסיסמה';

  @override
  String get passEmptyError => 'הסיסמה לא יכולה להיות ריקה';

  @override
  String get passMismatchError => 'הסיסמאות אינן תואמות';

  @override
  String get doneBtn => 'נַעֲשָׂה';

  @override
  String get enterBackupPass => 'הזן סיסמת גיבוי';

  @override
  String get noCardsToBackup => 'אין כרטיסים לגיבוי';

  @override
  String get backupSuccess => 'הגיבוי נוצר בהצלחה!';

  @override
  String backupFailed(String error) {
    return 'הגיבוי נכשל: $error';
  }

  @override
  String get restoreBackupTitle => 'לשחזר גיבוי?';

  @override
  String get restoreBackupWarning =>
      'אזהרה: שחזור גיבוי יחליף את כל הכרטיסים והעסקאות הנוכחיות. לא ניתן לבטל זאת.';

  @override
  String get continueBtn => 'לְהַמשִׁיך';

  @override
  String get restoreSuccess => 'הגיבוי שוחזר בהצלחה!';

  @override
  String get incorrectPasswordError => 'סיסמה שגויה או קובץ גיבוי פגום.';

  @override
  String restoreFailed(String error) {
    return 'השחזור נכשל: $error';
  }

  @override
  String get deleteBackupTitle => 'למחוק גיבוי?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'למחוק את \"$name\"? לא ניתן לבטל זאת.';
  }

  @override
  String get deleteBtn => 'לִמְחוֹק';

  @override
  String get backupDeleted => 'הגיבוי נמחק';

  @override
  String failedShareBackup(String error) {
    return 'שיתוף הגיבוי נכשל: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'בחירת הקובץ נכשלה: $error';
  }

  @override
  String get lastBackup => 'גיבוי אחרון';

  @override
  String get neverBackedUp => 'מעולם לא גיבוי';

  @override
  String get backupType => 'סוג גיבוי';

  @override
  String get localBackupDesc => 'מקומי - נשמר במכשיר זה בלבד';

  @override
  String get createBackupBtn => 'צור גיבוי';

  @override
  String get importExternalBackupBtn => 'ייבוא ​​גיבוי חיצוני';

  @override
  String get savedBackupsHeader => 'גיבויים שמורים';

  @override
  String get noBackupsYet => 'עדיין אין גיבויים';

  @override
  String get tapCreateBackupDesc =>
      'הקש על \"צור גיבוי\" כדי לשמור את הכרטיסים שלך';

  @override
  String get restoreTooltip => 'לְשַׁחְזֵר';

  @override
  String get shareTooltip => 'לַחֲלוֹק';

  @override
  String get cardNotFound => 'הכרטיס לא נמצא';

  @override
  String get editCardTitle => 'ערוך כרטיס';

  @override
  String get addCardTitle => 'הוסף כרטיס';

  @override
  String get cardTypeLabel => 'סוג כרטיס';

  @override
  String get cardColorLabel => 'צבע כרטיס';

  @override
  String get fieldRequiredError => 'שדה זה חובה';

  @override
  String get bankNameLabel => 'שם הבנק';

  @override
  String get expiryLabel => 'תפוגה (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'תמונות כרטיסים';

  @override
  String get frontSideLabel => 'צד קדמי';

  @override
  String get backSideLabel => 'צד אחורי';

  @override
  String get notesLabel => 'הערות';

  @override
  String get saveChangesBtn => 'שמור שינויים';

  @override
  String get saveCardBtn => 'שמור כרטיס';

  @override
  String get deleteCardBtn => 'מחק כרטיס';

  @override
  String get takePhotoLabel => 'צלם תמונה';

  @override
  String get chooseGalleryLabel => 'בחר מתוך הגלריה';

  @override
  String get deleteCardPrompt => 'למחוק כרטיס?';

  @override
  String get deleteCardWarning => 'לא ניתן לבטל פעולה זו.';

  @override
  String get cardNumberLabel => 'מספר כרטיס';

  @override
  String get pointCardNumberLabel => 'מספר כרטיס נקודה';

  @override
  String get membershipIdLabel => 'מזהה חברות';

  @override
  String get couponCodeLabel => 'קוד קופון';

  @override
  String get giftCardNumberLabel => 'מספר כרטיס מתנה';

  @override
  String get ticketPnrLabel => 'מספר כרטיס / PNR';

  @override
  String get numberLabel => 'מִספָּר';

  @override
  String get cardholderNameLabel => 'שם בעל הכרטיס';

  @override
  String get cardNameLabel => 'שם הכרטיס';

  @override
  String get enterValidCardNumberError => 'הזן מספר כרטיס תקף';

  @override
  String get cardNumberInvalidError => 'מספר הכרטיס נראה לא חוקי';

  @override
  String get enterMin3CharsError => 'הזן לפחות 3 תווים';

  @override
  String get cardAlreadyExistsError => 'כרטיס עם מספר זה כבר שמור';

  @override
  String get revealCvv => 'חשוף CVV';

  @override
  String get cardDetailsHeader => 'פרטי כרטיס:';

  @override
  String get typePrefix => 'סוּג:';

  @override
  String get bankPrefix => 'בַּנק:';

  @override
  String get cardNumberPrefix => 'מספר כרטיס:';

  @override
  String get cardholderPrefix => 'בעל כרטיס:';

  @override
  String get expiryPrefix => 'תְפוּגָה:';

  @override
  String get notesPrefix => 'הערות:';

  @override
  String get detailsSuffix => 'פרטים';

  @override
  String get cardDetailsTitle => 'פרטי כרטיס';

  @override
  String get hideBtn => 'לְהַסתִיר';

  @override
  String get revealBtn => 'לְגַלוֹת';

  @override
  String get editBtn => 'לַעֲרוֹך';

  @override
  String get cardInformationHeader => 'מידע על כרטיס';

  @override
  String get cardholderLabel => 'בעל כרטיס';

  @override
  String get nameLabel => 'שֵׁם';

  @override
  String get bankLabel => 'בַּנק';

  @override
  String get pnrNumberLabel => 'מספר PNR';

  @override
  String get venueLabel => 'מָקוֹם מִפגָשׁ';

  @override
  String get eventDateLabel => 'Event Date';

  @override
  String get seatLabel => 'מוֹשָׁב';

  @override
  String get classLabel => 'מַחלָקָה';

  @override
  String get discountDetailsLabel => 'פרטי הנחה';

  @override
  String get memberIdLabel => 'מזהה חבר';

  @override
  String get tierStatusLabel => 'סטטוס שכבה';

  @override
  String get pointsBalanceLabel => 'מאזן נקודות';

  @override
  String get secondaryPinLabel => 'PIN משני';

  @override
  String get issueDateLabel => 'תאריך הנפקה';

  @override
  String get documentTitleLabel => 'כותרת המסמך';

  @override
  String get nfcReaderTitle => 'קורא NFC';

  @override
  String get nfcNotAvailable => 'NFC לא זמין';

  @override
  String get nfcUnsupportedDesc => 'מכשיר זה אינו תומך בקריאת כרטיסי NFC.';

  @override
  String get readyToScan => 'מוכן לסריקה';

  @override
  String get holdCardNfcPrompt => 'החזק את הכרטיס ללא מגע לגב הטלפון.';

  @override
  String get scanFailed => 'הסריקה נכשלה';

  @override
  String get somethingWentWrong => 'משהו השתבש.';

  @override
  String get tryAgainBtn => 'נסה שוב';

  @override
  String get cardDetected => 'כרטיס זוהה';

  @override
  String get unsupportedCardError => 'סוג כרטיס זה אינו נתמך.';

  @override
  String get nfcReadFailedDesc =>
      'לא ניתן היה לקרוא את הכרטיס הזה. נסה שוב או הוסף אותו באופן ידני.';

  @override
  String nfcReadError(String error) {
    return 'הקריאה נכשלה: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'לא ניתן היה להתחיל הפעלת NFC: $error';
  }

  @override
  String get scanCardTitle => 'סרוק כרטיס';

  @override
  String get noCameraError => 'אין מצלמה זמינה במכשיר זה';

  @override
  String cameraStartError(String error) {
    return 'לא ניתן להפעיל את המצלמה: $error';
  }

  @override
  String get ocrReadError =>
      'לא ניתן היה לקרוא את פרטי הכרטיס. נסה שוב עם תאורה טובה יותר.';

  @override
  String ocrScanFailed(String error) {
    return 'הסריקה נכשלה: $error';
  }

  @override
  String get cameraPermissionDesc => 'נדרשת הרשאת מצלמה כדי לסרוק כרטיס.';

  @override
  String get openSettingsBtn => 'פתח את ההגדרות';

  @override
  String get notDetected => 'לא זוהה';

  @override
  String get scanAgainBtn => 'סרוק שוב';

  @override
  String get cardPhotosDesc =>
      'שמור תמונה של הכרטיס שלך לעיון מהיר. התמונות נשארות במכשיר הזה.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'הוסף תמונה של $label';
  }

  @override
  String get premiumTitle => 'פּרֶמיָה';

  @override
  String get benefitRemoveAdsTitle => 'הסר את כל המודעות';

  @override
  String get benefitRemoveAdsDesc => 'בלי באנרים, בלי מודעות ביניים, אף פעם';

  @override
  String get benefitFasterTitle => 'חוויה מהירה יותר';

  @override
  String get benefitFasterDesc => 'מסכים מיידיים ללא מה לטעון';

  @override
  String get benefitSupportTitle => 'תמיכה בפיתוח';

  @override
  String get benefitSupportDesc => 'עזור לשמור על צמיחה של האפליקציה';

  @override
  String get benefitBadgeTitle => 'תג פרימיום';

  @override
  String get benefitBadgeDesc => 'תודה קטנה בפרופיל שלך';

  @override
  String get premiumHeroActive => 'אתה פרימיום';

  @override
  String get premiumHeroInactive => 'עבור ללא פרסומות';

  @override
  String get premiumHeroDescActive => 'תודה על התמיכה בארנק כרטיסים';

  @override
  String get premiumHeroDescInactive => 'הסר מודעות ופתח חוויה נקייה יותר';

  @override
  String get disablePremiumBtn => 'השבת את פרימיום';

  @override
  String get removeAdsBtn => 'הסר מודעות';

  @override
  String get premiumOneTimeNotice => 'חד פעמי. משחזר באופן מיידי במכשיר זה.';

  @override
  String get noBiometricsConfigured =>
      'לא הוגדרה ביומטריה/נעילת מכשיר במכשיר זה';

  @override
  String get cardTypeCredit => 'כרטיס אשראי';

  @override
  String get cardTypeDebit => 'כרטיס חיוב';

  @override
  String get cardTypePoint => 'כרטיס נקודה';

  @override
  String get cardTypeMembership => 'כרטיס חבר';

  @override
  String get cardTypeCoupon => 'קוּפּוֹן';

  @override
  String get cardTypeGift => 'כרטיס מתנה';

  @override
  String get cardTypeEventTicket => 'כרטיס לאירוע';

  @override
  String get cardTypeOther => 'אַחֵר';

  @override
  String get chooseCardType => 'בחר סוג כרטיס';

  @override
  String get selectCustomColor => 'בחר צבע מותאם אישית';

  @override
  String get solidColor => 'מוּצָק';

  @override
  String get gradientColor => 'מִדרוֹן';

  @override
  String get startColor => 'הַתחָלָה';

  @override
  String get endColor => 'סוֹף';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'בַּיִת';

  @override
  String get cardsTab => 'הקלפים שלי';

  @override
  String get profileTab => 'פּרוֹפִיל';

  @override
  String get appTitleTypewriter => 'ארנק כרטיסים';

  @override
  String get seeAll => 'ראה הכל';

  @override
  String get backupShareText => 'גיבוי מאובטח של ארנק כרטיס';

  @override
  String get backupFileNotFoundError => 'קובץ הגיבוי לא נמצא';

  @override
  String get corruptedBackupError => 'קובץ גיבוי פגום או לא חוקי';

  @override
  String get invalidBackupDataError => 'קובץ הגיבוי אינו מכיל נתונים חוקיים.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'גרסת גיבוי לא נתמכת: $version';
  }
}
