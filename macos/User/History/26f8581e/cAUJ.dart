import 'package:bonemeal/src/code_composer/fields.dart';
import 'package:code_builder/code_builder.dart';

extension CallMethod on Method {
  Expression call() {
    return refer(name!).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }

  Fields toFields() => Fields({
        for (final f in requiredParameters) MetaField(f.type!.symbol!, f.name),
        for (final f in optionalParameters) MetaField(f.type!.symbol!, f.name),
      });
}