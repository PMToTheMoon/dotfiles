import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject<T> {
  @override
  T build(BuildStep step) {
    final object = grow();
    object.build(step);
  }

  MetaObject grow();
}
