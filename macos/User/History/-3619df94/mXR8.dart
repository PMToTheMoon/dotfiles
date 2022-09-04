// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginEventTearOff {
  const _$LoginEventTearOff();

  LoginInitialized initialized() {
    return const LoginInitialized();
  }

  LoginHidePasswordPressed hidePasswordPressed() {
    return const LoginHidePasswordPressed();
  }

  LoginFormSubmitted formSubmitted(
      {required String email, required String password}) {
    return LoginFormSubmitted(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $LoginEvent = _$LoginEventTearOff();

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() hidePasswordPressed,
    required TResult Function(String email, String password) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialized value) initialized,
    required TResult Function(LoginHidePasswordPressed value)
        hidePasswordPressed,
    required TResult Function(LoginFormSubmitted value) formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final ForgotPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ForgotPasswordEvent) _then;
}

/// @nodoc
abstract class $LoginInitializedCopyWith<$Res> {
  factory $LoginInitializedCopyWith(
          LoginInitialized value, $Res Function(LoginInitialized) then) =
      _$LoginInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginInitializedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginInitializedCopyWith<$Res> {
  _$LoginInitializedCopyWithImpl(
      LoginInitialized _value, $Res Function(LoginInitialized) _then)
      : super(_value, (v) => _then(v as LoginInitialized));

  @override
  LoginInitialized get _value => super._value as LoginInitialized;
}

/// @nodoc

class _$LoginInitialized extends LoginInitialized {
  const _$LoginInitialized() : super._();

  @override
  String toString() {
    return 'LoginEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() hidePasswordPressed,
    required TResult Function(String email, String password) formSubmitted,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialized value) initialized,
    required TResult Function(LoginHidePasswordPressed value)
        hidePasswordPressed,
    required TResult Function(LoginFormSubmitted value) formSubmitted,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class LoginInitialized extends ForgotPasswordEvent {
  const factory LoginInitialized() = _$LoginInitialized;
  const LoginInitialized._() : super._();
}

/// @nodoc
abstract class $LoginHidePasswordPressedCopyWith<$Res> {
  factory $LoginHidePasswordPressedCopyWith(LoginHidePasswordPressed value,
          $Res Function(LoginHidePasswordPressed) then) =
      _$LoginHidePasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginHidePasswordPressedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginHidePasswordPressedCopyWith<$Res> {
  _$LoginHidePasswordPressedCopyWithImpl(LoginHidePasswordPressed _value,
      $Res Function(LoginHidePasswordPressed) _then)
      : super(_value, (v) => _then(v as LoginHidePasswordPressed));

  @override
  LoginHidePasswordPressed get _value =>
      super._value as LoginHidePasswordPressed;
}

/// @nodoc

class _$LoginHidePasswordPressed extends LoginHidePasswordPressed {
  const _$LoginHidePasswordPressed() : super._();

  @override
  String toString() {
    return 'LoginEvent.hidePasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginHidePasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() hidePasswordPressed,
    required TResult Function(String email, String password) formSubmitted,
  }) {
    return hidePasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
  }) {
    return hidePasswordPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (hidePasswordPressed != null) {
      return hidePasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialized value) initialized,
    required TResult Function(LoginHidePasswordPressed value)
        hidePasswordPressed,
    required TResult Function(LoginFormSubmitted value) formSubmitted,
  }) {
    return hidePasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
  }) {
    return hidePasswordPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (hidePasswordPressed != null) {
      return hidePasswordPressed(this);
    }
    return orElse();
  }
}

abstract class LoginHidePasswordPressed extends ForgotPasswordEvent {
  const factory LoginHidePasswordPressed() = _$LoginHidePasswordPressed;
  const LoginHidePasswordPressed._() : super._();
}

/// @nodoc
abstract class $LoginFormSubmittedCopyWith<$Res> {
  factory $LoginFormSubmittedCopyWith(
          LoginFormSubmitted value, $Res Function(LoginFormSubmitted) then) =
      _$LoginFormSubmittedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginFormSubmittedCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $LoginFormSubmittedCopyWith<$Res> {
  _$LoginFormSubmittedCopyWithImpl(
      LoginFormSubmitted _value, $Res Function(LoginFormSubmitted) _then)
      : super(_value, (v) => _then(v as LoginFormSubmitted));

  @override
  LoginFormSubmitted get _value => super._value as LoginFormSubmitted;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(LoginFormSubmitted(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginFormSubmitted extends LoginFormSubmitted {
  const _$LoginFormSubmitted({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.formSubmitted(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginFormSubmitted &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  $LoginFormSubmittedCopyWith<LoginFormSubmitted> get copyWith =>
      _$LoginFormSubmittedCopyWithImpl<LoginFormSubmitted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() hidePasswordPressed,
    required TResult Function(String email, String password) formSubmitted,
  }) {
    return formSubmitted(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
  }) {
    return formSubmitted?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? hidePasswordPressed,
    TResult Function(String email, String password)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialized value) initialized,
    required TResult Function(LoginHidePasswordPressed value)
        hidePasswordPressed,
    required TResult Function(LoginFormSubmitted value) formSubmitted,
  }) {
    return formSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
  }) {
    return formSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialized value)? initialized,
    TResult Function(LoginHidePasswordPressed value)? hidePasswordPressed,
    TResult Function(LoginFormSubmitted value)? formSubmitted,
    required TResult orElse(),
  }) {
    if (formSubmitted != null) {
      return formSubmitted(this);
    }
    return orElse();
  }
}

abstract class LoginFormSubmitted extends ForgotPasswordEvent {
  const factory LoginFormSubmitted(
      {required String email, required String password}) = _$LoginFormSubmitted;
  const LoginFormSubmitted._() : super._();

  String get email;
  String get password;
  @JsonKey(ignore: true)
  $LoginFormSubmittedCopyWith<LoginFormSubmitted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  LoginInitialState initial({String? email}) {
    return LoginInitialState(
      email: email,
    );
  }

  LoginLoadingState loading() {
    return const LoginLoadingState();
  }

  LoginSuccessState success() {
    return const LoginSuccessState();
  }

  LoginUnexpectedErrorState unexpected() {
    return const LoginUnexpectedErrorState();
  }

  LoginUnauthorizedState unauthorized() {
    return const LoginUnauthorizedState();
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $LoginInitialStateCopyWith<$Res> {
  factory $LoginInitialStateCopyWith(
          LoginInitialState value, $Res Function(LoginInitialState) then) =
      _$LoginInitialStateCopyWithImpl<$Res>;
  $Res call({String? email});
}

/// @nodoc
class _$LoginInitialStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginInitialStateCopyWith<$Res> {
  _$LoginInitialStateCopyWithImpl(
      LoginInitialState _value, $Res Function(LoginInitialState) _then)
      : super(_value, (v) => _then(v as LoginInitialState));

  @override
  LoginInitialState get _value => super._value as LoginInitialState;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(LoginInitialState(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginInitialState extends LoginInitialState {
  const _$LoginInitialState({this.email}) : super._();

  @override
  final String? email;

  @override
  String toString() {
    return 'LoginState.initial(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginInitialState &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  $LoginInitialStateCopyWith<LoginInitialState> get copyWith =>
      _$LoginInitialStateCopyWithImpl<LoginInitialState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) {
    return initial(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) {
    return initial?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginInitialState extends LoginState {
  const factory LoginInitialState({String? email}) = _$LoginInitialState;
  const LoginInitialState._() : super._();

  String? get email;
  @JsonKey(ignore: true)
  $LoginInitialStateCopyWith<LoginInitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginLoadingStateCopyWith<$Res> {
  factory $LoginLoadingStateCopyWith(
          LoginLoadingState value, $Res Function(LoginLoadingState) then) =
      _$LoginLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginLoadingStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginLoadingStateCopyWith<$Res> {
  _$LoginLoadingStateCopyWithImpl(
      LoginLoadingState _value, $Res Function(LoginLoadingState) _then)
      : super(_value, (v) => _then(v as LoginLoadingState));

  @override
  LoginLoadingState get _value => super._value as LoginLoadingState;
}

/// @nodoc

class _$LoginLoadingState extends LoginLoadingState {
  const _$LoginLoadingState() : super._();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoadingState extends LoginState {
  const factory LoginLoadingState() = _$LoginLoadingState;
  const LoginLoadingState._() : super._();
}

/// @nodoc
abstract class $LoginSuccessStateCopyWith<$Res> {
  factory $LoginSuccessStateCopyWith(
          LoginSuccessState value, $Res Function(LoginSuccessState) then) =
      _$LoginSuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginSuccessStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginSuccessStateCopyWith<$Res> {
  _$LoginSuccessStateCopyWithImpl(
      LoginSuccessState _value, $Res Function(LoginSuccessState) _then)
      : super(_value, (v) => _then(v as LoginSuccessState));

  @override
  LoginSuccessState get _value => super._value as LoginSuccessState;
}

/// @nodoc

class _$LoginSuccessState extends LoginSuccessState {
  const _$LoginSuccessState() : super._();

  @override
  String toString() {
    return 'LoginState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginSuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccessState extends LoginState {
  const factory LoginSuccessState() = _$LoginSuccessState;
  const LoginSuccessState._() : super._();
}

/// @nodoc
abstract class $LoginUnexpectedErrorStateCopyWith<$Res> {
  factory $LoginUnexpectedErrorStateCopyWith(LoginUnexpectedErrorState value,
          $Res Function(LoginUnexpectedErrorState) then) =
      _$LoginUnexpectedErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginUnexpectedErrorStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginUnexpectedErrorStateCopyWith<$Res> {
  _$LoginUnexpectedErrorStateCopyWithImpl(LoginUnexpectedErrorState _value,
      $Res Function(LoginUnexpectedErrorState) _then)
      : super(_value, (v) => _then(v as LoginUnexpectedErrorState));

  @override
  LoginUnexpectedErrorState get _value =>
      super._value as LoginUnexpectedErrorState;
}

/// @nodoc

class _$LoginUnexpectedErrorState extends LoginUnexpectedErrorState {
  const _$LoginUnexpectedErrorState() : super._();

  @override
  String toString() {
    return 'LoginState.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginUnexpectedErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class LoginUnexpectedErrorState extends LoginState {
  const factory LoginUnexpectedErrorState() = _$LoginUnexpectedErrorState;
  const LoginUnexpectedErrorState._() : super._();
}

/// @nodoc
abstract class $LoginUnauthorizedStateCopyWith<$Res> {
  factory $LoginUnauthorizedStateCopyWith(LoginUnauthorizedState value,
          $Res Function(LoginUnauthorizedState) then) =
      _$LoginUnauthorizedStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginUnauthorizedStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginUnauthorizedStateCopyWith<$Res> {
  _$LoginUnauthorizedStateCopyWithImpl(LoginUnauthorizedState _value,
      $Res Function(LoginUnauthorizedState) _then)
      : super(_value, (v) => _then(v as LoginUnauthorizedState));

  @override
  LoginUnauthorizedState get _value => super._value as LoginUnauthorizedState;
}

/// @nodoc

class _$LoginUnauthorizedState extends LoginUnauthorizedState {
  const _$LoginUnauthorizedState() : super._();

  @override
  String toString() {
    return 'LoginState.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginUnauthorizedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? email) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() unexpected,
    required TResult Function() unauthorized,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? email)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? unexpected,
    TResult Function()? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginSuccessState value) success,
    required TResult Function(LoginUnexpectedErrorState value) unexpected,
    required TResult Function(LoginUnauthorizedState value) unauthorized,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginSuccessState value)? success,
    TResult Function(LoginUnexpectedErrorState value)? unexpected,
    TResult Function(LoginUnauthorizedState value)? unauthorized,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class LoginUnauthorizedState extends LoginState {
  const factory LoginUnauthorizedState() = _$LoginUnauthorizedState;
  const LoginUnauthorizedState._() : super._();
}
