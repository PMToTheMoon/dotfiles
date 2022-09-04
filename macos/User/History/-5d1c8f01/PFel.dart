import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter emit,
  ) async {}

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter emit,
  ) async {}
}
