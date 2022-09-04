import 'package:http/http.dart' as http;

final authority = String.fromEnvironment("urlKey");

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
    response.statusCode;
    response.body;

    final String? token = res.data?["token"];
    if (token == null) throw Unauthorized();
    return token;
  } on DioError catch (e) {
    throw e.toDomain();
  }
}
