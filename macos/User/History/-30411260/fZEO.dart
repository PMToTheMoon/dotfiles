// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candidate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandidateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEventCopyWith<$Res> {
  factory $CandidateEventCopyWith(
          CandidateEvent value, $Res Function(CandidateEvent) then) =
      _$CandidateEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateEventCopyWithImpl<$Res>
    implements $CandidateEventCopyWith<$Res> {
  _$CandidateEventCopyWithImpl(this._value, this._then);

  final CandidateEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateEvent) _then;
}

/// @nodoc
abstract class _$$CandidateStartedCopyWith<$Res> {
  factory _$$CandidateStartedCopyWith(
          _$CandidateStarted value, $Res Function(_$CandidateStarted) then) =
      __$$CandidateStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateStartedCopyWithImpl<$Res>
    extends _$CandidateEventCopyWithImpl<$Res>
    implements _$$CandidateStartedCopyWith<$Res> {
  __$$CandidateStartedCopyWithImpl(
      _$CandidateStarted _value, $Res Function(_$CandidateStarted) _then)
      : super(_value, (v) => _then(v as _$CandidateStarted));

  @override
  _$CandidateStarted get _value => super._value as _$CandidateStarted;
}

/// @nodoc

class _$CandidateStarted implements CandidateStarted {
  const _$CandidateStarted();

  @override
  String toString() {
    return 'CandidateEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CandidateStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class CandidateStarted implements CandidateEvent {
  const factory CandidateStarted() = _$CandidateStarted;
}

/// @nodoc
mixin _$CandidateState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Candidate candidate) ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateInitial value) initial,
    required TResult Function(CandidateLoading value) loading,
    required TResult Function(CandidateReady value) ready,
    required TResult Function(CandidateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateStateCopyWith<$Res> {
  factory $CandidateStateCopyWith(
          CandidateState value, $Res Function(CandidateState) then) =
      _$CandidateStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateStateCopyWithImpl<$Res>
    implements $CandidateStateCopyWith<$Res> {
  _$CandidateStateCopyWithImpl(this._value, this._then);

  final CandidateState _value;
  // ignore: unused_field
  final $Res Function(CandidateState) _then;
}

/// @nodoc
abstract class _$$CandidateInitialCopyWith<$Res> {
  factory _$$CandidateInitialCopyWith(
          _$CandidateInitial value, $Res Function(_$CandidateInitial) then) =
      __$$CandidateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateInitialCopyWithImpl<$Res>
    extends _$CandidateStateCopyWithImpl<$Res>
    implements _$$CandidateInitialCopyWith<$Res> {
  __$$CandidateInitialCopyWithImpl(
      _$CandidateInitial _value, $Res Function(_$CandidateInitial) _then)
      : super(_value, (v) => _then(v as _$CandidateInitial));

  @override
  _$CandidateInitial get _value => super._value as _$CandidateInitial;
}

/// @nodoc

class _$CandidateInitial implements CandidateInitial {
  const _$CandidateInitial();

  @override
  String toString() {
    return 'CandidateState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CandidateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Candidate candidate) ready,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateInitial value) initial,
    required TResult Function(CandidateLoading value) loading,
    required TResult Function(CandidateReady value) ready,
    required TResult Function(CandidateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CandidateInitial implements CandidateState {
  const factory CandidateInitial() = _$CandidateInitial;
}

/// @nodoc
abstract class _$$CandidateLoadingCopyWith<$Res> {
  factory _$$CandidateLoadingCopyWith(
          _$CandidateLoading value, $Res Function(_$CandidateLoading) then) =
      __$$CandidateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateLoadingCopyWithImpl<$Res>
    extends _$CandidateStateCopyWithImpl<$Res>
    implements _$$CandidateLoadingCopyWith<$Res> {
  __$$CandidateLoadingCopyWithImpl(
      _$CandidateLoading _value, $Res Function(_$CandidateLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateLoading));

  @override
  _$CandidateLoading get _value => super._value as _$CandidateLoading;
}

/// @nodoc

class _$CandidateLoading implements CandidateLoading {
  const _$CandidateLoading();

  @override
  String toString() {
    return 'CandidateState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CandidateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Candidate candidate) ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
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
    required TResult Function(CandidateInitial value) initial,
    required TResult Function(CandidateLoading value) loading,
    required TResult Function(CandidateReady value) ready,
    required TResult Function(CandidateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateLoading implements CandidateState {
  const factory CandidateLoading() = _$CandidateLoading;
}

/// @nodoc
abstract class _$$CandidateReadyCopyWith<$Res> {
  factory _$$CandidateReadyCopyWith(
          _$CandidateReady value, $Res Function(_$CandidateReady) then) =
      __$$CandidateReadyCopyWithImpl<$Res>;
  $Res call({Candidate candidate});
}

/// @nodoc
class __$$CandidateReadyCopyWithImpl<$Res>
    extends _$CandidateStateCopyWithImpl<$Res>
    implements _$$CandidateReadyCopyWith<$Res> {
  __$$CandidateReadyCopyWithImpl(
      _$CandidateReady _value, $Res Function(_$CandidateReady) _then)
      : super(_value, (v) => _then(v as _$CandidateReady));

  @override
  _$CandidateReady get _value => super._value as _$CandidateReady;

  @override
  $Res call({
    Object? candidate = freezed,
  }) {
    return _then(_$CandidateReady(
      candidate: candidate == freezed
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as Candidate,
    ));
  }
}

/// @nodoc

class _$CandidateReady implements CandidateReady {
  const _$CandidateReady({required this.candidate});

  @override
  final Candidate candidate;

  @override
  String toString() {
    return 'CandidateState.ready(candidate: $candidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateReady &&
            const DeepCollectionEquality().equals(other.candidate, candidate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(candidate));

  @JsonKey(ignore: true)
  @override
  _$$CandidateReadyCopyWith<_$CandidateReady> get copyWith =>
      __$$CandidateReadyCopyWithImpl<_$CandidateReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Candidate candidate) ready,
    required TResult Function() error,
  }) {
    return ready(candidate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
  }) {
    return ready?.call(candidate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(candidate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateInitial value) initial,
    required TResult Function(CandidateLoading value) loading,
    required TResult Function(CandidateReady value) ready,
    required TResult Function(CandidateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class CandidateReady implements CandidateState {
  const factory CandidateReady({required final Candidate candidate}) =
      _$CandidateReady;

  Candidate get candidate;
  @JsonKey(ignore: true)
  _$$CandidateReadyCopyWith<_$CandidateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CandidateErrorCopyWith<$Res> {
  factory _$$CandidateErrorCopyWith(
          _$CandidateError value, $Res Function(_$CandidateError) then) =
      __$$CandidateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateErrorCopyWithImpl<$Res>
    extends _$CandidateStateCopyWithImpl<$Res>
    implements _$$CandidateErrorCopyWith<$Res> {
  __$$CandidateErrorCopyWithImpl(
      _$CandidateError _value, $Res Function(_$CandidateError) _then)
      : super(_value, (v) => _then(v as _$CandidateError));

  @override
  _$CandidateError get _value => super._value as _$CandidateError;
}

/// @nodoc

class _$CandidateError implements CandidateError {
  const _$CandidateError();

  @override
  String toString() {
    return 'CandidateState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CandidateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Candidate candidate) ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Candidate candidate)? ready,
    TResult Function()? error,
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
    required TResult Function(CandidateInitial value) initial,
    required TResult Function(CandidateLoading value) loading,
    required TResult Function(CandidateReady value) ready,
    required TResult Function(CandidateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateInitial value)? initial,
    TResult Function(CandidateLoading value)? loading,
    TResult Function(CandidateReady value)? ready,
    TResult Function(CandidateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateError implements CandidateState {
  const factory CandidateError() = _$CandidateError;
}
