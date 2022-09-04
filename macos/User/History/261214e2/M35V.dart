import 'package:bonemeal/bonemeal.dart';

part 'hook.hook.dart';

@Hook()
void nonInline() {}

@Hook(inline: true)
void test() {
  print("helloFromInlineHook");
}

class DeepHook {
  @Hook(inline: true)
  void deepHook() {
    print("helloFromDeepHook");
  }
}
