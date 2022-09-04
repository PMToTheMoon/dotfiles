// import 'package:bonemeal/bonemeal.dart';

import 'package:bonemeal/bonemeal.dart';

part 'hook_test.bm.dart';

@ToHook()
void myHook() {
  print("It's a hook !");
}

@ToHook()
void myHook2() {
  print("It's a hook !");
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
