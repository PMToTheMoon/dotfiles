import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  try {
    final r = CommandRunner("bonemeal", "Grows seeds.")
      ..addCommand(BuildCommand())
      ..addCommand(ExportCommand())
      ..run(args);
  } catch (e) {
    print(e);
  }
}
