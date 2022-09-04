import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form_data.freezed.dart';

@freezed
class SignInFormData with _$SignInFormData {
  const SignInFormData._();

  const factory SignInFormData({
    required String lastName,
    required String firstName,
    required String email,
    required String phoneNumber,
    required String password,
  }) = _SignInFormData;
}
