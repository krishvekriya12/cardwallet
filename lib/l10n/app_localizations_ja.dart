// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'カードウォレットアプリ';

  @override
  String get addCard => 'カードを追加';

  @override
  String get hiThere => 'こんにちは👋';

  @override
  String get settingsTitle => '設定';

  @override
  String get appLock => 'アプリロック';

  @override
  String get appLockSubtitle => 'アプリを開くには生体認証が必要です';

  @override
  String get language => '言語';

  @override
  String get backupRestore => 'バックアップと復元';

  @override
  String get backupRestoreSubtitle => 'カードをローカルにエクスポートおよびインポートする';

  @override
  String get clearAllData => 'すべてのデータをクリア';

  @override
  String get goodMorning => 'おはよう';

  @override
  String get goodAfternoon => 'こんにちは';

  @override
  String get goodEvening => 'こんばんは';

  @override
  String hiName(String name) {
    return 'こんにちは、$name 👋';
  }

  @override
  String get addNewCard => '新しいカードを追加';

  @override
  String get scan => 'スキャン';

  @override
  String get scanDesc => 'カードの詳細をスキャンします\n即座に';

  @override
  String get manually => '手動で';

  @override
  String get manuallyDesc => 'カード詳細を入力してください\n手動で';

  @override
  String get nfc => 'NFC';

  @override
  String get nfcDesc => '追加するカードをタップします\nNFCを使用して';

  @override
  String get tools => 'ツール';

  @override
  String get binChecker => 'BINチェッカー';

  @override
  String get binCheckerDesc => 'BINからカード詳細を確認する';

  @override
  String get cardVerify => 'カード検証';

  @override
  String get cardVerifyDesc => 'カード番号を検証する';

  @override
  String get frequentlyAdded => '頻繁に追加される';

  @override
  String get cardsTitle => 'カード';

  @override
  String get yourCardsManage => 'カードをここで管理します';

  @override
  String cardCountText(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count カードが保存されました',
      one: 'カードが 1 枚保存されました',
    );
    return '$_temp0';
  }

  @override
  String cardCountBadge(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countカード',
      one: 'カード1枚',
    );
    return '$_temp0';
  }

  @override
  String get allFilter => '全て';

  @override
  String get noCardsYet => 'まだカードがありません';

  @override
  String get noCardsYetDesc => 'ホームに移動するか、スキャナーをタップしてカードを追加します';

  @override
  String get noCardsCategory => 'このカテゴリにはカードがありません';

  @override
  String get tryDifferentFilter => '別のフィルターを選択してみてください';

  @override
  String get addFirstCardStart => '最初のカードを追加して始めましょう';

  @override
  String get rateUs => '評価してください';

  @override
  String get rateUsThanks => 'サポートありがとうございます!';

  @override
  String get shareApp => 'アプリを共有する';

  @override
  String get shareAppSoon => '近日共有予定';

  @override
  String get help => 'ヘルプ';

  @override
  String get supportSoon => 'サポートは近日提供予定';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicySoon => 'プライバシーポリシーを開きます';

  @override
  String get termsOfUse => '利用規約';

  @override
  String get termsOfUseSoon => '利用規約を開きます';

  @override
  String get clearDataTitle => 'すべてのデータを消去しますか?';

  @override
  String get clearDataDesc => 'これにより、保存されているすべてのカードが完全に削除されます。これを元に戻すことはできません。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get clearDataConfirm => 'データのクリア';

  @override
  String get clearDataToast => 'すべてのデータがクリアされました';

  @override
  String get splashSubtitle => 'あなたのカードを安全かつ簡単に';

  @override
  String get unlockPrompt => '続行するにはカードウォレットのロックを解除してください';

  @override
  String get tapToUnlock => 'タップしてロックを解除する';

  @override
  String get authFailed => '認証に失敗しました';

  @override
  String get binCheckerTitle => 'BINチェッカー';

  @override
  String get enterMin6Digits => '少なくとも 6 桁を入力してください';

  @override
  String get binNotVerified => 'この BIN は検証できませんでした';

  @override
  String get lookupFailed => '検索に失敗しました。接続を確認して、もう一度試してください。';

  @override
  String get binLookupPlaceholder => 'BIN / IIN ルックアップ';

  @override
  String get enterDigitsLabel => '最初の 6 ～ 8 桁を入力してください';

  @override
  String get checkButton => 'チェック';

  @override
  String get binResultTitle => 'BIN の結果';

  @override
  String get cardNetwork => 'ネットワーク';

  @override
  String get cardType => 'タイプ';

  @override
  String get cardBrandCategory => 'ブランド/カテゴリー';

  @override
  String get cardBank => '銀行';

  @override
  String get cardCountry => '国';

  @override
  String get cardCountryCode => '国コード';

  @override
  String get cardCurrency => '通貨';

  @override
  String get cardValid => '有効';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get cardValidatorTitle => 'カードバリデーター';

  @override
  String get cardValidatorPreviewName => 'カードバリデーター';

  @override
  String get enterCardNumberLabel => 'カード番号を入力してください';

  @override
  String get validCardNumber => '有効なカード番号';

  @override
  String get invalidCardNumber => '無効なカード番号 - 数字を確認してください';

  @override
  String get backupRestoreTitle => 'バックアップと復元';

  @override
  String get createBackupPass => 'バックアップパスワードの作成';

  @override
  String get backupPassWarning =>
      '重要: このパスワードを書き留めてください。バックアップを忘れた場合、復元したり復元したりすることはできません。';

  @override
  String get enterPassLabel => 'パスワードを入力してください';

  @override
  String get confirmPassLabel => 'パスワードを認証する';

  @override
  String get passEmptyError => 'パスワードを空にすることはできません';

  @override
  String get passMismatchError => 'パスワードが一致しません';

  @override
  String get doneBtn => '終わり';

  @override
  String get enterBackupPass => 'バックアップパスワードを入力してください';

  @override
  String get noCardsToBackup => 'バックアップするカードがありません';

  @override
  String get backupSuccess => 'バックアップが正常に作成されました。';

  @override
  String backupFailed(String error) {
    return 'バックアップ失敗: $error';
  }

  @override
  String get restoreBackupTitle => 'バックアップを復元しますか?';

  @override
  String get restoreBackupWarning =>
      '警告: バックアップを復元すると、現在のカードとトランザクションがすべて上書きされます。これを元に戻すことはできません。';

  @override
  String get continueBtn => '続く';

  @override
  String get restoreSuccess => 'バックアップが正常に復元されました。';

  @override
  String get incorrectPasswordError => 'パスワードが間違っているか、バックアップ ファイルが破損しています。';

  @override
  String restoreFailed(String error) {
    return '復元に失敗しました: $error';
  }

  @override
  String get deleteBackupTitle => 'バックアップを削除しますか?';

  @override
  String deleteBackupConfirmText(String name) {
    return '「$name」を削除しますか?これを元に戻すことはできません。';
  }

  @override
  String get deleteBtn => '消去';

  @override
  String get backupDeleted => 'バックアップが削除されました';

  @override
  String failedShareBackup(String error) {
    return 'バックアップの共有に失敗しました: $error';
  }

  @override
  String failedPickFile(String error) {
    return 'ファイルの選択に失敗しました: $error';
  }

  @override
  String get lastBackup => '最後のバックアップ';

  @override
  String get neverBackedUp => 'バックアップしたことがない';

  @override
  String get backupType => 'バックアップの種類';

  @override
  String get localBackupDesc => 'ローカル — このデバイスにのみ保存されます';

  @override
  String get createBackupBtn => 'バックアップの作成';

  @override
  String get importExternalBackupBtn => '外部バックアップのインポート';

  @override
  String get savedBackupsHeader => '保存されたバックアップ';

  @override
  String get noBackupsYet => 'まだバックアップがありません';

  @override
  String get tapCreateBackupDesc => '「バックアップを作成」をタップしてカードを保存します';

  @override
  String get restoreTooltip => '復元する';

  @override
  String get shareTooltip => '共有';

  @override
  String get cardNotFound => 'カードが見つかりません';

  @override
  String get editCardTitle => 'カードの編集';

  @override
  String get addCardTitle => 'カードを追加';

  @override
  String get cardTypeLabel => 'カードの種類';

  @override
  String get cardColorLabel => 'カードの色';

  @override
  String get fieldRequiredError => 'この項目は必須です';

  @override
  String get bankNameLabel => '銀行名';

  @override
  String get expiryLabel => '有効期限 (MM/YY)';

  @override
  String get cvvLabel => 'CVV';

  @override
  String get cardPhotosLabel => 'カードの写真';

  @override
  String get frontSideLabel => '前面';

  @override
  String get backSideLabel => '裏面';

  @override
  String get notesLabel => '注意事項';

  @override
  String get saveChangesBtn => '変更を保存';

  @override
  String get saveCardBtn => 'セーブカード';

  @override
  String get deleteCardBtn => 'カードの削除';

  @override
  String get takePhotoLabel => '写真を撮ってください';

  @override
  String get chooseGalleryLabel => 'ギャラリーから選ぶ';

  @override
  String get deleteCardPrompt => 'カードを削除しますか?';

  @override
  String get deleteCardWarning => 'この操作は元に戻すことができません。';

  @override
  String get cardNumberLabel => 'カード番号';

  @override
  String get pointCardNumberLabel => 'ポイントカード番号';

  @override
  String get membershipIdLabel => '会員ID';

  @override
  String get couponCodeLabel => 'クーポンコード';

  @override
  String get giftCardNumberLabel => 'ギフトカード番号';

  @override
  String get ticketPnrLabel => 'チケット/PNR番号';

  @override
  String get numberLabel => '番号';

  @override
  String get cardholderNameLabel => 'クレジットカード名義人氏名';

  @override
  String get cardNameLabel => 'カード名';

  @override
  String get enterValidCardNumberError => '有効なカード番号を入力してください';

  @override
  String get cardNumberInvalidError => 'カード番号が無効のようです';

  @override
  String get enterMin3CharsError => '少なくとも 3 文字を入力してください';

  @override
  String get cardAlreadyExistsError => 'この番号のカードはすでに保存されています';

  @override
  String get revealCvv => 'CVVを明らかにする';

  @override
  String get cardDetailsHeader => 'カード詳細:';

  @override
  String get typePrefix => 'タイプ：';

  @override
  String get bankPrefix => '銀行：';

  @override
  String get cardNumberPrefix => 'カード番号：';

  @override
  String get cardholderPrefix => 'カード所有者:';

  @override
  String get expiryPrefix => '有効期限:';

  @override
  String get notesPrefix => '注:';

  @override
  String get detailsSuffix => '詳細';

  @override
  String get cardDetailsTitle => 'カード詳細';

  @override
  String get hideBtn => '隠れる';

  @override
  String get revealBtn => '明らかにする';

  @override
  String get editBtn => '編集';

  @override
  String get cardInformationHeader => 'カード情報';

  @override
  String get cardholderLabel => 'カード所有者';

  @override
  String get nameLabel => '名前';

  @override
  String get bankLabel => '銀行';

  @override
  String get pnrNumberLabel => 'PNR番号';

  @override
  String get venueLabel => '会場';

  @override
  String get eventDateLabel => 'イベント日';

  @override
  String get seatLabel => 'シート';

  @override
  String get classLabel => 'クラス';

  @override
  String get discountDetailsLabel => '割引詳細';

  @override
  String get memberIdLabel => '会員ID';

  @override
  String get tierStatusLabel => 'ティアステータス';

  @override
  String get pointsBalanceLabel => 'ポイント残高';

  @override
  String get secondaryPinLabel => '二次PIN';

  @override
  String get issueDateLabel => '発行日';

  @override
  String get documentTitleLabel => '文書のタイトル';

  @override
  String get nfcReaderTitle => 'NFCリーダー';

  @override
  String get nfcNotAvailable => 'NFCは利用できません';

  @override
  String get nfcUnsupportedDesc => 'このデバイスは NFC カードの読み取りをサポートしていません。';

  @override
  String get readyToScan => 'スキャンの準備ができました';

  @override
  String get holdCardNfcPrompt => '非接触型カードを携帯電話の背面にかざします。';

  @override
  String get scanFailed => 'スキャンに失敗しました';

  @override
  String get somethingWentWrong => '何か問題が発生しました。';

  @override
  String get tryAgainBtn => 'もう一度やり直してください';

  @override
  String get cardDetected => 'カードが検出されました';

  @override
  String get unsupportedCardError => 'このカード タイプはサポートされていません。';

  @override
  String get nfcReadFailedDesc => 'このカードを読み取れませんでした。もう一度試すか、手動で追加してください。';

  @override
  String nfcReadError(String error) {
    return '読み取りに失敗しました: $error';
  }

  @override
  String nfcStartSessionError(String error) {
    return 'NFC セッションを開始できませんでした: $error';
  }

  @override
  String get scanCardTitle => 'スキャンカード';

  @override
  String get noCameraError => 'このデバイスでは利用可能なカメラがありません';

  @override
  String cameraStartError(String error) {
    return 'カメラを開始できませんでした: $error';
  }

  @override
  String get ocrReadError => 'カードの詳細を読み取れませんでした。照明を改善してもう一度試してください。';

  @override
  String ocrScanFailed(String error) {
    return 'スキャンに失敗しました: $error';
  }

  @override
  String get cameraPermissionDesc => 'カードをスキャンするにはカメラの許可が必要です。';

  @override
  String get openSettingsBtn => '設定を開く';

  @override
  String get notDetected => '検出されませんでした';

  @override
  String get scanAgainBtn => '再スキャン';

  @override
  String get cardPhotosDesc => 'すぐに参照できるようにカードの写真を保管しておいてください。画像はこのデバイスに残ります。';

  @override
  String addPhotoPlaceholder(String label) {
    return '$label写真を追加';
  }

  @override
  String get premiumTitle => 'プレミアム';

  @override
  String get benefitRemoveAdsTitle => 'すべての広告を削除する';

  @override
  String get benefitRemoveAdsDesc => 'バナーやインタースティシャルは一切ありません';

  @override
  String get benefitFasterTitle => 'より高速なエクスペリエンス';

  @override
  String get benefitFasterDesc => '何も読み込まないインスタント画面';

  @override
  String get benefitSupportTitle => 'サポート開発';

  @override
  String get benefitSupportDesc => 'アプリの成長をサポートする';

  @override
  String get benefitBadgeTitle => 'プレミアムバッジ';

  @override
  String get benefitBadgeDesc => 'プロフィールにちょっとした感謝の気持ちを添えて';

  @override
  String get premiumHeroActive => 'あなたはプレミアムです';

  @override
  String get premiumHeroInactive => '広告なしへ';

  @override
  String get premiumHeroDescActive => 'カードウォレットをご利用いただきありがとうございます';

  @override
  String get premiumHeroDescInactive => '広告を削除し、よりクリーンなエクスペリエンスを実現します';

  @override
  String get disablePremiumBtn => 'プレミアムを無効にする';

  @override
  String get removeAdsBtn => '広告を削除する';

  @override
  String get premiumOneTimeNotice => '一度。このデバイスでは即座に復元されます。';

  @override
  String get noBiometricsConfigured => 'このデバイスには生体認証/デバイス ロックが設定されていません';

  @override
  String get cardTypeCredit => 'クレジットカード';

  @override
  String get cardTypeDebit => 'デビットカード';

  @override
  String get cardTypePoint => 'ポイントカード';

  @override
  String get cardTypeMembership => '会員カード';

  @override
  String get cardTypeCoupon => 'クーポン';

  @override
  String get cardTypeGift => 'ギフトカード';

  @override
  String get cardTypeEventTicket => 'イベントチケット';

  @override
  String get cardTypeOther => '他の';

  @override
  String get chooseCardType => 'カードの種類を選択してください';

  @override
  String get selectCustomColor => 'カスタムカラーの選択';

  @override
  String get solidColor => '固体';

  @override
  String get gradientColor => '勾配';

  @override
  String get startColor => '始める';

  @override
  String get endColor => '終わり';

  @override
  String get cardExpLabel => '経験値';

  @override
  String get homeTab => '家';

  @override
  String get cardsTab => '私のカード';

  @override
  String get profileTab => 'プロフィール';

  @override
  String get appTitleTypewriter => 'カードウォレット';

  @override
  String get seeAll => 'すべて見る';

  @override
  String get backupShareText => 'カードウォレットの安全なバックアップ';

  @override
  String get backupFileNotFoundError => 'バックアップファイルが見つかりません';

  @override
  String get corruptedBackupError => 'バックアップ ファイルが破損しているか無効です';

  @override
  String get invalidBackupDataError => 'バックアップ ファイルに有効なデータが含まれていません。';

  @override
  String unsupportedBackupVersionError(String version) {
    return 'サポートされていないバックアップ バージョン: $version';
  }
}
