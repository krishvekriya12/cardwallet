// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '카드 지갑 앱';

  @override
  String get addCard => '카드 추가';

  @override
  String get hiThere => '안녕하세요 👋';

  @override
  String get settingsTitle => '설정';

  @override
  String get appLock => '앱 잠금';

  @override
  String get appLockSubtitle => '앱을 열려면 생체 인식이 필요합니다.';

  @override
  String get language => '언어';

  @override
  String get backupRestore => '백업 및 복원';

  @override
  String get backupRestoreSubtitle => '로컬로 카드 내보내기 및 가져오기';

  @override
  String get clearAllData => '모든 데이터 지우기';

  @override
  String get goodMorning => '좋은 아침이에요';

  @override
  String get goodAfternoon => '좋은 오후에요';

  @override
  String get goodEvening => '좋은 저녁이에요';

  @override
  String hiName(String name) {
    return '안녕하세요, $name 👋';
  }

  @override
  String get addNewCard => '새 카드 추가';

  @override
  String get scan => '주사';

  @override
  String get scanDesc => '카드 세부정보 스캔\n즉시';

  @override
  String get manually => '수동으로';

  @override
  String get manuallyDesc => '카드 세부정보 입력\n수동으로';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => '추가하려면 카드를 탭하세요.\nNFC를 사용하여';

  @override
  String get tools => '도구';

  @override
  String get binChecker => '빈 검사기';

  @override
  String get binCheckerDesc => 'BIN에서 카드 세부정보 확인';

  @override
  String get cardVerify => '카드 확인';

  @override
  String get cardVerifyDesc => '카드번호 확인';

  @override
  String get frequentlyAdded => '자주 추가됨';

  @override
  String get cardsTitle => '카드';

  @override
  String get yourCardsManage => '여기에서 관리할 카드';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 카드가 저장되었습니다.',
      one: '카드 1개 저장됨',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 카드',
      one: '카드 1장',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => '모두';

  @override
  String get noCardsYet => '아직 카드가 없습니다.';

  @override
  String get noCardsYetDesc => '카드를 추가하려면 홈으로 이동하거나 스캐너를 탭하세요.';

  @override
  String get noCardsCategory => '이 카테고리에는 카드가 없습니다.';

  @override
  String get tryDifferentFilter => '다른 필터를 선택해 보세요.';

  @override
  String get addFirstCardStart => '시작하려면 첫 번째 카드를 추가하세요.';

  @override
  String get rateUs => '우리를 평가해 주세요';

  @override
  String get rateUsThanks => '지원해 주셔서 감사합니다!';

  @override
  String get shareApp => '앱 공유';

  @override
  String get shareAppSoon => '곧 공유 예정';

  @override
  String get help => '돕다';

  @override
  String get supportSoon => '곧 지원 예정';

  @override
  String get privacyPolicy => '개인 정보 보호 정책';

  @override
  String get privacyPolicySoon => '개인 정보 보호 정책을 엽니다';

  @override
  String get termsOfUse => '이용약관';

  @override
  String get termsOfUseSoon => '이용약관을 엽니다';

  @override
  String get clearDataTitle => '모든 데이터를 삭제하시겠습니까?';

  @override
  String get clearDataDesc =>
      '이렇게 하면 저장된 모든 카드가 영구적으로 삭제됩니다. 이 작업은 취소할 수 없습니다.';

  @override
  String get cancel => '취소';

  @override
  String get clearDataConfirm => '데이터 지우기';

  @override
  String get clearDataToast => '모든 데이터가 삭제되었습니다.';

  @override
  String get splashSubtitle => '안전하고 간편한 카드';

  @override
  String get unlockPrompt => '계속하려면 카드 지갑을 잠금 해제하세요.';

  @override
  String get tapToUnlock => '탭하여 잠금 해제';

  @override
  String get authFailed => '인증 실패';

  @override
  String get binCheckerTitle => '빈 검사기';

  @override
  String get enterMin6Digits => '6자리 이상 입력하세요.';

  @override
  String get binNotVerified => '이 BIN을 확인할 수 없습니다.';

  @override
  String get lookupFailed => '조회에 실패했습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get binLookupPlaceholder => 'BIN / IIN 조회';

  @override
  String get enterDigitsLabel => '처음 6~8자리를 입력하세요.';

  @override
  String get checkButton => '확인하다';

  @override
  String get binResultTitle => 'BIN 결과';

  @override
  String get cardNetwork => '회로망';

  @override
  String get cardType => '유형';

  @override
  String get cardBrandCategory => '브랜드/카테고리';

  @override
  String get cardBank => '은행';

  @override
  String get cardCountry => '국가';

  @override
  String get cardCountryCode => '국가 코드';

  @override
  String get cardCurrency => '통화';

  @override
  String get cardValid => '유효한';

  @override
  String get yes => '예';

  @override
  String get no => '아니요';

  @override
  String get cardValidatorTitle => '카드 유효성 검사기';

  @override
  String get cardValidatorPreviewName => '카드 검증기';

  @override
  String get enterCardNumberLabel => '카드번호 입력';

  @override
  String get validCardNumber => '유효한 카드번호';

  @override
  String get invalidCardNumber => '잘못된 카드번호 — 숫자를 확인하세요';

  @override
  String get backupRestoreTitle => '백업 및 복원';

  @override
  String get createBackupPass => '백업 비밀번호 생성';

  @override
  String get backupPassWarning =>
      '중요: 이 비밀번호를 적어 두십시오. 잊어버린 경우 복구하거나 백업을 복원할 수 없습니다.';

  @override
  String get enterPassLabel => '비밀번호 입력';

  @override
  String get confirmPassLabel => '비밀번호 확인';

  @override
  String get passEmptyError => '비밀번호는 비워둘 수 없습니다.';

  @override
  String get passMismatchError => '비밀번호가 일치하지 않습니다.';

  @override
  String get doneBtn => '완료';

  @override
  String get enterBackupPass => '백업 비밀번호를 입력하세요';

  @override
  String get noCardsToBackup => '백업할 카드가 없습니다.';

  @override
  String get backupSuccess => '백업이 성공적으로 생성되었습니다!';

  @override
  String backupFailed(String error) {
    return '백업 실패: $error';
  }

  @override
  String get restoreBackupTitle => '백업을 복원하시겠습니까?';

  @override
  String get restoreBackupWarning =>
      '경고: 백업을 복원하면 현재의 모든 카드와 거래를 덮어쓰게 됩니다. 이 작업은 취소할 수 없습니다.';

  @override
  String get continueBtn => '계속하다';

  @override
  String get restoreSuccess => '백업이 성공적으로 복원되었습니다!';

  @override
  String get incorrectPasswordError => '비밀번호가 잘못되었거나 백업 파일이 손상되었습니다.';

  @override
  String restoreFailed(String error) {
    return '복원 실패: $error';
  }

  @override
  String get deleteBackupTitle => '백업을 삭제하시겠습니까?';

  @override
  String deleteBackupConfirmText(String name) {
    return '\'$name\'을 삭제하시겠습니까? 이 작업은 취소할 수 없습니다.';
  }

  @override
  String get deleteBtn => '삭제';

  @override
  String get backupDeleted => '백업이 삭제되었습니다.';

  @override
  String failedShareBackup(String error) {
    return '백업 공유 실패: $error';
  }

  @override
  String failedPickFile(String error) {
    return '파일을 선택하지 못했습니다: $error';
  }

  @override
  String get lastBackup => '마지막 백업';

  @override
  String get neverBackedUp => '백업되지 않음';

  @override
  String get backupType => '백업 유형';

  @override
  String get localBackupDesc => '로컬 — 이 장치에만 저장됩니다.';

  @override
  String get createBackupBtn => '백업 생성';

  @override
  String get importExternalBackupBtn => '외부 백업 가져오기';

  @override
  String get savedBackupsHeader => '저장된 백업';

  @override
  String get noBackupsYet => '아직 백업이 없습니다.';

  @override
  String get tapCreateBackupDesc => '카드를 저장하려면 \"백업 만들기\"를 탭하세요.';

  @override
  String get restoreTooltip => '복원하다';

  @override
  String get shareTooltip => '공유하다';

  @override
  String get cardNotFound => '카드를 찾을 수 없습니다';

  @override
  String get editCardTitle => '카드 편집';

  @override
  String get addCardTitle => '카드 추가';

  @override
  String get cardTypeLabel => '카드 종류';

  @override
  String get cardColorLabel => '카드 색상';

  @override
  String get fieldRequiredError => '이 필드는 필수입니다';

  @override
  String get bankNameLabel => '은행명';

  @override
  String get expiryLabel => '만료(MM/YY)';

  @override
  String get cvvLabel => '이력서';

  @override
  String get cardPhotosLabel => '카드 사진';

  @override
  String get frontSideLabel => '정면';

  @override
  String get backSideLabel => '후면';

  @override
  String get notesLabel => '메모';

  @override
  String get saveChangesBtn => '변경 사항 저장';

  @override
  String get saveCardBtn => '카드 저장';

  @override
  String get deleteCardBtn => '카드 삭제';

  @override
  String get takePhotoLabel => '사진을 찍으세요';

  @override
  String get chooseGalleryLabel => '갤러리에서 선택';

  @override
  String get deleteCardPrompt => '카드를 삭제하시겠습니까?';

  @override
  String get deleteCardWarning => '이 작업은 취소할 수 없습니다.';

  @override
  String get cardNumberLabel => '카드번호';

  @override
  String get pointCardNumberLabel => '포인트 카드 번호';

  @override
  String get membershipIdLabel => '회원 아이디';

  @override
  String get couponCodeLabel => '쿠폰 코드';

  @override
  String get giftCardNumberLabel => '기프트 카드 번호';

  @override
  String get ticketPnrLabel => '항공권/PNR 번호';

  @override
  String get numberLabel => '숫자';

  @override
  String get cardholderNameLabel => '카드 소지자 이름';

  @override
  String get cardNameLabel => '카드 이름';

  @override
  String get enterValidCardNumberError => '유효한 카드번호를 입력하세요.';

  @override
  String get cardNumberInvalidError => '카드번호가 잘못된 것 같습니다';

  @override
  String get enterMin3CharsError => '3자 이상 입력하세요.';

  @override
  String get cardAlreadyExistsError => '이 번호의 카드가 이미 저장되어 있습니다.';

  @override
  String get revealCvv => '이력서 공개';

  @override
  String get cardDetailsHeader => '카드 세부정보:';

  @override
  String get typePrefix => '유형:';

  @override
  String get bankPrefix => '은행:';

  @override
  String get cardNumberPrefix => '카드 번호:';

  @override
  String get cardholderPrefix => '카드 소지자:';

  @override
  String get expiryPrefix => '만료:';

  @override
  String get notesPrefix => '참고:';

  @override
  String get detailsSuffix => '세부';

  @override
  String get cardDetailsTitle => '카드 세부정보';

  @override
  String get hideBtn => '숨다';

  @override
  String get revealBtn => '드러내다';

  @override
  String get editBtn => '편집하다';

  @override
  String get cardInformationHeader => '카드정보';

  @override
  String get cardholderLabel => '카드홀더';

  @override
  String get nameLabel => '이름';

  @override
  String get bankLabel => '은행';

  @override
  String get pnrNumberLabel => 'PNR 번호';

  @override
  String get venueLabel => '장소';

  @override
  String get eventDateLabel => '이벤트 날짜';

  @override
  String get seatLabel => '좌석';

  @override
  String get classLabel => '수업';

  @override
  String get discountDetailsLabel => '할인내역';

  @override
  String get memberIdLabel => '회원아이디';

  @override
  String get tierStatusLabel => '등급 상태';

  @override
  String get pointsBalanceLabel => '포인트 잔액';

  @override
  String get secondaryPinLabel => '보조 PIN';

  @override
  String get issueDateLabel => '발행일';

  @override
  String get documentTitleLabel => '문서 제목';

  @override
  String get nfcReaderTitle => 'NFC 리더';

  @override
  String get nfcNotAvailable => 'NFC를 사용할 수 없음';

  @override
  String get nfcUnsupportedDesc => '이 장치는 NFC 카드 읽기를 지원하지 않습니다.';

  @override
  String get readyToScan => '스캔 준비 완료';

  @override
  String get holdCardNfcPrompt => '비접촉식 카드를 휴대전화 뒷면에 대세요.';

  @override
  String get scanFailed => '스캔 실패';

  @override
  String get somethingWentWrong => '문제가 발생했습니다.';

  @override
  String get tryAgainBtn => '다시 시도';

  @override
  String get cardDetected => '카드 감지됨';

  @override
  String get unsupportedCardError => '이 카드 유형은 지원되지 않습니다.';

  @override
  String get nfcReadFailedDesc => '이 카드를 읽을 수 없습니다. 다시 시도하거나 수동으로 추가하세요.';

  @override
  String nfcReadError(String error) {
    return '읽기 실패: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'NFC 세션을 시작할 수 없습니다: $error';
  }

  @override
  String get scanCardTitle => '카드 스캔';

  @override
  String get noCameraError => '이 기기에서는 사용할 수 있는 카메라가 없습니다.';

  @override
  String cameraStartError(String error) {
    return '카메라를 시작할 수 없습니다: $error';
  }

  @override
  String get ocrReadError => '카드 세부정보를 읽을 수 없습니다. 더 나은 조명으로 다시 시도해 보세요.';

  @override
  String ocrScanFailed(String error) {
    return '스캔 실패: $error';
  }

  @override
  String get cameraPermissionDesc => '카드를 스캔하려면 카메라 권한이 필요합니다.';

  @override
  String get openSettingsBtn => '설정 열기';

  @override
  String get notDetected => '감지되지 않음';

  @override
  String get scanAgainBtn => '다시 스캔';

  @override
  String get cardPhotosDesc => '빠른 참조를 위해 카드 사진을 보관하세요. 이미지는 이 기기에 유지됩니다.';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label 사진 추가';
  }

  @override
  String get premiumTitle => '프리미엄';

  @override
  String get benefitRemoveAdsTitle => '모든 광고 제거';

  @override
  String get benefitRemoveAdsDesc => '배너, 전면 광고 없음';

  @override
  String get benefitFasterTitle => '더 빠른 경험';

  @override
  String get benefitFasterDesc => '로드할 것이 없는 인스턴트 화면';

  @override
  String get benefitSupportTitle => '개발 지원';

  @override
  String get benefitSupportDesc => '앱이 계속 성장하도록 도와주세요';

  @override
  String get benefitBadgeTitle => '프리미엄 배지';

  @override
  String get benefitBadgeDesc => '프로필에 작은 감사 인사를 전하세요';

  @override
  String get premiumHeroActive => '당신은 프리미엄입니다';

  @override
  String get premiumHeroInactive => '광고 없이 이동';

  @override
  String get premiumHeroDescActive => '카드월렛을 지원해 주셔서 감사합니다';

  @override
  String get premiumHeroDescInactive => '광고를 제거하고 더욱 깨끗한 환경을 경험하세요';

  @override
  String get disablePremiumBtn => '프리미엄 비활성화';

  @override
  String get removeAdsBtn => '광고 제거';

  @override
  String get premiumOneTimeNotice => '일회성. 이 장치에서 즉시 복원됩니다.';

  @override
  String get noBiometricsConfigured => '이 장치에는 생체 인식/장치 잠금이 구성되어 있지 않습니다.';

  @override
  String get cardTypeCredit => '신용카드';

  @override
  String get cardTypeDebit => '직불카드';

  @override
  String get cardTypePoint => '포인트 카드';

  @override
  String get cardTypeMembership => '회원카드';

  @override
  String get cardTypeCoupon => '쿠폰';

  @override
  String get cardTypeGift => '기프트 카드';

  @override
  String get cardTypeEventTicket => '이벤트 티켓';

  @override
  String get cardTypeOther => '다른';

  @override
  String get chooseCardType => '카드 종류 선택';

  @override
  String get selectCustomColor => '사용자 정의 색상 선택';

  @override
  String get solidColor => '단단한';

  @override
  String get gradientColor => '구배';

  @override
  String get startColor => '시작';

  @override
  String get endColor => '끝';

  @override
  String get cardExpLabel => '경험치';

  @override
  String get homeTab => '집';

  @override
  String get cardsTab => '내 카드';

  @override
  String get profileTab => '윤곽';

  @override
  String get appTitleTypewriter => '카드지갑';

  @override
  String get seeAll => '모두 보기';

  @override
  String get backupShareText => '카드지갑 보안 백업';

  @override
  String get backupFileNotFoundError => '백업 파일을 찾을 수 없습니다';

  @override
  String get corruptedBackupError => '손상되었거나 잘못된 백업 파일';

  @override
  String get invalidBackupDataError => '백업 파일에 유효한 데이터가 포함되어 있지 않습니다.';

  @override
  String unsupportedBackupVersionError(String version) {
    return '지원되지 않는 백업 버전: $version';
  }
}
