import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

class Fields extends DelegatingSet<Field> {
  static const empty = Fields({});

  const Fields(super.base);

  Fields.fromMethodParameters(Method method)
      : super({
          for (final p in method.requiredParameters) p.toField(),
          for (final p in method.optionalParameters) p.toField(),
        });

  Iterable<Parameter> toNamedParameters({
    bool toThis = true,
  }) =>
      map((f) {
        final t = f.type;
        if (t == null) throw 'Field $f as null type which is not allowed';
        return Parameter((p) => p
          ..named = true
          ..name = f.name
          ..type = toThis ? null : t
          ..toThis = toThis
          ..required = t.isNullable ? false : true);
      });

  Fields toFinal() => Fields({
        for (final f in this)
          f.rebuild((p) => p..modifier = FieldModifier.final$)
      });
}

Field field(
  String name,
  Reference type, {
  FieldModifier modifier = FieldModifier.final$,
  Iterable<Expression> annotations = const [],
}) =>
    Field(
      (f) => f
        ..name = name
        ..type = type
        ..modifier = modifier
        ..annotations.addAll(annotations),
    );

extension CodeComposerFieldExtension on Field {
  Field toNullable() {
    if (type?.isNullable == true) return this;
    final typeRef = type as TypeReference;
    final nullablType = typeRef.toBuilder()..isNullable = true;
    
    toBuilder()..type = type!
  }

  Field annotate(Expression annotation) =>
      rebuild((f) => f.annotations.add(annotation));
}
