import 'package:flutter/material.dart';

/// 大枠のウィジェット
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
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    _TextButtons(),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: 50,
        child: Center(
          child: Text(
            '** ℃',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: _textColor),
          ),
        ),
      ),
    );
  }
}

/// 並列に並ぶテキストボタンの箇所ウィジェット
class _TextButtons extends StatelessWidget {
  const _TextButtons();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Expanded(child: _OperatingTextButton(textWord: 'Close')),
        Expanded(child: _OperatingTextButton(textWord: 'Reload')),
      ],
    );
  }
}

/// テキストボタンの共通箇所用ウィジェット
class _OperatingTextButton extends StatelessWidget {
  const _OperatingTextButton({required String textWord}) : _textWord = textWord;
  final String _textWord;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(
        _textWord,
      ),
    );
  }
}
