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
  void createElement() {}

  @override
  void write(BuildContext context) {
    context.visitChildren((element) {});
  }
}

class LibraryElement extends AssetElement<Library> {
  LibraryElement(super.metaObject);

  @override
  void mount(Element? parent) {}
}