import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.$class,
  });

  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  JsonSerializable(
    this.name,
    Set<Field> fields,
  ) : fields = Fields(fields);

  final String name;
  final Fields fields;

  @override
  JsonSerializableMetaData build(BuildStep step) {
    final $class = Class(
      ($) => $
        ..annotations.add(refer(
          '@JsonSerializable',
          'package:json_annotation/json_annotation.dart',
        ))
        ..name = name
        ..constructors.addAll([
          Constructor(
            (c) => c
              ..optionalParameters.addAll(fields.toNamedParameters())
              ..constant = true,
          ),
          Constructor(
            (c) => c
              ..factory = true
              ..name = 'fromJson'
              ..requiredParameters.add(
                Parameter(
                  (p) => p
                    ..type = refer('Map<String, dynamic>')
                    ..name = 'json',
                ),
              )
              ..redirect = refer('_\${$name}FromJson(json)'),
          ),
        ])
        ..fields.addAll(
          fields.toFinal(),
        ),
    );

    return JsonSerializableMetaData(
      $class: $class,
    );
  }
}
