import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

import 'doctors.dart';

final models = Root('packages/models/lib/src/', [
  doctors,
]);
