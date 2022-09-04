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
  const ForgotPasswordSuccess({required this.sentTo});
  final String sentTo;
  @override
  get props => [sentTo];
}

class ForgotPasswordError extends ForgotPasswordIdle {
  const ForgotPasswordError({required this.sentTo});
  final String sentTo;
  @override
  get props => [sentTo];
}

class ForgotPasswordRequestingReset extends ForgotPasswordState {
  const ForgotPasswordRequestingReset({required this.email});
  final String email;
  @override
  get props => [email];
}
