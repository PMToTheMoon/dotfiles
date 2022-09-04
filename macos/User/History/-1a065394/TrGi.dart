import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
<<<<<<< HEAD:lib/auth/signin/bloc/signin_bloc.dart
import 'package:zanalys/app/services.dart';
import 'package:zanalys/auth/models/login_status.dart';
import 'package:zanalys/auth/signin/bloc/signin_event.dart';
import 'package:zanalys/auth/signin/bloc/signin_state.dart';
import 'package:zanalys/auth/signin/validators/identifier.dart';
import 'package:zanalys/auth/signin/validators/password.dart';
=======
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/data/model/user_sign_in_status.dart';
import 'package:zanalys/features/authentication/signin/bloc/signin_event.dart';
import 'package:zanalys/features/authentication/signin/bloc/signin_state.dart';
import 'package:zanalys/features/authentication/signin/validators/identifier.dart';
import 'package:zanalys/features/authentication/signin/validators/keep_user_id.dart';
import 'package:zanalys/features/authentication/signin/validators/password.dart';
>>>>>>> release/1.0.0:lib/features/authentication/signin/bloc/signin_bloc.dart

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<IdentifierChanged>(_onIdentifierChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
    on<FetchUserIdStatus>(_onFetchUserIdStatus);
    on<KeepUserIdChanged>(_onKeepUserId);
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

  void _onFetchUserIdStatus(
      FetchUserIdStatus event, Emitter<SignInState> emit) async {
    String? lastUserId = await AppServices.storage.getLastUserId();
    bool keepUserId = await AppServices.storage.keepLastUserId();
    final identifier = lastUserId != null
        ? Identifier.dirty(lastUserId)
        : const Identifier.pure("");

    final keep = KeepUserId.dirty(keepUserId);

    emit(state.copyWith(
      identifier: identifier,
      keepUserId: keep,
      status: Formz.validate([identifier, state.password]),
    ));
  }

  void _onKeepUserId(KeepUserIdChanged event, Emitter<SignInState> emit) async {
    final keep = KeepUserId.dirty(event.keep);
    emit(state.copyWith(
      keepUserId: keep.valid ? keep : KeepUserId.pure(event.keep),
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
          bool keepUserId = state.keepUserId.value;
          await AppServices.storage.saveKeepLastUserId(keepUserId);
          await AppServices.storage
              .saveLastUserId(keepUserId ? identifier.value : null);
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

  void fetchUserIdStatus() {
    add(FetchUserIdStatus());
  }

  void updateKeepUserId(bool keep) {
    add(KeepUserIdChanged(keep: keep));
  }
}
