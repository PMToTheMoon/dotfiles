import 'package:code_builder/code_builder.dart';
import "package:recase/recase.dart";

// const classTemplate = """
// class {{ ClassName }} {
//   const {{ ClassName }}({
//     {{ memberConstructorInitialization }}
//   });

//   {{ memberDeclarations }}
// }
// """;

class ClassGen {
  const ClassGen();

  String? generate(String name, dynamic data) {
    if (data is! Map<String, dynamic>) return null;

    final params = data.keys.map((key) => Parameter(
          (p) => p..name = key,
        ));

    final fields = data.entries.map(
      (e) => Field(
        (f) => f
          ..name = e.key
          ..type = refer(e.value),
      ),
    );

    final outputClass = Class(
      (c) => c
        ..name = name.pascalCase
        ..constructors.add(
          Constructor(
            (ctr) => ctr..optionalParameters.addAll(params),
          ),
        )
        ..fields.addAll(fields),
    );

    return output;
  }
}
