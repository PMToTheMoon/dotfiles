import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@ToHook()
void nonInline() {}

@ToHook(inline: true)
void test() {
  print("helloFromInlineHook");
}

@ExtractHooks()
class DeepHook with HookBase {
  void deepHook() {
    print("helloFromDeepHook");
  }
}

@ExtractHooks()
extension ExtensionHook on DeepHook {
  void extensionHook() {
    print("extensionHook");
  }
}

@ExtractHooks()
mixin MixinHook {
  void mixinHook() {
    print("mixinHook");
  }
}
