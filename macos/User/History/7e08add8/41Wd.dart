import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

import 'build_step.dart';

export 'build_step.dart';

class Fragment<T> {
  Fragment({
    this.meta,
    this.path,
    this.library,
    this.children = const [],
  });
  String? path;
  T? meta;
  Library? library;
  List<Fragment> children;
}

abstract class MetaObject<T> {
  const MetaObject();

  Fragment<T> createFragment();
}

class $BuildStep {
  $BuildStep();

  final List<Fragment> _children = [];

  T? build<T>(MetaObject<T> object) {
    final fragment = object.createFragment();
    _children.add(fragment);
    return fragment.meta;
  }
}

abstract class $Seed extends MetaObject {
  @override
  Fragment createFragment() {
    final step = $BuildStep();
    final metaObject = build(step);
    return Fragment(children: [
      metaObject.createFragment(),
    ]);
  }

  MetaObject build($BuildStep step);
}

class FetchBloc extends $Seed {
  MetaObject build() {
    return Bloc();
  }
}
