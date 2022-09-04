import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

export 'package:model_generators/model_generators.dart';

part 'bloc_meta_data.dart';

String eventHandlerName(String event) => '_on${event.pascalCase}';

MethodBuilder eventHandler(FreezedTypeMetaData event) => MethodBuilder()
  ..name = eventHandlerName(event.name)
  ..requiredParameters.addAll([
    Parameter((p) => p
      ..name = 'event'
      ..type = event.reference),
    Parameter((p) => p
      ..name = 'emit'
      ..type = refer('Emitter'))
  ]);

class BlocMeta {
  BlocMeta({
    required this.reference,
    required this.$class,
    required this.states,
    required this.events,
  });
  final Reference reference;
  final Class $class;
  final FreezedMetaData states;
  final FreezedMetaData events;
}

class Bloc extends MetaObject<BlocMeta> {
  Bloc({
    required this.subject,
    required Set<Parameter>? parameters,
    required this.states,
    required this.events,
    required this.methods,
    required this.initialState,
    this.eventsHooks = const [],
    this.statesHooks = const [],
  }) : parameters = Parameters(parameters ?? {});

  final String subject;
  final Parameters parameters;

  final Iterable<Method> Function(
      FreezedMetaData events, FreezedMetaData states) methods;

  InvokeExpression Function(FreezedMetaData events, FreezedMetaData states)
      initialState;

  final Map<String, Set<Field>> states;
  List<Method> statesHooks;

  final Map<String, Set<Field>> events;
  List<Method> eventsHooks;

  @override
  String get path => 'bloc/${subject.snakeCase}_bloc.dart';

  String get blocClassName => '${subject.pascalCase}Bloc';
  String get stateClassName => '${subject.pascalCase}State';
  String get eventClassName => '${subject.pascalCase}Event';

  @override
  BlocMeta build(BuildStep step) {
    final statesModel = Freezed(
      className: stateClassName,
      typePrefix: subject,
      types: states,
      hooks: statesHooks,
    );
    final statesMeta = step.buildPart(statesModel);

    final eventModel = Freezed(
      className: eventClassName,
      typePrefix: subject,
      types: events,
      hooks: eventsHooks,
    );
    final eventsMeta = step.buildPart(eventModel);

    final superInitializer = initialState(eventsMeta, statesMeta);

    final handlerRegistrations = eventsMeta.types.entries.map(
      (e) => refer('on').call(
        [refer(eventHandlerName(e.key))],
        {},
        [e.value.reference],
      ).statement,
    );

    final blocConstructor = Constructor(
      (c) => c
        ..requiredParameters.addAll(parameters.allRequired)
        ..optionalParameters.addAll(parameters.allOptional)
        ..initializers.add(refer('super').call([superInitializer]).code)
        ..body = Block.of(handlerRegistrations),
    );

    final blocMethods = methods(eventsMeta, statesMeta);

    final bloc = Class(($) => $
      ..extend = TypeReference((t) => t
        ..symbol = 'Bloc'
        ..types.addAll([
          eventsMeta.reference,
          statesMeta.reference,
        ])
        ..url = 'package:bloc/bloc.dart')
      ..name = blocClassName
      ..constructors.add(blocConstructor)
      ..fields.addAll(
        parameters.toFields(),
      )
      ..methods.addAll(blocMethods));

    final blocLibrary = Library((l) => l..body.add(bloc));

    final url = step.emit(blocLibrary);
    return BlocMeta(
      reference: refer(bloc.name, url),
      $class: bloc,
    );
  }
}
