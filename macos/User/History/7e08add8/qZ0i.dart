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

abstract class $Seed extends MetaObject {
  @override
  Fragment createFragment() {
    final metaObject = build();
    return Fragment(children: [
      metaObject.createFragment(),
    ]);
  }

  MetaObject build();
}

class MultiChildMetaObject {
  MultiChildMetaObject(this.children);
  final List<MetaObject> children;
}

class Path extends MetaObject {
  Path(this.path, this.children);

  final String path;
  final List<MetaObject> children;

  @override
  Fragment createFragment() {
    return Fragment(
      path: path,
      children: [
        for (final child in children) child.createFragment(),
      ],
    );
  }
}

class Bloc extends MetaObject {
  @override
  Fragment createFragment() {
    return Fragment(children: [
      states,
      events,
    ]);
  }
}

class Bloc extends $Seed {
  @override
  MetaObject build() {
    return Path('', [
      states,
      events,
    ]);
  }
}
