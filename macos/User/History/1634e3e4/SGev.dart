class FragmentTree {
  //id, node
  final fragments = <String, FragmentNode>{};
}

class FragmentNode<MetaObject> {
  final String parentId;
  final String path;
}
