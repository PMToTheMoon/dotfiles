import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
abstract class ValueResolver {
  const ValueResolver();

  Iterable<Expression> resolveRequiredParameters(
    Iterable<Parameter> parameters,
  ) {
    return parameters.map((p) => resolve(p.name));
  }

  Map<String, Expression> resolveOptionalParameters(
    Iterable<Parameter> parameters,
  ) =>
      {
        for (final p in parameters) p.name: resolve(p.name),
      };

  Expression resolve(String entry);
}

class DelegateValueResolver {
  const DelegateValueResolver(this.delegate);

  final Expression Function(String) delegate;

  Expression call(String entry) => delegate(entry);
}

class DefaultValueResolver extends ValueResolver {
  const DefaultValueResolver();

  @override
  Expression resolve(String entry) => refer(entry);
}

Expression defaultValueResolver(String entry) {
  return refer(entry);
}

class MapValueResolver {
  MapValueResolver(this.values, {this.onNotFound});

  final Map<String, Expression> values;
  final Expression Function(String entry)? onNotFound;

  Expression call(String entry) {
    return values[entry] ??
        onNotFound?.call(entry) ??
        defaultValueResolver(entry);
  }
}

class PrefixValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  Expression call(String entry) => refer('$prefix.$entry');
}
