import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/auth/auth_repository/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStatus> {
  AuthBloc({
    required this.authRepository,
  }) : super(authRepository.status) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<_AuthStatusChanged>(_onAuthStatusChanged);

    _authStatusSubscription = authRepository.statusStream
        .listen((status) => add(AuthEvent.authStatusChanged(status)));
  }

  final AuthRepository authRepository;

  late final StreamSubscription<AuthStatus> _authStatusSubscription;

  void logout() => add(const AuthEvent.logoutRequested());

  @override
  Future<void> close() async {
    await _authStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter emit,
  ) async {
    //TODO: remove delay ?
    // await Future.delayed(const Duration(seconds: 1));
    emit(authRepository.status);
  }

  void _onAuthStatusChanged(_AuthStatusChanged event, Emitter emit) {
    return emit(event.status);
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter emit,
  ) =>
      authRepository.logout();
}
