part of 'api.dart';

Future<String> login({
  required String email,
  required String password,
}) async {
  try {
    final url = Uri.http(authority, "/endpoint");
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    final decoded = jsonDecode(response.body) as Map;
    final String? token = decoded["token"];
    if (token == null) throw Unauthorized();
    return token;
  } on FormatException catch (_) {
    throw UnexpectedResponse();
  } on http.ClientException catch (e) {
    throw e.toDomain();
  }
}
