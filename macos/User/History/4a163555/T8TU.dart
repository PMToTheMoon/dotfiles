import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

final _emitter = DartEmitter(useNullSafetySyntax: true);

extension CodeComposeReferenceExtension on Reference {
  bool get isNullable {
    final e = type.accept(_emitter).toString();
    return e.endsWith('?');
  }

  Reference toNullable() {
    if (isNullable) return this;
    return Reference('$symbol?', url);
  }

  Field toField(String name) => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}
