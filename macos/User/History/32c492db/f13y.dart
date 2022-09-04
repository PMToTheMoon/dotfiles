import 'package:args/command_runner.dart';

import 'package:args/command_runner.dart';

abstract class BonemealCommandRunner extends CommandRunner<void> {
  BonemealCommandRunner(super.executableName, this.description,
      {int? usageLineLength, this.suggestionDistanceLimit = 2});
}
