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

@Hook(inline: true)
extension ExtensionHook on DeepHook {
  void extensionHook() {
    print("helloFromDeepHook");
  }
}

@Hook()
mixin MixinHook {
  void extensionHook() {
    print("mixinHook");
  }
}
