import 'package:bonemeal/bonemeal.dart';

part 'hook_test.dart';

@InlineHook()
void nonInline() {}

@InlineHook(inline: true)
void test() {
  print("helloFromInlineHook");
}

@ExtractHooks()
class DeepHook {
  void entrypoint() {
    print("helloFromDeepHook");
  }

  void deepHook2() {
    print("helloFromDeepHook");
  }
}

@ExtractHooks()
extension ExtensionHook on DeepHook {
  void extensionHook() {
    print("extensionHook");
  }

  void extensionHook2() {
    print("extensionHook");
  }
}

@ExtractHooks()
mixin MixinHook {
  void mixinHook() {
    print("mixinHook");
  }
}
