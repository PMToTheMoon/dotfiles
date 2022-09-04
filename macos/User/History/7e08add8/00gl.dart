import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

import 'build_step.dart';

export 'build_step.dart';

abstract class MetaObject<T> {
  MetaObject(this.path);

  String path;

  T? _meta;
  T get meta {
    if (_meta == null) {
      throw "You can't access metadata of a meta-object before it has been resolved";
    } else {
      return _meta!;
    }
  }

  T resolve(BuildStep step) {
    final meta = build(step);
    _meta = meta;
    return meta;
  }

  @protected
  T build(BuildStep step);
}

// class Fragment {

// }