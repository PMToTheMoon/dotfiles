import 'package:bonemeal/bonemeal.dart';

Expression wrapWithPadding(Expression section, Expression? padding) =>
    padding != null
        ? InvokeExpression.newOf(
            refer('Padding', 'package:flutter/material.dart'), [], {
            'padding': padding,
            'child': section,
          })
        : section;

nestedJsonField(String name, Reference type, {String? name,}) => _