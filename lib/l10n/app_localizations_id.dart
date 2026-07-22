// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Aplikasi Dompet Kartu';

  @override
  String get addCard => 'Tambahkan Kartu';

  @override
  String get hiThere => 'Hai, itu 👋';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get appLock => 'Kunci Aplikasi';

  @override
  String get appLockSubtitle => 'Memerlukan biometrik untuk membuka aplikasi';

  @override
  String get language => 'Bahasa';

  @override
  String get backupRestore => 'Cadangkan & Pulihkan';

  @override
  String get backupRestoreSubtitle => 'Ekspor & impor kartu Anda secara lokal';

  @override
  String get clearAllData => 'Hapus Semua Data';

  @override
  String get goodMorning => 'Selamat pagi';

  @override
  String get goodAfternoon => 'Selamat siang';

  @override
  String get goodEvening => 'Selamat malam';

  @override
  String hiName(String name) {
    return 'Hai, $name 👋';
  }

  @override
  String get addNewCard => 'Tambahkan Kartu Baru';

  @override
  String get scan => 'Pindai';

  @override
  String get scanDesc => 'Pindai detail kartu\nsecara instan';

  @override
  String get manually => 'Secara manual';

  @override
  String get manuallyDesc => 'Masukkan detail kartu\nsecara manual';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Ketuk kartu untuk menambahkan\nmenggunakan NFC';

  @override
  String get tools => 'Peralatan';

  @override
  String get binChecker => 'Pemeriksa BIN';

  @override
  String get binCheckerDesc => 'Periksa detail kartu dari BIN';

  @override
  String get cardVerify => 'Verifikasi Kartu';

  @override
  String get cardVerifyDesc => 'Validasi nomor kartu';

  @override
  String get frequentlyAdded => 'Sering Ditambahkan';

  @override
  String get cardsTitle => 'Kartu-kartu';

  @override
  String get yourCardsManage => 'Kartu Anda ada di sini untuk dikelola';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Kartu $count disimpan',
      one: '1 kartu disimpan',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'kartu $count',
      one: '1 kartu',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Semua';

  @override
  String get noCardsYet => 'Belum ada kartu';

  @override
  String get noCardsYetDesc =>
      'Buka Beranda atau ketuk pemindai untuk menambahkan kartu';

  @override
  String get noCardsCategory => 'Tidak ada kartu dalam kategori ini';

  @override
  String get tryDifferentFilter => 'Coba pilih filter lain';

  @override
  String get addFirstCardStart => 'Tambahkan kartu pertama Anda untuk memulai';

  @override
  String get rateUs => 'Nilai Kami';

  @override
  String get rateUsThanks => 'Terima kasih atas dukungannya!';

  @override
  String get shareApp => 'Bagikan Aplikasi';

  @override
  String get shareAppSoon => 'Berbagi segera hadir';

  @override
  String get help => 'Membantu';

  @override
  String get supportSoon => 'Dukungan segera hadir';

  @override
  String get privacyPolicy => 'Kebijakan Privasi';

  @override
  String get privacyPolicySoon => 'Membuka kebijakan privasi';

  @override
  String get termsOfUse => 'Ketentuan Penggunaan';

  @override
  String get termsOfUseSoon => 'Membuka ketentuan penggunaan';

  @override
  String get clearDataTitle => 'Hapus semua data?';

  @override
  String get clearDataDesc =>
      'Tindakan ini akan menghapus secara permanen setiap kartu yang disimpan. Hal ini tidak dapat dibatalkan.';

  @override
  String get cancel => 'Membatalkan';

  @override
  String get clearDataConfirm => 'Hapus Data';

  @override
  String get clearDataToast => 'Semua data dihapus';

  @override
  String get splashSubtitle => 'Kartu Anda, aman & sederhana';

  @override
  String get unlockPrompt => 'Buka kunci Dompet Kartu untuk melanjutkan';

  @override
  String get tapToUnlock => 'Ketuk untuk Membuka Kunci';

  @override
  String get authFailed => 'Otentikasi gagal';

  @override
  String get binCheckerTitle => 'Pemeriksa BIN';

  @override
  String get enterMin6Digits => 'Masukkan minimal 6 digit';

  @override
  String get binNotVerified => 'BIN ini tidak dapat diverifikasi';

  @override
  String get lookupFailed =>
      'Pencarian gagal. Periksa koneksi Anda dan coba lagi.';

  @override
  String get binLookupPlaceholder => 'PENCARIAN BIN / IIN';

  @override
  String get enterDigitsLabel => 'Masukkan 6–8 digit pertama';

  @override
  String get checkButton => 'Memeriksa';

  @override
  String get binResultTitle => 'Hasil BIN';

  @override
  String get cardNetwork => 'Jaringan';

  @override
  String get cardType => 'Jenis';

  @override
  String get cardBrandCategory => 'Merek/Kategori';

  @override
  String get cardBank => 'Bank';

  @override
  String get cardCountry => 'Negara';

  @override
  String get cardCountryCode => 'Kode negara';

  @override
  String get cardCurrency => 'Mata uang';

  @override
  String get cardValid => 'Sah';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'TIDAK';

  @override
  String get cardValidatorTitle => 'Validator Kartu';

  @override
  String get cardValidatorPreviewName => 'VALIDATOR KARTU';

  @override
  String get enterCardNumberLabel => 'Masukkan nomor kartu';

  @override
  String get validCardNumber => 'Nomor kartu yang valid';

  @override
  String get invalidCardNumber => 'Nomor kartu tidak valid — periksa digitnya';

  @override
  String get backupRestoreTitle => 'Cadangkan & Pulihkan';

  @override
  String get createBackupPass => 'Buat Kata Sandi Cadangan';

  @override
  String get backupPassWarning =>
      'PENTING: Catat kata sandi ini. Kami tidak dapat memulihkannya atau memulihkan cadangan Anda jika Anda lupa.';

  @override
  String get enterPassLabel => 'Masukkan Kata Sandi';

  @override
  String get confirmPassLabel => 'Konfirmasi Kata Sandi';

  @override
  String get passEmptyError => 'Kata sandi tidak boleh kosong';

  @override
  String get passMismatchError => 'Kata sandi tidak cocok';

  @override
  String get doneBtn => 'Selesai';

  @override
  String get enterBackupPass => 'Masukkan Kata Sandi Cadangan';

  @override
  String get noCardsToBackup => 'Tidak ada kartu untuk dicadangkan';

  @override
  String get backupSuccess => 'Cadangan berhasil dibuat!';

  @override
  String backupFailed(String error) {
    return 'Pencadangan gagal: $error';
  }

  @override
  String get restoreBackupTitle => 'Pulihkan cadangan?';

  @override
  String get restoreBackupWarning =>
      'PERINGATAN: Memulihkan cadangan akan menimpa semua kartu dan transaksi saat ini. Hal ini tidak dapat dibatalkan.';

  @override
  String get continueBtn => 'Melanjutkan';

  @override
  String get restoreSuccess => 'Cadangan berhasil dipulihkan!';

  @override
  String get incorrectPasswordError =>
      'Kata sandi salah atau file cadangan rusak.';

  @override
  String restoreFailed(String error) {
    return 'Pemulihan gagal: $error';
  }

  @override
  String get deleteBackupTitle => 'Hapus cadangan?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Hapus \"$name\"? Hal ini tidak dapat dibatalkan.';
  }

  @override
  String get deleteBtn => 'Menghapus';

  @override
  String get backupDeleted => 'Cadangan dihapus';

  @override
  String failedShareBackup(String error) {
    return 'Gagal membagikan cadangan: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Gagal memilih file: $error';
  }

  @override
  String get lastBackup => 'Cadangan Terakhir';

  @override
  String get neverBackedUp => 'Tidak pernah membuat cadangan';

  @override
  String get backupType => 'Jenis Cadangan';

  @override
  String get localBackupDesc => 'Lokal — hanya disimpan di perangkat ini';

  @override
  String get createBackupBtn => 'Buat Cadangan';

  @override
  String get importExternalBackupBtn => 'Impor Cadangan Eksternal';

  @override
  String get savedBackupsHeader => 'Cadangan Tersimpan';

  @override
  String get noBackupsYet => 'Belum ada cadangan';

  @override
  String get tapCreateBackupDesc =>
      'Ketuk \"Buat Cadangan\" untuk menyimpan kartu Anda';

  @override
  String get restoreTooltip => 'Memulihkan';

  @override
  String get shareTooltip => 'Membagikan';

  @override
  String get cardNotFound => 'Kartu tidak ditemukan';

  @override
  String get editCardTitle => 'Sunting Kartu';

  @override
  String get addCardTitle => 'Tambahkan Kartu';

  @override
  String get cardTypeLabel => 'Jenis kartu';

  @override
  String get cardColorLabel => 'Warna kartu';

  @override
  String get fieldRequiredError => 'Bidang ini wajib diisi';

  @override
  String get bankNameLabel => 'Nama Bank';

  @override
  String get expiryLabel => 'Kedaluwarsa (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Foto Kartu';

  @override
  String get frontSideLabel => 'Sisi Depan';

  @override
  String get backSideLabel => 'Sisi Belakang';

  @override
  String get notesLabel => 'Catatan';

  @override
  String get saveChangesBtn => 'Simpan Perubahan';

  @override
  String get saveCardBtn => 'Simpan Kartu';

  @override
  String get deleteCardBtn => 'Hapus kartu';

  @override
  String get takePhotoLabel => 'Ambil foto';

  @override
  String get chooseGalleryLabel => 'Pilih dari galeri';

  @override
  String get deleteCardPrompt => 'Hapus kartu?';

  @override
  String get deleteCardWarning => 'Tindakan ini tidak dapat dibatalkan.';

  @override
  String get cardNumberLabel => 'Nomor Kartu';

  @override
  String get pointCardNumberLabel => 'Nomor Kartu Poin';

  @override
  String get membershipIdLabel => 'ID keanggotaan';

  @override
  String get couponCodeLabel => 'Kode Kupon';

  @override
  String get giftCardNumberLabel => 'Nomor Kartu Hadiah';

  @override
  String get ticketPnrLabel => 'Nomor Tiket/PNR';

  @override
  String get numberLabel => 'Nomor';

  @override
  String get cardholderNameLabel => 'Nama Pemegang Kartu';

  @override
  String get cardNameLabel => 'Nama Kartu';

  @override
  String get enterValidCardNumberError => 'Masukkan nomor kartu yang valid';

  @override
  String get cardNumberInvalidError => 'Nomor kartu sepertinya tidak valid';

  @override
  String get enterMin3CharsError => 'Masukkan minimal 3 karakter';

  @override
  String get cardAlreadyExistsError => 'Kartu dengan nomor ini sudah disimpan';

  @override
  String get revealCvv => 'Mengungkapkan CVV';

  @override
  String get cardDetailsHeader => 'Detail Kartu:';

  @override
  String get typePrefix => 'Jenis:';

  @override
  String get bankPrefix => 'Bank:';

  @override
  String get cardNumberPrefix => 'Nomor Kartu:';

  @override
  String get cardholderPrefix => 'Pemegang kartu:';

  @override
  String get expiryPrefix => 'Kedaluwarsa:';

  @override
  String get notesPrefix => 'Catatan:';

  @override
  String get detailsSuffix => 'Detail';

  @override
  String get cardDetailsTitle => 'Detail Kartu';

  @override
  String get hideBtn => 'Bersembunyi';

  @override
  String get revealBtn => 'Mengungkap';

  @override
  String get editBtn => 'Sunting';

  @override
  String get cardInformationHeader => 'Informasi Kartu';

  @override
  String get cardholderLabel => 'Pemegang kartu';

  @override
  String get nameLabel => 'Nama';

  @override
  String get bankLabel => 'Bank';

  @override
  String get pnrNumberLabel => 'Nomor PNR';

  @override
  String get venueLabel => 'Lokasi';

  @override
  String get eventDateLabel => 'Tanggal Acara';

  @override
  String get seatLabel => 'Kursi';

  @override
  String get classLabel => 'Kelas';

  @override
  String get discountDetailsLabel => 'Detail Diskon';

  @override
  String get memberIdLabel => 'ID anggota';

  @override
  String get tierStatusLabel => 'Status Tingkat';

  @override
  String get pointsBalanceLabel => 'Saldo Poin';

  @override
  String get secondaryPinLabel => 'PIN sekunder';

  @override
  String get issueDateLabel => 'Tanggal Penerbitan';

  @override
  String get documentTitleLabel => 'Judul Dokumen';

  @override
  String get nfcReaderTitle => 'Pembaca NFC';

  @override
  String get nfcNotAvailable => 'NFC tidak tersedia';

  @override
  String get nfcUnsupportedDesc =>
      'Perangkat ini tidak mendukung pembacaan kartu NFC.';

  @override
  String get readyToScan => 'Siap Memindai';

  @override
  String get holdCardNfcPrompt =>
      'Pegang kartu nirsentuh Anda di bagian belakang ponsel Anda.';

  @override
  String get scanFailed => 'Pemindaian Gagal';

  @override
  String get somethingWentWrong => 'Ada yang tidak beres.';

  @override
  String get tryAgainBtn => 'Coba Lagi';

  @override
  String get cardDetected => 'Kartu Terdeteksi';

  @override
  String get unsupportedCardError => 'Jenis kartu ini tidak didukung.';

  @override
  String get nfcReadFailedDesc =>
      'Tidak dapat membaca kartu ini. Coba lagi atau tambahkan secara manual.';

  @override
  String nfcReadError(String error) {
    return 'Gagal membaca: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Tidak dapat memulai sesi NFC: $error';
  }

  @override
  String get scanCardTitle => 'Pindai Kartu';

  @override
  String get noCameraError => 'Tidak ada kamera yang tersedia di perangkat ini';

  @override
  String cameraStartError(String error) {
    return 'Tidak dapat memulai kamera: $error';
  }

  @override
  String get ocrReadError =>
      'Tidak dapat membaca detail kartu. Coba lagi dengan pencahayaan yang lebih baik.';

  @override
  String ocrScanFailed(String error) {
    return 'Pemindaian gagal: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Izin kamera diperlukan untuk memindai kartu.';

  @override
  String get openSettingsBtn => 'Buka Pengaturan';

  @override
  String get notDetected => 'Tidak terdeteksi';

  @override
  String get scanAgainBtn => 'Pindai Lagi';

  @override
  String get cardPhotosDesc =>
      'Simpan foto kartu Anda untuk referensi cepat. Gambar tetap ada di perangkat ini.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Tambahkan foto $label';
  }

  @override
  String get premiumTitle => 'Premi';

  @override
  String get benefitRemoveAdsTitle => 'Hapus semua iklan';

  @override
  String get benefitRemoveAdsDesc =>
      'Tidak ada spanduk, tidak ada interstisial';

  @override
  String get benefitFasterTitle => 'Pengalaman lebih cepat';

  @override
  String get benefitFasterDesc => 'Layar instan tanpa memuat apa pun';

  @override
  String get benefitSupportTitle => 'Mendukung pengembangan';

  @override
  String get benefitSupportDesc => 'Membantu menjaga aplikasi terus berkembang';

  @override
  String get benefitBadgeTitle => 'Lencana premium';

  @override
  String get benefitBadgeDesc => 'Sedikit terima kasih di profil Anda';

  @override
  String get premiumHeroActive => 'Anda Premium';

  @override
  String get premiumHeroInactive => 'Bebas Iklan';

  @override
  String get premiumHeroDescActive =>
      'Terima kasih telah mendukung Dompet Kartu';

  @override
  String get premiumHeroDescInactive =>
      'Hapus iklan dan dapatkan pengalaman yang lebih bersih';

  @override
  String get disablePremiumBtn => 'Nonaktifkan Premium';

  @override
  String get removeAdsBtn => 'Hapus Iklan';

  @override
  String get premiumOneTimeNotice =>
      'Satu kali. Memulihkan secara instan di perangkat ini.';

  @override
  String get noBiometricsConfigured =>
      'Tidak ada biometrik/kunci perangkat yang dikonfigurasi pada perangkat ini';

  @override
  String get cardTypeCredit => 'Kartu kredit';

  @override
  String get cardTypeDebit => 'Kartu Debit';

  @override
  String get cardTypePoint => 'Kartu Poin';

  @override
  String get cardTypeMembership => 'Kartu Keanggotaan';

  @override
  String get cardTypeCoupon => 'Kupon';

  @override
  String get cardTypeGift => 'Kartu Hadiah';

  @override
  String get cardTypeEventTicket => 'Tiket Acara';

  @override
  String get cardTypeOther => 'Lainnya';

  @override
  String get chooseCardType => 'Pilih jenis kartu';

  @override
  String get selectCustomColor => 'Pilih Warna Kustom';

  @override
  String get solidColor => 'Padat';

  @override
  String get gradientColor => 'Gradien';

  @override
  String get startColor => 'Awal';

  @override
  String get endColor => 'Akhir';

  @override
  String get cardExpLabel => 'pengalaman';

  @override
  String get homeTab => 'Rumah';

  @override
  String get cardsTab => 'Kartu saya';

  @override
  String get profileTab => 'Profil';

  @override
  String get appTitleTypewriter => 'Dompet Kartu';

  @override
  String get seeAll => 'Lihat Semua';

  @override
  String get backupShareText => 'Cadangan Aman Dompet Kartu';

  @override
  String get backupFileNotFoundError => 'File cadangan tidak ditemukan';

  @override
  String get corruptedBackupError => 'File cadangan rusak atau tidak valid';

  @override
  String get invalidBackupDataError =>
      'File cadangan tidak berisi data yang valid.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Versi cadangan tidak didukung: $version';
  }
}
