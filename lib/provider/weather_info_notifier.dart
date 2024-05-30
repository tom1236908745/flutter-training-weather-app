import 'package:flutter_training/view_model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_info_notifier.g.dart';

@riverpod
class WeatherInfoNotifier extends _$WeatherInfoNotifier {
  @override
  WeatherInfo? build(WeatherInfo? weatherInfo) {
    return weatherInfo;
  }

  Future<void> update(WeatherInfo newWeatherInfo) async {
    state = newWeatherInfo;
  }
}
