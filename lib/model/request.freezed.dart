// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Request {
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res, Request>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$RequestCopyWithImpl<$Res, $Val extends Request>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestImplCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$$RequestImplCopyWith(
          _$RequestImpl value, $Res Function(_$RequestImpl) then) =
      __$$RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$RequestImplCopyWithImpl<$Res>
    extends _$RequestCopyWithImpl<$Res, _$RequestImpl>
    implements _$$RequestImplCopyWith<$Res> {
  __$$RequestImplCopyWithImpl(
      _$RequestImpl _value, $Res Function(_$RequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$RequestImpl(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$RequestImpl implements _Request {
  const _$RequestImpl({required this.area, required this.date});

  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Request(area: $area, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      __$$RequestImplCopyWithImpl<_$RequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestImplToJson(
      this,
    );
  }
}

abstract class _Request implements Request {
  const factory _Request(
      {required final String area,
      required final DateTime date}) = _$RequestImpl;

  @override
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$RequestImplCopyWith<_$RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
