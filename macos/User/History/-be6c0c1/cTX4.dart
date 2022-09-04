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

  void write(BuildStep step) {
    final childStep = BuildStep();
    for (final child in children) {
      child.write(childStep);
    }
  }
}

class Form extends MetaObject {
  final int controller;

  Form(this.controller);

  @override
  void write(BuildStep step) {}
}
