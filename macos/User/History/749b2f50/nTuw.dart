import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

final _emitter = DartEmitter(useNullSafetySyntax: true);

extension CodeComposeReferenceExtension on Reference {
  bool get isNullable {
    final e = type.accept(_emitter).toString();
    return e.endsWith('?');
  }

  Field toField([String? name]) => Field((f) => f
    ..name = symbol?.camelCase ?? name!
    ..type = type
    ..modifier = FieldModifier.final$);
}
