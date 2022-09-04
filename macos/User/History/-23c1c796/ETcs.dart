// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candidate_edit_education_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandidateEditEductaionEvent {
  EductaionUpdate get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EductaionUpdate data) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(EductaionUpdate data)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EductaionUpdate data)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEditEductaionUpdated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionUpdated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionUpdated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateEditEductaionEventCopyWith<CandidateEditEductaionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEditEductaionEventCopyWith<$Res> {
  factory $CandidateEditEductaionEventCopyWith(
          CandidateEditEductaionEvent value,
          $Res Function(CandidateEditEductaionEvent) then) =
      _$CandidateEditEductaionEventCopyWithImpl<$Res>;
  $Res call({EductaionUpdate data});
}

/// @nodoc
class _$CandidateEditEductaionEventCopyWithImpl<$Res>
    implements $CandidateEditEductaionEventCopyWith<$Res> {
  _$CandidateEditEductaionEventCopyWithImpl(this._value, this._then);

  final CandidateEditEductaionEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateEditEductaionEvent) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EductaionUpdate,
    ));
  }
}

/// @nodoc
abstract class _$$CandidateEditEductaionUpdatedCopyWith<$Res>
    implements $CandidateEditEductaionEventCopyWith<$Res> {
  factory _$$CandidateEditEductaionUpdatedCopyWith(
          _$CandidateEditEductaionUpdated value,
          $Res Function(_$CandidateEditEductaionUpdated) then) =
      __$$CandidateEditEductaionUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({EductaionUpdate data});
}

/// @nodoc
class __$$CandidateEditEductaionUpdatedCopyWithImpl<$Res>
    extends _$CandidateEditEductaionEventCopyWithImpl<$Res>
    implements _$$CandidateEditEductaionUpdatedCopyWith<$Res> {
  __$$CandidateEditEductaionUpdatedCopyWithImpl(
      _$CandidateEditEductaionUpdated _value,
      $Res Function(_$CandidateEditEductaionUpdated) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEductaionUpdated));

  @override
  _$CandidateEditEductaionUpdated get _value =>
      super._value as _$CandidateEditEductaionUpdated;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CandidateEditEductaionUpdated(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EductaionUpdate,
    ));
  }
}

/// @nodoc

class _$CandidateEditEductaionUpdated extends CandidateEditEductaionUpdated {
  const _$CandidateEditEductaionUpdated({required this.data}) : super._();

  @override
  final EductaionUpdate data;

  @override
  String toString() {
    return 'CandidateEditEductaionEvent.updated(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEductaionUpdated &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$CandidateEditEductaionUpdatedCopyWith<_$CandidateEditEductaionUpdated>
      get copyWith => __$$CandidateEditEductaionUpdatedCopyWithImpl<
          _$CandidateEditEductaionUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EductaionUpdate data) updated,
  }) {
    return updated(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(EductaionUpdate data)? updated,
  }) {
    return updated?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EductaionUpdate data)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEditEductaionUpdated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionUpdated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEductaionUpdated
    extends CandidateEditEductaionEvent {
  const factory CandidateEditEductaionUpdated(
      {required final EductaionUpdate data}) = _$CandidateEditEductaionUpdated;
  const CandidateEditEductaionUpdated._() : super._();

  @override
  EductaionUpdate get data;
  @override
  @JsonKey(ignore: true)
  _$$CandidateEditEductaionUpdatedCopyWith<_$CandidateEditEductaionUpdated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateEditEductaionState {
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
    required TResult Function(CandidateEditEductaionIdle value) idle,
    required TResult Function(CandidateEditEductaionLoading value) loading,
    required TResult Function(CandidateEditEductaionError value) error,
    required TResult Function(CandidateEditEductaionSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEditEductaionStateCopyWith<$Res> {
  factory $CandidateEditEductaionStateCopyWith(
          CandidateEditEductaionState value,
          $Res Function(CandidateEditEductaionState) then) =
      _$CandidateEditEductaionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateEditEductaionStateCopyWithImpl<$Res>
    implements $CandidateEditEductaionStateCopyWith<$Res> {
  _$CandidateEditEductaionStateCopyWithImpl(this._value, this._then);

  final CandidateEditEductaionState _value;
  // ignore: unused_field
  final $Res Function(CandidateEditEductaionState) _then;
}

/// @nodoc
abstract class _$$CandidateEditEductaionIdleCopyWith<$Res> {
  factory _$$CandidateEditEductaionIdleCopyWith(
          _$CandidateEditEductaionIdle value,
          $Res Function(_$CandidateEditEductaionIdle) then) =
      __$$CandidateEditEductaionIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEductaionIdleCopyWithImpl<$Res>
    extends _$CandidateEditEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateEditEductaionIdleCopyWith<$Res> {
  __$$CandidateEditEductaionIdleCopyWithImpl(
      _$CandidateEditEductaionIdle _value,
      $Res Function(_$CandidateEditEductaionIdle) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEductaionIdle));

  @override
  _$CandidateEditEductaionIdle get _value =>
      super._value as _$CandidateEditEductaionIdle;
}

/// @nodoc

class _$CandidateEditEductaionIdle extends CandidateEditEductaionIdle {
  const _$CandidateEditEductaionIdle() : super._();

  @override
  String toString() {
    return 'CandidateEditEductaionState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEductaionIdle);
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
    required TResult Function(CandidateEditEductaionIdle value) idle,
    required TResult Function(CandidateEditEductaionLoading value) loading,
    required TResult Function(CandidateEditEductaionError value) error,
    required TResult Function(CandidateEditEductaionSuccess value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEductaionIdle extends CandidateEditEductaionState {
  const factory CandidateEditEductaionIdle() = _$CandidateEditEductaionIdle;
  const CandidateEditEductaionIdle._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEductaionLoadingCopyWith<$Res> {
  factory _$$CandidateEditEductaionLoadingCopyWith(
          _$CandidateEditEductaionLoading value,
          $Res Function(_$CandidateEditEductaionLoading) then) =
      __$$CandidateEditEductaionLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEductaionLoadingCopyWithImpl<$Res>
    extends _$CandidateEditEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateEditEductaionLoadingCopyWith<$Res> {
  __$$CandidateEditEductaionLoadingCopyWithImpl(
      _$CandidateEditEductaionLoading _value,
      $Res Function(_$CandidateEditEductaionLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEductaionLoading));

  @override
  _$CandidateEditEductaionLoading get _value =>
      super._value as _$CandidateEditEductaionLoading;
}

/// @nodoc

class _$CandidateEditEductaionLoading extends CandidateEditEductaionLoading {
  const _$CandidateEditEductaionLoading() : super._();

  @override
  String toString() {
    return 'CandidateEditEductaionState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEductaionLoading);
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
    required TResult Function(CandidateEditEductaionIdle value) idle,
    required TResult Function(CandidateEditEductaionLoading value) loading,
    required TResult Function(CandidateEditEductaionError value) error,
    required TResult Function(CandidateEditEductaionSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEductaionLoading
    extends CandidateEditEductaionState {
  const factory CandidateEditEductaionLoading() =
      _$CandidateEditEductaionLoading;
  const CandidateEditEductaionLoading._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEductaionErrorCopyWith<$Res> {
  factory _$$CandidateEditEductaionErrorCopyWith(
          _$CandidateEditEductaionError value,
          $Res Function(_$CandidateEditEductaionError) then) =
      __$$CandidateEditEductaionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEductaionErrorCopyWithImpl<$Res>
    extends _$CandidateEditEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateEditEductaionErrorCopyWith<$Res> {
  __$$CandidateEditEductaionErrorCopyWithImpl(
      _$CandidateEditEductaionError _value,
      $Res Function(_$CandidateEditEductaionError) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEductaionError));

  @override
  _$CandidateEditEductaionError get _value =>
      super._value as _$CandidateEditEductaionError;
}

/// @nodoc

class _$CandidateEditEductaionError extends CandidateEditEductaionError {
  const _$CandidateEditEductaionError() : super._();

  @override
  String toString() {
    return 'CandidateEditEductaionState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEductaionError);
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
    required TResult Function(CandidateEditEductaionIdle value) idle,
    required TResult Function(CandidateEditEductaionLoading value) loading,
    required TResult Function(CandidateEditEductaionError value) error,
    required TResult Function(CandidateEditEductaionSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEductaionError extends CandidateEditEductaionState {
  const factory CandidateEditEductaionError() = _$CandidateEditEductaionError;
  const CandidateEditEductaionError._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEductaionSuccessCopyWith<$Res> {
  factory _$$CandidateEditEductaionSuccessCopyWith(
          _$CandidateEditEductaionSuccess value,
          $Res Function(_$CandidateEditEductaionSuccess) then) =
      __$$CandidateEditEductaionSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEductaionSuccessCopyWithImpl<$Res>
    extends _$CandidateEditEductaionStateCopyWithImpl<$Res>
    implements _$$CandidateEditEductaionSuccessCopyWith<$Res> {
  __$$CandidateEditEductaionSuccessCopyWithImpl(
      _$CandidateEditEductaionSuccess _value,
      $Res Function(_$CandidateEditEductaionSuccess) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEductaionSuccess));

  @override
  _$CandidateEditEductaionSuccess get _value =>
      super._value as _$CandidateEditEductaionSuccess;
}

/// @nodoc

class _$CandidateEditEductaionSuccess extends CandidateEditEductaionSuccess {
  const _$CandidateEditEductaionSuccess() : super._();

  @override
  String toString() {
    return 'CandidateEditEductaionState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEductaionSuccess);
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
    required TResult Function(CandidateEditEductaionIdle value) idle,
    required TResult Function(CandidateEditEductaionLoading value) loading,
    required TResult Function(CandidateEditEductaionError value) error,
    required TResult Function(CandidateEditEductaionSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEductaionIdle value)? idle,
    TResult Function(CandidateEditEductaionLoading value)? loading,
    TResult Function(CandidateEditEductaionError value)? error,
    TResult Function(CandidateEditEductaionSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEductaionSuccess
    extends CandidateEditEductaionState {
  const factory CandidateEditEductaionSuccess() =
      _$CandidateEditEductaionSuccess;
  const CandidateEditEductaionSuccess._() : super._();
}
