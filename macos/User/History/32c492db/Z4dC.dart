import 'package:args/command_runner.dart';

abstract class BonemealCommandRunner extends CommandRunner<void> {
  BonemealCommandRunner({
    super.usageLineLength,
    super.suggestionDistanceLimit,
  }) : super(
          "bonemeal",
          "grows seeds",
        );
}
