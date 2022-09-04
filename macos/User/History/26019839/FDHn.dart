import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

extension CallMethod on Method {
  /// [owner] produce a method call of form owner.method
  Expression call([
    String? owner,
    String? valuesOwner,
  ]) {
    final symbol = owner != null ? '$owner.$name' : name;
    if (symbol == null) throw 'Invalid call of a unnamed method';
    String referValue(String v) => valuesOwner != null ? '$valuesOwner.$v' : v;
    return refer(symbol).call(
      requiredParameters.map((p) => refer(p.name)),
      {
        for (final p in optionalParameters) p.name: refer(p.name),
      },
    );
  }

  Fields toFields() => Fields.fromMethodParameters(this);
}
