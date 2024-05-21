import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RequestModel {
  RequestModel({
    required this.area,
    required this.date,
  });

  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

  final String area;
  final String date;
}
