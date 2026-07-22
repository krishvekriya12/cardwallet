// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Applicazione portafoglio carte';

  @override
  String get addCard => 'Aggiungi carta';

  @override
  String get hiThere => 'Ciao, ecco 👋';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get appLock => 'Blocco dell\'app';

  @override
  String get appLockSubtitle => 'Richiedi dati biometrici per aprire l\'app';

  @override
  String get language => 'Lingua';

  @override
  String get backupRestore => 'Backup e ripristino';

  @override
  String get backupRestoreSubtitle =>
      'Esporta e importa le tue carte localmente';

  @override
  String get clearAllData => 'Cancella tutti i dati';

  @override
  String get goodMorning => 'Buongiorno';

  @override
  String get goodAfternoon => 'Buon pomeriggio';

  @override
  String get goodEvening => 'Buonasera';

  @override
  String hiName(String name) {
    return 'Ciao, $name 👋';
  }

  @override
  String get addNewCard => 'Aggiungi nuova carta';

  @override
  String get scan => 'Scansione';

  @override
  String get scanDesc => 'Scansiona i dettagli della carta\nistantaneamente';

  @override
  String get manually => 'Manualmente';

  @override
  String get manuallyDesc => 'Inserisci i dettagli della carta\nmanualmente';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Tocca la carta da aggiungere\nutilizzando l\'NFC';

  @override
  String get tools => 'Utensili';

  @override
  String get binChecker => 'Controllo BIN';

  @override
  String get binCheckerDesc => 'Controlla i dettagli della carta da BIN';

  @override
  String get cardVerify => 'Verifica carta';

  @override
  String get cardVerifyDesc => 'Convalidare un numero di carta';

  @override
  String get frequentlyAdded => 'Aggiunto frequentemente';

  @override
  String get cardsTitle => 'Carte';

  @override
  String get yourCardsManage => 'Le tue carte qui da gestire';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Carte $count salvate',
      one: '1 carta salvata',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Carte $count',
      one: '1 carta',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Tutto';

  @override
  String get noCardsYet => 'Nessuna carta ancora';

  @override
  String get noCardsYetDesc =>
      'Vai su Home o tocca lo scanner per aggiungere una carta';

  @override
  String get noCardsCategory => 'Nessuna carta in questa categoria';

  @override
  String get tryDifferentFilter => 'Prova a selezionare un filtro diverso';

  @override
  String get addFirstCardStart => 'Aggiungi la tua prima carta per iniziare';

  @override
  String get rateUs => 'Valutaci';

  @override
  String get rateUsThanks => 'Grazie per il supporto!';

  @override
  String get shareApp => 'Condividi l\'app';

  @override
  String get shareAppSoon => 'Presto la condivisione';

  @override
  String get help => 'Aiuto';

  @override
  String get supportSoon => 'Supporto in arrivo';

  @override
  String get privacyPolicy => 'politica sulla riservatezza';

  @override
  String get privacyPolicySoon => 'Apre l\'informativa sulla privacy';

  @override
  String get termsOfUse => 'Termini di utilizzo';

  @override
  String get termsOfUseSoon => 'Apre i termini di utilizzo';

  @override
  String get clearDataTitle => 'Cancellare tutti i dati?';

  @override
  String get clearDataDesc =>
      'Ciò elimina permanentemente ogni carta salvata. Questa operazione non può essere annullata.';

  @override
  String get cancel => 'Cancellare';

  @override
  String get clearDataConfirm => 'Cancella dati';

  @override
  String get clearDataToast => 'Tutti i dati cancellati';

  @override
  String get splashSubtitle => 'Le tue carte, sicure e semplici';

  @override
  String get unlockPrompt => 'Sblocca il portafoglio carte per continuare';

  @override
  String get tapToUnlock => 'Tocca per sbloccare';

  @override
  String get authFailed => 'Autenticazione non riuscita';

  @override
  String get binCheckerTitle => 'Controllo BIN';

  @override
  String get enterMin6Digits => 'Inserisci almeno 6 cifre';

  @override
  String get binNotVerified => 'Impossibile verificare questo BIN';

  @override
  String get lookupFailed =>
      'Ricerca non riuscita. Controlla la connessione e riprova.';

  @override
  String get binLookupPlaceholder => 'RICERCA BIN/IIN';

  @override
  String get enterDigitsLabel => 'Inserisci le prime 6-8 cifre';

  @override
  String get checkButton => 'Controllo';

  @override
  String get binResultTitle => 'Risultato BIN';

  @override
  String get cardNetwork => 'Rete';

  @override
  String get cardType => 'Tipo';

  @override
  String get cardBrandCategory => 'Marca/Categoria';

  @override
  String get cardBank => 'Banca';

  @override
  String get cardCountry => 'Paese';

  @override
  String get cardCountryCode => 'Codice Paese';

  @override
  String get cardCurrency => 'Valuta';

  @override
  String get cardValid => 'Valido';

  @override
  String get yes => 'SÌ';

  @override
  String get no => 'NO';

  @override
  String get cardValidatorTitle => 'Validatore di carte';

  @override
  String get cardValidatorPreviewName => 'VALIDATORE DI CARTE';

  @override
  String get enterCardNumberLabel => 'Inserisci il numero della carta';

  @override
  String get validCardNumber => 'Numero di carta valido';

  @override
  String get invalidCardNumber =>
      'Numero di carta non valido: controlla le cifre';

  @override
  String get backupRestoreTitle => 'Backup e ripristino';

  @override
  String get createBackupPass => 'Crea password di backup';

  @override
  String get backupPassWarning =>
      'IMPORTANTE: annotare questa password. Non possiamo recuperarlo o ripristinare il backup se lo dimentichi.';

  @override
  String get enterPassLabel => 'Inserisci la password';

  @override
  String get confirmPassLabel => 'Conferma password';

  @override
  String get passEmptyError => 'La password non può essere vuota';

  @override
  String get passMismatchError => 'Le password non corrispondono';

  @override
  String get doneBtn => 'Fatto';

  @override
  String get enterBackupPass => 'Inserisci la password di backup';

  @override
  String get noCardsToBackup => 'Nessuna carta di cui eseguire il backup';

  @override
  String get backupSuccess => 'Backup creato con successo!';

  @override
  String backupFailed(String error) {
    return 'Backup non riuscito: $error';
  }

  @override
  String get restoreBackupTitle => 'Ripristinare il backup?';

  @override
  String get restoreBackupWarning =>
      'ATTENZIONE: il ripristino di un backup sovrascriverà tutte le carte e le transazioni correnti. Questa operazione non può essere annullata.';

  @override
  String get continueBtn => 'Continuare';

  @override
  String get restoreSuccess => 'Backup ripristinato con successo!';

  @override
  String get incorrectPasswordError =>
      'Password errata o file di backup danneggiato.';

  @override
  String restoreFailed(String error) {
    return 'Ripristino non riuscito: $error';
  }

  @override
  String get deleteBackupTitle => 'Eliminare il backup?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Eliminare \"$name\"? Questa operazione non può essere annullata.';
  }

  @override
  String get deleteBtn => 'Eliminare';

  @override
  String get backupDeleted => 'Backup eliminato';

  @override
  String failedShareBackup(String error) {
    return 'Impossibile condividere il backup: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Impossibile selezionare il file: $error';
  }

  @override
  String get lastBackup => 'Ultimo backup';

  @override
  String get neverBackedUp => 'Mai eseguito il backup';

  @override
  String get backupType => 'Tipo di backup';

  @override
  String get localBackupDesc => 'Locale: salvato solo su questo dispositivo';

  @override
  String get createBackupBtn => 'Crea backup';

  @override
  String get importExternalBackupBtn => 'Importa backup esterno';

  @override
  String get savedBackupsHeader => 'Backup salvati';

  @override
  String get noBackupsYet => 'Nessun backup ancora';

  @override
  String get tapCreateBackupDesc =>
      'Tocca \"Crea backup\" per salvare le tue carte';

  @override
  String get restoreTooltip => 'Ripristinare';

  @override
  String get shareTooltip => 'Condividere';

  @override
  String get cardNotFound => 'Carta non trovata';

  @override
  String get editCardTitle => 'Modifica carta';

  @override
  String get addCardTitle => 'Aggiungi carta';

  @override
  String get cardTypeLabel => 'Tipo di carta';

  @override
  String get cardColorLabel => 'Colore della carta';

  @override
  String get fieldRequiredError => 'Questo campo è obbligatorio';

  @override
  String get bankNameLabel => 'Nome della banca';

  @override
  String get expiryLabel => 'Scadenza (MM/AA)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Foto di carte';

  @override
  String get frontSideLabel => 'Lato anteriore';

  @override
  String get backSideLabel => 'Lato posteriore';

  @override
  String get notesLabel => 'Note';

  @override
  String get saveChangesBtn => 'Salva modifiche';

  @override
  String get saveCardBtn => 'Salva carta';

  @override
  String get deleteCardBtn => 'Elimina carta';

  @override
  String get takePhotoLabel => 'Scatta una foto';

  @override
  String get chooseGalleryLabel => 'Scegli dalla galleria';

  @override
  String get deleteCardPrompt => 'Eliminare la carta?';

  @override
  String get deleteCardWarning => 'Questa azione non può essere annullata.';

  @override
  String get cardNumberLabel => 'Numero della carta';

  @override
  String get pointCardNumberLabel => 'Numero della carta punti';

  @override
  String get membershipIdLabel => 'ID di appartenenza';

  @override
  String get couponCodeLabel => 'Codice coupon';

  @override
  String get giftCardNumberLabel => 'Numero della carta regalo';

  @override
  String get ticketPnrLabel => 'Numero biglietto/PNR';

  @override
  String get numberLabel => 'Numero';

  @override
  String get cardholderNameLabel => 'Nome del titolare';

  @override
  String get cardNameLabel => 'Nome della carta';

  @override
  String get enterValidCardNumberError => 'Inserisci un numero di carta valido';

  @override
  String get cardNumberInvalidError =>
      'Il numero della carta sembra non valido';

  @override
  String get enterMin3CharsError => 'Inserisci almeno 3 caratteri';

  @override
  String get cardAlreadyExistsError =>
      'Una carta con questo numero è già salvata';

  @override
  String get revealCvv => 'Rivela CVV';

  @override
  String get cardDetailsHeader => 'Dettagli della carta:';

  @override
  String get typePrefix => 'Tipo:';

  @override
  String get bankPrefix => 'Banca:';

  @override
  String get cardNumberPrefix => 'Numero della carta:';

  @override
  String get cardholderPrefix => 'Titolare della carta:';

  @override
  String get expiryPrefix => 'Scadenza:';

  @override
  String get notesPrefix => 'Note:';

  @override
  String get detailsSuffix => 'Dettagli';

  @override
  String get cardDetailsTitle => 'Dettagli della carta';

  @override
  String get hideBtn => 'Nascondere';

  @override
  String get revealBtn => 'Svelare';

  @override
  String get editBtn => 'Modificare';

  @override
  String get cardInformationHeader => 'Informazioni sulla carta';

  @override
  String get cardholderLabel => 'Titolare della carta';

  @override
  String get nameLabel => 'Nome';

  @override
  String get bankLabel => 'Banca';

  @override
  String get pnrNumberLabel => 'Numero PNR';

  @override
  String get venueLabel => 'Luogo';

  @override
  String get eventDateLabel => 'Data dell\'evento';

  @override
  String get seatLabel => 'Posto a sedere';

  @override
  String get classLabel => 'Classe';

  @override
  String get discountDetailsLabel => 'Dettagli sconto';

  @override
  String get memberIdLabel => 'ID membro';

  @override
  String get tierStatusLabel => 'Stato del livello';

  @override
  String get pointsBalanceLabel => 'Saldo punti';

  @override
  String get secondaryPinLabel => 'PIN secondario';

  @override
  String get issueDateLabel => 'Data di emissione';

  @override
  String get documentTitleLabel => 'Titolo del documento';

  @override
  String get nfcReaderTitle => 'Lettore NFC';

  @override
  String get nfcNotAvailable => 'NFC non disponibile';

  @override
  String get nfcUnsupportedDesc =>
      'Questo dispositivo non supporta la lettura delle schede NFC.';

  @override
  String get readyToScan => 'Pronto per la scansione';

  @override
  String get holdCardNfcPrompt =>
      'Tieni la tua carta contactless sul retro del telefono.';

  @override
  String get scanFailed => 'Scansione non riuscita';

  @override
  String get somethingWentWrong => 'Qualcosa è andato storto.';

  @override
  String get tryAgainBtn => 'Riprova';

  @override
  String get cardDetected => 'Carta rilevata';

  @override
  String get unsupportedCardError => 'Questo tipo di carta non è supportato.';

  @override
  String get nfcReadFailedDesc =>
      'Impossibile leggere questa carta. Riprova o aggiungilo manualmente.';

  @override
  String nfcReadError(String error) {
    return 'Lettura non riuscita: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Impossibile avviare la sessione NFC: $error';
  }

  @override
  String get scanCardTitle => 'Scansiona la carta';

  @override
  String get noCameraError =>
      'Nessuna fotocamera disponibile su questo dispositivo';

  @override
  String cameraStartError(String error) {
    return 'Impossibile avviare la fotocamera: $error';
  }

  @override
  String get ocrReadError =>
      'Impossibile leggere i dettagli della carta. Riprovare con un\'illuminazione migliore.';

  @override
  String ocrScanFailed(String error) {
    return 'Scansione non riuscita: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Per eseguire la scansione di una carta è necessaria l\'autorizzazione della fotocamera.';

  @override
  String get openSettingsBtn => 'Apri Impostazioni';

  @override
  String get notDetected => 'Non rilevato';

  @override
  String get scanAgainBtn => 'Scansione di nuovo';

  @override
  String get cardPhotosDesc =>
      'Conserva una foto della tua carta per una rapida consultazione. Le immagini rimangono su questo dispositivo.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Aggiungi la foto $label';
  }

  @override
  String get premiumTitle => 'Premio';

  @override
  String get benefitRemoveAdsTitle => 'Rimuovi tutti gli annunci';

  @override
  String get benefitRemoveAdsDesc => 'Nessun banner, nessun interstitial, mai';

  @override
  String get benefitFasterTitle => 'Esperienza più veloce';

  @override
  String get benefitFasterDesc =>
      'Schermate istantanee senza nulla da caricare';

  @override
  String get benefitSupportTitle => 'Sostenere lo sviluppo';

  @override
  String get benefitSupportDesc => 'Aiutaci a far crescere l\'app';

  @override
  String get benefitBadgeTitle => 'Distintivo premium';

  @override
  String get benefitBadgeDesc => 'Un piccolo ringraziamento sul tuo profilo';

  @override
  String get premiumHeroActive => 'Sei Premium';

  @override
  String get premiumHeroInactive => 'Vai senza pubblicità';

  @override
  String get premiumHeroDescActive => 'Grazie per il supporto di Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Rimuovi gli annunci e sblocca un\'esperienza più pulita';

  @override
  String get disablePremiumBtn => 'Disabilita Premium';

  @override
  String get removeAdsBtn => 'Rimuovi annunci';

  @override
  String get premiumOneTimeNotice =>
      'Una volta. Ripristina istantaneamente su questo dispositivo.';

  @override
  String get noBiometricsConfigured =>
      'Nessun blocco biometrico/dispositivo configurato su questo dispositivo';

  @override
  String get cardTypeCredit => 'Carta di credito';

  @override
  String get cardTypeDebit => 'Carta di debito';

  @override
  String get cardTypePoint => 'Carta punti';

  @override
  String get cardTypeMembership => 'Tessera associativa';

  @override
  String get cardTypeCoupon => 'Buono';

  @override
  String get cardTypeGift => 'Carta regalo';

  @override
  String get cardTypeEventTicket => 'Biglietto per eventi';

  @override
  String get cardTypeOther => 'Altro';

  @override
  String get chooseCardType => 'Scegli il tipo di carta';

  @override
  String get selectCustomColor => 'Seleziona Colore personalizzato';

  @override
  String get solidColor => 'Solido';

  @override
  String get gradientColor => 'Pendenza';

  @override
  String get startColor => 'Inizio';

  @override
  String get endColor => 'FINE';

  @override
  String get cardExpLabel => 'ESP';

  @override
  String get homeTab => 'Casa';

  @override
  String get cardsTab => 'Le mie carte';

  @override
  String get profileTab => 'Profilo';

  @override
  String get appTitleTypewriter => 'Porta carte';

  @override
  String get seeAll => 'Vedi tutto';

  @override
  String get backupShareText => 'Backup sicuro del portafoglio di carte';

  @override
  String get backupFileNotFoundError => 'File di backup non trovato';

  @override
  String get corruptedBackupError => 'File di backup danneggiato o non valido';

  @override
  String get invalidBackupDataError =>
      'Il file di backup non contiene dati validi.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Versione di backup non supportata: $version';
  }
}
