import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

import 'build_step.dart';

export 'build_step.dart';

class FragmentNode<T> {
  FragmentNode({
    this.path,
    this.meta,
    this.children = const [],
  });
  String? path;
  Meta<T>? meta;
  List<FragmentNode> children;
}

class Meta<T> {
  Meta({
    required this.meta,
    this.library,
  });
  T meta;
  Library? library;
}

abstract class MetaObject<T> {
  const MetaObject();

  Meta<T> createFragment();
}

class $BuildStep {
  $BuildStep();

  final List<Fragment> _children = [];

  T build<T>(MetaObject<T> object) {
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
    return metaObject.createFragment();
  }

  MetaObject build($BuildStep step);
}

class FetchBloc extends $Seed {
  MetaObject build() {
    return Bloc();
  }
}
