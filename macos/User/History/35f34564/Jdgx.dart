part of 'simple_login_sm.dart';

class LoginState {
  const LoginState();
}

class WaitingFormSubmission extends LoginState {
  const WaitingFormSubmission({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}

class TryLoggingIn extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {}
