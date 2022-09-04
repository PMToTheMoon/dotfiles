// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candidate_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CandidateProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccount newCandidate) candidateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateProfileStarted value) started,
    required TResult Function(CandidateProfileCandidateChanged value)
        candidateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateProfileEventCopyWith<$Res> {
  factory $CandidateProfileEventCopyWith(CandidateProfileEvent value,
          $Res Function(CandidateProfileEvent) then) =
      _$CandidateProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateProfileEventCopyWithImpl<$Res>
    implements $CandidateProfileEventCopyWith<$Res> {
  _$CandidateProfileEventCopyWithImpl(this._value, this._then);

  final CandidateProfileEvent _value;
  // ignore: unused_field
  final $Res Function(CandidateProfileEvent) _then;
}

/// @nodoc
abstract class _$$CandidateProfileStartedCopyWith<$Res> {
  factory _$$CandidateProfileStartedCopyWith(_$CandidateProfileStarted value,
          $Res Function(_$CandidateProfileStarted) then) =
      __$$CandidateProfileStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateProfileStartedCopyWithImpl<$Res>
    extends _$CandidateProfileEventCopyWithImpl<$Res>
    implements _$$CandidateProfileStartedCopyWith<$Res> {
  __$$CandidateProfileStartedCopyWithImpl(_$CandidateProfileStarted _value,
      $Res Function(_$CandidateProfileStarted) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileStarted));

  @override
  _$CandidateProfileStarted get _value =>
      super._value as _$CandidateProfileStarted;
}

/// @nodoc

class _$CandidateProfileStarted implements CandidateProfileStarted {
  const _$CandidateProfileStarted();

  @override
  String toString() {
    return 'CandidateProfileEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccount newCandidate) candidateChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
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
    required TResult Function(CandidateProfileStarted value) started,
    required TResult Function(CandidateProfileCandidateChanged value)
        candidateChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileStarted implements CandidateProfileEvent {
  const factory CandidateProfileStarted() = _$CandidateProfileStarted;
}

/// @nodoc
abstract class _$$CandidateProfileCandidateChangedCopyWith<$Res> {
  factory _$$CandidateProfileCandidateChangedCopyWith(
          _$CandidateProfileCandidateChanged value,
          $Res Function(_$CandidateProfileCandidateChanged) then) =
      __$$CandidateProfileCandidateChangedCopyWithImpl<$Res>;
  $Res call({UserAccount newCandidate});
}

/// @nodoc
class __$$CandidateProfileCandidateChangedCopyWithImpl<$Res>
    extends _$CandidateProfileEventCopyWithImpl<$Res>
    implements _$$CandidateProfileCandidateChangedCopyWith<$Res> {
  __$$CandidateProfileCandidateChangedCopyWithImpl(
      _$CandidateProfileCandidateChanged _value,
      $Res Function(_$CandidateProfileCandidateChanged) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileCandidateChanged));

  @override
  _$CandidateProfileCandidateChanged get _value =>
      super._value as _$CandidateProfileCandidateChanged;

  @override
  $Res call({
    Object? newCandidate = freezed,
  }) {
    return _then(_$CandidateProfileCandidateChanged(
      newCandidate: newCandidate == freezed
          ? _value.newCandidate
          : newCandidate // ignore: cast_nullable_to_non_nullable
              as UserAccount,
    ));
  }
}

/// @nodoc

class _$CandidateProfileCandidateChanged
    implements CandidateProfileCandidateChanged {
  const _$CandidateProfileCandidateChanged({required this.newCandidate});

  @override
  final UserAccount newCandidate;

  @override
  String toString() {
    return 'CandidateProfileEvent.candidateChanged(newCandidate: $newCandidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileCandidateChanged &&
            const DeepCollectionEquality()
                .equals(other.newCandidate, newCandidate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(newCandidate));

  @JsonKey(ignore: true)
  @override
  _$$CandidateProfileCandidateChangedCopyWith<
          _$CandidateProfileCandidateChanged>
      get copyWith => __$$CandidateProfileCandidateChangedCopyWithImpl<
          _$CandidateProfileCandidateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccount newCandidate) candidateChanged,
  }) {
    return candidateChanged(newCandidate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
  }) {
    return candidateChanged?.call(newCandidate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccount newCandidate)? candidateChanged,
    required TResult orElse(),
  }) {
    if (candidateChanged != null) {
      return candidateChanged(newCandidate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateProfileStarted value) started,
    required TResult Function(CandidateProfileCandidateChanged value)
        candidateChanged,
  }) {
    return candidateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
  }) {
    return candidateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileStarted value)? started,
    TResult Function(CandidateProfileCandidateChanged value)? candidateChanged,
    required TResult orElse(),
  }) {
    if (candidateChanged != null) {
      return candidateChanged(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileCandidateChanged
    implements CandidateProfileEvent {
  const factory CandidateProfileCandidateChanged(
          {required final UserAccount newCandidate}) =
      _$CandidateProfileCandidateChanged;

  UserAccount get newCandidate;
  @JsonKey(ignore: true)
  _$$CandidateProfileCandidateChangedCopyWith<
          _$CandidateProfileCandidateChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CandidateProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount candidate) ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CandidateProfileInitial value) initial,
    required TResult Function(CandidateProfileLoading value) loading,
    required TResult Function(CandidateProfileReady value) ready,
    required TResult Function(CandidateProfileError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateProfileStateCopyWith<$Res> {
  factory $CandidateProfileStateCopyWith(CandidateProfileState value,
          $Res Function(CandidateProfileState) then) =
      _$CandidateProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CandidateProfileStateCopyWithImpl<$Res>
    implements $CandidateProfileStateCopyWith<$Res> {
  _$CandidateProfileStateCopyWithImpl(this._value, this._then);

  final CandidateProfileState _value;
  // ignore: unused_field
  final $Res Function(CandidateProfileState) _then;
}

/// @nodoc
abstract class _$$CandidateProfileInitialCopyWith<$Res> {
  factory _$$CandidateProfileInitialCopyWith(_$CandidateProfileInitial value,
          $Res Function(_$CandidateProfileInitial) then) =
      __$$CandidateProfileInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateProfileInitialCopyWithImpl<$Res>
    extends _$CandidateProfileStateCopyWithImpl<$Res>
    implements _$$CandidateProfileInitialCopyWith<$Res> {
  __$$CandidateProfileInitialCopyWithImpl(_$CandidateProfileInitial _value,
      $Res Function(_$CandidateProfileInitial) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileInitial));

  @override
  _$CandidateProfileInitial get _value =>
      super._value as _$CandidateProfileInitial;
}

/// @nodoc

class _$CandidateProfileInitial extends CandidateProfileInitial {
  const _$CandidateProfileInitial() : super._();

  @override
  String toString() {
    return 'CandidateProfileState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount candidate) ready,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
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
    required TResult Function(CandidateProfileInitial value) initial,
    required TResult Function(CandidateProfileLoading value) loading,
    required TResult Function(CandidateProfileReady value) ready,
    required TResult Function(CandidateProfileError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileInitial extends CandidateProfileState {
  const factory CandidateProfileInitial() = _$CandidateProfileInitial;
  const CandidateProfileInitial._() : super._();
}

/// @nodoc
abstract class _$$CandidateProfileLoadingCopyWith<$Res> {
  factory _$$CandidateProfileLoadingCopyWith(_$CandidateProfileLoading value,
          $Res Function(_$CandidateProfileLoading) then) =
      __$$CandidateProfileLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateProfileLoadingCopyWithImpl<$Res>
    extends _$CandidateProfileStateCopyWithImpl<$Res>
    implements _$$CandidateProfileLoadingCopyWith<$Res> {
  __$$CandidateProfileLoadingCopyWithImpl(_$CandidateProfileLoading _value,
      $Res Function(_$CandidateProfileLoading) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileLoading));

  @override
  _$CandidateProfileLoading get _value =>
      super._value as _$CandidateProfileLoading;
}

/// @nodoc

class _$CandidateProfileLoading extends CandidateProfileLoading {
  const _$CandidateProfileLoading() : super._();

  @override
  String toString() {
    return 'CandidateProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount candidate) ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
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
    required TResult Function(CandidateProfileInitial value) initial,
    required TResult Function(CandidateProfileLoading value) loading,
    required TResult Function(CandidateProfileReady value) ready,
    required TResult Function(CandidateProfileError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileLoading extends CandidateProfileState {
  const factory CandidateProfileLoading() = _$CandidateProfileLoading;
  const CandidateProfileLoading._() : super._();
}

/// @nodoc
abstract class _$$CandidateProfileReadyCopyWith<$Res> {
  factory _$$CandidateProfileReadyCopyWith(_$CandidateProfileReady value,
          $Res Function(_$CandidateProfileReady) then) =
      __$$CandidateProfileReadyCopyWithImpl<$Res>;
  $Res call({UserAccount candidate});
}

/// @nodoc
class __$$CandidateProfileReadyCopyWithImpl<$Res>
    extends _$CandidateProfileStateCopyWithImpl<$Res>
    implements _$$CandidateProfileReadyCopyWith<$Res> {
  __$$CandidateProfileReadyCopyWithImpl(_$CandidateProfileReady _value,
      $Res Function(_$CandidateProfileReady) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileReady));

  @override
  _$CandidateProfileReady get _value => super._value as _$CandidateProfileReady;

  @override
  $Res call({
    Object? candidate = freezed,
  }) {
    return _then(_$CandidateProfileReady(
      candidate: candidate == freezed
          ? _value.candidate
          : candidate // ignore: cast_nullable_to_non_nullable
              as UserAccount,
    ));
  }
}

/// @nodoc

class _$CandidateProfileReady extends CandidateProfileReady {
  const _$CandidateProfileReady({required this.candidate}) : super._();

  @override
  final UserAccount candidate;

  @override
  String toString() {
    return 'CandidateProfileState.ready(candidate: $candidate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateProfileReady &&
            const DeepCollectionEquality().equals(other.candidate, candidate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(candidate));

  @JsonKey(ignore: true)
  @override
  _$$CandidateProfileReadyCopyWith<_$CandidateProfileReady> get copyWith =>
      __$$CandidateProfileReadyCopyWithImpl<_$CandidateProfileReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount candidate) ready,
    required TResult Function() error,
  }) {
    return ready(candidate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
  }) {
    return ready?.call(candidate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
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
    required TResult Function(CandidateProfileInitial value) initial,
    required TResult Function(CandidateProfileLoading value) loading,
    required TResult Function(CandidateProfileReady value) ready,
    required TResult Function(CandidateProfileError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileReady extends CandidateProfileState {
  const factory CandidateProfileReady({required final UserAccount candidate}) =
      _$CandidateProfileReady;
  const CandidateProfileReady._() : super._();

  UserAccount get candidate;
  @JsonKey(ignore: true)
  _$$CandidateProfileReadyCopyWith<_$CandidateProfileReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CandidateProfileErrorCopyWith<$Res> {
  factory _$$CandidateProfileErrorCopyWith(_$CandidateProfileError value,
          $Res Function(_$CandidateProfileError) then) =
      __$$CandidateProfileErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CandidateProfileErrorCopyWithImpl<$Res>
    extends _$CandidateProfileStateCopyWithImpl<$Res>
    implements _$$CandidateProfileErrorCopyWith<$Res> {
  __$$CandidateProfileErrorCopyWithImpl(_$CandidateProfileError _value,
      $Res Function(_$CandidateProfileError) _then)
      : super(_value, (v) => _then(v as _$CandidateProfileError));

  @override
  _$CandidateProfileError get _value => super._value as _$CandidateProfileError;
}

/// @nodoc

class _$CandidateProfileError extends CandidateProfileError {
  const _$CandidateProfileError() : super._();

  @override
  String toString() {
    return 'CandidateProfileState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CandidateProfileError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount candidate) ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount candidate)? ready,
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
    required TResult Function(CandidateProfileInitial value) initial,
    required TResult Function(CandidateProfileLoading value) loading,
    required TResult Function(CandidateProfileReady value) ready,
    required TResult Function(CandidateProfileError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CandidateProfileInitial value)? initial,
    TResult Function(CandidateProfileLoading value)? loading,
    TResult Function(CandidateProfileReady value)? ready,
    TResult Function(CandidateProfileError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CandidateProfileError extends CandidateProfileState {
  const factory CandidateProfileError() = _$CandidateProfileError;
  const CandidateProfileError._() : super._();
}
