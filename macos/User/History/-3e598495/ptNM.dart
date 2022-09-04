import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  List<String>? functions,
}) {
  String functionsParamValue = functions?.isNotEmpty == true
      ? """
Code('''
${functions?.join('\n\n')}
''')
"""
      : 'null';

  return """
final _\$${baseName.camelCase} = Transformer(
  transformer: Code('''
$transformer
'''),
  functions: $functionsParamValue,
);
""";
}
