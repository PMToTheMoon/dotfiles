import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

extension CodeComposeMethodExtension on Method {
  /// [owner] produce a method call of form owner.method
  Expression call({
    String? owner,
    ValueResolver? values,
  }) {
    final symbol = owner != null ? '$owner.$name' : name;
    if (symbol == null) throw 'Invalid call of a unnamed method';
    final resolver = values ?? DefaultValueResolver();
    return refer(symbol).call(
      resolver.resolveRequiredParameters(requiredParameters),
      resolver.resolveOptionalParameters(optionalParameters),
    );
  }

  Iterable<Parameter> get allParameters =>
      [...requiredParameters, ...optionalParameters];

  Fields toFields() => Fields.fromMethodParameters(this);
}
