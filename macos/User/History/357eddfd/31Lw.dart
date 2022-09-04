import 'package:meta/meta.dart';

final _keyRegistry = <Key, Element>{};

class Key {
  Key(this.id);

  final String id;

  @override
  bool operator ==(Object other) => other is Key && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

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

  void visitChildren(ElementVisitor visitor) {}
}

abstract class ComponentElement<T extends MetaObject> extends Element<T> {
  ComponentElement(super.metaObject);

  late Element _child;

  MetaObject build();

  @override
  void mount(Element? parent) {
    super.mount(parent);
    _parent = parent;
    _child = build().createElement();
    _child.mount(this);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    visitor.call(_child);
  }
}

abstract class Seed extends MetaObject {
  Seed({super.key});

  @override
  Element<MetaObject> createElement() {
    return SeedElement(this);
  }

  MetaObject build();
}

class SeedElement extends ComponentElement<Seed> {
  SeedElement(super.metaObject);

  @override
  MetaObject build() {
    return metaObject.build();
  }
}
