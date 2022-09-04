import 'package:bloc_generators/bloc_generators.dart';
import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:collection/collection.dart';

const resolveValuesFromState = PrefixValueResolver('state');

class TripleStateBlocMeta extends BlocMeta {
  TripleStateBlocMeta({
    required super.reference,
    required super.$class,
    required super.states,
    required super.events,
    required this.data,
    required this.initial,
    required this.loading,
    required this.success,
    required this.error,
  });

  final Field? data;

  final TripleStateMeta initial;
  final TripleStateMeta loading;
  final TripleStateMeta success;
  final TripleStateMeta error;
}

typedef TripleStateMeta = FreezedTypeMetaData;

class TripleStateBloc extends Bloc {
  factory TripleStateBloc({
    required String subject,
    required RepositoryFetchableSource source,
    String? dataName,
    Set<String>? sourceImmutableParameters,
    String fetchEvent = 'started',
  }) {
    Field? data;
    if (source.fetch.returnsVoid == false) {
      data = field(dataName ?? 'data', source.fetch.returns!);
    }

    final parameters = source.fetch.allParameters
        .where((p) => sourceImmutableParameters?.contains(p.name) == true)
        .toSet();
    return TripleStateBloc._(
      subject: subject,
      source: source,
      data: data,
      sourceImmutableParameters: parameters,
      fetchEvent: fetchEvent,
    );
  }

  TripleStateBloc._({
    required super.subject,
    required this.source,
    required this.data,
    Set<Parameter>? sourceImmutableParameters,
    required this.fetchEvent,
  }) : super(
          properties: {
            source.toParameter(),
            ...?sourceImmutableParameters,
          },
          states: {
            'initial': {},
            'loading': {
              if (data != null) data.toNullable(),
            },
            'error': {
              if (data != null) data,
            },
            'success': {
              if (data != null) data.toNullable(),
            },
          },
          events: {
            fetchEvent: Parameters(
              source.fetch.allParameters.difference(
                sourceImmutableParameters ?? {},
              ),
            ).toFields(),
            // 'updateRequested': {},
          },
          statesHooks: [
            if (data != null) _stateDataAccessor(data),
          ],
        );

  final Field? data;
  final RepositoryFetchableSource source;
  final String fetchEvent;

  @override
  InvokeExpression initialState(
      FreezedMetaData events, FreezedMetaData states) {
    return states['initial'].invoke();
  }

  @override
  Iterable<Method> methods(FreezedMetaData events, FreezedMetaData states) {
    final fetch = _FetchMethod(
      dataName: data?.name,
      sourceFetchValueResolver: _DefaultSourceValueResolver(parameters),
      source: source,
      fetchEvent: events[fetchEvent],
      states: states,
      transformer: null,
    );
    return [
      fetch.method,
      // if (transformer != null) transformer!.entrypoint,
      // ...?transformer?.utils,
    ];
  }

  @override
  TripleStateBlocMeta build(BuildStep step) {
    final blocMeta = super.build(step);
    return TripleStateBlocMeta(
      reference: blocMeta.reference,
      $class: blocMeta.$class,
      data: data,
      states: blocMeta.states,
      events: blocMeta.events,
      initial: blocMeta.states['initial'],
      loading: blocMeta.states['loading'],
      success: blocMeta.states['success'],
      error: blocMeta.states['error'],
    );
  }
}

class _DefaultSourceValueResolver extends ValueResolver {
  _DefaultSourceValueResolver(this.blocParameters);

  final Parameters blocParameters;

  @override
  Expression resolve(String entry) {
    final param =
        blocParameters.firstWhereOrNull((param) => param.name == entry);
    return refer(param?.name ?? 'state.$entry');
  }
}

class _FetchMethod extends Hook {
  _FetchMethod({
    required this.dataName,
    required this.sourceFetchValueResolver,
    required this.source,
    required this.fetchEvent,
    required this.states,
    required this.transformer,
  }) : assert(dataName != null || transformer == null);

  final String? dataName;
  final RepositoryFetchableSource source;
  final ValueResolver sourceFetchValueResolver;
  final FreezedTypeMetaData fetchEvent;
  final FreezedMetaData states;
  final Transformer? transformer;

  @override
  Method get method {
    final body = <Code>[
      /// Check if state is already loading
      Code('if (state is ${states['loading'].symbol}) return;'),
      refer('emit').call([
        states['loading'].invoke(values: resolveValuesFromState),
      ]).statement,

      /// Try get data
      const Code('try {'),

      /// Fetch
      _callSource(),

      /// Emit success
      if (dataName != null && transformer != null) ...[
        _callTransformer(),
        _emitStateFromTransformerRes()
      ] else
        _emitStateFromSourceData(states),

      /// Catch
      const Code('} catch(e) {'),

      /// Emit error
      refer('emit').call([
        states['error'].invoke(values: resolveValuesFromState),
      ]).statement,
      const Code('}'),
    ];

    final handler = eventHandler(fetchEvent)
      ..body = Block.of(body)
      ..modifier = source.fetch.modifier;
    return handler.build();
  }

  Code _callSource() {
    final call = source.callFetch(values: sourceFetchValueResolver);
    final expression =
        source.fetch.modifier == MethodModifier.async ? call.awaited : call;
    if (dataName == null) return expression.statement;
    return expression.assignFinal(dataName!).statement;
  }

  Code _callTransformer() {
    return transformer!.entrypoint
        .call(values: DelegateValueResolver((_) => refer(dataName!)))
        .assignFinal('success')
        .statement;
  }

  Code _emitStateFromSourceData(FreezedMetaData states) {
    final resolver = DelegateValueResolver((name) {
      if (name == dataName) return refer(name);
      return resolveValuesFromState.resolve(name);
    });
    return refer('emit').call([
      states['success'].invoke(values: resolver),
    ]).statement;
  }

  Code _emitStateFromTransformerRes() {
    return refer('emit').call([
      refer('success'),
    ]).statement;
  }
}

Method _stateDataAccessor(Field data) => Method(
      (m) => m
        ..name = data.name
        ..returns = data.toNullable().type
        ..type = MethodType.getter
        ..lambda = true
        ..body = refer('mapOrNull').call([
          refer('loading: (s) => s.${data.name}'),
          refer('success: (s) => s.${data.name}'),
          refer('error: (s) => s.${data.name}'),
        ], {}, [
          data.toNullable().type!
        ]).code,
    );
