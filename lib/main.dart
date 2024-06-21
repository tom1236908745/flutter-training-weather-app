import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/view/main_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
