import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_status.freezed.dart';

@freezed
class LogInStatus with _$LogInStatus {
  const factory LogInStatus.authenticated() = LogInStatusAuthenticated;
  const factory LogInStatus.error() = LogInStatusError;
  const factory LogInStatus.accountLocked() = LogInStatusAccountLocked;
  const factory LogInStatus.accountAnonymous() = LogInStatusAccountAnonymous;
  const factory LogInStatus.accountWithoutProfile() =
      LogInStatusAccountWithoutProfile;
}
