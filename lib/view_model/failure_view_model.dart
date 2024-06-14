import 'package:flutter_training/utils/extensions/failure_message.dart';

/// `ViewModel`層 で異常系の状態を明示的に扱うクラス
class FailureViewModel {
  FailureViewModel({
    required this.failureMessage,
  });

  final FailureMessage failureMessage;
}
