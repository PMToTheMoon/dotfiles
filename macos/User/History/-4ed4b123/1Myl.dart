import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_gen/src/utils/utils.dart';

Method extractMethodFromExecutableElement(
  String source,
  ExecutableElement element,
) {
  final method = MethodBuilder();
  method.name = element.displayName;
  method.returns = _referType(element.returnType);
  method.modifier = _methodModifier(element);
  method.static = element.isStatic;
  method.requiredParameters.addAll(_requiredParameters(element));
  method.requiredParameters.addAll(_optionalParameters(element));
  final node = getAstNodeFromElement(element) as Declaration;
  method.body = Code(extractFunctionOrMethodBodyString(source, node));
  return method.toString();
}

Iterable<Parameter> _requiredParameters(ExecutableElement element) {
  return element.parameters
      .where((element) =>
          element.isPositional == false && element.isNamed == false)
      .map((p) => Parameter(
            ($) => $
              ..name = p.name
              ..type = _referType(p.type),
          ));
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
  if (element == null) throw "Can't extract type of a null element";
  if (element is UriReferencedElement) {
    return "refer('${element.displayName}', '${element.uri}')";
    // return refer(element.displayName, element.uri);
  }
  return "refer('${element.displayName}')";
  // return refer(element.displayName);
}
