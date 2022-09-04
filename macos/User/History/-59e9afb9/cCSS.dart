import 'package:bonemeal/bonemeal.dart';

part 'transformer_test.hook.dart';

@ToTransformer()
class TransformerTest {
  @TransformerEntrypoint()
  void trEntrypoint() {
    print("helloFromDeepHook");
  }

  void trDeepHook2() {
    print("helloFromDeepHook");
  }
}
