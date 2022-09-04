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
  @override
  get props => [];
}

class ForgotPasswordIdle extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordIdle {}

class ForgotPasswordError extends ForgotPasswordIdle {}

class ForgotPasswordRequestingReset extends ForgotPasswordState {
  const ForgotPasswordRequestingReset({required this.email});
  final String email;
  @override
  get props => [email];
}
