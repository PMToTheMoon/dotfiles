import 'package:bonemeal/bonemeal.dart';

class BlocSource {
  const BlocSource({
    required this.repository,
    required this.methodName,
  });

  final Class repository;
  final String methodName;

  Method get fetchMethod => repository.method(methodName)!;

  Expression call([String? varName]) =>
      fetchMethod.call(varName ?? repository.name.camelCase);
}
