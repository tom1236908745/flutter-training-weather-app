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
              CenterParts(),
              TextButtonLayout(),
            ],
          ),
        ),
      ),
    );
  }
}

// 中央部分のウィジェット
class CenterParts extends StatelessWidget {
  const CenterParts({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Placeholder(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TemperatureText(
              textColor: Colors.red,
            ),
            TemperatureText(
              textColor: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

// 温度の表示用ウィジェット
class TemperatureText extends StatelessWidget {
  const TemperatureText({
    required this.textColor,
    super.key,
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
            child: FormattedText(
              textWord: '** ℃',
              textTheme: Theme.of(context)
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

// 文字の表示用ウィジェット
class FormattedText extends StatelessWidget {
  const FormattedText({
    required this.textWord,
    required this.textTheme,
    super.key,
  });
  final String textWord;
  final TextStyle? textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      textWord,
      style: textTheme,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('textWord', textWord));
    properties.add(DiagnosticsProperty<TextStyle?>('textTheme', textTheme));
  }
}

// 並列に並ぶテキストボタンの箇所ウィジェット
class TextButtonLayout extends StatelessWidget {
  const TextButtonLayout({super.key});
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
              OperatingTextButton(textWord: 'Close'),
              OperatingTextButton(textWord: 'Reload'),
            ],
          ),
        ],
      ),
    );
  }
}

// テキストボタンの共通箇所用ウィジェット
class OperatingTextButton extends StatelessWidget {
  const OperatingTextButton({
    required this.textWord,
    super.key,
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
