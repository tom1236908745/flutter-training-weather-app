import 'package:flutter/material.dart';
import 'package:flutter_training/main_page_layout.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    final navigatorState = Navigator.of(context);
    final route = MaterialPageRoute<void>(
      builder: (context) => const MainPageLayout(),
    );
    Future.delayed(const Duration(seconds: 1) * 0.5, () async {
      await navigatorState.push(route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.green,
    );
  }
}
