import 'package:flutter_training/constant/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info_model.freezed.dart';

/// `FormatException` をスローする共通関数
Never _throwFormatException(String message) => throw FormatException(message);

/// API・YumemiWeather から取得するデータ用のモデル層
@freezed
class WeatherInfoModel with _$WeatherInfoModel {
  const factory WeatherInfoModel({
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
    required DateTime date,
  }) = _WeatherCondition;

  @override
  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      _throwFormatException('Response Json data does not exist.');
    }

    final weatherCondition = WeatherCondition.from(
      json['weather_condition'].toString(),
    );

    final maxTemperature = int.tryParse(json['max_temperature'].toString());
    if (maxTemperature == null) {
      _throwFormatException(
        '''The "max_temperature" value must be numeric.''',
      );
    }

    final minTemperature = int.tryParse(json['min_temperature'].toString());
    if (minTemperature == null) {
      _throwFormatException(
        '''The "min_temperature" value must be numeric.''',
      );
    }

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
}
