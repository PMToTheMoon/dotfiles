import 'package:bonemeal/bonemeal.dart';

class Path extends MetaObject {
  Path(this.path, this.children);

  final List<MetaObject> children;

  @override
  final String path;

  @override
  void build(BuildStep step) {
    for (final child in children) {
      step.build(child);
    }
  }
}
