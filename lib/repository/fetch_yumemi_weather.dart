import 'dart:convert';

import 'package:flutter_training/model/request_model.dart';
import 'package:flutter_training/model/weather_info_model.dart';
import 'package:flutter_training/repository/result.dart';
import 'package:flutter_training/view_model/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

/// `Exception` • `Error` 系の文言の整形用に使用される共通関数
String formatFetchFailureMessage<T>(T failureMessage) {
  return 'Failed to fetch.\nDetail: $failureMessage';
}

/// API・`YumemiWeather` で使用する `Repository` 用の関数
Future<Result<WeatherInfo>> fetchYumemiWeather() async {
  try {
    const requestData =
        RequestModel(area: 'tokyo', date: '2020-04-01T12:00:00+09:00');

    final weatherResponse =
        YumemiWeather().fetchWeather(jsonEncode(requestData.toJson()));
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
