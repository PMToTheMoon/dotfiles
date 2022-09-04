import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  String? functions,
}) {
  String functionsParamValue = functions != null
      ? """
Code('''
$functions
''')
"""
      : 'null';

  return """
final \$${baseName.camelCase} = Transformer(
  transformer: Code('''
$transformer
'''),
  functions: $functionsParamValue,
);
""";
}
