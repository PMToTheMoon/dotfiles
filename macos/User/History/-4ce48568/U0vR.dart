import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_status.freezed.dart';

@freezed
class LogInStatus with _$SignInStatus {
  const factory LogInStatus.authenticated() = SignInStatusAuthenticated;
  const factory LogInStatus.error() = SignInStatusError;
  const factory LogInStatus.accountLocked() = SignInStatusAccountLocked;
  const factory LogInStatus.accountAnonymous() = SignInStatusAccountAnonymous;
  const factory LogInStatus.accountWithoutProfile() =
      SignInStatusAccountWithoutProfile;
}
