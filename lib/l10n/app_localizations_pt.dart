// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Aplicativo de carteira de cartão';

  @override
  String get addCard => 'Adicionar cartão';

  @override
  String get hiThere => 'Olá, 👋';

  @override
  String get settingsTitle => 'Configurações';

  @override
  String get appLock => 'Bloqueio de aplicativo';

  @override
  String get appLockSubtitle => 'Exigir biometria para abrir o aplicativo';

  @override
  String get language => 'Linguagem';

  @override
  String get backupRestore => 'Backup e restauração';

  @override
  String get backupRestoreSubtitle =>
      'Exporte e importe seus cartões localmente';

  @override
  String get clearAllData => 'Limpar todos os dados';

  @override
  String get goodMorning => 'Bom dia';

  @override
  String get goodAfternoon => 'Boa tarde';

  @override
  String get goodEvening => 'Boa noite';

  @override
  String hiName(String name) {
    return 'Olá, $name 👋';
  }

  @override
  String get addNewCard => 'Adicionar novo cartão';

  @override
  String get scan => 'Digitalizar';

  @override
  String get scanDesc => 'Digitalizar detalhes do cartão\ninstantaneamente';

  @override
  String get manually => 'Manualmente';

  @override
  String get manuallyDesc => 'Insira os detalhes do cartão\nmanualmente';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => 'Toque no cartão para adicionar\nusando NFC';

  @override
  String get tools => 'Ferramentas';

  @override
  String get binChecker => 'Verificador de BIN';

  @override
  String get binCheckerDesc => 'Verifique os detalhes do cartão no BIN';

  @override
  String get cardVerify => 'Verificação de cartão';

  @override
  String get cardVerifyDesc => 'Validar um número de cartão';

  @override
  String get frequentlyAdded => 'Adicionado frequentemente';

  @override
  String get cardsTitle => 'Cartões';

  @override
  String get yourCardsManage => 'Seus cartões aqui para gerenciar';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cartões $count salvos',
      one: '1 cartão salvo',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cartões $count',
      one: '1 cartão',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => 'Todos';

  @override
  String get noCardsYet => 'Ainda não há cartões';

  @override
  String get noCardsYetDesc =>
      'Vá para a página inicial ou toque no scanner para adicionar um cartão';

  @override
  String get noCardsCategory => 'Nenhum cartão nesta categoria';

  @override
  String get tryDifferentFilter => 'Tente selecionar um filtro diferente';

  @override
  String get addFirstCardStart => 'Adicione seu primeiro cartão para começar';

  @override
  String get rateUs => 'Avalie-nos';

  @override
  String get rateUsThanks => 'Obrigado pelo apoio!';

  @override
  String get shareApp => 'Compartilhar aplicativo';

  @override
  String get shareAppSoon => 'Compartilhamento em breve';

  @override
  String get help => 'Ajuda';

  @override
  String get supportSoon => 'Suporte em breve';

  @override
  String get privacyPolicy => 'política de Privacidade';

  @override
  String get privacyPolicySoon => 'Abre a política de privacidade';

  @override
  String get termsOfUse => 'Termos de Uso';

  @override
  String get termsOfUseSoon => 'Abre os termos de uso';

  @override
  String get clearDataTitle => 'Limpar todos os dados?';

  @override
  String get clearDataDesc =>
      'Isso exclui permanentemente todos os cartões salvos. Isto não pode ser desfeito.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get clearDataConfirm => 'Limpar dados';

  @override
  String get clearDataToast => 'Todos os dados apagados';

  @override
  String get splashSubtitle => 'Seus cartões, seguros e simples';

  @override
  String get unlockPrompt => 'Desbloqueie a carteira do cartão para continuar';

  @override
  String get tapToUnlock => 'Toque para desbloquear';

  @override
  String get authFailed => 'Falha na autenticação';

  @override
  String get binCheckerTitle => 'Verificador de BIN';

  @override
  String get enterMin6Digits => 'Insira pelo menos 6 dígitos';

  @override
  String get binNotVerified => 'Este BIN não pôde ser verificado';

  @override
  String get lookupFailed =>
      'Falha na pesquisa. Verifique sua conexão e tente novamente.';

  @override
  String get binLookupPlaceholder => 'PESQUISA DE BIN/IIN';

  @override
  String get enterDigitsLabel => 'Insira os primeiros 6 a 8 dígitos';

  @override
  String get checkButton => 'Verificar';

  @override
  String get binResultTitle => 'Resultado BIN';

  @override
  String get cardNetwork => 'Rede';

  @override
  String get cardType => 'Tipo';

  @override
  String get cardBrandCategory => 'Marca/Categoria';

  @override
  String get cardBank => 'Banco';

  @override
  String get cardCountry => 'País';

  @override
  String get cardCountryCode => 'Código do país';

  @override
  String get cardCurrency => 'Moeda';

  @override
  String get cardValid => 'Válido';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get cardValidatorTitle => 'Validador de cartão';

  @override
  String get cardValidatorPreviewName => 'VALIDADOR DE CARTÃO';

  @override
  String get enterCardNumberLabel => 'Digite o número do cartão';

  @override
  String get validCardNumber => 'Número do cartão válido';

  @override
  String get invalidCardNumber =>
      'Número de cartão inválido – verifique os dígitos';

  @override
  String get backupRestoreTitle => 'Backup e restauração';

  @override
  String get createBackupPass => 'Criar senha de backup';

  @override
  String get backupPassWarning =>
      'IMPORTANTE: Anote esta senha. Não poderemos recuperá-lo ou restaurar seu backup caso você o esqueça.';

  @override
  String get enterPassLabel => 'Digite a senha';

  @override
  String get confirmPassLabel => 'Confirme sua senha';

  @override
  String get passEmptyError => 'A senha não pode ficar vazia';

  @override
  String get passMismatchError => 'As senhas não coincidem';

  @override
  String get doneBtn => 'Feito';

  @override
  String get enterBackupPass => 'Digite a senha de backup';

  @override
  String get noCardsToBackup => 'Nenhum cartão para fazer backup';

  @override
  String get backupSuccess => 'Backup criado com sucesso!';

  @override
  String backupFailed(String error) {
    return 'Falha no backup: $error';
  }

  @override
  String get restoreBackupTitle => 'Restaurar cópia de segurança?';

  @override
  String get restoreBackupWarning =>
      'AVISO: A restauração de um backup substituirá todos os cartões e transações atuais. Isto não pode ser desfeito.';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get restoreSuccess => 'Backup restaurado com sucesso!';

  @override
  String get incorrectPasswordError =>
      'Senha incorreta ou arquivo de backup corrompido.';

  @override
  String restoreFailed(String error) {
    return 'Falha na restauração: $error';
  }

  @override
  String get deleteBackupTitle => 'Excluir backup?';

  @override
  String deleteBackupConfirmText(String name) {
    return 'Excluir \"$name\"? Isto não pode ser desfeito.';
  }

  @override
  String get deleteBtn => 'Excluir';

  @override
  String get backupDeleted => 'Backup excluído';

  @override
  String failedShareBackup(String error) {
    return 'Falha ao compartilhar backup: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'Falha ao selecionar arquivo: $error';
  }

  @override
  String get lastBackup => 'Último backup';

  @override
  String get neverBackedUp => 'Nunca fiz backup';

  @override
  String get backupType => 'Tipo de backup';

  @override
  String get localBackupDesc => 'Local – salvo apenas neste dispositivo';

  @override
  String get createBackupBtn => 'Criar backup';

  @override
  String get importExternalBackupBtn => 'Importar backup externo';

  @override
  String get savedBackupsHeader => 'Backups salvos';

  @override
  String get noBackupsYet => 'Ainda não há backups';

  @override
  String get tapCreateBackupDesc =>
      'Toque em \"Criar backup\" para salvar seus cartões';

  @override
  String get restoreTooltip => 'Restaurar';

  @override
  String get shareTooltip => 'Compartilhar';

  @override
  String get cardNotFound => 'Cartão não encontrado';

  @override
  String get editCardTitle => 'Editar cartão';

  @override
  String get addCardTitle => 'Adicionar cartão';

  @override
  String get cardTypeLabel => 'Tipo de cartão';

  @override
  String get cardColorLabel => 'Cor do cartão';

  @override
  String get fieldRequiredError => 'Este campo é obrigatório';

  @override
  String get bankNameLabel => 'Nome do banco';

  @override
  String get expiryLabel => 'Expiração (MM/AA)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'Fotos do cartão';

  @override
  String get frontSideLabel => 'Parte frontal';

  @override
  String get backSideLabel => 'Verso';

  @override
  String get notesLabel => 'Notas';

  @override
  String get saveChangesBtn => 'Salvar alterações';

  @override
  String get saveCardBtn => 'Salvar cartão';

  @override
  String get deleteCardBtn => 'Excluir cartão';

  @override
  String get takePhotoLabel => 'Tire uma foto';

  @override
  String get chooseGalleryLabel => 'Escolha na galeria';

  @override
  String get deleteCardPrompt => 'Excluir cartão?';

  @override
  String get deleteCardWarning => 'Esta ação não pode ser desfeita.';

  @override
  String get cardNumberLabel => 'Número do cartão';

  @override
  String get pointCardNumberLabel => 'Número do cartão de pontos';

  @override
  String get membershipIdLabel => 'ID de membro';

  @override
  String get couponCodeLabel => 'Código de cupom';

  @override
  String get giftCardNumberLabel => 'Número do vale-presente';

  @override
  String get ticketPnrLabel => 'Bilhete/Número PNR';

  @override
  String get numberLabel => 'Número';

  @override
  String get cardholderNameLabel => 'Nome do Titular';

  @override
  String get cardNameLabel => 'Nome do cartão';

  @override
  String get enterValidCardNumberError => 'Insira um número de cartão válido';

  @override
  String get cardNumberInvalidError => 'O número do cartão parece inválido';

  @override
  String get enterMin3CharsError => 'Insira pelo menos 3 caracteres';

  @override
  String get cardAlreadyExistsError =>
      'Um cartão com este número já está salvo';

  @override
  String get revealCvv => 'Revelar CVV';

  @override
  String get cardDetailsHeader => 'Detalhes do cartão:';

  @override
  String get typePrefix => 'Tipo:';

  @override
  String get bankPrefix => 'Banco:';

  @override
  String get cardNumberPrefix => 'Número do cartão:';

  @override
  String get cardholderPrefix => 'Titular do cartão:';

  @override
  String get expiryPrefix => 'Termo:';

  @override
  String get notesPrefix => 'Notas:';

  @override
  String get detailsSuffix => 'Detalhes';

  @override
  String get cardDetailsTitle => 'Detalhes do cartão';

  @override
  String get hideBtn => 'Esconder';

  @override
  String get revealBtn => 'Revelar';

  @override
  String get editBtn => 'Editar';

  @override
  String get cardInformationHeader => 'Informações do cartão';

  @override
  String get cardholderLabel => 'Titular do cartão';

  @override
  String get nameLabel => 'Nome';

  @override
  String get bankLabel => 'Banco';

  @override
  String get pnrNumberLabel => 'Número PNR';

  @override
  String get venueLabel => 'Local';

  @override
  String get eventDateLabel => 'Data do Evento';

  @override
  String get seatLabel => 'Assento';

  @override
  String get classLabel => 'Aula';

  @override
  String get discountDetailsLabel => 'Detalhes do desconto';

  @override
  String get memberIdLabel => 'ID de membro';

  @override
  String get tierStatusLabel => 'Status do nível';

  @override
  String get pointsBalanceLabel => 'Saldo de pontos';

  @override
  String get secondaryPinLabel => 'PIN secundário';

  @override
  String get issueDateLabel => 'Data de emissão';

  @override
  String get documentTitleLabel => 'Título do documento';

  @override
  String get nfcReaderTitle => 'Leitor NFC';

  @override
  String get nfcNotAvailable => 'NFC não disponível';

  @override
  String get nfcUnsupportedDesc =>
      'Este dispositivo não oferece suporte à leitura de cartão NFC.';

  @override
  String get readyToScan => 'Pronto para digitalizar';

  @override
  String get holdCardNfcPrompt =>
      'Segure o cartão sem contato na parte de trás do telefone.';

  @override
  String get scanFailed => 'Falha na verificação';

  @override
  String get somethingWentWrong => 'Algo deu errado.';

  @override
  String get tryAgainBtn => 'Tente novamente';

  @override
  String get cardDetected => 'Cartão detectado';

  @override
  String get unsupportedCardError => 'Este tipo de cartão não é compatível.';

  @override
  String get nfcReadFailedDesc =>
      'Não foi possível ler este cartão. Tente novamente ou adicione-o manualmente.';

  @override
  String nfcReadError(String error) {
    return 'Falha na leitura: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'Não foi possível iniciar a sessão NFC: $error';
  }

  @override
  String get scanCardTitle => 'Digitalizar cartão';

  @override
  String get noCameraError => 'Nenhuma câmera disponível neste dispositivo';

  @override
  String cameraStartError(String error) {
    return 'Não foi possível iniciar a câmera: $error';
  }

  @override
  String get ocrReadError =>
      'Não foi possível ler os detalhes do cartão. Tente novamente com uma iluminação melhor.';

  @override
  String ocrScanFailed(String error) {
    return 'Falha na verificação: $error';
  }

  @override
  String get cameraPermissionDesc =>
      'É necessária permissão da câmera para digitalizar um cartão.';

  @override
  String get openSettingsBtn => 'Abra Configurações';

  @override
  String get notDetected => 'Não detectado';

  @override
  String get scanAgainBtn => 'Digitalizar novamente';

  @override
  String get cardPhotosDesc =>
      'Guarde uma foto do seu cartão para referência rápida. As imagens permanecem neste dispositivo.';

  @override
  String addPhotoPlaceholder(String label) {
    return 'Adicionar foto $label';
  }

  @override
  String get premiumTitle => 'Prêmio';

  @override
  String get benefitRemoveAdsTitle => 'Remover todos os anúncios';

  @override
  String get benefitRemoveAdsDesc => 'Sem banners, sem intersticiais, nunca';

  @override
  String get benefitFasterTitle => 'Experiência mais rápida';

  @override
  String get benefitFasterDesc => 'Telas instantâneas sem nada para carregar';

  @override
  String get benefitSupportTitle => 'Apoiar o desenvolvimento';

  @override
  String get benefitSupportDesc => 'Ajude a manter o aplicativo crescendo';

  @override
  String get benefitBadgeTitle => 'Selo premium';

  @override
  String get benefitBadgeDesc => 'Um pequeno agradecimento no seu perfil';

  @override
  String get premiumHeroActive => 'Você é Premium';

  @override
  String get premiumHeroInactive => 'Livre-se de anúncios';

  @override
  String get premiumHeroDescActive =>
      'Obrigado por apoiar a Carteira de Cartões';

  @override
  String get premiumHeroDescInactive =>
      'Remova anúncios e desbloqueie uma experiência mais limpa';

  @override
  String get disablePremiumBtn => 'Desativar Prêmio';

  @override
  String get removeAdsBtn => 'Remover anúncios';

  @override
  String get premiumOneTimeNotice =>
      'Uma vez. Restaura instantaneamente neste dispositivo.';

  @override
  String get noBiometricsConfigured =>
      'Nenhum bloqueio de biometria/dispositivo configurado neste dispositivo';

  @override
  String get cardTypeCredit => 'Cartão de crédito';

  @override
  String get cardTypeDebit => 'Cartão de Débito';

  @override
  String get cardTypePoint => 'Cartão de pontos';

  @override
  String get cardTypeMembership => 'Cartão de Sócio';

  @override
  String get cardTypeCoupon => 'Cupom';

  @override
  String get cardTypeGift => 'Vale-presente';

  @override
  String get cardTypeEventTicket => 'Bilhete do Evento';

  @override
  String get cardTypeOther => 'Outro';

  @override
  String get chooseCardType => 'Escolha o tipo de cartão';

  @override
  String get selectCustomColor => 'Selecione cor personalizada';

  @override
  String get solidColor => 'Sólido';

  @override
  String get gradientColor => 'Gradiente';

  @override
  String get startColor => 'Começar';

  @override
  String get endColor => 'Fim';

  @override
  String get cardExpLabel => 'EXP';

  @override
  String get homeTab => 'Lar';

  @override
  String get cardsTab => 'Meus cartões';

  @override
  String get profileTab => 'Perfil';

  @override
  String get appTitleTypewriter => 'Carteira de cartão';

  @override
  String get seeAll => 'Ver tudo';

  @override
  String get backupShareText => 'Backup seguro da carteira do cartão';

  @override
  String get backupFileNotFoundError => 'Arquivo de backup não encontrado';

  @override
  String get corruptedBackupError => 'Arquivo de backup corrompido ou inválido';

  @override
  String get invalidBackupDataError =>
      'O arquivo de backup não contém dados válidos.';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'Versão de backup não suportada: $version';
  }
}
