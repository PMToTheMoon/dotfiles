import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

@Deprecated('Use [Path] instead')
class Root extends MetaObject<void> {
  Root(String root, this.children) : super(root: root);

  final List<MetaObject> children;

  @override
  FutureOr<void> build(BuildStep step) async {
    for (final child in children) {
      await step.build(child);
    }
  }
}

class Path extends MetaObject<void> {
  Path(String path, this.children) : super(root: path);

  final List<MetaObject> children;

  @override
  FutureOr<void> build(BuildStep step) async {
    for (final child in children) {
      await step.build(child);
    }
  }
}
