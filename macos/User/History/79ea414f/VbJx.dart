import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/authentication/signin/validators/identifier.dart';
import 'package:zanalys/authentication/signin/validators/password.dart';

class SignInState extends Equatable {
  const SignInState({
    this.identifier = const Identifier.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Identifier identifier;
  final Password password;
  final FormzStatus status;

  SignInState copyWith({
    Identifier? identifier,
    Password? password,
    FormzStatus? status,
  }) {
    return SignInState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [identifier, password, status];
}
