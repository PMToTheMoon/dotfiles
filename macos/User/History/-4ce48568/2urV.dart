import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_status.freezed.dart';

@freezed
class SignInStatus with _$SignInStatus {
  const factory SignInStatus.authenticated() = SignInStatusAuthenticated;
  const factory SignInStatus.error() = SignInStatusError;
  const factory SignInStatus.accountLocked() = SignInStatusAccountLocked;
  const factory SignInStatus.accountAnonymous() = SignInStatusAccountAnonymous;
  const factory SignInStatus.accountWithoutProfile() =
      SignInStatusAccountWithoutProfile;
}
