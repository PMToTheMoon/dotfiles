part of 'forgot_password_bloc.dart';

/// ForgotPasswordSuccess and ForgotPasswordError inherit from
/// ForgotPasswordIdle because they share the behavior of letting user request
/// a password reset. They are present to distinguish the state from when the
/// request as already been requested, ti display on-screen messages for example

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  @override
  get props => [];
}

class ForgotPasswordIdle extends ForgotPasswordState {
  const ForgotPasswordIdle();
}

class ForgotPasswordSuccess extends ForgotPasswordIdle {
  final String sentTo;
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
