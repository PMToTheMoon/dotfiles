import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginFormSubmitted>();
  }

  Future<void> _onFormSubmitted(LoginFormSubmitted event, Emitter emit) async {}
}
