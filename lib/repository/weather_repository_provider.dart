import 'package:flutter_training/repository/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_repository_provider.g.dart';

@riverpod
WeatherRepository weatherRepository(
  WeatherRepositoryRef ref,
) {
  final yumemiWeather = YumemiWeather();

  // `WeatherRepository` に対して `yumemiWeather` の依存性を注入
  return WeatherRepository(weatherApi: yumemiWeather);
}
