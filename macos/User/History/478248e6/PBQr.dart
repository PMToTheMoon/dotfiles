import 'package:bonemeal/bonemeal.dart';

/// Resolve expression for a set of entry
typedef ValueResolver = Expression Function(String entry);

class DelegateValueResolver {
  const DelegateValueResolver(this.delegate);

  final Expression Function(String) delegate;

  Expression call(String entry) => delegate(entry);
}

class DefaultValueResolver {
  const DefaultValueResolver();

  @override
  Expression call(String entry) {
    return refer(entry);
  }
}

class MapValueResolver {
  MapValueResolver(this.values, {ValueResolver? onNotFound})
      : onNotFound = onNotFound ?? const DefaultValueResolver();

  final Map<String, Expression> values;
  final Expression Function(String entry) onNotFound;

  @override
  Expression call(String entry) {
    return values[entry] ?? onNotFound.call(entry);
  }
}

class PrefixValueResolver {
  const PrefixValueResolver(this.prefix);

  final String prefix;

  @override
  Expression call(String entry) => refer('$prefix$entry');
}
