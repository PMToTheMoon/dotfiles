import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'method.dart';

extension CallClassMethod on Class {
  Expression invoke([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    return InvokeExpression.constOf(
      refer(this.name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }

  Expression newOf(String name) {
    Expression invoke([String? constructor]) {
      final c = constructors.firstWhereOrNull((c) => c.name == constructor);
      if (c == null) return InvokeExpression.constOf(refer(name), []);
      return InvokeExpression.constOf(
        refer(this.name),
        c.requiredParameters.map((p) => refer(p.name)).toList(),
        {for (final p in c.optionalParameters) p.name: refer(p.name)},
      );
    }
  }

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }
}
