import 'package:args/command_runner.dart';

abstract class BonemealCommandRunner extends CommandRunner<void> {
  BonemealCommandRunner({
    super.usageLineLength,
    super.suggestionDistanceLimit,
  }) : super(
          "bonemeal",
          "grows seeds",
        );

  @override
  ArgResults parse(Iterable<String> args) {
    try {
      // This is where the CommandRunner would call argParser.parse(args). We
      // override this function so we can call tryArgsCompletion instead, so the
      // completion package can interrogate the argParser, and as part of that,
      // it calls argParser.parse(args) itself and returns the result.
      return tryArgsCompletion(args.toList(), argParser);
    } on ArgParserException catch (error) {
      if (error.commands.isEmpty) {
        usageException(error.message);
      }

      Command<void>? command = commands[error.commands.first];
      for (final String commandName in error.commands.skip(1)) {
        command = command?.subcommands[commandName];
      }

      command!.usageException(error.message);
    }
  }
}
