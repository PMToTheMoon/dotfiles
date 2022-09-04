import 'package:bloc_generators/bloc_generators.dart';
import 'package:bloc_generators/src/bloc/bloc.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:collection/collection.dart';

class Source {
  Source.fromRepositoryFutureSource(RepositorySource source)
      : owner = source.repository,
        method = source.method;

  Source(this.owner, this.method);

  final Reference owner;
  final Method method;

  Field toField() => field(owner.symbol!.camelCase, owner);
  Expression call({ValueResolver? values}) => method.call(
        owner: owner.symbol?.camelCase,
        values: values,
      );
}

class SimpleFetchBloc extends Seed<void> {
  factory SimpleFetchBloc({
    required String subject,
    required Source source,
    Set<Field> fields = const {},
    Transformer? transformer,
    String? dataName,
    ValueResolver? initialStateValues,
    ValueResolver? sourceValues,
  }) {
    final blocFields = Fields(fields);
    dataName = dataName ?? subject.camelCase;

    final fetchType = source.method.returns;
    if (fetchType == null) {
      throw "Using a source with null return type isn't allowed";
    }
    Reference dataType = fetchType;
    if (transformer != null) {
      final transformerReturnType = transformer.entrypoint.returns;
      if (transformerReturnType != null) {
        dataType = transformerReturnType;
      }
    }
    return SimpleFetchBloc._(
      subject: subject,
      source: source,
      dataType: dataType,
      dataName: dataName,
      transformer: transformer,
      initialStateValues: initialStateValues ?? const SelfReferResolver(),
      sourceValues: sourceValues ?? _DefaultSourceValueResolver(blocFields),
      fields: blocFields,
    );
  }

  SimpleFetchBloc._({
    required this.subject,
    required this.source,
    required this.dataType,
    required this.dataName,
    this.transformer,
    required this.initialStateValues,
    required this.sourceValues,
    this.fields = Fields.empty,
  }) : super();

  final String subject;
  final Source source;
  final Reference dataType;
  final String dataName;
  final Transformer? transformer;
  final Fields fields;
  final ValueResolver initialStateValues;
  final ValueResolver sourceValues;

  @override
  grow(BuildContext context) {
    return Bloc(
      fields: Fields({
        source.toField(),
        ...fields,
        // ...source.method.toFields().toNullable(),
      }),
      subject: subject,
      statesHooks: [_stateDataAccessor],
      events: _events,
      states: _states,
      initialState: _initialState,
      methods: _methods,
    );
  }

  Map<String, Set<Field>> get _events {
    final sourceVariableParameterHandlers = [];

    for (final param in _sourceVariableParameters()) {
      sourceVariableParameterHandlers.add(
        MapEntry(
          _sourceParamEvent(param.name),
          {param.toField()},
        ),
      );
    }
    return Map.fromEntries([
      const MapEntry('fetchRequested', {}),
      ...sourceVariableParameterHandlers,
    ]);
  }

  Map<String, Set<Field>> get _states {
    final fieldsFromSourceVarParams = _sourceVariableParameters().toFields();
    return {
      'initial': fieldsFromSourceVarParams,
      'loading': {
        dataType.toNullable().toField(dataName),
        ...fieldsFromSourceVarParams,
      },
      'success': {
        dataType.toField(dataName),
        ...fieldsFromSourceVarParams,
      },
      'error': {
        dataType.toNullable().toField(dataName),
        ...fieldsFromSourceVarParams,
      },
    };
  }

  InvokeExpression _initialState(
    FreezedMetaData events,
    FreezedMetaData states,
  ) {
    return states.types['initial']!.$class.invoke(
      values: initialStateValues,
    );
  }

  List<Method> _methods(
    FreezedMetaData events,
    FreezedMetaData states,
  ) {
    final fetch = _FetchMethod(
      dataName: dataName,
      sourceValues: sourceValues,
      source: source,
      events: events,
      states: states,
      transformer: transformer,
    );

    return [
      fetch.method,
      ..._fetchCriteriaEventHandlers(events),
      if (transformer != null) transformer!.entrypoint,
      ...?transformer?.utils,
    ];
  }

  Method get _stateDataAccessor => Method(
        (m) => m
          ..name = dataName
          ..returns = dataType.toNullable().type
          ..type = MethodType.getter
          ..lambda = true
          ..body = refer('mapOrNull').call([
            refer('loading: (s) => s.$dataName'),
            refer('success: (s) => s.$dataName'),
            refer('error: (s) => s.$dataName'),
          ], {}, [
            dataType.toNullable().type
          ]).code,
      );

  Reference get referDataFromState => refer('state.$dataName');

  Iterable<Method> _fetchCriteriaEventHandlers(FreezedMetaData events) {
    final List<Method> handlers = [];
    for (final param in _sourceVariableParameters()) {
      final name = param.name;
      final eventName = _sourceParamEvent(param.name);
      final e = events[eventName];

      final body = <Code>[
        Code('emit(state.copyWith($name: event.$name));'),
        refer('add').call([events['fetchRequested'].invoke()]).statement,
      ];

      handlers.add(Method(
        (m) => m
          ..name = _sourceParamEventHandler(param.name)
          ..requiredParameters.addAll([
            Parameter((p) => p
              ..name = 'event'
              ..type = e.reference),
            Parameter((p) => p
              ..name = 'emit'
              ..type = refer('Emitter'))
          ])
          ..body = Block.of(body),
      ));
    }
    return handlers;
  }

  Parameters _sourceVariableParameters() => Parameters({
        ...source.method.allParameters.whereNot(
          (p) => fields.any((f) => f.name == p.name),
        )
      });
}

const resolveValuesFromState = PrefixValueResolver('state');

String _sourceParamEventHandler(String name) => '_on${name.pascalCase}Changed';
String _sourceParamEvent(String name) => '${name}Changed';

class _FetchMethod extends Hook {
  _FetchMethod({
    required this.dataName,
    required this.sourceValues,
    required this.source,
    required this.events,
    required this.states,
    required this.transformer,
  });

  final String dataName;
  final Source source;
  final ValueResolver sourceValues;
  final FreezedMetaData events;
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
      if (transformer != null) ...[
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

    final handler = eventHandler(events['fetchRequested'])
      ..body = Block.of(body)
      ..modifier = source.method.modifier;
    return handler.build();
  }

  Code _callSource() {
    final call = source.call(values: sourceValues);
    final expression =
        source.method.modifier == MethodModifier.async ? call.awaited : call;
    return expression.assignFinal(dataName).statement;
  }

  Code _callTransformer() {
    return transformer!.entrypoint
        .call(values: DelegateValueResolver((_) => refer(dataName)))
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

class _DefaultSourceValueResolver extends ValueResolver {
  _DefaultSourceValueResolver(this.blocFields);

  final Fields blocFields;

  @override
  Expression resolve(String entry) {
    final field = blocFields.firstWhereOrNull((field) => field.name == entry);
    return refer(field?.name ?? 'state.$entry');
  }
}
