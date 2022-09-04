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

  void mount(MetaObject? parent) {
    _parent = parent;
    visitChildren((child) {
      child.mount(this);
    });
  }

  void visitChildren(MetaObjectVisitor visitor) {}
}

/// A MetaObject that compose other meta object
/// Contrast with ?
class ComponentMetaObject extends MetaObject {
  ComponentMetaObject(this.child, {super.key});

  MetaObject? child;
}
