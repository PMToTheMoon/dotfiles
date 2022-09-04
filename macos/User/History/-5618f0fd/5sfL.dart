import 'dart:io';

import 'package:bonemeal/bonemeal.dart';
import 'package:meta/meta.dart';

class BuildContext {}

abstract class Seed extends MetaObject {
  @override
  @nonVirtual
  void build(BuildStep step) {
    final context = BuildContext();
    final object = grow(context);
    object.build(step);
  }

  MetaObject grow(BuildContext context);
}
