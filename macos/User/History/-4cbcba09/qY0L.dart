import 'package:bonemeal/bonemeal.dart';

String hookName(String baseName) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);

  String className = baseName.pascalCase;
  if (baseName.endsWith('Hook') == false) {
    className = '${className}Hook';
  }
  return className;
}

String declareHook({
  required String className,
  required String method,
}) {
  return """
class $className extends Hook{
    const $className();
    
    final method = $method;
}""";
}
