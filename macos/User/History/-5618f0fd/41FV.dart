import 'package:bonemeal/bonemeal.dart';
import 'package:meta/meta.dart';

class BuildContext {}

abstract class Seed extends MetaObject {
  @override
  @nonVirtual
  void build(BuildStep step) {
    // TODO: implement build
  }

  MetaObject grow(BuildContext context);
}
