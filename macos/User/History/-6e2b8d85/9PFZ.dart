import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.refer,
    required this.$class,
  });

  final Reference refer;
  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  @override
  JsonSerializableMetaData build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
