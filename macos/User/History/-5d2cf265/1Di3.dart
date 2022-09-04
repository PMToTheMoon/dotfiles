import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

import 'package:collection/collection.dart';

part 'union_meta_data.dart';

class UnionType {
  const UnionType(this.name, [this.fields = Fields.empty]);
  final String name;
  final Fields fields;

  Constructor toConstructor(String? prefix, String? suffix) => Constructor(
        (c) => c
          ..name = name
          ..optionalParameters.addAll(fields.toNamedParameters(toThis: false))
          ..constant = true
          ..factory = true
          ..redirect =
              refer('${prefix ?? ''}${name.pascalCase}${suffix ?? ''}'),
      );
}

typedef UnionFactory = Union Function({
  required String className,
  String? typePrefix,
  String? typeSuffix,
  required Set<UnionType> types,
  bool serializable,
  String? root,
});

class Union extends MetaObject<UnionMetaData> {
  const Union({
    required this.className,
    this.typePrefix,
    this.typeSuffix,
    required this.types,
    this.serializable = false,
    super.root,
  });

  final String className;
  final String? typePrefix;
  final String? typeSuffix;
  final Set<UnionType> types;
  final bool serializable;

  @override
  Future<UnionMetaData> build(BuildStep step) async {
    final filePrefix = className.snakeCase;
    final file = '$filePrefix.dart';
    final constructors =
        types.map((t) => t.toConstructor(typePrefix, typeSuffix));

    final union = Class(
      (c) => c
        ..annotations.add(refer(
          'freezed',
          'package:freezed_annotation/freezed_annotation.dart',
        ))
        ..name = className
        ..mixins.add(refer('_\$$className'))
        ..constructors.addAll(constructors),
    );

    final unionFileContent = Library(
      (l) => l..body.add(union),
    ).accept(step.emitter).toString();

    await step.write(
      file,
      unionFileContent,
    );

    return UnionMetaData(
      union: union,
      types: {
        for (final c in constructors)
          c.name!: c.redirect!.type.accept(step.emitter).toString(),
      },
    );

    // final fromJsonHeader = serializable
    //     ? renderTemplate(
    //         fromJsonHeaderTemplate,
    //         uri,
    //         {'file_prefix': filePrefix},
    //       )
    //     : '';
    // final fromJsonFactory = serializable
    //     ? renderTemplate(
    //         fromJsonFactoryTemplate,
    //         uri,
    //         {'class': className},
    //       )
    //     : '';

    // final header = renderTemplate(
    //   headerTemplate,
    //   uri,
    //   {'file_prefix': filePrefix, 'json_header': fromJsonHeader},
    // );

    // final body = renderDartTemplate(unionTemplate, uri, {
    //   'json': {
    //     'header': fromJsonHeader,
    //     'factory': fromJsonFactory,
    //   },
    //   ...toParams(),
    // });
  }
}
