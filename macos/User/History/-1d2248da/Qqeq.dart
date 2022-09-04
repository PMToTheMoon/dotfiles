part of 'api.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const LoginResponse._();

  const factory LoginResponse.success({required String token}) = LoginSuccess;
  const factory LoginResponse.invalidCredentials() = LoginInvalidCredentials;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

Future<LoginResponse> login({
  required String email,
  required String password,
}) async {
  try {
    final url = Uri.http(authority, "/endpoint");
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    final decoded = LoginResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
    return decoded;
  } on FormatException catch (_) {
    throw UnexpectedResponse();
  } on http.ClientException catch (e) {
    throw ClientException();
  }
}
