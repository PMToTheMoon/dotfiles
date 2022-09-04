import 'package:code_builder/code_builder.dart';

class Transformer {
  const Transformer(
    this.entrypoint, [
    this.utils = const [],
  ]);

  final Method entrypoint;
  final List<Method> utils;
}
