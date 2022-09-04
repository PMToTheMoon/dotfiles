import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

part 'union_template.dart';
part 'union_meta_data.dart';

class UnionType {
  const UnionType(this.name, [this.fields = Fields.empty]);
  final String name;
  final Fields fields;

  Constructor toConstructor(String radical) => Constructor(
        (c) => c
          ..name = name
          ..optionalParameters.addAll(fields.toNamedParameters(toThis: false))
          ..constant = true
          ..factory = true
          ..redirect = refer('$radical${name.pascalCase}'),
      );
}

typedef UnionFactory = Union Function({
  required String className,
  required String radical,
  required Set<UnionType> types,
  PartOf? partOf,
  bool serializable,
  List<Dependency> dependencies,
  String? root,
});

class Union extends MetaObject<UnionMetaData> {
  const Union({
    required this.className,
    required this.radical,
    required this.types,
    this.serializable = false,
    this.partOf,
    this.dependencies = const [],
    super.root,
  });

  final String className;
  final String radical;
  final Set<UnionType> types;
  final PartOf? partOf;
  final bool serializable;
  final List<Dependency> dependencies;

  @override
  Future<UnionMetaData> build(BuildStep step) async {
    final filePrefix = className.snakeCase;
    final file = '$filePrefix.dart';

    final constructors = types.map((t) => t.toConstructor(radical));

    final union = Class(
      (c) => c
        ..annotations.add(refer('freezed'))
        ..name = className
        ..mixins.add(refer('_\$$className'))
        ..constructors.addAll(constructors),
    );

    final unionFileContent = Library(
      (l) => l
        ..directives.addAll([
          Directive.import(
              'package:freezed_annotation/freezed_annotation.dart'),
          Directive.part('$filePrefix.freezed.dart'),
        ])
        ..body.add(union),
    ).accept(emitter).toString();

    final partOfOrImports = partOf != null
        ? PartOf.override(
            partOf!,
            fallback: '',
          )
        : CustomDependency('');

    await step.writeShared(
        file,
        unionFileContent,
        Dependencies([
          partOfOrImports,
        ]));

    return UnionMetaData(className: className, types: {});

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
