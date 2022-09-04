part of 'forgot_password_bloc.dart';

// @freezed
// class ForgotPasswordState with _$ForgotPasswordState {
//   const ForgotPasswordState._();

//   const factory ForgotPasswordState.idle() = ForgotPasswordIdle;

//   const factory ForgotPasswordState.requestingReset({
//     required String email,
//   }) = ForgotPasswordRequestingReset;
//   const factory ForgotPasswordState.success() = ForgotPasswordSuccess;
//   const factory ForgotPasswordState.error() = ForgotPasswordError;
// }

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
