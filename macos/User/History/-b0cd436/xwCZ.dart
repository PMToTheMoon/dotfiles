import 'package:bonemeal/bonemeal.dart';

class ModelMetaData {
  const ModelMetaData({
    required this.$class,
    required this.reference,
  });

  final Class $class;
  final Reference reference;
}

class Model extends MetaObject<ModelMetaData> {
  Model({
    required this.className,
    required Set<Field> fields,
    this.hooks = const [],
  }) : fields = Fields(fields);

  final String className;
  final Fields fields;
  final List<Hook> hooks;

  @override
  String get path => '${className.snakeCase}.dart';

  @override
  ModelMetaData build(
    BuildStep step,
  ) {
    final model = Class(
      (c) => c
        ..name = className.pascalCase
        ..constructors.add(
          Constructor(
            (ctr) => ctr
              ..optionalParameters.addAll(fields.toNamedParameters())
              ..constant = true,
          ),
        )
        ..fields.addAll(fields)
        ..methods.addAll(hooks.map((h) => h.method)),
    );
    final library = Library((l) => l..body.add(model));
    final url = step.emit(library);

    return ModelMetaData(
      model: model,
      fileName: file,
    );
  }
}
