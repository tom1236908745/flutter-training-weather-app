import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/constant/weather_condition.dart';
// import 'package:flutter_training/model/exception.dart';
import 'package:flutter_training/model/repository/weather_repository.dart';
import 'package:flutter_training/view/main_page_layout.dart';
import 'package:flutter_training/view_model/weather_info.dart';
import 'package:flutter_training/view_model/weather_info_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// typedef _FailureValue = ({AppException exception, StackTrace stackTrace});

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  // late MockWeatherRepository mockWeatherRepository;

  // setUp(() {
  //   mockWeatherRepository = MockWeatherRepository();
  // });

  group('温度の表示に関するテスト', () {
    testWidgets('', (tester) async {
      // final response = Future<Success<WeatherInfo, _FailureValue>>.value(
      //   Success(
      //     WeatherInfo(
      //       weatherCondition: WeatherCondition.cloudy,
      //       maxTemperature: 16,
      //       minTemperature: 7,
      //       date: DateTime.parse('2020-04-01T12:00:00+09:00'),
      //     ),
      //   ),
      // );

      // when(mockWeatherRepository.fetchWeather()).thenAnswer((_) => response);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            weatherInfoNotifierProvider.overrideWith(() {
              return WeatherRepositoryMock();
            }),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: MainPageLayout(),
            ),
          ),
        ),
      );

      final reloadTextFinder = find.text('Reload');
      await tester.tap(reloadTextFinder);
      await tester.pumpAndSettle();

      final temperatureTextFinder = find.text('16 ℃');
      expect(temperatureTextFinder, findsAny);
    });
  });
}

class WeatherRepositoryMock extends AutoDisposeAsyncNotifier<WeatherInfo?>
    with Mock
    implements WeatherInfoNotifier {
  @override
  Future<WeatherInfo> fetchWeather() async {
    return WeatherInfo(
      maxTemperature: 16,
      minTemperature: 10,
      weatherCondition: WeatherCondition.cloudy,
    );
  }
}
