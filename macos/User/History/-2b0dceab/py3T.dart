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
mixin _$CandidateNewEducationEvent {
  NewEducation get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewEducation data) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NewEducation data)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewEducation data)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateNewEducationCreated value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationCreated value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationCreated value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandidateNewEducationEventCopyWith<CandidateNewEducationEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateNewEducationEventCopyWith<$Res> {
  factory $CandidateNewEducationEventCopyWith(CandidateNewEducationEvent value,
          $Res Function(CandidateNewEducationEvent) then) =
      _$CandidateNewEducationEventCopyWithImpl<$Res>;
  $Res call({NewEducation data});
}

/// @nodoc
class _$CandidateNewEducationEventCopyWithImpl<$Res>
    implements $CandidateNewEducationEventCopyWith<$Res> {
  _$CandidateNewEducationEventCopyWithImpl(this._value, this._then);

  final CandidateNewEducationEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateNewEducationEvent) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewEducation,
    ));
  }
}

/// @nodoc
abstract class _$$CandidateNewEducationCreatedCopyWith<$Res>
    implements $CandidateNewEducationEventCopyWith<$Res> {
  factory _$$CandidateNewEducationCreatedCopyWith(
          _$CandidateNewEducationCreated value,
          $Res Function(_$CandidateNewEducationCreated) then) =
      __$$CandidateNewEducationCreatedCopyWithImpl<$Res>;
  @override
  $Res call({NewEducation data});
}

/// @nodoc
class __$$CandidateNewEducationCreatedCopyWithImpl<$Res>
    extends _$CandidateNewEducationEventCopyWithImpl<$Res>
    implements _$$CandidateNewEducationCreatedCopyWith<$Res> {
  __$$CandidateNewEducationCreatedCopyWithImpl(
      _$CandidateNewEducationCreated _value,
      $Res Function(_$CandidateNewEducationCreated) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEducationCreated));

  @override
  _$CandidateNewEducationCreated get _value =>
      super._value as _$CandidateNewEducationCreated;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CandidateNewEducationCreated(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as NewEducation,
    ));
  }
}

/// @nodoc

class _$CandidateNewEducationCreated extends CandidateNewEducationCreated {
  const _$CandidateNewEducationCreated({required this.data}) : super._();

  @override
  final NewEducation data;

  @override
  String toString() {
    return 'CandidateNewEducationEvent.created(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEducationCreated &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$CandidateNewEducationCreatedCopyWith<_$CandidateNewEducationCreated>
      get copyWith => __$$CandidateNewEducationCreatedCopyWithImpl<
          _$CandidateNewEducationCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NewEducation data) created,
  }) {
    return created(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NewEducation data)? created,
  }) {
    return created?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NewEducation data)? created,
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
    required TResult Function(CandidateNewEducationCreated value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationCreated value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationCreated value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEducationCreated extends CandidateNewEducationEvent {
  const factory CandidateNewEducationCreated(
      {required final NewEducation data}) = _$CandidateNewEducationCreated;
  const CandidateNewEducationCreated._() : super._();

  @override
  NewEducation get data;
  @override
  @JsonKey(ignore: true)
  _$$CandidateNewEducationCreatedCopyWith<_$CandidateNewEducationCreated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateNewEducationState {
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
    required TResult Function(CandidateNewEducationIdle value) idle,
    required TResult Function(CandidateNewEducationLoading value) loading,
    required TResult Function(CandidateNewEducationError value) error,
    required TResult Function(CandidateNewEducationSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateNewEducationStateCopyWith<$Res> {
  factory $CandidateNewEducationStateCopyWith(CandidateNewEducationState value,
          $Res Function(CandidateNewEducationState) then) =
      _$CandidateNewEducationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateNewEducationStateCopyWithImpl<$Res>
    implements $CandidateNewEducationStateCopyWith<$Res> {
  _$CandidateNewEducationStateCopyWithImpl(this._value, this._then);

  final CandidateNewEducationState _value;
  // ignore: unused_field
  final $Res Function(CandidateNewEducationState) _then;
}

/// @nodoc
abstract class _$$CandidateNewEducationIdleCopyWith<$Res> {
  factory _$$CandidateNewEducationIdleCopyWith(
          _$CandidateNewEducationIdle value,
          $Res Function(_$CandidateNewEducationIdle) then) =
      __$$CandidateNewEducationIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEducationIdleCopyWithImpl<$Res>
    extends _$CandidateNewEducationStateCopyWithImpl<$Res>
    implements _$$CandidateNewEducationIdleCopyWith<$Res> {
  __$$CandidateNewEducationIdleCopyWithImpl(_$CandidateNewEducationIdle _value,
      $Res Function(_$CandidateNewEducationIdle) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEducationIdle));

  @override
  _$CandidateNewEducationIdle get _value =>
      super._value as _$CandidateNewEducationIdle;
}

/// @nodoc

class _$CandidateNewEducationIdle extends CandidateNewEducationIdle {
  const _$CandidateNewEducationIdle() : super._();

  @override
  String toString() {
    return 'CandidateNewEducationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEducationIdle);
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
    required TResult Function(CandidateNewEducationIdle value) idle,
    required TResult Function(CandidateNewEducationLoading value) loading,
    required TResult Function(CandidateNewEducationError value) error,
    required TResult Function(CandidateNewEducationSuccess value) success,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEducationIdle extends CandidateNewEducationState {
  const factory CandidateNewEducationIdle() = _$CandidateNewEducationIdle;
  const CandidateNewEducationIdle._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEducationLoadingCopyWith<$Res> {
  factory _$$CandidateNewEducationLoadingCopyWith(
          _$CandidateNewEducationLoading value,
          $Res Function(_$CandidateNewEducationLoading) then) =
      __$$CandidateNewEducationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEducationLoadingCopyWithImpl<$Res>
    extends _$CandidateNewEducationStateCopyWithImpl<$Res>
    implements _$$CandidateNewEducationLoadingCopyWith<$Res> {
  __$$CandidateNewEducationLoadingCopyWithImpl(
      _$CandidateNewEducationLoading _value,
      $Res Function(_$CandidateNewEducationLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEducationLoading));

  @override
  _$CandidateNewEducationLoading get _value =>
      super._value as _$CandidateNewEducationLoading;
}

/// @nodoc

class _$CandidateNewEducationLoading extends CandidateNewEducationLoading {
  const _$CandidateNewEducationLoading() : super._();

  @override
  String toString() {
    return 'CandidateNewEducationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEducationLoading);
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
    required TResult Function(CandidateNewEducationIdle value) idle,
    required TResult Function(CandidateNewEducationLoading value) loading,
    required TResult Function(CandidateNewEducationError value) error,
    required TResult Function(CandidateNewEducationSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEducationLoading extends CandidateNewEducationState {
  const factory CandidateNewEducationLoading() = _$CandidateNewEducationLoading;
  const CandidateNewEducationLoading._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEducationErrorCopyWith<$Res> {
  factory _$$CandidateNewEducationErrorCopyWith(
          _$CandidateNewEducationError value,
          $Res Function(_$CandidateNewEducationError) then) =
      __$$CandidateNewEducationErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEducationErrorCopyWithImpl<$Res>
    extends _$CandidateNewEducationStateCopyWithImpl<$Res>
    implements _$$CandidateNewEducationErrorCopyWith<$Res> {
  __$$CandidateNewEducationErrorCopyWithImpl(
      _$CandidateNewEducationError _value,
      $Res Function(_$CandidateNewEducationError) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEducationError));

  @override
  _$CandidateNewEducationError get _value =>
      super._value as _$CandidateNewEducationError;
}

/// @nodoc

class _$CandidateNewEducationError extends CandidateNewEducationError {
  const _$CandidateNewEducationError() : super._();

  @override
  String toString() {
    return 'CandidateNewEducationState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEducationError);
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
    required TResult Function(CandidateNewEducationIdle value) idle,
    required TResult Function(CandidateNewEducationLoading value) loading,
    required TResult Function(CandidateNewEducationError value) error,
    required TResult Function(CandidateNewEducationSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEducationError extends CandidateNewEducationState {
  const factory CandidateNewEducationError() = _$CandidateNewEducationError;
  const CandidateNewEducationError._() : super._();
}

/// @nodoc
abstract class _$$CandidateNewEducationSuccessCopyWith<$Res> {
  factory _$$CandidateNewEducationSuccessCopyWith(
          _$CandidateNewEducationSuccess value,
          $Res Function(_$CandidateNewEducationSuccess) then) =
      __$$CandidateNewEducationSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateNewEducationSuccessCopyWithImpl<$Res>
    extends _$CandidateNewEducationStateCopyWithImpl<$Res>
    implements _$$CandidateNewEducationSuccessCopyWith<$Res> {
  __$$CandidateNewEducationSuccessCopyWithImpl(
      _$CandidateNewEducationSuccess _value,
      $Res Function(_$CandidateNewEducationSuccess) _then)
      : super(_value, (v) => _then(v as _$CandidateNewEducationSuccess));

  @override
  _$CandidateNewEducationSuccess get _value =>
      super._value as _$CandidateNewEducationSuccess;
}

/// @nodoc

class _$CandidateNewEducationSuccess extends CandidateNewEducationSuccess {
  const _$CandidateNewEducationSuccess() : super._();

  @override
  String toString() {
    return 'CandidateNewEducationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateNewEducationSuccess);
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
    required TResult Function(CandidateNewEducationIdle value) idle,
    required TResult Function(CandidateNewEducationLoading value) loading,
    required TResult Function(CandidateNewEducationError value) error,
    required TResult Function(CandidateNewEducationSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateNewEducationIdle value)? idle,
    TResult Function(CandidateNewEducationLoading value)? loading,
    TResult Function(CandidateNewEducationError value)? error,
    TResult Function(CandidateNewEducationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CandidateNewEducationSuccess extends CandidateNewEducationState {
  const factory CandidateNewEducationSuccess() = _$CandidateNewEducationSuccess;
  const CandidateNewEducationSuccess._() : super._();
}
