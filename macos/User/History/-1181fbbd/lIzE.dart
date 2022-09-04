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
  Dependencies? dependsOn,
  PartOf? partOf,
  String? root,
});

class Model extends MetaObject<ModelMetaData> {
  const Model({
    required this.className,
    required this.fields,
    super.root,
    this.dependsOn,
    this.partOf,
  });

  final String className;

  final Fields fields;

  final Dependencies? dependsOn;

  final PartOf? partOf;

  @override
  FutureOr<ModelMetaData> build(
    BuildStep context,
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
    final ids = await context.writeShared(
      file,
      renderCode(library),
      Dependencies([
        if (partOf != null) partOf!,
      ]),
    );

    return ModelMetaData(model: model);
  }
}
