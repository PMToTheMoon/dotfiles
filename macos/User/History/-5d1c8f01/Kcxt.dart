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
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  final AuthRepository authRepository;

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter emit,
  ) async {}
}
