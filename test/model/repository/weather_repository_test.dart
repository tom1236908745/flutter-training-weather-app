import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/model/exception.dart';
import 'package:flutter_training/model/repository/weather_repository.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_repository_test.mocks.dart';

typedef _FailureValue = ({AppException exception, StackTrace stackTrace});

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  final mockYumemiWeather = MockYumemiWeather();

  tearDown(() {
    reset(mockYumemiWeather);
  });

  group(
    'WeatherRepositoryのfetchWeather関数のテスト ',
    () {
      test('APIの取得が成功した場合', () async {
        const mockWeatherResponse =
            '''{"weather_condition":"cloudy","max_temperature":25,"min_temperature":7,"date":"2020-04-01T12:00:00+09:00"}''';
        when(mockYumemiWeather.syncFetchWeather(any))
            .thenAnswer((_) => mockWeatherResponse);
        final weatherRepository =
            WeatherRepository(weatherApi: mockYumemiWeather);
        final actual = await weatherRepository.fetchWeather();
        final expected = WeatherInfo(
          weatherCondition: WeatherCondition.cloudy,
          maxTemperature: 25,
          minTemperature: 7,
          date: DateTime.parse('2020-04-01T12:00:00+09:00'),
        );
        expect(
          actual,
          isA<Success<WeatherInfo, _FailureValue>>()
              .having((success) => success.value, 'weather info', expected),
        );
      });
      test('レスポンスの型が期待していた型と異なっていた場合', () async {
        const mockWeatherResponse =
            '''{"weather_condition":"cloudy","max_temperature":25,"min_temperature":7,"dateTime":"2020-04-01T12:00:00+09:00"}''';
        when(mockYumemiWeather.syncFetchWeather(any))
            .thenAnswer((_) => mockWeatherResponse);
        final weatherRepository =
            WeatherRepository(weatherApi: mockYumemiWeather);
        final actual = await weatherRepository.fetchWeather();
        expect(
          actual,
          isA<Failure<WeatherInfo, _FailureValue>>().having(
            (failure) => failure.value.exception,
            'exception',
            isA<UnknownException>(),
          ),
        );
      });
      test('APIから例外がスローされた場合', () async {
        when(mockYumemiWeather.syncFetchWeather(any)).thenThrow(Exception());
        final weatherRepository =
            WeatherRepository(weatherApi: mockYumemiWeather);
        final actual = await weatherRepository.fetchWeather();
        expect(
          actual,
          isA<Failure<WeatherInfo, _FailureValue>>().having(
            (failure) => failure.value.exception,
            'exception',
            isA<UnknownException>(),
          ),
        );
      });
      test('APIから不明なエラーがスローされた場合', () async {
        when(mockYumemiWeather.syncFetchWeather(any))
            .thenThrow(YumemiWeatherError.unknown);
        final weatherRepository =
            WeatherRepository(weatherApi: mockYumemiWeather);
        final actual = await weatherRepository.fetchWeather();
        expect(
          actual,
          isA<Failure<WeatherInfo, _FailureValue>>().having(
            (failure) => failure.value.exception,
            'exception',
            isA<UnknownException>(),
          ),
        );
      });
      test('APIからリクエスト時のエラーがスローされた場合', () async {
        when(mockYumemiWeather.syncFetchWeather(any))
            .thenThrow(YumemiWeatherError.invalidParameter);
        final weatherRepository =
            WeatherRepository(weatherApi: mockYumemiWeather);
        final actual = await weatherRepository.fetchWeather();
        expect(
          actual,
          isA<Failure<WeatherInfo, _FailureValue>>().having(
            (failure) => failure.value.exception,
            'exception',
            isA<RequestFailedException>(),
          ),
        );
      });
    },
  );
}
