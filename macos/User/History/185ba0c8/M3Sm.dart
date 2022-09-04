import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

import 'code_compose.dart';

extension CallClassMethod on Class {
  InvokeExpression invoke({
    String? constructor,
    // Map<String, Expression> parameters = const {},
    Expression Function(String name, Reference type)? valueResolver,
  }) {
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    if (c.requiredParameters.isNotEmpty || c.optionalParameters.isNotEmpty) {
      return _newOf(c, parameters);
    }
    return _constOf(c, parameters);
  }

  Field toField() => Field((f) => f
    ..name = name.camelCase
    ..type = refer(name)
    ..modifier = FieldModifier.final$);

  Method? method(String name) =>
      methods.firstWhereOrNull((m) => m.name == name);

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }

  InvokeExpression _constOf(Constructor c, Map<String, Expression> parameters) {
    return InvokeExpression.constOf(
      _referToConstructor(c),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {
        for (final p in c.optionalParameters)
          p.name: parameters[p.name] ?? refer(p.name),
      },
    );
  }

  InvokeExpression _newOf(Constructor c, Map<String, Expression> parameters) {
    return InvokeExpression.newOf(
      _referToConstructor(c),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {
        for (final p in c.optionalParameters)
          p.name: parameters[p.name] ?? refer(p.name),
      },
    );
  }

  Reference _referToConstructor(Constructor c) {
    final redirect = c.redirect;
    if (redirect != null) {
      if (redirect.symbol?.startsWith('_') == false) {
        return redirect;
      }
    }
    return refer(c.name != null ? '$name.${c.name}' : name);
  }
}
