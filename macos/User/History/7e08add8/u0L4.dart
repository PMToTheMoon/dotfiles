import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

import 'build_step.dart';

export 'build_step.dart';

class FragmentNode<T> {
  FragmentNode({
    required this.meta,
    this.path,
    this.library,
    this.children = const [],
  });
  String? path;
  T meta;
  Library? library;
  List<Fragment> children;
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

  Fragment<T> createFragment();
}

class MultiFragment extends MetaObject {
  final List<MetaObject> children;

  MultiFragment(this.children);

  @override
  Fragment createFragment() {
    final List<Fragment> fragments = [];
    for (final child in children) {
      fragments.add(child.createFragment());
    }
    return Fragment(
      children: fragments,
    );
  }
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
