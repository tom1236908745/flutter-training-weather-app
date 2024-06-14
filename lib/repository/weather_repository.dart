import 'dart:convert';
import 'package:flutter_training/model/request_model.dart';
import 'package:flutter_training/model/weather_info_model.dart';
import 'package:flutter_training/repository/failure_repository.dart';
import 'package:flutter_training/utils/extensions/failure_message.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

/// `Exception` • `Error` 系の文言の整形用に使用される共通関数
String formatFetchFailureMessage<T>(T failureMessage) {
  return 'Failed to fetch.\nDetail: $failureMessage';
}

/// `YumemiWeather` の `fetchWeather` を実行
class WeatherRepository {
  WeatherRepository({required YumemiWeather weatherApi})
      : _weatherApi = weatherApi;

  final YumemiWeather _weatherApi;

  /// API・`YumemiWeather` で使用する `Repository` 用の関数
  Future<Result<WeatherInfoModel, FailureRepository>> fetchWeather() async {
    try {
      final requestData = RequestModel(
        area: 'tokyo',
        date: DateTime.parse('2020-04-01T12:00:00+09:00'),
      );

      final weatherResponse =
          _weatherApi.fetchWeather(jsonEncode(requestData.toJson()));
      final weatherInfoModel = WeatherInfoModel.fromJson(
        jsonDecode(weatherResponse) as Map<String, dynamic>,
      );
      return Success(
        weatherInfoModel,
      );
    } on FormatException catch (formatException, stackTrace) {
      return Failure(
        FailureRepository(
          failureMessage:
              FailureMessage(formatFetchFailureMessage(formatException)),
          stackTrace: stackTrace,
        ),
      );
    } on Exception catch (exception, stackTrace) {
      return Failure(
        FailureRepository(
          failureMessage: FailureMessage(
            formatFetchFailureMessage(exception),
          ),
          stackTrace: stackTrace,
        ),
      );
    } on YumemiWeatherError catch (error, stackTrace) {
      return Failure(
        FailureRepository(
          failureMessage: FailureMessage(
            formatFetchFailureMessage(error),
          ),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
