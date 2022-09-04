import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject {
  @override
  Fragment createFragment() {}

  T _meta;

  MetaObject grow();
}
