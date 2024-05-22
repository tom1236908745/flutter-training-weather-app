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
  WeatherCondition? _weatherCondition;

  void _updateWeatherCondition(WeatherCondition newWeatherCondition) {
    setState(() {
      if (mounted) {
        _weatherCondition = newWeatherCondition;
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
              _CenterPart(weatherCondition: _weatherCondition),
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
    required WeatherCondition? weatherCondition,
  }) : _weatherCondition = weatherCondition;

  final WeatherCondition? _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child:
              convertSvgWeatherImage(_weatherCondition) ?? const Placeholder(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.red,
                ),
              ),
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.blue,
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
  }) : _textColor = textColor;
  final Color _textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      '** ℃',
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.labelLarge?.copyWith(color: _textColor),
    );
  }
}

/// 並列に並ぶテキストボタンの箇所ウィジェット
class _TextButtons extends StatelessWidget {
  const _TextButtons({
    required void Function(WeatherCondition) updateWeatherCondition,
  }) : _updateWeatherCondition = updateWeatherCondition;
  final void Function(WeatherCondition) _updateWeatherCondition;
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
                    result.value.weatherCondition,
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
