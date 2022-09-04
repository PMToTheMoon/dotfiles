class FragmentTree {
  //id, node
  final fragments = <String, FragmentNode>{};
}

class FragmentNode {
  final String parentId;
  final String path;
}
