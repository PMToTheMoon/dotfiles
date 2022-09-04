import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';

import 'api_models/api_models.dart';
import 'models/models.dart';
import 'record/general/initial_observation_form.dart';
import 'common/observation_card_data.dart';
import 'record/hub/new_observation_form.dart';

Future<void> main() async {
  await buildAll([
    generalInitialObservationForm,
    newObservationForm,
    observationCardDataPart,
    models,
    apiModels,
  ]);
}
