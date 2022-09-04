import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/storage/preferences_repository.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepository,
    required this.preferenceRepository,
  }) : super(
          LoginState.initial(
            savedEmail: authRepository.email,
            saveCredentials: preferenceRepository.saveCredentials,
          ),
        ) {
    on<LoginFormSubmitted>(_onFormSubmitted);
    on<LoginSaveCredentialsChanged>(_onSaveCredentialsChanged);
  }

  final AuthRepository authRepository;
  final PreferencesRepository preferenceRepository;

  Future<void> _onFormSubmitted(LoginFormSubmitted event, Emitter emit) async {
    if (state is LoginPostForm) return;
    try {
      await authRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(const LoginState.success());
    } catch (e) {
      emit(const LoginState.error());
    }
  }

  Future<void> _onSaveCredentialsChanged(
    LoginSaveCredentialsChanged event,
    Emitter emit,
  ) async {
    await preferenceRepository.setSaveCredentials(event.saveCredentials);
  }
}
