import 'package:collection/collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

import 'code_compose.dart';

typedef ParameterValueResolver = Expression Function(
    String name, Reference? type);

Reference _defaultValueResolver(String name, Reference? type) => refer(name);

extension CallClassMethod on Class {
  InvokeExpression invoke({
    String? constructor,
    // Map<String, Expression> parameters = const {},
    ParameterValueResolver? valueResolver,
  }) {
    valueResolver = valueResolver ?? _defaultValueResolver;
    final c = constructors.firstWhereOrNull((c) => c.name == constructor);
    if (c == null) return InvokeExpression.constOf(refer(name), []);
    if (c.requiredParameters.isNotEmpty || c.optionalParameters.isNotEmpty) {
      return _newOf(c, valueResolver);
    }
    return _constOf(c, valueResolver);
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

  InvokeExpression _constOf(
    Constructor c,
    ParameterValueResolver valueResolver,
  ) {
    return InvokeExpression.constOf(
      _referToConstructor(c),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {
        for (final p in c.optionalParameters)
          p.name: valueResolver(p.name, p.type),
      },
    );
  }

  InvokeExpression _newOf(Constructor c, ParameterValueResolver valueResolver) {
    return InvokeExpression.newOf(
      _referToConstructor(c),
      c.requiredParameters.map((p) => refer(p.name)).toList(),
      {
        for (final p in c.optionalParameters)
          p.name: valueResolver(p.name, p.type),
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
