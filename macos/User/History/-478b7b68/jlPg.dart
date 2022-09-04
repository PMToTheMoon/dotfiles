part of 'auth_bloc.dart';

/// Unauthenticated do **NOT** inherit from equatable, meaning bloc will
/// rebuild each time a Unauthenticated state is emitted, even if prev state was
/// Unauthenticated
///
/// We do this to ensure user will be

class AuthState {}

class AuthInitial extends Equatable implements AuthState {
  const AuthInitial();
  @override
  List<Object?> get props => throw UnimplementedError();
}

/// Not inherited form equatable
class Unauthenticated implements AuthState {
  const Unauthenticated();

  @override
  bool operator ==(Object other) => false;
}

class Authenticated extends Equatable implements AuthState {
  const Authenticated();
  @override
  List<Object?> get props => throw UnimplementedError();
}
