// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_training/test/view/main_page_layout_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_training/model/exception.dart' as _i6;
import 'package:flutter_training/model/repository/weather_repository.dart'
    as _i2;
import 'package:flutter_training/model/weather_info.dart' as _i5;
import 'package:flutter_training/utils/result.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i2.WeatherRepository {
  @override
  _i3.Future<
          _i4.Result<_i5.WeatherInfo,
              ({_i6.AppException exception, StackTrace stackTrace})>>
      fetchWeather() => (super.noSuchMethod(
            Invocation.method(
              #fetchWeather,
              [],
            ),
            returnValue: _i3.Future<
                _i4.Result<
                    _i5.WeatherInfo,
                    ({
                      _i6.AppException exception,
                      StackTrace stackTrace
                    })>>.value(_i7.dummyValue<
                _i4.Result<_i5.WeatherInfo,
                    ({_i6.AppException exception, StackTrace stackTrace})>>(
              this,
              Invocation.method(
                #fetchWeather,
                [],
              ),
            )),
            returnValueForMissingStub: _i3.Future<
                _i4.Result<
                    _i5.WeatherInfo,
                    ({
                      _i6.AppException exception,
                      StackTrace stackTrace
                    })>>.value(_i7.dummyValue<
                _i4.Result<_i5.WeatherInfo,
                    ({_i6.AppException exception, StackTrace stackTrace})>>(
              this,
              Invocation.method(
                #fetchWeather,
                [],
              ),
            )),
          ) as _i3.Future<
              _i4.Result<_i5.WeatherInfo,
                  ({_i6.AppException exception, StackTrace stackTrace})>>);
}
