import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 大枠のウィジェット
class MainPageLayout extends StatelessWidget {
  const MainPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: <Widget>[
              Spacer(),
              _CenterPart(),
              _TextButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

// 中央部分のウィジェット
class _CenterPart extends StatelessWidget {
  const _CenterPart();
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Placeholder(),
        ),
        Row(
          children: <Widget>[
            _TemperatureText(
              textColor: Colors.red,
            ),
            _TemperatureText(
              textColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

// 温度の表示用ウィジェット
class _TemperatureText extends StatelessWidget {
  const _TemperatureText({
    required this.textColor,
  });
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          width: 50,
          child: Center(
            child: Text(
              '** ℃',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('textColor', textColor));
  }
}

// 並列に並ぶテキストボタンの箇所ウィジェット
class _TextButtons extends StatelessWidget {
  const _TextButtons();
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 80),
          ),
          Row(
            children: <Widget>[
              _OperatingTextButton(textWord: 'Close'),
              _OperatingTextButton(textWord: 'Reload'),
            ],
          ),
        ],
      ),
    );
  }
}

// テキストボタンの共通箇所用ウィジェット
class _OperatingTextButton extends StatelessWidget {
  const _OperatingTextButton({
    required this.textWord,
  });
  final String textWord;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: null,
        child: Text(textWord, style: const TextStyle(color: Colors.blue)),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('textWord', textWord));
  }
}
