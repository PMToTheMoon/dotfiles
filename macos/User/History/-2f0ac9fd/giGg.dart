import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';

TestMetaObject testMetaObjectFactory(MetaObjectOptions options) =>
    TestMetaObject();

class TestMetaObject extends MetaObject<Map<String, dynamic>> {
  TestMetaObject() : super('json') {}

  @override
  FutureOr<void> build(BuildContext context, Map<String, dynamic> data) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> dataFromFile(String path, String content) =>
      jsonDecode(content);

  @override
  String get key => 'test_generator';
}
