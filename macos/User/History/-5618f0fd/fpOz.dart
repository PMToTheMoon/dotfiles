import 'package:bonemeal/bonemeal.dart';

class BuildContext {}

abstract class Seed extends MetaObject {
  @nonVirtual
  void build(BuildStep step) {
    // TODO: implement build
  }

  MetaObject grow(BuildContext context);
}
