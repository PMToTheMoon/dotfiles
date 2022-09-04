import 'package:bonemeal/src/workspace/framework.dart';

class Workspace extends Seed {
  Workspace({super.key});

  @override
  MetaObject build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Directory extends MetaObject {
  @override
  Element<MetaObject> createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}

class DirectoryElement extends Fragment<Directory> {
  DirectoryElement(super.metaObject);

  @override
  void write() {
    // TODO: implement write
  }
}

class File extends MetaObject {
  @override
  Element<MetaObject> createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}

abstract class FileELement extends Fragment<File> {
  FileELement(
    super.metaObject, {
    required this.name,
  });

  String name;

  Future<void> write(String path);
}
