import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

TestMetaObject testMetaObjectFactory(MetaObjectOptions options) =>
    TestMetaObject();

class TestMetaObject extends MetaObject<Map<String, dynamic>> {
  TestMetaObject() : super('json') {}

  @override
  Map<String, dynamic> dataFrom(input) => input as Map<String, dynamic>;

  @override
  FutureOr<void> build(BuildContext context, Map<String, dynamic> data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
