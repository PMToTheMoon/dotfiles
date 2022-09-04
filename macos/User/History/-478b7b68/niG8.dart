part of 'auth_bloc.dart';

class AuthState {}

class AuthInitial extends Equatable implements AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends Equatable implements AuthState {}
