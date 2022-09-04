import 'package:code_builder/code_builder.dart';

class Transformer {
  const Transformer({
    required this.transformer,
    this.additionalFunction,
  });

  final Code transformer;
  final Code? additionalFunction;
}
