part of 'auth_bloc.dart';

class AuthState {}

class AuthInitial extends Equatable implements AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

/// Not inherited form equatable
class Unauthenticated extends AuthState {}

class Authenticated extends Equatable implements AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
