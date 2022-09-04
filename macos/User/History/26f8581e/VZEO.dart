import 'emitter.dart';
import 'fields.dart';

import 'package:code_builder/code_builder.dart';


extension CallMethod on Method {
  Expression call() {
    return refer(name!).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }

  Fields toFields() {

    final f = optionalParameters.first;
    final t = f.type?.accept(emitter).toString();

    return Fields({
        for (final f in requiredParameters)
          MetaField(f.type!.accept(emitter).toString(), f.name),
        for (final f in optionalParameters)
          MetaField(f.type!.accept(emitter).toString(), f.name),
      });
  }  

    
}

void test() {
  // final Reference nil = TypeReference((t) => t
  //   ..isNullable = true
  //   ..symbol = "int");
  final nil = refer('a');

  emitter.para

  print(nil.runtimeType);
  print(nil.statement);
  print(nil.expression.code);
  print(nil.symbol);
  print(nil.accept(emitter));
}
