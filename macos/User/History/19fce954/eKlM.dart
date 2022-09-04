// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() logoutRequested,
    required TResult Function(Session status) authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$$AuthStartedCopyWith<$Res> {
  factory _$$AuthStartedCopyWith(
          _$AuthStarted value, $Res Function(_$AuthStarted) then) =
      __$$AuthStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthStartedCopyWith<$Res> {
  __$$AuthStartedCopyWithImpl(
      _$AuthStarted _value, $Res Function(_$AuthStarted) _then)
      : super(_value, (v) => _then(v as _$AuthStarted));

  @override
  _$AuthStarted get _value => super._value as _$AuthStarted;
}

/// @nodoc

class _$AuthStarted extends AuthStarted {
  const _$AuthStarted() : super._();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() logoutRequested,
    required TResult Function(Session status) authStatusChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
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
    required TResult Function(AuthStarted value) started,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class AuthStarted extends AuthEvent {
  const factory AuthStarted() = _$AuthStarted;
  const AuthStarted._() : super._();
}

/// @nodoc
abstract class _$$AuthLogoutRequestedCopyWith<$Res> {
  factory _$$AuthLogoutRequestedCopyWith(_$AuthLogoutRequested value,
          $Res Function(_$AuthLogoutRequested) then) =
      __$$AuthLogoutRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLogoutRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$AuthLogoutRequestedCopyWith<$Res> {
  __$$AuthLogoutRequestedCopyWithImpl(
      _$AuthLogoutRequested _value, $Res Function(_$AuthLogoutRequested) _then)
      : super(_value, (v) => _then(v as _$AuthLogoutRequested));

  @override
  _$AuthLogoutRequested get _value => super._value as _$AuthLogoutRequested;
}

/// @nodoc

class _$AuthLogoutRequested extends AuthLogoutRequested {
  const _$AuthLogoutRequested() : super._();

  @override
  String toString() {
    return 'AuthEvent.logoutRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLogoutRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() logoutRequested,
    required TResult Function(Session status) authStatusChanged,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class AuthLogoutRequested extends AuthEvent {
  const factory AuthLogoutRequested() = _$AuthLogoutRequested;
  const AuthLogoutRequested._() : super._();
}

/// @nodoc
abstract class _$$_AuthStatusChangedCopyWith<$Res> {
  factory _$$_AuthStatusChangedCopyWith(_$_AuthStatusChanged value,
          $Res Function(_$_AuthStatusChanged) then) =
      __$$_AuthStatusChangedCopyWithImpl<$Res>;
  $Res call({Session status});
}

/// @nodoc
class __$$_AuthStatusChangedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements _$$_AuthStatusChangedCopyWith<$Res> {
  __$$_AuthStatusChangedCopyWithImpl(
      _$_AuthStatusChanged _value, $Res Function(_$_AuthStatusChanged) _then)
      : super(_value, (v) => _then(v as _$_AuthStatusChanged));

  @override
  _$_AuthStatusChanged get _value => super._value as _$_AuthStatusChanged;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_AuthStatusChanged(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }
}

/// @nodoc

class _$_AuthStatusChanged extends _AuthStatusChanged {
  const _$_AuthStatusChanged(this.status) : super._();

  @override
  final Session status;

  @override
  String toString() {
    return 'AuthEvent.authStatusChanged(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthStatusChanged &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_AuthStatusChangedCopyWith<_$_AuthStatusChanged> get copyWith =>
      __$$_AuthStatusChangedCopyWithImpl<_$_AuthStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() logoutRequested,
    required TResult Function(Session status) authStatusChanged,
  }) {
    return authStatusChanged(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
  }) {
    return authStatusChanged?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? logoutRequested,
    TResult Function(Session status)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStarted value) started,
    required TResult Function(AuthLogoutRequested value) logoutRequested,
    required TResult Function(_AuthStatusChanged value) authStatusChanged,
  }) {
    return authStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
  }) {
    return authStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStarted value)? started,
    TResult Function(AuthLogoutRequested value)? logoutRequested,
    TResult Function(_AuthStatusChanged value)? authStatusChanged,
    required TResult orElse(),
  }) {
    if (authStatusChanged != null) {
      return authStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthStatusChanged extends AuthEvent {
  const factory _AuthStatusChanged(final Session status) = _$_AuthStatusChanged;
  const _AuthStatusChanged._() : super._();

  Session get status;
  @JsonKey(ignore: true)
  _$$_AuthStatusChangedCopyWith<_$_AuthStatusChanged> get copyWith =>
      throw _privateConstructorUsedError;
}
