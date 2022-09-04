import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal_yaml/src/utils/utils.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:path/path.dart' as p;

class YamlMetaObjectSlot extends MetaObjectSlot {
  final MetaObjectSlot _impl;

  @override
  FutureOr<ConstructedMetaObject> construct(BuildContext context) =>
      _impl.construct(context);

  factory YamlMetaObjectSlot.fromJson(dynamic json) {
    // if (json is String) {
    //   return YamlMetaObjectSlot._path(json);
    if (json is Map) {
      final def = json.entries.first;
      final defValue = def.value;
      final defType = def.key;
      if (defValue is String) {
        return YamlMetaObjectSlot._path(defValue);
      } else if (defValue is Map) {
        return YamlMetaObjectSlot._inline(json);
      }
    }
    throw ArgumentError(
      'Yaml meta object: unsupported type ${json.runtimeType}',
    );
  }

  YamlMetaObjectSlot._path(
    String type,
    String path,
  ) : _impl = _YamlMetaObjectSlotPath(type, path);

  YamlMetaObjectSlot._inline(
    String type,
    Map data,
  ) : _impl = _YamlMetaObjectSlotInline(type, data);
}

class _YamlMetaObjectSlotPath implements MetaObjectSlot {
  _YamlMetaObjectSlotPath(this._type, this._path);

  final String _type;
  final String _path;

  @override
  Future<ConstructedMetaObject> construct(BuildContext context) async {
    if (p.equals(
      context.source.path,
      p.join(p.dirname(context.source.path), _path),
    )) {
      throw ArgumentError(
        'Meta-object slot from file [${context.source.path}]'
        ' redirect to same file [$_path].',
      );
    }
    final assetId = AssetId.input(_path);
    final fileContent = await context.readAsString(assetId);
    final metaObject = MetaObjectRegistry.get('yaml', _type) as YamlMetaObject;
    final metaObjectData = checkedYamlDecode(
      fileContent,
      (d) => metaObject.dataFactory(d!),
      sourceUrl: assetId.uri,
    );
    final childContext = context.createChildContext(newRoot: _path);
    return ConstructedMetaObject(childContext, metaObject, metaObjectData);
  }
}

class _YamlMetaObjectSlotInline implements MetaObjectSlot {
  _YamlMetaObjectSlotInline(this._type, this._data) {
    if (_data.isEmpty) {
      throw ArgumentError('Invalid YamlMetaObjectSlot definition $_data');
    }
  }

  final String _type;
  final Map _data;

  @override
  ConstructedMetaObject construct(BuildContext context) {
    final metaObject = MetaObjectRegistry.get('yaml', _type) as YamlMetaObject;
    final data = metaObject.dataFactory(_data);
    final childContext = context.createChildContext();
    return ConstructedMetaObject(childContext, metaObject, data);
  }
}
