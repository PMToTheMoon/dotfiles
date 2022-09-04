import 'package:code_builder/code_builder.dart';

class Transformer {
  const Transformer({
    required this.entrypoint,
    this.utils,
  });

  final Method entrypoint;
  final Method? utils;
}
