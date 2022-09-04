import 'package:bonemeal/bonemeal.dart';

String declareHook({
  required String baseName,
  required String method,
}) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);

  String className = baseName.pascalCase;
  if (baseName.endsWith('Hook') == false) {
    className = '${className}Hook';
  }

  return """
class $className extends Hook{
    $className() : super(
    transformer: Code('''
$transformer
'''),
    utils: $utilsParamValue,
  );
}
""";
}
