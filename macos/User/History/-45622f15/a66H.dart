import 'package:meta/meta.dart';

import 'key.dart';

abstract class MetaObject {
  const MetaObject({this.key});

  Element createElement();

  final Key? key;
}

typedef ElementVisitor = void Function(Element element);

abstract class Element<T extends MetaObject> {
  Element(this.metaObject);

  Element? _parent;

  final T metaObject;

  /// Implementations of this method should starts with a call to the
  /// inherited method as in super.mount(parent)
  @mustCallSuper
  void mount(Element? parent) {
    _parent = parent;
  }

  @protected
  Element inflateMetaObject(MetaObject newMetaObject) {
    final newChild = newMetaObject.createElement();
    newChild.mount(this);
    return newChild;
  }

  void visitChildren(ElementVisitor visitor) {}
}

abstract class ComponentElement extends Element {
  ComponentElement(super.metaObject);

  Element? child;

  @protected
  MetaObject build();

  void visitChildren(ElementVisitor visitor) {
    if (child != null) {
      visitor(child);
    }
  }
}

abstract class MultiChildMetaObject extends MetaObject {
  const MultiChildMetaObject(this.children);

  final List<MetaObject> children;
}

abstract class MultiChildElement<T extends MultiChildMetaObject>
    extends Element<T> {
  MultiChildElement(super.metaObject) : _children = const [];

  List<Element> _children;

  @override
  void mount(Element? parent) {
    super.mount(parent);
    _children = [
      for (final child in metaObject.children) child.createElement()
    ];
    for (final child in _children) {
      child.mount(this);
    }
  }

  void visitChildren(ElementVisitor visitor) {
    for (final child in _children) {
      visitor(child);
    }
  }
}
