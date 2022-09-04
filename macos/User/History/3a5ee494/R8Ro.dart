import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

class BarrelExport extends MetaObject<void> {
  BarrelExport(String root, this.children) : super(root: root);

  final List<MetaObject> children;

  @override
  FutureOr<void> build(BuildStep step) async {
    for (final child in children) {
      await step.build(child);
    }
  }
}
