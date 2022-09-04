import 'dart:async';

import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bloc_generators/src/source.dart';
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
}

class FetchBloc extends Bloc<BlocMetaData> {
  FetchBloc({
    required super.subject,
    required this.source,
    super.root,
  }) : super(
          fields: Fields({
            ...Fields.fromMethodParameters(source.fetchMethod),
            source.repository.toField(),
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
                  source.fetchMethod.returns!.toField('data'),
                })),
            const UnionType('error'),
          },
        );

  final BlocSource source;

  @override
  FutureOr<BlocMetaData> buildMetaData(
    BuildStep context,
    BlocMetaData metaData,
  ) =>
      metaData;

  @override
  Iterable<Method> methods(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    const bodyTemplate = '''
if (state is {{ states.fetching.class }}) return;
emit(const {{ states.fetching.new }});
try {
  // patientDetails(patientId);
  final data = {{ source.fetch }};
  emit({{ states.ready.new }});
} catch (e) {
  emit(const {{ states.error.new }});
}
''';

    final body = renderTemplate(bodyTemplate, context.uri, {
      ...metaData.toParams(),
      'source': source.method.call().awaited,
    });
    final m = Method((m) => m
      ..name = '_onFetchRequested'
      ..modifier = MethodModifier.async
      ..requiredParameters.addAll([
        Parameter((p) => p
          ..type = metaData.events.refer('fetchRequested')!
          ..name = 'event'),
        Parameter((p) => p
          ..type = refer('Emitter')
          ..name = 'emit')
      ])
      ..body = Code(body));
    return [m];
  }

  @override
  Dependencies headers(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return Dependencies.empty;
  }

  @override
  InvokeExpression initialState(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return metaData.states.types['initial']!.invoke();
  }
}
