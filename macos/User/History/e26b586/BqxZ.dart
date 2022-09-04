import 'package:code_builder/code_builder.dart';

export '../annotations/transformer_annotation.dart';

class Transformer {
  const Transformer({
    required this.transformer,
    this.additionalFunction,
  });

  final Code transformer;
  final Code? additionalFunction;
}
