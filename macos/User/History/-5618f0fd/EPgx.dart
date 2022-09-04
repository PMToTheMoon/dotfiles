import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject<T> {
  // MetaObject? _cache;

  // MetaObject get child {
  //   if (_cache == null) {
  //     final object = grow();
  //     _cache = object;
  //     return grow();
  //   } else {
  //     return _cache!;
  //   }
  // }

  @override
  final String path = '';

  @override
  T build(BuildStep step) {
    final object = grow(step);
    return step.build(object);
  }

  MetaObject<T> grow(BuildStep step);
}
