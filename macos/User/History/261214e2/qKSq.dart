// import 'package:bonemeal/bonemeal.dart';

import 'package:bonemeal/bonemeal.dart';

part 'hook_test.bm.dart';

@ToHook()
void myHook() {
  print("It's a hook !");
}

@ToHook()
bool myHook2(int a, {String? test}) {
  print("It's a hook !");
  return true;
}

@ToHook()
ToHook myHook3([String? test]) {
  return ToHook();
}

// @InlineHook(inline: true)
// void test() {
//   print("helloFromInlineHook");
// }

// @ExtractHooks()
// class DeepHook {
//   void entrypoint() {
//     print("helloFromDeepHook");
//   }

//   void deepHook2() {
//     print("helloFromDeepHook");
//   }
// }

// @ExtractHooks()
// extension ExtensionHook on DeepHook {
//   void extensionHook() {
//     print("extensionHook");
//   }

//   void extensionHook2() {
//     print("extensionHook");
//   }
// }

// @ExtractHooks()
// mixin MixinHook {
//   void mixinHook() {
//     print("mixinHook");
//   }
// }
