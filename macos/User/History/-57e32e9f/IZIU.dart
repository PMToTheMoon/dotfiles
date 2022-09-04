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

  Fields toNullable() => Fields(
        map((f) => f.toNullable()).toSet(),
      );

  Iterable<Parameter> toNamedParameters({
    bool toThis = true,
    bool removeAnnotations = true,
  }) =>
      map((field) {
        final type = field.type;
        if (type == null) {
          throw 'Field $field as null type which is not allowed';
        }
        return Parameter((p) => p
          ..named = true
          ..name = field.name
          ..type = toThis ? null : type
          ..toThis = toThis
          ..annotations.addAll(removeAnnotations ? [] : field.annotations)
          ..required = type.isNullable ? false : true);
      });

  Fields toFinal() => Fields({
        for (final f in this)
          f.rebuild((p) => p..modifier = FieldModifier.final$)
      });

  Fields excludeByName(Iterable<String> names) {
    return Fields({
      ...where((field) => names.contains(field.name) == false),
    });
  }

  Fields excludeByName(Iterable<String> names) {
    return Fields({
      ...where((field) => names.contains(field.name) == false),
    });
  }

  Fields filterByName(Iterable<String> names) {
    return Fields({
      ...where((field) => names.contains(field.name) == false),
    });
  }
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
    return rebuild(
      (f) => f
        ..type = (type?.type as TypeReference?)
            ?.rebuild((t) => t..isNullable = true),
    );
  }

  Field annotate(Expression annotation) =>
      rebuild((f) => f.annotations.add(annotation));
}
