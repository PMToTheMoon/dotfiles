import 'package:bonemeal/bonemeal.dart';

class ModelMetaData {
  const ModelMetaData({
    required this.model,
    required this.fileName,
  });

  final Class model;
  final String fileName;
}

typedef ModelGeneratorFactory = Model Function({
  required String className,
  required Fields fields,
  String? root,
});

class Model extends MetaObject {
  const Model({
    required this.className,
    required this.fields,
    this.hooks = const [],
  });

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
        ..methods.addAll(hooks),
    );
    final library = Library((l) => l..body.add(model));
    final file = '${className.snakeCase}.dart';
    step.emit(file, library);

    // return ModelMetaData(
    //   model: model,
    //   fileName: file,
    // );
  }
}
