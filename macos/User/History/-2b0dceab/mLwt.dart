// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candidate_new_education_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandidateNewEductaionEvent {
  NewEductaion get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewEductaion data) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NewEductaion data)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewEductaion data)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionCreated value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionCreated value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionCreated value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateNewEductaionEventCopyWith<CandidateNewEductaionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateNewEductaionEventCopyWith<$Res> {
  factory $CandidateNewEductaionEventCopyWith(CandidateNewEductaionEvent value,
          $Res Function(CandidateNewEductaionEvent) then) =
      _$CandidateNewEductaionEventCopyWithImpl<$Res>;
  $Res call({NewEductaion data});
}

/// @nodoc
class _$CandidateNewEductaionEventCopyWithImpl<$Res>
    implements $CandidateNewEductaionEventCopyWith<$Res> {
  _$CandidateNewEductaionEventCopyWithImpl(this._value, this._then);

  final CandidateNewEductaionEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateNewEductaionEvent) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewEductaion,
    ));
  }
}

/// @nodoc
abstract class _$$CandidateNewEductaionCreatedCopyWith<$Res>
    implements $CandidateNewEductaionEventCopyWith<$Res> {
  factory _$$CandidateNewEductaionCreatedCopyWith(
          _$CandidateNewEductaionCreated value,
          $Res Function(_$CandidateNewEductaionCreated) then) =
      __$$CandidateNewEductaionCreatedCopyWithImpl<$Res>;
  @override
  $Res call({NewEductaion data});
}

/// @nodoc
class __$$CandidateNewEductaionCreatedCopyWithImpl<$Res>
    extends _$CandidateNewEductaionEventCopyWithImpl<$Res>
    implements _$$CandidateNewEductaionCreatedCopyWith<$Res> {
  __$$CandidateNewEductaionCreatedCopyWithImpl(
      _$CandidateNewEductaionCreated _value,
      $Res Function(_$CandidateNewEductaionCreated) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEductaionCreated));

  @override
  _$CandidateNewEductaionCreated get _value =>
      super._value as _$CandidateNewEductaionCreated;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CandidateNewEductaionCreated(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewEductaion,
    ));
  }
}

/// @nodoc

class _$CandidateNewEductaionCreated extends CandidateNewEductaionCreated {
  const _$CandidateNewEductaionCreated({required this.data}) : super._();

  @override
  final NewEductaion data;

  @override
  String toString() {
    return 'CandidateNewEductaionEvent.created(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEductaionCreated &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$CandidateNewEductaionCreatedCopyWith<_$CandidateNewEductaionCreated>
      get copyWith => __$$CandidateNewEductaionCreatedCopyWithImpl<
          _$CandidateNewEductaionCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewEductaion data) created,
  }) {
    return created(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NewEductaion data)? created,
  }) {
    return created?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewEductaion data)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionCreated value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionCreated value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionCreated value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEductaionCreated extends CandidateNewEductaionEvent {
  const factory CandidateNewEductaionCreated(
      {required final NewEductaion data}) = _$CandidateNewEductaionCreated;
  const CandidateNewEductaionCreated._() : super._();

  @override
  NewEductaion get data;
  @override
  @JsonKey(ignore: true)
  _$$CandidateNewEductaionCreatedCopyWith<_$CandidateNewEductaionCreated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateNewEductaionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionIdle value) idle,
    required TResult Function(CandidateNewEductaionLoading value) loading,
    required TResult Function(CandidateNewEductaionError value) error,
    required TResult Function(CandidateNewEductaionSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateNewEductaionStateCopyWith<$Res> {
  factory $CandidateNewEductaionStateCopyWith(CandidateNewEductaionState value,
          $Res Function(CandidateNewEductaionState) then) =
      _$CandidateNewEductaionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateNewEductaionStateCopyWithImpl<$Res>
    implements $CandidateNewEductaionStateCopyWith<$Res> {
  _$CandidateNewEductaionStateCopyWithImpl(this._value, this._then);

  final CandidateNewEductaionState _value;
  // ignore: unused_field
  final $Res Function(CandidateNewEductaionState) _then;
}

/// @nodoc
abstract class _$$CandidateNewEductaionIdleCopyWith<$Res> {
  factory _$$CandidateNewEductaionIdleCopyWith(
          _$CandidateNewEductaionIdle value,
          $Res Function(_$CandidateNewEductaionIdle) then) =
      __$$CandidateNewEductaionIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEductaionIdleCopyWithImpl<$Res>
    extends _$CandidateNewEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateNewEductaionIdleCopyWith<$Res> {
  __$$CandidateNewEductaionIdleCopyWithImpl(_$CandidateNewEductaionIdle _value,
      $Res Function(_$CandidateNewEductaionIdle) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEductaionIdle));

  @override
  _$CandidateNewEductaionIdle get _value =>
      super._value as _$CandidateNewEductaionIdle;
}

/// @nodoc

class _$CandidateNewEductaionIdle extends CandidateNewEductaionIdle {
  const _$CandidateNewEductaionIdle() : super._();

  @override
  String toString() {
    return 'CandidateNewEductaionState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEductaionIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionIdle value) idle,
    required TResult Function(CandidateNewEductaionLoading value) loading,
    required TResult Function(CandidateNewEductaionError value) error,
    required TResult Function(CandidateNewEductaionSuccess value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEductaionIdle extends CandidateNewEductaionState {
  const factory CandidateNewEductaionIdle() = _$CandidateNewEductaionIdle;
  const CandidateNewEductaionIdle._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEductaionLoadingCopyWith<$Res> {
  factory _$$CandidateNewEductaionLoadingCopyWith(
          _$CandidateNewEductaionLoading value,
          $Res Function(_$CandidateNewEductaionLoading) then) =
      __$$CandidateNewEductaionLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEductaionLoadingCopyWithImpl<$Res>
    extends _$CandidateNewEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateNewEductaionLoadingCopyWith<$Res> {
  __$$CandidateNewEductaionLoadingCopyWithImpl(
      _$CandidateNewEductaionLoading _value,
      $Res Function(_$CandidateNewEductaionLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEductaionLoading));

  @override
  _$CandidateNewEductaionLoading get _value =>
      super._value as _$CandidateNewEductaionLoading;
}

/// @nodoc

class _$CandidateNewEductaionLoading extends CandidateNewEductaionLoading {
  const _$CandidateNewEductaionLoading() : super._();

  @override
  String toString() {
    return 'CandidateNewEductaionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEductaionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionIdle value) idle,
    required TResult Function(CandidateNewEductaionLoading value) loading,
    required TResult Function(CandidateNewEductaionError value) error,
    required TResult Function(CandidateNewEductaionSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEductaionLoading extends CandidateNewEductaionState {
  const factory CandidateNewEductaionLoading() = _$CandidateNewEductaionLoading;
  const CandidateNewEductaionLoading._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEductaionErrorCopyWith<$Res> {
  factory _$$CandidateNewEductaionErrorCopyWith(
          _$CandidateNewEductaionError value,
          $Res Function(_$CandidateNewEductaionError) then) =
      __$$CandidateNewEductaionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEductaionErrorCopyWithImpl<$Res>
    extends _$CandidateNewEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateNewEductaionErrorCopyWith<$Res> {
  __$$CandidateNewEductaionErrorCopyWithImpl(
      _$CandidateNewEductaionError _value,
      $Res Function(_$CandidateNewEductaionError) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEductaionError));

  @override
  _$CandidateNewEductaionError get _value =>
      super._value as _$CandidateNewEductaionError;
}

/// @nodoc

class _$CandidateNewEductaionError extends CandidateNewEductaionError {
  const _$CandidateNewEductaionError() : super._();

  @override
  String toString() {
    return 'CandidateNewEductaionState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEductaionError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionIdle value) idle,
    required TResult Function(CandidateNewEductaionLoading value) loading,
    required TResult Function(CandidateNewEductaionError value) error,
    required TResult Function(CandidateNewEductaionSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEductaionError extends CandidateNewEductaionState {
  const factory CandidateNewEductaionError() = _$CandidateNewEductaionError;
  const CandidateNewEductaionError._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEductaionSuccessCopyWith<$Res> {
  factory _$$CandidateNewEductaionSuccessCopyWith(
          _$CandidateNewEductaionSuccess value,
          $Res Function(_$CandidateNewEductaionSuccess) then) =
      __$$CandidateNewEductaionSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEductaionSuccessCopyWithImpl<$Res>
    extends _$CandidateNewEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateNewEductaionSuccessCopyWith<$Res> {
  __$$CandidateNewEductaionSuccessCopyWithImpl(
      _$CandidateNewEductaionSuccess _value,
      $Res Function(_$CandidateNewEductaionSuccess) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEductaionSuccess));

  @override
  _$CandidateNewEductaionSuccess get _value =>
      super._value as _$CandidateNewEductaionSuccess;
}

/// @nodoc

class _$CandidateNewEductaionSuccess extends CandidateNewEductaionSuccess {
  const _$CandidateNewEductaionSuccess() : super._();

  @override
  String toString() {
    return 'CandidateNewEductaionState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEductaionSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEductaionIdle value) idle,
    required TResult Function(CandidateNewEductaionLoading value) loading,
    required TResult Function(CandidateNewEductaionError value) error,
    required TResult Function(CandidateNewEductaionSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEductaionIdle value)? idle,
    TResult Function(CandidateNewEductaionLoading value)? loading,
    TResult Function(CandidateNewEductaionError value)? error,
    TResult Function(CandidateNewEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEductaionSuccess extends CandidateNewEductaionState {
  const factory CandidateNewEductaionSuccess() = _$CandidateNewEductaionSuccess;
  const CandidateNewEductaionSuccess._() : super._();
}
