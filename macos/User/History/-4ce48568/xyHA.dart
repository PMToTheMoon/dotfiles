import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_status.freezed.dart';

@freezed
class LognInStatus with _$SignInStatus {
  const factory LognInStatus.authenticated() = SignInStatusAuthenticated;
  const factory LognInStatus.error() = SignInStatusError;
  const factory LognInStatus.accountLocked() = SignInStatusAccountLocked;
  const factory LognInStatus.accountAnonymous() = SignInStatusAccountAnonymous;
  const factory LognInStatus.accountWithoutProfile() =
      SignInStatusAccountWithoutProfile;
}
