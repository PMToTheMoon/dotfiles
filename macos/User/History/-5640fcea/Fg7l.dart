part of 'union.dart';

class UnionMetaData {
  UnionMetaData({
    required this.className,
    required this.types,
  });
  final String className;

  /// unions types, indexed by name
  final Map<String, UnionTypeMetaData> types;
}

class UnionTypeMetaData {
  const UnionTypeMetaData({
    required this.name,
    required this.className,
    required this.fields,
  });

  final String name;
  final String className;
  final Fields fields;
}
