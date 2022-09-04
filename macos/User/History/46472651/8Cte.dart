import 'package:bonemeal_core/src/foundations/element.dart';

class ProjectElement extends Element {
  ProjectElement(
    super.metaObject, {
    required this.path,
  });

  final String path;

  // write files to disk or cache trought writter
  // void out(Writter writer) {}
}

class DirectoryElement extends Element {
  DirectoryElement(
    super.metaObject, {
    required this.name,
  });

  String name;
}

class FileELement extends Element {
  FileELement(
    super.metaObject, {
    required this.name,
  });

  String name;
}
