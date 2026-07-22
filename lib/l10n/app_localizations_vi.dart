// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Ví Thẻ';

  @override
  String get addCard => 'Thêm Thẻ';

  @override
  String get hiThere => 'Xin chào 👋';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get appLock => 'Khóa Ứng dụng';

  @override
  String get appLockSubtitle => 'Yêu cầu sinh trắc học để mở ứng dụng';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get backupRestore => 'Sao lưu & Khôi phục';

  @override
  String get backupRestoreSubtitle => 'Xuất & nhập thẻ của bạn cục bộ';

  @override
  String get clearAllData => 'Xóa Tất cả Dữ liệu';

  @override
  String get goodMorning => 'Chào buổi sáng';

  @override
  String get goodAfternoon => 'Chào buổi chiều';

  @override
  String get goodEvening => 'Chào buổi tối';

  @override
  String hiName(String name) {
    return 'Xin chào, $name 👋';
  }

  @override
  String get addNewCard => 'Thêm Thẻ Mới';

  @override
  String get scan => 'Quét';

  @override
  String get scanDesc => 'Quét thông tin thẻ\nngay lập tức';

  @override
  String get manually => 'Thủ công';

  @override
  String get manuallyDesc => 'Nhập thông tin thẻ\nthủ công';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Chạm thẻ để thêm\nbằng NFC';

  @override
  String get tools => 'Công cụ';

  @override
  String get binChecker => 'Tra cứu BIN';

  @override
  String get binCheckerDesc => 'Kiểm tra thông tin thẻ từ mã BIN';

  @override
  String get cardVerify => 'Xác minh Thẻ';

  @override
  String get cardVerifyDesc => 'Xác thực số thẻ';

  @override
  String get frequentlyAdded => 'Thẻ Thường Dùng';

  @override
  String get cardsTitle => 'Danh sách Thẻ';

  @override
  String get yourCardsManage => 'Quản lý các thẻ của bạn tại đây';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã lưu $count thẻ',
      one: 'Đã lưu 1 thẻ',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thẻ',
      one: '1 thẻ',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Tất cả';

  @override
  String get noCardsYet => 'Chưa có thẻ nào';

  @override
  String get noCardsYetDesc => 'Vào Trang chủ hoặc dùng trình quét để thêm thẻ';

  @override
  String get noCardsCategory => 'Không có thẻ nào trong mục này';

  @override
  String get tryDifferentFilter => 'Hãy thử chọn bộ lọc khác';

  @override
  String get addFirstCardStart => 'Thêm thẻ đầu tiên của bạn để bắt đầu';

  @override
  String get rateUs => 'Đánh giá Ứng dụng';

  @override
  String get rateUsThanks => 'Cảm ơn bạn đã ủng hộ!';

  @override
  String get shareApp => 'Chia sẻ Ứng dụng';

  @override
  String get shareAppSoon => 'Tính năng chia sẻ sắp ra mắt';

  @override
  String get help => 'Trợ giúp';

  @override
  String get supportSoon => 'Hỗ trợ sắp ra mắt';

  @override
  String get privacyPolicy => 'Chính sách Bảo mật';

  @override
  String get privacyPolicySoon => 'Mở chính sách bảo mật';

  @override
  String get termsOfUse => 'Điều khoản Sử dụng';

  @override
  String get termsOfUseSoon => 'Mở điều khoản sử dụng';

  @override
  String get clearDataTitle => 'Xóa tất cả dữ liệu?';

  @override
  String get clearDataDesc =>
      'Hành động này sẽ xóa vĩnh viễn mọi thẻ đã lưu. Không thể hoàn tác.';

  @override
  String get cancel => 'Hủy';

  @override
  String get clearDataConfirm => 'Xóa Dữ liệu';

  @override
  String get clearDataToast => 'Đã xóa toàn bộ dữ liệu';

  @override
  String get splashSubtitle => 'Thẻ của bạn, an toàn & đơn giản';

  @override
  String get unlockPrompt => 'Mở khóa Ví Thẻ để tiếp tục';

  @override
  String get tapToUnlock => 'Nhấn để Mở khóa';

  @override
  String get authFailed => 'Xác thực thất bại';

  @override
  String get binCheckerTitle => 'Tra cứu BIN';

  @override
  String get enterMin6Digits => 'Nhập ít nhất 6 chữ số';

  @override
  String get binNotVerified => 'Không thể xác minh mã BIN này';

  @override
  String get lookupFailed => 'Tra cứu thất bại. Kiểm tra kết nối và thử lại.';

  @override
  String get binLookupPlaceholder => 'TRA CỨU BIN / IIN';

  @override
  String get enterDigitsLabel => 'Nhập 6–8 chữ số đầu tiên';

  @override
  String get checkButton => 'Kiểm tra';

  @override
  String get binResultTitle => 'Kết quả BIN';

  @override
  String get cardNetwork => 'Mạng lưới';

  @override
  String get cardType => 'Loại thẻ';

  @override
  String get cardBrandCategory => 'Thương hiệu/Phân loại';

  @override
  String get cardBank => 'Ngân hàng';

  @override
  String get cardCountry => 'Quốc gia';

  @override
  String get cardCountryCode => 'Mã Quốc gia';

  @override
  String get cardCurrency => 'Tiền tệ';

  @override
  String get cardValid => 'Hợp lệ';

  @override
  String get yes => 'Có';

  @override
  String get no => 'Không';

  @override
  String get cardValidatorTitle => 'Xác minh Thẻ';

  @override
  String get cardValidatorPreviewName => 'XÁC MINH THẺ';

  @override
  String get enterCardNumberLabel => 'Nhập số thẻ';

  @override
  String get validCardNumber => 'Số thẻ hợp lệ';

  @override
  String get invalidCardNumber => 'Số thẻ không hợp lệ — vui lòng kiểm tra lại';

  @override
  String get backupRestoreTitle => 'Sao lưu & Khôi phục';

  @override
  String get createBackupPass => 'Tạo Mật khẩu Sao lưu';

  @override
  String get backupPassWarning =>
      'QUAN TRỌNG: Hãy ghi nhớ mật khẩu này. Chúng tôi không thể khôi phục mật khẩu hoặc dữ liệu của bạn nếu bị quên.';

  @override
  String get enterPassLabel => 'Nhập Mật khẩu';

  @override
  String get confirmPassLabel => 'Xác nhận Mật khẩu';

  @override
  String get passEmptyError => 'Mật khẩu không được để trống';

  @override
  String get passMismatchError => 'Mật khẩu không khớp';

  @override
  String get doneBtn => 'Hoàn thành';

  @override
  String get enterBackupPass => 'Nhập Mật khẩu Sao lưu';

  @override
  String get noCardsToBackup => 'Không có thẻ để sao lưu';

  @override
  String get backupSuccess => 'Tạo bản sao lưu thành công!';

  @override
  String backupFailed(String error) {
    return 'Sao lưu thất bại: $error';
  }

  @override
  String get restoreBackupTitle => 'Khôi phục bản sao lưu?';

  @override
  String get restoreBackupWarning =>
      'CẢNH BÁO: Khôi phục sao lưu sẽ ghi đè lên toàn bộ thẻ hiện tại. Không thể hoàn tác.';

  @override
  String get continueBtn => 'Tiếp tục';

  @override
  String get restoreSuccess => 'Khôi phục bản sao lưu thành công!';

  @override
  String get incorrectPasswordError => 'Sai mật khẩu hoặc tệp sao lưu bị hỏng.';

  @override
  String restoreFailed(String error) {
    return 'Khôi phục thất bại: $error';
  }

  @override
  String get deleteBackupTitle => 'Xóa bản sao lưu?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Xóa \"$name\"? Hành động này không thể hoàn tác.';
  }

  @override
  String get deleteBtn => 'Xóa';

  @override
  String get backupDeleted => 'Đã xóa bản sao lưu';

  @override
  String failedShareBackup(String error) {
    return 'Không thể chia sẻ bản sao lưu: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Không thể chọn tệp: $error';
  }

  @override
  String get lastBackup => 'Sao lưu Gần nhất';

  @override
  String get neverBackedUp => 'Chưa từng sao lưu';

  @override
  String get backupType => 'Loại Sao lưu';

  @override
  String get localBackupDesc => 'Cục bộ — chỉ lưu trên thiết bị này';

  @override
  String get createBackupBtn => 'Tạo Bản Sao lưu';

  @override
  String get importExternalBackupBtn => 'Nhập Bản Sao lưu Ngoại';

  @override
  String get savedBackupsHeader => 'Bản Sao lưu Đã lưu';

  @override
  String get noBackupsYet => 'Chưa có bản sao lưu nào';

  @override
  String get tapCreateBackupDesc =>
      'Nhấn \"Tạo Bản Sao lưu\" để lưu các thẻ của bạn';

  @override
  String get restoreTooltip => 'Khôi phục';

  @override
  String get shareTooltip => 'Chia sẻ';

  @override
  String get cardNotFound => 'Không tìm thấy thẻ';

  @override
  String get editCardTitle => 'Chỉnh sửa Thẻ';

  @override
  String get addCardTitle => 'Thêm Thẻ';

  @override
  String get cardTypeLabel => 'Loại thẻ';

  @override
  String get cardColorLabel => 'Màu thẻ';

  @override
  String get fieldRequiredError => 'Trường này là bắt buộc';

  @override
  String get bankNameLabel => 'Tên Ngân hàng';

  @override
  String get expiryLabel => 'Hạn dùng (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Ảnh chụp Thẻ';

  @override
  String get frontSideLabel => 'Mặt trước';

  @override
  String get backSideLabel => 'Mặt sau';

  @override
  String get notesLabel => 'Ghi chú';

  @override
  String get saveChangesBtn => 'Lưu Thay đổi';

  @override
  String get saveCardBtn => 'Lưu Thẻ';

  @override
  String get deleteCardBtn => 'Xóa thẻ';

  @override
  String get takePhotoLabel => 'Chụp ảnh';

  @override
  String get chooseGalleryLabel => 'Chọn từ thư viện';

  @override
  String get deleteCardPrompt => 'Xóa thẻ này?';

  @override
  String get deleteCardWarning => 'Hành động này không thể hoàn tác.';

  @override
  String get cardNumberLabel => 'Số thẻ';

  @override
  String get pointCardNumberLabel => 'Số thẻ tích điểm';

  @override
  String get membershipIdLabel => 'Mã thành viên';

  @override
  String get couponCodeLabel => 'Mã giảm giá';

  @override
  String get giftCardNumberLabel => 'Số thẻ quà tặng';

  @override
  String get ticketPnrLabel => 'Mã Vé / PNR';

  @override
  String get numberLabel => 'Số';

  @override
  String get cardholderNameLabel => 'Tên chủ thẻ';

  @override
  String get cardNameLabel => 'Tên thẻ';

  @override
  String get enterValidCardNumberError => 'Nhập số thẻ hợp lệ';

  @override
  String get cardNumberInvalidError => 'Số thẻ có vẻ không đúng';

  @override
  String get enterMin3CharsError => 'Nhập ít nhất 3 ký tự';

  @override
  String get cardAlreadyExistsError => 'Thẻ với số này đã được lưu trước đó';

  @override
  String get revealCvv => 'Hiện CVV';

  @override
  String get cardDetailsHeader => 'Chi tiết Thẻ:';

  @override
  String get typePrefix => 'Loại: ';

  @override
  String get bankPrefix => 'Ngân hàng: ';

  @override
  String get cardNumberPrefix => 'Số thẻ: ';

  @override
  String get cardholderPrefix => 'Chủ thẻ: ';

  @override
  String get expiryPrefix => 'Hạn dùng: ';

  @override
  String get notesPrefix => 'Ghi chú: ';

  @override
  String get detailsSuffix => ' Chi tiết';

  @override
  String get cardDetailsTitle => 'Chi tiết Thẻ';

  @override
  String get hideBtn => 'Ẩn';

  @override
  String get revealBtn => 'Hiện';

  @override
  String get editBtn => 'Sửa';

  @override
  String get cardInformationHeader => 'Thông tin Thẻ';

  @override
  String get cardholderLabel => 'Chủ thẻ';

  @override
  String get nameLabel => 'Tên';

  @override
  String get bankLabel => 'Ngân hàng';

  @override
  String get pnrNumberLabel => 'Số PNR';

  @override
  String get venueLabel => 'Địa điểm';

  @override
  String get eventDateLabel => 'Ngày sự kiện';

  @override
  String get seatLabel => 'Ghế';

  @override
  String get classLabel => 'Hạng';

  @override
  String get discountDetailsLabel => 'Chi tiết Giảm giá';

  @override
  String get memberIdLabel => 'ID Thành viên';

  @override
  String get tierStatusLabel => 'Hạng thành viên';

  @override
  String get pointsBalanceLabel => 'Điểm tích lũy';

  @override
  String get secondaryPinLabel => 'Mã PIN phụ';

  @override
  String get issueDateLabel => 'Ngày cấp';

  @override
  String get documentTitleLabel => 'Tên tài liệu';

  @override
  String get nfcReaderTitle => 'Đọc thẻ NFC';

  @override
  String get nfcNotAvailable => 'NFC không khả dụng';

  @override
  String get nfcUnsupportedDesc => 'Thiết bị này không hỗ trợ đọc thẻ qua NFC.';

  @override
  String get readyToScan => 'Sẵn sàng Quét';

  @override
  String get holdCardNfcPrompt =>
      'Chạm thẻ không tiếp xúc vào mặt sau điện thoại.';

  @override
  String get scanFailed => 'Quét Thất bại';

  @override
  String get somethingWentWrong => 'Đã xảy ra lỗi.';

  @override
  String get tryAgainBtn => 'Thử lại';

  @override
  String get cardDetected => 'Đã phát hiện thẻ';

  @override
  String get unsupportedCardError => 'Loại thẻ này không được hỗ trợ.';

  @override
  String get nfcReadFailedDesc =>
      'Không thể đọc thẻ này. Thử lại hoặc thêm thủ công.';

  @override
  String nfcReadError(String error) {
    return 'Đọc thất bại: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Không thể bắt đầu phiên NFC: $error';
  }

  @override
  String get scanCardTitle => 'Quét Thẻ';

  @override
  String get noCameraError => 'Không có camera trên thiết bị này';

  @override
  String cameraStartError(String error) {
    return 'Không thể mở camera: $error';
  }

  @override
  String get ocrReadError =>
      'Không thể đọc thông tin thẻ. Hãy thử nơi có ánh sáng tốt hơn.';

  @override
  String ocrScanFailed(String error) {
    return 'Quét thất bại: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Cần có quyền truy cập camera để quét thẻ.';

  @override
  String get openSettingsBtn => 'Mở Cài đặt';

  @override
  String get notDetected => 'Chưa nhận diện';

  @override
  String get scanAgainBtn => 'Quét lại';

  @override
  String get cardPhotosDesc =>
      'Lưu ảnh chụp thẻ để tham khảo nhanh. Hình ảnh chỉ lưu trên thiết bị này.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Thêm ảnh $label';
  }

  @override
  String get premiumTitle => 'Gói Premium';

  @override
  String get benefitRemoveAdsTitle => 'Xóa toàn bộ quảng cáo';

  @override
  String get benefitRemoveAdsDesc => 'Không có quảng cáo biểu ngữ hay xen kẽ';

  @override
  String get benefitFasterTitle => 'Trải nghiệm nhanh hơn';

  @override
  String get benefitFasterDesc => 'Màn hình tức thì không phải chờ tải';

  @override
  String get benefitSupportTitle => 'Ủng hộ phát triển';

  @override
  String get benefitSupportDesc => 'Giúp ứng dụng phát triển hoàn thiện hơn';

  @override
  String get benefitBadgeTitle => 'Huy hiệu Premium';

  @override
  String get benefitBadgeDesc => 'Huy hiệu cảm ơn trên hồ sơ của bạn';

  @override
  String get premiumHeroActive => 'Bạn đang dùng Premium';

  @override
  String get premiumHeroInactive => 'Trải nghiệm Không Quảng cáo';

  @override
  String get premiumHeroDescActive => 'Cảm ơn bạn đã ủng hộ Ví Thẻ';

  @override
  String get premiumHeroDescInactive =>
      'Xóa quảng cáo và tận hưởng trải nghiệm mượt mà';

  @override
  String get disablePremiumBtn => 'Tắt Gói Premium';

  @override
  String get removeAdsBtn => 'Xóa Quảng cáo';

  @override
  String get premiumOneTimeNotice =>
      'Mua một lần. Khôi phục tức thì trên thiết bị này.';

  @override
  String get noBiometricsConfigured =>
      'Chưa thiết lập sinh trắc học hoặc khóa màn hình trên thiết bị';

  @override
  String get cardTypeCredit => 'Thẻ Tín dụng';

  @override
  String get cardTypeDebit => 'Thẻ Ghi nợ';

  @override
  String get cardTypePoint => 'Thẻ Tích điểm';

  @override
  String get cardTypeMembership => 'Thẻ Thành viên';

  @override
  String get cardTypeCoupon => 'Thẻ Giảm giá';

  @override
  String get cardTypeGift => 'Thẻ Quà tặng';

  @override
  String get cardTypeEventTicket => 'Vé Sự kiện';

  @override
  String get cardTypeOther => 'Thẻ Khác';

  @override
  String get chooseCardType => 'Chọn loại thẻ';

  @override
  String get selectCustomColor => 'Chọn Màu Tùy chỉnh';

  @override
  String get solidColor => 'Màu đơn';

  @override
  String get gradientColor => 'Màu chuyển';

  @override
  String get startColor => 'Bắt đầu';

  @override
  String get endColor => 'Kết thúc';

  @override
  String get cardExpLabel => 'HẠN DÙNG';

  @override
  String get homeTab => 'Trang chủ';

  @override
  String get cardsTab => 'Thẻ của tôi';

  @override
  String get profileTab => 'Hồ sơ';

  @override
  String get appTitleTypewriter => 'Ví Thẻ';

  @override
  String get seeAll => 'Xem Tất cả';

  @override
  String get backupShareText => 'Bản Sao lưu An toàn Ví Thẻ';

  @override
  String get backupFileNotFoundError => 'Không tìm thấy tệp sao lưu';

  @override
  String get corruptedBackupError => 'Tệp sao lưu bị hỏng hoặc không hợp lệ';

  @override
  String get invalidBackupDataError => 'Tệp sao lưu không chứa dữ liệu hợp lệ.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Phiên bản sao lưu không được hỗ trợ: $version';
  }
}
