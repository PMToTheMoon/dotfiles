class BuildContext<Input, BuildMetaData> {
  BuildContext({
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Input input;

  // TODO: packages, asbolute and relative paths
  final String _root;

  BuildMetaData build(MetaObject<Input, BuildMetaData> object, Input input) {
    return object.build(BuildContext(input: input, root: _root + object.root));
  }
}

abstract class MetaObject<Input, BuildMetaData> {
  MetaObject({
    this.root,
  });

  final String? root;

  BuildMetaData build(BuildContext<Input, BuildMetaData> context);
}

class StreamViewBlocInput {
  StreamViewBlocInput({
    required this.subject,
    required this.stateFields,
  });

  final String subject;
  final Map<String, dynamic> stateFields;
}
