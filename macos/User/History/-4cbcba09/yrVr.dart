import 'package:bonemeal/bonemeal.dart';

String declareHook({
  String className,
  String method,
}) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);

  String className = baseName.pascalCase;
  if (baseName.endsWith('Hook') == false) {
    className = '${className}Hook';
  }

  String utilsParamValue = utils?.isNotEmpty == true
      ? """
Code('''
${utils?.join('\n\n')}
''')
"""
      : 'null';

  return """
class $className extends Transformer{
    $className() : super(
    transformer: Code('''
$transformer
'''),
    utils: $utilsParamValue,
  );
}
""";
}
