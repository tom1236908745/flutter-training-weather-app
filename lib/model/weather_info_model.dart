import 'package:flutter_training/constant/weather_condition.dart';

// API・YumemiWeather から取得するデータ用のモデル層
class WeatherInfoModel {
  WeatherInfoModel({required this.weatherCondition});

  factory WeatherInfoModel.fromJson(String weatherCondition) {
    return WeatherInfoModel(
      weatherCondition: WeatherCondition.from(weatherCondition),
    );
  }

  final WeatherCondition weatherCondition;
}
