// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Apl Dompet Kad';

  @override
  String get addCard => 'Tambah Kad';

  @override
  String get hiThere => 'Hai, ada 👋';

  @override
  String get settingsTitle => 'tetapan';

  @override
  String get appLock => 'Kunci Apl';

  @override
  String get appLockSubtitle => 'Memerlukan biometrik untuk membuka apl';

  @override
  String get language => 'Bahasa';

  @override
  String get backupRestore => 'Sandaran & Pulihkan';

  @override
  String get backupRestoreSubtitle =>
      'Eksport & import kad anda secara tempatan';

  @override
  String get clearAllData => 'Kosongkan Semua Data';

  @override
  String get goodMorning => 'selamat pagi';

  @override
  String get goodAfternoon => 'selamat petang';

  @override
  String get goodEvening => 'selamat petang';

  @override
  String hiName(String name) {
    return 'Hai, $name 👋';
  }

  @override
  String get addNewCard => 'Tambah Kad Baharu';

  @override
  String get scan => 'Imbas';

  @override
  String get scanDesc => 'Imbas butiran kad\nserta merta';

  @override
  String get manually => 'Secara manual';

  @override
  String get manuallyDesc => 'Masukkan butiran kad\nsecara manual';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Ketik kad untuk menambah\nmenggunakan NFC';

  @override
  String get tools => 'Alatan';

  @override
  String get binChecker => 'Pemeriksa BIN';

  @override
  String get binCheckerDesc => 'Semak butiran kad dari BIN';

  @override
  String get cardVerify => 'Pengesahan Kad';

  @override
  String get cardVerifyDesc => 'Sahkan nombor kad';

  @override
  String get frequentlyAdded => 'Kerap Ditambah';

  @override
  String get cardsTitle => 'Kad';

  @override
  String get yourCardsManage => 'Kad anda di sini untuk diurus';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kad $count disimpan',
      one: '1 kad disimpan',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'kad $count',
      one: '1 kad',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Semua';

  @override
  String get noCardsYet => 'Tiada kad lagi';

  @override
  String get noCardsYetDesc =>
      'Pergi ke Laman Utama atau ketik pengimbas untuk menambah kad';

  @override
  String get noCardsCategory => 'Tiada kad dalam kategori ini';

  @override
  String get tryDifferentFilter => 'Cuba pilih penapis lain';

  @override
  String get addFirstCardStart => 'Tambahkan kad pertama anda untuk bermula';

  @override
  String get rateUs => 'Nilaikan Kami';

  @override
  String get rateUsThanks => 'Terima kasih atas sokongan!';

  @override
  String get shareApp => 'Kongsi Apl';

  @override
  String get shareAppSoon => 'Perkongsian akan datang tidak lama lagi';

  @override
  String get help => 'Tolong';

  @override
  String get supportSoon => 'Sokongan akan datang tidak lama lagi';

  @override
  String get privacyPolicy => 'Dasar Privasi';

  @override
  String get privacyPolicySoon => 'Membuka dasar privasi';

  @override
  String get termsOfUse => 'Syarat Penggunaan';

  @override
  String get termsOfUseSoon => 'Membuka syarat penggunaan';

  @override
  String get clearDataTitle => 'Kosongkan semua data?';

  @override
  String get clearDataDesc =>
      'Ini memadamkan setiap kad yang disimpan secara kekal. Ini tidak boleh dibuat asal.';

  @override
  String get cancel => 'Batal';

  @override
  String get clearDataConfirm => 'Kosongkan Data';

  @override
  String get clearDataToast => 'Semua data dikosongkan';

  @override
  String get splashSubtitle => 'Kad anda, selamat & ringkas';

  @override
  String get unlockPrompt => 'Buka kunci Dompet Kad untuk meneruskan';

  @override
  String get tapToUnlock => 'Ketik untuk Buka Kunci';

  @override
  String get authFailed => 'Pengesahan gagal';

  @override
  String get binCheckerTitle => 'Pemeriksa BIN';

  @override
  String get enterMin6Digits => 'Masukkan sekurang-kurangnya 6 digit';

  @override
  String get binNotVerified => 'BIN ini tidak dapat disahkan';

  @override
  String get lookupFailed =>
      'Carian gagal. Semak sambungan anda dan cuba lagi.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN LOOKUP';

  @override
  String get enterDigitsLabel => 'Masukkan 6–8 digit pertama';

  @override
  String get checkButton => 'Semak';

  @override
  String get binResultTitle => 'Keputusan BIN';

  @override
  String get cardNetwork => 'Rangkaian';

  @override
  String get cardType => 'taip';

  @override
  String get cardBrandCategory => 'Jenama/Kategori';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Negara';

  @override
  String get cardCountryCode => 'Kod Negara';

  @override
  String get cardCurrency => 'mata wang';

  @override
  String get cardValid => 'sah';

  @override
  String get yes => 'ya';

  @override
  String get no => 'Tidak';

  @override
  String get cardValidatorTitle => 'Pengesah Kad';

  @override
  String get cardValidatorPreviewName => 'PENGESAH KAD';

  @override
  String get enterCardNumberLabel => 'Masukkan nombor kad';

  @override
  String get validCardNumber => 'Nombor kad yang sah';

  @override
  String get invalidCardNumber => 'Nombor kad tidak sah — semak digit';

  @override
  String get backupRestoreTitle => 'Sandaran & Pulihkan';

  @override
  String get createBackupPass => 'Cipta Kata Laluan Sandaran';

  @override
  String get backupPassWarning =>
      'PENTING: Tulis kata laluan ini. Kami tidak dapat memulihkannya atau memulihkan sandaran anda jika anda melupakannya.';

  @override
  String get enterPassLabel => 'Masukkan Kata Laluan';

  @override
  String get confirmPassLabel => 'Sahkan Kata Laluan';

  @override
  String get passEmptyError => 'Kata laluan tidak boleh kosong';

  @override
  String get passMismatchError => 'Kata laluan tidak sepadan';

  @override
  String get doneBtn => 'Selesai';

  @override
  String get enterBackupPass => 'Masukkan Kata Laluan Sandaran';

  @override
  String get noCardsToBackup => 'Tiada kad untuk disandarkan';

  @override
  String get backupSuccess => 'Sandaran berjaya dibuat!';

  @override
  String backupFailed(String error) {
    return 'Sandaran gagal: $error';
  }

  @override
  String get restoreBackupTitle => 'Pulihkan sandaran?';

  @override
  String get restoreBackupWarning =>
      'AMARAN: Memulihkan sandaran akan menimpa semua kad dan transaksi semasa. Ini tidak boleh dibuat asal.';

  @override
  String get continueBtn => 'teruskan';

  @override
  String get restoreSuccess => 'Sandaran berjaya dipulihkan!';

  @override
  String get incorrectPasswordError =>
      'Kata laluan yang salah atau fail sandaran yang rosak.';

  @override
  String restoreFailed(String error) {
    return 'Pemulihan gagal: $error';
  }

  @override
  String get deleteBackupTitle => 'Padamkan sandaran?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Padamkan \"$name\"? Ini tidak boleh dibuat asal.';
  }

  @override
  String get deleteBtn => 'Padam';

  @override
  String get backupDeleted => 'Sandaran dipadamkan';

  @override
  String failedShareBackup(String error) {
    return 'Gagal berkongsi sandaran: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Gagal memilih fail: $error';
  }

  @override
  String get lastBackup => 'Sandaran Terakhir';

  @override
  String get neverBackedUp => 'Tidak pernah disandarkan';

  @override
  String get backupType => 'Jenis Sandaran';

  @override
  String get localBackupDesc => 'Setempat — disimpan pada peranti ini sahaja';

  @override
  String get createBackupBtn => 'Buat Sandaran';

  @override
  String get importExternalBackupBtn => 'Import Sandaran Luaran';

  @override
  String get savedBackupsHeader => 'Sandaran Disimpan';

  @override
  String get noBackupsYet => 'Tiada sandaran lagi';

  @override
  String get tapCreateBackupDesc =>
      'Ketik \"Buat Sandaran\" untuk menyimpan kad anda';

  @override
  String get restoreTooltip => 'Pulihkan';

  @override
  String get shareTooltip => 'Kongsi';

  @override
  String get cardNotFound => 'Kad tidak ditemui';

  @override
  String get editCardTitle => 'Edit Kad';

  @override
  String get addCardTitle => 'Tambah Kad';

  @override
  String get cardTypeLabel => 'Jenis kad';

  @override
  String get cardColorLabel => 'Warna kad';

  @override
  String get fieldRequiredError => 'Medan ini diperlukan';

  @override
  String get bankNameLabel => 'Nama Bank';

  @override
  String get expiryLabel => 'Tamat tempoh (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Foto Kad';

  @override
  String get frontSideLabel => 'Bahagian Depan';

  @override
  String get backSideLabel => 'Bahagian Belakang';

  @override
  String get notesLabel => 'Nota';

  @override
  String get saveChangesBtn => 'Simpan Perubahan';

  @override
  String get saveCardBtn => 'Simpan Kad';

  @override
  String get deleteCardBtn => 'Padamkan kad';

  @override
  String get takePhotoLabel => 'Ambil gambar';

  @override
  String get chooseGalleryLabel => 'Pilih daripada galeri';

  @override
  String get deleteCardPrompt => 'Padamkan kad?';

  @override
  String get deleteCardWarning => 'Tindakan ini tidak boleh dibuat asal.';

  @override
  String get cardNumberLabel => 'Nombor Kad';

  @override
  String get pointCardNumberLabel => 'Nombor Kad Mata';

  @override
  String get membershipIdLabel => 'ID keahlian';

  @override
  String get couponCodeLabel => 'Kod Kupon';

  @override
  String get giftCardNumberLabel => 'Nombor Kad Hadiah';

  @override
  String get ticketPnrLabel => 'Nombor Tiket / PNR';

  @override
  String get numberLabel => 'Nombor';

  @override
  String get cardholderNameLabel => 'Nama Pemegang Kad';

  @override
  String get cardNameLabel => 'Nama Kad';

  @override
  String get enterValidCardNumberError => 'Masukkan nombor kad yang sah';

  @override
  String get cardNumberInvalidError => 'Nombor kad kelihatan tidak sah';

  @override
  String get enterMin3CharsError => 'Masukkan sekurang-kurangnya 3 aksara';

  @override
  String get cardAlreadyExistsError => 'Kad dengan nombor ini telah disimpan';

  @override
  String get revealCvv => 'Dedahkan CVV';

  @override
  String get cardDetailsHeader => 'Butiran Kad:';

  @override
  String get typePrefix => 'Jenis:';

  @override
  String get bankPrefix => 'Bank:';

  @override
  String get cardNumberPrefix => 'Nombor Kad:';

  @override
  String get cardholderPrefix => 'Pemegang kad:';

  @override
  String get expiryPrefix => 'tamat tempoh:';

  @override
  String get notesPrefix => 'Nota:';

  @override
  String get detailsSuffix => 'Butiran';

  @override
  String get cardDetailsTitle => 'Butiran Kad';

  @override
  String get hideBtn => 'Sembunyi';

  @override
  String get revealBtn => 'Dedahkan';

  @override
  String get editBtn => 'Sunting';

  @override
  String get cardInformationHeader => 'Maklumat Kad';

  @override
  String get cardholderLabel => 'Pemegang kad';

  @override
  String get nameLabel => 'Nama';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'Nombor PNR';

  @override
  String get venueLabel => 'Tempat';

  @override
  String get eventDateLabel => 'Tarikh Peristiwa';

  @override
  String get seatLabel => 'tempat duduk';

  @override
  String get classLabel => 'Kelas';

  @override
  String get discountDetailsLabel => 'Butiran Diskaun';

  @override
  String get memberIdLabel => 'ID ahli';

  @override
  String get tierStatusLabel => 'Status Peringkat';

  @override
  String get pointsBalanceLabel => 'Baki Mata';

  @override
  String get secondaryPinLabel => 'PIN kedua';

  @override
  String get issueDateLabel => 'Tarikh Keluaran';

  @override
  String get documentTitleLabel => 'Tajuk Dokumen';

  @override
  String get nfcReaderTitle => 'Pembaca NFC';

  @override
  String get nfcNotAvailable => 'NFC tidak tersedia';

  @override
  String get nfcUnsupportedDesc =>
      'Peranti ini tidak menyokong bacaan kad NFC.';

  @override
  String get readyToScan => 'Sedia untuk Mengimbas';

  @override
  String get holdCardNfcPrompt =>
      'Pegang kad tanpa sentuh anda di belakang telefon anda.';

  @override
  String get scanFailed => 'Imbasan Gagal';

  @override
  String get somethingWentWrong => 'Sesuatu telah berlaku.';

  @override
  String get tryAgainBtn => 'Cuba Lagi';

  @override
  String get cardDetected => 'Kad Dikesan';

  @override
  String get unsupportedCardError => 'Jenis kad ini tidak disokong.';

  @override
  String get nfcReadFailedDesc =>
      'Tidak dapat membaca kad ini. Cuba lagi atau tambah secara manual.';

  @override
  String nfcReadError(String error) {
    return 'Bacaan gagal: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Tidak dapat memulakan sesi NFC: $error';
  }

  @override
  String get scanCardTitle => 'Kad Imbasan';

  @override
  String get noCameraError => 'Tiada kamera tersedia pada peranti ini';

  @override
  String cameraStartError(String error) {
    return 'Tidak dapat memulakan kamera: $error';
  }

  @override
  String get ocrReadError =>
      'Tidak dapat membaca butiran kad. Cuba lagi dengan pencahayaan yang lebih baik.';

  @override
  String ocrScanFailed(String error) {
    return 'Imbasan gagal: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Kebenaran kamera diperlukan untuk mengimbas kad.';

  @override
  String get openSettingsBtn => 'Buka Tetapan';

  @override
  String get notDetected => 'Tidak dikesan';

  @override
  String get scanAgainBtn => 'Imbas Lagi';

  @override
  String get cardPhotosDesc =>
      'Simpan foto kad anda untuk rujukan pantas. Imej kekal pada peranti ini.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Tambahkan foto $label';
  }

  @override
  String get premiumTitle => 'Premium';

  @override
  String get benefitRemoveAdsTitle => 'Alih keluar semua iklan';

  @override
  String get benefitRemoveAdsDesc =>
      'Tiada sepanduk, tiada interstisial, pernah';

  @override
  String get benefitFasterTitle => 'Pengalaman yang lebih pantas';

  @override
  String get benefitFasterDesc => 'Skrin segera tanpa apa-apa untuk dimuatkan';

  @override
  String get benefitSupportTitle => 'Menyokong pembangunan';

  @override
  String get benefitSupportDesc => 'Bantu apl terus berkembang';

  @override
  String get benefitBadgeTitle => 'Lencana premium';

  @override
  String get benefitBadgeDesc => 'Sedikit terima kasih pada profil anda';

  @override
  String get premiumHeroActive => 'Anda Premium';

  @override
  String get premiumHeroInactive => 'Pergi Tanpa Iklan';

  @override
  String get premiumHeroDescActive =>
      'Terima kasih kerana menyokong Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Alih keluar iklan dan buka kunci pengalaman yang lebih bersih';

  @override
  String get disablePremiumBtn => 'Lumpuhkan Premium';

  @override
  String get removeAdsBtn => 'Alih Keluar Iklan';

  @override
  String get premiumOneTimeNotice =>
      'Sekali. Dipulihkan serta-merta pada peranti ini.';

  @override
  String get noBiometricsConfigured =>
      'Tiada biometrik/kunci peranti dikonfigurasikan pada peranti ini';

  @override
  String get cardTypeCredit => 'Kad Kredit';

  @override
  String get cardTypeDebit => 'Kad Debit';

  @override
  String get cardTypePoint => 'Kad Mata';

  @override
  String get cardTypeMembership => 'Kad Keahlian';

  @override
  String get cardTypeCoupon => 'kupon';

  @override
  String get cardTypeGift => 'Kad Hadiah';

  @override
  String get cardTypeEventTicket => 'Tiket Acara';

  @override
  String get cardTypeOther => 'Lain-lain';

  @override
  String get chooseCardType => 'Pilih jenis kad';

  @override
  String get selectCustomColor => 'Pilih Warna Tersuai';

  @override
  String get solidColor => 'Padat';

  @override
  String get gradientColor => 'Kecerunan';

  @override
  String get startColor => 'Mulakan';

  @override
  String get endColor => 'tamat';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Rumah';

  @override
  String get cardsTab => 'Kad Saya';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Dompet Kad';

  @override
  String get seeAll => 'Lihat Semua';

  @override
  String get backupShareText => 'Sandaran Selamat Dompet Kad';

  @override
  String get backupFileNotFoundError => 'Fail sandaran tidak ditemui';

  @override
  String get corruptedBackupError => 'Fail sandaran rosak atau tidak sah';

  @override
  String get invalidBackupDataError =>
      'Fail sandaran tidak mengandungi data yang sah.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Versi sandaran tidak disokong: $version';
  }
}
