import 'package:flutter/material.dart';

// 大枠のウィジェット
class MainPageLayout extends StatelessWidget {
  const MainPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: <Widget>[
            Spacer(),
            CenterParts(),
            TextButtonLayout(),
          ],
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
    return Container();
  }
}

// 並列に並ぶテキストボタンの箇所ウィジェット
class TextButtonLayout extends StatelessWidget {
  const TextButtonLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
