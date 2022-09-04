import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
abstract class ValueResolver {
  Expression resolve(String entry);
}

class DelegateValueResolver {
  @override
  Expression call(String entry) {
    return refer(entry);
  }
}

class DefaultValueResolver implements ValueResolver {
  const DefaultValueResolver();

  @override
  Expression resolve(String entry) {
    return refer(entry);
  }
}

class MapValueResolver implements ValueResolver {
  MapValueResolver(this.values, {ValueResolver? onNotFound})
      : onNotFound = onNotFound ?? const DefaultValueResolver();

  final Map<String, Expression> values;
  final Expression Function(String entry) onNotFound;

  @override
  Expression resolve(String entry) {
    return values[entry] ?? onNotFound.resolve(entry);
  }
}

class PrefixValueResolver implements ValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  @override
  Expression resolve(String entry) => refer('$prefix$entry');
}
