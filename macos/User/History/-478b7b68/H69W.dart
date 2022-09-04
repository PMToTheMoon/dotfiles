part of 'auth_bloc.dart';

/// Unauthenticated do **NOT** inherit from equatable, meaning bloc will
/// rebuild each time a Unauthenticated state is emitted, even if prev state was
/// Unauthenticated

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
