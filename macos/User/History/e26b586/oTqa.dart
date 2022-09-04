import 'package:code_builder/code_builder.dart';

class Transformer {
  const Transformer({
    required this.transformer,
    this.utils,
  });

  final Method transformer;
  final Method? utils;
}
