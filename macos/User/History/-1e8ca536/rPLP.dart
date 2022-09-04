import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/bonemeal.dart';

final Step<BuildStep> parseConfig =
    Step.define('parse_config').build(() => BuildStep());
