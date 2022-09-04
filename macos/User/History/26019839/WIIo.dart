import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

extension CallMethod on Method {
  /// [owner] produce a method call of form owner.method
  Expression call({
    String? owner,
    ValueResolver? values,
  }) {
    final symbol = owner != null ? '$owner.$name' : name;
    if (symbol == null) throw 'Invalid call of a unnamed method';
    final resolve = values ?? defaultValueResolver;
    return refer(symbol).call(
      requiredParameters.map((p) => resolve(p.name)),
      {
        for (final p in optionalParameters) resolve(p.name),
      },
    );
  }

  Iterable<Parameter> get allParameters =>
      [...requiredParameters, ...optionalParameters];

  Fields toFields() => Fields.fromMethodParameters(this);
}
