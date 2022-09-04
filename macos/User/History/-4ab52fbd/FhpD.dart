import 'package:code_builder/code_builder.dart';

extension CallClassMethod on Class {
  Expression call(String symbol) {

    methods.firstWhere((c) => c.name == name)

    return refer(name!).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }
}
