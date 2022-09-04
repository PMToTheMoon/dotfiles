import 'package:mustache_template/mustache_template.dart';
import 'class.mustache';

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

  String generate(Map<String, dynamic> data) {
    final g = MasonGenerator();
    Target
  }
}
