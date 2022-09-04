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
    if (data is Map<String, dynamic>) {
      final ctrInits = data.keys.map((key) => "this.${key}").join(",");
      final output = """
class $className {
  const $className({
    $ctrInits
  });

  {{ memberDeclarations }}
}
""";
      return output;
    }
    return null;
  }
}
