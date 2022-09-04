import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, LoginState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(LoginState.initial(
          email: authRepository.cachedEmail,
        )) {
    on<LoginFormSubmitted>(_onFormSubmitted);
  }

  final AuthRepository authRepository;

  void _onFormSubmitted(
    LoginFormSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.loading());
    try {
      await authRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(const LoginState.success());
    } on Unauthorized {
      emit(const LoginState.unauthorized());
    } catch (e) {
      emit(const LoginState.unexpected());
    }
  }
}
