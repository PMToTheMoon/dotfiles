import 'package:bloc/bloc.dart';
import 'package:code_builder/code_builder.dart';
import 'package:bonemeal/bonemeal.dart';

final emitter = DartEmitter(useNullSafetySyntax: true);

void main() {
  final sourceMethod = Method((m) => m
    ..name = "source"
    ..requiredParameters.add(Parameter((p) => p
      ..name = "patientId"
      ..type = refer('int')))
    ..optionalParameters.addAll([
      Parameter((p) => p
        ..name = "nana"
        ..named = true
        ..type = TypeReference((t) => t
          ..isNullable = true
          ..symbol = "int"))
    ]));

  // final source = FunctionType((f) => f
  //   ..symbol = "source"
  //   ..requiredParameters.add(TypeReference((t) => t
  //     ..symbol = 'int?'
  //     ..isNullable = true)));

  final nil = TypeReference((t) => t
    ..isNullable = true
    ..symbol = "int");

  print(sourceMethod.accept(emitter));
  print("---");
  print(sourceMethod.call().code.accept(emitter));
  print("---");
  final fields = sourceMethod.toFields();
  print(fields);

  // final func = Method((m) => m
  //   ..name = "test"
  //   ..returns = refer("void")
  //   ..body = Block());
  // print(func.accept(emitter));

  // final call = refer('test').call([]).assignFinal('name').statement;
  // print(call.accept(emitter));

  // refer('source').property('fetch').call(
  //   transformedFields.requiredParameters,
  //   transformedFields.optionalParameters
  // )

  // ]).statement);
}

// void main() {
//   final p = Parameter((p) => p
//     ..name = "name"
//     ..toThis = true
//     ..required = true
//     ..type = refer("int"));
//   final ctr = Constructor((c) => c..requiredParameters.add(p));
//   print(emitter.visitConstructor(ctr, "Test"));

//   final c = Class(
//     (c) => c
//       ..name = "MyClass"
//       ..constructors.add(ctr)
//       ..extend = TypeReference((t) => t
//         ..symbol = 'Blup'
//         ..types.addAll([
//           refer("a"),
//           refer("b"),
//         ]))
//       ..fields.add(
//         Field((f) => f
//           ..name = "name"
//           ..type = TypeReference((t) => t..isNullable = true)
//           ..late = true
//           ..modifier = FieldModifier.final$),
//       ),
//   );

//   final func = Method((m) => m
//     ..name = "test"
//     ..returns = refer("void")
//     ..body = Block());
//   print(func.accept(emitter));

//   final call = refer('test').call([]).assignFinal('name').statement;
//   print(call.accept(emitter));

//   print("---");
// }
