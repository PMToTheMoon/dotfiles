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

mixin Hook {
  String get code;
}
