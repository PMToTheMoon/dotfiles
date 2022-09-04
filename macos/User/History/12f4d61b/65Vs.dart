// import 'package:logging/logging.dart';
// import 'package:args/command_runner.dart';

// import 'package:bonemeal_runner/src/build_script_generate/bootstrap.dart';

// final _log = Logger('BuildCommand');

// class BuildCommand extends Command {
//   @override
//   final name = 'build';

//   @override
//   final description = 'Build IPR in the current directory.';

//   @override
//   Future<void> run() async {
//     _log.info('start building...');
//     final result = await generateAndRun([]);
//     if (result == 0) {
//       _log.fine('successfully built project.');
//     } else {
//       _log.severe('Error happened during project build.');
//     }
//   }
// }
