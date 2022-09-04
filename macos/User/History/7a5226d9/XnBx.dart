part of 'bloc.dart';

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

class BlocInput {
  BlocInput({
    required this.subject,
    required Fields parameters,
    required this.states,
    required this.events,
  }) : parameters = parameters.toFullyNamed();
  final String subject;
  final Fields parameters;
  final Set<UnionType> states;
  final Set<BlocEvent> events;

  String get blocClassName => '${subject.pascalCase}Bloc';
  String get stateClassName => '${subject.pascalCase}State';
  String get eventClassName => '${subject.pascalCase}Event';

  String get blocFileName => '${subject.snakeCase}_bloc.dart';
  String get stateFileName => '${subject.snakeCase}_state.dart';
  String get eventFileName => '${subject.snakeCase}_event.dart';

  String get freezedFileName => '${subject.snakeCase}_bloc.freezed.dart';
  String get jsonSerializableFileName => '${subject.snakeCase}_bloc.g.dart';

  Map<String, dynamic> toParams() => {
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
