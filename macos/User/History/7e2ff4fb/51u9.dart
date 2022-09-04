part of 'simple_login_sm.dart';

class LoginEvent {}

class TryLoggingIn extends LoginEvent {
  const TryLoggingIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class LoginSucceeded extends LoginEvent {}

class LoginFailed extends LoginEvent {}
