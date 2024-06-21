/// アプリ特有の例外を表現する基盤クラス
sealed class AppException implements Exception {}

/// 詳細が不明な例外を表現するクラス
class UnknownException extends AppException {}

/// 無効な引数を含む事により起こる例外を表現するクラス
class RequestFailedException extends AppException {}
