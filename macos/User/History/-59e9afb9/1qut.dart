import 'package:bonemeal/bonemeal.dart';

@ToTransformer()
class TransformerTest {
  void entrypoint() {
    print("helloFromDeepHook");
  }

  void deepHook2() {
    print("helloFromDeepHook");
  }
}
