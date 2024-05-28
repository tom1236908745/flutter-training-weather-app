import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/model/throw_format_exception.dart';

class WeatherInfoModel {
  WeatherInfoModel({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    // jsonデータ が存在しなかった場合に表示する共通の文言
    final noJsonResponseMessage =
        json.isEmpty ? 'Response Json data does not exist.\n' : '';

    // `weather_condition` 用の例外処理
    final weatherCondition = WeatherCondition.from(
      json['weather_condition'].toString(),
      noJsonResponseMessage,
    );

    // `max_temperature` 用の例外処理
    final maxTemperature = int.tryParse(json['max_temperature'].toString());
    if (maxTemperature == null) {
      throwFormatException(
        '''${noJsonResponseMessage}The "max_temperature" value must be numeric.''',
      );
    }

    // `min_temperature` 用の例外処理
    final minTemperature = int.tryParse(json['min_temperature'].toString());
    if (minTemperature == null) {
      throwFormatException(
        '''${noJsonResponseMessage}The "min_temperature" value must be numeric.''',
      );
    }

    // `date` 用の例外処理
    final date = DateTime.tryParse(json['date'].toString());
    if (date == null) {
      throwFormatException(
        '''${noJsonResponseMessage}The "date" value must be a string in ISO format.''',
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
