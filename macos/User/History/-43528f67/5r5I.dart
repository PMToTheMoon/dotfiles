import 'package:app_client/auth/auth_repository.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends StateMachine<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(const ForgotPasswordState.idle()) {
    define<ForgotPasswordIdle>(($) => $
      ..on<ForgotPasswordResetRequested>(_toRequestingReset)
      ..define<ForgotPasswordError>()
      ..define<ForgotPasswordSuccess>());

    define<ForgotPasswordRequestingReset>(($) => $
      ..onEnter(_requestReset)
      ..on<ForgotPasswordResetLinkSuccessfullySent>(_toSuccess)
      ..on<ForgotPasswordResetLinkSuccessfullySent>(_toError));
  }

  final AuthRepository authRepository;

  void _onFormSubmitted(
    ForgotPasswordFormSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(const ForgotPasswordState.loading());
    try {
      await authRepository.forgotpassword(
        email: event.email,
        password: event.password,
      );
      emit(const ForgotPasswordState.success());
    } on Unauthorized {
      emit(const ForgotPasswordState.unauthorized());
    } catch (e) {
      emit(const ForgotPasswordState.unexpected());
    }
  }
}
