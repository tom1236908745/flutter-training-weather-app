/// sealed classに準拠した汎用的なResultクラス
sealed class Result<T, U> {
  const Result();
}

/// Resultを継承した、正常時に使用されるクラス
class Success<T, U> extends Result<T, U> {
  const Success(this.value);
  final T value;
}

/// Resultを継承した、異常時に使用されるクラス
class Failure<T, U> extends Result<T, U> {
  const Failure(this.value);
  final U value;
}
