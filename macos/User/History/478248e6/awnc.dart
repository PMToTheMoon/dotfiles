import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
abstract class ValueResolver {
  Expression call(String entry);
}

class DefaultValueResolver implements ValueResolver {
  const DefaultValueResolver();

  @override
  Expression call(String entry) {
    return refer(entry);
  }
}

class MapValueResolver implements ValueResolver {
  MapValueResolver(this.values, {ValueResolver? onNotFound})
      : onNotFound = onNotFound ?? const DefaultValueResolver();

  final Map<String, Expression> values;
  final Expression Function(String entry) onNotFound;

  @override
  Expression call(String entry) {
    return values[entry] ?? onNotFound.call(entry);
  }
}

class PrefixValueResolver implements ValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  @override
  Expression call(String entry) => refer('$prefix$entry');
}
