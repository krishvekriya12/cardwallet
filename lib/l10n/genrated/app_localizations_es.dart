// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Aplicación Monedero de tarjeta';

  @override
  String get addCard => 'Agregar tarjeta';

  @override
  String get hiThere => 'Hi, there 👋';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get appLock => 'Bloqueo de aplicaciones';

  @override
  String get appLockSubtitle =>
      'Requerir datos biométricos para abrir la aplicación.';

  @override
  String get language => 'Idioma';

  @override
  String get backupRestore => 'Copia de seguridad y restauración';

  @override
  String get backupRestoreSubtitle =>
      'Exporta e importa tus tarjetas localmente';

  @override
  String get clearAllData => 'Borrar todos los datos';

  @override
  String get goodMorning => 'Buen día';

  @override
  String get goodAfternoon => 'Buenas tardes';

  @override
  String get goodEvening => 'Buenas noches';

  @override
  String hiName(String name) {
    return 'Hi, $name 👋';
  }

  @override
  String get addNewCard => 'Agregar nueva tarjeta';

  @override
  String get scan => 'Escanear';

  @override
  String get scanDesc => 'Detalles de la tarjeta escaneada\nal instante';

  @override
  String get manually => 'A mano';

  @override
  String get manuallyDesc => 'Introduce los datos de la tarjeta\nmanualmente';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Toca la tarjeta para agregar\nusando NFC';

  @override
  String get tools => 'Herramientas';

  @override
  String get binChecker => 'Comprobador de BIN';

  @override
  String get binCheckerDesc => 'Consultar los datos de la tarjeta desde BIN';

  @override
  String get cardVerify => 'Verificar tarjeta';

  @override
  String get cardVerifyDesc => 'Validar un número de tarjeta';

  @override
  String get frequentlyAdded => 'Agregado con frecuencia';

  @override
  String get cardsTitle => 'Tarjetas';

  @override
  String get yourCardsManage => 'Tus tarjetas aquí para gestionar';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarjetas guardadas',
      one: '1 tarjeta guardada',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tarjetas',
      one: '1 tarjeta',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Todo';

  @override
  String get noCardsYet => 'Aún no hay tarjetas';

  @override
  String get noCardsYetDesc =>
      'Vaya a Inicio o toque el escáner para agregar una tarjeta';

  @override
  String get noCardsCategory => 'No hay tarjetas en esta categoría.';

  @override
  String get tryDifferentFilter => 'Intente seleccionar un filtro diferente';

  @override
  String get addFirstCardStart => 'Añade tu primera tarjeta para empezar';

  @override
  String get rateUs => 'Califícanos';

  @override
  String get rateUsThanks => '¡Gracias por el apoyo!';

  @override
  String get shareApp => 'Compartir aplicación';

  @override
  String get shareAppSoon => 'Compartir próximamente';

  @override
  String get help => 'Ayuda';

  @override
  String get supportSoon => 'Soporte próximamente';

  @override
  String get privacyPolicy => 'política de privacidad';

  @override
  String get privacyPolicySoon => 'Abre la política de privacidad.';

  @override
  String get termsOfUse => 'Condiciones de uso';

  @override
  String get termsOfUseSoon => 'Abre las condiciones de uso.';

  @override
  String get clearDataTitle => '¿Borrar todos los datos?';

  @override
  String get clearDataDesc =>
      'Esto elimina permanentemente todas las tarjetas guardadas. Esto no se puede deshacer.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clearDataConfirm => 'Borrar datos';

  @override
  String get clearDataToast => 'Todos los datos borrados';

  @override
  String get splashSubtitle => 'Tus tarjetas, seguras y sencillas';

  @override
  String get unlockPrompt => 'Desbloquee Card Wallet para continuar';

  @override
  String get tapToUnlock => 'Toque para desbloquear';

  @override
  String get authFailed => 'Error de autenticación';

  @override
  String get binCheckerTitle => 'Comprobador de BIN';

  @override
  String get enterMin6Digits => 'Introduzca al menos 6 dígitos';

  @override
  String get binNotVerified => 'Este BIN no se pudo verificar';

  @override
  String get lookupFailed =>
      'La búsqueda falló. Comprueba tu conexión y vuelve a intentarlo.';

  @override
  String get binLookupPlaceholder => 'BÚSQUEDA DE BIN/IIN';

  @override
  String get enterDigitsLabel => 'Ingrese los primeros 6 a 8 dígitos';

  @override
  String get checkButton => 'Controlar';

  @override
  String get binResultTitle => 'Resultado BIN';

  @override
  String get cardNetwork => 'Red';

  @override
  String get cardType => 'Tipo';

  @override
  String get cardBrandCategory => 'Marca/Categoría';

  @override
  String get cardBank => 'Banco';

  @override
  String get cardCountry => 'País';

  @override
  String get cardCountryCode => 'Código del país';

  @override
  String get cardCurrency => 'Divisa';

  @override
  String get cardValid => 'Válido';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get cardValidatorTitle => 'Validador de tarjetas';

  @override
  String get cardValidatorPreviewName => 'VALIDADOR DE TARJETAS';

  @override
  String get enterCardNumberLabel => 'Introduce el número de tarjeta';

  @override
  String get validCardNumber => 'Número de tarjeta válida';

  @override
  String get invalidCardNumber =>
      'Número de tarjeta no válido: verifique los dígitos';

  @override
  String get backupRestoreTitle => 'Copia de seguridad y restauración';

  @override
  String get createBackupPass => 'Crear contraseña de respaldo';

  @override
  String get backupPassWarning =>
      'IMPORTANTE: Anota esta contraseña. No podemos recuperarlo ni restaurar su copia de seguridad si la olvida.';

  @override
  String get enterPassLabel => 'Ingrese la contraseña';

  @override
  String get confirmPassLabel => 'confirmar Contraseña';

  @override
  String get passEmptyError => 'La contraseña no puede estar vacía';

  @override
  String get passMismatchError => 'Las contraseñas no coinciden';

  @override
  String get doneBtn => 'Hecho';

  @override
  String get enterBackupPass => 'Ingrese la contraseña de respaldo';

  @override
  String get noCardsToBackup => 'No hay tarjetas para respaldar';

  @override
  String get backupSuccess => '¡Copia de seguridad creada exitosamente!';

  @override
  String backupFailed(String error) {
    return 'Error en la copia de seguridad: $error';
  }

  @override
  String get restoreBackupTitle => '¿Restaurar copia de seguridad?';

  @override
  String get restoreBackupWarning =>
      'ADVERTENCIA: Al restaurar una copia de seguridad se sobrescribirán todas las tarjetas y transacciones actuales. Esto no se puede deshacer.';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get restoreSuccess =>
      '¡La copia de seguridad se restauró exitosamente!';

  @override
  String get incorrectPasswordError =>
      'Contraseña incorrecta o archivo de copia de seguridad dañado.';

  @override
  String restoreFailed(String error) {
    return 'Error de restauración: $error';
  }

  @override
  String get deleteBackupTitle => '¿Eliminar copia de seguridad?';

  @override
  String deleteBackupConfirmText(String name) {
    return '¿Eliminar \"$name\"? Esto no se puede deshacer.';
  }

  @override
  String get deleteBtn => 'Borrar';

  @override
  String get backupDeleted => 'Copia de seguridad eliminada';

  @override
  String failedShareBackup(String error) {
    return 'No se pudo compartir la copia de seguridad: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'No se pudo seleccionar el archivo: $error';
  }

  @override
  String get lastBackup => 'Última copia de seguridad';

  @override
  String get neverBackedUp => 'Nunca hice una copia de seguridad';

  @override
  String get backupType => 'Tipo de copia de seguridad';

  @override
  String get localBackupDesc => 'Local: guardado solo en este dispositivo';

  @override
  String get createBackupBtn => 'Crear copia de seguridad';

  @override
  String get importExternalBackupBtn => 'Importar copia de seguridad externa';

  @override
  String get savedBackupsHeader => 'Copias de seguridad guardadas';

  @override
  String get noBackupsYet => 'Aún no hay copias de seguridad';

  @override
  String get tapCreateBackupDesc =>
      'Toca \"Crear copia de seguridad\" para guardar tus tarjetas.';

  @override
  String get restoreTooltip => 'Restaurar';

  @override
  String get shareTooltip => 'Compartir';

  @override
  String get cardNotFound => 'Tarjeta no encontrada';

  @override
  String get editCardTitle => 'Editar tarjeta';

  @override
  String get addCardTitle => 'Agregar tarjeta';

  @override
  String get cardTypeLabel => 'Tipo de tarjeta';

  @override
  String get cardColorLabel => 'Color de la tarjeta';

  @override
  String get fieldRequiredError => 'Este campo es obligatorio';

  @override
  String get bankNameLabel => 'Nombre del banco';

  @override
  String get expiryLabel => 'Caducidad (MM/AA)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Fotos de Tarjetas';

  @override
  String get frontSideLabel => 'Lado frontal';

  @override
  String get backSideLabel => 'Lado trasero';

  @override
  String get notesLabel => 'Notas';

  @override
  String get saveChangesBtn => 'Guardar cambios';

  @override
  String get saveCardBtn => 'Guardar tarjeta';

  @override
  String get deleteCardBtn => 'Eliminar tarjeta';

  @override
  String get takePhotoLabel => 'tomar una foto';

  @override
  String get chooseGalleryLabel => 'Elige de la galería';

  @override
  String get deleteCardPrompt => '¿Eliminar tarjeta?';

  @override
  String get deleteCardWarning => 'Esta acción no se puede deshacer.';

  @override
  String get cardNumberLabel => 'Número de tarjeta';

  @override
  String get pointCardNumberLabel => 'Número de tarjeta de puntos';

  @override
  String get membershipIdLabel => 'ID de membresía';

  @override
  String get couponCodeLabel => 'Código de cupón';

  @override
  String get giftCardNumberLabel => 'Número de tarjeta de regalo';

  @override
  String get ticketPnrLabel => 'Número de billete/PNR';

  @override
  String get numberLabel => 'Número';

  @override
  String get cardholderNameLabel => 'Nombre del titular de la tarjeta';

  @override
  String get cardNameLabel => 'Nombre de la tarjeta';

  @override
  String get enterValidCardNumberError =>
      'Introduzca un número de tarjeta válido';

  @override
  String get cardNumberInvalidError => 'El número de tarjeta parece no válido';

  @override
  String get enterMin3CharsError => 'Introduzca al menos 3 caracteres';

  @override
  String get cardAlreadyExistsError =>
      'Ya hay guardada una tarjeta con este número';

  @override
  String get revealCvv => 'Revelar CVV';

  @override
  String get cardDetailsHeader => 'Detalles de la tarjeta:';

  @override
  String get typePrefix => 'Tipo:';

  @override
  String get bankPrefix => 'Banco:';

  @override
  String get cardNumberPrefix => 'Número de tarjeta:';

  @override
  String get cardholderPrefix => 'Titular de la tarjeta:';

  @override
  String get expiryPrefix => 'Expiración:';

  @override
  String get notesPrefix => 'Notas:';

  @override
  String get detailsSuffix => 'Detalles';

  @override
  String get cardDetailsTitle => 'Detalles de la tarjeta';

  @override
  String get hideBtn => 'Esconder';

  @override
  String get revealBtn => 'Revelar';

  @override
  String get editBtn => 'Editar';

  @override
  String get cardInformationHeader => 'Información de la tarjeta';

  @override
  String get cardholderLabel => 'Titular de la tarjeta';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get bankLabel => 'Banco';

  @override
  String get pnrNumberLabel => 'Número PNR';

  @override
  String get venueLabel => 'Evento';

  @override
  String get eventDateLabel => 'Fecha del evento';

  @override
  String get seatLabel => 'Asiento';

  @override
  String get classLabel => 'Clase';

  @override
  String get discountDetailsLabel => 'Detalles del descuento';

  @override
  String get memberIdLabel => 'ID de miembro';

  @override
  String get tierStatusLabel => 'Estado del nivel';

  @override
  String get pointsBalanceLabel => 'Saldo de puntos';

  @override
  String get secondaryPinLabel => 'PIN secundario';

  @override
  String get issueDateLabel => 'Fecha de asunto';

  @override
  String get documentTitleLabel => 'Título del documento';

  @override
  String get nfcReaderTitle => 'Lector NFC';

  @override
  String get nfcNotAvailable => 'NFC no disponible';

  @override
  String get nfcUnsupportedDesc =>
      'Este dispositivo no admite la lectura de tarjetas NFC.';

  @override
  String get readyToScan => 'Listo para escanear';

  @override
  String get holdCardNfcPrompt =>
      'Coloque su tarjeta sin contacto en la parte posterior de su teléfono.';

  @override
  String get scanFailed => 'Error de escaneo';

  @override
  String get somethingWentWrong => 'Algo salió mal.';

  @override
  String get tryAgainBtn => 'Intentar otra vez';

  @override
  String get cardDetected => 'Tarjeta detectada';

  @override
  String get unsupportedCardError => 'Este tipo de tarjeta no es compatible.';

  @override
  String get nfcReadFailedDesc =>
      'No se pudo leer esta tarjeta. Inténtalo de nuevo o agrégalo manualmente.';

  @override
  String nfcReadError(String error) {
    return 'Error de lectura: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'No se pudo iniciar la sesión NFC: $error';
  }

  @override
  String get scanCardTitle => 'Escanear tarjeta';

  @override
  String get noCameraError => 'No hay cámara disponible en este dispositivo';

  @override
  String cameraStartError(String error) {
    return 'No se pudo iniciar la cámara: $error';
  }

  @override
  String get ocrReadError =>
      'No se pudieron leer los detalles de la tarjeta. Inténtalo de nuevo con mejor iluminación.';

  @override
  String ocrScanFailed(String error) {
    return 'Error de escaneo: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'Se requiere permiso de la cámara para escanear una tarjeta.';

  @override
  String get openSettingsBtn => 'Abrir configuración';

  @override
  String get notDetected => 'No detectado';

  @override
  String get scanAgainBtn => 'Escanear de nuevo';

  @override
  String get cardPhotosDesc =>
      'Guarde una foto de su tarjeta para referencia rápida. Las imágenes permanecen en este dispositivo.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Añadir $label foto';
  }

  @override
  String get premiumTitle => 'De primera calidad';

  @override
  String get benefitRemoveAdsTitle => 'Eliminar todos los anuncios';

  @override
  String get benefitRemoveAdsDesc => 'Sin pancartas ni intersticiales, nunca';

  @override
  String get benefitFasterTitle => 'Experiencia más rápida';

  @override
  String get benefitFasterDesc => 'Pantallas instantáneas sin nada que cargar';

  @override
  String get benefitSupportTitle => 'Apoyar el desarrollo';

  @override
  String get benefitSupportDesc => 'Ayude a que la aplicación siga creciendo';

  @override
  String get benefitBadgeTitle => 'Insignia premium';

  @override
  String get benefitBadgeDesc => 'Un pequeño agradecimiento en tu perfil.';

  @override
  String get premiumHeroActive => 'Eres premium';

  @override
  String get premiumHeroInactive => 'Vaya sin publicidad';

  @override
  String get premiumHeroDescActive => 'Gracias por apoyar Card Wallet';

  @override
  String get premiumHeroDescInactive =>
      'Elimina anuncios y desbloquea una experiencia más limpia';

  @override
  String get disablePremiumBtn => 'Desactivar prima';

  @override
  String get removeAdsBtn => 'Eliminar anuncios';

  @override
  String get premiumOneTimeNotice =>
      'Una sola vez. Se restaura instantáneamente en este dispositivo.';

  @override
  String get noBiometricsConfigured =>
      'No hay datos biométricos/bloqueo de dispositivo configurados en este dispositivo';

  @override
  String get cardTypeCredit => 'Tarjeta de crédito';

  @override
  String get cardTypeDebit => 'Tarjeta de débito';

  @override
  String get cardTypePoint => 'Tarjeta de puntos';

  @override
  String get cardTypeMembership => 'Tarjeta de Membresía';

  @override
  String get cardTypeCoupon => 'Cupón';

  @override
  String get cardTypeGift => 'Tarjeta de regalo';

  @override
  String get cardTypeEventTicket => 'Entrada al evento';

  @override
  String get cardTypeOther => 'Otro';

  @override
  String get chooseCardType => 'Elige tipo de tarjeta';

  @override
  String get selectCustomColor => 'Seleccionar color personalizado';

  @override
  String get solidColor => 'Sólido';

  @override
  String get gradientColor => 'Gradiente';

  @override
  String get startColor => 'Comenzar';

  @override
  String get endColor => 'Fin';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Hogar';

  @override
  String get cardsTab => 'Mis Tarjetas';

  @override
  String get profileTab => 'Perfil';

  @override
  String get appTitleTypewriter => 'Cartera de tarjeta';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get backupShareText =>
      'Copia de seguridad segura de la billetera de la tarjeta';

  @override
  String get backupFileNotFoundError =>
      'Archivo de copia de seguridad no encontrado';

  @override
  String get corruptedBackupError =>
      'Archivo de copia de seguridad dañado o no válido';

  @override
  String get invalidBackupDataError =>
      'El archivo de copia de seguridad no contiene datos válidos.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Versión de respaldo no compatible: $version';
  }
}
