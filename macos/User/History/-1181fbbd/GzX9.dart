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

class Model extends MetaObject<ModelMetaData> {
  const Model({
    super.root,
    required this.type,
    this.import,
    this.fields,
    this.partOf,
  });

  final String type;
  final String? import;
  final Map<String, dynamic>? fields;
  final PartOf? partOf;

  ModelMetaData toMetaData() => const ModelMetaData(generated: null);

  @override
  FutureOr<ModelMetaData> build(
    BuildStep context,
  ) async {
    if (fields != null) {
      final classes = generateModels(type, fields!);
      final library = Library((l) => l..body.addAll(classes));

      final ids = await context.writeShared(
        '${type.snakeCase}.dart',
        renderCode(library),
        Dependencies([
          if (partOf != null) partOf!,
        ]),
      );

      return ModelMetaData(
        generated: ids,
      );
    } else {
      return toMetaData();
    }
  }
}
