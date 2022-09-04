import 'key.dart';

abstract class MetaObject {
  MetaObject({this.key});

  final Key? key;
}

typedef ElementVisitor = void Function(Element element);

abstract class Element {
  Element? parent;

  void visitChildren(ElementVisitor visitor) {}
}
