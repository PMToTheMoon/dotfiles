import 'framework.dart';

class Workspace extends Seed {
  Workspace({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Directory extends MultiChildAsset {
  Directory({
    required super.name,
    super.key,
    super.children,
  });

  @override
  void write() {
    // TODO: implement write
  }
}

/// An element witch handle concrete operation
abstract class FileElement<T extends File> extends Element<T> {
  FileElement(super.metaObject);

  void write();
}
