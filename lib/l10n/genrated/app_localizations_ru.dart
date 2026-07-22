// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Кошелек карт';

  @override
  String get addCard => 'Добавить карту';

  @override
  String get hiThere => 'Привет 👋';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get appLock => 'Блокировка приложения';

  @override
  String get appLockSubtitle => 'Требовать биометрию для входа';

  @override
  String get language => 'Язык';

  @override
  String get backupRestore => 'Резервное копирование';

  @override
  String get backupRestoreSubtitle => 'Экспорт и импорт карт локально';

  @override
  String get clearAllData => 'Очистить все данные';

  @override
  String get goodMorning => 'Доброе утро';

  @override
  String get goodAfternoon => 'Добрый день';

  @override
  String get goodEvening => 'Добрый вечер';

  @override
  String hiName(String name) {
    return 'Привет, $name 👋';
  }

  @override
  String get addNewCard => 'Добавить новую карту';

  @override
  String get scan => 'Сканировать';

  @override
  String get scanDesc => 'Мгновенное сканирование\nдеталей карты';

  @override
  String get manually => 'Вручную';

  @override
  String get manuallyDesc => 'Ввести данные карты\nвручную';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Приложите карту для\nдобавления через NFC';

  @override
  String get tools => 'Инструменты';

  @override
  String get binChecker => 'Проверка BIN';

  @override
  String get binCheckerDesc => 'Проверить данные карты по BIN';

  @override
  String get cardVerify => 'Проверка карты';

  @override
  String get cardVerifyDesc => 'Проверить номер карты';

  @override
  String get frequentlyAdded => 'Часто добавляемые';

  @override
  String get cardsTitle => 'Карты';

  @override
  String get yourCardsManage => 'Управление вашими картами';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сохранено $count карт',
      few: 'Сохранено $count карты',
      one: 'Сохранена 1 карта',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count карт',
      few: '$count карты',
      one: '1 карта',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Все';

  @override
  String get noCardsYet => 'Пока нет карт';

  @override
  String get noCardsYetDesc => 'Перейдите на Главную или сканируйте карту';

  @override
  String get noCardsCategory => 'Нет карт в этой категории';

  @override
  String get tryDifferentFilter => 'Попробуйте выбрать другой фильтр';

  @override
  String get addFirstCardStart => 'Добавьте свою первую карту, чтобы начать';

  @override
  String get rateUs => 'Оценить нас';

  @override
  String get rateUsThanks => 'Спасибо за поддержку!';

  @override
  String get shareApp => 'Поделиться';

  @override
  String get shareAppSoon => 'Скоро появится возможность поделиться';

  @override
  String get help => 'Помощь';

  @override
  String get supportSoon => 'Поддержка скоро появится';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get privacyPolicySoon => 'Открывает политику конфиденциальности';

  @override
  String get termsOfUse => 'Условия использования';

  @override
  String get termsOfUseSoon => 'Открывает условия использования';

  @override
  String get clearDataTitle => 'Очистить все данные?';

  @override
  String get clearDataDesc =>
      'Это навсегда удалит все сохраненные карты. Отменить это нельзя.';

  @override
  String get cancel => 'Отмена';

  @override
  String get clearDataConfirm => 'Очистить данные';

  @override
  String get clearDataToast => 'Все данные очищены';

  @override
  String get splashSubtitle => 'Ваши карты, надежно и просто';

  @override
  String get unlockPrompt => 'Разблокируйте Кошелек карт для продолжения';

  @override
  String get tapToUnlock => 'Нажмите для разблокировки';

  @override
  String get authFailed => 'Ошибка аутентификации';

  @override
  String get binCheckerTitle => 'Проверка BIN';

  @override
  String get enterMin6Digits => 'Введите минимум 6 цифр';

  @override
  String get binNotVerified => 'Этот BIN не удалось проверить';

  @override
  String get lookupFailed =>
      'Ошибка проверки. Проверьте подключение и повторите попытку.';

  @override
  String get binLookupPlaceholder => 'ПОИСК BIN / IIN';

  @override
  String get enterDigitsLabel => 'Введите первые 6–8 цифр';

  @override
  String get checkButton => 'Проверить';

  @override
  String get binResultTitle => 'Результат BIN';

  @override
  String get cardNetwork => 'Платежная система';

  @override
  String get cardType => 'Тип';

  @override
  String get cardBrandCategory => 'Бренд/Категория';

  @override
  String get cardBank => 'Банк';

  @override
  String get cardCountry => 'Страна';

  @override
  String get cardCountryCode => 'Код страны';

  @override
  String get cardCurrency => 'Валюта';

  @override
  String get cardValid => 'Действительна';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get cardValidatorTitle => 'Проверка карты';

  @override
  String get cardValidatorPreviewName => 'ПРОВЕРКА КАРТЫ';

  @override
  String get enterCardNumberLabel => 'Введите номер карты';

  @override
  String get validCardNumber => 'Действительный номер карты';

  @override
  String get invalidCardNumber =>
      'Недействительный номер карты — проверьте цифры';

  @override
  String get backupRestoreTitle => 'Резервное копирование';

  @override
  String get createBackupPass => 'Создать пароль резервной копии';

  @override
  String get backupPassWarning =>
      'ВАЖНО: Запишите этот пароль. Мы не сможем восстановить его или ваши данные, если вы его забудете.';

  @override
  String get enterPassLabel => 'Введите пароль';

  @override
  String get confirmPassLabel => 'Подтвердите пароль';

  @override
  String get passEmptyError => 'Пароль не может быть пустым';

  @override
  String get passMismatchError => 'Пароли не совпадают';

  @override
  String get doneBtn => 'Готово';

  @override
  String get enterBackupPass => 'Введите пароль копии';

  @override
  String get noCardsToBackup => 'Нет карт для копирования';

  @override
  String get backupSuccess => 'Копия успешно создана!';

  @override
  String backupFailed(String error) {
    return 'Ошибка копирования: $error';
  }

  @override
  String get restoreBackupTitle => 'Восстановить копию?';

  @override
  String get restoreBackupWarning =>
      'ПРЕДУПРЕЖДЕНИЕ: Восстановление перезапишет все текущие карты и транзакции. Это нельзя отменить.';

  @override
  String get continueBtn => 'Продолжить';

  @override
  String get restoreSuccess => 'Данные успешно восстановлены!';

  @override
  String get incorrectPasswordError =>
      'Неверный пароль или поврежденный файл копии.';

  @override
  String restoreFailed(String error) {
    return 'Ошибка восстановления: $error';
  }

  @override
  String get deleteBackupTitle => 'Удалить резервную копию?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Удалить \"$name\"? Это нельзя отменить.';
  }

  @override
  String get deleteBtn => 'Удалить';

  @override
  String get backupDeleted => 'Резервная копия удалена';

  @override
  String failedShareBackup(String error) {
    return 'Не удалось поделиться копией: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Не удалось выбрать файл: $error';
  }

  @override
  String get lastBackup => 'Последнее копирование';

  @override
  String get neverBackedUp => 'Копия не создавалась';

  @override
  String get backupType => 'Тип копирования';

  @override
  String get localBackupDesc =>
      'Локально — сохранено только на этом устройстве';

  @override
  String get createBackupBtn => 'Создать копию';

  @override
  String get importExternalBackupBtn => 'Импортировать копию';

  @override
  String get savedBackupsHeader => 'Сохраненные копии';

  @override
  String get noBackupsYet => 'Пока нет резервных копий';

  @override
  String get tapCreateBackupDesc =>
      'Нажмите \"Создать копию\", чтобы сохранить карты';

  @override
  String get restoreTooltip => 'Восстановить';

  @override
  String get shareTooltip => 'Поделиться';

  @override
  String get cardNotFound => 'Карта не найдена';

  @override
  String get editCardTitle => 'Редактировать карту';

  @override
  String get addCardTitle => 'Добавить карту';

  @override
  String get cardTypeLabel => 'Тип карты';

  @override
  String get cardColorLabel => 'Цвет карты';

  @override
  String get fieldRequiredError => 'Это поле обязательно';

  @override
  String get bankNameLabel => 'Название банка';

  @override
  String get expiryLabel => 'Срок действия (ММ/ГГ)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Фотографии карты';

  @override
  String get frontSideLabel => 'Лицевая сторона';

  @override
  String get backSideLabel => 'Оборотная сторона';

  @override
  String get notesLabel => 'Заметки';

  @override
  String get saveChangesBtn => 'Сохранить изменения';

  @override
  String get saveCardBtn => 'Сохранить карту';

  @override
  String get deleteCardBtn => 'Удалить карту';

  @override
  String get takePhotoLabel => 'Сделать фото';

  @override
  String get chooseGalleryLabel => 'Выбрать из галереи';

  @override
  String get deleteCardPrompt => 'Удалить карту?';

  @override
  String get deleteCardWarning => 'Это действие нельзя отменить.';

  @override
  String get cardNumberLabel => 'Номер карты';

  @override
  String get pointCardNumberLabel => 'Номер бонусной карты';

  @override
  String get membershipIdLabel => 'ID участника';

  @override
  String get couponCodeLabel => 'Код купона';

  @override
  String get giftCardNumberLabel => 'Номер подарочной карты';

  @override
  String get ticketPnrLabel => 'Номер билета / PNR';

  @override
  String get numberLabel => 'Номер';

  @override
  String get cardholderNameLabel => 'Имя владельца карты';

  @override
  String get cardNameLabel => 'Название карты';

  @override
  String get enterValidCardNumberError => 'Введите действительный номер карты';

  @override
  String get cardNumberInvalidError => 'Номер карты выглядит недействительным';

  @override
  String get enterMin3CharsError => 'Введите минимум 3 символа';

  @override
  String get cardAlreadyExistsError => 'Карта с таким номером уже сохранена';

  @override
  String get revealCvv => 'Показать CVV';

  @override
  String get cardDetailsHeader => 'Детали карты:';

  @override
  String get typePrefix => 'Тип: ';

  @override
  String get bankPrefix => 'Банк: ';

  @override
  String get cardNumberPrefix => 'Номер карты: ';

  @override
  String get cardholderPrefix => 'Владелец: ';

  @override
  String get expiryPrefix => 'Срок: ';

  @override
  String get notesPrefix => 'Заметки: ';

  @override
  String get detailsSuffix => ' Детали';

  @override
  String get cardDetailsTitle => 'Детали карты';

  @override
  String get hideBtn => 'Скрыть';

  @override
  String get revealBtn => 'Показать';

  @override
  String get editBtn => 'Изменить';

  @override
  String get cardInformationHeader => 'Информация о карте';

  @override
  String get cardholderLabel => 'Владелец карты';

  @override
  String get nameLabel => 'Имя';

  @override
  String get bankLabel => 'Банк';

  @override
  String get pnrNumberLabel => 'Номер PNR';

  @override
  String get venueLabel => 'Место';

  @override
  String get eventDateLabel => 'Дата мероприятия';

  @override
  String get seatLabel => 'Место';

  @override
  String get classLabel => 'Класс';

  @override
  String get discountDetailsLabel => 'Детали скидки';

  @override
  String get memberIdLabel => 'ID участника';

  @override
  String get tierStatusLabel => 'Уровень статуса';

  @override
  String get pointsBalanceLabel => 'Баланс баллов';

  @override
  String get secondaryPinLabel => 'Дополнительный PIN';

  @override
  String get issueDateLabel => 'Дата выдачи';

  @override
  String get documentTitleLabel => 'Название документа';

  @override
  String get nfcReaderTitle => 'NFC Считыватель';

  @override
  String get nfcNotAvailable => 'NFC недоступен';

  @override
  String get nfcUnsupportedDesc =>
      'Это устройство не поддерживает чтение карт NFC.';

  @override
  String get readyToScan => 'Готов к сканированию';

  @override
  String get holdCardNfcPrompt =>
      'Приложите бесконтактную карту к задней панели телефона.';

  @override
  String get scanFailed => 'Ошибка сканирования';

  @override
  String get somethingWentWrong => 'Что-то пошло не так.';

  @override
  String get tryAgainBtn => 'Попробовать снова';

  @override
  String get cardDetected => 'Карта обнаружена';

  @override
  String get unsupportedCardError => 'Этот тип карты не поддерживается.';

  @override
  String get nfcReadFailedDesc =>
      'Не удалось прочитать карту. Попробуйте снова или добавьте вручную.';

  @override
  String nfcReadError(String error) {
    return 'Ошибка чтения: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Не удалось начать сеанс NFC: $error';
  }

  @override
  String get scanCardTitle => 'Сканировать карту';

  @override
  String get noCameraError => 'Камера недоступна на этом устройстве';

  @override
  String cameraStartError(String error) {
    return 'Не удалось запустить камеру: $error';
  }

  @override
  String get ocrReadError =>
      'Не удалось прочитать данные карты. Попробуйте при лучшем освещении.';

  @override
  String ocrScanFailed(String error) {
    return 'Ошибка сканирования: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Для сканирования карты требуется разрешение на доступ к камере.';

  @override
  String get openSettingsBtn => 'Открыть настройки';

  @override
  String get notDetected => 'Не обнаружено';

  @override
  String get scanAgainBtn => 'Сканировать снова';

  @override
  String get cardPhotosDesc =>
      'Сохраняйте фото карты для быстрого доступа. Изображения хранятся на устройстве.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Добавить фото $label';
  }

  @override
  String get premiumTitle => 'Премиум';

  @override
  String get benefitRemoveAdsTitle => 'Без рекламы';

  @override
  String get benefitRemoveAdsDesc => 'Никаких баннеров и межстраничной рекламы';

  @override
  String get benefitFasterTitle => 'Высокая скорость';

  @override
  String get benefitFasterDesc => 'Мгновенная загрузка экранов';

  @override
  String get benefitSupportTitle => 'Поддержка разработки';

  @override
  String get benefitSupportDesc => 'Помогите приложению развиваться дальше';

  @override
  String get benefitBadgeTitle => 'Значок Премиум';

  @override
  String get benefitBadgeDesc => 'Особый значок в вашем профиле';

  @override
  String get premiumHeroActive => 'У вас Премиум';

  @override
  String get premiumHeroInactive => 'Отключить рекламу';

  @override
  String get premiumHeroDescActive => 'Спасибо за поддержку Кошелька карт';

  @override
  String get premiumHeroDescInactive =>
      'Уберите рекламу и наслаждайтесь удобством';

  @override
  String get disablePremiumBtn => 'Отключить Премиум';

  @override
  String get removeAdsBtn => 'Убрать рекламу';

  @override
  String get premiumOneTimeNotice =>
      'Разовая покупка. Мгновенно восстанавливается на этом устройстве.';

  @override
  String get noBiometricsConfigured =>
      'На этом устройстве не настроена биометрия или блокировка экрана';

  @override
  String get cardTypeCredit => 'Кредитная карта';

  @override
  String get cardTypeDebit => 'Дебетовая карта';

  @override
  String get cardTypePoint => 'Бонусная карта';

  @override
  String get cardTypeMembership => 'Клубная карта';

  @override
  String get cardTypeCoupon => 'Купон';

  @override
  String get cardTypeGift => 'Подарочная карта';

  @override
  String get cardTypeEventTicket => 'Билет на мероприятие';

  @override
  String get cardTypeOther => 'Другое';

  @override
  String get chooseCardType => 'Выберите тип карты';

  @override
  String get selectCustomColor => 'Выбрать свой цвет';

  @override
  String get solidColor => 'Сплошной';

  @override
  String get gradientColor => 'Градиент';

  @override
  String get startColor => 'Начальный';

  @override
  String get endColor => 'Конечный';

  @override
  String get cardExpLabel => 'СРОК';

  @override
  String get homeTab => 'Главная';

  @override
  String get cardsTab => 'Мои карты';

  @override
  String get profileTab => 'Профиль';

  @override
  String get appTitleTypewriter => 'Кошелек карт';

  @override
  String get seeAll => 'Смотреть все';

  @override
  String get backupShareText => 'Защищенная копирования Кошелька карт';

  @override
  String get backupFileNotFoundError => 'Файл резервной копии не найден';

  @override
  String get corruptedBackupError =>
      'Поврежденный или недействительный файл копии';

  @override
  String get invalidBackupDataError =>
      'Файл резервной копии не содержит верных данных.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Неподдерживаемая версия копии: $version';
  }
}
