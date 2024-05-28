import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_model.freezed.dart';
part 'request_model.g.dart';

/// API・YumemiWeather にリクエストするデータ用のモデル層
@Freezed(toJson: true)
class RequestModel with _$RequestModel {
  const factory RequestModel({
    required String area,
    required String date,
  }) = _RequestModel;
}
