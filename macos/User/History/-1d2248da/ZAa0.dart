part of 'api.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const LoginResponse._();

  @JsonSerializable()
  const factory LoginResponse.success({required String token}) = LoginSuccess;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

// Future<String> login({
//   required String email,
//   required String password,
// }) async {
//   try {
//     final url = Uri.http(authority, "/endpoint");
//     final response = await http.post(url, body: {
//       'email': email,
//       'password': password,
//     });
//     final decoded = jsonDecode(response.body) as Map;
//     final String? token = decoded["token"];
//     if (token == null) throw Unauthorized();
//     return token;
//   } on FormatException catch (_) {
//     throw UnexpectedResponse();
//   } on http.ClientException catch (e) {
//     throw ClientException();
//   }
// }
