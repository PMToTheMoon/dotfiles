import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:zanalys/auth/signin/validators/identifier.dart';
import 'package:zanalys/auth/signin/validators/keep_user_id.dart';
import 'package:zanalys/auth/signin/validators/password.dart';

class SignInState extends Equatable {
  const SignInState({
    this.identifier = const Identifier.pure(),
    this.password = const Password.pure(),
    this.keepUserId = const KeepUserId.pure(),
    this.status = FormzStatus.pure,
  });

  final Identifier identifier;
  final Password password;
  final KeepUserId keepUserId;
  final FormzStatus status;

  SignInState copyWith({
    Identifier? identifier,
    Password? password,
    KeepUserId? keepUserId,
    FormzStatus? status,
  }) {
    return SignInState(
        identifier: identifier ?? this.identifier,
        password: password ?? this.password,
        status: status ?? this.status,
        keepUserId: keepUserId ?? this.keepUserId);
  }

  @override
  List<Object> get props => [identifier, password, keepUserId, status];
}
