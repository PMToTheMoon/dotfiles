import 'package:bonemeal/bonemeal.dart';

class Path extends MetaObject {
  Path(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  @override
  void build(BuildStep step) {
    final childStep = step.childStep(path);
    for (final child in children) {
      child.build(childStep);
    }
  }
}
