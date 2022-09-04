import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  List<String>? functions,
}) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);
  if (baseName.endsWith('Transformer')) {
    baseName = baseName.replaceFirst('Transformer', '');
  }
  final className = '${baseName.pascalCase}Transformer';
  String functionsParamValue = functions?.isNotEmpty == true
      ? """
Code('''
${functions?.join('\n\n')}
''')
"""
      : 'null';

  return """
class $baseName extends Transformer(
  $baseName() : super(
    transformer: Code('''
$transformer
'''),
    functions: $functionsParamValue,
  );
);
""";
}
