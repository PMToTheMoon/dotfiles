class BuildContext<Input, Output> {
  BuildContext({
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Input input;

  // TODO: packages, asbolute and relative paths
  final String _root;

  Output build(MetaObject<Input, Output> object, Input input) {
    return object.build(BuildContext(input: input, root: _root + object.root));
  }
}
