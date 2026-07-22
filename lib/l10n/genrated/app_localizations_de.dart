// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Karten-Wallet-App';

  @override
  String get addCard => 'Karte hinzufügen';

  @override
  String get hiThere => 'Hallo, da 👋';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get appLock => 'App-Sperre';

  @override
  String get appLockSubtitle =>
      'Zum Öffnen der App sind biometrische Daten erforderlich';

  @override
  String get language => 'Sprache';

  @override
  String get backupRestore => 'Sichern und Wiederherstellen';

  @override
  String get backupRestoreSubtitle =>
      'Exportieren und importieren Sie Ihre Karten lokal';

  @override
  String get clearAllData => 'Alle Daten löschen';

  @override
  String get goodMorning => 'Guten Morgen';

  @override
  String get goodAfternoon => 'Guten Tag';

  @override
  String get goodEvening => 'Guten Abend';

  @override
  String hiName(String name) {
    return 'Hallo, $name 👋';
  }

  @override
  String get addNewCard => 'Neue Karte hinzufügen';

  @override
  String get scan => 'Scan';

  @override
  String get scanDesc => 'Kartendetails scannen\nsofort';

  @override
  String get manually => 'Manuell';

  @override
  String get manuallyDesc => 'Geben Sie die Kartendaten ein\nmanuell';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc =>
      'Tippen Sie auf die Karte, um sie hinzuzufügen\nmit NFC';

  @override
  String get tools => 'Werkzeuge';

  @override
  String get binChecker => 'BIN-Checker';

  @override
  String get binCheckerDesc => 'Überprüfen Sie die Kartendetails im BIN';

  @override
  String get cardVerify => 'Kartenbestätigung';

  @override
  String get cardVerifyDesc => 'Bestätigen Sie eine Kartennummer';

  @override
  String get frequentlyAdded => 'Häufig hinzugefügt';

  @override
  String get cardsTitle => 'Karten';

  @override
  String get yourCardsManage => 'Hier können Sie Ihre Karten verwalten';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Karten gespeichert',
      one: '1 Karte gespeichert',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-Karten',
      one: '1 Karte',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Alle';

  @override
  String get noCardsYet => 'Noch keine Karten';

  @override
  String get noCardsYetDesc =>
      'Gehen Sie zu „Startseite“ oder tippen Sie auf „Scanner“, um eine Karte hinzuzufügen';

  @override
  String get noCardsCategory => 'Keine Karten in dieser Kategorie';

  @override
  String get tryDifferentFilter =>
      'Versuchen Sie, einen anderen Filter auszuwählen';

  @override
  String get addFirstCardStart =>
      'Fügen Sie Ihre erste Karte hinzu, um loszulegen';

  @override
  String get rateUs => 'Bewerten Sie uns';

  @override
  String get rateUsThanks => 'Danke für die Unterstützung!';

  @override
  String get shareApp => 'App teilen';

  @override
  String get shareAppSoon => 'Teilen folgt bald';

  @override
  String get help => 'Helfen';

  @override
  String get supportSoon => 'Unterstützung kommt bald';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicySoon => 'Öffnet die Datenschutzrichtlinie';

  @override
  String get termsOfUse => 'Nutzungsbedingungen';

  @override
  String get termsOfUseSoon => 'Öffnet die Nutzungsbedingungen';

  @override
  String get clearDataTitle => 'Alle Daten löschen?';

  @override
  String get clearDataDesc =>
      'Dadurch wird jede gespeicherte Karte dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get cancel => 'Stornieren';

  @override
  String get clearDataConfirm => 'Daten löschen';

  @override
  String get clearDataToast => 'Alle Daten gelöscht';

  @override
  String get splashSubtitle => 'Ihre Karten, sicher und einfach';

  @override
  String get unlockPrompt => 'Entsperren Sie Card Wallet, um fortzufahren';

  @override
  String get tapToUnlock => 'Zum Entsperren antippen';

  @override
  String get authFailed => 'Die Authentifizierung ist fehlgeschlagen';

  @override
  String get binCheckerTitle => 'BIN-Checker';

  @override
  String get enterMin6Digits => 'Geben Sie mindestens 6 Ziffern ein';

  @override
  String get binNotVerified => 'Diese BIN konnte nicht verifiziert werden';

  @override
  String get lookupFailed =>
      'Die Suche ist fehlgeschlagen. Überprüfen Sie Ihre Verbindung und versuchen Sie es erneut.';

  @override
  String get binLookupPlaceholder => 'BIN/IIN-SUCHE';

  @override
  String get enterDigitsLabel => 'Geben Sie die ersten 6–8 Ziffern ein';

  @override
  String get checkButton => 'Überprüfen';

  @override
  String get binResultTitle => 'BIN-Ergebnis';

  @override
  String get cardNetwork => 'Netzwerk';

  @override
  String get cardType => 'Typ';

  @override
  String get cardBrandCategory => 'Marke/Kategorie';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Land';

  @override
  String get cardCountryCode => 'Landesvorwahl';

  @override
  String get cardCurrency => 'Währung';

  @override
  String get cardValid => 'Gültig';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'NEIN';

  @override
  String get cardValidatorTitle => 'Kartenprüfer';

  @override
  String get cardValidatorPreviewName => 'KARTENVALIDATOR';

  @override
  String get enterCardNumberLabel => 'Kartennummer eingeben';

  @override
  String get validCardNumber => 'Gültige Kartennummer';

  @override
  String get invalidCardNumber =>
      'Ungültige Kartennummer – überprüfen Sie die Ziffern';

  @override
  String get backupRestoreTitle => 'Sichern und Wiederherstellen';

  @override
  String get createBackupPass => 'Erstellen Sie ein Backup-Passwort';

  @override
  String get backupPassWarning =>
      'WICHTIG: Notieren Sie sich dieses Passwort. Wir können es nicht wiederherstellen oder Ihr Backup wiederherstellen, wenn Sie es vergessen.';

  @override
  String get enterPassLabel => 'Geben Sie das Passwort ein';

  @override
  String get confirmPassLabel => 'Passwort bestätigen';

  @override
  String get passEmptyError => 'Das Passwort darf nicht leer sein';

  @override
  String get passMismatchError => 'Passwörter stimmen nicht überein';

  @override
  String get doneBtn => 'Erledigt';

  @override
  String get enterBackupPass => 'Geben Sie das Backup-Passwort ein';

  @override
  String get noCardsToBackup => 'Keine Karten zum Sichern';

  @override
  String get backupSuccess => 'Backup erfolgreich erstellt!';

  @override
  String backupFailed(String error) {
    return 'Sicherung fehlgeschlagen: $error';
  }

  @override
  String get restoreBackupTitle => 'Backup wiederherstellen?';

  @override
  String get restoreBackupWarning =>
      'ACHTUNG: Durch das Wiederherstellen einer Sicherung werden alle aktuellen Karten und Transaktionen überschrieben. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get continueBtn => 'Weitermachen';

  @override
  String get restoreSuccess => 'Backup erfolgreich wiederhergestellt!';

  @override
  String get incorrectPasswordError =>
      'Falsches Passwort oder beschädigte Sicherungsdatei.';

  @override
  String restoreFailed(String error) {
    return 'Wiederherstellung fehlgeschlagen: $error';
  }

  @override
  String get deleteBackupTitle => 'Backup löschen?';

  @override
  String deleteBackupConfirmText(String name) {
    return '„$name“ löschen? Dies kann nicht rückgängig gemacht werden.';
  }

  @override
  String get deleteBtn => 'Löschen';

  @override
  String get backupDeleted => 'Sicherung gelöscht';

  @override
  String failedShareBackup(String error) {
    return 'Backup konnte nicht geteilt werden: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Fehler beim Auswählen der Datei: $error';
  }

  @override
  String get lastBackup => 'Letzte Sicherung';

  @override
  String get neverBackedUp => 'Nie gesichert';

  @override
  String get backupType => 'Sicherungstyp';

  @override
  String get localBackupDesc => 'Lokal – nur auf diesem Gerät gespeichert';

  @override
  String get createBackupBtn => 'Backup erstellen';

  @override
  String get importExternalBackupBtn => 'Externes Backup importieren';

  @override
  String get savedBackupsHeader => 'Gespeicherte Backups';

  @override
  String get noBackupsYet => 'Noch keine Backups';

  @override
  String get tapCreateBackupDesc =>
      'Tippen Sie auf „Backup erstellen“, um Ihre Karten zu speichern';

  @override
  String get restoreTooltip => 'Wiederherstellen';

  @override
  String get shareTooltip => 'Aktie';

  @override
  String get cardNotFound => 'Karte nicht gefunden';

  @override
  String get editCardTitle => 'Karte bearbeiten';

  @override
  String get addCardTitle => 'Karte hinzufügen';

  @override
  String get cardTypeLabel => 'Kartentyp';

  @override
  String get cardColorLabel => 'Kartenfarbe';

  @override
  String get fieldRequiredError => 'Dieses Feld ist erforderlich';

  @override
  String get bankNameLabel => 'Bankname';

  @override
  String get expiryLabel => 'Ablauf (MM/JJ)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Kartenfotos';

  @override
  String get frontSideLabel => 'Vorderseite';

  @override
  String get backSideLabel => 'Rückseite';

  @override
  String get notesLabel => 'Notizen';

  @override
  String get saveChangesBtn => 'Änderungen speichern';

  @override
  String get saveCardBtn => 'Karte speichern';

  @override
  String get deleteCardBtn => 'Karte löschen';

  @override
  String get takePhotoLabel => 'Machen Sie ein Foto';

  @override
  String get chooseGalleryLabel => 'Wählen Sie aus der Galerie';

  @override
  String get deleteCardPrompt => 'Karte löschen?';

  @override
  String get deleteCardWarning =>
      'Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get cardNumberLabel => 'Kartennummer';

  @override
  String get pointCardNumberLabel => 'Punktekartennummer';

  @override
  String get membershipIdLabel => 'Mitgliedsausweis';

  @override
  String get couponCodeLabel => 'Gutscheincode';

  @override
  String get giftCardNumberLabel => 'Geschenkkartennummer';

  @override
  String get ticketPnrLabel => 'Ticket-/PNR-Nummer';

  @override
  String get numberLabel => 'Nummer';

  @override
  String get cardholderNameLabel => 'Name des Karteninhabers';

  @override
  String get cardNameLabel => 'Kartenname';

  @override
  String get enterValidCardNumberError =>
      'Geben Sie eine gültige Kartennummer ein';

  @override
  String get cardNumberInvalidError =>
      'Die Kartennummer scheint ungültig zu sein';

  @override
  String get enterMin3CharsError => 'Geben Sie mindestens 3 Zeichen ein';

  @override
  String get cardAlreadyExistsError =>
      'Eine Karte mit dieser Nummer ist bereits gespeichert';

  @override
  String get revealCvv => 'CVV offenbaren';

  @override
  String get cardDetailsHeader => 'Kartendetails:';

  @override
  String get typePrefix => 'Typ:';

  @override
  String get bankPrefix => 'Bank:';

  @override
  String get cardNumberPrefix => 'Kartennummer:';

  @override
  String get cardholderPrefix => 'Karteninhaber:';

  @override
  String get expiryPrefix => 'Ablauf:';

  @override
  String get notesPrefix => 'Hinweise:';

  @override
  String get detailsSuffix => 'Details';

  @override
  String get cardDetailsTitle => 'Kartendetails';

  @override
  String get hideBtn => 'Verstecken';

  @override
  String get revealBtn => 'Aufdecken';

  @override
  String get editBtn => 'Bearbeiten';

  @override
  String get cardInformationHeader => 'Karteninformationen';

  @override
  String get cardholderLabel => 'Karteninhaber';

  @override
  String get nameLabel => 'Name';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'PNR-Nummer';

  @override
  String get venueLabel => 'Veranstaltungsort';

  @override
  String get eventDateLabel => 'Veranstaltungsdatum';

  @override
  String get seatLabel => 'Sitz';

  @override
  String get classLabel => 'Klasse';

  @override
  String get discountDetailsLabel => 'Rabattdetails';

  @override
  String get memberIdLabel => 'Mitglieds-ID';

  @override
  String get tierStatusLabel => 'Tierstatus';

  @override
  String get pointsBalanceLabel => 'Punktestand';

  @override
  String get secondaryPinLabel => 'Sekundär-PIN';

  @override
  String get issueDateLabel => 'Ausgabedatum';

  @override
  String get documentTitleLabel => 'Dokumenttitel';

  @override
  String get nfcReaderTitle => 'NFC-Leser';

  @override
  String get nfcNotAvailable => 'NFC nicht verfügbar';

  @override
  String get nfcUnsupportedDesc =>
      'Dieses Gerät unterstützt das Lesen von NFC-Karten nicht.';

  @override
  String get readyToScan => 'Bereit zum Scannen';

  @override
  String get holdCardNfcPrompt =>
      'Halten Sie Ihre kontaktlose Karte an die Rückseite Ihres Telefons.';

  @override
  String get scanFailed => 'Scan fehlgeschlagen';

  @override
  String get somethingWentWrong => 'Etwas ist schief gelaufen.';

  @override
  String get tryAgainBtn => 'Versuchen Sie es erneut';

  @override
  String get cardDetected => 'Karte erkannt';

  @override
  String get unsupportedCardError => 'Dieser Kartentyp wird nicht unterstützt.';

  @override
  String get nfcReadFailedDesc =>
      'Diese Karte konnte nicht gelesen werden. Versuchen Sie es erneut oder fügen Sie es manuell hinzu.';

  @override
  String nfcReadError(String error) {
    return 'Lesen fehlgeschlagen: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'NFC-Sitzung konnte nicht gestartet werden: $error';
  }

  @override
  String get scanCardTitle => 'Karte scannen';

  @override
  String get noCameraError => 'Auf diesem Gerät ist keine Kamera verfügbar';

  @override
  String cameraStartError(String error) {
    return 'Kamera konnte nicht gestartet werden: $error';
  }

  @override
  String get ocrReadError =>
      'Kartendetails konnten nicht gelesen werden. Versuchen Sie es noch einmal mit besserer Beleuchtung.';

  @override
  String ocrScanFailed(String error) {
    return 'Scan fehlgeschlagen: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Zum Scannen einer Karte ist eine Kameraerlaubnis erforderlich.';

  @override
  String get openSettingsBtn => 'Öffnen Sie Einstellungen';

  @override
  String get notDetected => 'Nicht erkannt';

  @override
  String get scanAgainBtn => 'Erneut scannen';

  @override
  String get cardPhotosDesc =>
      'Bewahren Sie zum schnellen Nachschlagen ein Foto Ihrer Karte auf. Bilder bleiben auf diesem Gerät.';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label-Foto hinzufügen';
  }

  @override
  String get premiumTitle => 'Prämie';

  @override
  String get benefitRemoveAdsTitle => 'Entfernen Sie alle Anzeigen';

  @override
  String get benefitRemoveAdsDesc =>
      'Keine Banner, keine Interstitials, niemals';

  @override
  String get benefitFasterTitle => 'Schnelleres Erlebnis';

  @override
  String get benefitFasterDesc =>
      'Sofortige Bildschirme, ohne dass etwas geladen werden muss';

  @override
  String get benefitSupportTitle => 'Unterstützen Sie die Entwicklung';

  @override
  String get benefitSupportDesc =>
      'Helfen Sie mit, die App weiter wachsen zu lassen';

  @override
  String get benefitBadgeTitle => 'Premium-Abzeichen';

  @override
  String get benefitBadgeDesc => 'Ein kleines Dankeschön auf deinem Profil';

  @override
  String get premiumHeroActive => 'Du bist Premium';

  @override
  String get premiumHeroInactive => 'Werden Sie werbefrei';

  @override
  String get premiumHeroDescActive =>
      'Vielen Dank für die Unterstützung von Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Entfernen Sie Werbung und sorgen Sie für ein saubereres Erlebnis';

  @override
  String get disablePremiumBtn => 'Premium deaktivieren';

  @override
  String get removeAdsBtn => 'Werbung entfernen';

  @override
  String get premiumOneTimeNotice =>
      'Einmalig. Wird auf diesem Gerät sofort wiederhergestellt.';

  @override
  String get noBiometricsConfigured =>
      'Auf diesem Gerät ist keine Biometrie/Gerätesperre konfiguriert';

  @override
  String get cardTypeCredit => 'Kreditkarte';

  @override
  String get cardTypeDebit => 'Debitkarte';

  @override
  String get cardTypePoint => 'Punktekarte';

  @override
  String get cardTypeMembership => 'Mitgliedskarte';

  @override
  String get cardTypeCoupon => 'Coupon';

  @override
  String get cardTypeGift => 'Geschenkkarte';

  @override
  String get cardTypeEventTicket => 'Veranstaltungsticket';

  @override
  String get cardTypeOther => 'Andere';

  @override
  String get chooseCardType => 'Wählen Sie den Kartentyp';

  @override
  String get selectCustomColor => 'Wählen Sie „Benutzerdefinierte Farbe“.';

  @override
  String get solidColor => 'Solide';

  @override
  String get gradientColor => 'Gradient';

  @override
  String get startColor => 'Start';

  @override
  String get endColor => 'Ende';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Heim';

  @override
  String get cardsTab => 'Meine Karten';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Kartenetui';

  @override
  String get seeAll => 'Alle anzeigen';

  @override
  String get backupShareText => 'Sicheres Karten-Wallet-Backup';

  @override
  String get backupFileNotFoundError => 'Sicherungsdatei nicht gefunden';

  @override
  String get corruptedBackupError =>
      'Beschädigte oder ungültige Sicherungsdatei';

  @override
  String get invalidBackupDataError =>
      'Die Sicherungsdatei enthält keine gültigen Daten.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Nicht unterstützte Backup-Version: $version';
  }
}
