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
  DirectoryElement(
    super.metaObject, {
    required this.name,
  });

  String name;
}

abstract class FileELement extends Element {
  FileELement(
    super.metaObject, {
    required this.name,
  });

  String name;

  Future<void> write(String path);
}
