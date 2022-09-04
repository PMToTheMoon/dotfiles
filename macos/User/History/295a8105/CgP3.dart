import 'package:args/command_runner.dart';
import 'commands/commands.dart';

Future main(List<String> args) async {
  try {
    CommandRunner("bonemeal", "Grows seeds.")
      ..addCommand(BuildCommand())
      ..addCommand(ExportCommand())
      ..run(args);
  } catch (e) {
    print(e);
  }
}
