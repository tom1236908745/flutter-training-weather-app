import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/view/main_page_layout.dart';

/// 初期画面描画用ウィジェット
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

mixin _AfterDisplayLayout on State<StartScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(
      WidgetsBinding.instance.endOfFrame.then(
        (_) {
          afterDisplayLayout();
        },
      ),
    );
  }

  Future<void> afterDisplayLayout();
}

class _StartScreenState extends State<StartScreen> with _AfterDisplayLayout {
  /// 開始から0.5秒遅らせて、メイン画面に遷移
  @override
  Future<void> afterDisplayLayout() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      final route = MaterialPageRoute<void>(
        builder: (context) => const MainPageLayout(),
      );
      final navigatorState = Navigator.of(context);
      await navigatorState.push(route);
      unawaited(afterDisplayLayout());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.green,
    );
  }
}
