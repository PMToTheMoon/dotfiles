import 'package:http/http.dart' as http;

var baseUrl = Uri.parse('https://api.com/');

print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.parse('https://example.com/foobar.txt')));

class ApiClient {
    Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      url.
      var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
      final res = await _client.post<Map<String, dynamic>>("/login", data: {
        "login": email,
        "password": password,
      });
      final String? token = res.data?["token"];
      if (token == null) throw Unauthorized();
      return token;
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }
}