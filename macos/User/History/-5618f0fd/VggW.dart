import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject<T> {
  @override
  T build(BuildStep step) {}

  MetaObject grow();
}
