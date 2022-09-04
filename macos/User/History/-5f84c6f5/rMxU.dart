// part of 'union.dart';

// class UnionMetaData {
//   UnionMetaData({
//     required this.union,
//     required this.types,
//   });
//   final Class union;

//   // Unions types class names, indexed by constructor name
//   final Map<String, String> types;

//   TypeReference? refer(String name) {
//     final ctr = union.constructors.firstWhereOrNull((c) => c.name == name);
//     if (ctr == null || ctr.redirect == null) return null;
//     return TypeReference((t) => t
//       ..symbol = ctr.redirect!.symbol
//       ..isNullable = false);
//   }
// }

// // class UnionTypeMetaData {
// //   const UnionTypeMetaData({
// //     required this.name,
// //     required this.className,
// //     required this.fields,
// //   });

// //   final String name;
// //   final String className;
// //   final Fields fields;
// // }
