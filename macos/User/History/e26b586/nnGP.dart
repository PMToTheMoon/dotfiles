import 'package:code_builder/code_builder.dart';

class Transformer {
  const Transformer({
    required this.transformer,
    this.functions,
  });

  final Code transformer;
  final Code? functions;
}
