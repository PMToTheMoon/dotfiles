import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/auth/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.unknown()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<_AuthStatusChanged>(_onAuthStatusChanged);

    _authStatusSubscription = authRepository.statusStream
        .listen((status) => add(AuthEvent.authStatusChanged(status)));
  }

  final AuthRepository authRepository;

  late final StreamSubscription<AuthStatus> _authStatusSubscription;

  void logout() => add(const AuthEvent.logoutRequested());

  void login() => add(const AuthEvent.loginRequested());

  @override
  Future<void> close() async {
    await _authStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState.unauthenticated());
  }

  void _onAuthStatusChanged(_AuthStatusChanged event, Emitter emit) {
    switch (event.status) {
      case AuthStatus.unknown:
        return;
      case AuthStatus.unauthenticated:
        emit(const AuthState.unauthenticated());
        return;
      case AuthStatus.authenticated:
        emit(const AuthState.authenticated());
        return;
    }
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter emit,
  ) async {
    await authRepository.login();
    emit(const AuthState.authenticated());
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter emit,
  ) async {
    emit(const AuthState.unauthenticated());
  }
}

extension _ToAuthBloState on AuthStatus {
  AuthState toAuthBlocState() {
    switch (this) {
      case AuthStatus.unknown:
        return const AuthState.unknown();
      case AuthStatus.unauthenticated:
        return const AuthState.unauthenticated();
      case AuthStatus.authenticated:
        return const AuthState.authenticated();
    }
  }
}
