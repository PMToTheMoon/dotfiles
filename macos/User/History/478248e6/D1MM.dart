import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
abstract class ValueResolver {
  const ValueResolver();

  Iterable<Expression> resolveRequiredParameters(
    Iterable<Parameter> parameters,
  ) {
    final n = literal(null);
    return parameters.map((p) {
      final resolution = resolve(p.name);
      if (resolution is LiteralExpression) {
        if (resolution.literal == 'null' &&
            p.required == false &&
            p.type?.isNullable == true) {
          return null;
        }
      }
      return resolution;
    });
  }

  Map<String, Expression> resolveOptionalParameters(
    Iterable<Parameter> parameters,
  ) =>
      {
        for (final p in parameters) p.name: resolve(p.name),
      };

  Expression resolve(String entry);
}

class DelegateValueResolver extends ValueResolver {
  const DelegateValueResolver(this.delegate);

  final Expression Function(String) delegate;

  @override
  Expression resolve(String entry) => delegate(entry);
}

class DefaultValueResolver extends ValueResolver {
  const DefaultValueResolver();

  @override
  Expression resolve(String entry) => refer(entry);
}

Expression defaultValueResolver(String entry) {
  return refer(entry);
}

class MapValueResolver extends ValueResolver {
  MapValueResolver(this.values, {this.onNotFound});

  final Map<String, Expression> values;
  final Expression Function(String entry)? onNotFound;

  @override
  Expression resolve(String entry) {
    return values[entry] ??
        onNotFound?.call(entry) ??
        defaultValueResolver(entry);
  }
}

class PrefixValueResolver extends ValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  @override
  Expression resolve(String entry) => refer('$prefix.$entry');
}
