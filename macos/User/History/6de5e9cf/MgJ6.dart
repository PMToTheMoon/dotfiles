import 'package:bonemeal/bonemeal.dart';

class Path extends MetaObject {
  Path(String path, this.children);
  final String path;
  final List<MetaObject> children;

  @override
  void build(BuildStep step) {}
}
