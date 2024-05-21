import 'package:flutter_training/constant/weather_condition.dart';

// API・YumemiWeather から取得するデータ用のビューモデル層
class WeatherInfo {
  WeatherInfo({required this.weatherCondition});

  final WeatherCondition weatherCondition;
}
