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
  
  const factory SignInStatus.authenticated() = SignInStatusAuthenticated;
const factory SignInStatus.error() = SignInStatusError;
const factory SignInStatus.accountLocked() = SignInStatusAccountLocked;
const factory SignInStatus.accountAnonymous() = SignInStatusAccountAnonymous;
const factory SignInStatus.accountWithoutProfil() = SignInStatusAccountWithoutProfile;
}