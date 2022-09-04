import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(ForgotPasswordState.initial(
          email: authRepository.cachedEmail,
        )) {
    on<ForgotPasswordFormSubmitted>(_onFormSubmitted);
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
