import 'package:flutter_training/repository/weather_repository.dart';
import 'package:flutter_training/repository/weather_repository_provider.dart';
import 'package:flutter_training/utils/extensions/failure_message.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:flutter_training/view_model/failure_view_model.dart';
import 'package:flutter_training/view_model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_info_notifier.g.dart';

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
          FailureViewModel(
            failureMessage: FailureMessage(result.value.failureMessage),
          ),
          result.value.stackTrace,
        );
    }
  }
}