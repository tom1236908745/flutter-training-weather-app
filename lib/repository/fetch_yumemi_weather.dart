import 'package:yumemi_weather/yumemi_weather.dart';

Future<String> fetchYumemiWeather() async {
  final yumemiWeather = YumemiWeather();
  final weatherConditionName = yumemiWeather.fetchSimpleWeather();

  if (weatherConditionName.isNotEmpty) {
    return weatherConditionName;
  } else {
    throw Exception('Failed to get Yumemi Weather API');
  }
}
