import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/auth/authentication.dart';
import 'package:zanalys/auth/signin/bloc/signin_event.dart';
import 'package:zanalys/auth/signin/bloc/signin_state.dart';
import 'package:zanalys/auth/signin/validators/identifier.dart';
import 'package:zanalys/auth/signin/validators/password.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<IdentifierChanged>(_onIdentifierChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  void _onIdentifierChanged(
      IdentifierChanged event, Emitter<SignInState> emit) {
    final email = Identifier.dirty(event.identifier);
    emit(state.copyWith(
      identifier: email.valid ? email : Identifier.pure(event.identifier),
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([state.identifier, password]),
    ));
  }

  void _onSignInSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    final identifier = Identifier.dirty(state.identifier.value);
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      identifier: identifier,
      password: password,
      status: Formz.validate([identifier, password]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        LogInStatus status = await AppServices.auth
            .login(identifier: identifier.value, password: password.value);
        if (status is LogInStatusAuthenticated) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void identifierChanged(String identifier) {
    add(IdentifierChanged(identifier: identifier));
  }

  void passwordChanged(String password) {
    add(PasswordChanged(password: password));
  }

  void submit() {
    add(SignInSubmitted());
  }
}
