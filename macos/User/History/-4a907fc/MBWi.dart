import 'dart:async';
import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

part 'bloc_meta_data.dart';
part 'bloc_template.dart';

class BlocEvent extends UnionType {
  const BlocEvent(
    String name, {
    String? handler,
    Fields fields = Fields.empty,
  })  : _handler = handler,
        super(name, fields);

  final String? _handler;

  String get handler => _handler ?? '_on${name.pascalCase}';
}

abstract class Bloc<MetaData extends BlocMetaData>
    extends MetaObject<MetaData> {
  Bloc({
    required this.subject,
    required this.parameters,
    required this.states,
    required this.events,
    super.root,
    this.stateGeneratorFactory = Union.new,
    this.eventGeneratorFactory = Union.new,
  });

  final String subject;
  final Fields parameters;
  final Set<UnionType> states;
  final Set<BlocEvent> events;

  final UnionFactory stateGeneratorFactory;
  final UnionFactory eventGeneratorFactory;

  String get blocClassName => '${subject.pascalCase}Bloc';
  String get stateClassName => '${subject.pascalCase}State';
  String get eventClassName => '${subject.pascalCase}Event';

  String get blocFileName => '${subject.snakeCase}_bloc.dart';
  String get stateFileName => '${subject.snakeCase}_state.dart';
  String get eventFileName => '${subject.snakeCase}_event.dart';

  String get freezedFileName => '${subject.snakeCase}_bloc.freezed.dart';
  String get jsonSerializableFileName => '${subject.snakeCase}_bloc.g.dart';

  Map<String, dynamic> toParams() {
    return {
      'class': blocClassName,
      'file': blocFileName,
      'freezed_file': freezedFileName,
      'parameters': parameters.toFunctionParametersDeclaration(),
      'members': parameters.toMemberDeclarations(),
      'json_serializable_file': jsonSerializableFileName,
      'state': {
        'class': stateClassName,
        'file': stateFileName,
      },
      'event': {
        'class': eventClassName,
        'file': eventFileName,
      }
    };
  }

  @override
  Future<MetaData> build(BuildStep context) async {
    final statesMetaData = await context.build(
      stateGeneratorFactory(
        className: stateClassName,
        radical: subject,
        types: states,
        partOf: PartOf.from(AssetId.output(blocFileName)),
      ),
    );

    final eventsMetaData = await context.build(
      eventGeneratorFactory(
        className: eventClassName,
        radical: subject,
        types: events,
        partOf: PartOf.from(AssetId.output(blocFileName)),
      ),
    );

    final metaData = BlocMetaData(
      parameters: parameters,
      states: statesMetaData,
      events: eventsMetaData,
    );

    final handlersRegistrations = events.map((blocEvent) {
      final metaData = eventsMetaData.types[blocEvent.name]!;
      return {
        'class': metaData.className,
        'handler': blocEvent.handler,
      };
    });

    final handlersDefinitions = await renderHandlers(
      context,
      metaData,
    );

    final initialState = await initialState(context, metaData);

    final blocFileContent = renderDartTemplate(
      blocTemplate,
      context.uri,
      {
        'bloc': toParams(),
        'initial_state': initialState,
        'handlers': {
          'registrations': handlersRegistrations,
          'definitions': handlersDefinitions,
        },
      },
    );

    final blocConstructor = Constructor(
      (c) => c
        ..optionalParameters.addAll(parameters.toNamedParameters())
        ..initializers.add(refer('super').call([]).code),
    );

    final bloc = Class(($) => $
      ..name = blocClassName
      ..constructors.add(blocConstructor)
      ..fields.addAll(
        parameters.toFinal(),
      ));

    final deps = headers(context, metaData);

    await context.writeOutput(
      blocFileName,
      blocFileContent,
      deps,
    );

    return await buildMetaData(context, metaData);
  }

  Dependencies headers(
    BuildStep context,
    BlocMetaData metaData,
  );

  FutureOr<Code> initialState(
    BuildStep context,
    BlocMetaData metaData,
  );

  FutureOr<String> renderHandlers(
    BuildStep context,
    BlocMetaData metaData,
  );

  FutureOr<MetaData> buildMetaData(
    BuildStep context,
    BlocMetaData metaData,
  );
}
