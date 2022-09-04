import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

export 'package:model_generators/model_generators.dart';

part 'bloc_meta_data.dart';

abstract class Bloc //<MetaData extends BlocMetaData>
    extends MetaObject {
  Bloc({
    required this.subject,
    required Set<Field>? parameters,
    required this.states,
    required this.events,
    required this.methods,
    required this.initialState,
    this.eventsHooks = const [],
    this.statesHooks = const [],
  }) : fields = Fields(parameters ?? {});

  final String subject;
  final Fields fields;

  final List<Method> Function(FreezedMetaData events, FreezedMetaData states)
      methods;

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

  String eventHandlerMethod(String event) => '_on${event.pascalCase}';

  MethodBuilder eventHandler(String event) => MethodBuilder()
    ..name = eventHandlerMethod(event)
    ..requiredParameters.addAll([
      Parameter((p) => p
        ..name = 'event'
        ..type = eventsMeta.types[event]!.reference),
      Parameter((p) => p
        ..name = 'emit'
        ..type = refer('Emitter'))
    ]);

  @override
  void build(BuildStep step) async {
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

    final superInitializer = initialState(statesMeta);

    final handlerRegistrations = eventsMeta.types.entries.map(
      (e) => refer('on').call(
        [refer(eventHandlerMethod(e.key))],
        {},
        [e.value.reference],
      ).statement,
    );

    final blocConstructor = Constructor(
      (c) => c
        ..optionalParameters.addAll(fields.toNamedParameters())
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
        fields.toFinal(),
      )
      ..methods.addAll(blocMethods));

    final blocLibrary = Library((l) => l..body.add(bloc));

    step.emit(blocLibrary);
  }
}
