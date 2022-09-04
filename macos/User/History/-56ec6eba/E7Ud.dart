import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';

import 'reference.dart';

class Fields extends DelegatingSet<Field> {
  static const empty = Fields({});

  const Fields(super.base);

  Iterable<Parameter> toNamedParameters({
    bool toThis = true,
  }) =>
      map((f) {
        final t = f.type;
        if (t == null) throw 'Field $f as null type which is not allowed';
        return Parameter((p) => p
          ..named = true
          ..name = f.name
          ..required = t.isNullable);
      });

  // Iterable<Parameter> toParameters() {}

  // Iterable<Field> allUnnamed() => where((f) => f.named == false);
  // Iterable<Field> allNamed() => where((f) => f.named);

  // Fields toFullyNamed() => Fields(
  //       map((f) => f.copyWith(named: true)).toSet(),
  //     );

  // String toFunctionParametersDeclaration({bool redirectToThis = true}) {
  //   final named = allNamed();
  //   final unnamed = allUnnamed();

  //   String addUnnamed() => unnamed
  //       .map((f) =>
  //           f.toFunctionDeclarationParameter(redirectToThis: redirectToThis))
  //       .join(',');

  //   String addNamed() => [
  //         '{',
  //         named
  //             .map((f) => f.toFunctionDeclarationParameter(
  //                   redirectToThis: redirectToThis,
  //                 ))
  //             .join(','),
  //         ',}',
  //       ].join('');

  //   return isEmpty
  //       ? '()'
  //       : [
  //           '(',
  //           if (unnamed.isNotEmpty) addUnnamed(),
  //           if (unnamed.isNotEmpty && named.isNotEmpty) ',',
  //           if (named.isNotEmpty) addNamed(),
  //           ')',
  //         ].join('');
  // }

  // String toFunctionCallParameters() => isEmpty
  //     ? '()'
  //     : [
  //         '(',
  //         allUnnamed().map((f) => f.toFunctionCallParameter()).join(','),
  //         allNamed().map((f) => f.toFunctionCallParameter()).join(','),
  //         ')',
  //       ].join('');

  // String toMemberDeclarations() =>
  //     isEmpty ? '' : map((f) => f.toMemberDeclaration()).join('\n\n');
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
