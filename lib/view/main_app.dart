import 'package:flutter/material.dart';
import 'package:flutter_training/view/start_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: StartScreen(),
    );
  }
}
