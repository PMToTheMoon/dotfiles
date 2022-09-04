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
    Reference referValue(String v) => refer(
          valuesOwner != null ? '$valuesOwner.$v' : v,
        );
    return refer(symbol).call(
      requiredParameters.map((p) => refer(p.name)),
      {
        for (final p in optionalParameters) p.name: referValue(p.name),
      },
    );
  }

  Fields toFields() => Fields.fromMethodParameters(this);
}
