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
