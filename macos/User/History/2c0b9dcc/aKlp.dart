import 'package:bonemeal/bonemeal.dart';

class BlocSource {
  BlocSource({
    required this.repository,
    required this.methodName,
  });

  final Class repository;
  final String methodName;

  Method get method => repository.method(methodName)!;
}
