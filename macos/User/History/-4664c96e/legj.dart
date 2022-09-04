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

mixin HookMixin {
  bool get isInline;
  Code get code;
}

class Hook {
  const Hook({
    this.code,
    this.isInline,
  });
  final bool isInline;
  final Code code;
}
