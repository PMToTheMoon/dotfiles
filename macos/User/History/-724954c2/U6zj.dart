part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const LoginEvent._();

  const factory LoginEvent.formSubmitted({
    required String email,
    required String password,
  }) = LoginFormSubmitted;

  const factory LoginEvent.saveCredentialsChanged({
    required bool saveCredentials,
  }) = LoginSaveCredentialsChanged;
}
