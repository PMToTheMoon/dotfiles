import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

class YamlMetaObject extends MetaObject<Map<dynamic, dynamic>> {
  YamlMetaObject(String key) : super('yaml', key);

  @override
  FutureOr<void> build(BuildContext context, Map<dynamic, dynamic> input) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
