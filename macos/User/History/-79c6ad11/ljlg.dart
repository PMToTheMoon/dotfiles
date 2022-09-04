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
  }) : fields = Fields(parameters ?? {});

  final String subject;
  final Fields fields;
  List<Hook> statesHooks;
  final Map<String, Set<Field>> states;
  final Map<String, Set<Field>> events;

  @override
  String get path => 'bloc/${subject.snakeCase}_bloc.dart';

  String get blocClassName => '${subject.pascalCase}Bloc';
  String get stateClassName => '${subject.pascalCase}State';
  String get eventClassName => '${subject.pascalCase}Event';

  late final FreezedMetaData statesMeta;
  late final FreezedMetaData eventsMeta;

  FreezedTypeMetaData event(String event) => eventsMeta[event];
  FreezedTypeMetaData state(String state) => statesMeta[state];

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
    );
    statesMeta = step.buildPart(statesModel);
    final superInitializer = initialState(statesMeta);

    final eventModel = Freezed(
      className: eventClassName,
      typePrefix: subject,
      types: events,
    );
    eventsMeta = step.buildPart(eventModel);

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

    final blocMethods = methods(step);

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

  InvokeExpression initialState(FreezedMetaData states);

  Iterable<Method> methods(
    BuildStep context,
  );
}
