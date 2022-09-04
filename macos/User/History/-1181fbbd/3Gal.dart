import 'dart:async';

import 'package:bonemeal/bonemeal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model_generators/src/model_data.dart';

part 'model.g.dart';

@JsonSerializable()
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
  final PartDependency? partOf;

  ModelBuildMetaData toMetaData() => const ModelBuildMetaData(generated: null);

  factory ModelData.fromJson(Map json) => _$ModelDataFromJson(json);
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
          context.input.partOf!,
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
