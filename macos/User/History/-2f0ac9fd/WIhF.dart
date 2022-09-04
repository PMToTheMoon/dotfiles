import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

class TestMetaObject extends MetaObject<Map<String, dynamic>> {
  TestMetaObject() : super('test');

  @override
  FutureOr<void> build(BuildContext context, data) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
