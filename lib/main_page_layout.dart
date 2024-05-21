import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/components/Dialog/error_message_dialog.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/repository/fetch_yumemi_weather.dart';
import 'package:flutter_training/repository/result.dart';
import 'package:flutter_training/view_model/weather_info.dart';

/// 大枠のウィジェット
class MainPageLayout extends StatefulWidget {
  const MainPageLayout({super.key});

  @override
  State<MainPageLayout> createState() => MainPageLayoutState();
}

class MainPageLayoutState extends State<MainPageLayout> {
  late WeatherInfo _weatherInfo;

  void _updateWeatherCondition(WeatherInfo newWeatherInfo) {
    setState(() {
      if (mounted) {
        _weatherInfo = newWeatherInfo;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: <Widget>[
              const Spacer(),
              _CenterPart(weatherInfo: _weatherInfo),
              Expanded(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    _TextButtons(
                      updateWeatherCondition: _updateWeatherCondition,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 天気情報を持ったEnumをsvg画像に変換
SvgPicture? convertSvgWeatherImage(WeatherCondition? weatherCondition) {
  switch (weatherCondition) {
    case WeatherCondition.cloudy:
      return Assets.images.cloudy.svg();
    case WeatherCondition.sunny:
      return Assets.images.sunny.svg();
    case WeatherCondition.rainy:
      return Assets.images.rainy.svg();
    case null:
      return null;
  }
}

/// 中央部分のウィジェット
class _CenterPart extends StatelessWidget {
  const _CenterPart({
    required WeatherInfo weatherInfo,
  }) : _weatherInfo = weatherInfo;

  final WeatherInfo _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: convertSvgWeatherImage(_weatherInfo.weatherCondition) ??
              const Placeholder(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.red,
                  temperature: _weatherInfo.maxTemperature,
                ),
              ),
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.blue,
                  temperature: _weatherInfo.minTemperature,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 温度の表示用ウィジェット
class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
    required Color textColor,
    required int temperature,
  })  : _textColor = textColor,
        _temperature = temperature;

  final Color _textColor;
  final int? _temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_temperature ℃',
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.labelLarge?.copyWith(color: _textColor),
    );
  }
}

/// 並列に並ぶテキストボタンの箇所ウィジェット
class _TextButtons extends StatelessWidget {
  const _TextButtons({
    required void Function(WeatherInfo) updateWeatherCondition,
  }) : _updateWeatherCondition = updateWeatherCondition;
  final void Function(WeatherInfo) _updateWeatherCondition;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () {
              // 遷移元へ戻す
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () async {
              final result = await fetchYumemiWeather();

              switch (result) {
                // APIの取得に成功した場合
                case Success<WeatherInfo>():
                  _updateWeatherCondition(
                    result.value,
                  );

                // APIの取得に失敗した場合
                case Failure<WeatherInfo>():
                  if (context.mounted) {
                    await showErrorDialog(
                      context,
                      result.error,
                    );
                  }
              }
            },
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
