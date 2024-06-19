import 'package:flutter_training/repository/weather_repository.dart';
import 'package:flutter_training/repository/weather_repository_provider.dart';
import 'package:flutter_training/utils/exception.dart';
import 'package:flutter_training/utils/extensions/failure_message.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:flutter_training/view_model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_info_notifier.g.dart';

/// `Exception` • `Error` 系の文言の整形用に使用される共通関数
String _formatFetchFailureMessage<T>(T failureMessage) {
  return '''$failureMessage\nPlease contact our support center for assistance.''';
}

@riverpod

/// API・YumemiWeather から取得するデータ用のビューモデル層
class WeatherInfoNotifier extends _$WeatherInfoNotifier {
  WeatherRepository get _weatherRepository =>
      ref.read(weatherRepositoryProvider);

  @override
  Future<WeatherInfo?>? build() async {
    return null;
  }

  Future<void> fetchWeather() async {
    final result = await _weatherRepository.fetchWeather();

    state = const AsyncLoading();

    switch (result) {
      // APIの取得に成功した場合
      case Success():
        final value = result.value;
        state = AsyncValue.data(
          WeatherInfo(
            weatherCondition: value.weatherCondition,
            maxTemperature: value.maxTemperature,
            minTemperature: value.minTemperature,
          ),
        );

      // APIの取得に失敗した場合
      case Failure():
        state = AsyncValue.error(
          FailureMessage(
            _formatFetchFailureMessage(
              convertExceptionMessage(result.value.exception),
            ),
          ),
          result.value.stackTrace,
        );
    }
  }
}

extension WeatherInfoNotifierExtension on WeatherInfoNotifier {
  String convertExceptionMessage(AppException exception) {
    return switch (exception) {
      UnknownException() => 'An error has occurred.',
      RequestFailedException() => 'Request Failed!\n Unable to process your '
          'request appropriately.'
    };
  }
}
