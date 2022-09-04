import 'package:path/path.dart' as p;

class BuildStep<Input, Output> {
  BuildStep(
    this.reader,
    this.writer, {
    required this.input,
    String? root,
  }) : _root = root ?? '';

  final Input input;

  final String _root;

  Output build(MetaObject<Input, Output> object, Input input) {
    // TODO: more robust nested path (packages, asbolute and relative paths)
    final root = p.join(_root, object.root);
    return object.build(
      BuildStep(input: input, root: root),
    );
  }
}

abstract class MetaObject<Input, BuildMetaData> {
  MetaObject({
    this.root,
  });

  final String? root;

  BuildMetaData build(BuildStep<Input, BuildMetaData> context);
}
