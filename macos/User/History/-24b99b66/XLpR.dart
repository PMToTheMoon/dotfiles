import 'package:bonemeal/bonemeal.dart';

export 'hook_annotation.dart';

class InlineHook {
  const InlineHook({
    required this.inlineCode,
    required this.functions,
  });

  final Code inlineCode;
  final Code? functions;
}

class Hook {
  const Hook({
    required this.declarations,
  });

  final Code? declarations;
}
