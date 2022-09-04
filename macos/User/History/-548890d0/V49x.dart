part of 'union.dart';

class UnionInput {
  UnionInput({
    required this.type,
    required this.radical,
    required this.types,
    this.serializable = false,
    this.partOf,
    this.dependencies = const [],
  });

  final String type;
  final String radical;
  final Set<UnionType> types;
  final PartOf? partOf;
  final bool serializable;
  final List<Dependency> dependencies;

  Map<String, dynamic> toParams() => {
        'union': type,
        'types': types.map((t) => t.toParams(radical)).toList(),
      };

  UnionMetaData toMetaData() => UnionMetaData(
        className: type,
        types: {
          for (final type in types) type.name: type.toMetaData(radical),
        },
      );
}

class UnionType {
  const UnionType(this.name, [this.fields = Fields.empty]);
  final String name;
  final Fields fields;

  Map<String, dynamic> toParams(String radical) {
    return {
      'class': '$radical${name.pascalCase}',
      'constructor':
          '$name${fields.toFunctionParametersDeclaration(redirectToThis: false)}',
    };
  }

  UnionTypeMetaData toMetaData(String radical) => UnionTypeMetaData(
        className: '$radical${name.pascalCase}',
        name: name,
        fields: fields,
      );
}
