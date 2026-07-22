// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Application de portefeuille de cartes';

  @override
  String get addCard => 'Ajouter une carte';

  @override
  String get hiThere => 'Hi, there 👋';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get appLock => 'Verrouillage d\'application';

  @override
  String get appLockSubtitle =>
      'Exiger la biométrie pour ouvrir l\'application';

  @override
  String get language => 'Langue';

  @override
  String get backupRestore => 'Sauvegarde et restauration';

  @override
  String get backupRestoreSubtitle =>
      'Exportez et importez vos cartes localement';

  @override
  String get clearAllData => 'Effacer toutes les données';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get goodAfternoon => 'Bon après-midi';

  @override
  String get goodEvening => 'Bonne soirée';

  @override
  String hiName(String name) {
    return 'Hi, $name 👋';
  }

  @override
  String get addNewCard => 'Ajouter une nouvelle carte';

  @override
  String get scan => 'Balayage';

  @override
  String get scanDesc => 'Scanner les détails de la carte\ninstantanément';

  @override
  String get manually => 'Manuellement';

  @override
  String get manuallyDesc => 'Entrez les détails de la carte\nmanuellement';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc =>
      'Appuyez sur la carte pour ajouter\nen utilisant le NFC';

  @override
  String get tools => 'Outils';

  @override
  String get binChecker => 'Vérificateur de BIN';

  @override
  String get binCheckerDesc => 'Vérifiez les détails de la carte depuis BIN';

  @override
  String get cardVerify => 'Vérification de la carte';

  @override
  String get cardVerifyDesc => 'Valider un numéro de carte';

  @override
  String get frequentlyAdded => 'Fréquemment ajouté';

  @override
  String get cardsTitle => 'Cartes';

  @override
  String get yourCardsManage => 'Vos cartes ici à gérer';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cartes $count enregistrées',
      one: '1 carte enregistrée',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cartes $count',
      one: '1 carte',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Tous';

  @override
  String get noCardsYet => 'Pas encore de cartes';

  @override
  String get noCardsYetDesc =>
      'Accédez à Accueil ou appuyez sur Scanner pour ajouter une carte';

  @override
  String get noCardsCategory => 'Aucune carte dans cette catégorie';

  @override
  String get tryDifferentFilter => 'Essayez de sélectionner un autre filtre';

  @override
  String get addFirstCardStart => 'Ajoutez votre première carte pour commencer';

  @override
  String get rateUs => 'Évaluez-nous';

  @override
  String get rateUsThanks => 'Merci pour le soutien !';

  @override
  String get shareApp => 'Partager l\'application';

  @override
  String get shareAppSoon => 'Partage à venir';

  @override
  String get help => 'Aide';

  @override
  String get supportSoon => 'Soutien bientôt disponible';

  @override
  String get privacyPolicy => 'politique de confidentialité';

  @override
  String get privacyPolicySoon => 'Ouvre la politique de confidentialité';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get termsOfUseSoon => 'Ouvre les conditions d\'utilisation';

  @override
  String get clearDataTitle => 'Effacer toutes les données ?';

  @override
  String get clearDataDesc =>
      'Cela supprime définitivement toutes les cartes enregistrées. Cela ne peut pas être annulé.';

  @override
  String get cancel => 'Annuler';

  @override
  String get clearDataConfirm => 'Effacer les données';

  @override
  String get clearDataToast => 'Toutes les données effacées';

  @override
  String get splashSubtitle => 'Vos cartes, sûres et simples';

  @override
  String get unlockPrompt =>
      'Déverrouillez le portefeuille de cartes pour continuer';

  @override
  String get tapToUnlock => 'Appuyez pour déverrouiller';

  @override
  String get authFailed => 'L\'authentification a échoué';

  @override
  String get binCheckerTitle => 'Vérificateur de BIN';

  @override
  String get enterMin6Digits => 'Entrez au moins 6 chiffres';

  @override
  String get binNotVerified => 'Ce BIN n\'a pas pu être vérifié';

  @override
  String get lookupFailed =>
      'La recherche a échoué. Vérifiez votre connexion et réessayez.';

  @override
  String get binLookupPlaceholder => 'RECHERCHE BIN / IIN';

  @override
  String get enterDigitsLabel => 'Saisissez les 6 à 8 premiers chiffres';

  @override
  String get checkButton => 'Vérifier';

  @override
  String get binResultTitle => 'Résultat BIN';

  @override
  String get cardNetwork => 'Réseau';

  @override
  String get cardType => 'Taper';

  @override
  String get cardBrandCategory => 'Marque/Catégorie';

  @override
  String get cardBank => 'Banque';

  @override
  String get cardCountry => 'Pays';

  @override
  String get cardCountryCode => 'Code du pays';

  @override
  String get cardCurrency => 'Devise';

  @override
  String get cardValid => 'Valide';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';

  @override
  String get cardValidatorTitle => 'Validateur de carte';

  @override
  String get cardValidatorPreviewName => 'VALIDATEUR DE CARTE';

  @override
  String get enterCardNumberLabel => 'Entrez le numéro de la carte';

  @override
  String get validCardNumber => 'Numéro de carte valide';

  @override
  String get invalidCardNumber =>
      'Numéro de carte invalide : vérifiez les chiffres';

  @override
  String get backupRestoreTitle => 'Sauvegarde et restauration';

  @override
  String get createBackupPass => 'Créer un mot de passe de sauvegarde';

  @override
  String get backupPassWarning =>
      'IMPORTANT : notez ce mot de passe. Nous ne pouvons pas le récupérer ou restaurer votre sauvegarde si vous l\'oubliez.';

  @override
  String get enterPassLabel => 'Entrez le mot de passe';

  @override
  String get confirmPassLabel => 'Confirmez le mot de passe';

  @override
  String get passEmptyError => 'Le mot de passe ne peut pas être vide';

  @override
  String get passMismatchError => 'Les mots de passe ne correspondent pas';

  @override
  String get doneBtn => 'Fait';

  @override
  String get enterBackupPass => 'Entrez le mot de passe de sauvegarde';

  @override
  String get noCardsToBackup => 'Aucune carte à sauvegarder';

  @override
  String get backupSuccess => 'Sauvegarde créée avec succès !';

  @override
  String backupFailed(String error) {
    return 'Échec de la sauvegarde : $error';
  }

  @override
  String get restoreBackupTitle => 'Restaurer la sauvegarde ?';

  @override
  String get restoreBackupWarning =>
      'AVERTISSEMENT : la restauration d\'une sauvegarde écrasera toutes les cartes et transactions en cours. Cela ne peut pas être annulé.';

  @override
  String get continueBtn => 'Continuer';

  @override
  String get restoreSuccess => 'Sauvegarde restaurée avec succès !';

  @override
  String get incorrectPasswordError =>
      'Mot de passe incorrect ou fichier de sauvegarde corrompu.';

  @override
  String restoreFailed(String error) {
    return 'Échec de la restauration : $error';
  }

  @override
  String get deleteBackupTitle => 'Supprimer la sauvegarde ?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Supprimer \"$name\" ? Cela ne peut pas être annulé.';
  }

  @override
  String get deleteBtn => 'Supprimer';

  @override
  String get backupDeleted => 'Sauvegarde supprimée';

  @override
  String failedShareBackup(String error) {
    return 'Échec du partage de la sauvegarde : $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Échec de la sélection du fichier : $error';
  }

  @override
  String get lastBackup => 'Dernière sauvegarde';

  @override
  String get neverBackedUp => 'Jamais sauvegardé';

  @override
  String get backupType => 'Type de sauvegarde';

  @override
  String get localBackupDesc =>
      'Local : enregistré sur cet appareil uniquement';

  @override
  String get createBackupBtn => 'Créer une sauvegarde';

  @override
  String get importExternalBackupBtn => 'Importer une sauvegarde externe';

  @override
  String get savedBackupsHeader => 'Sauvegardes enregistrées';

  @override
  String get noBackupsYet => 'Aucune sauvegarde pour le moment';

  @override
  String get tapCreateBackupDesc =>
      'Appuyez sur \"Créer une sauvegarde\" pour enregistrer vos cartes';

  @override
  String get restoreTooltip => 'Restaurer';

  @override
  String get shareTooltip => 'Partager';

  @override
  String get cardNotFound => 'Carte introuvable';

  @override
  String get editCardTitle => 'Modifier la carte';

  @override
  String get addCardTitle => 'Ajouter une carte';

  @override
  String get cardTypeLabel => 'Type de carte';

  @override
  String get cardColorLabel => 'Couleur de la carte';

  @override
  String get fieldRequiredError => 'Ce champ est obligatoire';

  @override
  String get bankNameLabel => 'Nom de la banque';

  @override
  String get expiryLabel => 'Expiration (MM/AA)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Photos de cartes';

  @override
  String get frontSideLabel => 'Face avant';

  @override
  String get backSideLabel => 'Face arrière';

  @override
  String get notesLabel => 'Remarques';

  @override
  String get saveChangesBtn => 'Enregistrer les modifications';

  @override
  String get saveCardBtn => 'Enregistrer la carte';

  @override
  String get deleteCardBtn => 'Supprimer la carte';

  @override
  String get takePhotoLabel => 'Prendre une photo';

  @override
  String get chooseGalleryLabel => 'Choisissez dans la galerie';

  @override
  String get deleteCardPrompt => 'Supprimer la carte ?';

  @override
  String get deleteCardWarning => 'Cette action ne peut pas être annulée.';

  @override
  String get cardNumberLabel => 'Numéro de carte';

  @override
  String get pointCardNumberLabel => 'Numéro de carte de points';

  @override
  String get membershipIdLabel => 'Identifiant de membre';

  @override
  String get couponCodeLabel => 'Code promo';

  @override
  String get giftCardNumberLabel => 'Numéro de carte-cadeau';

  @override
  String get ticketPnrLabel => 'Numéro de billet/PNR';

  @override
  String get numberLabel => 'Nombre';

  @override
  String get cardholderNameLabel => 'Nom du titulaire de la carte';

  @override
  String get cardNameLabel => 'Nom de la carte';

  @override
  String get enterValidCardNumberError => 'Entrez un numéro de carte valide';

  @override
  String get cardNumberInvalidError => 'Le numéro de carte semble invalide';

  @override
  String get enterMin3CharsError => 'Entrez au moins 3 caractères';

  @override
  String get cardAlreadyExistsError =>
      'Une carte avec ce numéro est déjà enregistrée';

  @override
  String get revealCvv => 'Révéler le CVV';

  @override
  String get cardDetailsHeader => 'Détails de la carte :';

  @override
  String get typePrefix => 'Taper:';

  @override
  String get bankPrefix => 'Banque:';

  @override
  String get cardNumberPrefix => 'Numéro de carte :';

  @override
  String get cardholderPrefix => 'Titulaire de la carte :';

  @override
  String get expiryPrefix => 'Expiration:';

  @override
  String get notesPrefix => 'Remarques :';

  @override
  String get detailsSuffix => 'Détails';

  @override
  String get cardDetailsTitle => 'Détails de la carte';

  @override
  String get hideBtn => 'Cacher';

  @override
  String get revealBtn => 'Révéler';

  @override
  String get editBtn => 'Modifier';

  @override
  String get cardInformationHeader => 'Informations sur la carte';

  @override
  String get cardholderLabel => 'Titulaire de la carte';

  @override
  String get nameLabel => 'Nom';

  @override
  String get bankLabel => 'Banque';

  @override
  String get pnrNumberLabel => 'Numéro PNR';

  @override
  String get venueLabel => 'Lieu';

  @override
  String get eventDateLabel => 'Date de l\'événement';

  @override
  String get seatLabel => 'Siège';

  @override
  String get classLabel => 'Classe';

  @override
  String get discountDetailsLabel => 'Détails de la réduction';

  @override
  String get memberIdLabel => 'Identifiant du membre';

  @override
  String get tierStatusLabel => 'Statut du niveau';

  @override
  String get pointsBalanceLabel => 'Solde de points';

  @override
  String get secondaryPinLabel => 'Code PIN secondaire';

  @override
  String get issueDateLabel => 'Date d\'émission';

  @override
  String get documentTitleLabel => 'Titre du document';

  @override
  String get nfcReaderTitle => 'Lecteur NFC';

  @override
  String get nfcNotAvailable => 'NFC non disponible';

  @override
  String get nfcUnsupportedDesc =>
      'Cet appareil ne prend pas en charge la lecture des cartes NFC.';

  @override
  String get readyToScan => 'Prêt à numériser';

  @override
  String get holdCardNfcPrompt =>
      'Tenez votre carte sans contact au dos de votre téléphone.';

  @override
  String get scanFailed => 'Échec de l\'analyse';

  @override
  String get somethingWentWrong => 'Quelque chose s\'est mal passé.';

  @override
  String get tryAgainBtn => 'Essayer à nouveau';

  @override
  String get cardDetected => 'Carte détectée';

  @override
  String get unsupportedCardError =>
      'Ce type de carte n\'est pas pris en charge.';

  @override
  String get nfcReadFailedDesc =>
      'Impossible de lire cette carte. Réessayez ou ajoutez-le manuellement.';

  @override
  String nfcReadError(String error) {
    return 'Échec de lecture : $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Impossible de démarrer la session NFC : $error';
  }

  @override
  String get scanCardTitle => 'Scanner la carte';

  @override
  String get noCameraError => 'Aucune caméra disponible sur cet appareil';

  @override
  String cameraStartError(String error) {
    return 'Impossible de démarrer la caméra : $error';
  }

  @override
  String get ocrReadError =>
      'Impossible de lire les détails de la carte. Réessayez avec un meilleur éclairage.';

  @override
  String ocrScanFailed(String error) {
    return 'Échec de l\'analyse : $error';
  }

  @override
  String get cameraPermissionDesc =>
      'L\'autorisation de l\'appareil photo est requise pour numériser une carte.';

  @override
  String get openSettingsBtn => 'Ouvrir les paramètres';

  @override
  String get notDetected => 'Non détecté';

  @override
  String get scanAgainBtn => 'Scanner à nouveau';

  @override
  String get cardPhotosDesc =>
      'Conservez une photo de votre carte pour référence rapide. Les images restent sur cet appareil.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Ajouter une photo $label';
  }

  @override
  String get premiumTitle => 'Prime';

  @override
  String get benefitRemoveAdsTitle => 'Supprimer toutes les annonces';

  @override
  String get benefitRemoveAdsDesc =>
      'Pas de bannières, pas d\'interstitiels, jamais';

  @override
  String get benefitFasterTitle => 'Expérience plus rapide';

  @override
  String get benefitFasterDesc => 'Écrans instantanés sans rien à charger';

  @override
  String get benefitSupportTitle => 'Accompagner le développement';

  @override
  String get benefitSupportDesc =>
      'Contribuez à la croissance de l\'application';

  @override
  String get benefitBadgeTitle => 'Insigne premium';

  @override
  String get benefitBadgeDesc => 'Un petit merci sur votre profil';

  @override
  String get premiumHeroActive => 'Vous êtes Premium';

  @override
  String get premiumHeroInactive => 'Passez sans publicité';

  @override
  String get premiumHeroDescActive => 'Merci de soutenir Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Supprimez les publicités et débloquez une expérience plus propre';

  @override
  String get disablePremiumBtn => 'Désactiver la prime';

  @override
  String get removeAdsBtn => 'Supprimer les publicités';

  @override
  String get premiumOneTimeNotice =>
      'Une fois. Restaure instantanément sur cet appareil.';

  @override
  String get noBiometricsConfigured =>
      'Aucune biométrie/verrouillage de l\'appareil configuré sur cet appareil';

  @override
  String get cardTypeCredit => 'Carte de crédit';

  @override
  String get cardTypeDebit => 'Carte de débit';

  @override
  String get cardTypePoint => 'Carte de points';

  @override
  String get cardTypeMembership => 'Carte de membre';

  @override
  String get cardTypeCoupon => 'Coupon';

  @override
  String get cardTypeGift => 'Carte-cadeau';

  @override
  String get cardTypeEventTicket => 'Billet d\'événement';

  @override
  String get cardTypeOther => 'Autre';

  @override
  String get chooseCardType => 'Choisissez le type de carte';

  @override
  String get selectCustomColor => 'Sélectionnez une couleur personnalisée';

  @override
  String get solidColor => 'Solide';

  @override
  String get gradientColor => 'Pente';

  @override
  String get startColor => 'Commencer';

  @override
  String get endColor => 'Fin';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Maison';

  @override
  String get cardsTab => 'Mes cartes';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Porte-cartes';

  @override
  String get seeAll => 'Tout voir';

  @override
  String get backupShareText =>
      'Sauvegarde sécurisée du portefeuille de cartes';

  @override
  String get backupFileNotFoundError => 'Fichier de sauvegarde introuvable';

  @override
  String get corruptedBackupError =>
      'Fichier de sauvegarde corrompu ou invalide';

  @override
  String get invalidBackupDataError =>
      'Le fichier de sauvegarde ne contient pas de données valides.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Version de sauvegarde non prise en charge : $version';
  }
}
