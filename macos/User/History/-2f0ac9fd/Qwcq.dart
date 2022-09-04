import 'dart:async';
import 'dart:convert';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_yaml/bonemeal_yaml.dart';

TestMetaObject testMetaObjectFactory(MetaObjectOptions options) =>
    TestMetaObject();

class TestMetaObject extends YamlMetaObject<Map<String, dynamic>> {
  @override
  String get key => 'test_meta_object';

  @override
  FutureOr<void> build(BuildContext context, Map<String, dynamic> data) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> dataFromYaml(Map input) {
    // TODO: implement dataFromYaml
    throw UnimplementedError();
  }
}
