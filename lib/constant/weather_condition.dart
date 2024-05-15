import 'package:collection/collection.dart';

/// 天気の種類を扱うEnum
enum WeatherCondition {
  cloudy,
  sunny,
  rainy;

  factory WeatherCondition.from(String conditionName) {
    final result = WeatherCondition.values.singleWhereOrNull(
      (element) => element.name == conditionName,
    );

    if (result == null) {
      throw FormatException('`$conditionName` is invalid format');
    }

    return result;
  }
}
