part of 'union.dart';

class UnionMetaData {
  UnionMetaData({
    required this.union,
    // required this.types,
  });
  final Class union;

  // final Map<String, Class> types;
  // final Set<String>

  TypeReference? refer(String name) {
    final constructor = union.constructors.firstWhere((c) => c.name == name);
    if (type == null) return null;
    return TypeReference((t) => t
      ..symbol = type.name
      ..isNullable = false);
  }
}

// class UnionTypeMetaData {
//   const UnionTypeMetaData({
//     required this.name,
//     required this.className,
//     required this.fields,
//   });

//   final String name;
//   final String className;
//   final Fields fields;
// }