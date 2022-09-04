import 'package:args/command_runner.dart';

final _log = Logger('BuildCommand');

class CleanCommand extends Command {
  @override
  final name = 'clean';

  @override
  final description = 'Clean project';

  @override
  Future<void> run() async {}
}
