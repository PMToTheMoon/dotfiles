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
        ..constructors.addAll([
          Constructor(
            (c) => c
              ..optionalParameters.addAll(fields.toNamedParameters())
              ..constant = true,
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..name = 'fromJson',
          ),
        ])
        ..fields.addAll(
          fields.toFinal(),
        ),
    );

    throw UnimplementedError();
  }
}
