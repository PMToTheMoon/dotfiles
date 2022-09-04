import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:bonemeal/bonemeal.dart';

Method extractMethodFromMethodElement(MethodElement element) {
  final method = MethodBuilder();
  method.name = element.displayName;
  method.returns = _referType(element.returnType);
  method.modifier = _methodModifier(element);
  method.static = element.isStatic;
  method.requiredParameters.addAll(_requiredParameters(element));
  method.requiredParameters.addAll(_optionalParameters(element));
  return method.build();
}

Method extractMethodFromMethodElement(MethodElement element) {
  final method = MethodBuilder();
  method.name = element.displayName;
  method.returns = _referType(element.returnType);
  method.modifier = _methodModifier(element);
  method.static = element.isStatic;
  method.requiredParameters.addAll(_requiredParameters(element));
  method.requiredParameters.addAll(_optionalParameters(element));
  return method.build();
}

Iterable<Parameter> _requiredParameters(MethodElement element) {
  return element.parameters
      .where((element) =>
          element.isPositional == false && element.isNamed == false)
      .map((p) => Parameter(
            ($) => $
              ..name = p.name
              ..type = _referType(p.type),
          ));
}

Iterable<Parameter> _optionalParameters(MethodElement element) {
  return element.parameters
      .where(
          (element) => element.isPositional == true || element.isNamed == true)
      .map((p) => Parameter(
            ($) => $
              ..name = p.name
              ..type = _referType(p.type)
              ..named = p.isNamed
              ..required = p.isRequired,
          ));
}

MethodModifier? _methodModifier(MethodElement element) {
  if (element.isAsynchronous) {
    if (element.isGenerator) {
      return MethodModifier.asyncStar;
    } else {
      return MethodModifier.async;
    }
  } else if (element.isGenerator) {
    return MethodModifier.syncStar;
  }
  return null;
}

Reference _referType(DartType type) {
  final element = type.element;
  if (element == null) throw "Can't extract type of a null element";
  if (element is UriReferencedElement) {
    return refer(element.displayName, element.uri);
  }
  return refer(element.displayName);
}
