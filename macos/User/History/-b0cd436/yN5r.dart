import 'package:bonemeal/bonemeal.dart';

class ModelMetaData {
  const ModelMetaData({
    required this.model,
    required this.fileName,
  });

  final Class model;
  final String fileName;
}

class Model extends MetaObject {
  Model({
    required this.className,
    required Set<Field> fields,
    this.hooks = const [],
  }) : fields = Fields(fields);

  final String className;
  final Fields fields;
  final List<Hook> hooks;

  @override
  void build(
    BuildStep step,
  ) async {
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
    final file = '${className.snakeCase}.dart';
    step.emit(file, library);

    // return ModelMetaData(
    //   model: model,
    //   fileName: file,
    // );
  }

  @override
  Fragment createFragment() {
    return Fragment('${className.snakeCase}.dart', (step) {
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
      final file = '${className.snakeCase}.dart';
      step.emit(file, library);
    });
  }
}
