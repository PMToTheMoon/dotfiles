import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.freezed.dart';
part 'sign_in_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const SignInRequest._();

  const factory SignInRequest({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String password,
    required String code,
    required String codeHash,
  }) = _SignInRequest;
}
