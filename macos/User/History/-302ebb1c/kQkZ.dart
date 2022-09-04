import 'dart:async';

import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bloc_generators/src/source.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

part 'fetch_bloc_template.dart';

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
emit({{ states.fetching.new }});
try {
  // patientDetails(patientId);
  final data = {{ fetch }};
  emit({{ states.ready.new }});
} catch (e) {
  emit({{ states.error.new }});
}
''';

    final body = renderTemplate(bodyTemplate, context.uri, {
      ...metaData.toParams(),
      'fetch': source.call().accept(defaultEmitter()).toString(),
    });
    final m = Method((m) => m
      ..name = '_onFetchRequested'
      ..modifier = MethodModifier.async
      ..returns = refer('Future<void>')
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
    return metaData.states.union.invoke('initial');
    // return metaData.states.types['initial']!.invoke();
  }
}
