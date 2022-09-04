import 'package:bonemeal_core/bonemeal_core.dart';

class MetaObjectSlot<T extends MetaObject> {
  const MetaObjectSlot({
    this.path,
    this.inlineDeclaration,
  });

  //indicate whatever the meta object is declared inline or in separated file
  bool get inline => inlineDeclaration != null;

  final String? path;
  final String? inlineDeclaration;
}
