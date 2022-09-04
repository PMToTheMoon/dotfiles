import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  List<String>? functions,
}) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);

  String className = baseName.pascalCase;
  if (baseName.endsWith('Transformer') == false) {
    className = '${className}Transformer';
  }

  String functionsParamValue = functions?.isNotEmpty == true
      ? """
Code('''
${functions?.join('\n\n')}
''')
"""
      : 'null';

  return """
class $className extends Transformer{
    $className() : super(
    transformer: Code('''
$transformer
'''),
    functions: $functionsParamValue,
  );
}
""";
}
