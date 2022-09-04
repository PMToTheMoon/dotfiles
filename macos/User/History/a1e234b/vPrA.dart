import 'framework.dart';

abstract class WriteContext {
  void visitChildren(ElementVisitor visitor);
}

abstract class Asset extends MetaObject {
  const Asset({required this.name, super.key});

  final String name;

  @override
  Element createElement() => AssetElement(this);

  void write();
}

class AssetElement<T extends Asset> extends Element<T> {
  AssetElement(super.metaObject);

  void write() {
    metaObject.write();
  }
}

abstract class Path extends MetaObject {
  const Path({
    required this.path,
    this.children = const [],
  });

  final String path;
  final List<MetaObject> children;
}

abstract class PathElement<T extends Path> extends Element<T> {
  PathElement(super.metaObject);

  late List<Element> _children;

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

  @override
  void visitChildren(ElementVisitor visitor) {
    for (final child in _children) {
      visitor(child);
    }
  }
}
