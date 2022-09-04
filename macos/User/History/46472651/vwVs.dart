import 'package:bonemeal_core/src/foundations/element.dart';

class Writter {}

class ProjectElement extends Element {
  ProjectElement(
    super.metaObject, {
    required this.path,
  });

  final String path;

  // write files to disk or cache trought writter
  void build(Writter writer) {}
}

class DirectoryElement extends Element {
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
