import 'package:chopper/chopper.dart';
import 'package:tbt_api/src/constant.dart';

import 'json_converter.dart';

class TbtPublicClient {
  static final TbtPublicClient _instance = TbtPublicClient._();

  factory TbtPublicClient() => _instance;

  TbtPublicClient._()
      : _client = ChopperClient(
          baseUrl: baseUrl,
          converter: jsonConverter,
          services: [],
        );

  final ChopperClient _client;
}
