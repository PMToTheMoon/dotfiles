part of 'union.dart';

class UnionMetaData {
  UnionMetaData({
    required this.className,
    required this.types,
  });
  final String className;

  /// unions types, indexed by constructor name
  final Map<String, UnionTypeMetaData> types;

  // Map<String, dynamic> toParams() => {
  //       'union': className,
  //       'types': types.values.map((t) => t.toParams()).toList(),
  //     };
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
