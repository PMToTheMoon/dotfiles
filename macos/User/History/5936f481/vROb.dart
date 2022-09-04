import 'package:args/command_runner.dart';

class BuildCommand extends Command {
  @override
  final name = "build";

  @override
  final description = "Build IPR in the current directory.";

  @override
  void run() {
    print("hello world");
  }
}
