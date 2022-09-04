import 'package:bloc/bloc.dart';

class BuildStep {
  void out(String path, String content) {}
}

class BuildContext {}

class Output {}

abstract class MetaObject {
  void write(BuildStep step);
}

// -----

class Path {
  Path(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  void write(BuildStep step) {}
}
