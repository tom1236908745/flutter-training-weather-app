// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_info_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherInfoNotifierHash() =>
    r'99b8357b8ad180fb646002e40421d20980ddd0e4';

/// API・YumemiWeather から取得するデータ用のビューモデル層
///
/// Copied from [WeatherInfoNotifier].
@ProviderFor(WeatherInfoNotifier)
final weatherInfoNotifierProvider = AutoDisposeAsyncNotifierProvider<
    WeatherInfoNotifier, WeatherInfo?>.internal(
  WeatherInfoNotifier.new,
  name: r'weatherInfoNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherInfoNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeatherInfoNotifier = AutoDisposeAsyncNotifier<WeatherInfo?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
