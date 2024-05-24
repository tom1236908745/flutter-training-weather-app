import 'package:flutter_training/constant/weather_condition.dart';

/// API・YumemiWeather から取得するデータ用のビューモデル層
class WeatherInfo {
  WeatherInfo({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
}
