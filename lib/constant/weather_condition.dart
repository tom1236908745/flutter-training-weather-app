import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/gen/assets.gen.dart';

enum WeatherCondition {
  cloudy,
  sunny,
  rainy;

  factory WeatherCondition.from(String name) =>
      WeatherCondition.values.singleWhere(
        (element) => element.name == name,
        orElse: () => throw Exception('`$name` is invalid value'),
      );
}

extension WeatherTypePath on WeatherCondition {
  SvgPicture get path {
    switch (this) {
      case WeatherCondition.cloudy:
        return Assets.images.cloudy.svg();
      case WeatherCondition.sunny:
        return Assets.images.sunny.svg();
      case WeatherCondition.rainy:
        return Assets.images.rainy.svg();
    }
  }
}
