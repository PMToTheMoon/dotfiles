import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  List<String>? functions,
}) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);
  baseName = baseName.pascalCase;
  String functionsParamValue = functions?.isNotEmpty == true
      ? """
Code('''
${functions?.join('\n\n')}
''')
"""
      : 'null';

  return """
class _\$${} extends Transformer(

  transformer: Code('''
$transformer
'''),
  functions: $functionsParamValue,
);
""";
}
