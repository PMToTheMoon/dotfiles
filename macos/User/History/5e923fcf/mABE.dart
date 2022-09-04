import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal_core/build_system/build_system.dart';

final Step<BuildStep> parseConfig =
    Step.define('parse_config').build(() => BuildStep());
