import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args).catchError((error) {
      if (error is! UsageException) throw error;
      print(error);
      exit(64);
    });
}
