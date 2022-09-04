import 'package:bonemeal/bonemeal.dart';

String declareTransformer({
  required String baseName,
  required String transformer,
  String? functions,
}) {
  String? functionsParam;
  if (functions != null) {
    functionsParam = """functions: '''
$functions
'''
""";
  } else {
    functionsParam = '''functions: null''';
  }

  return """
final \$${baseName.camelCase} = Transformer(
  transformer: Code('''
$transformer
'''),
  $functionsParam,
);
""";
}
