import 'package:bonemeal/bonemeal.dart' hide Fields, Field;
import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/code_builder.dart';

class Member {
  Member({
    required this.declarationType,
    required this.declarationName,
  })  : type = declarationType,
        required = true,
        name = declarationName,
        defaultValue = null {
    if (declarationType.contains('=')) {
      final declaration = declarationType.split(' ');
      type = declaration.first;
      defaultValue = declaration.last;
      required = false;
    }
    if (declarationName.endsWith('?')) {
      name = declarationName.substring(0, declarationName.length - 1);
      required = false;
    }
  }

  final String declarationType;
  final String declarationName;
  String type;
  String? defaultValue;
  bool required;
  String name;
}

List<Class> generateModels(String name, Fields data) {
  final classes = <Class>[];
  final members = <Member>[];

  for (final f in data) {
    members.add(Member(declarationType: f.type, declarationName: f.name));
  }

  final params = members.map((m) => Parameter(
        (p) => p
          ..name = m.name
          ..named = true
          ..toThis = true
          ..required = m.required
          ..defaultTo = m.defaultValue != null ? Code(m.defaultValue!) : null,
      ));

  final fields = members.map(
    (e) => Field(
      (f) => f
        ..name = e.name
        ..type = refer(e.type)
        ..modifier = FieldModifier.final$,
    ),
  );

  final outputClass = Class(
    (c) => c
      ..name = name.pascalCase
      ..constructors.add(
        Constructor(
          (ctr) => ctr
            ..optionalParameters.addAll(params)
            ..constant = true,
        ),
      )
      ..fields.addAll(fields),
  );

  classes.add(outputClass);
  return classes;
}
