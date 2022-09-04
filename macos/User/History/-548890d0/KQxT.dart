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
          for (final type in types) type.constructor: type.toMetaData(radical),
        },
      );
}

class UnionType {
  const UnionType(this.constructor, [this.fields = const {}]);
  final String constructor;
  final Map<String, String> fields;

  UnionTypeMetaData toMetaData(String radical) => UnionTypeMetaData(
        className: '$radical${constructor.pascalCase}',
        constructor: constructor,
        fields: fields.entries
            .map((e) => UnionTypeFieldMetaData(type: e.value, name: e.key))
            .toSet(),
      );
}
