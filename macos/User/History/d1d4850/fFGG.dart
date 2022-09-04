import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectSlot<T extends MetaObject> {
  MetaObjectSlot(
    String metaObjectType, {
    required this.value,
  })  : assert(value != null),
        metaObject = MetaObjectRegistry.get(metaObjectType, T);

  final dynamic value;

  final MetaObject metaObject;

  Future<Object> constructData(AssetReader reader) async {
    if (value is String) {
      final id = AssetId.input(value);
      if (await reader.canRead(id)) {
        final fileContent = await reader.readAsString(AssetId.input(path!));
        return metaObject.dataFromFile(value, fileContent);
      }
    }

    if (metaObject.isCorrectDataType(inlineDeclaration)) {
      return metaObject.convertToDataType(inlineDeclaration);
    } else {
      final fileContent = await reader.readAsString(AssetId.input(path!));
      return metaObject.dataFromFile(path!, fileContent);
    }
  }
}
