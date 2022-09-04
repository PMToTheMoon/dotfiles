import 'package:meta/meta.dart';

import 'key.dart';

abstract class MetaObject {
  MetaObject({this.key});

  Element createElement();

  final Key? key;
}

typedef ElementVisitor = void Function(Element element);

abstract class Element<T extends MetaObject> {
  Element(this.metaObject);

  Element? _parent;

  final T metaObject;

  @mustCallSuper
  void mount(Element? parent) {
    _parent = parent;
  }

  void visitChildren(ElementVisitor visitor) {}
}
