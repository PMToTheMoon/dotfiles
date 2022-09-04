import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';

import 'reference.dart';

class Fields extends DelegatingSet<Field> {
  static const empty = Fields({});

  const Fields(super.base);

  Fields.fromMethodParameters(Method method)
      : super({
          for (final p in method.requiredParameters)
            Field((f) => f
              ..name = p.name
              ..type = p.type
              ..modifier = FieldModifier.final$)
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
          ..required = t.isNullable);
      });

  Fields toFinal() => Fields({
        for (final f in this)
          f.rebuild((p) => p..modifier = FieldModifier.final$)
      });
}

class MetaField {
  MetaField(
    this.type,
    this.name, [
    this.dependencies = const [],
  ]);

  final String type;
  final String name;
  final List<String> dependencies;

  //  : _type = ext.TypeReference((t) => t
  //         ..symbol = type
  //         ..isNullable = nullable);

  // final ext.TypeReference _type;

  MetaField copyWith({
    String? name,
    String? type,
    bool? named,
    bool? required,
  }) =>
      MetaField(
        type ?? this.type,
        name ?? this.name,
      );

  // String toFunctionDeclarationParameter({
  //   bool redirectToThis = true,
  // }) {
  //   return [
  //     if (named && required) 'required ',
  //     if (redirectToThis) 'this.' else '$type ',
  //     name,
  //   ].join('');
  // }

  // String toFunctionCallParameter() => named ? '$name: $name' : name;

  // String toMemberDeclaration() => 'final $type $name;';
}
