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
    // final t = Template(classTemplate, name: 'class.dart');
    final className = name.pascalCase;
    if (data is! Map<String, dynamic>) return null;

    // final ctrInits = data.keys.map((key) => "this.$key").join(",");
    // final declarations = data.entries
    //     .map(
    //       (e) => "final ${e.value} ${e.key};",
    //     )
    //     .join("\n");
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
//     final output = """
// class $className {
//   const $className({
//     $ctrInits
//   });

//   $declarations
// }
// """;

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
