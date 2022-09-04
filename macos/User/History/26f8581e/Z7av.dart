import 'package:code_builder/code_builder.dart';
import 'code_compose.dart';

extension CallMethod on Method {
  Expression call() {
    return refer(name!).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }

  Fields toFields() => Fields({
        for (final p in requiredParameters) Field((f) => f..name = p.name)
        //  MetaField(f.type!.accept(emitter).toString(), f.name),
        // for (final f in optionalParameters)
        //   MetaField(f.type!.accept(emitter).toString(), f.name),
      });
}
