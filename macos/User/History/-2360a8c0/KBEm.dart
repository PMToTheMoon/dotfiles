import 'package:bonemeal/src/workspace/asset.dart';

import 'framework.dart';

class DartProject extends Seed {
  DartProject({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Library extends Asset {
  const Library({
    required super.name,
    super.key,
    this.children = const [],
  });

  final List<MetaObject> children;

  @override
  Element createElement() => LibraryElement(this);

  @override
  void write(Writter step) {
    step.visitChildren((element) {});
  }
}

class LibraryElement extends AssetElement<Library> {
  LibraryElement(super.metaObject);

  late List<Element> _children;

  @override
  void mount(Element? parent) {
    super.mount(parent);
    _children = [
      for (final child in metaObject.children) child.createElement(),
    ];
    for (final child in _children) {
      child.mount(this);
    }
  }

  @override
  void write() {
    metaObject.write(this);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    for (final child in _children) {
      visitor.call(child);
    }
  }
}
