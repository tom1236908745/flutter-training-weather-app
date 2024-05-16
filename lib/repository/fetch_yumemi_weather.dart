import 'package:flutter/material.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

Future<String?> fetchYumemiWeather() async {
  final yumemiWeather = YumemiWeather();

  try {
    final weatherConditionName = yumemiWeather.fetchSimpleWeather();
    if (weatherConditionName.isNotEmpty) {
      return weatherConditionName;
    }
    throw Exception('Failed to get Yumemi Weather API');
  } on Exception catch (exception) {
    debugPrint('$exception');
  }
  return null;
}
