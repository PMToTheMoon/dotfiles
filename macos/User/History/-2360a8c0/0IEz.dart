import 'framework.dart';

class Workspace extends Seed {
  Workspace({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Directory extends Fragment {
  @override
  Element<MetaObject> createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}

class DirectoryElement extends FragmentElement<Directory> {
  DirectoryElement(super.metaObject);

  @override
  void write() {}
}

class Directory extends MultiChildAsset {
  Directory({required super.name, super.key});
}

/// An element witch handle concrete operation
abstract class FileElement<T extends File> extends Element<T> {
  FileElement(super.metaObject);

  void write();
}
