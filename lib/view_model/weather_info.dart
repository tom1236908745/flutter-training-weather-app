import 'package:flutter_training/constant/weather_condition.dart';

// API・YumemiWeather から取得するデータ用のビューモデル層
class WeatherInfo {
  WeatherInfo({
    required this.weatherCondition,
    required int numMaxTemperature,
    required int numMinTemperature,
  })  : maxTemperature = numMaxTemperature.toString(),
        minTemperature = numMinTemperature.toString();

  final WeatherCondition weatherCondition;
  final String maxTemperature;
  final String minTemperature;
}
