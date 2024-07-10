import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/model/exception.dart';
import 'package:flutter_training/model/repository/weather_repository.dart';
import 'package:flutter_training/model/repository/weather_repository_provider.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:flutter_training/utils/result.dart';
import 'package:flutter_training/view/main_page_layout.dart';
import 'package:flutter_training/view_model/extensions/failure_message.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'main_page_layout_test.mocks.dart';

typedef _FailureValue = ({AppException exception, StackTrace stackTrace});

/// 共通の画面設定値に関する初期化処理
void _setUpScreen(WidgetTester tester) {
  final view = tester.view;
  // このアプリでは動作を保証する画面設定値が定まっていない。
  // そのため、これまで動作確認していた下記の画面設定値を検証端末として設定する。
  // iPhone 14 Pro Max の画面設定値
  view.devicePixelRatio = 3;
  view.physicalSize = const Size(1284, 2778);
}

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  final mockWeatherRepository = MockWeatherRepository();
  final commonSuccessObject = Success<WeatherInfo, _FailureValue>(
    WeatherInfo(
      weatherCondition: WeatherCondition.cloudy,
      maxTemperature: 16,
      minTemperature: 7,
      date: DateTime.parse('2020-04-01T12:00:00+09:00'),
    ),
  );

  provideDummy<Result<WeatherInfo, _FailureValue>>(commonSuccessObject);

  tearDown(() {
    reset(mockWeatherRepository);
  });

  group('APIから取得したデータの表示', () {
    group('正常系', () {
      testWidgets('初期画面', (tester) async {
        _setUpScreen(tester);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weatherRepositoryProvider
                  .overrideWithValue(mockWeatherRepository),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: MainPageLayout(),
              ),
            ),
          ),
        );

        final defaultTextFinder = find.text('** ℃');
        expect(defaultTextFinder, findsNWidgets(2));

        final defaultPlaceholderFinder = find.byType(Placeholder);
        expect(defaultPlaceholderFinder, findsOneWidget);
      });
      testWidgets('温度データの表示', (tester) async {
        _setUpScreen(tester);
        final response = Future<Success<WeatherInfo, _FailureValue>>.value(
          commonSuccessObject,
        );

        when(mockWeatherRepository.fetchWeather()).thenAnswer((_) => response);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weatherRepositoryProvider
                  .overrideWithValue(mockWeatherRepository),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: MainPageLayout(),
              ),
            ),
          ),
        );

        // `Reload` ボタンを押した際の挙動
        final reloadTextFinder = find.text('Reload');
        await tester.tap(reloadTextFinder);
        await tester.pumpAndSettle();

        // 最高気温の表記
        final maxTemperatureTextFinder = find.text('16 ℃');
        expect(maxTemperatureTextFinder, findsOneWidget);

        // 最低気温の表記
        final minTemperatureTextFinder = find.text('7 ℃');
        expect(minTemperatureTextFinder, findsOneWidget);
      });
      testWidgets('APIから取得した天候データを画像として表示', (tester) async {
        _setUpScreen(tester);

        final assets = [
          (WeatherCondition.cloudy, Assets.images.cloudy.svg()),
          (WeatherCondition.sunny, Assets.images.sunny.svg()),
          (WeatherCondition.rainy, Assets.images.rainy.svg()),
        ];

        for (final (weatherConditionName, imagePath) in assets) {
          final successObject = Success<WeatherInfo, _FailureValue>(
            WeatherInfo(
              weatherCondition: weatherConditionName,
              maxTemperature: 16,
              minTemperature: 7,
              date: DateTime.parse('2020-04-01T12:00:00+09:00'),
            ),
          );
          final response = Future<Success<WeatherInfo, _FailureValue>>.value(
            successObject,
          );

          when(mockWeatherRepository.fetchWeather())
              .thenAnswer((_) => response);

          await tester.pumpWidget(
            ProviderScope(
              overrides: [
                weatherRepositoryProvider
                    .overrideWithValue(mockWeatherRepository),
              ],
              child: const MaterialApp(
                home: Scaffold(
                  body: MainPageLayout(),
                ),
              ),
            ),
          );

          // `Reload` ボタンを押した際の挙動
          final reloadTextFinder = find.text('Reload');
          await tester.tap(reloadTextFinder);
          await tester.pumpAndSettle();

          // 画像の表示
          final svgPicFinder = find.svg(imagePath.bytesLoader);
          expect(svgPicFinder, findsOneWidget);
        }
      });
    });
    group('異常系', () {
      testWidgets('`UnknownException` のケース', (tester) async {
        _setUpScreen(tester);

        final failureObj = Failure<WeatherInfo, _FailureValue>(
          (
            exception: UnknownException(),
            stackTrace: StackTrace.current,
          ),
        );

        final response =
            Future<Failure<WeatherInfo, _FailureValue>>.value(failureObj);

        when(mockWeatherRepository.fetchWeather()).thenAnswer((_) => response);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weatherRepositoryProvider
                  .overrideWithValue(mockWeatherRepository),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: MainPageLayout(),
              ),
            ),
          ),
        );

        // `Reload` ボタンを押した際の挙動
        final reloadTextFinder = find.text('Reload');
        expect(reloadTextFinder, findsOneWidget);
        await tester.tap(reloadTextFinder);
        await tester.pumpAndSettle();

        final alertDialog = find.byType(AlertDialog);
        expect(alertDialog, findsOneWidget);

        final errorMessage = FailureMessage(
          '''An error has occurred.\nPlease contact our support center for assistance.''',
        );
        final errorMessageFinder = find.text(errorMessage);
        expect(errorMessageFinder, findsOneWidget);
      });
      testWidgets('`RequestFailedException` のケース', (tester) async {
        _setUpScreen(tester);

        final failureObj = Failure<WeatherInfo, _FailureValue>(
          (
            exception: RequestFailedException(),
            stackTrace: StackTrace.current,
          ),
        );

        final response =
            Future<Failure<WeatherInfo, _FailureValue>>.value(failureObj);

        when(mockWeatherRepository.fetchWeather()).thenAnswer((_) => response);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              weatherRepositoryProvider
                  .overrideWithValue(mockWeatherRepository),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: MainPageLayout(),
              ),
            ),
          ),
        );

        // `Reload` ボタンを押した際の挙動
        final reloadTextFinder = find.text('Reload');
        expect(reloadTextFinder, findsOneWidget);
        await tester.tap(reloadTextFinder);
        await tester.pumpAndSettle();

        final alertDialog = find.byType(AlertDialog);
        expect(alertDialog, findsOneWidget);

        final errorMessage = FailureMessage(
          '''Request Failed!\nUnable to process your request appropriately.\nPlease contact our support center for assistance.''',
        );
        final errorMessageFinder = find.text(errorMessage);
        expect(errorMessageFinder, findsOneWidget);
      });
    });
  });
}
