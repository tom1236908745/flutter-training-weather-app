import 'package:flutter/material.dart';
import 'package:flutter_training/main_page_layout.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: TextButton(
        child: const Text('メイン画面へ'),
        onPressed: () async {
          final navigatorState = Navigator.of(context);
          final route = MaterialPageRoute<void>(
            builder: (context) => const MainPageLayout(),
          );
          await navigatorState.push(route);
        },
      ),
    );
  }
}
