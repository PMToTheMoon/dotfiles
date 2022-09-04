import 'dart:math';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:bonemeal/bonemeal.dart';

Method extractMethodFromElement(MethodElement element) {
  final method = MethodBuilder();
  method.name = element.displayName;
  method.returns = _referType(element.returnType);
  if (element.isAsynchronous) {
    if (element.isGenerator && element.isAsynchronous)
      method.modifier = MethodModifier.asyncStar;
  }
  method.modifier = MethodModifier.async;
  method.static = element.isStatic;

  return method.build();
}

Reference _referType(DartType type) {
  final element = type.element;
  if (element == null) throw "Can't extract type of a null element";
  if (element is UriReferencedElement) {
    return refer(element.displayName, element.uri);
  }
  return refer(element.displayName);
}
