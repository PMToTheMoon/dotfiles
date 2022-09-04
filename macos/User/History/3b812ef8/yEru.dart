// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserAccountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccountInformationUpdate update)
        informationEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserAccountStarted value) started,
    required TResult Function(UserAccountEventInformationEdited value)
        informationEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountEventCopyWith<$Res> {
  factory $UserAccountEventCopyWith(
          UserAccountEvent value, $Res Function(UserAccountEvent) then) =
      _$UserAccountEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserAccountEventCopyWithImpl<$Res>
    implements $UserAccountEventCopyWith<$Res> {
  _$UserAccountEventCopyWithImpl(this._value, this._then);

  final UserAccountEvent _value;
  // ignore: unused_field
  final $Res Function(UserAccountEvent) _then;
}

/// @nodoc
abstract class _$$UserAccountStartedCopyWith<$Res> {
  factory _$$UserAccountStartedCopyWith(_$UserAccountStarted value,
          $Res Function(_$UserAccountStarted) then) =
      __$$UserAccountStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAccountStartedCopyWithImpl<$Res>
    extends _$UserAccountEventCopyWithImpl<$Res>
    implements _$$UserAccountStartedCopyWith<$Res> {
  __$$UserAccountStartedCopyWithImpl(
      _$UserAccountStarted _value, $Res Function(_$UserAccountStarted) _then)
      : super(_value, (v) => _then(v as _$UserAccountStarted));

  @override
  _$UserAccountStarted get _value => super._value as _$UserAccountStarted;
}

/// @nodoc

class _$UserAccountStarted implements UserAccountStarted {
  const _$UserAccountStarted();

  @override
  String toString() {
    return 'UserAccountEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAccountStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccountInformationUpdate update)
        informationEdited,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
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
    required TResult Function(UserAccountStarted value) started,
    required TResult Function(UserAccountEventInformationEdited value)
        informationEdited,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class UserAccountStarted implements UserAccountEvent {
  const factory UserAccountStarted() = _$UserAccountStarted;
}

/// @nodoc
abstract class _$$UserAccountEventInformationEditedCopyWith<$Res> {
  factory _$$UserAccountEventInformationEditedCopyWith(
          _$UserAccountEventInformationEdited value,
          $Res Function(_$UserAccountEventInformationEdited) then) =
      __$$UserAccountEventInformationEditedCopyWithImpl<$Res>;
  $Res call({UserAccountInformationUpdate update});
}

/// @nodoc
class __$$UserAccountEventInformationEditedCopyWithImpl<$Res>
    extends _$UserAccountEventCopyWithImpl<$Res>
    implements _$$UserAccountEventInformationEditedCopyWith<$Res> {
  __$$UserAccountEventInformationEditedCopyWithImpl(
      _$UserAccountEventInformationEdited _value,
      $Res Function(_$UserAccountEventInformationEdited) _then)
      : super(_value, (v) => _then(v as _$UserAccountEventInformationEdited));

  @override
  _$UserAccountEventInformationEdited get _value =>
      super._value as _$UserAccountEventInformationEdited;

  @override
  $Res call({
    Object? update = freezed,
  }) {
    return _then(_$UserAccountEventInformationEdited(
      update: update == freezed
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as UserAccountInformationUpdate,
    ));
  }
}

/// @nodoc

class _$UserAccountEventInformationEdited
    implements UserAccountEventInformationEdited {
  const _$UserAccountEventInformationEdited({required this.update});

  @override
  final UserAccountInformationUpdate update;

  @override
  String toString() {
    return 'UserAccountEvent.informationEdited(update: $update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountEventInformationEdited &&
            const DeepCollectionEquality().equals(other.update, update));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(update));

  @JsonKey(ignore: true)
  @override
  _$$UserAccountEventInformationEditedCopyWith<
          _$UserAccountEventInformationEdited>
      get copyWith => __$$UserAccountEventInformationEditedCopyWithImpl<
          _$UserAccountEventInformationEdited>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserAccountInformationUpdate update)
        informationEdited,
  }) {
    return informationEdited(update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
  }) {
    return informationEdited?.call(update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserAccountInformationUpdate update)? informationEdited,
    required TResult orElse(),
  }) {
    if (informationEdited != null) {
      return informationEdited(update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserAccountStarted value) started,
    required TResult Function(UserAccountEventInformationEdited value)
        informationEdited,
  }) {
    return informationEdited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
  }) {
    return informationEdited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountStarted value)? started,
    TResult Function(UserAccountEventInformationEdited value)?
        informationEdited,
    required TResult orElse(),
  }) {
    if (informationEdited != null) {
      return informationEdited(this);
    }
    return orElse();
  }
}

abstract class UserAccountEventInformationEdited implements UserAccountEvent {
  const factory UserAccountEventInformationEdited(
          {required final UserAccountInformationUpdate update}) =
      _$UserAccountEventInformationEdited;

  UserAccountInformationUpdate get update;
  @JsonKey(ignore: true)
  _$$UserAccountEventInformationEditedCopyWith<
          _$UserAccountEventInformationEdited>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount account) ready,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserAccountInitial value) initial,
    required TResult Function(UserAccountLoading value) loading,
    required TResult Function(UserAccountReady value) ready,
    required TResult Function(UserAccountError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountStateCopyWith<$Res> {
  factory $UserAccountStateCopyWith(
          UserAccountState value, $Res Function(UserAccountState) then) =
      _$UserAccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserAccountStateCopyWithImpl<$Res>
    implements $UserAccountStateCopyWith<$Res> {
  _$UserAccountStateCopyWithImpl(this._value, this._then);

  final UserAccountState _value;
  // ignore: unused_field
  final $Res Function(UserAccountState) _then;
}

/// @nodoc
abstract class _$$UserAccountInitialCopyWith<$Res> {
  factory _$$UserAccountInitialCopyWith(_$UserAccountInitial value,
          $Res Function(_$UserAccountInitial) then) =
      __$$UserAccountInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAccountInitialCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$$UserAccountInitialCopyWith<$Res> {
  __$$UserAccountInitialCopyWithImpl(
      _$UserAccountInitial _value, $Res Function(_$UserAccountInitial) _then)
      : super(_value, (v) => _then(v as _$UserAccountInitial));

  @override
  _$UserAccountInitial get _value => super._value as _$UserAccountInitial;
}

/// @nodoc

class _$UserAccountInitial implements UserAccountInitial {
  const _$UserAccountInitial();

  @override
  String toString() {
    return 'UserAccountState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAccountInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount account) ready,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
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
    required TResult Function(UserAccountInitial value) initial,
    required TResult Function(UserAccountLoading value) loading,
    required TResult Function(UserAccountReady value) ready,
    required TResult Function(UserAccountError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserAccountInitial implements UserAccountState {
  const factory UserAccountInitial() = _$UserAccountInitial;
}

/// @nodoc
abstract class _$$UserAccountLoadingCopyWith<$Res> {
  factory _$$UserAccountLoadingCopyWith(_$UserAccountLoading value,
          $Res Function(_$UserAccountLoading) then) =
      __$$UserAccountLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAccountLoadingCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$$UserAccountLoadingCopyWith<$Res> {
  __$$UserAccountLoadingCopyWithImpl(
      _$UserAccountLoading _value, $Res Function(_$UserAccountLoading) _then)
      : super(_value, (v) => _then(v as _$UserAccountLoading));

  @override
  _$UserAccountLoading get _value => super._value as _$UserAccountLoading;
}

/// @nodoc

class _$UserAccountLoading implements UserAccountLoading {
  const _$UserAccountLoading();

  @override
  String toString() {
    return 'UserAccountState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAccountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount account) ready,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
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
    required TResult Function(UserAccountInitial value) initial,
    required TResult Function(UserAccountLoading value) loading,
    required TResult Function(UserAccountReady value) ready,
    required TResult Function(UserAccountError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserAccountLoading implements UserAccountState {
  const factory UserAccountLoading() = _$UserAccountLoading;
}

/// @nodoc
abstract class _$$UserAccountReadyCopyWith<$Res> {
  factory _$$UserAccountReadyCopyWith(
          _$UserAccountReady value, $Res Function(_$UserAccountReady) then) =
      __$$UserAccountReadyCopyWithImpl<$Res>;
  $Res call({UserAccount account});
}

/// @nodoc
class __$$UserAccountReadyCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$$UserAccountReadyCopyWith<$Res> {
  __$$UserAccountReadyCopyWithImpl(
      _$UserAccountReady _value, $Res Function(_$UserAccountReady) _then)
      : super(_value, (v) => _then(v as _$UserAccountReady));

  @override
  _$UserAccountReady get _value => super._value as _$UserAccountReady;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$UserAccountReady(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as UserAccount,
    ));
  }
}

/// @nodoc

class _$UserAccountReady implements UserAccountReady {
  const _$UserAccountReady({required this.account});

  @override
  final UserAccount account;

  @override
  String toString() {
    return 'UserAccountState.ready(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountReady &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$UserAccountReadyCopyWith<_$UserAccountReady> get copyWith =>
      __$$UserAccountReadyCopyWithImpl<_$UserAccountReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount account) ready,
    required TResult Function() error,
  }) {
    return ready(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
  }) {
    return ready?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserAccountInitial value) initial,
    required TResult Function(UserAccountLoading value) loading,
    required TResult Function(UserAccountReady value) ready,
    required TResult Function(UserAccountError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class UserAccountReady implements UserAccountState {
  const factory UserAccountReady({required final UserAccount account}) =
      _$UserAccountReady;

  UserAccount get account;
  @JsonKey(ignore: true)
  _$$UserAccountReadyCopyWith<_$UserAccountReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserAccountErrorCopyWith<$Res> {
  factory _$$UserAccountErrorCopyWith(
          _$UserAccountError value, $Res Function(_$UserAccountError) then) =
      __$$UserAccountErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserAccountErrorCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$$UserAccountErrorCopyWith<$Res> {
  __$$UserAccountErrorCopyWithImpl(
      _$UserAccountError _value, $Res Function(_$UserAccountError) _then)
      : super(_value, (v) => _then(v as _$UserAccountError));

  @override
  _$UserAccountError get _value => super._value as _$UserAccountError;
}

/// @nodoc

class _$UserAccountError implements UserAccountError {
  const _$UserAccountError();

  @override
  String toString() {
    return 'UserAccountState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserAccountError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserAccount account) ready,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserAccount account)? ready,
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
    required TResult Function(UserAccountInitial value) initial,
    required TResult Function(UserAccountLoading value) loading,
    required TResult Function(UserAccountReady value) ready,
    required TResult Function(UserAccountError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserAccountInitial value)? initial,
    TResult Function(UserAccountLoading value)? loading,
    TResult Function(UserAccountReady value)? ready,
    TResult Function(UserAccountError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserAccountError implements UserAccountState {
  const factory UserAccountError([String? message]) = _$UserAccountError;
}
