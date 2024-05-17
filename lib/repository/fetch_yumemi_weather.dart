import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/components/Dialog/error_message_dialog.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

Future<WeatherCondition?> fetchYumemiWeather(BuildContext context) async {
  final yumemiWeather = YumemiWeather();

  try {
    final weatherConditionName = yumemiWeather.fetchThrowsWeather('tokyo');

    return WeatherCondition.from(weatherConditionName);
  } on Exception catch (exception) {
    if (kDebugMode) {
      debugPrint('$exception');
    }
  } on YumemiWeatherError catch (error) {
    await showErrorDialog(context, 'API取得に失敗しました。\n\nエラー内容: $error');
  }
  return null;
}
