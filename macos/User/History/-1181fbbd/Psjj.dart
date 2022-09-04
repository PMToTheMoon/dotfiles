import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

class ModelMetaData {
  const ModelMetaData({
    required this.model,
  });

  final Class model;
}

typedef ModelGeneratorFactory = Model Function({
  required String className,
  required Fields fields,
  String? root,
});

class Model extends MetaObject<ModelMetaData> {
  const Model({
    required this.className,
    required this.fields,
    super.root,
  });

  final String className;

  final Fields fields;

  @override
  FutureOr<ModelMetaData> build(
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
        ..fields.addAll(fields),
    );
    final library = Library((l) => l..body.add(model));
    final file = '${className.snakeCase}.dart';
    await step.write(
      file,
      library.accept(step.emitter).toString(),
    );

    return ModelMetaData(model: model);
  }
}
