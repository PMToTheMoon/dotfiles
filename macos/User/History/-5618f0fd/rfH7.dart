import 'package:bonemeal/bonemeal.dart';

abstract class Seed<T> extends MetaObject<T> {
  MetaObject? _cache;

  MetaObject get child {
    if (_cache == null) {
      final object = grow();
      _cache = object;
      return grow();
    } else {
      return _cache!;
    }
  }

  @override
  String get path => child.path;

  @override
  T build(BuildStep step) {
    return child.build(step);
  }

  MetaObject<T> grow();
}
