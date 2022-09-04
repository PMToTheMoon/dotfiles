import 'package:bonemeal/bonemeal.dart';

class Path extends MetaObject {
  Path(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  @override
  void build(BuildStep step) {
    for (final child in children) {
      step.build(child, root: path);
    }
  }
}
