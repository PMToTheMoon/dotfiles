import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/bonemeal.dart';

final Step<BuildStep> initial =
    Step.define('parse_config').build(() => BuildStep());
