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
  Form(this.fields);

  final List<String> fields;

  @override
  void write(BuildStep step) {
    final controller = FormController(fields);
    final controllerMeta = controller.write(step);

    // controller contain absolute path to file
    // step contain absolute path to this context
    // by comparing both we can deduce import
    step.refer(controllerMeta.controller);
  }
}

class FormController extends MetaObject {
  final List<String> fields;

  FormController(this.fields);

  @override
  void write(BuildStep step) {}
}
