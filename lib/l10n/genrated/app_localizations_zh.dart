// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '卡钱包应用程序';

  @override
  String get addCard => '添加卡';

  @override
  String get hiThere => '嗨，那里👋';

  @override
  String get settingsTitle => '设置';

  @override
  String get appLock => '应用锁';

  @override
  String get appLockSubtitle => '需要生物识别才能打开应用程序';

  @override
  String get language => '语言';

  @override
  String get backupRestore => '备份与恢复';

  @override
  String get backupRestoreSubtitle => '在本地导出和导入您的卡';

  @override
  String get clearAllData => '清除所有数据';

  @override
  String get goodMorning => '早上好';

  @override
  String get goodAfternoon => '下午好';

  @override
  String get goodEvening => '晚上好';

  @override
  String hiName(String name) {
    return '嗨，$name 👋';
  }

  @override
  String get addNewCard => '添加新卡';

  @override
  String get scan => '扫描';

  @override
  String get scanDesc => '扫描卡详细信息\n立即';

  @override
  String get manually => '手动';

  @override
  String get manuallyDesc => '输入卡详细信息\n手动';

  @override
  String get nfc => '近场通信';

  @override
  String get nfcDesc => '点击卡进行添加\n使用 NFC';

  @override
  String get tools => '工具';

  @override
  String get binChecker => 'BIN检查器';

  @override
  String get binCheckerDesc => '从 BIN 检查卡详细信息';

  @override
  String get cardVerify => '卡验证';

  @override
  String get cardVerifyDesc => '验证卡号';

  @override
  String get frequentlyAdded => '经常添加';

  @override
  String get cardsTitle => '牌';

  @override
  String get yourCardsManage => '您的卡可以在这里管理';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 卡已保存',
      one: '已保存 1 张卡',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 卡',
      one: '1 张卡',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => '全部';

  @override
  String get noCardsYet => '还没有卡';

  @override
  String get noCardsYetDesc => '转到主页或点击扫描仪添加卡片';

  @override
  String get noCardsCategory => '该类别没有卡片';

  @override
  String get tryDifferentFilter => '尝试选择不同的过滤器';

  @override
  String get addFirstCardStart => '添加您的第一张卡以开始使用';

  @override
  String get rateUs => '评价我们';

  @override
  String get rateUsThanks => '感谢您的支持！';

  @override
  String get shareApp => '分享应用程序';

  @override
  String get shareAppSoon => '即将分享';

  @override
  String get help => '帮助';

  @override
  String get supportSoon => '支持即将推出';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyPolicySoon => '打开隐私政策';

  @override
  String get termsOfUse => '使用条款';

  @override
  String get termsOfUseSoon => '打开使用条款';

  @override
  String get clearDataTitle => '清除所有数据？';

  @override
  String get clearDataDesc => '这将永久删除每张已保存的卡片。此操作无法撤消。';

  @override
  String get cancel => '取消';

  @override
  String get clearDataConfirm => '清除数据';

  @override
  String get clearDataToast => '所有数据已清除';

  @override
  String get splashSubtitle => '您的卡片，安全又简单';

  @override
  String get unlockPrompt => '解锁卡钱包以继续';

  @override
  String get tapToUnlock => '点击解锁';

  @override
  String get authFailed => '认证失败';

  @override
  String get binCheckerTitle => 'BIN检查器';

  @override
  String get enterMin6Digits => '输入至少 6 位数字';

  @override
  String get binNotVerified => '无法验证此 BIN';

  @override
  String get lookupFailed => '查找失败。检查您的连接并重试。';

  @override
  String get binLookupPlaceholder => 'BIN / IIN 查找';

  @override
  String get enterDigitsLabel => '输入前 6-8 位数字';

  @override
  String get checkButton => '查看';

  @override
  String get binResultTitle => '分档结果';

  @override
  String get cardNetwork => '网络';

  @override
  String get cardType => '类型';

  @override
  String get cardBrandCategory => '品牌/类别';

  @override
  String get cardBank => '银行';

  @override
  String get cardCountry => '国家';

  @override
  String get cardCountryCode => '国家/地区代码';

  @override
  String get cardCurrency => '货币';

  @override
  String get cardValid => '有效的';

  @override
  String get yes => '是的';

  @override
  String get no => '不';

  @override
  String get cardValidatorTitle => '卡片验证器';

  @override
  String get cardValidatorPreviewName => '卡片验证器';

  @override
  String get enterCardNumberLabel => '输入卡号';

  @override
  String get validCardNumber => '有效卡号';

  @override
  String get invalidCardNumber => '卡号无效 - 检查数字';

  @override
  String get backupRestoreTitle => '备份与恢复';

  @override
  String get createBackupPass => '创建备份密码';

  @override
  String get backupPassWarning => '重要提示：记下此密码。如果您忘记了它，我们将无法恢复它或恢复您的备份。';

  @override
  String get enterPassLabel => '输入密码';

  @override
  String get confirmPassLabel => '确认密码';

  @override
  String get passEmptyError => '密码不能为空';

  @override
  String get passMismatchError => '密码不匹配';

  @override
  String get doneBtn => '完毕';

  @override
  String get enterBackupPass => '输入备份密码';

  @override
  String get noCardsToBackup => '没有要备份的卡';

  @override
  String get backupSuccess => '备份创建成功！';

  @override
  String backupFailed(String error) {
    return '备份失败：$error';
  }

  @override
  String get restoreBackupTitle => '恢复备份？';

  @override
  String get restoreBackupWarning => '警告：恢复备份将覆盖所有当前卡和交易。此操作无法撤消。';

  @override
  String get continueBtn => '继续';

  @override
  String get restoreSuccess => '备份恢复成功！';

  @override
  String get incorrectPasswordError => '密码不正确或备份文件损坏。';

  @override
  String restoreFailed(String error) {
    return '恢复失败：$error';
  }

  @override
  String get deleteBackupTitle => '删除备份？';

  @override
  String deleteBackupConfirmText(String name) {
    return '删除“$name”？此操作无法撤消。';
  }

  @override
  String get deleteBtn => '删除';

  @override
  String get backupDeleted => '备份已删除';

  @override
  String failedShareBackup(String error) {
    return '无法共享备份：$error';
  }

  @override
  String failedPickFile(String error) {
    return '无法选择文件：$error';
  }

  @override
  String get lastBackup => '上次备份';

  @override
  String get neverBackedUp => '从未备份过';

  @override
  String get backupType => '备份类型';

  @override
  String get localBackupDesc => '本地 — 仅保存在此设备上';

  @override
  String get createBackupBtn => '创建备份';

  @override
  String get importExternalBackupBtn => '导入外部备份';

  @override
  String get savedBackupsHeader => '已保存的备份';

  @override
  String get noBackupsYet => '还没有备份';

  @override
  String get tapCreateBackupDesc => '点击“创建备份”来保存您的卡片';

  @override
  String get restoreTooltip => '恢复';

  @override
  String get shareTooltip => '分享';

  @override
  String get cardNotFound => '未找到卡';

  @override
  String get editCardTitle => '编辑卡';

  @override
  String get addCardTitle => '添加卡';

  @override
  String get cardTypeLabel => '卡型';

  @override
  String get cardColorLabel => '卡牌颜色';

  @override
  String get fieldRequiredError => '此字段是必需的';

  @override
  String get bankNameLabel => '银行名称';

  @override
  String get expiryLabel => '到期日（月/年）';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => '卡片照片';

  @override
  String get frontSideLabel => '正面';

  @override
  String get backSideLabel => '背面';

  @override
  String get notesLabel => '笔记';

  @override
  String get saveChangesBtn => '保存更改';

  @override
  String get saveCardBtn => '保存卡';

  @override
  String get deleteCardBtn => '删除卡';

  @override
  String get takePhotoLabel => '拍张照片';

  @override
  String get chooseGalleryLabel => '从画廊中选择';

  @override
  String get deleteCardPrompt => '删除卡？';

  @override
  String get deleteCardWarning => '此操作无法撤消。';

  @override
  String get cardNumberLabel => '卡号';

  @override
  String get pointCardNumberLabel => '点卡号码';

  @override
  String get membershipIdLabel => '会员ID';

  @override
  String get couponCodeLabel => '优惠券代码';

  @override
  String get giftCardNumberLabel => '礼品卡号码';

  @override
  String get ticketPnrLabel => '机票/PNR 号码';

  @override
  String get numberLabel => '数字';

  @override
  String get cardholderNameLabel => '持卡人姓名';

  @override
  String get cardNameLabel => '卡名';

  @override
  String get enterValidCardNumberError => '输入有效的卡号';

  @override
  String get cardNumberInvalidError => '卡号看起来无效';

  @override
  String get enterMin3CharsError => '输入至少3个字符';

  @override
  String get cardAlreadyExistsError => '此号码的卡已保存';

  @override
  String get revealCvv => '显示CVV';

  @override
  String get cardDetailsHeader => '卡详情：';

  @override
  String get typePrefix => '类型：';

  @override
  String get bankPrefix => '银行：';

  @override
  String get cardNumberPrefix => '卡号：';

  @override
  String get cardholderPrefix => '持卡人：';

  @override
  String get expiryPrefix => '到期日：';

  @override
  String get notesPrefix => '笔记：';

  @override
  String get detailsSuffix => '细节';

  @override
  String get cardDetailsTitle => '卡详情';

  @override
  String get hideBtn => '隐藏';

  @override
  String get revealBtn => '揭示';

  @override
  String get editBtn => '编辑';

  @override
  String get cardInformationHeader => '卡信息';

  @override
  String get cardholderLabel => '持卡人';

  @override
  String get nameLabel => '姓名';

  @override
  String get bankLabel => '银行';

  @override
  String get pnrNumberLabel => 'PNR 号码';

  @override
  String get venueLabel => '场地';

  @override
  String get eventDateLabel => '活动日期';

  @override
  String get seatLabel => '座位';

  @override
  String get classLabel => '班级';

  @override
  String get discountDetailsLabel => '折扣详情';

  @override
  String get memberIdLabel => '会员编号';

  @override
  String get tierStatusLabel => '等级状态';

  @override
  String get pointsBalanceLabel => '积分余额';

  @override
  String get secondaryPinLabel => '辅助密码';

  @override
  String get issueDateLabel => '签发日期';

  @override
  String get documentTitleLabel => '文件标题';

  @override
  String get nfcReaderTitle => 'NFC读写器';

  @override
  String get nfcNotAvailable => 'NFC 不可用';

  @override
  String get nfcUnsupportedDesc => '该设备不支持NFC卡读取。';

  @override
  String get readyToScan => '准备扫描';

  @override
  String get holdCardNfcPrompt => '将非接触式卡放在手机背面。';

  @override
  String get scanFailed => '扫描失败';

  @override
  String get somethingWentWrong => '出了点问题。';

  @override
  String get tryAgainBtn => '再试一次';

  @override
  String get cardDetected => '检测到卡';

  @override
  String get unsupportedCardError => '不支持此卡类型。';

  @override
  String get nfcReadFailedDesc => '无法读取此卡。再试一次或手动添加。';

  @override
  String nfcReadError(String error) {
    return '读取失败：$error';
  }

  @override
  String nfcStartSessionError(String error) {
    return '无法启动 NFC 会话：$error';
  }

  @override
  String get scanCardTitle => '扫描卡';

  @override
  String get noCameraError => '该设备上没有可用的相机';

  @override
  String cameraStartError(String error) {
    return '无法启动相机：$error';
  }

  @override
  String get ocrReadError => '无法读取卡详细信息。用更好的照明再试一次。';

  @override
  String ocrScanFailed(String error) {
    return '扫描失败：$error';
  }

  @override
  String get cameraPermissionDesc => '扫描卡片需要相机许可。';

  @override
  String get openSettingsBtn => '打开设置';

  @override
  String get notDetected => '未检测到';

  @override
  String get scanAgainBtn => '再次扫描';

  @override
  String get cardPhotosDesc => '保留您的卡的照片以供快速参考。图像保留在此设备上。';

  @override
  String addPhotoPlaceholder(String label) {
    return '添加 $label 照片';
  }

  @override
  String get premiumTitle => '优质的';

  @override
  String get benefitRemoveAdsTitle => '删除所有广告';

  @override
  String get benefitRemoveAdsDesc => '没有横幅，没有插页式广告，永远';

  @override
  String get benefitFasterTitle => '更快的体验';

  @override
  String get benefitFasterDesc => '即时屏幕，无需加载任何内容';

  @override
  String get benefitSupportTitle => '支持发展';

  @override
  String get benefitSupportDesc => '帮助保持应用程序的增长';

  @override
  String get benefitBadgeTitle => '高级徽章';

  @override
  String get benefitBadgeDesc => '在你的个人资料上表达一点感谢';

  @override
  String get premiumHeroActive => '你是高级会员';

  @override
  String get premiumHeroInactive => '无广告';

  @override
  String get premiumHeroDescActive => '感谢您对卡钱包的支持';

  @override
  String get premiumHeroDescInactive => '删除广告并解锁更清晰的体验';

  @override
  String get disablePremiumBtn => '禁用高级版';

  @override
  String get removeAdsBtn => '删除广告';

  @override
  String get premiumOneTimeNotice => '一度。在此设备上立即恢复。';

  @override
  String get noBiometricsConfigured => '该设备上未配置生物识别/设备锁';

  @override
  String get cardTypeCredit => '信用卡';

  @override
  String get cardTypeDebit => '借记卡';

  @override
  String get cardTypePoint => '点卡';

  @override
  String get cardTypeMembership => '会员卡';

  @override
  String get cardTypeCoupon => '优惠券';

  @override
  String get cardTypeGift => '礼品卡';

  @override
  String get cardTypeEventTicket => '活动门票';

  @override
  String get cardTypeOther => '其他';

  @override
  String get chooseCardType => '选择卡类型';

  @override
  String get selectCustomColor => '选择自定义颜色';

  @override
  String get solidColor => '坚硬的';

  @override
  String get gradientColor => '坡度';

  @override
  String get startColor => '开始';

  @override
  String get endColor => '结尾';

  @override
  String get cardExpLabel => '经验值';

  @override
  String get homeTab => '家';

  @override
  String get cardsTab => '我的卡片';

  @override
  String get profileTab => '轮廓';

  @override
  String get appTitleTypewriter => '卡钱包';

  @override
  String get seeAll => '查看全部';

  @override
  String get backupShareText => '卡钱包安全备份';

  @override
  String get backupFileNotFoundError => '找不到备份文件';

  @override
  String get corruptedBackupError => '备份文件损坏或无效';

  @override
  String get invalidBackupDataError => '备份文件不包含有效数据。';

  @override
  String unsupportedBackupVersionError(String version) {
    return '不支持的备份版本：$version';
  }
}
