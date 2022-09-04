import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

import 'model_data.dart';

class ModelMetaData {
  const ModelMetaData({
    required this.generated,
  });

  // final String type;
  final SharedAssetId? generated;
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

  final Fields? fields;

  final Dependencies? dependsOn;

  final PartOf? partOf;

  ModelMetaData toMetaData() => const ModelMetaData(generated: null);

  @override
  FutureOr<ModelMetaData> build(
    BuildStep context,
  ) async {
    final classes = generateModels(className, fields!);
    final library = Library((l) => l..body.addAll(classes));

    final ids = await context.writeShared(
      '${className.snakeCase}.dart',
      renderCode(library),
      Dependencies([
        if (partOf != null) partOf!,
      ]),
    );

    return ModelMetaData(
      generated: ids,
    );
  }
}
