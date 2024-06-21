import 'dart:convert';
import 'package:flutter_training/model/request.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/utils/exception.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherRepository {
  WeatherRepository({required YumemiWeather weatherApi})
      : _weatherApi = weatherApi;

  final YumemiWeather _weatherApi;

  /// API・`YumemiWeather` で使用する `Repository` 用の関数
  Future<Result<WeatherInfo, ({AppException exception, StackTrace stackTrace})>>
      fetchWeather() async {
    try {
      final requestData = Request(
        area: 'tokyo',
        date: DateTime.parse('2020-04-01T12:00:00+09:00'),
      );

      final weatherResponse =
          _weatherApi.fetchWeather(jsonEncode(requestData.toJson()));
      final weatherInfoModel = WeatherInfo.fromJson(
        jsonDecode(weatherResponse) as Map<String, dynamic>,
      );
      return Success(
        weatherInfoModel,
      );
    } on FormatException catch (_, stackTrace) {
      return Failure(
        (
          exception: UnknownException(),
          stackTrace: stackTrace,
        ),
      );
    } on Exception catch (_, stackTrace) {
      return Failure(
        (
          exception: UnknownException(),
          stackTrace: stackTrace,
        ),
      );
    } on YumemiWeatherError catch (error, stackTrace) {
      final exception = switch (error) {
        YumemiWeatherError.unknown => UnknownException(),
        YumemiWeatherError.invalidParameter => RequestFailedException(),
      };
      return Failure(
        (
          exception: exception,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
