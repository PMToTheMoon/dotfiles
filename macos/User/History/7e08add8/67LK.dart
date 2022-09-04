import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

import 'build_step.dart';

export 'build_step.dart';

abstract class Fragment<T> {
  Fragment({
    required this.path,
    this.library,
    this.meta,
    this.children = const [],
  });
  final String path;
  T? meta;
  Library? library;
  List<Fragment> children;
}

abstract class MetaObject<T> {
  const MetaObject();

  Fragment<T> createFragment();
}

class MultiFragment extends MetaObject {
  final List<MetaObject> children;

  @override
  Fragment createFragment() {
    final List<Fragment> fragments = [];
    for (final child in children) {
      fragments.add(child.createFragment());
    }
    return metaObject.createFragment();
  }
}

abstract class $Seed extends MetaObject {
  @override
  Fragment createFragment() {
    final metaObject = build();
    return metaObject.createFragment();
  }

  MetaObject build();
}

class FetchBloc extends $Seed {
  MetaObject build() {
    return Bloc();
  }
}
