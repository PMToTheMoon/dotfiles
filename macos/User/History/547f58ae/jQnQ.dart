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

  T? ancestorOrNull<T extends MetaObject>() {
    MetaObject? ancestor = _parent;
    while (ancestor is! T && ancestor != null) {
      ancestor = ancestor._parent;
    }
    return ancestor as T?;
  }

  T ancestor<T extends MetaObject>() {
    final ancestor = ancestorOrNull<T>();
    assert(() {
      if (ancestor == null) {
        throw 'MetaObject $runtimeType depends on unreferenced ancestor of type $T';
      }
      return true;
    }());
    return ancestor!;
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
abstract class Seed extends MetaObject {
  Seed({super.key});

  late final MetaObject _child;

  @override
  void mount(MetaObject? parent) {
    super.mount(parent);
    _child = build();
    _child.mount(this);
  }

  MetaObject build();

  @override
  void visitChildren(MetaObjectVisitor visitor) {
    visitor.call(_child);
  }
}

/// A MetaObject that compose other meta object
/// Contrast with ?
abstract class MultiChildMetaObject extends MetaObject {
  MultiChildMetaObject(this._children, {super.key});

  final List<MetaObject> _children;

  @override
  void mount(MetaObject? parent) {
    super.mount(parent);

    for (final child in _children) {
      child.mount(this);
    }
  }

  @override
  void visitChildren(MetaObjectVisitor visitor) {
    for (final child in _children) {
      visitor.call(child);
    }
  }
}
