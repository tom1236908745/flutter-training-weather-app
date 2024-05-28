/// 天気の種類を扱うEnum
enum WeatherCondition {
  cloudy,
  sunny,
  rainy;

  factory WeatherCondition.from(
    String conditionName,
    String? exceptionMessage,
  ) {
    return WeatherCondition.values.singleWhere(
      (element) => element.name == conditionName,
      orElse: () => throw FormatException(
        '''${exceptionMessage}The value of "weather_condition" must be included in the enum [WeatherCondition].''',
      ),
    );
  }
}
