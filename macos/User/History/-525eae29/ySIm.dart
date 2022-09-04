// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStatusCopyWith<$Res> {
  factory $SignInStatusCopyWith(
          LognInStatus value, $Res Function(LognInStatus) then) =
      _$SignInStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStatusCopyWithImpl<$Res> implements $SignInStatusCopyWith<$Res> {
  _$SignInStatusCopyWithImpl(this._value, this._then);

  final LognInStatus _value;
  // ignore: unused_field
  final $Res Function(LognInStatus) _then;
}

/// @nodoc
abstract class _$$SignInStatusAuthenticatedCopyWith<$Res> {
  factory _$$SignInStatusAuthenticatedCopyWith(
          _$SignInStatusAuthenticated value,
          $Res Function(_$SignInStatusAuthenticated) then) =
      __$$SignInStatusAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStatusAuthenticatedCopyWithImpl<$Res>
    extends _$SignInStatusCopyWithImpl<$Res>
    implements _$$SignInStatusAuthenticatedCopyWith<$Res> {
  __$$SignInStatusAuthenticatedCopyWithImpl(_$SignInStatusAuthenticated _value,
      $Res Function(_$SignInStatusAuthenticated) _then)
      : super(_value, (v) => _then(v as _$SignInStatusAuthenticated));

  @override
  _$SignInStatusAuthenticated get _value =>
      super._value as _$SignInStatusAuthenticated;
}

/// @nodoc

class _$SignInStatusAuthenticated implements SignInStatusAuthenticated {
  const _$SignInStatusAuthenticated();

  @override
  String toString() {
    return 'SignInStatus.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStatusAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class SignInStatusAuthenticated implements LognInStatus {
  const factory SignInStatusAuthenticated() = _$SignInStatusAuthenticated;
}

/// @nodoc
abstract class _$$SignInStatusErrorCopyWith<$Res> {
  factory _$$SignInStatusErrorCopyWith(
          _$SignInStatusError value, $Res Function(_$SignInStatusError) then) =
      __$$SignInStatusErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStatusErrorCopyWithImpl<$Res>
    extends _$SignInStatusCopyWithImpl<$Res>
    implements _$$SignInStatusErrorCopyWith<$Res> {
  __$$SignInStatusErrorCopyWithImpl(
      _$SignInStatusError _value, $Res Function(_$SignInStatusError) _then)
      : super(_value, (v) => _then(v as _$SignInStatusError));

  @override
  _$SignInStatusError get _value => super._value as _$SignInStatusError;
}

/// @nodoc

class _$SignInStatusError implements SignInStatusError {
  const _$SignInStatusError();

  @override
  String toString() {
    return 'SignInStatus.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInStatusError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
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
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignInStatusError implements LognInStatus {
  const factory SignInStatusError() = _$SignInStatusError;
}

/// @nodoc
abstract class _$$SignInStatusAccountLockedCopyWith<$Res> {
  factory _$$SignInStatusAccountLockedCopyWith(
          _$SignInStatusAccountLocked value,
          $Res Function(_$SignInStatusAccountLocked) then) =
      __$$SignInStatusAccountLockedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStatusAccountLockedCopyWithImpl<$Res>
    extends _$SignInStatusCopyWithImpl<$Res>
    implements _$$SignInStatusAccountLockedCopyWith<$Res> {
  __$$SignInStatusAccountLockedCopyWithImpl(_$SignInStatusAccountLocked _value,
      $Res Function(_$SignInStatusAccountLocked) _then)
      : super(_value, (v) => _then(v as _$SignInStatusAccountLocked));

  @override
  _$SignInStatusAccountLocked get _value =>
      super._value as _$SignInStatusAccountLocked;
}

/// @nodoc

class _$SignInStatusAccountLocked implements SignInStatusAccountLocked {
  const _$SignInStatusAccountLocked();

  @override
  String toString() {
    return 'SignInStatus.accountLocked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStatusAccountLocked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) {
    return accountLocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) {
    return accountLocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) {
    return accountLocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) {
    return accountLocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountLocked != null) {
      return accountLocked(this);
    }
    return orElse();
  }
}

abstract class SignInStatusAccountLocked implements LognInStatus {
  const factory SignInStatusAccountLocked() = _$SignInStatusAccountLocked;
}

/// @nodoc
abstract class _$$SignInStatusAccountAnonymousCopyWith<$Res> {
  factory _$$SignInStatusAccountAnonymousCopyWith(
          _$SignInStatusAccountAnonymous value,
          $Res Function(_$SignInStatusAccountAnonymous) then) =
      __$$SignInStatusAccountAnonymousCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStatusAccountAnonymousCopyWithImpl<$Res>
    extends _$SignInStatusCopyWithImpl<$Res>
    implements _$$SignInStatusAccountAnonymousCopyWith<$Res> {
  __$$SignInStatusAccountAnonymousCopyWithImpl(
      _$SignInStatusAccountAnonymous _value,
      $Res Function(_$SignInStatusAccountAnonymous) _then)
      : super(_value, (v) => _then(v as _$SignInStatusAccountAnonymous));

  @override
  _$SignInStatusAccountAnonymous get _value =>
      super._value as _$SignInStatusAccountAnonymous;
}

/// @nodoc

class _$SignInStatusAccountAnonymous implements SignInStatusAccountAnonymous {
  const _$SignInStatusAccountAnonymous();

  @override
  String toString() {
    return 'SignInStatus.accountAnonymous()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStatusAccountAnonymous);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) {
    return accountAnonymous();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) {
    return accountAnonymous?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountAnonymous != null) {
      return accountAnonymous();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) {
    return accountAnonymous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) {
    return accountAnonymous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountAnonymous != null) {
      return accountAnonymous(this);
    }
    return orElse();
  }
}

abstract class SignInStatusAccountAnonymous implements LognInStatus {
  const factory SignInStatusAccountAnonymous() = _$SignInStatusAccountAnonymous;
}

/// @nodoc
abstract class _$$SignInStatusAccountWithoutProfileCopyWith<$Res> {
  factory _$$SignInStatusAccountWithoutProfileCopyWith(
          _$SignInStatusAccountWithoutProfile value,
          $Res Function(_$SignInStatusAccountWithoutProfile) then) =
      __$$SignInStatusAccountWithoutProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStatusAccountWithoutProfileCopyWithImpl<$Res>
    extends _$SignInStatusCopyWithImpl<$Res>
    implements _$$SignInStatusAccountWithoutProfileCopyWith<$Res> {
  __$$SignInStatusAccountWithoutProfileCopyWithImpl(
      _$SignInStatusAccountWithoutProfile _value,
      $Res Function(_$SignInStatusAccountWithoutProfile) _then)
      : super(_value, (v) => _then(v as _$SignInStatusAccountWithoutProfile));

  @override
  _$SignInStatusAccountWithoutProfile get _value =>
      super._value as _$SignInStatusAccountWithoutProfile;
}

/// @nodoc

class _$SignInStatusAccountWithoutProfile
    implements SignInStatusAccountWithoutProfile {
  const _$SignInStatusAccountWithoutProfile();

  @override
  String toString() {
    return 'SignInStatus.accountWithoutProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStatusAccountWithoutProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authenticated,
    required TResult Function() error,
    required TResult Function() accountLocked,
    required TResult Function() accountAnonymous,
    required TResult Function() accountWithoutProfile,
  }) {
    return accountWithoutProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
  }) {
    return accountWithoutProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authenticated,
    TResult Function()? error,
    TResult Function()? accountLocked,
    TResult Function()? accountAnonymous,
    TResult Function()? accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountWithoutProfile != null) {
      return accountWithoutProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInStatusAuthenticated value) authenticated,
    required TResult Function(SignInStatusError value) error,
    required TResult Function(SignInStatusAccountLocked value) accountLocked,
    required TResult Function(SignInStatusAccountAnonymous value)
        accountAnonymous,
    required TResult Function(SignInStatusAccountWithoutProfile value)
        accountWithoutProfile,
  }) {
    return accountWithoutProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
  }) {
    return accountWithoutProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInStatusAuthenticated value)? authenticated,
    TResult Function(SignInStatusError value)? error,
    TResult Function(SignInStatusAccountLocked value)? accountLocked,
    TResult Function(SignInStatusAccountAnonymous value)? accountAnonymous,
    TResult Function(SignInStatusAccountWithoutProfile value)?
        accountWithoutProfile,
    required TResult orElse(),
  }) {
    if (accountWithoutProfile != null) {
      return accountWithoutProfile(this);
    }
    return orElse();
  }
}

abstract class SignInStatusAccountWithoutProfile implements LognInStatus {
  const factory SignInStatusAccountWithoutProfile() =
      _$SignInStatusAccountWithoutProfile;
}
