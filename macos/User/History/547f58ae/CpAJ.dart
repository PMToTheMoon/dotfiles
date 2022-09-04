import 'package:meta/meta.dart';

final _keyRegistry = <Key, MetaObject>{};

class Key<T extends MetaObject> {
  Key(T owner) {
    _keyRegistry[this] = owner;
  }

  MetaObject get metaObject {
    assert(() {
      if (_keyRegistry[this] == null) {
        throw 'Invalid use of unregistered key';
      }
      return true;
    }());
    return _keyRegistry[this]!;
  }
}

typedef MetaObjectVisitor = void Function(MetaObject);

abstract class MetaObject {
  MetaObject({this.key});

  final Key? key;

  MetaObject? _parent;

  MetaObject? findAncestorOfType<T>() {
    MetaObject? ancestor = _parent;
    while (ancestor is! T && ancestor != null) {
      ancestor = ancestor._parent;
    }
    return ancestor;
  }

  /// Implementations should starts with a call to super
  @mustCallSuper
  void mount(MetaObject? parent) {
    _parent = parent;
  }

  void visitChildren(MetaObjectVisitor visitor) {}
}

/// A MetaObject that compose other meta object
/// Contrast with ?
abstract class ComponentMetaObject extends MetaObject {
  ComponentMetaObject({super.key});

  MetaObject? _child;

  @override
  void mount(MetaObject? parent) {
    super.mount(parent);
    _child = build();
    _child!.mount(this);
  }

  MetaObject build();

  @override
  void visitChildren(MetaObjectVisitor visitor) {
    assert(() {
      if (_child == null) {
        throw 'Trying to visit an unmounted MetaObject';
      }
      return true;
    }());
    visitor.call(_child!);
  }
}

/// A MetaObject that compose other meta object
/// Contrast with ?
abstract class MultiChildMetaObject extends MetaObject {
  MultiChildMetaObject({super.key});

  List<MetaObject>? _children;

  @override
  void mount(MetaObject? parent) {
    super.mount(parent);
    _child = build();
    _child!.mount(this);
  }

  MetaObject build();

  @override
  void visitChildren(MetaObjectVisitor visitor) {
    assert(() {
      if (_child == null) {
        throw 'Trying to visit an unmounted MetaObject';
      }
      return true;
    }());
    visitor.call(_child!);
  }
}
