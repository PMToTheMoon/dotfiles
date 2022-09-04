import 'package:args/command_runner.dart';

class ExportCommand extends Command {
  @override
  final name = "export";

  @override
  final description = "Build IPR in the current directory.";

  @override
  void run() {
    print("hello world");
  }
}
