// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weather_condition']),
      maxTemperature: (json['max_temperature'] as num).toInt(),
      minTemperature: (json['min_temperature'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'weather_condition':
          _$WeatherConditionEnumMap[instance.weatherCondition]!,
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'date': instance.date.toIso8601String(),
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.rainy: 'rainy',
};
