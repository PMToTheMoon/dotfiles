import 'package:bonemeal/bonemeal.dart';

String hookName(String baseName) {
  if (baseName.startsWith('_')) baseName = baseName.substring(1);
  if (baseName.startsWith(r'$')) baseName = baseName.substring(1);

  String className = baseName.pascalCase;
  if (baseName.endsWith('Hook') == false) {
    className = '${className}Hook';
  }
  if (baseName.endsWith('Hooks') == false) {
    className = '${className}Hooks';
  }
  return className;
}

String declareHook({
  required String className,
  required String method,
}) {
  return """
class $className extends Hook{
    $className() : super(
    method: $method
  );
}""";
}
