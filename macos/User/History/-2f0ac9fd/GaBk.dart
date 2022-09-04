import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

TestMetaObject testMetaObjectFactory(MetaObjectOptions options) =>
    TestMetaObject();

class TestMetaObject extends MetaObject<Map<String, dynamic>> {
  const TestMetaObject() : super('json');

  @override
  FutureOr<void> build(BuildContext context, data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
