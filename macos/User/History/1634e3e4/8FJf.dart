class FragmentTree {
  //id, node
  final fragments = <String, FragmentNode>{};
}

class FragmentNode {
  final String id;
  final String parent;
  final Set<String> children;
}
