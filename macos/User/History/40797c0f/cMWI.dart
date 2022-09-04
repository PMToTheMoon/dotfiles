// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// Generator: HookBuilder
// **************************************************************************

class TestHook extends Hook {
  TestHook()
      : super(
            method: Method((m) => m
              ..name = 'test'
              ..returns = refer('String')
              ..modifier = null
              ..static = false
              ..type = MethodType.getter
              ..lambda = true
              ..requiredParameters.addAll([])
              ..optionalParameters.addAll([])
              ..body = Code('''
":)"
''')));
}

class DisplayFrHook extends Hook {
  DisplayFrHook()
      : super(
            method: Method((m) => m
              ..name = 'displayFr'
              ..returns = refer('void')
              ..modifier = null
              ..static = false
              ..requiredParameters.addAll([])
              ..optionalParameters.addAll([])
              ..body = Code('''
print("yesya");
''')));
}

final myModelHooks = [TestHook(), DisplayFrHook()];
