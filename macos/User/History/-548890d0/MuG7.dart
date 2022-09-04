part of 'freezed.dart';

class FreezedData {
  FreezedData({
    required this.type,
    required this.radical,
    required this.types,
    this.serializable = false,
    this.partOf,
  });

  final String type;
  final String radical;
  final List<FreezedType> types;
  final PartOf? partOf;
  final bool serializable;

  UnionMetaData toMetaData() => UnionMetaData(
        className: type,
        types: types.map((t) => t.toMetaData(radical)).toSet(),
      );
}

class FreezedType {
  const FreezedType(this.constructor, [this.fields = const {}]);
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

class UnionMetaData {
  UnionMetaData({
    required this.className,
    required this.types,
  });
  final String className;
  final Set<UnionTypeMetaData> types;

  Map<String, dynamic> toParams() => {
        'union': className,
        'constructors': types.map((t) => t.toParams()).toList(),
      };
}

class UnionTypeMetaData {
  const UnionTypeMetaData({
    required this.className,
    required this.constructor,
    required this.fields,
  });

  final String className;
  final String constructor;
  final Set<UnionTypeFieldMetaData> fields;

  Map<String, dynamic> toParams() {
    String parameters = '()';
    if (fields.isNotEmpty) {
      parameters = [
        '({',
        fields.map((f) => f.toDeclaration()).join(','),
        ',})',
      ].join();
    }
    return {
      'class': className,
      'constructor': '$constructor$parameters',
    };
  }
}

class UnionTypeFieldMetaData {
  const UnionTypeFieldMetaData({
    required this.type,
    required this.name,
  });

  final String type;
  final String name;

  String toDeclaration() => 'required $type $name';
}
