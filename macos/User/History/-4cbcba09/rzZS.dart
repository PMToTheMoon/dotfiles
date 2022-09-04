import 'package:bonemeal/bonemeal.dart';

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
