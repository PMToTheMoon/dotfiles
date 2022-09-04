import 'package:app_client/auth/auth_repository.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends StateMachine<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(const ForgotPasswordIdle()) {
    define<ForgotPasswordIdle>(($) => $
      ..on<ForgotPasswordResetRequested>(_toRequestingReset)
      ..define<ForgotPasswordError>()
      ..define<ForgotPasswordSuccess>());

    define<ForgotPasswordRequestingReset>(($) => $
      ..onEnter(_requestReset)
      ..on<ForgotPasswordResetLinkSuccessfullySent>(_toSuccess)
      ..on<ForgotPasswordResetRequestFailed>(_toError));
  }

  final AuthRepository authRepository;

  ForgotPasswordRequestingReset _toRequestingReset(
    ForgotPasswordResetRequested event,
    s,
  ) =>
      ForgotPasswordRequestingReset(email: event.email);

  ForgotPasswordSuccess _toSuccess(e, ForgotPasswordRequestingReset state) =>
      const ForgotPasswordSuccess(sentTo: state.email);
  ForgotPasswordError _toError(e, ForgotPasswordRequestingReset state) =>
      const ForgotPasswordError(sentTo: state.email);

  _requestReset(
    ForgotPasswordRequestingReset event,
  ) async {
    try {
      await authRepository.resetPassword(
        email: event.email,
      );
      add(const ForgotPasswordResetLinkSuccessfullySent());
    } catch (e) {
      add(const ForgotPasswordResetRequestFailed());
    }
  }
}
