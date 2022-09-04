import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectSlot<T extends MetaObject> {
  const MetaObjectSlot({
    this.metaObjectType,
    this.path,
    this.inlineDeclaration,
  });

  //indicate whatever the meta object is declared inline or in separated file
  bool get isInline => inlineDeclaration != null;

  final String metaObjectType;
  final String? path;
  final dynamic inlineDeclaration;

  T constructFromData(dynamic input);

  Future<T> construct(AssetReader reader) async {
    final object = MetaObjectRegistry.get(metaObjectType, T);
    if (object == null) throw ArgumentError('Meta-object $T isn\'t registered');
    if (inlineDeclaration != null) {
      return constructFromData(inlineDeclaration);
    } else if (path != null) {
      final fileContent = await reader.readAsString(AssetId.input(path!));
      return cp
    }
  }
}
