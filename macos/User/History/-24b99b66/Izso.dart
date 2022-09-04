import 'package:bonemeal/bonemeal.dart';

export 'hook_annotation.dart';

class InlineHook {
  const InlineHook({
    required this.inlineCode,
    required this.additionalFunctions,
  });

  final Code inlineCode;
  final Code? additionalFunctions;
}

class Hook {
  const Hook({
    required this.declarations,
  });

  final Code? declarations;
}
