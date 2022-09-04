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

@ToHook()
mixin MixinHook {
  ToHook myHook3([String? test]) {
    return ToHook();
  }

  ToHook myHook4([String? test]) {
    return ToHook();
  }
}
