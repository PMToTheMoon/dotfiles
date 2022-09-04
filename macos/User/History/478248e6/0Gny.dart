import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
abstract class ValueResolver {
  const ValueResolver();

  Iterable<Expression> resolveRequiredParameters(
    Iterable<Parameter> parameters,
  ) {
    return parameters
        .where((p) => p.named == false && p.required == false)
        .map((p) => resolve(p.name));
  }

  Map<String, Expression> resolveOptionalParameters(
    Iterable<Parameter> parameters,
  ) {
    final entries = <MapEntry<String, Expression>>[];
    for (final p in parameters) {
      final resolution = resolve(p.name);
      if (resolution is LiteralExpression) {
        if (resolution.literal == 'null' &&
            p.required == false &&
            p.type?.isNullable == true) {
          continue;
        }
      }
      entries.add(MapEntry(p.name, resolve(p.name)));
    }
    return Map.fromEntries(entries);
  }

  Expression resolve(String entry);
}

class DelegateValueResolver extends ValueResolver {
  const DelegateValueResolver(this.delegate);

  final Expression Function(String) delegate;

  @override
  Expression resolve(String entry) => delegate(entry);
}

class SelfReferResolver extends ValueResolver {
  const SelfReferResolver();

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
    return values[entry] ?? onNotFound?.call(entry) ?? literal(null);
  }
}

class PrefixValueResolver extends ValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  @override
  Expression resolve(String entry) => refer('$prefix.$entry');
}
