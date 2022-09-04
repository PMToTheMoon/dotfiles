import 'package:acyclic_steps/acyclic_steps.dart';

import 'package:bonemeal/bonemeal.dart';

final Step<BuildStep> parse_config =
    Step.define('parse_config').build(() => BuildStep());
