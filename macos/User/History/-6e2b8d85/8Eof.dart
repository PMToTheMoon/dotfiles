import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.$class,
  });

  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  @override
  JsonSerializableMetaData build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
