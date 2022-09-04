import 'dart:async';

import 'build_step.dart';

abstract class MetaObject<Data, BuildMetaData> {
  const MetaObject({
    this.root,
  });

  final String? root;

  FutureOr<BuildMetaData> build(BuildStep<Data> context);
}
