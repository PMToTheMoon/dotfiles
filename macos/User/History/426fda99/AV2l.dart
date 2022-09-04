import 'package:path/path.dart' as p;

class Fragment {
  Fragment(
    String path, {
    Fragment? parent,
  }) : _step = BuildStep(root: parent, writer: writer);

  final BuildStep _step;
  final void Function(BuildStep step) action;
}

_newRoot(String path, Fragment? parent) {
  if (parent != null) {
    return path
  }
}