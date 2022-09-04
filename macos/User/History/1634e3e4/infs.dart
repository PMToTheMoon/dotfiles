class FragmentTree {
  //id, node
  final fragments = <String, FragmentNode>{};
}

class FragmentNode<T> {
  final String parentId;
  final String path;
  final T metaObject;
}
