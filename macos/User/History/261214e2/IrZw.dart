import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@Hook()
void nonInline() {}

@Hook(inline: true)
void test() {
  print("helloFromInlineHook");
}

@Hook(inline: true)
class DeepHook {
  void deepHook() {
    print("helloFromDeepHook");
  }
}

@Hook()
extension ExtensionHook on DeepHook {
  void extensionHook() {
    print("extensionHook");
  }
}

@Hook()
mixin MixinHook {
  void mixinHook() {
    print("mixinHook");
  }
}
