import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject<T> {
  void createFragment();

  // @override
  // T build(BuildStep step) {
  //   final object = grow();
  //   return object.build(step);
  // }

  MetaObject<T> grow();
}
