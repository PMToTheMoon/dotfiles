import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.freezed.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const SignInRequest._();

  const factory SignInRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
    required String code,
    required String codeHash,
  }) = _SignInRequest;

  SignInRequest trim() => copyWith(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        email: email.trim(),
        phoneNumber: phoneNumber.trim(),
        password: password.trim(),
      );
}
