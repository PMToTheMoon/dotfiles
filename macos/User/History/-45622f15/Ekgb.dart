import 'key.dart';

abstract class MetaObject {
  MetaObject({this.key});

  final Key? key;
}

typedef ElementVisitor = void Function(Element element);

abstract class Element {
  Element(MetaObject metaObject) : _metaObject = metaObject;

  Element? parent;

  final MetaObject _metaObject;

  void visitChildren(ElementVisitor visitor) {}
}
