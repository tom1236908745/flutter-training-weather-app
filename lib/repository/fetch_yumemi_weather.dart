import 'dart:convert';

import 'package:flutter_training/model/weather_info_model.dart';
import 'package:flutter_training/repository/result.dart';
import 'package:flutter_training/utils/format_fetch_failure_message.dart';
import 'package:flutter_training/view_model/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

/// 仮データ
const jsonString = '''
{
    "area": "tokyo",
    "date": "2020-04-01T12:00:00+09:00"
}''';

/// API・`YumemiWeather` で使用する `Repository` 用の関数
Future<Result<WeatherInfo>> fetchYumemiWeather() async {
  try {
    final weatherResponse = YumemiWeather().fetchWeather(jsonString);
    final weatherInfoModel = WeatherInfoModel.fromJson(
      jsonDecode(weatherResponse) as Map<String, dynamic>,
    );
    return Success(
      WeatherInfo(
        weatherCondition: weatherInfoModel.weatherCondition,
        maxTemperature: weatherInfoModel.maxTemperature,
        minTemperature: weatherInfoModel.minTemperature,
      ),
    );
  } on FormatException catch (formatException) {
    return Failure(
      formatFetchFailureMessage(formatException),
    );
  } on Exception catch (exception) {
    return Failure(
      formatFetchFailureMessage(exception),
    );
  } on YumemiWeatherError catch (error) {
    return Failure(
      formatFetchFailureMessage(error),
    );
  }
}
