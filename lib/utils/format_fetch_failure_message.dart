import 'package:flutter_training/constant/fetch_failure_set_phrase.dart.dart';

String formatFetchFailureMessage<T>(T failureMessage) {
  return '$fetchFailureSetPhrase$failureMessage';
}
