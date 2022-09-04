import 'package:bonemeal/bonemeal.dart';

class BlocSource {
  BlocSource({
    required this.repository,
    required this.fetch,
  });

  final Class repository;
  final Method fetch;
}
