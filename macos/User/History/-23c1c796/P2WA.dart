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
mixin _$CandidateEditEducationEvent {
  EducationUpdate get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EducationUpdate data) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(EducationUpdate data)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EducationUpdate data)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateEditEducationUpdated value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationUpdated value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationUpdated value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateEditEducationEventCopyWith<CandidateEditEducationEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEditEducationEventCopyWith<$Res> {
  factory $CandidateEditEducationEventCopyWith(
          CandidateEditEducationEvent value,
          $Res Function(CandidateEditEducationEvent) then) =
      _$CandidateEditEducationEventCopyWithImpl<$Res>;
  $Res call({EducationUpdate data});
}

/// @nodoc
class _$CandidateEditEducationEventCopyWithImpl<$Res>
    implements $CandidateEditEducationEventCopyWith<$Res> {
  _$CandidateEditEducationEventCopyWithImpl(this._value, this._then);

  final CandidateEditEducationEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateEditEducationEvent) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EducationUpdate,
    ));
  }
}

/// @nodoc
abstract class _$$CandidateEditEducationUpdatedCopyWith<$Res>
    implements $CandidateEditEducationEventCopyWith<$Res> {
  factory _$$CandidateEditEducationUpdatedCopyWith(
          _$CandidateEditEducationUpdated value,
          $Res Function(_$CandidateEditEducationUpdated) then) =
      __$$CandidateEditEducationUpdatedCopyWithImpl<$Res>;
  @override
  $Res call({EducationUpdate data});
}

/// @nodoc
class __$$CandidateEditEducationUpdatedCopyWithImpl<$Res>
    extends _$CandidateEditEducationEventCopyWithImpl<$Res>
    implements _$$CandidateEditEducationUpdatedCopyWith<$Res> {
  __$$CandidateEditEducationUpdatedCopyWithImpl(
      _$CandidateEditEducationUpdated _value,
      $Res Function(_$CandidateEditEducationUpdated) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEducationUpdated));

  @override
  _$CandidateEditEducationUpdated get _value =>
      super._value as _$CandidateEditEducationUpdated;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CandidateEditEducationUpdated(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as EducationUpdate,
    ));
  }
}

/// @nodoc

class _$CandidateEditEducationUpdated extends CandidateEditEducationUpdated {
  const _$CandidateEditEducationUpdated({required this.data}) : super._();

  @override
  final EducationUpdate data;

  @override
  String toString() {
    return 'CandidateEditEducationEvent.updated(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEducationUpdated &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$CandidateEditEducationUpdatedCopyWith<_$CandidateEditEducationUpdated>
      get copyWith => __$$CandidateEditEducationUpdatedCopyWithImpl<
          _$CandidateEditEducationUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EducationUpdate data) updated,
  }) {
    return updated(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(EducationUpdate data)? updated,
  }) {
    return updated?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EducationUpdate data)? updated,
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
    required TResult Function(CandidateEditEducationUpdated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationUpdated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEducationUpdated
    extends CandidateEditEducationEvent {
  const factory CandidateEditEducationUpdated(
      {required final EducationUpdate data}) = _$CandidateEditEducationUpdated;
  const CandidateEditEducationUpdated._() : super._();

  @override
  EducationUpdate get data;
  @override
  @JsonKey(ignore: true)
  _$$CandidateEditEducationUpdatedCopyWith<_$CandidateEditEducationUpdated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateEditEducationState {
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
    required TResult Function(CandidateEditEducationIdle value) idle,
    required TResult Function(CandidateEditEducationLoading value) loading,
    required TResult Function(CandidateEditEducationError value) error,
    required TResult Function(CandidateEditEducationSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEditEducationStateCopyWith<$Res> {
  factory $CandidateEditEducationStateCopyWith(
          CandidateEditEducationState value,
          $Res Function(CandidateEditEducationState) then) =
      _$CandidateEditEducationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateEditEducationStateCopyWithImpl<$Res>
    implements $CandidateEditEducationStateCopyWith<$Res> {
  _$CandidateEditEducationStateCopyWithImpl(this._value, this._then);

  final CandidateEditEducationState _value;
  // ignore: unused_field
  final $Res Function(CandidateEditEducationState) _then;
}

/// @nodoc
abstract class _$$CandidateEditEducationIdleCopyWith<$Res> {
  factory _$$CandidateEditEducationIdleCopyWith(
          _$CandidateEditEducationIdle value,
          $Res Function(_$CandidateEditEducationIdle) then) =
      __$$CandidateEditEducationIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEducationIdleCopyWithImpl<$Res>
    extends _$CandidateEditEducationStateCopyWithImpl<$Res>
    implements _$$CandidateEditEducationIdleCopyWith<$Res> {
  __$$CandidateEditEducationIdleCopyWithImpl(
      _$CandidateEditEducationIdle _value,
      $Res Function(_$CandidateEditEducationIdle) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEducationIdle));

  @override
  _$CandidateEditEducationIdle get _value =>
      super._value as _$CandidateEditEducationIdle;
}

/// @nodoc

class _$CandidateEditEducationIdle extends CandidateEditEducationIdle {
  const _$CandidateEditEducationIdle() : super._();

  @override
  String toString() {
    return 'CandidateEditEducationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEducationIdle);
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
    required TResult Function(CandidateEditEducationIdle value) idle,
    required TResult Function(CandidateEditEducationLoading value) loading,
    required TResult Function(CandidateEditEducationError value) error,
    required TResult Function(CandidateEditEducationSuccess value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEducationIdle extends CandidateEditEducationState {
  const factory CandidateEditEducationIdle() = _$CandidateEditEducationIdle;
  const CandidateEditEducationIdle._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEducationLoadingCopyWith<$Res> {
  factory _$$CandidateEditEducationLoadingCopyWith(
          _$CandidateEditEducationLoading value,
          $Res Function(_$CandidateEditEducationLoading) then) =
      __$$CandidateEditEducationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEducationLoadingCopyWithImpl<$Res>
    extends _$CandidateEditEducationStateCopyWithImpl<$Res>
    implements _$$CandidateEditEducationLoadingCopyWith<$Res> {
  __$$CandidateEditEducationLoadingCopyWithImpl(
      _$CandidateEditEducationLoading _value,
      $Res Function(_$CandidateEditEducationLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEducationLoading));

  @override
  _$CandidateEditEducationLoading get _value =>
      super._value as _$CandidateEditEducationLoading;
}

/// @nodoc

class _$CandidateEditEducationLoading extends CandidateEditEducationLoading {
  const _$CandidateEditEducationLoading() : super._();

  @override
  String toString() {
    return 'CandidateEditEducationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEducationLoading);
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
    required TResult Function(CandidateEditEducationIdle value) idle,
    required TResult Function(CandidateEditEducationLoading value) loading,
    required TResult Function(CandidateEditEducationError value) error,
    required TResult Function(CandidateEditEducationSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEducationLoading
    extends CandidateEditEducationState {
  const factory CandidateEditEducationLoading() =
      _$CandidateEditEducationLoading;
  const CandidateEditEducationLoading._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEducationErrorCopyWith<$Res> {
  factory _$$CandidateEditEducationErrorCopyWith(
          _$CandidateEditEducationError value,
          $Res Function(_$CandidateEditEducationError) then) =
      __$$CandidateEditEducationErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEducationErrorCopyWithImpl<$Res>
    extends _$CandidateEditEducationStateCopyWithImpl<$Res>
    implements _$$CandidateEditEducationErrorCopyWith<$Res> {
  __$$CandidateEditEducationErrorCopyWithImpl(
      _$CandidateEditEducationError _value,
      $Res Function(_$CandidateEditEducationError) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEducationError));

  @override
  _$CandidateEditEducationError get _value =>
      super._value as _$CandidateEditEducationError;
}

/// @nodoc

class _$CandidateEditEducationError extends CandidateEditEducationError {
  const _$CandidateEditEducationError() : super._();

  @override
  String toString() {
    return 'CandidateEditEducationState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEducationError);
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
    required TResult Function(CandidateEditEducationIdle value) idle,
    required TResult Function(CandidateEditEducationLoading value) loading,
    required TResult Function(CandidateEditEducationError value) error,
    required TResult Function(CandidateEditEducationSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEducationError extends CandidateEditEducationState {
  const factory CandidateEditEducationError() = _$CandidateEditEducationError;
  const CandidateEditEducationError._() : super._();
}

/// @nodoc
abstract class _$$CandidateEditEducationSuccessCopyWith<$Res> {
  factory _$$CandidateEditEducationSuccessCopyWith(
          _$CandidateEditEducationSuccess value,
          $Res Function(_$CandidateEditEducationSuccess) then) =
      __$$CandidateEditEducationSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateEditEducationSuccessCopyWithImpl<$Res>
    extends _$CandidateEditEducationStateCopyWithImpl<$Res>
    implements _$$CandidateEditEducationSuccessCopyWith<$Res> {
  __$$CandidateEditEducationSuccessCopyWithImpl(
      _$CandidateEditEducationSuccess _value,
      $Res Function(_$CandidateEditEducationSuccess) _then)
      : super(_value, (v) => _then(v as _$CandidateEditEducationSuccess));

  @override
  _$CandidateEditEducationSuccess get _value =>
      super._value as _$CandidateEditEducationSuccess;
}

/// @nodoc

class _$CandidateEditEducationSuccess extends CandidateEditEducationSuccess {
  const _$CandidateEditEducationSuccess() : super._();

  @override
  String toString() {
    return 'CandidateEditEducationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEditEducationSuccess);
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
    required TResult Function(CandidateEditEducationIdle value) idle,
    required TResult Function(CandidateEditEducationLoading value) loading,
    required TResult Function(CandidateEditEducationError value) error,
    required TResult Function(CandidateEditEducationSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateEditEducationIdle value)? idle,
    TResult Function(CandidateEditEducationLoading value)? loading,
    TResult Function(CandidateEditEducationError value)? error,
    TResult Function(CandidateEditEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CandidateEditEducationSuccess
    extends CandidateEditEducationState {
  const factory CandidateEditEducationSuccess() =
      _$CandidateEditEducationSuccess;
  const CandidateEditEducationSuccess._() : super._();
}
