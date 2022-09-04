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

@ExtractHooks()
mixin MixinHook {
  void mixinHook() {
    print("mixinHook");
  }
}
