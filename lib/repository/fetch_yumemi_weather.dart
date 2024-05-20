import 'package:flutter_training/constant/set_error_phrase.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/repository/result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

/// API・`YumemiWeather` で使用する `Repository` 用の関数
Future<Result<WeatherInfoModel>> fetchYumemiWeather() async {
  try {
    final weatherConditionName = YumemiWeather().fetchThrowsWeather('tokyo');
    return Success(WeatherInfoModel.fromJson(weatherConditionName));
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
