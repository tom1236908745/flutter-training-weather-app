import 'package:flutter/material.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/repository/fetch_yumemi_weather.dart';

/// 大枠のウィジェット
class MainPageLayout extends StatefulWidget {
  const MainPageLayout({super.key});

  @override
  State<MainPageLayout> createState() => MainPageLayoutState();
}

class MainPageLayoutState extends State<MainPageLayout> {
  String _weatherCondition = '';

  void _updateWeatherCondition(String newWeatherCondition) {
    setState(() {
      _weatherCondition = newWeatherCondition;
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

/// 中央部分のウィジェット
class _CenterPart extends StatelessWidget {
  const _CenterPart({
    required String weatherCondition,
  }) : _weatherCondition = weatherCondition;

  final String _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: _weatherCondition.isEmpty
              ? const Placeholder()
              : WeatherCondition.from(_weatherCondition).path,
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
    required void Function(String) updateWeatherCondition,
  }) : _updateWeatherCondition = updateWeatherCondition;
  final void Function(String) _updateWeatherCondition;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () async {
              String weatherConditionName;
              try {
                weatherConditionName = await fetchYumemiWeather();
              } on Exception catch (exception) {
                weatherConditionName = '';
                debugPrint('$exception');
              }
              _updateWeatherCondition(weatherConditionName);
            },
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
