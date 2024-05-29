// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, unused_element, duplicate_ignore

part of 'main_page_layout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherInfoNotifierHash() =>
    r'f5e5440ca9bfabd3b647a8c4ae68c14ac7684e65';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WeatherInfoNotifier
    extends BuildlessAutoDisposeNotifier<WeatherInfo?> {
  late final WeatherInfo? weatherInfo;

  WeatherInfo? build(
    WeatherInfo? weatherInfo,
  );
}

/// See also [WeatherInfoNotifier].
@ProviderFor(WeatherInfoNotifier)
const weatherInfoNotifierProvider = WeatherInfoNotifierFamily();

/// See also [WeatherInfoNotifier].
class WeatherInfoNotifierFamily extends Family<WeatherInfo?> {
  /// See also [WeatherInfoNotifier].
  const WeatherInfoNotifierFamily();

  /// See also [WeatherInfoNotifier].
  WeatherInfoNotifierProvider call(
    WeatherInfo? weatherInfo,
  ) {
    return WeatherInfoNotifierProvider(
      weatherInfo,
    );
  }

  @override
  WeatherInfoNotifierProvider getProviderOverride(
    covariant WeatherInfoNotifierProvider provider,
  ) {
    return call(
      provider.weatherInfo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weatherInfoNotifierProvider';
}

/// See also [WeatherInfoNotifier].
class WeatherInfoNotifierProvider
    extends AutoDisposeNotifierProviderImpl<WeatherInfoNotifier, WeatherInfo?> {
  /// See also [WeatherInfoNotifier].
  WeatherInfoNotifierProvider(
    WeatherInfo? weatherInfo,
  ) : this._internal(
          () => WeatherInfoNotifier()..weatherInfo = weatherInfo,
          from: weatherInfoNotifierProvider,
          name: r'weatherInfoNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherInfoNotifierHash,
          dependencies: WeatherInfoNotifierFamily._dependencies,
          allTransitiveDependencies:
              WeatherInfoNotifierFamily._allTransitiveDependencies,
          weatherInfo: weatherInfo,
        );

  WeatherInfoNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weatherInfo,
  }) : super.internal();

  final WeatherInfo? weatherInfo;

  @override
  WeatherInfo? runNotifierBuild(
    covariant WeatherInfoNotifier notifier,
  ) {
    return notifier.build(
      weatherInfo,
    );
  }

  @override
  Override overrideWith(WeatherInfoNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WeatherInfoNotifierProvider._internal(
        () => create()..weatherInfo = weatherInfo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weatherInfo: weatherInfo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<WeatherInfoNotifier, WeatherInfo?>
      createElement() {
    return _WeatherInfoNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherInfoNotifierProvider &&
        other.weatherInfo == weatherInfo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weatherInfo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WeatherInfoNotifierRef on AutoDisposeNotifierProviderRef<WeatherInfo?> {
  /// The parameter `weatherInfo` of this provider.
  WeatherInfo? get weatherInfo;
}

class _WeatherInfoNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<WeatherInfoNotifier,
        WeatherInfo?> with WeatherInfoNotifierRef {
  _WeatherInfoNotifierProviderElement(super.provider);

  @override
  WeatherInfo? get weatherInfo =>
      (origin as WeatherInfoNotifierProvider).weatherInfo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
