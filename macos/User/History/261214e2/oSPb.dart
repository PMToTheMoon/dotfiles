import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@Hook()
void nonInline() {}

@Hook(inline: true)
void test() {
  print("helloFromInlineHook");
}

@Hook(inline: true)
class DeepHook {
  void deepHook() {
    print("helloFromDeepHook");
  }
}
