part of 'union.dart';

class UnionMetaData {
  UnionMetaData({
    required this.className,
    required this.types,
  });
  final String className;

  /// unions types, indexed by constructor name
  final Map<String, UnionTypeMetaData> types;
}

class UnionTypeMetaData {
  const UnionTypeMetaData({
    required this.className,
    required this.constructor,
    required this.fields,
  });

  final String className;
  final String constructor;
  final Fields fields;
}
