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
          fields: Fields({
            ...source.fetch.fields,
            MetaField(source.type, source.name),
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
  final data = await {{ source.fetch }};
  emit({{ states.ready.new }});
} catch (e) {
  emit(const {{ states.error.new }});
}
''';

    final body = renderTemplate(bodyTemplate, context.uri, {
      ...metaData.toParams(),
      'source': source.toParams(),
    });
    final m = Method((m) => m
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
    // return renderDartTemplate(fetchHandlerTemplate, context.uri, {
    //   ...metaData.toParams(),
    //   'source': source.toParams(),
    // });
  }

  @override
  Dependencies headers(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    return Dependencies([source.dependency]);
  }

  @override
  InvokeExpression initialState(
    BuildStep context,
    BlocMetaData metaData,
  ) {
    final className = metaData.states.types['initial']?.className ?? 'Unknown';
    return InvokeExpression.constOf(refer(className), []);
  }
}
