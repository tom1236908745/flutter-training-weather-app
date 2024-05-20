import 'package:flutter/material.dart';
import 'package:flutter_training/components/Dialog/error_message_dialog.dart';
import 'package:flutter_training/constant/set_error_phrase.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

Future<WeatherCondition?> fetchYumemiWeather(BuildContext context) async {
  final yumemiWeather = YumemiWeather();
  try {
    final weatherConditionName = yumemiWeather.fetchThrowsWeather('tokyo');

    return WeatherCondition.from(weatherConditionName);
  } on Exception catch (exception) {
    await showErrorDialog(
      context,
      '$setErrorPhrase$exception',
    );
  } on YumemiWeatherError catch (error) {
    await showErrorDialog(
      context,
      '$setErrorPhrase$error',
    );
  }
  return null;
}
