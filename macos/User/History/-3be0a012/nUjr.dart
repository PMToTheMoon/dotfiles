import 'package:bonemeal/bonemeal.dart';

List<Class> generateModels(String name, Fields fields) {
  final classes = <Class>[];

  final outputClass = Class(
    (c) => c
      ..name = name.pascalCase
      ..constructors.add(
        Constructor(
          (ctr) => ctr
            ..optionalParameters.addAll(fields.toNamedParameters())
            ..constant = true,
        ),
      )
      ..fields.addAll(fields),
  );

  classes.add(outputClass);
  return classes;
}
