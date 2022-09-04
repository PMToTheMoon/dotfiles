import 'package:mustache_template/mustache_template.dart';

const classTemplate = """
class {{ ClassName }} {
  const {{ ClassName }}({
    {{ memberConstructorInitialization }}
  });

  {{ memberDeclarations }}
}
""";

class ClassGen {
  const ClassGen();

  String? generate(dynamic data) {
    final t = Template(classTemplate, name: 'class.dart');
    if (data is Map<String, dynamic>) {
      final ctrInits = data.map((key, value) => "this.${key}").join(",");
      return t.renderString();
    }
    return null;
  }
}
