import 'package:flutter_training/utils/extensions/failure_message.dart';

/// `Repository`層 で異常系の状態を明示的に扱うクラス
class FailureRepository {
  FailureRepository({
    required this.failureMessage,
    required this.stackTrace,
  });

  final FailureMessage failureMessage;
  final StackTrace stackTrace;
}
