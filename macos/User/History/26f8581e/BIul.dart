import 'package:code_builder/code_builder.dart';

extension CallMethodWithFields on Method {
  // Expression callWith(Fields fields) {
  //   requiredParameters;
  //   optionalParameters;

  //   fields.where((f) => requiredParametersNames.contains(f.name));

  //   throw UnimplementedError();
  // }

  Expression call() {
    final requiredParametersNames = requiredParameters.map((p) => p.name);
    final optionalParametersNames = optionalParameters.map((p) => p.name);
    return refer(name!).call(
      requiredParameters.map((p) => refer(p.name)),
      {for (final p in optionalParameters) p.name: refer(p.name)},
    );
  }
}
