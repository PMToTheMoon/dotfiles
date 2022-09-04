import 'package:args/command_runner.dart';

// TODO: clean context or targets

class ExportCommand extends Command {
  @override
  final name = "clean";

  @override
  final description = "Clean generated code";

  @override
  void run() {
    print("cleaning");
  }
}
