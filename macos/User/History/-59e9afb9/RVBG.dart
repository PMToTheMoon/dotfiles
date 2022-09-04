import 'package:bonemeal/bonemeal.dart';

part 'transformer_test.hook.dart';

// @ToTransformer()
// void myTr() {}

@ToTransformer()
mixin Please {
  @TransformerEntrypoint()
  void trEntrypoint() {
    print("helloFromDeepHook");
  }

  void trDeepHook2() {
    print("helloFromDeepHook");
  }
}
