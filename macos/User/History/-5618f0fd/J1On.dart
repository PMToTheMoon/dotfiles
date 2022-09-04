import 'package:bonemeal/bonemeal.dart';
import 'package:meta/meta.dart';

class BuildContext extends BuildStepImpl {
  BuildContext.from(BuildStep step)
      : super(
            path: step.path,
            writer: step.writer,
            outputPackage: step.outputPackage);

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
  Seeds(this.children);

  final List<MetaObject> children;

  @override
  final String path = '';

  @override
  void build(BuildStep step) {
    for (final child in children) {
      step.build(child);
    }
  }
}
