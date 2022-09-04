import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

extension CallMethod on Method {
  Expression call([
    /// Produce a method call of form owner.method
    String? owner,
  ]) {
    final symbol = owner != null ? '$owner.$name' : name!;
    return refer(symbol).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }

  Fields toFields() => Fields.fromMethodParameters(this);
}
