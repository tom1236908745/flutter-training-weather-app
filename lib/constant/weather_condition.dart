/// 天気の種類を扱うEnum
enum WeatherCondition {
  cloudy,
  sunny,
  rainy;

  factory WeatherCondition.from(String conditionName) =>
      WeatherCondition.values.singleWhere(
        (element) => element.name == conditionName,
      );
}
