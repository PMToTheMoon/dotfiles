import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

class Root extends MetaObject<void> {
  Root(String root, this.builder) : super(root: root);

  final FutureOr<void> Function(BuildStep step) builder;

  @override
  FutureOr<void> build(BuildStep step) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
