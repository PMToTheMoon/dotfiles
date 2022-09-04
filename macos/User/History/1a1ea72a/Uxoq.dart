import 'package:args/command_runner.dart';

class ExportCommand extends Command {
  @override
  final name = "clean";

  @override
  final description =
      "Build project and export output to the target directory.";

  @override
  void run() {
    print("export");
  }
}
