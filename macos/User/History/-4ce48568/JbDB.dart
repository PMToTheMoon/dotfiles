import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_status.freezed.dart';

@freezed
class SignInStatus with _$SignInStatus {
  const SignInStatus.authenticated() = SignInStatusAuthenticated;
  const SignInStatus.error() = SignInStatusError;
  const SignInStatus.accountLocked() = SignInStatusAccountLocked;
  const SignInStatus.accountAnonymous() = SignInStatusAccountAnonymous;
  const SignInStatus.accountWithoutProfile() =
      SignInStatusAccountWithoutProfile;
}
