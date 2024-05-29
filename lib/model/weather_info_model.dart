import 'package:flutter_training/constant/weather_condition.dart';

// `Exception` にスローする共通関数u
Never _throwFormatException(String message) => throw FormatException(message);

class WeatherInfoModel {
  WeatherInfoModel({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      _throwFormatException('Response Json data does not exist.');
    }

    // `weather_condition` 用の例外処理
    final weatherCondition = WeatherCondition.from(
      json['weather_condition'].toString(),
    );

    // `max_temperature` 用の例外処理
    final maxTemperature = int.tryParse(json['max_temperature'].toString());
    if (maxTemperature == null) {
      _throwFormatException(
        '''The "max_temperature" value must be numeric.''',
      );
    }

    // `min_temperature` 用の例外処理
    final minTemperature = int.tryParse(json['min_temperature'].toString());
    if (minTemperature == null) {
      _throwFormatException(
        '''The "min_temperature" value must be numeric.''',
      );
    }

    // `date` 用の例外処理
    final date = DateTime.tryParse(json['date'].toString());
    if (date == null) {
      _throwFormatException(
        '''The "date" value must be a string in ISO format.''',
      );
    }

    return WeatherInfoModel(
      weatherCondition: weatherCondition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
      date: date,
    );
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;
}
