import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_request.freezed.dart';
part 'sign_in_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const SignInRequest._();

  const factory SignInRequest({
    @JsonKey(name: "firstname") required String firstName,
    @JsonKey(name: "lastname") required String lastName,
    @JsonKey(name: "mobilea") required String phoneNumber,
    required String email,
    required String password,
    required String code,
    @JsonKey(name: "hash") required String codeHash,
  }) = _SignInRequest;

  SignInRequest.fromJson(Map<String, dynamic> json) = _$SignInRequestFromJson;
}
