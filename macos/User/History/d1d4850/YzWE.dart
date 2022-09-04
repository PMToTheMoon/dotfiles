import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectSlot<T extends MetaObject> {
  MetaObjectSlot(
    String metaObjectType,
    this.value,
  )   : assert(value != null),
        metaObject = MetaObjectRegistry.get(metaObjectType, T);

  final dynamic value;

  final MetaObject metaObject;

  Future<Object> construct(AssetReader reader) async {
    if (value is String) {
      final id = AssetId.input(value);
      if (await reader.canRead(id)) {
        final fileContent = await reader.readAsString(id);
        return metaObject.dataFromFile(id.path, fileContent);
      }
    } else if (metaObject.isCorrectDataType(value)) {
      return metaObject.convertToDataType(value);
    }
    throw ArgumentError('$T MetaObjectSlot: unsupported value $value');
  }
}

class ConstructedMetaObject {}
