import 'package:bonemeal/bonemeal.dart';

part 'transformer_test.bgen.dart';

// @ToTransformer()
// void myTr() {}

@ToTransformer()
mixin Please {
  static final transformer = $please;

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
