// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Kart Cüzdanı';

  @override
  String get addCard => 'Kart Ekle';

  @override
  String get hiThere => 'Merhaba 👋';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get appLock => 'Uygulama Kilidi';

  @override
  String get appLockSubtitle =>
      'Uygulamayı açmak için biyometrik kimlik gerektir';

  @override
  String get language => 'Dil';

  @override
  String get backupRestore => 'Yedekle ve Geri Yükle';

  @override
  String get backupRestoreSubtitle =>
      'Kartlarınızı yerel olarak dışa/içe aktarın';

  @override
  String get clearAllData => 'Tüm Verileri Temizle';

  @override
  String get goodMorning => 'Günaydın';

  @override
  String get goodAfternoon => 'Tünaydın';

  @override
  String get goodEvening => 'İyi akşamlar';

  @override
  String hiName(String name) {
    return 'Merhaba, $name 👋';
  }

  @override
  String get addNewCard => 'Yeni Kart Ekle';

  @override
  String get scan => 'Tara';

  @override
  String get scanDesc => 'Kart detaylarını anında\ntarayın';

  @override
  String get manually => 'Manuel';

  @override
  String get manuallyDesc => 'Kart bilgilerini elle\ngirin';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'NFC ile eklemek için\nkartı dokundurun';

  @override
  String get tools => 'Araçlar';

  @override
  String get binChecker => 'BIN Sorgulama';

  @override
  String get binCheckerDesc => 'BIN numarasından kart detaylarını kontrol edin';

  @override
  String get cardVerify => 'Kart Doğrulama';

  @override
  String get cardVerifyDesc => 'Kart numarasını doğrulayın';

  @override
  String get frequentlyAdded => 'Sık Eklenenler';

  @override
  String get cardsTitle => 'Kartlar';

  @override
  String get yourCardsManage => 'Yöneteceğiniz kartlarınız burada';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kart kayıtlı',
      one: '1 kart kayıtlı',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kart',
      one: '1 kart',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Tümü';

  @override
  String get noCardsYet => 'Henüz kart yok';

  @override
  String get noCardsYetDesc =>
      'Kart eklemek için Ana Sayfaya gidin veya tarayıcıyı kullanın';

  @override
  String get noCardsCategory => 'Bu kategoride kart bulunamadı';

  @override
  String get tryDifferentFilter => 'Farklı bir filtre seçmeyi deneyin';

  @override
  String get addFirstCardStart => 'Başlamak için ilk kartınızı ekleyin';

  @override
  String get rateUs => 'Bizi Değerlendirin';

  @override
  String get rateUsThanks => 'Desteğiniz için teşekkürler!';

  @override
  String get shareApp => 'Uygulamayı Paylaş';

  @override
  String get shareAppSoon => 'Paylaşım özelliği çok yakında';

  @override
  String get help => 'Yardım';

  @override
  String get supportSoon => 'Destek çok yakında';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get privacyPolicySoon => 'Gizlilik politikasını açar';

  @override
  String get termsOfUse => 'Kullanım Koşulları';

  @override
  String get termsOfUseSoon => 'Kullanım koşullarını açar';

  @override
  String get clearDataTitle => 'Tüm veriler silinsin mi?';

  @override
  String get clearDataDesc =>
      'Bu işlem kaydedilen tüm kartları kalıcı olarak siler. Geri alınamaz.';

  @override
  String get cancel => 'İptal';

  @override
  String get clearDataConfirm => 'Verileri Temizle';

  @override
  String get clearDataToast => 'Tüm veriler temizlendi';

  @override
  String get splashSubtitle => 'Kartlarınız, güvenli ve basit';

  @override
  String get unlockPrompt => 'Devam etmek için Kart Cüzdanı\'nın kilidini açın';

  @override
  String get tapToUnlock => 'Kilidi Açmak İçin Dokunun';

  @override
  String get authFailed => 'Kimlik doğrulama başarısız';

  @override
  String get binCheckerTitle => 'BIN Sorgulama';

  @override
  String get enterMin6Digits => 'En az 6 hane girin';

  @override
  String get binNotVerified => 'Bu BIN doğrulanamadı';

  @override
  String get lookupFailed =>
      'Sorgulama başarısız. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN SORGULAMA';

  @override
  String get enterDigitsLabel => 'İlk 6–8 haneyi girin';

  @override
  String get checkButton => 'Kontrol Et';

  @override
  String get binResultTitle => 'BIN Sonucu';

  @override
  String get cardNetwork => 'Ağ';

  @override
  String get cardType => 'Tür';

  @override
  String get cardBrandCategory => 'Marka/Kategori';

  @override
  String get cardBank => 'Banka';

  @override
  String get cardCountry => 'Ülke';

  @override
  String get cardCountryCode => 'Ülke Kodu';

  @override
  String get cardCurrency => 'Para Birimi';

  @override
  String get cardValid => 'Geçerli';

  @override
  String get yes => 'Evet';

  @override
  String get no => 'Hayır';

  @override
  String get cardValidatorTitle => 'Kart Doğrulayıcı';

  @override
  String get cardValidatorPreviewName => 'KART DOĞRULAYICI';

  @override
  String get enterCardNumberLabel => 'Kart numarasını girin';

  @override
  String get validCardNumber => 'Geçerli kart numarası';

  @override
  String get invalidCardNumber =>
      'Geçersiz kart numarası — haneleri kontrol edin';

  @override
  String get backupRestoreTitle => 'Yedekle ve Geri Yükle';

  @override
  String get createBackupPass => 'Yedekleme Şifresi Oluştur';

  @override
  String get backupPassWarning =>
      'ÖNEMLİ: Bu şifreyi bir yere not edin. Şifreyi unutursanız verilerinizi geri yükleyemeyiz.';

  @override
  String get enterPassLabel => 'Şifreyi Girin';

  @override
  String get confirmPassLabel => 'Şifreyi Onaylayın';

  @override
  String get passEmptyError => 'Şifre boş olamaz';

  @override
  String get passMismatchError => 'Şifreler eşleşmiyor';

  @override
  String get doneBtn => 'Tamam';

  @override
  String get enterBackupPass => 'Yedek Şifresini Girin';

  @override
  String get noCardsToBackup => 'Yedeklenecek kart yok';

  @override
  String get backupSuccess => 'Yedekleme başarıyla oluşturuldu!';

  @override
  String backupFailed(String error) {
    return 'Yedekleme başarısız: $error';
  }

  @override
  String get restoreBackupTitle => 'Yedek geri yüklensin mi?';

  @override
  String get restoreBackupWarning =>
      'UYARI: Yedeği geri yüklemek mevcut tüm kartların üzerine yazar. Geri alınamaz.';

  @override
  String get continueBtn => 'Devam Et';

  @override
  String get restoreSuccess => 'Yedek başarıyla geri yüklendi!';

  @override
  String get incorrectPasswordError => 'Yanlış şifre veya bozuk yedek dosyası.';

  @override
  String restoreFailed(String error) {
    return 'Geri yükleme başarısız: $error';
  }

  @override
  String get deleteBackupTitle => 'Yedek silinsin mi?';

  @override
  String deleteBackupConfirmText(String name) {
    return '\"$name\" silinsin mi? Bu işlem geri alınamaz.';
  }

  @override
  String get deleteBtn => 'Sil';

  @override
  String get backupDeleted => 'Yedek silindi';

  @override
  String failedShareBackup(String error) {
    return 'Yedek paylaşılamadı: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Dosya seçilemedi: $error';
  }

  @override
  String get lastBackup => 'Son Yedekleme';

  @override
  String get neverBackedUp => 'Hiç yedeklenmedi';

  @override
  String get backupType => 'Yedekleme Türü';

  @override
  String get localBackupDesc => 'Yerel — yalnızca bu cihazda saklanır';

  @override
  String get createBackupBtn => 'Yedek Oluştur';

  @override
  String get importExternalBackupBtn => 'Harici Yedek İçe Aktar';

  @override
  String get savedBackupsHeader => 'Kaydedilen Yedekler';

  @override
  String get noBackupsYet => 'Henüz yedek yok';

  @override
  String get tapCreateBackupDesc =>
      'Kartlarınızı kaydetmek için \"Yedek Oluştur\"a dokunun';

  @override
  String get restoreTooltip => 'Geri Yükle';

  @override
  String get shareTooltip => 'Paylaş';

  @override
  String get cardNotFound => 'Kart bulunamadı';

  @override
  String get editCardTitle => 'Kartı Düzenle';

  @override
  String get addCardTitle => 'Kart Ekle';

  @override
  String get cardTypeLabel => 'Kart türü';

  @override
  String get cardColorLabel => 'Kart rengi';

  @override
  String get fieldRequiredError => 'Bu alan zorunludur';

  @override
  String get bankNameLabel => 'Banka Adı';

  @override
  String get expiryLabel => 'Son Kullanma (AA/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Kart Fotoğrafları';

  @override
  String get frontSideLabel => 'Ön Yüz';

  @override
  String get backSideLabel => 'Arka Yüz';

  @override
  String get notesLabel => 'Notlar';

  @override
  String get saveChangesBtn => 'Değişiklikleri Kaydet';

  @override
  String get saveCardBtn => 'Kartı Kaydet';

  @override
  String get deleteCardBtn => 'Kartı Sil';

  @override
  String get takePhotoLabel => 'Fotoğraf Çek';

  @override
  String get chooseGalleryLabel => 'Galeriden Seç';

  @override
  String get deleteCardPrompt => 'Kart silinsin mi?';

  @override
  String get deleteCardWarning => 'Bu işlem geri alınamaz.';

  @override
  String get cardNumberLabel => 'Kart Numarası';

  @override
  String get pointCardNumberLabel => 'Puan Kartı Numarası';

  @override
  String get membershipIdLabel => 'Üyelik Kimliği';

  @override
  String get couponCodeLabel => 'Kupon Kodu';

  @override
  String get giftCardNumberLabel => 'Hediye Kartı Numarası';

  @override
  String get ticketPnrLabel => 'Bilet / PNR Numarası';

  @override
  String get numberLabel => 'Numara';

  @override
  String get cardholderNameLabel => 'Kart Sahibinin Adı';

  @override
  String get cardNameLabel => 'Kart Adı';

  @override
  String get enterValidCardNumberError => 'Geçerli bir kart numarası girin';

  @override
  String get cardNumberInvalidError => 'Kart numarası geçersiz görünüyor';

  @override
  String get enterMin3CharsError => 'En az 3 karakter girin';

  @override
  String get cardAlreadyExistsError =>
      'Bu numaraya sahip bir kart zaten kayıtlı';

  @override
  String get revealCvv => 'CVV Göster';

  @override
  String get cardDetailsHeader => 'Kart Detayları:';

  @override
  String get typePrefix => 'Tür: ';

  @override
  String get bankPrefix => 'Banka: ';

  @override
  String get cardNumberPrefix => 'Kart No: ';

  @override
  String get cardholderPrefix => 'Kart Sahibi: ';

  @override
  String get expiryPrefix => 'SKT: ';

  @override
  String get notesPrefix => 'Notlar: ';

  @override
  String get detailsSuffix => ' Detayları';

  @override
  String get cardDetailsTitle => 'Kart Detayları';

  @override
  String get hideBtn => 'Gizle';

  @override
  String get revealBtn => 'Göster';

  @override
  String get editBtn => 'Düzenle';

  @override
  String get cardInformationHeader => 'Kart Bilgileri';

  @override
  String get cardholderLabel => 'Kart Sahibi';

  @override
  String get nameLabel => 'Ad';

  @override
  String get bankLabel => 'Banka';

  @override
  String get pnrNumberLabel => 'PNR Numarası';

  @override
  String get venueLabel => 'Mekan';

  @override
  String get eventDateLabel => 'Etkinlik Tarihi';

  @override
  String get seatLabel => 'Koltuk';

  @override
  String get classLabel => 'Sınıf';

  @override
  String get discountDetailsLabel => 'İndirim Detayları';

  @override
  String get memberIdLabel => 'Üye Kimliği';

  @override
  String get tierStatusLabel => 'Seviye Durumu';

  @override
  String get pointsBalanceLabel => 'Puan Bakiyesi';

  @override
  String get secondaryPinLabel => 'İkincil PIN';

  @override
  String get issueDateLabel => 'Düzenleme Tarihi';

  @override
  String get documentTitleLabel => 'Belge Başlığı';

  @override
  String get nfcReaderTitle => 'NFC Okuyucu';

  @override
  String get nfcNotAvailable => 'NFC mevcut değil';

  @override
  String get nfcUnsupportedDesc => 'Bu cihaz NFC kart okumayı desteklemiyor.';

  @override
  String get readyToScan => 'Taramaya Hazır';

  @override
  String get holdCardNfcPrompt =>
      'Temassız kartınızı telefonunuzun arkasına yaklaştırın.';

  @override
  String get scanFailed => 'Tarama Başarısız';

  @override
  String get somethingWentWrong => 'Bir şeyler yanlış gitti.';

  @override
  String get tryAgainBtn => 'Tekrar Dene';

  @override
  String get cardDetected => 'Kart Algılandı';

  @override
  String get unsupportedCardError => 'Bu kart türü desteklenmiyor.';

  @override
  String get nfcReadFailedDesc =>
      'Bu kart okunamadı. Tekrar deneyin veya manuel ekleyin.';

  @override
  String nfcReadError(String error) {
    return 'Okuma başarısız: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'NFC oturumu başlatılamadı: $error';
  }

  @override
  String get scanCardTitle => 'Kartı Tara';

  @override
  String get noCameraError => 'Bu cihazda kamera bulunmuyor';

  @override
  String cameraStartError(String error) {
    return 'Kamera başlatılamadı: $error';
  }

  @override
  String get ocrReadError =>
      'Kart detayları okunamadı. Daha iyi ışıkta tekrar deneyin.';

  @override
  String ocrScanFailed(String error) {
    return 'Tarama başarısız: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Kart taramak için kamera izni gereklidir.';

  @override
  String get openSettingsBtn => 'Ayarları Aç';

  @override
  String get notDetected => 'Algılanmadı';

  @override
  String get scanAgainBtn => 'Tekrar Tara';

  @override
  String get cardPhotosDesc =>
      'Hızlı başvuru için kartınızın fotoğrafını saklayın. Görseller bu cihazda kalır.';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label fotoğrafı ekle';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get benefitRemoveAdsTitle => 'Tüm reklamları kaldır';

  @override
  String get benefitRemoveAdsDesc => 'Araya giren reklamlar yok';

  @override
  String get benefitFasterTitle => 'Daha hızlı deneyim';

  @override
  String get benefitFasterDesc => 'Yükleme beklemeden anında ekranlar';

  @override
  String get benefitSupportTitle => 'Geliştirmeyi destekleyin';

  @override
  String get benefitSupportDesc => 'Uygulamanın büyümesine yardımcı olun';

  @override
  String get benefitBadgeTitle => 'Premium rozeti';

  @override
  String get benefitBadgeDesc => 'Profilinizde özel teşekkür rozeti';

  @override
  String get premiumHeroActive => 'Premium Üyesiniz';

  @override
  String get premiumHeroInactive => 'Reklamsız Kullanın';

  @override
  String get premiumHeroDescActive =>
      'Kart Cüzdanı\'nı desteklediğiniz için teşekkürler';

  @override
  String get premiumHeroDescInactive =>
      'Reklamları kaldırın ve daha temiz bir deneyim yaşayın';

  @override
  String get disablePremiumBtn => 'Premium\'u Devre Dışı Bırak';

  @override
  String get removeAdsBtn => 'Reklamları Kaldır';

  @override
  String get premiumOneTimeNotice =>
      'Tek seferlik. Bu cihazda anında geri yüklenir.';

  @override
  String get noBiometricsConfigured =>
      'Bu cihazda biyometrik/ekran kilidi ayarlanmamış';

  @override
  String get cardTypeCredit => 'Kredi Kartı';

  @override
  String get cardTypeDebit => 'Banka Kartı';

  @override
  String get cardTypePoint => 'Puan Kartı';

  @override
  String get cardTypeMembership => 'Üyelik Kartı';

  @override
  String get cardTypeCoupon => 'Kupon';

  @override
  String get cardTypeGift => 'Hediye Kartı';

  @override
  String get cardTypeEventTicket => 'Etkinlik Biletı';

  @override
  String get cardTypeOther => 'Diğer';

  @override
  String get chooseCardType => 'Kart türünü seçin';

  @override
  String get selectCustomColor => 'Özel Renk Seçin';

  @override
  String get solidColor => 'Düz';

  @override
  String get gradientColor => 'Degrade';

  @override
  String get startColor => 'Başlangıç';

  @override
  String get endColor => 'Bitiş';

  @override
  String get cardExpLabel => 'SKT';

  @override
  String get homeTab => 'Ana Sayfa';

  @override
  String get cardsTab => 'Kartlarım';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Kart Cüzdanı';

  @override
  String get seeAll => 'Tümünü Gör';

  @override
  String get backupShareText => 'Kart Cüzdanı Güvenli Yedek';

  @override
  String get backupFileNotFoundError => 'Yedek dosyası bulunamadı';

  @override
  String get corruptedBackupError => 'Bozuk veya geçersiz yedek dosyası';

  @override
  String get invalidBackupDataError => 'Yedek dosyası geçerli veri içermiyor.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Desteklenmeyen yedek sürümü: $version';
  }
}
