import 'package:bonemeal/bonemeal.dart';

part 'transformer_test.tr.dart';

@ToTransformer()
class TransformerTest {
  void entrypoint() {
    print("helloFromDeepHook");
  }

  void deepHook2() {
    print("helloFromDeepHook");
  }
}
