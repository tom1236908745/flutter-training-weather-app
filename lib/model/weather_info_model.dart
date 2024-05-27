import 'package:flutter_training/constant/weather_condition.dart';

class WeatherInfoModel {
  WeatherInfoModel({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'weather_condition': final String weatherCondition,
        'max_temperature': final int maxTemperature,
        'min_temperature': final int minTemperature,
        'date': final String date,
      } =>
        WeatherInfoModel(
          weatherCondition: WeatherCondition.from(weatherCondition),
          maxTemperature: maxTemperature,
          minTemperature: minTemperature,
          date: date,
        ),
      _ => throw const FormatException(),
    };
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final String date;
}
