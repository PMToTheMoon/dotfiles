import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanalys/auth/auth.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authService,
  }) : super(const AuthState.initial()) {
    on<AuthStarted>(_onStarted);
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthStatusChanged>(_onAuthStatusChanged);
    _authStatusStreamSubscription = authService.statusStream.listen(
      (status) => add(
        AuthStatusChanged(status: status),
      ),
    );
  }

  final AuthService authService;

  late final StreamSubscription<AuthStatus> _authStatusStreamSubscription;

  Future<void> _onStarted(AuthStarted event, Emitter emit) async {
    await authService.refreshBearerToken();
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter emit,
  ) async =>
      authService.logout();

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unknown:
        return;
      case AuthStatus.authenticated:
        try {
          await userRepository.fetch();
          return emit(const AuthState.authenticated());
        } catch (e) {
          return emit(const AuthState.unauthenticated());
        }
      case AuthStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
    }
  }

  @override
  Future<void> close() async {
    await _authStatusStreamSubscription.cancel();
    return super.close();
  }
}
