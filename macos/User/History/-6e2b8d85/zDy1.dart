import 'package:bonemeal/bonemeal.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.$class,
  });

  final String file;
  final Class $class;
}

class JsonSerializable extends MetaObject<JsonSerializableMetaData> {
  JsonSerializable(
    this.name,
    Set<Field> fields, {
    super.root,
  }) : fields = Fields(fields);

  final String name;
  final Fields fields;

  @override
  Future<JsonSerializableMetaData> build(BuildStep step) async {
    final fileBase = name.snakeCase;
    final file = '$fileBase.dart';
    final generatedFile = '$fileBase.g.dart';

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

    final library = Library(
      ($) => $
        ..directives.add(
          Directive.partOf(generatedFile),
        )
        ..body.add($class),
    );

    final content = library.accept(step.emitter).toString();
    await step.write(file, content);

    return JsonSerializableMetaData(
      $class: $class,
    );
  }
}
