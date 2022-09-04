import 'package:bonemeal/bonemeal.dart';

class BlocSource {
  BlocSource({
    required this.repository,
    required this.method,
  });

  final Class repository;
  final String methodName;

  Method get fech => repository.methods(target);
}
