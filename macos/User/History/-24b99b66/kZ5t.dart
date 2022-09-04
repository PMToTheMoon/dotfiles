import 'package:bonemeal/bonemeal.dart';

export 'hook_annotation.dart';

class Hook {
  const Hook({
    required this.inlineCode,
    required this.additionalFunctions,
  });

  final Code inlineCode;
  final Code? additionalFunctions;
}
