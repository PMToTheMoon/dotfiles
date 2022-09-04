import 'package:bonemeal/bonemeal.dart';
import 'package:meta/meta.dart';

class BuildContext extends BuildStepImpl {
  BuildContext.from(BuildStep step)
      : super(path: step.path, writer: step.writer);

  @override
  @protected
  String emit(Spec spec) {
    throw 'Forbidden';
  }
}

abstract class MetaData {}

abstract class Seed<T extends MetaData> extends MetaObject<T> {
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
    final object = grow(BuildContext.from(step));
    return step.build(object);
  }

  MetaObject<T> grow(BuildContext context);
}
