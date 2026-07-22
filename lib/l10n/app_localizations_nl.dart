// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Card Wallet-app';

  @override
  String get addCard => 'Kaart toevoegen';

  @override
  String get hiThere => 'Hallo daar 👋';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get appLock => 'App-vergrendeling';

  @override
  String get appLockSubtitle => 'Biometrie vereist om de app te openen';

  @override
  String get language => 'Taal';

  @override
  String get backupRestore => 'Back-up en herstel';

  @override
  String get backupRestoreSubtitle =>
      'Exporteer en importeer uw kaarten lokaal';

  @override
  String get clearAllData => 'Wis alle gegevens';

  @override
  String get goodMorning => 'Goedemorgen';

  @override
  String get goodAfternoon => 'Goedemiddag';

  @override
  String get goodEvening => 'Goedeavond';

  @override
  String hiName(String name) {
    return 'Hallo, $name 👋';
  }

  @override
  String get addNewCard => 'Nieuwe kaart toevoegen';

  @override
  String get scan => 'Scannen';

  @override
  String get scanDesc => 'Kaartgegevens scannen\nonmiddellijk';

  @override
  String get manually => 'Handmatig';

  @override
  String get manuallyDesc => 'Voer kaartgegevens in\nhandmatig';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Tik op de kaart om toe te voegen\nmet behulp van NFC';

  @override
  String get tools => 'Hulpmiddelen';

  @override
  String get binChecker => 'BIN-controle';

  @override
  String get binCheckerDesc => 'Controleer kaartgegevens van BIN';

  @override
  String get cardVerify => 'Kaart verifiëren';

  @override
  String get cardVerifyDesc => 'Valideer een kaartnummer';

  @override
  String get frequentlyAdded => 'Vaak toegevoegd';

  @override
  String get cardsTitle => 'Kaarten';

  @override
  String get yourCardsManage => 'Uw kaarten hier om te beheren';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-kaarten opgeslagen',
      one: '1 kaart opgeslagen',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count-kaarten',
      one: '1 kaart',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Alle';

  @override
  String get noCardsYet => 'Nog geen kaarten';

  @override
  String get noCardsYetDesc =>
      'Ga naar Home of tik op scanner om een ​​kaart toe te voegen';

  @override
  String get noCardsCategory => 'Geen kaarten in deze categorie';

  @override
  String get tryDifferentFilter => 'Probeer een ander filter te selecteren';

  @override
  String get addFirstCardStart =>
      'Voeg uw eerste kaart toe om aan de slag te gaan';

  @override
  String get rateUs => 'Beoordeel ons';

  @override
  String get rateUsThanks => 'Bedankt voor de steun!';

  @override
  String get shareApp => 'Deel app';

  @override
  String get shareAppSoon => 'Binnenkort delen';

  @override
  String get help => 'Hulp';

  @override
  String get supportSoon => 'Ondersteuning binnenkort beschikbaar';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get privacyPolicySoon => 'Opent het privacybeleid';

  @override
  String get termsOfUse => 'Gebruiksvoorwaarden';

  @override
  String get termsOfUseSoon => 'Opent de gebruiksvoorwaarden';

  @override
  String get clearDataTitle => 'Alle gegevens wissen?';

  @override
  String get clearDataDesc =>
      'Hierdoor wordt elke opgeslagen kaart permanent verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get cancel => 'Annuleren';

  @override
  String get clearDataConfirm => 'Gegevens wissen';

  @override
  String get clearDataToast => 'Alle gegevens gewist';

  @override
  String get splashSubtitle => 'Uw kaarten, veilig en eenvoudig';

  @override
  String get unlockPrompt => 'Ontgrendel Card Wallet om door te gaan';

  @override
  String get tapToUnlock => 'Tik om te ontgrendelen';

  @override
  String get authFailed => 'Authenticatie mislukt';

  @override
  String get binCheckerTitle => 'BIN-controle';

  @override
  String get enterMin6Digits => 'Voer minimaal 6 cijfers in';

  @override
  String get binNotVerified => 'Dit BIN kon niet worden geverifieerd';

  @override
  String get lookupFailed =>
      'Opzoeken mislukt. Controleer uw verbinding en probeer het opnieuw.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN ZOEKEN';

  @override
  String get enterDigitsLabel => 'Voer de eerste 6–8 cijfers in';

  @override
  String get checkButton => 'Rekening';

  @override
  String get binResultTitle => 'BIN-resultaat';

  @override
  String get cardNetwork => 'Netwerk';

  @override
  String get cardType => 'Type';

  @override
  String get cardBrandCategory => 'Merk/categorie';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Land';

  @override
  String get cardCountryCode => 'Landcode';

  @override
  String get cardCurrency => 'Munteenheid';

  @override
  String get cardValid => 'Geldig';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get cardValidatorTitle => 'Kaartvalidator';

  @override
  String get cardValidatorPreviewName => 'KAARTVALIDATOR';

  @override
  String get enterCardNumberLabel => 'Voer kaartnummer in';

  @override
  String get validCardNumber => 'Geldig kaartnummer';

  @override
  String get invalidCardNumber =>
      'Ongeldig kaartnummer — controleer de cijfers';

  @override
  String get backupRestoreTitle => 'Back-up en herstel';

  @override
  String get createBackupPass => 'Maak een back-upwachtwoord';

  @override
  String get backupPassWarning =>
      'BELANGRIJK: Schrijf dit wachtwoord op. We kunnen het niet herstellen of uw back-up herstellen als u deze vergeet.';

  @override
  String get enterPassLabel => 'Voer wachtwoord in';

  @override
  String get confirmPassLabel => 'Bevestig wachtwoord';

  @override
  String get passEmptyError => 'Wachtwoord mag niet leeg zijn';

  @override
  String get passMismatchError => 'Wachtwoorden komen niet overeen';

  @override
  String get doneBtn => 'Klaar';

  @override
  String get enterBackupPass => 'Voer het back-upwachtwoord in';

  @override
  String get noCardsToBackup => 'Geen kaarten om een ​​back-up van te maken';

  @override
  String get backupSuccess => 'Back-up is succesvol gemaakt!';

  @override
  String backupFailed(String error) {
    return 'Back-up mislukt: $error';
  }

  @override
  String get restoreBackupTitle => 'Back-up herstellen?';

  @override
  String get restoreBackupWarning =>
      'WAARSCHUWING: Als u een back-up herstelt, worden alle huidige kaarten en transacties overschreven. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get continueBtn => 'Doorgaan';

  @override
  String get restoreSuccess => 'Back-up succesvol hersteld!';

  @override
  String get incorrectPasswordError =>
      'Onjuist wachtwoord of beschadigd back-upbestand.';

  @override
  String restoreFailed(String error) {
    return 'Herstellen mislukt: $error';
  }

  @override
  String get deleteBackupTitle => 'Back-up verwijderen?';

  @override
  String deleteBackupConfirmText(String name) {
    return '\'$name\' verwijderen? Dit kan niet ongedaan worden gemaakt.';
  }

  @override
  String get deleteBtn => 'Verwijderen';

  @override
  String get backupDeleted => 'Back-up verwijderd';

  @override
  String failedShareBackup(String error) {
    return 'Kan back-up niet delen: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Kan bestand niet kiezen: $error';
  }

  @override
  String get lastBackup => 'Laatste back-up';

  @override
  String get neverBackedUp => 'Nooit een back-up gemaakt';

  @override
  String get backupType => 'Back-uptype';

  @override
  String get localBackupDesc => 'Lokaal: alleen op dit apparaat opgeslagen';

  @override
  String get createBackupBtn => 'Maak een back-up';

  @override
  String get importExternalBackupBtn => 'Externe back-up importeren';

  @override
  String get savedBackupsHeader => 'Opgeslagen back-ups';

  @override
  String get noBackupsYet => 'Nog geen back-ups';

  @override
  String get tapCreateBackupDesc =>
      'Tik op \'Back-up maken\' om uw kaarten op te slaan';

  @override
  String get restoreTooltip => 'Herstellen';

  @override
  String get shareTooltip => 'Deel';

  @override
  String get cardNotFound => 'Kaart niet gevonden';

  @override
  String get editCardTitle => 'Kaart bewerken';

  @override
  String get addCardTitle => 'Kaart toevoegen';

  @override
  String get cardTypeLabel => 'Kaarttype';

  @override
  String get cardColorLabel => 'Kaartkleur';

  @override
  String get fieldRequiredError => 'Dit veld is verplicht';

  @override
  String get bankNameLabel => 'Banknaam';

  @override
  String get expiryLabel => 'Vervaldatum (MM/JJ)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Kaartfoto\'s';

  @override
  String get frontSideLabel => 'Voorzijde';

  @override
  String get backSideLabel => 'Achterkant';

  @override
  String get notesLabel => 'Opmerkingen';

  @override
  String get saveChangesBtn => 'Wijzigingen opslaan';

  @override
  String get saveCardBtn => 'Kaart opslaan';

  @override
  String get deleteCardBtn => 'Kaart verwijderen';

  @override
  String get takePhotoLabel => 'Maak een foto';

  @override
  String get chooseGalleryLabel => 'Kies uit galerij';

  @override
  String get deleteCardPrompt => 'Kaart verwijderen?';

  @override
  String get deleteCardWarning =>
      'Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get cardNumberLabel => 'Kaartnummer';

  @override
  String get pointCardNumberLabel => 'Puntkaartnummer';

  @override
  String get membershipIdLabel => 'Lidmaatschaps-ID';

  @override
  String get couponCodeLabel => 'Couponcode';

  @override
  String get giftCardNumberLabel => 'Cadeaukaartnummer';

  @override
  String get ticketPnrLabel => 'Ticket-/PNR-nummer';

  @override
  String get numberLabel => 'Nummer';

  @override
  String get cardholderNameLabel => 'Naam kaarthouder';

  @override
  String get cardNameLabel => 'Kaartnaam';

  @override
  String get enterValidCardNumberError => 'Voer een geldig kaartnummer in';

  @override
  String get cardNumberInvalidError => 'Kaartnummer lijkt ongeldig';

  @override
  String get enterMin3CharsError => 'Voer minimaal 3 tekens in';

  @override
  String get cardAlreadyExistsError =>
      'Er is al een kaart met dit nummer opgeslagen';

  @override
  String get revealCvv => 'CVV onthullen';

  @override
  String get cardDetailsHeader => 'Kaartgegevens:';

  @override
  String get typePrefix => 'Type:';

  @override
  String get bankPrefix => 'Bank:';

  @override
  String get cardNumberPrefix => 'Kaartnummer:';

  @override
  String get cardholderPrefix => 'Kaarthouder:';

  @override
  String get expiryPrefix => 'Vervaldatum:';

  @override
  String get notesPrefix => 'Opmerkingen:';

  @override
  String get detailsSuffix => 'Details';

  @override
  String get cardDetailsTitle => 'Kaartgegevens';

  @override
  String get hideBtn => 'Verbergen';

  @override
  String get revealBtn => 'Onthullen';

  @override
  String get editBtn => 'Bewerking';

  @override
  String get cardInformationHeader => 'Kaartinformatie';

  @override
  String get cardholderLabel => 'Kaarthouder';

  @override
  String get nameLabel => 'Naam';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'PNR-nummer';

  @override
  String get venueLabel => 'Locatie';

  @override
  String get eventDateLabel => 'Datum evenement';

  @override
  String get seatLabel => 'Zitplaats';

  @override
  String get classLabel => 'Klas';

  @override
  String get discountDetailsLabel => 'Kortingsdetails';

  @override
  String get memberIdLabel => 'Lid-ID';

  @override
  String get tierStatusLabel => 'Niveaustatus';

  @override
  String get pointsBalanceLabel => 'Puntensaldo';

  @override
  String get secondaryPinLabel => 'Secundaire pincode';

  @override
  String get issueDateLabel => 'Uitgiftedatum';

  @override
  String get documentTitleLabel => 'Documenttitel';

  @override
  String get nfcReaderTitle => 'NFC-lezer';

  @override
  String get nfcNotAvailable => 'NFC niet beschikbaar';

  @override
  String get nfcUnsupportedDesc =>
      'Dit apparaat ondersteunt het lezen van NFC-kaarten niet.';

  @override
  String get readyToScan => 'Klaar om te scannen';

  @override
  String get holdCardNfcPrompt =>
      'Houd uw contactloze kaart tegen de achterkant van uw telefoon.';

  @override
  String get scanFailed => 'Scannen mislukt';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan.';

  @override
  String get tryAgainBtn => 'Probeer het opnieuw';

  @override
  String get cardDetected => 'Kaart gedetecteerd';

  @override
  String get unsupportedCardError => 'Dit kaarttype wordt niet ondersteund.';

  @override
  String get nfcReadFailedDesc =>
      'Kan deze kaart niet lezen. Probeer het opnieuw of voeg het handmatig toe.';

  @override
  String nfcReadError(String error) {
    return 'Lezen mislukt: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Kan NFC-sessie niet starten: $error';
  }

  @override
  String get scanCardTitle => 'Scankaart';

  @override
  String get noCameraError => 'Er is geen camera beschikbaar op dit apparaat';

  @override
  String cameraStartError(String error) {
    return 'Kan camera niet starten: $error';
  }

  @override
  String get ocrReadError =>
      'Kan kaartgegevens niet lezen. Probeer het opnieuw met betere verlichting.';

  @override
  String ocrScanFailed(String error) {
    return 'Scan mislukt: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Voor het scannen van een kaart is cameratoestemming vereist.';

  @override
  String get openSettingsBtn => 'Instellingen openen';

  @override
  String get notDetected => 'Niet gedetecteerd';

  @override
  String get scanAgainBtn => 'Opnieuw scannen';

  @override
  String get cardPhotosDesc =>
      'Bewaar een foto van uw kaart, zodat u deze snel kunt raadplegen. Afbeeldingen blijven op dit apparaat staan.';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label-foto toevoegen';
  }

  @override
  String get premiumTitle => 'Premie';

  @override
  String get benefitRemoveAdsTitle => 'Verwijder alle advertenties';

  @override
  String get benefitRemoveAdsDesc => 'Geen banners, geen interstitials, nooit';

  @override
  String get benefitFasterTitle => 'Snellere ervaring';

  @override
  String get benefitFasterDesc =>
      'Directe schermen zonder dat er iets hoeft te worden geladen';

  @override
  String get benefitSupportTitle => 'Ondersteuning van ontwikkeling';

  @override
  String get benefitSupportDesc => 'Help de app groeien';

  @override
  String get benefitBadgeTitle => 'Premium-badge';

  @override
  String get benefitBadgeDesc => 'Een klein bedankje op je profiel';

  @override
  String get premiumHeroActive => 'Jij bent Premium';

  @override
  String get premiumHeroInactive => 'Ga advertentievrij';

  @override
  String get premiumHeroDescActive =>
      'Bedankt voor het ondersteunen van Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Verwijder advertenties en ontgrendel een schonere ervaring';

  @override
  String get disablePremiumBtn => 'Schakel Premium uit';

  @override
  String get removeAdsBtn => 'Verwijder advertenties';

  @override
  String get premiumOneTimeNotice =>
      'Eenmalig. Herstelt onmiddellijk op dit apparaat.';

  @override
  String get noBiometricsConfigured =>
      'Er zijn geen biometrische gegevens/apparaatvergrendeling geconfigureerd op dit apparaat';

  @override
  String get cardTypeCredit => 'Creditcard';

  @override
  String get cardTypeDebit => 'Debetkaart';

  @override
  String get cardTypePoint => 'Puntenkaart';

  @override
  String get cardTypeMembership => 'Lidmaatschapskaart';

  @override
  String get cardTypeCoupon => 'Coupon';

  @override
  String get cardTypeGift => 'Cadeaukaart';

  @override
  String get cardTypeEventTicket => 'Evenement kaartje';

  @override
  String get cardTypeOther => 'Ander';

  @override
  String get chooseCardType => 'Kies kaarttype';

  @override
  String get selectCustomColor => 'Selecteer Aangepaste kleur';

  @override
  String get solidColor => 'Stevig';

  @override
  String get gradientColor => 'Verloop';

  @override
  String get startColor => 'Begin';

  @override
  String get endColor => 'Einde';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Thuis';

  @override
  String get cardsTab => 'Mijn kaarten';

  @override
  String get profileTab => 'Profiel';

  @override
  String get appTitleTypewriter => 'Kaart portemonnee';

  @override
  String get seeAll => 'Bekijk alles';

  @override
  String get backupShareText => 'Kaartportemonnee Veilige back-up';

  @override
  String get backupFileNotFoundError => 'Back-upbestand niet gevonden';

  @override
  String get corruptedBackupError => 'Beschadigd of ongeldig back-upbestand';

  @override
  String get invalidBackupDataError =>
      'Het back-upbestand bevat geen geldige gegevens.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Niet-ondersteunde back-upversie: $version';
  }
}
