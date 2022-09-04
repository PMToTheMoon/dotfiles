import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.$class,
  });

  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  JsonSerializable({
    required Set<Field> fields,
  }) : fields = Fields(fields);

  final Fields fields;

  @override
  JsonSerializableMetaData build(BuildStep step) {
    final $class = Class(
      ($) => $
        ..constructors.add(
          Constructor(
            (c) => c..optionalParameters.addAll(fields.toNamedParameters()),
          ),
        ),
    );

    throw UnimplementedError();
  }
}
