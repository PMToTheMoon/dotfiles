import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject {
  @override
  Fragment createFragment() {}

  T get meta;

  // @override
  // T build(BuildStep step) {
  //   final object = grow();
  //   return object.build(step);
  // }

  MetaObject grow();
}
