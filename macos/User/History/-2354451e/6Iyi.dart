import 'package:args/command_runner.dart';

class ExportCommand extends Command {
  @override
  final name = 'parse_yaml';

  @override
  final description = 'Parse yaml then dump result in console.';

  @override
  void run() {
    print('export');
  }
}
