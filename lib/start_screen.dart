import 'package:flutter/material.dart';
import 'package:flutter_training/main_page_layout.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('メイン画面へ'),
      onPressed: () async {
        final navigatorState = Navigator.of(context);
        final route = MaterialPageRoute<void>(
          builder: (context) => const MainPageLayout(),
        );
        await navigatorState.push(route);
      },
    );
  }
}
