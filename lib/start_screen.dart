import 'package:flutter/material.dart';
import 'package:flutter_training/main_page_layout.dart';

/// 初期画面描画用ウィジェット
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => StartScreenState();
}

mixin AfterDisplayLayout on State<StartScreen> {
  void afterDisplayLayout();
}

class StartScreenState extends State<StartScreen> with AfterDisplayLayout {
  @override
  void initState() {
    super.initState();
    afterDisplayLayout();
  }

  @override
  void afterDisplayLayout() {
    final navigatorState = Navigator.of(context);
    final route = MaterialPageRoute<void>(
      builder: (context) => const MainPageLayout(),
    );
    // 開始から5秒遅らせて、メイン画面に遷移
    Future.delayed(const Duration(seconds: 1) * 0.5, () async {
      await navigatorState.push(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.green,
    );
  }
}
