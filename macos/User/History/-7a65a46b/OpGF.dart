import 'dart:convert';

import 'package:http/http.dart' as http;

part 'login.dart';

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
    final decoded = jsonDecode(response.body) as Map;
    final String? token = decoded["token"];
    if (token == null) throw Unauthorized();
    return token;
  } on FormatException catch(e) {
    throw e.message
  } on DioError catch (e) {
    throw e.toDomain();
  }
}
