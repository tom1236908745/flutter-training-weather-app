/// 天気の種類を扱うEnum
enum WeatherCondition {
  cloudy,
  sunny,
  rainy;

  factory WeatherCondition.from(String? conditionName) {
    return WeatherCondition.values.singleWhere(
      (element) => element.name == conditionName,
      orElse: () => throw FormatException('`$conditionName` is invalid format'),
    );
  }
}
