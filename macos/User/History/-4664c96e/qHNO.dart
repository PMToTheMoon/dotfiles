import 'package:bonemeal/bonemeal.dart';

class ToHook {
  const ToHook({
    this.inline = false,
  });

  final bool inline;
}

class ExtractHooks {
  const ExtractHooks();
}

mixin HookBase {
  bool get isInline;
  Code get code;
}

class Hook implements HookBase {
  const Hook({
    required this.code,
    required this.isInline,
  });

  @override
  final bool isInline;

  @override
  final Code code;
}
