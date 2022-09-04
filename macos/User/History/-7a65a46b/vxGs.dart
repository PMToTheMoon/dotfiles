import 'dart:convert';

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
    final String? token = response.body;
    response.body;
    jsonDecode(source)

    final String? token = res.data?["token"];
    if (token == null) throw Unauthorized();
    return token;
  }on FormatException catch(e) {
  } on DioError catch (e) {
    throw e.toDomain();
  }
}
