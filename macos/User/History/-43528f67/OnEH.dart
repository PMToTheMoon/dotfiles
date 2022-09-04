import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(ForgotPasswordState.initial(
          email: authRepository.cachedEmail,
        )) {
    on<LoginFormSubmitted>(_onFormSubmitted);
  }

  final AuthRepository authRepository;

  void _onFormSubmitted(
    LoginFormSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(const ForgotPasswordState.loading());
    try {
      await authRepository.login(
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
