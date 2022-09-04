import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';

TestMetaObject testMetaObjectFactory(MetaObjectOptions options) =>
    TestMetaObject();

class TestMetaObject extends YamlMetaObject<String> {
  @override
  String get key => 'test_meta_object';

  @override
  String dataFactory(Map input) => input;

  @override
  FutureOr<void> build(BuildContext context, Map<dynamic, dynamic> data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
