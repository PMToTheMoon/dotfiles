import 'package:bonemeal_core/src/foundations/element.dart';

class OutputBuilder {
  void build(OutputElement output) {
      final String path = 

    output.visitChildren((element) {
      if (element.)
    })
  }
}

class OutputElement extends Element {
  OutputElement(
    super.metaObject, {
    required this.path,
  });

  // root path for this output
  final String path;
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
