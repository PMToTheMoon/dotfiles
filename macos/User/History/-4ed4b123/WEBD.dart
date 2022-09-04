import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_gen/src/utils/utils.dart';

String extractMethodFromExecutableElement(
  String source,
  ExecutableElement element,
) {
  // final method = MethodBuilder();
  // method.name = element.displayName;
  // method.returns = _referType(element.returnType);
  // method.modifier = _methodModifier(element);
  // method.static = element.isStatic;
  // method.requiredParameters.addAll(_requiredParameters(element));
  // method.requiredParameters.addAll(_optionalParameters(element));
  final node = getAstNodeFromElement(element) as Declaration;
  final body = Code(extractFunctionOrMethodBodyString(source, node));
  return """
Method(
    (m) => m
      ..name = '${element.displayName}'
      ..returns = ${_referType(element.returnType)}
      ..modifier = ${_methodModifier(element)}
      ..static = ${element.isStatic}
      ..requiredParameters.addAll([${_requiredParameters(element).join('')}])
      ..requiredParameters.addAll([${_optionalParameters(element).join('')}])
      ..body = Code('''
$body
''')
  )
""";
}

bool _isStatic(ExecutableElement e) {
  if (e is FunctionElement) return false;
  return e.isStatic;
}

Iterable<String> _requiredParameters(ExecutableElement element) {
  return element.parameters
      .where((element) =>
          element.isPositional == false && element.isNamed == false)
      .map((p) => """
Parameter((p) => p
  ..name = ${p.name}
  ..type = ${_referType(p.type)},
),
""");
}

Iterable<String> _optionalParameters(ExecutableElement element) {
  return element.parameters
      .where(
          (element) => element.isPositional == true || element.isNamed == true)
      .map((p) => """
Parameter((p) => p
  ..name = ${p.name}
  ..type = ${_referType(p.type)}
  ..named = ${p.isNamed}
  ..required = ${p.isRequired},
),
""");
}

String _methodModifier(ExecutableElement element) {
  if (element.isAsynchronous) {
    if (element.isGenerator) {
      return 'MethodModifier.asyncStar';
    } else {
      return 'MethodModifier.async';
    }
  } else if (element.isGenerator) {
    return 'MethodModifier.syncStar';
  }
  return 'null';
}

String _referType(DartType type) {
  final element = type.element;
  if (element is UriReferencedElement) {
    return "refer('${element.displayName}', '${element.uri}')";
    // return refer(element.displayName, element.uri);
  }
  return "refer('${type.getDisplayString(withNullability: true)}')";
  // return refer(element.displayName);
}
