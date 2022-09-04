import 'package:bonemeal/bonemeal.dart';

export 'hook_annotation.dart';

class InlineHook {
  const InlineHook({
    required this.code,
    required this.additionalFunctions,
  });

  final Code code;
  final Code? additionalFunctions;
}

class Hook {
  const Hook({
    required this.declarations,
  });

  final Code? declarations;
}
