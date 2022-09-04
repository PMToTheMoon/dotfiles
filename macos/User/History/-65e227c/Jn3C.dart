import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/auth/auth.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.authRepository,
  }) : super(const LoginState.initial()) {
    on<LoginFormSubmitted>(_onFormSubmitted);
  }

  final AuthRepository authRepository;

  Future<void> _onFormSubmitted(LoginFormSubmitted event, Emitter emit) async {
    await authRepository.login(
      email: event.email,
      password: event.password,
      saveCredentials: event.saveCredentials,
    );
  }
}
