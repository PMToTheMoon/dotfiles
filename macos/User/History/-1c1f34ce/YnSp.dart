part of 'forgot_password_bloc.dart';

// ForgotPasswordSuccess and ForgotPasswordError

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  @override
  get props => [];
}

class ForgotPasswordIdle extends ForgotPasswordState {
  const ForgotPasswordIdle();
}

class ForgotPasswordSuccess extends ForgotPasswordIdle {
  const ForgotPasswordSuccess();
}

class ForgotPasswordError extends ForgotPasswordIdle {
  const ForgotPasswordError();
}

class ForgotPasswordRequestingReset extends ForgotPasswordState {
  const ForgotPasswordRequestingReset({required this.email});
  final String email;
  @override
  get props => [email];
}
