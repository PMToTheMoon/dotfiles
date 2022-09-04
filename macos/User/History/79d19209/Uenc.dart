// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_bloc.dart';

// **************************************************************************
// Generator: HookBuilder
// **************************************************************************

class BuildSuccessStateHook extends Hook {
  BuildSuccessStateHook({
    required this.a,
  });

  final double a;

  @override
  get method => Method((m) => m
    ..name = '_buildSuccessState'
    ..returns = refer('double')
    ..modifier = null
    ..static = false
    ..type = null
    ..lambda = false
    ..requiredParameters.addAll([
      Parameter(
        (p) => p
          ..name = 'rawRecords'
          ..type = refer('List<String>'),
      ),
    ])
    ..optionalParameters.addAll([])
    ..body = Code('''
return $a;
'''));
}

final buildSuccessState = [];
