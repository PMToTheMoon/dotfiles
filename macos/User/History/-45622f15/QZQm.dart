import 'key.dart';

abstract class MetaObject {
  MetaObject({this.key});

  Element createElement();

  final Key? key;
}

typedef ElementVisitor = void Function(Element element);

abstract class Element<T extends MetaObject> {
  Element(this.metaObject);

  Element? parent;

  final T metaObject;

  void visitChildren(ElementVisitor visitor) {}
}
