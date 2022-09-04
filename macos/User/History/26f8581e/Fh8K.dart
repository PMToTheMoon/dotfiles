import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

extension CallMethod on Method {
  Expression call([String? className]) {
    final symbol = className != null ? '$className.$name' : name!;
    return refer(symbol).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }

  Fields toFields() => Fields.fromMethodParameters(this);
}
