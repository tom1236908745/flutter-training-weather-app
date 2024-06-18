sealed class Result<T, U> {
  const Result();
}

class Success<T, U> extends Result<T, U> {
  const Success(this.value);
  final T value;
}

class Failure<T, U> extends Result<T, U> {
  const Failure(this.value);
  final U value;
}
