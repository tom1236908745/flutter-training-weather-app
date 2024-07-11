import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/constant/weather_condition.dart';
import 'package:flutter_training/gen/assets.gen.dart';
import 'package:flutter_training/view/components/dialog/error_message_dialog.dart';
import 'package:flutter_training/view_model/extensions/failure_message.dart';
import 'package:flutter_training/view_model/weather_info_notifier.dart';

/// 大枠のウィジェット
class MainPageLayout extends ConsumerStatefulWidget {
  const MainPageLayout({super.key});

  @override
  MainPageLayoutState createState() => MainPageLayoutState();
}

class MainPageLayoutState extends ConsumerState<MainPageLayout> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    ref.listen(weatherInfoNotifierProvider, (pre, next) async {
      if (!context.mounted) {
        return;
      }
      switch (next) {
        case AsyncLoading():
          setState(() {
            _isLoading = true;
          });
        case AsyncError(:final FailureMessage error):
          setState(() {
            _isLoading = false;
          });
          await showErrorDialog(context, error);
        default:
          setState(() {
            _isLoading = false;
          });
      }
    });
    final mainPage = Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          children: <Widget>[
            const Spacer(),
            _CenterPart(),
            Expanded(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  _TextButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          mainPage,
          if (_isLoading)
            const ColoredBox(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
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
class _CenterPart extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final weatherInfo = ref.watch(
      weatherInfoNotifierProvider.select((data) => data.valueOrNull),
    );
    final weatherCondition = weatherInfo?.weatherCondition;
    final maxTemperature = weatherInfo?.maxTemperature;
    final minTemperature = weatherInfo?.minTemperature;
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child:
              convertSvgWeatherImage(weatherCondition) ?? const Placeholder(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.red,
                  temperature: maxTemperature,
                ),
              ),
              Expanded(
                child: _TemperatureText(
                  textColor: Colors.blue,
                  temperature: minTemperature,
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
  _TemperatureText({
    required Color textColor,
    required int? temperature,
  })  : _textColor = textColor,
        _temperature = temperature != null ? temperature.toString() : '**';

  final Color _textColor;
  final String? _temperature;

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
class _TextButtons extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
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
              await ref
                  .read(weatherInfoNotifierProvider.notifier)
                  .fetchWeather();
            },
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
