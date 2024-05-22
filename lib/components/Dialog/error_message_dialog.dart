import 'package:flutter/material.dart';

void _handleCloseDialog(BuildContext context) {
  Navigator.of(context).pop();
}

/// エラーメッセージを表示するダイアログ
Future<void> showErrorDialog(BuildContext context, String errorMessage) async {
  if (!context.mounted) {
    return;
  }

  await showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(errorMessage),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              _handleCloseDialog(context);
            },
          ),
        ],
      );
    },
  );
}
