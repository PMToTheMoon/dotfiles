import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

import 'package:collection/collection.dart';

part 'union_meta_data.dart';

class UnionType {
  UnionType(this.name, [Set<Field>? fields])
      : fields = fields != null ? Fields(fields) : Fields.empty;
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
    final freezedFileName = '$filePrefix.freezed.dart';
    final jsonSerializableFileName = '$filePrefix.g.dart';
    final constructors =
        types.map((t) => t.toConstructor(typePrefix, typeSuffix));
    final fromJsonConstructor = Constructor(
      (c) => c
        ..factory = true
        ..name = 'fromJson'
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..type = refer('Map<String, dynamic>')
              ..name = 'json',
          ),
        )
        ..lambda = true
        ..body = refer('_\$${className}FromJson(json)').code,
    );
    final toJsonMethod = Method(
      (m) => m
        ..returns = refer('Map<String, dynamic>')
        ..name = 'toJson'
        ..lambda = true
        ..body = refer('_\$${className}ToJson').call([refer('this')]).code,
    );
    final union = Class((c) => c
          ..annotations.add(refer(
            'freezed',
            'package:freezed_annotation/freezed_annotation.dart',
          ))
          ..name = className
          ..mixins.add(refer('_\$$className'))
          ..constructors.addAll(constructors)
          ..constructors.add(fromJsonConstructor)
        // ..methods.add(toJsonMethod),
        );

    final unionFileContent = Library(
      (l) => l
        ..directives.addAll([
          if (step.isPartOf == false) Directive.part(freezedFileName),
          if (step.isPartOf == false) Directive.part(jsonSerializableFileName),
        ])
        ..body.add(union),
    ).accept(step.emitter).toString();

    await step.writeAndFormat(
      file,
      unionFileContent,
    );

    return UnionMetaData(
      union: union,
      types: {
        for (final c in constructors)
          c.name ?? 'default': c.redirect!.type.accept(step.emitter).toString(),
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
