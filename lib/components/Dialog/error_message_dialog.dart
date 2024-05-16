import 'package:flutter/material.dart';

class ErrorMessageDialog extends StatelessWidget {
  const ErrorMessageDialog({required String errorMessage, super.key})
      : _errorMessage = errorMessage;

  final String _errorMessage;

  void handleCloseDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // TODO: いるか確認
      // title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(_errorMessage),
          ],
        ),
      ),
      // TODO: 閉じた時にだけ必要(？)
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            handleCloseDialog(context);
          },
        ),
      ],
    );
  }
}
