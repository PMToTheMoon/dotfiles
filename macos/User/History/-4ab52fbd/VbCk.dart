import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';

import 'package:bonemeal/src/code_composer/code_composer.dart';

extension CallClassMethod on Class {
  InvokeExpression

  InvokeExpression constOf([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    return InvokeExpression.constOf(
      refer(name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }

  InvokeExpression newOf([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.newOf(refer(name), []);
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
