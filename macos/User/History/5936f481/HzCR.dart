import 'package:args/command_runner.dart';

class ExportCommand extends Command {
  @override
  final name = "export";

  @override
  final description =
      "Build project and export output to the target directory.";

  @override
  void run() {
    print("export");
  }
}
