import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

/// API・YumemiWeather にリクエストするデータ用のモデル層
@Freezed(toJson: true)
class Request with _$Request {
  const factory Request({
    required String area,
    required DateTime date,
  }) = _Request;
}
