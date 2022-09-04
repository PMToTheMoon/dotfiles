enum UserSignInStatus {
  authenticated,
  error,
  accountLocked,
  accountAnonymous,
  accountWithoutProfile
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserSignInStatus.freezed.dart';

@freezed
class SignInStatus with _$SignInStatus {
  

  const factory SignInStatus.() = _SignInStatus;
  const factory SignInStatus.authenticated();
const factory SignInStatus.error();
const factory SignInStatus.accountLocked();
const factory SignInStatus.accountAnonymous();
const factory SignInStatus.accountWithoutProfil();
}