// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hook_test.dart';

// **************************************************************************
// Generator: HookBuilder
// **************************************************************************

class MyHook extends Hook {
  MyHook()
      : super(
            method: Method((m) => m
              ..name = 'myHook'
              ..returns = refer('void')
              ..modifier = null
              ..static = false
              ..requiredParameters.addAll([])
              ..requiredParameters.addAll([])
              ..body = Code('''
print("It's a hook !");
''')));
}

class MyHook2Hook extends Hook {
  MyHook2Hook()
      : super(
            method: Method((m) => m
              ..name = 'myHook2'
              ..returns = refer('bool')
              ..modifier = null
              ..static = false
              ..requiredParameters.addAll([])
              ..requiredParameters.addAll([
                Parameter(
                  (p) => p
                    ..name = 'a'
                    ..type = refer('int')
                    ..named = false
                    ..required = true,
                ),
                Parameter(
                  (p) => p
                    ..name = 'test'
                    ..type = refer('String?')
                    ..named = true
                    ..required = false,
                ),
              ])
              ..body = Code('''
print("It's a hook !");
  return true;
''')));
}
