import 'package:path/path.dart' as p;

class BuildContext<Input, BuildMetaData> {
  BuildContext({
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Input input;

  final String _root;

  BuildMetaData build(MetaObject<Input, BuildMetaData> object, Input input) {
    // TODO: more robust nested path (packages, asbolute and relative paths)
    final root = p.join(_root, object.root);
    return object.build(
      BuildContext(input: input, root: root),
    );
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
