// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'แอพกระเป๋าเงินบัตร';

  @override
  String get addCard => 'เพิ่มการ์ด';

  @override
  String get hiThere => 'สวัสดี ครับ 😏';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get appLock => 'ล็อคแอพ';

  @override
  String get appLockSubtitle => 'ต้องใช้ข้อมูลไบโอเมตริกซ์เพื่อเปิดแอป';

  @override
  String get language => 'ภาษา';

  @override
  String get backupRestore => 'สำรองและกู้คืน';

  @override
  String get backupRestoreSubtitle => 'ส่งออกและนำเข้าการ์ดของคุณภายในเครื่อง';

  @override
  String get clearAllData => 'ล้างข้อมูลทั้งหมด';

  @override
  String get goodMorning => 'สวัสดีตอนเช้า';

  @override
  String get goodAfternoon => 'สวัสดีตอนบ่าย';

  @override
  String get goodEvening => 'สวัสดีตอนเย็น';

  @override
  String hiName(String name) {
    return 'สวัสดี $name 😢';
  }

  @override
  String get addNewCard => 'เพิ่มการ์ดใหม่';

  @override
  String get scan => 'สแกน';

  @override
  String get scanDesc => 'สแกนรายละเอียดบัตร\nทันที';

  @override
  String get manually => 'ด้วยตนเอง';

  @override
  String get manuallyDesc => 'กรอกรายละเอียดบัตร\nด้วยตนเอง';

  @override
  String get nfc => 'เอ็นเอฟซี';

  @override
  String get nfcDesc => 'แตะการ์ดเพื่อเพิ่ม\nโดยใช้เอ็นเอฟซี';

  @override
  String get tools => 'เครื่องมือ';

  @override
  String get binChecker => 'ตัวตรวจสอบถัง';

  @override
  String get binCheckerDesc => 'ตรวจสอบรายละเอียดบัตรจาก BIN';

  @override
  String get cardVerify => 'ตรวจสอบบัตร';

  @override
  String get cardVerifyDesc => 'ตรวจสอบหมายเลขบัตร';

  @override
  String get frequentlyAdded => 'เพิ่มบ่อย';

  @override
  String get cardsTitle => 'การ์ด';

  @override
  String get yourCardsManage => 'บัตรของคุณที่นี่เพื่อจัดการ';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'บันทึกการ์ด $count แล้ว',
      one: 'บันทึกการ์ดแล้ว 1 ใบ',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'การ์ด $count',
      one: 'การ์ด 1 ใบ',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'ทั้งหมด';

  @override
  String get noCardsYet => 'ยังไม่มีบัตร';

  @override
  String get noCardsYetDesc => 'ไปที่หน้าแรกหรือแตะเครื่องสแกนเพื่อเพิ่มการ์ด';

  @override
  String get noCardsCategory => 'ไม่มีการ์ดในหมวดหมู่นี้';

  @override
  String get tryDifferentFilter => 'ลองเลือกตัวกรองอื่น';

  @override
  String get addFirstCardStart => 'เพิ่มบัตรใบแรกของคุณเพื่อเริ่มต้น';

  @override
  String get rateUs => 'ให้คะแนนเรา';

  @override
  String get rateUsThanks => 'ขอบคุณสำหรับการสนับสนุน!';

  @override
  String get shareApp => 'แชร์แอป';

  @override
  String get shareAppSoon => 'การแบ่งปันจะมาเร็ว ๆ นี้';

  @override
  String get help => 'ช่วย';

  @override
  String get supportSoon => 'การสนับสนุนในเร็ว ๆ นี้';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get privacyPolicySoon => 'เปิดนโยบายความเป็นส่วนตัว';

  @override
  String get termsOfUse => 'เงื่อนไขการใช้งาน';

  @override
  String get termsOfUseSoon => 'เปิดเงื่อนไขการใช้งาน';

  @override
  String get clearDataTitle => 'ล้างข้อมูลทั้งหมดใช่ไหม';

  @override
  String get clearDataDesc =>
      'การดำเนินการนี้จะลบการ์ดที่บันทึกไว้ทุกใบอย่างถาวร สิ่งนี้ไม่สามารถยกเลิกได้';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get clearDataConfirm => 'ล้างข้อมูล';

  @override
  String get clearDataToast => 'ล้างข้อมูลทั้งหมดแล้ว';

  @override
  String get splashSubtitle => 'บัตรของคุณปลอดภัยและเรียบง่าย';

  @override
  String get unlockPrompt => 'ปลดล็อก Card Wallet เพื่อดำเนินการต่อ';

  @override
  String get tapToUnlock => 'แตะเพื่อปลดล็อค';

  @override
  String get authFailed => 'การตรวจสอบสิทธิ์ล้มเหลว';

  @override
  String get binCheckerTitle => 'ตัวตรวจสอบถัง';

  @override
  String get enterMin6Digits => 'ป้อนอย่างน้อย 6 หลัก';

  @override
  String get binNotVerified => 'ไม่สามารถยืนยัน BIN นี้ได้';

  @override
  String get lookupFailed =>
      'การค้นหาล้มเหลว ตรวจสอบการเชื่อมต่อของคุณแล้วลองอีกครั้ง';

  @override
  String get binLookupPlaceholder => 'ค้นหา BIN / IIN';

  @override
  String get enterDigitsLabel => 'ป้อนตัวเลข 6-8 หลักแรก';

  @override
  String get checkButton => 'ตรวจสอบ';

  @override
  String get binResultTitle => 'ผลลัพธ์ถัง';

  @override
  String get cardNetwork => 'เครือข่าย';

  @override
  String get cardType => 'พิมพ์';

  @override
  String get cardBrandCategory => 'ยี่ห้อ/หมวดหมู่';

  @override
  String get cardBank => 'ธนาคาร';

  @override
  String get cardCountry => 'ประเทศ';

  @override
  String get cardCountryCode => 'รหัสประเทศ';

  @override
  String get cardCurrency => 'สกุลเงิน';

  @override
  String get cardValid => 'ถูกต้อง';

  @override
  String get yes => 'ใช่';

  @override
  String get no => 'เลขที่';

  @override
  String get cardValidatorTitle => 'เครื่องตรวจสอบบัตร';

  @override
  String get cardValidatorPreviewName => 'เครื่องตรวจสอบบัตร';

  @override
  String get enterCardNumberLabel => 'กรอกหมายเลขบัตร';

  @override
  String get validCardNumber => 'หมายเลขบัตรที่ถูกต้อง';

  @override
  String get invalidCardNumber => 'หมายเลขบัตรไม่ถูกต้อง — ตรวจสอบตัวเลข';

  @override
  String get backupRestoreTitle => 'สำรองและกู้คืน';

  @override
  String get createBackupPass => 'สร้างรหัสผ่านสำรอง';

  @override
  String get backupPassWarning =>
      'สิ่งสำคัญ: จดรหัสผ่านนี้ไว้ เราไม่สามารถกู้คืนหรือกู้คืนข้อมูลสำรองของคุณได้หากคุณลืม';

  @override
  String get enterPassLabel => 'ใส่รหัสผ่าน';

  @override
  String get confirmPassLabel => 'ยืนยันรหัสผ่าน';

  @override
  String get passEmptyError => 'รหัสผ่านต้องไม่เว้นว่าง';

  @override
  String get passMismatchError => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get doneBtn => 'เสร็จแล้ว';

  @override
  String get enterBackupPass => 'ป้อนรหัสผ่านสำรอง';

  @override
  String get noCardsToBackup => 'ไม่มีการ์ดที่จะสำรองข้อมูล';

  @override
  String get backupSuccess => 'สร้างข้อมูลสำรองเรียบร้อยแล้ว!';

  @override
  String backupFailed(String error) {
    return 'การสำรองข้อมูลล้มเหลว: $error';
  }

  @override
  String get restoreBackupTitle => 'คืนค่าข้อมูลสำรองใช่ไหม';

  @override
  String get restoreBackupWarning =>
      'คำเตือน: การคืนค่าข้อมูลสำรองจะเขียนทับการ์ดและธุรกรรมปัจจุบันทั้งหมด สิ่งนี้ไม่สามารถยกเลิกได้';

  @override
  String get continueBtn => 'ดำเนินการต่อ';

  @override
  String get restoreSuccess => 'กู้คืนข้อมูลสำรองสำเร็จแล้ว!';

  @override
  String get incorrectPasswordError =>
      'รหัสผ่านไม่ถูกต้องหรือไฟล์สำรองข้อมูลเสียหาย';

  @override
  String restoreFailed(String error) {
    return 'การคืนค่าล้มเหลว: $error';
  }

  @override
  String get deleteBackupTitle => 'ลบข้อมูลสำรองใช่ไหม';

  @override
  String deleteBackupConfirmText(String name) {
    return 'ลบ \"$name\" หรือไม่ สิ่งนี้ไม่สามารถยกเลิกได้';
  }

  @override
  String get deleteBtn => 'ลบ';

  @override
  String get backupDeleted => 'ลบข้อมูลสำรองแล้ว';

  @override
  String failedShareBackup(String error) {
    return 'ไม่สามารถแชร์ข้อมูลสำรอง: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'ไม่สามารถเลือกไฟล์: $error';
  }

  @override
  String get lastBackup => 'การสำรองข้อมูลครั้งสุดท้าย';

  @override
  String get neverBackedUp => 'ไม่เคยสำรองข้อมูล';

  @override
  String get backupType => 'ประเภทการสำรองข้อมูล';

  @override
  String get localBackupDesc => 'ท้องถิ่น — บันทึกอยู่ในอุปกรณ์นี้เท่านั้น';

  @override
  String get createBackupBtn => 'สร้างข้อมูลสำรอง';

  @override
  String get importExternalBackupBtn => 'นำเข้าข้อมูลสำรองภายนอก';

  @override
  String get savedBackupsHeader => 'ข้อมูลสำรองที่บันทึกไว้';

  @override
  String get noBackupsYet => 'ยังไม่มีการสำรองข้อมูล';

  @override
  String get tapCreateBackupDesc =>
      'แตะ \"สร้างข้อมูลสำรอง\" เพื่อบันทึกการ์ดของคุณ';

  @override
  String get restoreTooltip => 'คืนค่า';

  @override
  String get shareTooltip => 'แบ่งปัน';

  @override
  String get cardNotFound => 'ไม่พบการ์ด';

  @override
  String get editCardTitle => 'แก้ไขการ์ด';

  @override
  String get addCardTitle => 'เพิ่มการ์ด';

  @override
  String get cardTypeLabel => 'ประเภทบัตร';

  @override
  String get cardColorLabel => 'สีการ์ด';

  @override
  String get fieldRequiredError => 'ต้องระบุข้อมูลในช่องนี้';

  @override
  String get bankNameLabel => 'ชื่อธนาคาร';

  @override
  String get expiryLabel => 'วันหมดอายุ (ดด/ปป)';

  @override
  String get cvvLabel => 'ซีวีวี';

  @override
  String get cardPhotosLabel => 'รูปถ่ายการ์ด';

  @override
  String get frontSideLabel => 'ด้านหน้า';

  @override
  String get backSideLabel => 'ด้านหลัง';

  @override
  String get notesLabel => 'หมายเหตุ';

  @override
  String get saveChangesBtn => 'บันทึกการเปลี่ยนแปลง';

  @override
  String get saveCardBtn => 'บันทึกการ์ด';

  @override
  String get deleteCardBtn => 'ลบการ์ด';

  @override
  String get takePhotoLabel => 'ถ่ายรูป';

  @override
  String get chooseGalleryLabel => 'เลือกจากแกลเลอรี่';

  @override
  String get deleteCardPrompt => 'ลบการ์ดใช่ไหม';

  @override
  String get deleteCardWarning => 'การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get cardNumberLabel => 'หมายเลขบัตร';

  @override
  String get pointCardNumberLabel => 'หมายเลขบัตรพอยต์';

  @override
  String get membershipIdLabel => 'รหัสสมาชิก';

  @override
  String get couponCodeLabel => 'รหัสคูปอง';

  @override
  String get giftCardNumberLabel => 'หมายเลขบัตรของขวัญ';

  @override
  String get ticketPnrLabel => 'ตั๋ว / หมายเลข PNR';

  @override
  String get numberLabel => 'ตัวเลข';

  @override
  String get cardholderNameLabel => 'ชื่อผู้ถือบัตร';

  @override
  String get cardNameLabel => 'ชื่อการ์ด';

  @override
  String get enterValidCardNumberError => 'ป้อนหมายเลขบัตรที่ถูกต้อง';

  @override
  String get cardNumberInvalidError => 'หมายเลขบัตรดูเหมือนไม่ถูกต้อง';

  @override
  String get enterMin3CharsError => 'ป้อนอย่างน้อย 3 ตัวอักษร';

  @override
  String get cardAlreadyExistsError => 'บันทึกบัตรที่มีหมายเลขนี้แล้ว';

  @override
  String get revealCvv => 'เผย CVV';

  @override
  String get cardDetailsHeader => 'รายละเอียดบัตร:';

  @override
  String get typePrefix => 'พิมพ์:';

  @override
  String get bankPrefix => 'ธนาคาร:';

  @override
  String get cardNumberPrefix => 'หมายเลขบัตร:';

  @override
  String get cardholderPrefix => 'ผู้ถือบัตร:';

  @override
  String get expiryPrefix => 'หมดอายุ:';

  @override
  String get notesPrefix => 'หมายเหตุ:';

  @override
  String get detailsSuffix => 'รายละเอียด';

  @override
  String get cardDetailsTitle => 'รายละเอียดบัตร';

  @override
  String get hideBtn => 'ซ่อน';

  @override
  String get revealBtn => 'เปิดเผย';

  @override
  String get editBtn => 'แก้ไข';

  @override
  String get cardInformationHeader => 'ข้อมูลบัตร';

  @override
  String get cardholderLabel => 'ผู้ถือบัตร';

  @override
  String get nameLabel => 'ชื่อ';

  @override
  String get bankLabel => 'ธนาคาร';

  @override
  String get pnrNumberLabel => 'หมายเลข PNR';

  @override
  String get venueLabel => 'สถานที่';

  @override
  String get eventDateLabel => 'วันที่จัดงาน';

  @override
  String get seatLabel => 'ที่นั่ง';

  @override
  String get classLabel => 'ระดับ';

  @override
  String get discountDetailsLabel => 'รายละเอียดส่วนลด';

  @override
  String get memberIdLabel => 'รหัสสมาชิก';

  @override
  String get tierStatusLabel => 'สถานะระดับ';

  @override
  String get pointsBalanceLabel => 'คะแนนคงเหลือ';

  @override
  String get secondaryPinLabel => 'PIN รอง';

  @override
  String get issueDateLabel => 'วันที่ออก';

  @override
  String get documentTitleLabel => 'ชื่อเอกสาร';

  @override
  String get nfcReaderTitle => 'เครื่องอ่านเอ็นเอฟซี';

  @override
  String get nfcNotAvailable => 'เอ็นเอฟซีไม่พร้อมใช้งาน';

  @override
  String get nfcUnsupportedDesc => 'อุปกรณ์นี้ไม่รองรับการอ่านการ์ด NFC';

  @override
  String get readyToScan => 'พร้อมสำหรับการสแกน';

  @override
  String get holdCardNfcPrompt => 'ถือการ์ดแบบไร้สัมผัสไว้ที่ด้านหลังโทรศัพท์';

  @override
  String get scanFailed => 'การสแกนล้มเหลว';

  @override
  String get somethingWentWrong => 'มีบางอย่างผิดพลาด';

  @override
  String get tryAgainBtn => 'ลองอีกครั้ง';

  @override
  String get cardDetected => 'ตรวจพบการ์ดแล้ว';

  @override
  String get unsupportedCardError => 'ไม่รองรับการ์ดประเภทนี้';

  @override
  String get nfcReadFailedDesc =>
      'ไม่สามารถอ่านการ์ดใบนี้ได้ ลองอีกครั้งหรือเพิ่มด้วยตนเอง';

  @override
  String nfcReadError(String error) {
    return 'การอ่านล้มเหลว: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'ไม่สามารถเริ่มเซสชัน NFC: $error';
  }

  @override
  String get scanCardTitle => 'สแกนการ์ด';

  @override
  String get noCameraError => 'ไม่มีกล้องในอุปกรณ์นี้';

  @override
  String cameraStartError(String error) {
    return 'ไม่สามารถเริ่มกล้องได้: $error';
  }

  @override
  String get ocrReadError =>
      'ไม่สามารถอ่านรายละเอียดการ์ดได้ ลองอีกครั้งโดยให้แสงสว่างดีขึ้น';

  @override
  String ocrScanFailed(String error) {
    return 'การสแกนล้มเหลว: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'ต้องได้รับอนุญาตจากกล้องจึงจะสแกนการ์ดได้';

  @override
  String get openSettingsBtn => 'เปิดการตั้งค่า';

  @override
  String get notDetected => 'ตรวจไม่พบ';

  @override
  String get scanAgainBtn => 'สแกนอีกครั้ง';

  @override
  String get cardPhotosDesc =>
      'เก็บรูปถ่ายบัตรของคุณไว้เพื่อใช้อ้างอิงอย่างรวดเร็ว รูปภาพจะยังคงอยู่ในอุปกรณ์นี้';

  @override
  String addPhotoPlaceholder(String label) {
    return 'เพิ่มรูปภาพ $label';
  }

  @override
  String get premiumTitle => 'พรีเมี่ยม';

  @override
  String get benefitRemoveAdsTitle => 'ลบโฆษณาทั้งหมด';

  @override
  String get benefitRemoveAdsDesc =>
      'ไม่มีแบนเนอร์ ไม่มีโฆษณาคั่นระหว่างหน้าเลย';

  @override
  String get benefitFasterTitle => 'ประสบการณ์ที่เร็วขึ้น';

  @override
  String get benefitFasterDesc => 'หน้าจอทันทีโดยไม่ต้องโหลดอะไรเลย';

  @override
  String get benefitSupportTitle => 'รองรับการพัฒนา';

  @override
  String get benefitSupportDesc => 'ช่วยให้แอปเติบโต';

  @override
  String get benefitBadgeTitle => 'ป้ายพรีเมียม';

  @override
  String get benefitBadgeDesc => 'ขอขอบคุณเล็กน้อยในโปรไฟล์ของคุณ';

  @override
  String get premiumHeroActive => 'คุณเป็นพรีเมี่ยม';

  @override
  String get premiumHeroInactive => 'ไปแบบไม่มีโฆษณา';

  @override
  String get premiumHeroDescActive => 'ขอบคุณที่สนับสนุน Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'ลบโฆษณาและปลดล็อคประสบการณ์ที่สะอาดยิ่งขึ้น';

  @override
  String get disablePremiumBtn => 'ปิดการใช้งานพรีเมี่ยม';

  @override
  String get removeAdsBtn => 'ลบโฆษณา';

  @override
  String get premiumOneTimeNotice => 'ครั้งเดียว. คืนค่าทันทีบนอุปกรณ์นี้';

  @override
  String get noBiometricsConfigured =>
      'ไม่มีการกำหนดค่าไบโอเมตริก/การล็อกอุปกรณ์บนอุปกรณ์นี้';

  @override
  String get cardTypeCredit => 'บัตรเครดิต';

  @override
  String get cardTypeDebit => 'บัตรเดบิต';

  @override
  String get cardTypePoint => 'บัตรจุด';

  @override
  String get cardTypeMembership => 'บัตรสมาชิก';

  @override
  String get cardTypeCoupon => 'คูปอง';

  @override
  String get cardTypeGift => 'บัตรของขวัญ';

  @override
  String get cardTypeEventTicket => 'ตั๋วกิจกรรม';

  @override
  String get cardTypeOther => 'อื่น';

  @override
  String get chooseCardType => 'เลือกประเภทบัตร';

  @override
  String get selectCustomColor => 'เลือกสีที่กำหนดเอง';

  @override
  String get solidColor => 'แข็ง';

  @override
  String get gradientColor => 'การไล่ระดับสี';

  @override
  String get startColor => 'เริ่ม';

  @override
  String get endColor => 'จบ';

  @override
  String get cardExpLabel => 'ประสบการณ์';

  @override
  String get homeTab => 'บ้าน';

  @override
  String get cardsTab => 'การ์ดของฉัน';

  @override
  String get profileTab => 'ประวัติโดยย่อ';

  @override
  String get appTitleTypewriter => 'กระเป๋าใส่บัตร';

  @override
  String get seeAll => 'ดูทั้งหมด';

  @override
  String get backupShareText => 'การสำรองข้อมูลกระเป๋าสตางค์บัตรอย่างปลอดภัย';

  @override
  String get backupFileNotFoundError => 'ไม่พบไฟล์สำรอง';

  @override
  String get corruptedBackupError => 'ไฟล์สำรองข้อมูลเสียหายหรือไม่ถูกต้อง';

  @override
  String get invalidBackupDataError => 'ไฟล์สำรองไม่มีข้อมูลที่ถูกต้อง';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'เวอร์ชันสำรองที่ไม่รองรับ: $version';
  }
}
