import 'dart:async';

import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

part 'fetch_bloc_template.dart';

class FetchBlocSource {
  const FetchBlocSource({
    required this.type,
    required this.receivedType,
    required this.fetchFunction,
    required this.dependency,
    this.parameters = Fields.empty,
  });

  final String type;
  final String receivedType;
  final String fetchFunction;
  final Fields parameters;
  final Dependency dependency;

  String get name => type.camelCase;

  Map<String, dynamic> toParams() {
    return {
      'type': type,
      'name': name,
      'fetch': '$name.$fetchFunction${parameters.toFunctionCallParameters()}',
    };
  }
}

class FetchBloc extends Bloc<BlocMetaData> {
  FetchBloc({
    required super.subject,
    required this.source,
    super.root,
  }) : super(
          parameters: Fields({
            ...source.parameters,
            Field(source.type, source.name),
          }),
          events: const {
            BlocEvent('fetchRequested'),
          },
          states: {
            const UnionType('initial'),
            const UnionType('fetching'),
            UnionType(
                'ready',
                Fields({
                  Field(source.receivedType, 'data'),
                })),
            const UnionType('error'),
          },
        );

  final FetchBlocSource source;

  @override
  FutureOr<BlocMetaData> buildMetaData(
    BuildStep context,
    BlocMetaData metaData,
  ) =>
      metaData;

  @override
  FutureOr<String> renderHandlers(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return renderDartTemplate(fetchHandlerTemplate, context.uri, {
      ...metaData.toParams(),
      'source': source.toParams(),
    });
  }

  @override
  List<Dependency> headers(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return [source.dependency];
  }

  @override
  FutureOr<String> renderInitialState(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    final className = metaData.states.types['initial']?.className;
    return 'const $className()';
  }
}
