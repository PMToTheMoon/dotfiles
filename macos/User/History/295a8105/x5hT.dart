import 'package:args/command_runner.dart';
import 'commands/commands.dart';

void main(List<String> args) {
  final r = CommandRunner("bonemeal", "Grows seeds.")
    ..addCommand(BuildCommand())
    ..addCommand(ExportCommand())
    ..run(args);
}
