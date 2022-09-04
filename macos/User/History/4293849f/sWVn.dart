import 'package:bonemeal/bonemeal.dart';

InvokeExpression wrapWithPadding(Expression section, Expression padding) =>
    InvokeExpression.newOf(
        refer('Padding', 'package:flutter/material.dart'), [], {
      'padding': padding,
      'child': section,
    });
