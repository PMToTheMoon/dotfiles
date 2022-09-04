import 'package:bonemeal/bonemeal.dart';

export 'json_field.dart';

class JsonSerializableMetaData {
  JsonSerializableMetaData({
    required this.file,
    required this.$class,
  });

  final String file;
  final Class $class;
}

class JsonSerializable extends MetaObject {
  //<JsonSerializableMetaData> {
  JsonSerializable(
    this.name,
    Set<Field> fields,
    this.methods = [],
  ) : fields = Fields(fields);

  final String name;
  final Fields fields;
  final List<Method> methods;

  @override
  String get path => '${name.snakeCase}.dart';

  @override
  // Future<JsonSerializableMetaData> build(BuildStep step) async {
  void build(BuildStep step) async {
    final className = name.pascalCase;
    final fileBase = name.snakeCase;

    final generatedFile = '$fileBase.g.dart';

    final $class = Class(
      ($) => $
        ..annotations.add(refer(
          'JsonSerializable()',
          'package:json_annotation/json_annotation.dart',
        ))
        ..name = className
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
              ..lambda = true
              ..body = refer('_\$${className}FromJson(json)').code,
          ),
        ])
        ..methods.add(
          Method(
            (m) => m
              ..returns = refer('Map<String, dynamic>')
              ..name = 'toJson'
              ..lambda = true
              ..body =
                  refer('_\$${className}ToJson').call([refer('this')]).code,
          ),
        )
        ..fields.addAll(
          fields.toFinal(),
        ),
    );

    final library = Library(
      ($) => $
        ..directives.add(
          Directive.part(generatedFile),
        )
        ..body.add($class),
    );

    final url = step.emit(library);

    // return JsonSerializableMetaData(
    //   file: file,
    //   $class: $class,
    // );
  }
}
