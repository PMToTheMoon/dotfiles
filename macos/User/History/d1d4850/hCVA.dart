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

  Future<ConstructedMetaObject> construct(BuildContext context) async {
    if (value is String) {
      final id = AssetId.input(value);
      if (await context.canRead(id)) {
        return _constructFromFile(context, metaObject, id);
      }
    } else if (metaObject.isCorrectDataType(value)) {
      return metaObject.convertToDataType(value);
    }
    throw ArgumentError('$T MetaObjectSlot: unsupported value $value');
  }
}

class ConstructedMetaObject<T> {
  ConstructedMetaObject(
    this.context,
    this.object,
    this.data,
  );

  final BuildContext context;
  final MetaObject object;
  final T data;
}

Future<ConstructedMetaObject<T>> _constructFromFile<T>(
  BuildContext context,
  MetaObject<T> metaObject,
  AssetId id,
) async {
  final fileContent = await context.readAsString(id);
  final data = metaObject.dataFromFile(id.path, fileContent);
  final childContext = context.createChildContext(newRoot: id.path);
  return ConstructedMetaObject(childContext, metaObject, data);
}
