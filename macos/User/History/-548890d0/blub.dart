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
  final List<UnionType> types;
  final PartOf? partOf;
  final bool serializable;

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

  UnionTypeMetaData toMetaData(String radical) => UnionTypeMetaData(
        className: '$radical${name.pascalCase}',
        constructor: name,
        fields: fields.entries
            .map((e) => UnionTypeFieldMetaData(type: e.value, name: e.key))
            .toSet(),
      );
}
