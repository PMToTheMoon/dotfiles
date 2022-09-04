import 'framework.dart';
import 'package:code_builder/code_builder.dart' as cb;

typedef MetaObjectVisitor = void Function(MetaObject object);

abstract class BuildStep {
  MetaObject ancestorOfType<T extends MetaObject>();

  MetaObject visitChildren(MetaObjectVisitor visitor);

  void emit(cb.Library library);
}

class DartProject extends Seed {
  DartProject({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Library extends MetaObject {
  const Library({
    required this.name,
    super.key,
    this.children = const [],
  });

  final String name;
  final List<MetaObject> children;

  @override
  Element createElement() => LibraryElement(this);

  @override
  cb.Library build(BuildStep step) {
    return cb.Library(
      ($) => $
        ..name = name
        ..body.addAll([]),
    );
  }
}

class LibraryElement extends Element<Library> {
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
    metaObject.build(this);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    for (final child in _children) {
      visitor.call(child);
    }
  }
}
