// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق محفظة البطاقة';

  @override
  String get addCard => 'أضف بطاقة';

  @override
  String get hiThere => 'مرحبًا، 👋';

  @override
  String get settingsTitle => 'إعدادات';

  @override
  String get appLock => 'قفل التطبيق';

  @override
  String get appLockSubtitle => 'تتطلب القياسات الحيوية لفتح التطبيق';

  @override
  String get language => 'لغة';

  @override
  String get backupRestore => 'النسخ الاحتياطي والاستعادة';

  @override
  String get backupRestoreSubtitle => 'تصدير واستيراد البطاقات الخاصة بك محليا';

  @override
  String get clearAllData => 'مسح كافة البيانات';

  @override
  String get goodMorning => 'صباح الخير';

  @override
  String get goodAfternoon => 'مساء الخير';

  @override
  String get goodEvening => 'مساء الخير';

  @override
  String hiName(String name) {
    return 'مرحبًا، $name 👋';
  }

  @override
  String get addNewCard => 'إضافة بطاقة جديدة';

  @override
  String get scan => 'مسح';

  @override
  String get scanDesc => 'مسح تفاصيل البطاقة\nعلى الفور';

  @override
  String get manually => 'يدويا';

  @override
  String get manuallyDesc => 'أدخل تفاصيل البطاقة\nيدويا';

  @override
  String get nfc => 'نفك';

  @override
  String get nfcDesc => 'اضغط على البطاقة لإضافتها\nباستخدام NFC';

  @override
  String get tools => 'أدوات';

  @override
  String get binChecker => 'مدقق بن';

  @override
  String get binCheckerDesc => 'التحقق من تفاصيل البطاقة من BIN';

  @override
  String get cardVerify => 'التحقق من البطاقة';

  @override
  String get cardVerifyDesc => 'التحقق من صحة رقم البطاقة';

  @override
  String get frequentlyAdded => 'تمت إضافته بشكل متكرر';

  @override
  String get cardsTitle => 'بطاقات';

  @override
  String get yourCardsManage => 'البطاقات الخاصة بك هنا لإدارة';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم حفظ بطاقات $count',
      one: 'تم حفظ بطاقة واحدة',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'بطاقات $count',
      one: '1 بطاقة',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'الجميع';

  @override
  String get noCardsYet => 'لا توجد بطاقات حتى الآن';

  @override
  String get noCardsYetDesc =>
      'انتقل إلى الصفحة الرئيسية أو اضغط على الماسح الضوئي لإضافة بطاقة';

  @override
  String get noCardsCategory => 'لا توجد بطاقات في هذه الفئة';

  @override
  String get tryDifferentFilter => 'حاول اختيار مرشح مختلف';

  @override
  String get addFirstCardStart => 'أضف بطاقتك الأولى للبدء';

  @override
  String get rateUs => 'قيمنا';

  @override
  String get rateUsThanks => 'شكرا على الدعم!';

  @override
  String get shareApp => 'مشاركة التطبيق';

  @override
  String get shareAppSoon => 'المشاركة قريبا';

  @override
  String get help => 'يساعد';

  @override
  String get supportSoon => 'الدعم قريبا';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacyPolicySoon => 'يفتح سياسة الخصوصية';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get termsOfUseSoon => 'يفتح شروط الاستخدام';

  @override
  String get clearDataTitle => 'هل تريد مسح جميع البيانات؟';

  @override
  String get clearDataDesc =>
      'يؤدي هذا إلى حذف كل بطاقة محفوظة بشكل دائم. لا يمكن التراجع عن هذا.';

  @override
  String get cancel => 'يلغي';

  @override
  String get clearDataConfirm => 'مسح البيانات';

  @override
  String get clearDataToast => 'تم مسح كافة البيانات';

  @override
  String get splashSubtitle => 'بطاقاتك، آمنة وبسيطة';

  @override
  String get unlockPrompt => 'افتح محفظة البطاقة للمتابعة';

  @override
  String get tapToUnlock => 'انقر لفتح';

  @override
  String get authFailed => 'فشلت المصادقة';

  @override
  String get binCheckerTitle => 'مدقق بن';

  @override
  String get enterMin6Digits => 'أدخل 6 أرقام على الأقل';

  @override
  String get binNotVerified => 'لا يمكن التحقق من رقم التعريف الشخصي هذا';

  @override
  String get lookupFailed => 'فشل البحث. تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get binLookupPlaceholder => 'بحث بن / IIN';

  @override
  String get enterDigitsLabel => 'أدخل أول 6-8 أرقام';

  @override
  String get checkButton => 'يفحص';

  @override
  String get binResultTitle => 'نتيجة بن';

  @override
  String get cardNetwork => 'شبكة';

  @override
  String get cardType => 'يكتب';

  @override
  String get cardBrandCategory => 'العلامة التجارية/الفئة';

  @override
  String get cardBank => 'بنك';

  @override
  String get cardCountry => 'دولة';

  @override
  String get cardCountryCode => 'رمز البلد';

  @override
  String get cardCurrency => 'عملة';

  @override
  String get cardValid => 'صالح';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get cardValidatorTitle => 'مدقق البطاقة';

  @override
  String get cardValidatorPreviewName => 'مدقق البطاقة';

  @override
  String get enterCardNumberLabel => 'أدخل رقم البطاقة';

  @override
  String get validCardNumber => 'رقم بطاقة صالح';

  @override
  String get invalidCardNumber => 'رقم البطاقة غير صالح - تحقق من الأرقام';

  @override
  String get backupRestoreTitle => 'النسخ الاحتياطي والاستعادة';

  @override
  String get createBackupPass => 'إنشاء كلمة مرور احتياطية';

  @override
  String get backupPassWarning =>
      'هام: اكتب كلمة المرور هذه. لا يمكننا استعادتها أو استعادة النسخة الاحتياطية إذا نسيتها.';

  @override
  String get enterPassLabel => 'أدخل كلمة المرور';

  @override
  String get confirmPassLabel => 'تأكيد كلمة المرور';

  @override
  String get passEmptyError => 'لا يمكن أن تكون كلمة المرور فارغة';

  @override
  String get passMismatchError => 'كلمات المرور غير متطابقة';

  @override
  String get doneBtn => 'منتهي';

  @override
  String get enterBackupPass => 'أدخل كلمة المرور الاحتياطية';

  @override
  String get noCardsToBackup => 'لا توجد بطاقات للنسخ الاحتياطي';

  @override
  String get backupSuccess => 'تم إنشاء النسخة الاحتياطية بنجاح!';

  @override
  String backupFailed(String error) {
    return 'فشل النسخ الاحتياطي: $error';
  }

  @override
  String get restoreBackupTitle => 'استعادة النسخة الاحتياطية؟';

  @override
  String get restoreBackupWarning =>
      'تحذير: ستؤدي استعادة النسخة الاحتياطية إلى استبدال كافة البطاقات والمعاملات الحالية. لا يمكن التراجع عن هذا.';

  @override
  String get continueBtn => 'يكمل';

  @override
  String get restoreSuccess => 'تمت استعادة النسخة الاحتياطية بنجاح!';

  @override
  String get incorrectPasswordError =>
      'كلمة المرور غير صحيحة أو ملف النسخ الاحتياطي تالف.';

  @override
  String restoreFailed(String error) {
    return 'فشلت الاستعادة: $error';
  }

  @override
  String get deleteBackupTitle => 'هل تريد حذف النسخة الاحتياطية؟';

  @override
  String deleteBackupConfirmText(String name) {
    return 'هل تريد حذف \"$name\"؟ لا يمكن التراجع عن هذا.';
  }

  @override
  String get deleteBtn => 'يمسح';

  @override
  String get backupDeleted => 'تم حذف النسخة الاحتياطية';

  @override
  String failedShareBackup(String error) {
    return 'فشلت مشاركة النسخة الاحتياطية: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'فشل في اختيار الملف: $error';
  }

  @override
  String get lastBackup => 'النسخ الاحتياطي الأخير';

  @override
  String get neverBackedUp => 'لم يتم الاحتفاظ بنسخة احتياطية أبدًا';

  @override
  String get backupType => 'نوع النسخ الاحتياطي';

  @override
  String get localBackupDesc => 'محلي — محفوظ على هذا الجهاز فقط';

  @override
  String get createBackupBtn => 'إنشاء نسخة احتياطية';

  @override
  String get importExternalBackupBtn => 'استيراد النسخ الاحتياطي الخارجي';

  @override
  String get savedBackupsHeader => 'النسخ الاحتياطية المحفوظة';

  @override
  String get noBackupsYet => 'لا توجد نسخ احتياطية حتى الآن';

  @override
  String get tapCreateBackupDesc =>
      'اضغط على \"إنشاء نسخة احتياطية\" لحفظ بطاقاتك';

  @override
  String get restoreTooltip => 'يعيد';

  @override
  String get shareTooltip => 'يشارك';

  @override
  String get cardNotFound => 'لم يتم العثور على البطاقة';

  @override
  String get editCardTitle => 'تحرير البطاقة';

  @override
  String get addCardTitle => 'أضف بطاقة';

  @override
  String get cardTypeLabel => 'نوع البطاقة';

  @override
  String get cardColorLabel => 'لون البطاقة';

  @override
  String get fieldRequiredError => 'هذه الخانة مطلوبه';

  @override
  String get bankNameLabel => 'اسم البنك';

  @override
  String get expiryLabel => 'انتهاء الصلاحية (شهر/سنة)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'صور البطاقة';

  @override
  String get frontSideLabel => 'الجانب الأمامي';

  @override
  String get backSideLabel => 'الجانب الخلفي';

  @override
  String get notesLabel => 'ملحوظات';

  @override
  String get saveChangesBtn => 'حفظ التغييرات';

  @override
  String get saveCardBtn => 'حفظ البطاقة';

  @override
  String get deleteCardBtn => 'حذف البطاقة';

  @override
  String get takePhotoLabel => 'التقط صورة';

  @override
  String get chooseGalleryLabel => 'اختر من المعرض';

  @override
  String get deleteCardPrompt => 'هل تريد حذف البطاقة؟';

  @override
  String get deleteCardWarning => 'لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get cardNumberLabel => 'رقم البطاقة';

  @override
  String get pointCardNumberLabel => 'رقم بطاقة النقطة';

  @override
  String get membershipIdLabel => 'معرف العضوية';

  @override
  String get couponCodeLabel => 'رمز القسيمة';

  @override
  String get giftCardNumberLabel => 'رقم بطاقة الهدية';

  @override
  String get ticketPnrLabel => 'رقم التذكرة / PNR';

  @override
  String get numberLabel => 'رقم';

  @override
  String get cardholderNameLabel => 'اسم حامل البطاقة';

  @override
  String get cardNameLabel => 'اسم البطاقة';

  @override
  String get enterValidCardNumberError => 'أدخل رقم بطاقة صالح';

  @override
  String get cardNumberInvalidError => 'يبدو رقم البطاقة غير صالح';

  @override
  String get enterMin3CharsError => 'أدخل 3 أحرف على الأقل';

  @override
  String get cardAlreadyExistsError => 'تم حفظ بطاقة بهذا الرقم بالفعل';

  @override
  String get revealCvv => 'كشف CVV';

  @override
  String get cardDetailsHeader => 'تفاصيل البطاقة:';

  @override
  String get typePrefix => 'يكتب:';

  @override
  String get bankPrefix => 'بنك:';

  @override
  String get cardNumberPrefix => 'رقم البطاقة:';

  @override
  String get cardholderPrefix => 'حامل البطاقة:';

  @override
  String get expiryPrefix => 'انتهاء الصلاحية:';

  @override
  String get notesPrefix => 'ملحوظات:';

  @override
  String get detailsSuffix => 'تفاصيل';

  @override
  String get cardDetailsTitle => 'تفاصيل البطاقة';

  @override
  String get hideBtn => 'يخفي';

  @override
  String get revealBtn => 'يكشف';

  @override
  String get editBtn => 'يحرر';

  @override
  String get cardInformationHeader => 'معلومات البطاقة';

  @override
  String get cardholderLabel => 'حامل البطاقة';

  @override
  String get nameLabel => 'اسم';

  @override
  String get bankLabel => 'بنك';

  @override
  String get pnrNumberLabel => 'رقم سجل الركاب';

  @override
  String get venueLabel => 'مكان';

  @override
  String get eventDateLabel => 'تاريخ الحدث';

  @override
  String get seatLabel => 'مقعد';

  @override
  String get classLabel => 'فصل';

  @override
  String get discountDetailsLabel => 'تفاصيل الخصم';

  @override
  String get memberIdLabel => 'معرف العضو';

  @override
  String get tierStatusLabel => 'حالة الطبقة';

  @override
  String get pointsBalanceLabel => 'رصيد النقاط';

  @override
  String get secondaryPinLabel => 'رقم التعريف الشخصي الثانوي';

  @override
  String get issueDateLabel => 'تاريخ الإصدار';

  @override
  String get documentTitleLabel => 'عنوان الوثيقة';

  @override
  String get nfcReaderTitle => 'قارئ NFC';

  @override
  String get nfcNotAvailable => 'NFC غير متوفر';

  @override
  String get nfcUnsupportedDesc => 'هذا الجهاز لا يدعم قراءة بطاقة NFC.';

  @override
  String get readyToScan => 'جاهز للمسح الضوئي';

  @override
  String get holdCardNfcPrompt =>
      'ضع بطاقتك اللاتلامسية في الجزء الخلفي من هاتفك.';

  @override
  String get scanFailed => 'فشل المسح';

  @override
  String get somethingWentWrong => 'حدث خطأ ما.';

  @override
  String get tryAgainBtn => 'حاول ثانية';

  @override
  String get cardDetected => 'تم الكشف عن البطاقة';

  @override
  String get unsupportedCardError => 'هذا النوع من البطاقة غير مدعوم.';

  @override
  String get nfcReadFailedDesc =>
      'لا يمكن قراءة هذه البطاقة. حاول مرة أخرى أو أضفه يدويًا.';

  @override
  String nfcReadError(String error) {
    return 'فشلت القراءة: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'تعذر بدء جلسة NFC: $error';
  }

  @override
  String get scanCardTitle => 'مسح البطاقة';

  @override
  String get noCameraError => 'لا توجد كاميرا متاحة على هذا الجهاز';

  @override
  String cameraStartError(String error) {
    return 'تعذر تشغيل الكاميرا: $error';
  }

  @override
  String get ocrReadError =>
      'لا يمكن قراءة تفاصيل البطاقة. حاول مرة أخرى باستخدام إضاءة أفضل.';

  @override
  String ocrScanFailed(String error) {
    return 'فشل الفحص: $error';
  }

  @override
  String get cameraPermissionDesc => 'مطلوب إذن الكاميرا لمسح البطاقة.';

  @override
  String get openSettingsBtn => 'افتح الإعدادات';

  @override
  String get notDetected => 'لم يتم الكشف عنها';

  @override
  String get scanAgainBtn => 'المسح مرة أخرى';

  @override
  String get cardPhotosDesc =>
      'احتفظ بصورة لبطاقتك للرجوع إليها بسرعة. تبقى الصور على هذا الجهاز.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'أضف صورة $label';
  }

  @override
  String get premiumTitle => 'غالي';

  @override
  String get benefitRemoveAdsTitle => 'إزالة كافة الإعلانات';

  @override
  String get benefitRemoveAdsDesc => 'لا لافتات ولا إعلانات بينية على الإطلاق';

  @override
  String get benefitFasterTitle => 'تجربة أسرع';

  @override
  String get benefitFasterDesc => 'شاشات فورية بدون أي شيء لتحميله';

  @override
  String get benefitSupportTitle => 'دعم التنمية';

  @override
  String get benefitSupportDesc => 'ساعد في الحفاظ على نمو التطبيق';

  @override
  String get benefitBadgeTitle => 'شارة مميزة';

  @override
  String get benefitBadgeDesc => 'القليل من الشكر على ملفك الشخصي';

  @override
  String get premiumHeroActive => 'أنت مميز';

  @override
  String get premiumHeroInactive => 'اذهب خالية من الإعلانات';

  @override
  String get premiumHeroDescActive => 'شكرا لدعم محفظة البطاقة';

  @override
  String get premiumHeroDescInactive =>
      'قم بإزالة الإعلانات واحصل على تجربة أنظف';

  @override
  String get disablePremiumBtn => 'تعطيل بريميوم';

  @override
  String get removeAdsBtn => 'إزالة الإعلانات';

  @override
  String get premiumOneTimeNotice =>
      'لمرة واحدة. يستعيد على الفور على هذا الجهاز.';

  @override
  String get noBiometricsConfigured =>
      'لم يتم تكوين قفل الجهاز/القياسات الحيوية على هذا الجهاز';

  @override
  String get cardTypeCredit => 'بطاقة إئتمان';

  @override
  String get cardTypeDebit => 'بطاقة الخصم';

  @override
  String get cardTypePoint => 'بطاقة النقطة';

  @override
  String get cardTypeMembership => 'بطاقة العضوية';

  @override
  String get cardTypeCoupon => 'قسيمة';

  @override
  String get cardTypeGift => 'بطاقة هدية';

  @override
  String get cardTypeEventTicket => 'تذكرة الحدث';

  @override
  String get cardTypeOther => 'آخر';

  @override
  String get chooseCardType => 'اختر نوع البطاقة';

  @override
  String get selectCustomColor => 'حدد اللون المخصص';

  @override
  String get solidColor => 'صلب';

  @override
  String get gradientColor => 'التدرج';

  @override
  String get startColor => 'يبدأ';

  @override
  String get endColor => 'نهاية';

  @override
  String get cardExpLabel => 'خبرة';

  @override
  String get homeTab => 'بيت';

  @override
  String get cardsTab => 'بطاقاتي';

  @override
  String get profileTab => 'حساب تعريفي';

  @override
  String get appTitleTypewriter => 'محفظة البطاقة';

  @override
  String get seeAll => 'رؤية الكل';

  @override
  String get backupShareText => 'محفظة البطاقة احتياطية آمنة';

  @override
  String get backupFileNotFoundError => 'لم يتم العثور على ملف النسخ الاحتياطي';

  @override
  String get corruptedBackupError => 'ملف النسخ الاحتياطي تالف أو غير صالح';

  @override
  String get invalidBackupDataError =>
      'ملف النسخ الاحتياطي لا يحتوي على بيانات صالحة.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'نسخة احتياطية غير مدعومة: $version';
  }
}
