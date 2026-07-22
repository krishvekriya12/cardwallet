// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Aplikacja z portfelem kart';

  @override
  String get addCard => 'Dodaj kartę';

  @override
  String get hiThere => 'Cześć, tam 👋';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get appLock => 'Blokada aplikacji';

  @override
  String get appLockSubtitle =>
      'Wymagaj danych biometrycznych, aby otworzyć aplikację';

  @override
  String get language => 'Język';

  @override
  String get backupRestore => 'Kopia zapasowa i przywracanie';

  @override
  String get backupRestoreSubtitle =>
      'Eksportuj i importuj swoje karty lokalnie';

  @override
  String get clearAllData => 'Wyczyść wszystkie dane';

  @override
  String get goodMorning => 'Dzień dobry';

  @override
  String get goodAfternoon => 'Dzień dobry';

  @override
  String get goodEvening => 'Dobry wieczór';

  @override
  String hiName(String name) {
    return 'Cześć, $name 👋';
  }

  @override
  String get addNewCard => 'Dodaj nową kartę';

  @override
  String get scan => 'Skandować';

  @override
  String get scanDesc => 'Zeskanuj szczegóły karty\nnatychmiast';

  @override
  String get manually => 'Ręcznie';

  @override
  String get manuallyDesc => 'Wprowadź dane karty\nręcznie';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Kliknij kartę, aby ją dodać\nza pomocą NFC';

  @override
  String get tools => 'Narzędzia';

  @override
  String get binChecker => 'Kontroler BIN';

  @override
  String get binCheckerDesc => 'Sprawdź dane karty w BIN';

  @override
  String get cardVerify => 'Zweryfikuj kartę';

  @override
  String get cardVerifyDesc => 'Zweryfikuj numer karty';

  @override
  String get frequentlyAdded => 'Często dodawane';

  @override
  String get cardsTitle => 'Karty';

  @override
  String get yourCardsManage => 'Twoje karty tutaj do zarządzania';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Zapisano karty $count',
      one: 'Zapisano 1 kartę',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Karty $count',
      one: '1 karta',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Wszystko';

  @override
  String get noCardsYet => 'Nie ma jeszcze kart';

  @override
  String get noCardsYetDesc =>
      'Przejdź do strony głównej lub dotknij skanera, aby dodać kartę';

  @override
  String get noCardsCategory => 'Brak kart w tej kategorii';

  @override
  String get tryDifferentFilter => 'Spróbuj wybrać inny filtr';

  @override
  String get addFirstCardStart => 'Aby rozpocząć, dodaj swoją pierwszą kartę';

  @override
  String get rateUs => 'Oceń nas';

  @override
  String get rateUsThanks => 'Dziękuję za wsparcie!';

  @override
  String get shareApp => 'Udostępnij aplikację';

  @override
  String get shareAppSoon => 'Udostępnienie już wkrótce';

  @override
  String get help => 'Pomoc';

  @override
  String get supportSoon => 'Wsparcie już wkrótce';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get privacyPolicySoon => 'Otwiera politykę prywatności';

  @override
  String get termsOfUse => 'Warunki użytkowania';

  @override
  String get termsOfUseSoon => 'Otwiera warunki użytkowania';

  @override
  String get clearDataTitle => 'Wyczyścić wszystkie dane?';

  @override
  String get clearDataDesc =>
      'Spowoduje to trwałe usunięcie każdej zapisanej karty. Tego nie można cofnąć.';

  @override
  String get cancel => 'Anulować';

  @override
  String get clearDataConfirm => 'Wyczyść dane';

  @override
  String get clearDataToast => 'Wszystkie dane zostały usunięte';

  @override
  String get splashSubtitle => 'Twoje karty, bezpieczne i proste';

  @override
  String get unlockPrompt => 'Odblokuj portfel kart, aby kontynuować';

  @override
  String get tapToUnlock => 'Stuknij, aby odblokować';

  @override
  String get authFailed => 'Uwierzytelnienie nie powiodło się';

  @override
  String get binCheckerTitle => 'Kontroler BIN';

  @override
  String get enterMin6Digits => 'Wpisz co najmniej 6 cyfr';

  @override
  String get binNotVerified => 'Nie można zweryfikować tego BIN';

  @override
  String get lookupFailed =>
      'Wyszukiwanie nie powiodło się. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get binLookupPlaceholder => 'WYSZUKIWANIE BIN/IIN';

  @override
  String get enterDigitsLabel => 'Wprowadź pierwsze 6–8 cyfr';

  @override
  String get checkButton => 'Sprawdzać';

  @override
  String get binResultTitle => 'Wynik BIN';

  @override
  String get cardNetwork => 'Sieć';

  @override
  String get cardType => 'Typ';

  @override
  String get cardBrandCategory => 'Marka/kategoria';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Kraj';

  @override
  String get cardCountryCode => 'Kod kraju';

  @override
  String get cardCurrency => 'Waluta';

  @override
  String get cardValid => 'Ważny';

  @override
  String get yes => 'Tak';

  @override
  String get no => 'NIE';

  @override
  String get cardValidatorTitle => 'Walidator kart';

  @override
  String get cardValidatorPreviewName => 'WALIDATOR KART';

  @override
  String get enterCardNumberLabel => 'Wprowadź numer karty';

  @override
  String get validCardNumber => 'Ważny numer karty';

  @override
  String get invalidCardNumber => 'Nieprawidłowy numer karty — sprawdź cyfry';

  @override
  String get backupRestoreTitle => 'Kopia zapasowa i przywracanie';

  @override
  String get createBackupPass => 'Utwórz hasło zapasowe';

  @override
  String get backupPassWarning =>
      'WAŻNE: Zapisz to hasło. Jeśli zapomnisz, nie będziemy w stanie go odzyskać ani przywrócić kopii zapasowej.';

  @override
  String get enterPassLabel => 'Wprowadź hasło';

  @override
  String get confirmPassLabel => 'Potwierdź hasło';

  @override
  String get passEmptyError => 'Hasło nie może być puste';

  @override
  String get passMismatchError => 'Hasła nie pasują';

  @override
  String get doneBtn => 'Zrobione';

  @override
  String get enterBackupPass => 'Wprowadź hasło zapasowe';

  @override
  String get noCardsToBackup => 'Brak kart do tworzenia kopii zapasowych';

  @override
  String get backupSuccess => 'Kopia zapasowa została utworzona pomyślnie!';

  @override
  String backupFailed(String error) {
    return 'Tworzenie kopii zapasowej nie powiodło się: $error';
  }

  @override
  String get restoreBackupTitle => 'Przywrócić kopię zapasową?';

  @override
  String get restoreBackupWarning =>
      'OSTRZEŻENIE: Przywrócenie kopii zapasowej spowoduje nadpisanie wszystkich bieżących kart i transakcji. Tego nie można cofnąć.';

  @override
  String get continueBtn => 'Kontynuować';

  @override
  String get restoreSuccess => 'Kopia zapasowa została pomyślnie przywrócona!';

  @override
  String get incorrectPasswordError =>
      'Nieprawidłowe hasło lub uszkodzony plik kopii zapasowej.';

  @override
  String restoreFailed(String error) {
    return 'Przywracanie nie powiodło się: $error';
  }

  @override
  String get deleteBackupTitle => 'Usunąć kopię zapasową?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Usunąć „$name”? Tego nie można cofnąć.';
  }

  @override
  String get deleteBtn => 'Usuwać';

  @override
  String get backupDeleted => 'Kopia zapasowa została usunięta';

  @override
  String failedShareBackup(String error) {
    return 'Nie udało się udostępnić kopii zapasowej: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Nie udało się wybrać pliku: $error';
  }

  @override
  String get lastBackup => 'Ostatnia kopia zapasowa';

  @override
  String get neverBackedUp => 'Nigdy nie tworzyłem kopii zapasowej';

  @override
  String get backupType => 'Typ kopii zapasowej';

  @override
  String get localBackupDesc => 'Lokalne — zapisane tylko na tym urządzeniu';

  @override
  String get createBackupBtn => 'Utwórz kopię zapasową';

  @override
  String get importExternalBackupBtn => 'Importuj zewnętrzną kopię zapasową';

  @override
  String get savedBackupsHeader => 'Zapisane kopie zapasowe';

  @override
  String get noBackupsYet => 'Nie ma jeszcze kopii zapasowych';

  @override
  String get tapCreateBackupDesc =>
      'Kliknij „Utwórz kopię zapasową”, aby zapisać swoje karty';

  @override
  String get restoreTooltip => 'Przywrócić';

  @override
  String get shareTooltip => 'Udział';

  @override
  String get cardNotFound => 'Nie znaleziono karty';

  @override
  String get editCardTitle => 'Edytuj kartę';

  @override
  String get addCardTitle => 'Dodaj kartę';

  @override
  String get cardTypeLabel => 'Typ karty';

  @override
  String get cardColorLabel => 'Kolor karty';

  @override
  String get fieldRequiredError => 'To pole jest wymagane';

  @override
  String get bankNameLabel => 'Nazwa banku';

  @override
  String get expiryLabel => 'Wygaśnięcie (MM/RR)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Zdjęcia kart';

  @override
  String get frontSideLabel => 'Przód';

  @override
  String get backSideLabel => 'Tylna strona';

  @override
  String get notesLabel => 'Notatki';

  @override
  String get saveChangesBtn => 'Zapisz zmiany';

  @override
  String get saveCardBtn => 'Zapisz kartę';

  @override
  String get deleteCardBtn => 'Usuń kartę';

  @override
  String get takePhotoLabel => 'Zrób zdjęcie';

  @override
  String get chooseGalleryLabel => 'Wybierz z galerii';

  @override
  String get deleteCardPrompt => 'Usunąć kartę?';

  @override
  String get deleteCardWarning => 'Tej akcji nie można cofnąć.';

  @override
  String get cardNumberLabel => 'Numer karty';

  @override
  String get pointCardNumberLabel => 'Numer karty punktowej';

  @override
  String get membershipIdLabel => 'Identyfikator członkostwa';

  @override
  String get couponCodeLabel => 'Kod kuponu';

  @override
  String get giftCardNumberLabel => 'Numer karty upominkowej';

  @override
  String get ticketPnrLabel => 'Numer biletu/PNR';

  @override
  String get numberLabel => 'Numer';

  @override
  String get cardholderNameLabel => 'Imię i nazwisko posiadacza karty';

  @override
  String get cardNameLabel => 'Nazwa karty';

  @override
  String get enterValidCardNumberError => 'Wprowadź prawidłowy numer karty';

  @override
  String get cardNumberInvalidError => 'Numer karty wygląda na nieprawidłowy';

  @override
  String get enterMin3CharsError => 'Wpisz co najmniej 3 znaki';

  @override
  String get cardAlreadyExistsError => 'Karta o tym numerze jest już zapisana';

  @override
  String get revealCvv => 'Odkryj CVV';

  @override
  String get cardDetailsHeader => 'Dane karty:';

  @override
  String get typePrefix => 'Typ:';

  @override
  String get bankPrefix => 'Bank:';

  @override
  String get cardNumberPrefix => 'Numer karty:';

  @override
  String get cardholderPrefix => 'Posiadacz karty:';

  @override
  String get expiryPrefix => 'Wygaśnięcie:';

  @override
  String get notesPrefix => 'Uwagi:';

  @override
  String get detailsSuffix => 'Bliższe dane';

  @override
  String get cardDetailsTitle => 'Szczegóły karty';

  @override
  String get hideBtn => 'Ukrywać';

  @override
  String get revealBtn => 'Ujawnić';

  @override
  String get editBtn => 'Redagować';

  @override
  String get cardInformationHeader => 'Informacje o karcie';

  @override
  String get cardholderLabel => 'Posiadacz karty';

  @override
  String get nameLabel => 'Nazwa';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'Numer PNR';

  @override
  String get venueLabel => 'Lokal';

  @override
  String get eventDateLabel => 'Data wydarzenia';

  @override
  String get seatLabel => 'Siedziba';

  @override
  String get classLabel => 'Klasa';

  @override
  String get discountDetailsLabel => 'Szczegóły rabatu';

  @override
  String get memberIdLabel => 'Identyfikator członka';

  @override
  String get tierStatusLabel => 'Stan poziomu';

  @override
  String get pointsBalanceLabel => 'Bilans punktów';

  @override
  String get secondaryPinLabel => 'Dodatkowy PIN';

  @override
  String get issueDateLabel => 'Data wydania';

  @override
  String get documentTitleLabel => 'Tytuł dokumentu';

  @override
  String get nfcReaderTitle => 'Czytnik NFC';

  @override
  String get nfcNotAvailable => 'NFC nie jest dostępne';

  @override
  String get nfcUnsupportedDesc =>
      'To urządzenie nie obsługuje odczytu kart NFC.';

  @override
  String get readyToScan => 'Gotowy do skanowania';

  @override
  String get holdCardNfcPrompt => 'Przyłóż kartę zbliżeniową do tyłu telefonu.';

  @override
  String get scanFailed => 'Skanowanie nie powiodło się';

  @override
  String get somethingWentWrong => 'Coś poszło nie tak.';

  @override
  String get tryAgainBtn => 'Spróbuj ponownie';

  @override
  String get cardDetected => 'Wykryto kartę';

  @override
  String get unsupportedCardError => 'Ten typ karty nie jest obsługiwany.';

  @override
  String get nfcReadFailedDesc =>
      'Nie można odczytać tej karty. Spróbuj ponownie lub dodaj ręcznie.';

  @override
  String nfcReadError(String error) {
    return 'Odczyt nie powiódł się: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Nie można rozpocząć sesji NFC: $error';
  }

  @override
  String get scanCardTitle => 'Zeskanuj kartę';

  @override
  String get noCameraError => 'W tym urządzeniu nie ma dostępnej kamery';

  @override
  String cameraStartError(String error) {
    return 'Nie można uruchomić kamery: $error';
  }

  @override
  String get ocrReadError =>
      'Nie udało się odczytać szczegółów karty. Spróbuj ponownie z lepszym oświetleniem.';

  @override
  String ocrScanFailed(String error) {
    return 'Skanowanie nie powiodło się: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Aby zeskanować kartę, wymagane jest pozwolenie na aparat.';

  @override
  String get openSettingsBtn => 'Otwórz Ustawienia';

  @override
  String get notDetected => 'Nie wykryto';

  @override
  String get scanAgainBtn => 'Skanuj ponownie';

  @override
  String get cardPhotosDesc =>
      'Zachowaj zdjęcie swojej karty, aby mieć do niej szybki dostęp. Obrazy pozostają na tym urządzeniu.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Dodaj zdjęcie $label';
  }

  @override
  String get premiumTitle => 'Premia';

  @override
  String get benefitRemoveAdsTitle => 'Usuń wszystkie reklamy';

  @override
  String get benefitRemoveAdsDesc =>
      'Żadnych banerów, żadnych reklam pełnoekranowych, nigdy';

  @override
  String get benefitFasterTitle => 'Szybsze doświadczenie';

  @override
  String get benefitFasterDesc =>
      'Natychmiastowe ekrany bez niczego do załadowania';

  @override
  String get benefitSupportTitle => 'Wspieraj rozwój';

  @override
  String get benefitSupportDesc => 'Pomóż w dalszym rozwoju aplikacji';

  @override
  String get benefitBadgeTitle => 'Odznaka premium';

  @override
  String get benefitBadgeDesc => 'Małe podziękowanie na Twoim profilu';

  @override
  String get premiumHeroActive => 'Jesteś Premium';

  @override
  String get premiumHeroInactive => 'Przejdź bez reklam';

  @override
  String get premiumHeroDescActive => 'Dziękujemy za wsparcie Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Usuń reklamy i odblokuj czystsze wrażenia';

  @override
  String get disablePremiumBtn => 'Wyłącz Premium';

  @override
  String get removeAdsBtn => 'Usuń reklamy';

  @override
  String get premiumOneTimeNotice =>
      'Jednorazowy. Przywraca natychmiast na tym urządzeniu.';

  @override
  String get noBiometricsConfigured =>
      'Na tym urządzeniu nie skonfigurowano żadnej blokady biometrycznej/blokady urządzenia';

  @override
  String get cardTypeCredit => 'Karta kredytowa';

  @override
  String get cardTypeDebit => 'Karta debetowa';

  @override
  String get cardTypePoint => 'Karta Punktowa';

  @override
  String get cardTypeMembership => 'Karta członkowska';

  @override
  String get cardTypeCoupon => 'Kupon';

  @override
  String get cardTypeGift => 'Karta podarunkowa';

  @override
  String get cardTypeEventTicket => 'Bilet na wydarzenie';

  @override
  String get cardTypeOther => 'Inny';

  @override
  String get chooseCardType => 'Wybierz typ karty';

  @override
  String get selectCustomColor => 'Wybierz Kolor niestandardowy';

  @override
  String get solidColor => 'Solidny';

  @override
  String get gradientColor => 'Gradient';

  @override
  String get startColor => 'Start';

  @override
  String get endColor => 'Koniec';

  @override
  String get cardExpLabel => 'DO POTĘGI';

  @override
  String get homeTab => 'Dom';

  @override
  String get cardsTab => 'Moje karty';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Portfel na karty';

  @override
  String get seeAll => 'Zobacz wszystko';

  @override
  String get backupShareText => 'Bezpieczna kopia zapasowa portfela kart';

  @override
  String get backupFileNotFoundError => 'Nie znaleziono pliku kopii zapasowej';

  @override
  String get corruptedBackupError =>
      'Uszkodzony lub nieprawidłowy plik kopii zapasowej';

  @override
  String get invalidBackupDataError =>
      'Plik kopii zapasowej nie zawiera prawidłowych danych.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Nieobsługiwana wersja kopii zapasowej: $version';
  }
}
