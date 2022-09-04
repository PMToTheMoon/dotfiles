import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    on<AuthStarted>(_onAuthStarted);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }
}
