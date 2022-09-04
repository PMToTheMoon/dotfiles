import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

import 'model_data.dart';

class ModelData {
  const ModelData({
    required this.type,
    this.import,
    this.fields,
    this.partOf,
  });

  final String type;
  final String? import;
  final Map<String, dynamic>? fields;
  final PartOf? partOf;

  ModelBuildMetaData toMetaData() => const ModelBuildMetaData(generated: null);
}

class ModelBuildMetaData {
  const ModelBuildMetaData({
    required this.generated,
  });

  // final String type;
  final SharedAssetId? generated;
}

class Model extends MetaObject<ModelData, ModelBuildMetaData> {
  const Model({super.root});

  @override
  FutureOr<ModelBuildMetaData> build(
    BuildStep<ModelData> context,
  ) async {
    final fields = context.input.fields;

    if (fields != null) {
      final classes = generateModels(context.input.type, fields);
      final library = Library((l) => l..body.addAll(classes));

      final ids = await context.writeShared(
        '${context.input.type.snakeCase}.dart',
        renderCode(library),
        [
          if (context.input.partOf != null) context.input.partOf!,
        ],
      );

      return ModelBuildMetaData(
        generated: ids,
      );
    } else {
      return context.input.toMetaData();
    }
  }
}
