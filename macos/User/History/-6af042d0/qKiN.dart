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
  }) : super(
          fields: Fields({
            ...Fields.fromMethodParameters(source.fetchMethod),
            source.repository.toField(),
          }),
          events: {
            'fetchRequested': {},
          },
          states: {
            'initial': {},
            'fetching': {},
            'ready': {
              source.fetchMethod.returns!.toField('data'),
            },
            'error': {},
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
    BuildStep step,
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

    final body = renderTemplate(bodyTemplate, step.uri, {
      ...metaData.toParams(step.emitter),
      'fetch': source.call().awaited.accept(step.emitter).toString(),
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
  InvokeExpression initialState(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return metaData.states.union.invoke('initial');
    // return metaData.states.types['initial']!.invoke();
  }
}
