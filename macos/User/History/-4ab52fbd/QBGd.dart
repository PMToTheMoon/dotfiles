import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'method.dart';

extension CallClassMethod on Class {
  Expression invoke([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null)
      return InvokeExpression.constOf(
        refer(this.name),
        requiredParameters.map((p) => refer(p.name)),
        {for (final p in optionalParameters) p.name: refer(p.name)},
      );

    return InvokeExpression.constOf(refer(this.name), []);
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }

  Expression newOf(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }
}
