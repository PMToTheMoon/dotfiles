// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transformer_test.dart';

// **************************************************************************
// Generator: TransformerBuilder
// **************************************************************************

class MyTransformer extends Transformer {
  MyTransformer()
      : super(
          transformer: Code('''
print("helloFromDeepHook");
'''),
          utils: Code('''
void function1() {
    print("helloFromDeepHook");
  }

void function2() {
    print("helloFromDeepHook");
  }
'''),
        );
}
