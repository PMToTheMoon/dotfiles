import 'package:bonemeal/bonemeal.dart';

extension CodeComposeExpressionFlutterExtension on Expression {
  Expression withPadding(Expression padding) => InvokeExpression.newOf(
          refer('Padding', 'package:flutter/material.dart'), [], {
        'padding': padding,
        'child': this,
      });

  Expression withPadding(Expression padding) => InvokeExpression.newOf(
          refer('Padding', 'package:flutter/material.dart'), [], {
        'padding': padding,
        'child': this,
      });
}
