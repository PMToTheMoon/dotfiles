import 'dart:convert';

import 'package:http/http.dart' as http;

part 'login.dart';
part 'api.freezed.dart';

final authority = String.fromEnvironment("urlKey");

class UnexpectedResponse implements Exception {}

class ClientException implements Exception {}
