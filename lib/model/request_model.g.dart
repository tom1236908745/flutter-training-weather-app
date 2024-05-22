// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, unused_element, duplicate_ignore

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RequestModel',
      json,
      ($checkedConvert) {
        final val = RequestModel(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date,
    };
