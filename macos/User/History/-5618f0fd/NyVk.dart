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

abstract class Seed<T> extends MetaObject<T> {
  @override
  final String path = '';

  @override
  T build(BuildStep step) {
    final object = grow(BuildContext.from(step));
    return step.build(object);
  }

  MetaObject<T> grow(BuildContext context);
}

class Seeds extends MetaObject<void> {
  @override
  final String path = '';

  @override
  void build(BuildStep step) {
    // TODO: implement build
  }
}
