import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.$class,
  });

  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  JsonSerializable({
    required this.fields,
  });

  final Fields fields;

  @override
  JsonSerializableMetaData build(BuildStep step) {
    throw UnimplementedError();
  }
}
