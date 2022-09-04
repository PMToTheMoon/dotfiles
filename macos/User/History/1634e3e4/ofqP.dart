import 'package:bonemeal_core/bonemeal_core.dart';

class FragmentTree {
  //id, node
  final fragments = <String, FragmentNode>{};
}

class FragmentNode<T extends MetaObject> {
  final String? parentId;
  final String? path;
  final T metaObject;
}
