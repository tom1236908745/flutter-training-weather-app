// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoModel _$WeatherInfoModelFromJson(Map<String, dynamic> json) =>
    WeatherInfoModel(
      weatherCondition:
          WeatherCondition.from(json['weather_condition'] as String),
      maxTemperature: (json['max_temperature'] as num).toInt(),
      minTemperature: (json['min_temperature'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$WeatherInfoModelToJson(WeatherInfoModel instance) =>
    <String, dynamic>{
      'weatherCondition': instance.weatherCondition,
      'maxTemperature': instance.maxTemperature,
      'minTemperature': instance.minTemperature,
      'date': instance.date,
    };
