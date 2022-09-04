import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

import 'code_compose.dart';

extension CallClassMethod on Class {
  InvokeExpression invoke([String? constructor]) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    if (c.requiredParameters.isNotEmpty || c.optionalParameters.isNotEmpty) {
      return _newOf(c);
    }
    return _constOf(c);
  }

  Field toField() => Field((f) => f
    ..name = name.camelCase
    ..type = refer(name));

  Method? method(String name) =>
      methods.firstWhereOrNull((m) => m.name == name);

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }

  InvokeExpression _constOf(Constructor c) {
    return InvokeExpression.constOf(
      refer(name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }

  InvokeExpression _newOf(Constructor c) {
    return InvokeExpression.newOf(
      refer(name),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {for (final p in c.optionalParameters) p.name: refer(p.name)},
    );
  }
}
