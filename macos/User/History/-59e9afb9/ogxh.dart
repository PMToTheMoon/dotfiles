// ignore_for_file: unused_element

import 'package:bonemeal/bonemeal.dart';

part 'transformer_test.bm.dart';

// @ToTransformer()
// void myTr() {}

@ToTransformer()
mixin _$MyTransformer {
  @Entrypoint()
  void entrypoint() {
    print("helloFromDeepHook");
  }

  void function1() {
    print("helloFromDeepHook");
  }

  void function2() {
    print("helloFromDeepHook");
  }
}
