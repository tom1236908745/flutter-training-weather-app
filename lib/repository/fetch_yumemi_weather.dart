
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_training/components/Dialog/error_message_dialog.dart';
import 'package:flutter_training/constant/set_error_phrase.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';
import 'package:flutter_training/model/weather_info_model.dart';
import 'package:flutter_training/repository/result.dart';
import 'package:flutter_training/view_model/weather_info.dart';

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
    return Success(WeatherInfo(WeatherInfoModel.fromJson(
        jsonDecode(weatherResponse) as Map<String, dynamic>)))
  } on Exception catch (exception) {
    return Failure(
      '$setErrorPhrase$exception',
    );
  } on YumemiWeatherError catch (error) {
    return Failure(
      '$setErrorPhrase$error',
    );
  }
}
