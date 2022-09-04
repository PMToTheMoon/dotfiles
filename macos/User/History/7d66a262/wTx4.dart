import 'package:bonemeal/bonemeal.dart';

extension CodeComposeExpressionExtension on Expression {
  Expression callWithResolver(ValueResolver resolver, Parameters parameters) =>
      call(
        resolver.resolveRequiredParameters(parameters),
        resolver.resolveOptionalParameters(parameters),
      );
}

extension CodeComposeExpressionFlutterExtension on Expression {
  Expression withPadding(Expression padding) => InvokeExpression.newOf(
          refer('Padding', 'package:flutter/material.dart'), [], {
        'padding': padding,
        'child': this,
      });

  Expression maybePadding(Expression? padding) =>
      padding != null ? withPadding(padding) : this;
}
