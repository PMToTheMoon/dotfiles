part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const LoginEvent._();

  const factory LoginEvent.formSubmitted({
    required String email,
    required String password,
    required bool saveCredentials,
  }) = LoginFormSubmitted;

  const factory LoginEvent.saveCredentialsChanged({
    required bool saveCredentials,
  }) = LoginSaveCredentialsChanged;
}
