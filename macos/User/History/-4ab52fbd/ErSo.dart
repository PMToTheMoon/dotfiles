import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';

import 'package:bonemeal/src/code_composer/code_composer.dart';

extension CallClassMethod on Class {
  InvokeExpression invoke([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    if (c.requiredParameters.isNotEmpty || c.optionalParameters.isNotEmpty) {
      return newOf(c);
    }
    return constOf(c);
  }

  InvokeExpression constOf(Constructor c) {
    return InvokeExpression.constOf(
      refer(name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }

  InvokeExpression newOf(Constructor c) {
    return InvokeExpression.newOf(
      refer(name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }
}
