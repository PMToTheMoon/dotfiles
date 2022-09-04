import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal_yaml/src/utils/utils.dart';
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
      return YamlMetaObjectSlot._inline(json);
    }
    throw ArgumentError(
      'Yaml meta object: unsupported type ${json.runtimeType}',
    );
  }

  YamlMetaObjectSlot._path(
    String path,
  ) : _impl = _YamlMetaObjectSlotPath(path);

  YamlMetaObjectSlot._inline(
    Map definition,
  ) : _impl = _YamlMetaObjectSlotInline(definition);
}

class _YamlMetaObjectSlotPath implements MetaObjectSlot {
  _YamlMetaObjectSlotPath(this.path);

  final String path;

  @override
  Future<ConstructedMetaObject> construct(BuildContext context) async {
    if (p.equals(
      context.source.path,
      p.join(p.dirname(context.source.path), path),
    )) {
      throw ArgumentError(
        'Meta-object slot from file [${context.source.path}]'
        ' redirect to same file [$path].',
      );
    }
    final assetId = AssetId.input(path);
    final fileContent = await context.readAsString(assetId);
    final yamlWithHeader =
        loadYamlWithHeader(fileContent, sourceUrl: Uri.parse(path));
    final metaObject =
        MetaObjectRegistry.get('yaml', yamlWithHeader.header.type)
            as YamlMetaObject;
    final data = metaObject.dataFactory(yamlWithHeader.body);
    final childContext = context.createChildContext(newRoot: path);
    return ConstructedMetaObject(childContext, metaObject, data);
  }
}

class _YamlMetaObjectSlotInline implements MetaObjectSlot {
  _YamlMetaObjectSlotInline(this._definition) {
    if (_definition.isEmpty) {
      throw ArgumentError('Invalid YamlMetaObjectSlot definition $_definition');
    }
  }

  final Map _definition;

  @override
  ConstructedMetaObject construct(BuildContext context) {
    final def = _definition.entries.first;
    final type = def.key;
    final metaObject = MetaObjectRegistry.get('yaml', type) as YamlMetaObject;
    final data = metaObject.dataFactory(def.value);
    final childContext = context.createChildContext();
    return ConstructedMetaObject(childContext, metaObject, data);
  }
}
