import 'package:bonemeal_core/bonemeal_core.dart';

abstract class MetaObjectSlot<T extends MetaObject> {
  const MetaObjectSlot({
    this.path,
    this.inlineDeclaration,
  });

  //indicate whatever the meta object is declared inline or in separated file
  bool get isInline => inlineDeclaration != null;

  final String? path;
  final dynamic inlineDeclaration;

  T constructFromFile(AssetReader reader);

  T constructFromData(dynamic input);

  T contruct(AssetReader reader) {
    if (isInline) {
      return constructFromData(inlineDeclaration);
    } else {}
  }
}
