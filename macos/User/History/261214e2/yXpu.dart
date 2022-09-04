import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@Hook()
void nonInline() {}

@Hook(inline: true)
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

class Test {
  void test() {}
}

extension TestHooks on Test {
  void test() {}
}
