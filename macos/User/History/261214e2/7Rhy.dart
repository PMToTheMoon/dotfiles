import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@HOOK()
void nonInline() {}

@ToHook(inline: true)
void test() {
  print("helloFromInlineHook");
}

@Hooks()
class DeepHook {
  void deepHook() {
    print("helloFromDeepHook");
  }
}

@Hooks()
extension ExtensionHook on DeepHook {
  void extensionHook() {
    print("extensionHook");
  }
}

@Hooks()
mixin MixinHook {
  void mixinHook() {
    print("mixinHook");
  }
}
