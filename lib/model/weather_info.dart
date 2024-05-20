import 'package:flutter_training/constant/weather_condition.dart';

class WeatherInfoModel {
  WeatherInfoModel({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      weatherCondition:
          WeatherCondition.from(json['weather_condition'] as String),
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
      date: json['date'] as String,
    );
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final String date;
}
