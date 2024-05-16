import 'package:flutter/foundation.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

Future<WeatherCondition?> fetchYumemiWeather() async {
  final yumemiWeather = YumemiWeather();

  try {
    final weatherConditionName = yumemiWeather.fetchSimpleWeather();
    if (weatherConditionName.isEmpty) {
      throw Exception('Failed to get Yumemi Weather API');
    }
    return WeatherCondition.from(weatherConditionName);
  } on Exception catch (exception) {
    if (kDebugMode) {
      debugPrint('$exception');
    }
  }
  return null;
}
