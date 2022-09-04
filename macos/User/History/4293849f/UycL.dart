import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

Expression wrapWithPadding(Expression section, Expression? padding) =>
    padding != null
        ? InvokeExpression.newOf(
            refer('Padding', 'package:flutter/material.dart'), [], {
            'padding': padding,
            'child': section,
          })
        : section;

nestedJsonField(String fieldName, Reference type, {String? name}) =>
    jsonField(fieldName, type, name: name, toJson: refer('anyToJson'));
