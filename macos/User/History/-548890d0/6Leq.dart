part of 'union.dart';

class UnionInput {
  UnionInput({
    required this.type,
    required this.radical,
    required this.types,
    this.serializable = false,
    this.partOf,
  });

  final String type;
  final String radical;
  final Set<UnionType> types;
  final PartOf? partOf;
  final bool serializable;

  Map<String, dynamic> toParams() => {
        'union': type,
        'types': types.map((t) => t.toParams()).toList(),
      };

  UnionMetaData toMetaData() => UnionMetaData(
        className: type,
        types: {
          for (final type in types) type.name: type.toMetaData(radical),
        },
      );
}

class UnionType {
  const UnionType(this.name, [this.fields = const {}]);
  final String name;
  final Map<String, String> fields;

  Map<String, dynamic> toParams(String radical) {
    return {
      'class': '$radical${name.pascalCase}',
      'constructor': '$constructor$parameters',
    };
  }

  UnionTypeMetaData toMetaData(String radical) => UnionTypeMetaData(
        className: '$radical${name.pascalCase}',
        constructor: name,
        fields: fields.entries
            .map((e) => UnionTypeFieldMetaData(type: e.value, name: e.key))
            .toSet(),
      );
}
